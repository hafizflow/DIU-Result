import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:diu_result/controller/api_controller.dart';
import 'package:diu_result/controller/personal_info_controller.dart';
import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/const/color.dart';
import 'custom_snackbar.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField({super.key});

  final aController = Get.find<ApiController>();
  final pController = Get.find<PersonalInfoController>();
  final sController = Get.find<SemesterResultController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: aController.searchKey,
      child: TextFormField(
        maxLength: 20,
        controller: pController.idTEController,
        style: const TextStyle(
            color: CColor.offWhite,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            sController.allSemesterResults.clear();
            final snackBar = customSnackBar(
              title: 'Forgot!',
              message: 'Please enter your Student-ID',
              contentType: ContentType.help,
            );
            ScaffoldMessenger.of(Get.context!)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
            return '';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Enter Your ID',
          hintStyle: const TextStyle(color: Colors.grey),
          counterText: '',
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              icon: const Icon(Iconsax.search_normal),
              onPressed: () async {
                FocusScope.of(context).unfocus();

                if (!aController.searchKey.currentState!.validate()) {
                  return;
                }

                if (await aController.personalInfoSearch() == false) {
                  sController.allSemesterResults.clear();
                  final snackBar = customSnackBar(
                    title: 'On Snap!',
                    message: 'Please insert valid Student-ID',
                    contentType: ContentType.failure,
                  );
                  ScaffoldMessenger.of(Get.context!)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  return;
                }

                aController.resultSearch();
              },
            ),
          ),
        ),
        cursorColor: Colors.white,
        keyboardType: const TextInputType.numberWithOptions(),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (_) async {
          if (!aController.searchKey.currentState!.validate()) {
            return;
          }

          if (await aController.personalInfoSearch() == false) {
            sController.allSemesterResults.clear();
            final snackBar = customSnackBar(
              title: 'On Snap!',
              message: 'Please insert valid Student-ID',
              contentType: ContentType.failure,
            );
            ScaffoldMessenger.of(Get.context!)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
            return;
          }

          aController.resultSearch();
        },
      ),
    );
  }
}
