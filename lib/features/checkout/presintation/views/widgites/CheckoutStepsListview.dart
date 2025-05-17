import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Address_PageView.dart';
import 'Payment_section.dart';
import 'Scetion_Shipping.dart';

class Checkout_Steps_Listview extends StatelessWidget {
  Checkout_Steps_Listview({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final PageController pageController;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: getPage().length,
          itemBuilder: (context, index) {
            return getPage()[index];
          }),
    );
  }

  List<Widget> getPage() {
    return [
      const ScetionShipping(),
      AddressPageview(
        formKey: formKey,
        valueListenable: valueListenable,
      ),
      PaymentSection(
        pageController: pageController,
      ),
    ];
  }
}
