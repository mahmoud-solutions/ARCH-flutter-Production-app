import 'package:flutter/material.dart';

class CardIndicatorsWidget extends StatelessWidget {
  final int count;
  const CardIndicatorsWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black26),
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
