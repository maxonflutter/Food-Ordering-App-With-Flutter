import 'package:firedart/firedart.dart';
import 'package:grpc/grpc.dart';

import '../common/db_client.dart';
import '../common/db_record.dart';

class GrpcFirestoreDbClient implements DbClient {
  final Firestore _firestore;

  const GrpcFirestoreDbClient({required Firestore firestore})
      : _firestore = firestore;

  // TODO: Set up max retries
  // static const _maxRetries = 2;

  /// Returns an already initialized instance of the client.
  factory GrpcFirestoreDbClient.initialize(
    String projectId, {
    bool useEmulator = false,
  }) {
    try {
      Firestore.initialize(projectId, useApplicationDefaultAuth: true);
    } on Exception catch (err) {
      if (err.toString() ==
          'Exception: Firestore instance was already initialized') {
      } else {
        rethrow;
      }
    }

    return GrpcFirestoreDbClient(firestore: Firestore.instance);
  }

  @override
  Future<String> add({
    required String entity,
    required Map<String, dynamic> data,
  }) async {
    try {
      final collection = _firestore.collection(entity);
      final docRef = await collection.add(data);
      return docRef.id;
    } on GrpcError catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteOneById({
    required String entity,
    required String id,
  }) async {
    try {
      final collection = _firestore.collection(entity);
      final docRef = collection.document(id);
      await docRef.delete();
    } on GrpcError catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<DbRecord>> fetchAll({required String entity}) async {
    try {
      final collection = _firestore.collection(entity);
      final results = await collection.get();
      if (results.isNotEmpty) {
        return results.map((document) {
          return DbRecord(id: document.id, data: document.map);
        }).toList();
      }

      return [];
    } on GrpcError catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<DbRecord>> fetchAllFromBundle<T>({
    required String entity,
    required String bundleUrl,
  }) {
    return fetchAll(entity: entity);
  }

  @override
  Future<DbRecord?> fetchOneById({
    required String entity,
    required String id,
  }) async {
    try {
      final collection = _firestore.collection(entity);
      final docRef = collection.document(id);

      final exists = await docRef.exists;
      if (!exists) {
        return null;
      }

      final document = await docRef.get();

      return DbRecord(
        id: document.id,
        data: document.map,
      );
    } on GrpcError catch (_) {
      rethrow;
    }
  }

  @override
  Future<DbRecord?> fetchOneByIdFromBundle<T>({
    required String entity,
    required String id,
    required String bundleUrl,
  }) {
    return fetchOneById(entity: entity, id: id);
  }

  @override
  Future<void> set({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final collection = _firestore.collection(entity);
      final docRef = collection.document(id);
      await docRef.set(data);
    } on GrpcError catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> update({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final collection = _firestore.collection(entity);
      final docRef = collection.document(id);
      await docRef.update(data);
    } on GrpcError catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<DbRecord>> fetchAllBy({
    required String entity,
    required Map<String, dynamic> filters,
  }) async {
    try {
      QueryReference? query;
      final collection = _firestore.collection(entity);
      query = _applyFilters(collection, filters);

      if (query == null) {
        return [];
      }

      return query.get().then((docs) {
        return docs
            .map((document) => DbRecord(id: document.id, data: document.map))
            .toList();
      });
    } on GrpcError catch (_) {
      rethrow;
    }
  }

  @override
  Stream<List<DbRecord>> streamAll({required String entity}) {
    // TODO: implement streamAll
    throw UnimplementedError();
  }

  @override
  Stream<List<DbRecord>> streamAllBy(
      {required String entity, required Map<String, dynamic> filters}) {
    // TODO: implement streamAllBy
    throw UnimplementedError();
  }

  @override
  Stream<DbRecord?> streamOneById(
      {required String entity, required String id}) {
    // TODO: implement streamOneById
    throw UnimplementedError();
  }

  QueryReference? _applyFilters(
    CollectionReference collection,
    Map<String, dynamic> filters,
  ) {
    QueryReference? results;

    filters.forEach(
      (key, value) {
        if (value is List<Map>) {
          for (var filter in value) {
            final queryType = filter['type'];
            final queryValue = filter['value'];

            switch (queryType) {
              case 'arrayContains':
                results = collection.where(key, arrayContains: queryValue);
              case 'isEqualTo':
                results = collection.where(key, isEqualTo: queryValue);
              default:
                results = collection.where(key, isNull: false);
            }
          }
        }
      },
    );

    return results;
  }
}
