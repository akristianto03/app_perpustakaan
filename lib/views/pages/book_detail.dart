part of 'pages.dart';

// ignore: must_be_immutable
class BookDetail extends StatelessWidget {
  bool isPinjam;
  Book book;
  BookDetail({Key? key, required this.book, required this.isPinjam})
      : super(key: key);

  final bookDetailVM = Get.put(BookDetailViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "Detail Buku",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: bookDetailVM.obx((state) {
        return SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 230,
                  height: 330,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${Const.baseUrl}/${book.img}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                book.judul,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Tanggal Publikasi",
                        textAlign: TextAlign.start,
                      ),
                      Text("Bahasa"),
                      Text("Penulis"),
                      Text("Penerbit"),
                      Text("Jumlah Halaman"),
                      Text("Kategori")
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(": ${book.tglPublikasi}"),
                      Text(": ${book.bahasa}"),
                      Text(": ${book.penulis}"),
                      Text(": ${book.penerbit}"),
                      Text(": ${book.halaman}"),
                      Text(": ${book.kategori}")
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deskripsi",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(book.deskripsi)
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              isPinjam == false
                  ? ActionButton(
                      press: () async {
                        bookDetailVM.pinjamBuku(book.id);
                      },
                      text: "Pinjam",
                    )
                  : Container()
            ],
          ),
        ));
      }),
    );
  }
}
