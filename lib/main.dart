import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:food_app/widgets/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(
    const Home(),
  );
}
