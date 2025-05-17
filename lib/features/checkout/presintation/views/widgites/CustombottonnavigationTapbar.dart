import 'package:flutter/material.dart';
import '../../../domines/entitys/BottonTapBarEntity.dart';
import 'NavigatTapBarItem.dart';

class CustombottonnavigationTapbar extends StatelessWidget {
  const CustombottonnavigationTapbar({
    super.key,
    required this.currentPageActive,
    required this.pageController, required this.ontap,
  });
  //final ValueChanged<int>changed;
  final int currentPageActive;
  final PageController pageController;
  final ValueChanged<int> ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: bottonTapBarEntity.asMap().entries.map((e) {
        var index = e.key;
        var entity = e.value;
        return Expanded(
          //flex: activeIndex==index ?3:2,
          child: GestureDetector(
              onTap: () {
                ontap(index);
                },

              child: NavigatTapBarItem(
                isActive: index <= currentPageActive,
                bottonTapBarEntity: entity,
              )),
        );
      }).toList(),
    );
  }
}
