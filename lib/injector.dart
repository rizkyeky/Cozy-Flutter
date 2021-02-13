import 'package:get/get.dart';

import 'controller/controller.dart';
import 'service/service.dart';

class Injector {
  Future<void> init() async {
    Get.lazyPut(() => SpaceService(), 
      tag: 'spaceService',
      fenix: true,
    );
  }

  T setController<T extends Controller>(T controller) => Get.put<T>(controller);
  T getController<T extends Controller>({String tag}) => Get.find<T>(tag: tag);


  T getService<T extends Service>({String tag}) => Get.find<T>(tag: tag);
}

Injector injector = Injector();