part of 'pages.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

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
              "Perpustakaan Fredo",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.start,
            ),
            Text("Buku yang tersedia",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 20,
                alignment: WrapAlignment.spaceBetween,
                children: const [
                  BookModule(),
                  BookModule(),
                  BookModule(),
                  BookModule(),
                  BookModule(),
                  BookModule()
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
