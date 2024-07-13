//################################# INCLUDE #################################
import 'package:sqlite1/engines/dbconnect.dart';

//################################# DECLARATION #################################

//################################# FUNCTION #################################
Future<dynamic> getEmployees() async {
  dynamic result;
  try {
    const sql = '''
      SELECT * FROM employees;
    ''';
    result = await db?.rawQuery(sql, []);
  } catch (e) {
    return e.toString();
  }
  return result;
}

Future<dynamic> updateEmployee(
    int id, String firstName, String lastName) async {
  dynamic result;
  try {
    const sql = '''
      UPDATE employees
        SET FirstName = ?
          , LastName = ?
        WHERE EmployeeId = ?;
    ''';
    result = await db?.rawUpdate(sql, [firstName, lastName, id]);
  } catch (e) {
    return e.toString();
  }
  return result;
}

Future<dynamic> deleteEmployee(int id) async {
  dynamic result;
  try {
    const sql = '''
      DELETE FROM employees
        WHERE EmployeeId = ?;
    ''';
    result = await db?.rawDelete(sql, [id]);
  } catch (e) {
    return e.toString();
  }
  return result;
}
