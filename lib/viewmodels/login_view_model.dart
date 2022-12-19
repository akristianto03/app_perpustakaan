part of 'view_models.dart';

class LoginViewModel extends GetxController with StateMixin {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());

    super.onInit();
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      await AuthService.login(ctrlEmail.text, ctrlPassword.text).then((value) {
        if (value['status'] == true) {
          Get.snackbar("Berhasil login", "Selamat datang ${value['name']}");
          Get.offAllNamed(RouteName.tabBar, arguments: value['name']);
        } else {
          Get.snackbar("Login gagal", "Email atau password tidak sesuai");
        }
      });
    }
  }
}
