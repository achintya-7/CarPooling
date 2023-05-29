import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleUserDetails extends StatelessWidget {
  const GoogleUserDetails({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user?.photoURL ?? ""),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text(
              user?.displayName ?? "User",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              user?.email ?? "User",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
