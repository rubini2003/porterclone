import 'package:flutter/material.dart';

class AllItemsPage extends StatelessWidget {
  final List<Map<String, String>> items;

  const AllItemsPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Close the page
          },
        ),
        title: Text("All Items"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return itemCard(items[index]["image"]!, items[index]["name"]!);
          },
        ),
      ),
    );
  }

  Widget itemCard(String imagePath, String itemName) {
    return Container(
      width: 90,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            itemName,
            style: TextStyle(fontSize: 14),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
