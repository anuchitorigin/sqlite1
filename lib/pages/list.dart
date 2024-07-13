import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sqlite1/engines/dbconnect.dart';
import 'package:sqlite1/engines/dbfunc.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int dbConnected = 0; // 0: not connected, 1: connected, 2: connection error
  String err = '';
  List employees = [];

  void checkDB() async {
    err = await dbConnect();
    if (err != '') {
      setState(() {
        dbConnected = 2;
      });
      return;
    }
    getData();
    setState(() {
      dbConnected = 1;
    });
  }

  void getData() async {
    var result = await getEmployees();
    if (result is String) {
      setState(() {
        err = result;
        dbConnected = 2;
      });
      return;
    }
    setState(() {
      employees = result;
    });
  }

  @override
  void initState() {
    super.initState();
    checkDB();
  }

  Widget displayWidget() {
    switch (dbConnected) {
      case 1:
        return employees.isNotEmpty
            ? employeeList()
            : const Text('No data found');
      case 2:
        return Text(err);
      default:
        return const SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        );
    }
  }

  Widget employeeList() {
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(
                  "${employees[index]['EmployeeId']} - ${employees[index]['FirstName']} ${employees[index]['LastName']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
                trailing: GestureDetector(
                  child: const Icon(
                    Icons.delete_forever_sharp,
                    color: Colors.red,
                  ),
                  onTap: () async {
                    var id =
                        await deleteEmployee(employees[index]['EmployeeId']);
                    if (id != 0) {
                      var result = await getEmployees();
                      setState(() {
                        employees = result;
                      });
                    }
                  },
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/item', arguments: {
                    'employee': employees[index],
                  });
                }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)?.settings.arguments;
    if (employees.isEmpty && data != null) {
      employees = data['employees'];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Demo - List'),
      ),
      body: Center(
        child: displayWidget(),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
