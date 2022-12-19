part of 'widgets.dart';

// ignore: must_be_immutable
class ListPinjam extends StatelessWidget {
  dynamic pinjam;
  VoidCallback press;
  ListPinjam({Key? key, required this.pinjam, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(Container(
          height: pinjam['status'] == 'menunggu konfirmasi' ? 140 : 100,
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(BookDetail(
                      book: Book(
                        pinjam['book']['id'],
                        pinjam['book']['judul'],
                        pinjam['book']['publikasi'],
                        pinjam['book']['bahasa'],
                        pinjam['book']['penulis'],
                        pinjam['book']['penerbit'],
                        pinjam['book']['halaman'],
                        pinjam['book']['kategori'],
                        pinjam['book']['deskripsi'],
                        pinjam['book']['img'],
                      ),
                      isPinjam: true,
                    ));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.info,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Info",
                      )
                    ],
                  ),
                ),
                pinjam['status'] == 'menunggu konfirmasi'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: press,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Batalkan peminjaman",
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 46,
              height: 66,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${Const.baseUrl}/${pinjam['book']['img']}'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pinjam['book']['judul'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${pinjam['tglPinjam']} - ${pinjam['tglKembali']}')
                ],
              ),
            ),
            const Spacer(),
            Text(
              pinjam['status'],
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
