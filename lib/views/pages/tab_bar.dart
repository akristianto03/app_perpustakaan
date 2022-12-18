part of 'pages.dart';

class TabBar extends StatelessWidget {
  TabBar({super.key});

  final tabBarVM = Get.put(TaBBarViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Center(
              child: tabBarVM.widgetOption
                  .elementAt(tabBarVM.selectedIndex.value)),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey[300],
            currentIndex: tabBarVM.selectedIndex.value,
            onTap: tabBarVM.onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_add),
                  activeIcon: Icon(
                    Icons.bookmark_add,
                    color: Colors.blue,
                  ),
                  label: "Pinjam"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  activeIcon: Icon(
                    Icons.book,
                    color: Colors.blue,
                  ),
                  label: "Buku")
            ],
          ),
          drawer: Drawer(),
        ));
  }
}
