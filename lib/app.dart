import 'package:diu_result/controller_binder.dart';
import 'package:diu_result/utils/theme/theme.dart';
import 'package:diu_result/view/over_all_result_screen/over_all_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OverAllResultScreen(),
      theme: DIUResultAppTheme.theme,
      initialBinding: ControllerBinder(),
    );
  }
}
