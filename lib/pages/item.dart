import 'package:flutter/material.dart';
import 'package:sqlite1/engines/dbfunc.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  dynamic employee = {};

  String firstName = '';
  String lastName = '';

  Widget employeeEdit() {
    return Form(
      child: Column(children: <Widget>[
        Text(
          "ID: ${employee['EmployeeId']}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'First Name',
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          initialValue: employee['FirstName'].toString(),
          showCursor: true,
          cursorColor: Colors.white,
          onSaved: (String? value) {
            if (value != null) {
              firstName = value;
            }
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Last Name',
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          initialValue: employee['LastName'].toString(),
          showCursor: true,
          cursorColor: Colors.white,
          onSaved: (String? value) {
            if (value != null) {
              lastName = value;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                var employeeId = employee['EmployeeId'];
                var id = await updateEmployee(employeeId, firstName, lastName);
                print(id);
                if (id != 0) {
                  // show error dialog
                }
                var result = await getEmployees();
                if (!mounted) return;
                // Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/list', arguments: {
                  'employees': result,
                });
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacementNamed(context, '/list');
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ]),
      onChanged: () {
        setState(() {
          Form.of(primaryFocus!.context!).save();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)?.settings.arguments;
    if (data == null) {
      Navigator.pop(context);
    }
    if (employee.isEmpty && data != null) {
      employee = data['employee'];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Demo - Edit'),
      ),
      body: employeeEdit(),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
