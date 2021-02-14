import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart' show GetxController;

import '../injector.dart';
import '../model/model.dart';
import '../service/service.dart';

part 'home.dart';

abstract class Controller {
  void init();
  void dispose();
} 