import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _removeGrocery(GroceryItem grocery) {
    setState(() {
      _groceryItems.remove(grocery);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items...'),
    );

    if (_groceryItems.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (context, index) => GroceryListItem(
            grocery: _groceryItems[index],
            onRemoveItem: _removeGrocery,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Your Groceries',
            ),
          ],
        ),
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
              onPressed: () => _addItem(context), icon: const Icon(Icons.add))
        ],
      ),
      backgroundColor: Colors.grey[250],
      body: content,
    );
  }
}
