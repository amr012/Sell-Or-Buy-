import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/models/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseServices {
  DataBaseServices._();

  static final DataBaseServices db = DataBaseServices._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDb();
      return _database;
    }
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartProduct.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE ${K.tableCartProduct} (
      ${K.columnName} TEXT NOT NULL,
      ${K.columnImage} TEXT NOT NULL,
      ${K.columnPrice} TEXT NOT NULL,
      ${K.columnQuantity} INTEGER NOT NULL)
      ''');
    });
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(K.tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(K.tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((e) => CartProductModel.fromJson(e)).toList()
        : [];
    return list;
  }
  
  deleteProduct(String name) async {
    var dbClient = await database;
    await dbClient.delete(K.tableCartProduct,where:"${K.columnName} = ?" ,whereArgs:[name]  );
  }
}
