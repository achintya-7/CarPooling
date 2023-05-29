import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/model/requets/requests_model.dart';
import 'package:car_pooling_app/service/http_service.dart';
import 'package:car_pooling_app/utils/utils.dart';
import 'package:get/get.dart';

class DriverRequestController extends GetxController {
  final currentRide = Get.find<RideController>().currentRide.value;
  RxList<RequestsModel> requests = <RequestsModel>[].obs;
  RxList<String> loadingRequests = RxList<String>([]);
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRequests();
  }

  loadRequests() async {
    toogleLoading();

    final response =
        await HttpService.getRequest("requests/driver/${currentRide?.id}");
    if (response.statusCode == 200) {
      requests.value = (response.body as List)
          .map((e) => RequestsModel.fromJson(e))
          .toList()
          .cast<RequestsModel>();
    } else if (response.statusCode == 204) {
      requests.value = [];
    } else {
      errorToast("Something went wrong");
    }

    toogleLoading();
  }

  toogleLoading() {
    loading.value = !loading.value;
  }

  acceptRequest(RequestsModel req) async {
    loadingRequests.add(req.id);

    Map<String, dynamic> body = {
      "request_id": req.id,
      "email": req.email,
      "name": req.name,
      "phone": req.phone,
      "origin": req.origin,
      "origin_id": req.origin_id,
    };

    final response = await HttpService.postRequest("requests/accept", body);
    if (response.statusCode == 200) {
      removeRequest(req);
    } else {
      errorToast("Something went wrong");
    }

    loadingRequests.remove(req.id);
  }

  rejectRequest(RequestsModel req) async {
    loadingRequests.add(req.id);

    Map<String, dynamic> body = {
      "request_id": req.id,
      "ride_id": req.ride_id,
    };

    final response = await HttpService.postRequest("requests/reject", body);
    if (response.statusCode == 200) {
      removeRequest(req);
    } else {
      errorToast("Something went wrong");
    }

    loadingRequests.remove(req.id);  
  }


  removeRequest(RequestsModel req) {
    requests.remove(req);
  }
}
