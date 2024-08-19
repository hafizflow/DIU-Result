import 'package:diu_result/controller/semester_id_name_controller.dart';
import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField({
    super.key,
  });

  final pController = Get.find<PersonalInfoController>();
  final sIdNameController = Get.find<SemesterIdNameController>();
  final sResultController = Get.find<SemesterResultController>();

  /// Function to handle the result search operation
  Future<void> performSearch() async {
    await pController.getPersonalInfo(pController.idTEController.text.trim());

    bool success = await sIdNameController.getAllSemesterIdName();

    if (success && sIdNameController.semesterIds.isNotEmpty) {
      await sResultController.getAllSemesterResults(
        sIdNameController.semesterIds,
        pController.idTEController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: pController.idTEController,
      style: TextStyle(
        color: Colors.white.withOpacity(.8),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your ID';
        }
        // You can add further synchronous checks here if needed
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter Your ID',
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: IconButton(
            onPressed: () async {
              await performSearch();
            },
            icon: const Icon(Iconsax.search_normal),
          ),
        ),
      ),
      cursorColor: Colors.white.withOpacity(.6),
      keyboardType: const TextInputType.numberWithOptions(),
      textInputAction: TextInputAction.search,
      // Trigger the search operation when the search button on the keyboard is pressed
      onFieldSubmitted: (value) async {
        await performSearch();
      },
    );
  }
}
