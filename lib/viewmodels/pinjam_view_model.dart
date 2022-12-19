part of 'view_models.dart';

class PinjamViewModel extends GetxController with StateMixin {
  Map<String, dynamic> pinjams = {};

  @override
  void onInit() async {
    await getUserData();
    super.onInit();
  }

  Future getUserData() async {
    await StorageManager.getUser().then((value) {
      pinjams = value;
      print("debug 3: ${pinjams['pinjams'].length}");
      change(null, status: RxStatus.success());
    });
  }

  void deleteReqPinjam(int pinjamId) async {
    await BookService.deletePinjam(pinjamId).then((value) {
      if (value['status'] == true) {
        Get.offAllNamed(RouteName.tabBar, arguments: value['results']['name']);
      }
    });
  }
}
