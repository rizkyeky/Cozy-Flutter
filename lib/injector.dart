import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';
import 'service/service.dart';

class Injector {
  
  T getController<T extends Controller>(T controller, {String tag}) {
    try {
      return Get.find<T>(tag: tag);
    } catch (e) {
      debugPrint('put $tag');
      return Get.put<T>(controller, tag: tag);
    }
  }

  T getService<T extends Service>({String tag, T controller}) {
    try {
      return Get.find<T>(tag: tag);
    } catch (e) {
      debugPrint('put $tag');
      return Get.put<T>(controller, tag: tag, permanent: true,);
    }
  }

  // void init() {
  //   debugPrint('init');
  //   Get.lazyPut(() => SpaceService(), 
  //     tag: 'spaceService',
  //     fenix: true,
  //   );
  // }

  // @override
  // void dependencies() {
  //   debugPrint('init dependencies');
  //   Get.lazyPut(() => SpaceService(), 
  //     tag: 'spaceService',
  //     fenix: true,
  //   );
  // }
}

Injector injector = Injector();