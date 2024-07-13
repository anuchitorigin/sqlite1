/**
 *  Program:      DB Connection
 *  Description:  Connection functions for DB access
 *  Version:      1.0.0
 *  Updated:      2 Jul 2024
 *  Programmer:   Mr. Anuchit Butkhunthong
 *  E-mail:       anuchit.b@origin55.com
 *  Update Information:
 *    * Version  1.0.0 (2 Jul 2024)
 *      - Prepare for V1
 */

//################################# INCLUDE #################################
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//################################# DECLARATION #################################
const String dbfilename = 'chinook.db';

Database? db;

//################################# FUNCTION #################################
Future<String> dbConnect() async {
  var databasesPath = await getDatabasesPath();
  var dbfile = join(databasesPath, dbfilename);
  // Check if the database exists
  var exists = await databaseExists(dbfile);
  if (!exists) {
    // Make sure the parent directory exists
    try {
      await Directory(dirname(dbfile)).create(recursive: true);
    } catch (_) {}
    // Copy from asset
    try {
      // Load database from asset and store it in the documents directory
      ByteData data = await rootBundle.load(url.join('assets', dbfilename));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await File(dbfile).writeAsBytes(bytes, flush: true);
    } catch (e) {
      return e.toString();
    }
  }
  // Open the database
  try {
    // function 'openDatabase' will create new database file if not exists
    db = await openDatabase(dbfilename);
    // db = await openDatabase('chinook.db', version: 1,
    //     onCreate: (Database db, int version) async {
    //   // When creating the db, create the table
    //   await db.execute(
    //       'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    // });
  } catch (e) {
    return e.toString();
  }
  return '';
}
