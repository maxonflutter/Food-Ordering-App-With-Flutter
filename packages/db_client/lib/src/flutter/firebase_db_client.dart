import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

import '../common/db_client.dart';
import '../common/db_record.dart';

class FirestoreDbClient implements DbClient {
  final FirebaseFirestore _firestore;

  FirestoreDbClient({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<String> add({
    required String entity,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = await _firestore.collection(entity).add(data);
      return docRef.id;
    } catch (err) {
      throw Exception('Error adding document: $err');
    }
  }

  @override
  Future<void> set({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(entity).doc(id).set(data);
    } catch (err) {
      throw Exception('Error setting document: $err');
    }
  }

  @override
  Future<void> update({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = _firestore.collection(entity).doc(id);
      await docRef.update(data);
    } catch (err) {
      throw Exception('Error updating the document: $err');
    }
  }

  @override
  Future<DbRecord?> fetchOneById({
    required String entity,
    required String id,
  }) async {
    try {
      final docRef = _firestore.collection(entity).doc(id);
      final document = await docRef.get();

      if (document.exists) {
        return DbRecord(
          id: document.id,
          data: document.data()!,
        );
      } else {
        return null;
      }
    } catch (err) {
      throw Exception('Error getting document: $err');
    }
  }

  @override
  Future<List<DbRecord>> fetchAll({required String entity}) async {
    try {
      final colRef = _firestore.collection(entity);
      final documents = await colRef.get();
      return documents.docs.map(
        (document) {
          return DbRecord(id: document.id, data: document.data());
        },
      ).toList();
    } catch (err) {
      throw Exception('Error getting document: $err');
    }
  }

  @override
  Stream<List<DbRecord>> streamAll({required String entity}) {
    final colRef = _firestore.collection(entity);
    return colRef.snapshots().map((snapshot) {
      return snapshot.docs.map(
        (document) {
          return DbRecord(id: document.id, data: document.data());
        },
      ).toList();
    });
  }

  @override
  Future<List<DbRecord>> fetchAllBy({
    required String entity,
    required Map<String, dynamic> filters,
  }) async {
    try {
      final colRef = _firestore.collection(entity);
      Query<Map<String, dynamic>> query = colRef;
      query = _applyFilters(query, filters);

      final results = await query.get().then((snapshot) {
        return snapshot.docs.map(
          (document) {
            return DbRecord(id: document.id, data: document.data());
          },
        ).toList();
      });

      return _applyFiltersLocally(results, filters);
    } catch (err) {
      throw Exception('Error getting documents: $err');
    }
  }

  @override
  Stream<List<DbRecord>> streamAllBy({
    required String entity,
    required Map<String, dynamic> filters,
  }) {
    final colRef = _firestore.collection(entity);
    Query<Map<String, dynamic>> query = colRef;
    query = _applyFilters(query, filters);

    return query.snapshots().map((snapshot) {
      final results = snapshot.docs.map(
        (document) {
          return DbRecord(id: document.id, data: document.data());
        },
      ).toList();
      return _applyFiltersLocally(results, filters);
    });
  }

  @override
  Stream<DbRecord?> streamOneById({
    required String entity,
    required String id,
  }) {
    final docRef = _firestore.collection(entity).doc(id);
    return docRef.snapshots().map((snapshot) {
      if (snapshot.exists) {
        return DbRecord(id: snapshot.id, data: snapshot.data()!);
      } else {
        return null;
      }
    });
  }

  @override
  Future<void> deleteOneById({required String entity, required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<DbRecord>> fetchAllFromBundle<T>({
    required String entity,
    required String bundleUrl,
  }) async {
    final response = await http.get(Uri.parse('$bundleUrl/$entity'));
    final buffer = Uint8List.fromList(response.body.codeUnits);
    final task = FirebaseFirestore.instance.loadBundle(buffer);

    task.stream.listen((taskStateProgress) {
      if (taskStateProgress.taskState == LoadBundleTaskState.success) {}
    });

    await task.stream.last;

    final querySnap = await _firestore
        .collection(entity)
        .get(const GetOptions(source: Source.cache));

    return querySnap.docs
        .map((doc) => DbRecord(id: doc.id, data: doc.data()))
        .toList();
  }

  @override
  Future<DbRecord?> fetchOneByIdFromBundle<T>({
    required String entity,
    required String id,
    required String bundleUrl,
  }) async {
    final response = await http.get(Uri.parse('$bundleUrl/$entity'));
    final buffer = Uint8List.fromList(response.body.codeUnits);
    final task = FirebaseFirestore.instance.loadBundle(buffer);

    task.stream.listen((taskStateProgress) {
      if (taskStateProgress.taskState == LoadBundleTaskState.success) {}
    });

    await task.stream.last;

    final docSnap = await _firestore
        .collection(entity)
        .doc(id)
        .get(const GetOptions(source: Source.cache));

    if (!docSnap.exists) {
      return null;
    }

    return DbRecord(id: docSnap.id, data: docSnap.data()!);
  }

  Query<Map<String, dynamic>> _applyFilters(
    Query<Map<String, dynamic>> query,
    Map<String, dynamic> filters,
  ) {
    String inequalityFilterKey = '';
    int inequalityFiltersCount = 0;

    filters.forEach(
      (key, value) {
        if (value is List<Map>) {
          for (var filter in value) {
            final isInequality = filter['isInequality'];
            if (isInequality) {
              // If the filter is an inequality filter, only apply it
              // if it's the first inequality filter in the query
              // The only exception is if the inequality filter is applied
              // to the same field as the previous inequality filter
              if (inequalityFiltersCount >= 1 && inequalityFilterKey != key) {
                log('Not applying inequality filter for $key');
                continue;
              }

              // Keep track of the inequality filter key
              // and increment the inequality filter counter
              inequalityFilterKey = key;
              inequalityFiltersCount++;
              query = _applyInequalityFilter(
                  query, key, filter['type'], filter['value']);
            } else {
              query = _applyEqualityFilter(
                  query, key, filter['type'], filter['value']);
            }
          }
        }
      },
    );

    return query;
  }

  // This is the local version of the _applyFilters method
  // After filtering the query with Firestore, we need to apply
  // the inequality filters locally as some of them might
  // have been skipped by Firestore
  List<DbRecord> _applyFiltersLocally(
    List<DbRecord> query,
    Map<String, dynamic> filters,
  ) {
    var results = query;

    filters.forEach(
      (key, value) {
        if (value is List<Map>) {
          for (var filter in value) {
            switch (filter['type']) {
              case 'isGreaterThan':
                results = query
                    .where((doc) => doc.data[key] > filter['value'])
                    .toList();
              case 'isGreaterThanOrEqualTo':
                results = query
                    .where((doc) => doc.data[key] >= filter['value'])
                    .toList();
              case 'isLessThan':
                results = query
                    .where((doc) => doc.data[key] < filter['value'])
                    .toList();
              case 'isLessThanOrEqualTo':
                results = query
                    .where((doc) => doc.data[key] <= filter['value'])
                    .toList();
              case 'notEqualTo':
                results = query
                    .where((doc) => doc.data[key] != filter['value'])
                    .toList();
              default:
                results = query;
            }
          }
        }
      },
    );

    return results;
  }

  Query<Map<String, dynamic>> _applyEqualityFilter(
    Query<Map<String, dynamic>> query,
    String key,
    String queryType,
    dynamic queryValue,
  ) {
    switch (queryType) {
      case 'arrayContains':
        return query.where(key, arrayContains: queryValue);
      case 'isEqualTo':
        return query.where(key, isEqualTo: queryValue);
      default:
        return query;
    }
  }

  Query<Map<String, dynamic>> _applyInequalityFilter(
    Query<Map<String, dynamic>> query,
    String key,
    String queryType,
    dynamic queryValue,
  ) {
    switch (queryType) {
      case 'isGreaterThan':
        return query.where(key, isGreaterThan: queryValue);
      case 'isGreaterThanOrEqualTo':
        return query.where(key, isGreaterThanOrEqualTo: queryValue);
      case 'isLessThan':
        return query.where(key, isLessThan: queryValue);
      case 'isLessThanOrEqualTo':
        return query.where(key, isLessThanOrEqualTo: queryValue);
      case 'arrayContains':
        return query.where(key, arrayContains: queryValue);
      case 'notEqualTo':
        return query.where(key, isNotEqualTo: queryValue);
      default:
        return query;
    }
  }
}
