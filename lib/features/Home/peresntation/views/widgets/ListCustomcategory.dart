import 'package:flutter/material.dart';

import '../../../../../core/uitels/app_images.dart';
import '../../../domines/entites/CatogryEntity.dart';
import 'CustomCategory.dart';

class ListCustomcategory extends StatelessWidget {
  const ListCustomcategory({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategortEntity> categories = [
      CategortEntity(image: Assets.imagesBerger, title: "برجر"),
      CategortEntity(image: Assets.imagesPitzza, title: "بيتزا"),
      CategortEntity(image: Assets.imagesPitzza, title: "فراخ"),
      CategortEntity(image: Assets.imagesBerger, title: "كريبات"),
      CategortEntity(image: Assets.imagesBerger, title: "بطاطس"),
      CategortEntity(image: Assets.imagesBerger, title: "سندوتشات"),
      CategortEntity(image: Assets.imagesBerger, title: "حواوشي"),

    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) => Customcategory(categortEntity: category))
            .toList(),
      ),
    );
  }
}
