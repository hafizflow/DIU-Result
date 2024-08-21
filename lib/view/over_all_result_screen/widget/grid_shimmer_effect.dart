import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridShimmerEffect extends StatelessWidget {
  const GridShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 140,
      ),
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade500,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 20,
                    color: Colors.white.withOpacity(.5),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 120,
                    height: 20,
                    color: Colors.white.withOpacity(.5),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
