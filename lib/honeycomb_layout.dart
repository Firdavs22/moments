import 'package:flutter/material.dart';

class HoneycombLayout extends StatelessWidget {
  final List<Widget> items;

  const HoneycombLayout({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Transform.translate(
                  offset: Offset(
                    index % 2 == 0 ? 0 : 30,
                    0,
                  ),
                  child: items[index],
                );
              },
              childCount: items.length,
            ),
          ),
        ),
      ],
    );
  }
}
