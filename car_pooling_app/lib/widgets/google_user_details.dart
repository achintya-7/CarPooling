import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
      child: Neumorphic(
        padding: const EdgeInsets.all(20),
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(12),
          ),
          depth: 8,
          lightSource: LightSource.topLeft,
        ),
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
