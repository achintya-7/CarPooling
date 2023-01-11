import 'package:car_pooling_app/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CustomDrawer2 extends StatelessWidget {
  const CustomDrawer2({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = AuthService().getCurrentUser();
    return Drawer(
      width: 280,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[300],
            ),
            accountName: Text(
              user?.displayName ?? "User",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            accountEmail: Text(
              user?.email ?? "User",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user?.photoURL ?? ""),
            ),
          ),
          ListTile(
            leading: NeumorphicIcon(
                style: NeumorphicStyle(
                color: Colors.grey[700],
              ),
              Icons.home,
              size: 30,
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Get.back();
            },
          ),
          const DrawerListTile(
              text: "Profile", route: '/drivers/profile', icon: Icons.person),
          const DrawerListTile(
              text: "History", route: '/drivers/history', icon: Icons.history),

          const Spacer(),

          ListTile(
            leading: NeumorphicIcon(
              style: NeumorphicStyle(
                color: Colors.grey[700],
              ),
              Icons.logout,
              size: 30,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Get.offAllNamed('/login');
              AuthService().signOut();
            },
          ),

        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.text,
    required this.route,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: NeumorphicIcon(
        style: NeumorphicStyle(
          color: Colors.grey[700],
        ),
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      onTap: () {
        Get.back();
        Get.toNamed(route);
      },
    );
  }
}
