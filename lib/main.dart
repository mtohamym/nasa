import 'package:flutter/material.dart';
import 'package:nasa/view/home.dart';

import 'network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(Home());
}
