part of 'service.dart';

class API {

  final String _homeBase = 'bwa-cozy.herokuapp.com';
  final String _subBase = 'recommended-spaces';

  Uri get spaces => Uri.https(_homeBase, _subBase);
}