part of 'pages.dart';

class TabBar extends StatelessWidget {
  TabBar({super.key});

  final tabBarVM = Get.put(TaBBarViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            actions: [
              IconButton(
                  onPressed: () {
                    tabBarVM.refreshDataUser();
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
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
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 50),
              children: [
                Icon(
                  Icons.account_circle,
                  size: 120,
                  color: Colors.grey[400],
                ),
                Text(
                  tabBarVM.user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  height: 2,
                ),
                ListTile(
                  onTap: () async {
                    tabBarVM.logout();
                  },
                  selectedColor: Colors.red,
                  selected: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text(
                    "Logout",
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
