import 'package:flutter/material.dart';
import 'dart:math' as math;

@immutable
class HexagonGrid extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const HexagonGrid({Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  _HexagonGridState createState() => _HexagonGridState();
}

class _HexagonGridState extends State<HexagonGrid> {
  static const int nrX = 6;
  static const int nrY = 9;
  static const int marginY = 5;
  static const int marginX = 5;
  final double radius = 87.0;
  late final double height;

  late final List<CustomPaint> hexagons;

  @override
  void initState() {
    super.initState();
    height = computeHeight(radius);
    hexagons = buildHexagons();
  }

  List<CustomPaint> buildHexagons() {
    List<CustomPaint> hexList = [];

    for (int x = 0; x < nrX; x++) {
      for (int y = 0; y < nrY; y++) {
        hexList.add(CustomPaint(painter: HexagonPaint(computeCenter(x, y), radius)));
      }
    }
    return hexList;
  }

  static double heightRatioOfRadius() => math.cos(math.pi / HexagonPaint.SIDES_OF_HEXAGON);

  static double totalMarginY() => (nrY - 0.5) * marginY;

  static int totalMarginX() => (nrX - 1) * marginX;

  double computeHeight(double radius) {
    return heightRatioOfRadius() * radius * 2;
  }

  Offset computeCenter(int x, int y) {
    var centerX = computeX(x);
    var centerY = computeY(x, y);
    return Offset(centerX, centerY);
  }

  computeY(int x, int y) {
    double centerY;
    if (x % 2 == 0) {
      centerY = y * height + y * marginY + height / 2;
    } else {
      centerY = y * height + (y + 0.5) * marginY + height;
    }
    double marginsVertical = computeEmptySpaceY() / 2;
    return centerY + marginsVertical;
  }

  double computeEmptySpaceY() {
    return widget.screenHeight - ((nrY - 1) * height + 1.5 * height + totalMarginY());
  }

  double computeX(int x) {
    double marginsHorizontal = computeEmptySpaceX() / 2;
    return x * marginX + x * 1.5 * radius + radius + marginsHorizontal;
  }

  double computeEmptySpaceX() {
    return widget.screenWidth -
        (totalMarginX() + (nrX - 1) * 1.5 * radius + 2 * radius);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('HexagonGrid build');
    return Stack(children: hexagons);
  }
}

class HexagonPaint extends CustomPainter {
  static const int SIDES_OF_HEXAGON = 6;
  final double radius;
  final Offset center;

  HexagonPaint(this.center, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    Path path = createHexagonPath(radius, center);
    canvas.drawPath(path, paint);
  }

  static Path createHexagonPath(double radius, Offset center) {
    var hexagonPath = Path();
    for (int i = 0; i <= SIDES_OF_HEXAGON; i++) {
      var angle = (math.pi / (SIDES_OF_HEXAGON / 2)) * i;
      var x = center.dx + radius * math.cos(angle);
      var y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        hexagonPath.moveTo(x, y);
      } else {
        hexagonPath.lineTo(x, y);
      }
    }
    hexagonPath.close();
    return hexagonPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
