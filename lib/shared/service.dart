part of 'shared.dart';

class Service {
  static Container loadingDialog() {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: const CircularProgressIndicator(
          color: Colors.blue,
        ));
  }
}
