part of 'pages.dart';

class PinjamPage extends StatelessWidget {
  PinjamPage({super.key});

  final pinjamVM = Get.put(PinjamViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pinjamVM.obx((state) {
        return SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hai ${pinjamVM.pinjams['name']}",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
              Text("Buku yang sedang dipinjam",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 25,
              ),
              pinjamVM.pinjams['pinjams'].length != 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: pinjamVM.pinjams['pinjams']
                          .map<Widget>((pinjam) => ListPinjam(
                                pinjam: pinjam,
                                press: () async {
                                  pinjamVM.deleteReqPinjam(pinjam['id']);
                                },
                              ))
                          .toList(),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 2,
                      alignment: Alignment.center,
                      child: Text("Belum ada buku yang dipinjam"),
                    )
            ],
          ),
        ));
      }, onLoading: Service.loadingDialog()),
    );
  }
}
