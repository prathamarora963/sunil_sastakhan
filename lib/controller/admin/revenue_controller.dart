import 'package:SastaKhana/data/models/admin_models/monthly_revenue_model.dart';
import 'package:SastaKhana/data/network/api_provider/admin_api_provider.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RevenueController extends GetxController {
 final Rx<MonthlyRevenueModel?> revenue = Rxn<MonthlyRevenueModel>();
 final Rx<QuartlyReportModel?> quartlyRevenue = Rxn<QuartlyReportModel>();

   QuartlyReportModel? get quartlyRevenueData => quartlyRevenue.value ;
   MonthlyRevenueModel? get revenueData => revenue.value ;
   final String year = DateTime.now().year.toString();
  @override
  void onInit() {
    super.onInit();
    fetchRevenue();
    fetchQuartlyRevenue();
  }

  Future<void> fetchRevenue() async {
    Utils.showLoading();
   try {
      var response = await AdminApiProvider().getRevenue(year: year);
      if (response.success ==true) {
        revenue.value = response.body;
      } else {
         Utils.showErrorDialog(response.message ?? "Failed to fetch revenue data");
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("revenue Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
   
  }


Future<void> fetchQuartlyRevenue() async {
    Utils.showLoading();
   try {
      var response = await AdminApiProvider().getQuartlyRevenue();
      if (response.success ==true) {
        quartlyRevenue.value = response.body;
      } else {
         Utils.showErrorDialog(response.message ?? "Failed to fetch revenue data");
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("revenue Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
   
  }

}
