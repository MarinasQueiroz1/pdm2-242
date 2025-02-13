import 'package:activi9/constants/api_constants.dart';
import 'package:activi9/models/isbn_model.dart';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class ApiService {
  Future<IsbnModel?> getAddress({required String isbn}) async {
    try {
      var response = await Dio().get(ApiConstants.urlBase(isbn));

      if (response.statusCode == 200) {
        return IsbnModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}