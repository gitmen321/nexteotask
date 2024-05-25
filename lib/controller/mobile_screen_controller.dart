import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/new_student.dart';


class MobileScreenController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void submitForm() {
    if (formKey.currentState!.validate()) {
      // Process data and pass it to NewStudentsPage
      Map<String, String> data = {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'emailAddress': emailAddressController.text,
        'userId': userIdController.text,
        'district': districtController.text,
        'phoneNo': phoneNoController.text,
        'pincode': pincodeController.text,
        'country': countryController.text,
      };
      Get.to(() => NewStudentsPage(), arguments: data);
    } else {
      print("Form is not valid");
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    userIdController.dispose();
    districtController.dispose();
    phoneNoController.dispose();
    pincodeController.dispose();
    countryController.dispose();
    super.dispose();
  }
}
