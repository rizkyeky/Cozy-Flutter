import 'package:cozy_app/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'space.dart';
part 'api.dart';

abstract class Service {
  void init();
  void dispose();
}

class ServiceResult<T> {

  @required
  bool status;
  
  T data;
  String message;

  ServiceResult({this.data, this.message,  this.status});
}