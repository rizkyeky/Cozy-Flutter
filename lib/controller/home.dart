part of 'controller.dart';

class HomeController extends GetxController implements Controller {
  
  @override
  void init() {
    // TODO: implement init
  }

  final SpaceService spaceService = injector.getService(
    controller: SpaceService(),
    tag: 'spaceService'
  );

  final List<SpaceModel> spaces = [];

  Future<void> getSpaces() async {
    if (spaces.isEmpty) {
      final result = await spaceService.getSpaces();
      if (result.status) {
        spaces.addAll(result.data);
      } else {
        debugPrint(result.message);
      }
    }
  }
}