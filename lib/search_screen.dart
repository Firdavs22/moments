import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: TextField(
          onChanged: (value) {
            // handle search query
          },
          decoration: InputDecoration(
            hintText: 'Поиск',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: NeumorphicTheme.baseColor(context),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            sectionTitle('Рекомендуемый контент'),
            // Replace with the actual grid of recommended content
            Container(height: 200, color: Colors.grey[200]),
            const SizedBox(height: 20),
            sectionTitle('Тренды и популярное'),
            // Replace with the actual list of top publications
            Container(height: 200, color: Colors.grey[300]),
            const SizedBox(height: 20),
            sectionTitle('Локации и места'),
            // Replace with the actual list of geolocation content
            Container(height: 200, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
