import 'package:car_pooling_app/model/requets/requests_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class PassengerRequestsController extends GetxController{

  @override
  void onInit() {
    loadRequests();
    super.onInit();
  }

  RxList<RequestsModel> requests = RxList<RequestsModel>([]);
  RxBool loading = false.obs;

  loadRequests() async {
    toogleLoading();

    final response = await HttpService.getRequest("requests/passenger");
    if (response.statusCode == 200) {
      requests.value = (response.body as List)
          .map((e) => RequestsModel.fromJson(e))
          .toList()
          .cast<RequestsModel>();
    } else if (response.statusCode == 204) {
      requests.value = [];
    } 
    else {
      errorToast("Something went wrong");
    }

    toogleLoading();
  }

  toogleLoading() {
    loading.value = !loading.value;
  }

}