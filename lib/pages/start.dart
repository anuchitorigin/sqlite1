import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sqlite1/engines/dbconnect.dart';
import 'package:sqlite1/engines/dbfunc.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void checkDB() async {
    var err = await dbConnect();
    if (err != '') {
      return;
    }
    var result = await getEmployees();
    // print(result);
    if (!mounted) return; // Checks `this.mounted`, not `context.mounted`.
    Navigator.pushReplacementNamed(context, '/list', arguments: {
      'employees': result,
    });
  }

  @override
  void initState() {
    super.initState();
    checkDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: SpinKitChasingDots(
        color: Colors.white,
        size: 50.0,
      )),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
