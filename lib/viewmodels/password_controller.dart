part of 'view_models.dart';

class PasswordController extends GetxController {
  var showPass = false.obs;
  void switchShow() {
    showPass.value = !showPass.value;
  }
}
