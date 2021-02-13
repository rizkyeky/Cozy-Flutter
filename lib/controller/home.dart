part of 'controller.dart';

class HomeController extends GetxController implements Controller {
  
  @override
  void init() {
    // TODO: implement init
  }

  final SpaceService spaceService = injector.getService(tag: 'spaceService');

  final List<SpaceModel> spaces = [];

  Future<void> getSpaces() async {
    if (spaces.isEmpty) {
      final result = await spaceService.getSpaces();
      spaces.addAll(result.data);
    }
  }
}