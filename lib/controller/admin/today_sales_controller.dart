import 'package:SastaKhana/data/models/admin_models/sales_model.dart';
import 'package:SastaKhana/data/network/api_provider/admin_api_provider.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TodaySalesController extends GetxController {
  final Rx<SalesModel?> todaySales = Rx<SalesModel?>(null);

@override
  void onInit() {
    fetchTodaySales();
    super.onInit();
  }

 

  Future<void> fetchTodaySales() async {
      Utils.showLoading();  
    try {
      var response = await AdminApiProvider().todaySalesApi();
      if (response.success == true&& response.body != null) {
       todaySales.value = response.body;
      } else {
        Utils.showErrorDialog(response.message ?? "");
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("Fetch Today Sales Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
  }
}