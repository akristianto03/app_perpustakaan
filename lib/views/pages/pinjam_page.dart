part of 'pages.dart';

class PinjamPage extends StatelessWidget {
  const PinjamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hai Nama",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.start,
            ),
            Text("Buku yang sedang dipinjam",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start),
            const SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ListPinjam(), ListPinjam()],
            )
          ],
        ),
      )),
    );
  }
}
