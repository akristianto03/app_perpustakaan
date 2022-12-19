part of 'widgets.dart';

// ignore: must_be_immutable
class BookModule extends StatelessWidget {
  Book book;
  BookModule({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetail(book: book, isPinjam: false));
      },
      child: Column(
        children: [
          Container(
            width: 184,
            height: 264,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${Const.baseUrl}/${book.img}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ]),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 184,
            child: Text(
              book.judul,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
