import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem(
      {super.key, required this.grocery, required this.onRemoveItem});

  final GroceryItem grocery;
  final void Function(GroceryItem grocery) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Dismissible(
        key: ValueKey(grocery.id),
        onDismissed: (direction) {
          onRemoveItem(grocery);
        },
        child: Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Container(
                color: grocery.category.color,
              ),
            ),
            const SizedBox(
              width: 26,
            ),
            Expanded(child: Text(grocery.name)),
            Text(grocery.quantity.toString()),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
