part of 'view_models.dart';

class BookDetailViewModel extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void pinjamBuku(int bookId) async {
    change(null, status: RxStatus.loading());
    await BookService.storePinjamBuku(bookId).then((value) {
      if (value['status'] == true) {
        Get.snackbar("Buku berhasil dipinjam", "Berhasil meminjam buku}");
        Get.offAllNamed(RouteName.tabBar, arguments: value['results']['name']);
      }
    });
  }
}
