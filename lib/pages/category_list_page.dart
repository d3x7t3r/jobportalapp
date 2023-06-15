import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ChoiceChip(
              label: Text(category),
              selected: selectedCategory == category,
              onSelected: (selected) => onCategoryChanged(category),
            ),
          );
        },
      ),
    );
  }
}
