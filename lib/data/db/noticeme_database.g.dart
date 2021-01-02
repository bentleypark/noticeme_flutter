// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noticeme_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorNoticemeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NoticemeDatabaseBuilder databaseBuilder(String name) =>
      _$NoticemeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NoticemeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$NoticemeDatabaseBuilder(null);
}

class _$NoticemeDatabaseBuilder {
  _$NoticemeDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$NoticemeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$NoticemeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<NoticemeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$NoticemeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$NoticemeDatabase extends NoticemeDatabase {
  _$NoticemeDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ConsumableDao _consumableDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `consumables` (`title` TEXT, `image` TEXT, `category` TEXT, `duration` INTEGER, PRIMARY KEY (`title`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ConsumableDao get consumableDao {
    return _consumableDaoInstance ??= _$ConsumableDao(database, changeListener);
  }
}

class _$ConsumableDao extends ConsumableDao {
  _$ConsumableDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _consumableEntityInsertionAdapter = InsertionAdapter(
            database,
            'consumables',
            (ConsumableEntity item) => <String, dynamic>{
                  'title': item.title,
                  'image': item.image,
                  'category': item.category,
                  'duration': item.duration
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ConsumableEntity> _consumableEntityInsertionAdapter;

  @override
  Future<List<ConsumableEntity>> getAllConsumable() async {
    return _queryAdapter.queryList('SELECT * FROM consumables',
        mapper: (Map<String, dynamic> row) => ConsumableEntity(
            row['title'] as String,
            row['image'] as String,
            row['category'] as String,
            row['duration'] as int));
  }

  @override
  Future<void> insertConsumable(ConsumableEntity consumableEntity) async {
    await _consumableEntityInsertionAdapter.insert(
        consumableEntity, OnConflictStrategy.abort);
  }
}
