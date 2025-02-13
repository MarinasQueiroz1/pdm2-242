import 'package:activi9/models/isbn_model.dart';
import 'package:activi9/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  ApiService apiService = ApiService();

  ValueNotifier<IsbnModel?> address = ValueNotifier(null);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> searchAddress({required String isbn}) async {
    isLoading.value = true;

    IsbnModel? addressModel = await apiService.getAddress(isbn: isbn);

    address.value = addressModel;
    isLoading.value = false;
    notifyListeners();
    }

  void clear() {
    address.value = null;
    isLoading.value = false;
    notifyListeners();
  }
}