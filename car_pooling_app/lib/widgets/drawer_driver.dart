import 'package:car_pooling_app/feature/home/controllers/ride_controller.dart';
import 'package:car_pooling_app/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer2 extends StatelessWidget {
  const CustomDrawer2({super.key, required this.drawerKey});

  final GlobalKey<ScaffoldState> drawerKey;

  @override
  Widget build(BuildContext context) {
    final rideController = Get.find<RideController>();

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
            leading: const Icon(
              Icons.home,
              size: 30,
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              drawerKey.currentState!.closeDrawer();
            },
          ),
          DrawerListTile(
              text: "Profile",
              route: '/drivers/profile',
              icon: Icons.person,
              drawerKey: drawerKey),
          Obx(() {
            if (rideController.currentRide.value != null) {
              return DrawerListTile(
                  text: "Requests",
                  route: '/drivers/requests',
                  icon: Icons.info,
                  drawerKey: drawerKey);
            } else {
              return const SizedBox();
            }
          }),
          DrawerListTile(
              text: "History",
              route: '/drivers/history',
              icon: Icons.history,
              drawerKey: drawerKey),
          const Spacer(),
          ListTile(
            leading: const Icon(
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
    required this.drawerKey,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final String route;
  final GlobalKey<ScaffoldState> drawerKey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      onTap: () {
        if (drawerKey.currentState!.isDrawerOpen) {
          drawerKey.currentState!.closeDrawer();
        }
        Get.toNamed(route);
      },
    );
  }
}
