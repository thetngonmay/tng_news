import 'package:sqflite/sqflite.dart';
import 'package:thg_news/database/base_model.dart';
import 'package:thg_news/database/db_helper.dart';

typedef FromMap<T> = T Function (Map<String,dynamic>map);
class GenericDao<T extends BaseModel>{
  final String tableName;
  final String uniqueColumn;
  final FromMap<T> fromMap;

  GenericDao({
    required this.tableName,
    required this.uniqueColumn,
    required this.fromMap
  });
  final dbProvider = DBHelper();

  Future<void>insert (T item)async{
    final db= await dbProvider.database;
    await db.insert(tableName,
        item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );

  }
  Future <List<T>> getAll()async{
    final db = await dbProvider.database;
    final map = await db.query(tableName);
    return List.generate(map.length, (i)=> fromMap(map[i]));
  }
  Future<void>delete (String keyValue) async{
    final db = await dbProvider.database;
    await db.delete(tableName,
    where: '$uniqueColumn=?',
    whereArgs: [keyValue]
    );
  }
  Future<void> clearAll()async{
    final db = await dbProvider.database;
    await db.delete(tableName);
  }
  Future<bool> exists(String keyValue)async{
    final db=await dbProvider.database;
    final result= await db.query(tableName,
      where: '$uniqueColumn=?',
      whereArgs: [keyValue]
    );
    return result.isNotEmpty;
  }

}