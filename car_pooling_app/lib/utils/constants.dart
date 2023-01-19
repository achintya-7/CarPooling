import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import "package:latlong2/latlong.dart";

const bool local = true;

const String apiUrlLocal =
    local ? "http://10.0.2.2:8080/" : "https://car-pooling.fly.dev/";

LatLng newDelhi = LatLng(28.61992743538245, 77.20905101733563);

final buttonStyle = NeumorphicStyle(
  color: Colors.grey[200],
  boxShape:
      NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(12))),
  depth: 8,
  border: const NeumorphicBorder(width: 2),
  intensity: 1,
);

final buttonStyle4 = NeumorphicStyle(
    color: Colors.grey[200],
    boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(12))),
    depth: 8,
    border: const NeumorphicBorder(width: 2),
    intensity: 1
);

final buttonStyle2 = NeumorphicStyle(
  color: Colors.grey[200],
  boxShape:
      NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(12))),
  depth: 1,
  border: const NeumorphicBorder(width: 3, color: Colors.grey),
  intensity: 1,
);

final buttonStyle3 = NeumorphicStyle(
  color: Colors.grey[200],
  boxShape: const NeumorphicBoxShape.circle(),
  depth: 1,
  border: const NeumorphicBorder(width: 2),
  shape: NeumorphicShape.convex,
  intensity: 1,
);

String amityAddress =
    "Amity University, Sector 125, Noida, Uttar Pradesh 201303";
