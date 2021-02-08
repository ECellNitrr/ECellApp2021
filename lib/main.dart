import 'package:ecellapp/screens/esummit/esummit.dart';
import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';
import 'core/utils/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ECellApp());
}

class ECellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ECellApp",
      theme: AppTheme.themeData(context),
      home: ESummit(),
    );
  }
}
