part of 'view_models.dart';

class BookViewModel extends GetxController with StateMixin {
  List<Book> books = [];

  @override
  void onInit() async {
    await getAllBook();
    super.onInit();
  }

  Future getAllBook() async {
    await BookService.getAllBook().then((value) {
      for (dynamic val in value['results']) {
        books.add(Book(
            val['id'],
            val['judul'],
            val['publikasi'],
            val['bahasa'],
            val['penulis'],
            val['penerbit'],
            val['halaman'],
            val['kategori'],
            val['deskripsi'],
            val['img']));
      }

      change(null, status: RxStatus.success());
    });
  }
}
