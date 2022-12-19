part of 'pages.dart';

class BookPage extends StatelessWidget {
  BookPage({super.key});

  final bookVM = Get.put(BookViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bookVM.obx((state) {
        return SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  children: bookVM.books
                      .map((book) => BookModule(
                            book: book,
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ));
      }),
    );
  }
}
