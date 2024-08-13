import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    this.isShowBack = false,
  });

  final bool isShowBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isShowBack
            ? IconButton(
                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            : const SizedBox.shrink(),
        Expanded(
          child: Text(
            'DIU Result',
            style: TextStyle(
              color: Colors.white.withOpacity(.9),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
