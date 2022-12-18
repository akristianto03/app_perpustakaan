part of 'widgets.dart';

class BookModule extends StatelessWidget {
  const BookModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetail());
      },
      child: Column(
        children: [
          Container(
            width: 184,
            height: 264,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/bc/be/e6/bcbee64cb478a5dcf676001b8d0bc204.jpg'),
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
              "judul buku sangat panjang",
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
