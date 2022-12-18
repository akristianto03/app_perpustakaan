part of 'widgets.dart';

class ListPinjam extends StatelessWidget {
  const ListPinjam({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(Container(
          height: 140,
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
                    Get.to(BookDetail());
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
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {},
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
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/bc/be/e6/bcbee64cb478a5dcf676001b8d0bc204.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(4)),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Judul",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("01/12 - 02/12")
                ],
              ),
            ),
            const Spacer(),
            Text("Menunggu Konfirmasi")
          ],
        ),
      ),
    );
  }
}
