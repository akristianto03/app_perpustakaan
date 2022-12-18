part of 'view_models.dart';

class TaBBarViewModel extends GetxController {
  var selectedIndex = 0.obs;
  Map<String, dynamic>? user;

  List<Widget> widgetOption = [PinjamPage(), BookPage()];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() async {
    getUid();

    super.onInit();
  }

  void getUid() async {}
}
