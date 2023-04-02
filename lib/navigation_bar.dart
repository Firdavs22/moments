import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  void _onItemTapped(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Container(
        padding: const EdgeInsets.only(bottom: 1), // добавьте это
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // измените это
          children: [
            NeumorphicButton(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(15),
                ),
              ),
              child: Image.asset('assets/global-search.png',
                  width: 32, height: 37),
              onPressed: () => _onItemTapped(0),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(15),
                ),
              ),
              child:
                  Image.asset('assets/play-cricle.png', width: 32, height: 37),
              onPressed: () => _onItemTapped(1),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(15),
                ),
              ),
              child: Image.asset('assets/video-vertical.png',
                  width: 32, height: 37),
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
