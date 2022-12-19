part of 'view_models.dart';

class RegisterViewModel extends GetxController with StateMixin {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  final ctrlRePassword = TextEditingController();
  final ctrlisAdmin = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void changeRoleValue(bool val) {
    ctrlisAdmin.value = val;
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      change(null, status: RxStatus.loading());
      AuthService.register(ctrlName.text, ctrlEmail.text, ctrlPassword.text,
              ctrlRePassword.text, ctrlisAdmin.value)
          .then((value) {
        if (value['status'] == true) {
          Get.snackbar("Berhasil", "Akun berhasil dibuat");
          Get.offAllNamed(RouteName.login);
        } else {
          change(null, status: RxStatus.success());
          Get.snackbar("Gagal", "Terjadi kesalahan saat melakukan pendaftaran");
        }
      });
    }
  }
}
