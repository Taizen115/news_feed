import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';

class CategoryChips extends StatefulWidget {
  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  var value = 0;

}

@override
Widget build(BuildContext context) {
  return Wrap(
      children: List<Widget>.generate(categories.length, (int index)
  {
    ChoiceChip(
      label: Text(categories[index].nameJp),
      selected: value == index,
      onSelected: (bool isSelected) {

      },
    );
  };
}