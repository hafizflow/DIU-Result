import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/const/color.dart';

class CardShimmerEffect extends StatelessWidget {
  const CardShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(.3),
        highlightColor: Colors.grey.shade500,
        period: const Duration(seconds: 1),
        child: Card(
          margin: EdgeInsets.zero,
          color: CColor.offDark,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 20,
                  color: Colors.grey,
                ),
                const SizedBox(height: 8),
                placeHolder(),
                const SizedBox(height: 2),
                placeHolder(),
                const SizedBox(height: 2),
                placeHolder(),
                const SizedBox(height: 2),
                placeHolder(),
                const SizedBox(height: 2),
                placeHolder(),
                const SizedBox(height: 2),
                placeHolder(),
                const SizedBox(height: 4),
                placeHolder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container placeHolder() {
    return Container(
      width: double.infinity,
      height: 20,
      color: Colors.grey,
    );
  }
}
