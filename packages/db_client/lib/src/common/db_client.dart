import 'db_record.dart';

/// A generic DB Client Interface.
abstract class DbClient {
  /// Adds a new record to the specified [entity] with the provided [data].
  /// Returns a unique identifier for the newly added record.
  Future<String> add({
    required String entity,
    required Map<String, dynamic> data,
  });

  /// Sets or replaces the data of a specific record identified by [id]
  /// in the given [entity] with the new [data].
  /// This method overwrites the existing record entirely.
  Future<void> set({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  });

  /// Updates the data of a specific record identified by [id]
  /// in the given [entity] with the provided [data].
  /// This method only updates the fields that are present in the [data] map.
  Future<void> update({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  });

  /// Fetches a single record based by [id] from the specified [entity].
  /// Returns null if the record does not exist.
  Future<DbRecord?> fetchOneById({
    required String entity,
    required String id,
  });

  // Deletes a single record based by [id] from the specified [entity].
  Future<void> deleteOneById({
    required String entity,
    required String id,
  });

  /// Fetches all records from the specified [entity].
  /// Returns a list of [DbRecord], which may be empty if no records are found.
  Future<List<DbRecord>> fetchAll({
    required String entity,
  });

  /// Fetches all records from the [entity] based on the filters in the [filters] map.
  /// Returns a list of [DbRecord], which may be empty if no records are found.
  Future<List<DbRecord>> fetchAllBy({
    required String entity,
    required Map<String, dynamic> filters,
  });

  /// Returns a Stream that emits all records from the [entity] as a list of [DbRecord].
  /// The Stream updates whenever the data in the [entity] changes.
  Stream<List<DbRecord>> streamAll({required String entity});

  /// Returns a Stream that emits all records from the [entity]
  /// based on the filters in the [filters] map.
  /// The Stream updates whenever the matching data in the [entity] changes.
  Stream<List<DbRecord>> streamAllBy({
    required String entity,
    required Map<String, dynamic> filters,
  });

  /// Returns a Stream that emits updates for a single record identified
  /// by [id] in the [entity].
  /// The Stream emits the latest [DbRecord] or null if the record does not exist.
  Stream<DbRecord?> streamOneById({
    required String entity,
    required String id,
  });

  // Fetches all records from the [entity] from the specified [bundleUrl].
  Future<List<DbRecord>> fetchAllFromBundle<T>({
    required String entity,
    required String bundleUrl,
  });

  // Fetches a single record based by [id] from the specified [entity] from
  // the specified [bundleUrl].
  Future<DbRecord?> fetchOneByIdFromBundle<T>({
    required String entity,
    required String id,
    required String bundleUrl,
  });
}
