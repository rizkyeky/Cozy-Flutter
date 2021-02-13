part of 'service.dart';

class SpaceService implements Service {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final Dio _dio = Dio();
  final API _api = API();

  Future<ServiceResult<List<SpaceModel>>> getSpaces() async {
    try {
      final response = await _dio.get(_api.spaces.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        final result = response.data as List;
        return ServiceResult(
          status: true,
          data: result.map((item) => 
            SpaceModel.fromJson(item as Map<String, dynamic>)
          ).toList(),
        );
      } else {
        return ServiceResult(
          status: false,
          message: 'Status Code ${response.statusCode}'
        );
      }
    } catch (e) {
      return ServiceResult(
        status: false,
        message: e.toString()
      );
    }
  }

}