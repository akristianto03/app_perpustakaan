part of 'view_models.dart';

class TaBBarViewModel extends GetxController {
  var selectedIndex = 0.obs;
  String user = Get.arguments;

  List<Widget> widgetOption = [PinjamPage(), BookPage()];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void refreshDataUser() async {
    await AuthService.refreshData().then((value) {
      if (value['statusUser'] == true) {
        Get.offAllNamed(RouteName.tabBar, arguments: user);
      }
    });
  }

  void logout() async {
    await AuthService.logout().then((value) {
      if (value['status'] == true) {
        Get.snackbar("Logout", "Logout berhasil");
        Get.offAllNamed(RouteName.login);
      }
    });
  }
}
