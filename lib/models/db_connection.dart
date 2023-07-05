import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:page_transition/page_transition.dart';

import 'package:food_app/models/model_class.dart';
import 'package:food_app/widgets/dashboard_screens/main_menu.dart';
import 'package:food_app/models/custom_snack_bar.dart';
import 'package:food_app/widgets/forget_password_screens/otp_verification.dart';

class DbConnection {
  DbConnection({required this.showSnackBar});
  final void Function() showSnackBar;

  static Future alterPassword() async {
    var conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '192.168.0.113',
        port: 3306,
        user: 'root',
        password: '123',
        db: 'logindbms',
      ),
    );

    await conn.query(
      'update users set password = ? where email = ?',
      [password, email],
    );
  }

  static Future checkEmail(BuildContext context) async {
    var conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '192.168.0.113',
        port: 3306,
        user: 'root',
        password: '123',
        db: 'logindbms',
      ),
    );

    var results = await conn.query(
      'select email from users',
    );

    for (var row in results) {
      if (row[0] == email) {
        emailRegistered = true;
      }
    }

    if (emailRegistered == true) {
      // ignore: use_build_context_synchronously
      Model.sendOTP(context);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageTransition(
          child: const OTPVerification(),
          type: PageTransitionType.fade,
          duration: Duration.zero,
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.snackBar10,
      );
    }
  }

  static Future checkName() async {
    var conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '192.168.0.113',
        port: 3306,
        user: 'root',
        password: '123',
        db: 'logindbms',
      ),
    );

    var results = await conn.query(
      'select `name` from users where email = ?',
      [email],
    );

    for (var row in results) {
      name = row[0] as String;
    }
  }

  Future register(
    String name,
    String email,
    String password,
  ) async {
    var conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '192.168.0.113',
        port: 3306,
        user: 'root',
        password: '123',
        db: 'logindbms',
      ),
    );

    var results = await conn.query('select email, `password` from users');

    if (results.isEmpty) {
      exist = false;
    }

    for (var row in results) {
      if (row[0] == email || row[1] == password) {
        exist = true;
        break;
      } else {
        exist = false;
      }
    }

    if (exist == false) {
      conn.query('insert into users (name, email, password) values (?, ?, ?)',
          [name, email, password]);
    }
    showSnackBar();
  }

  Future login(
    String email,
    String password,
    BuildContext context,
  ) async {
    var conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '192.168.0.113',
        port: 3306,
        user: 'root',
        password: '123',
        db: 'logindbms',
      ),
    );

    var results = await conn.query('select email, `password` from users');

    if (results.isEmpty) {
      exist = false;
    }

    for (var row in results) {
      if (row[0] == email && row[1] == password) {
        exist = true;
        break;
      } else {
        exist = false;
      }
    }

    if (exist == true) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainMenu(),
        ),
        (route) => false,
      );
    }
    showSnackBar();
  }
}
