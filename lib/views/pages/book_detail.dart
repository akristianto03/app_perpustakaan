part of 'pages.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

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
      body: SingleChildScrollView(
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
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/bc/be/e6/bcbee64cb478a5dcf676001b8d0bc204.jpg'),
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
              "Ini judul buku sangat panjang",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
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
                  children: const [
                    Text(": "),
                    Text(": "),
                    Text(": "),
                    Text(": "),
                    Text(": "),
                    Text(": ")
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deskripsi",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor")
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ActionButton(
              press: () {},
              text: "Pinjam",
            )
          ],
        ),
      )),
    );
  }
}
