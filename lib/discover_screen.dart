import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'hexagon_grid.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 8,
                        lightSource: LightSource.topLeft,
                        color: Colors.blueGrey[50],
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ),
                ),
                expandedHeight: 100,
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: HexagonGrid(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: GlassmorphicContainer(
                width: screenWidth * 0.7,
                height: 60,
                borderRadius: 30,
                blur: 15,
                alignment: Alignment.bottomCenter,
                border: 1.5,
                linearGradient: LinearGradient(
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Color(0xFFffffff).withOpacity(0.5),
                    Color(0xFFFFFFFF).withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Обработка нажатия на кнопку "поиск"
                      },
                      icon: Icon(Icons.search),
                    ),
                    IconButton(
                      onPressed: () {
                        // Обработка нажатия на кнопку "видео"
                      },
                      icon: Icon(Icons.video_library),
                    ),
                    IconButton(
                      onPressed: () {
                        // Обработка нажатия на кнопку "лента"
                      },
                      icon: Icon(Icons.view_list),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        ),
);
}
}