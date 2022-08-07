import 'package:flutter/material.dart';
import 'package:sample_project_with_bloc/app/di.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}

