import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexteotask/model/text_field.dart';
import '../controller/mobile_screen_controller.dart';

class MobileScreen extends StatelessWidget {
  final MobileScreenController controller = Get.put(MobileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          height: 14,
          width: 91,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/asset1.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'BASIC DETAILS',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                CustomField(
                    'First Name', controller.firstNameController, (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Please enter at least 3 characters';
                  }
                  return null;
                }),
                CustomField(
                    'Last Name', controller.lastNameController, (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Please enter at least 3 characters';
                  }
                  return null;
                }),
                // CustomField(
                //     'Email Address', controller.emailAddressController, (
                //     value) {
                //   if (value == null || value.isEmpty ||
                //       !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                //     return 'Please enter a valid email address';
                //   }
                //   return null;
                // }),
                // CustomField('User ID', controller.userIdController, (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a User ID';
                //   }
                //   return null;
                // }),
                // CustomField('District', controller.districtController, (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a District';
                //   }
                //   return null;
                // }),
                // CustomField('Phone No', controller.phoneNoController, (value) {
                //   if (value == null || value.isEmpty ||
                //       !RegExp(r'^\d{10}$').hasMatch(value)) {
                //     return 'Please enter a valid 10-digit phone number';
                //   }
                //   return null;
                // }),
                // CustomField('Pincode', controller.pincodeController, (value) {
                //   if (value == null || value.isEmpty ||
                //       !RegExp(r'^\d+$').hasMatch(value)) {
                //     return 'Please enter a valid pincode';
                //   }
                //   return null;
                // }),
                // CustomField('Country', controller.countryController, (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter a Country';
                //   }
                //   return null;
                // }),
                const SizedBox(height: 30),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: controller.submitForm,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white),
                        minimumSize: MaterialStateProperty.all(const Size(
                            200, 50)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      child: const Text('Save & Proceed'),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 8.0),
                    child: TextButton(
                      onPressed: () {
                        controller.formKey.currentState!.reset();
                      },
                      child: const Text(
                        'Reset all',
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//   Widget _buildFormField(String label, TextEditingController controller, String? Function(String?)? validator) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(height: 5),
//           TextFormField(
//             controller: controller,
//             validator: validator,
//             keyboardType: label == 'Pincode' ? TextInputType.number : TextInputType.text,
//             inputFormatters: label == 'Pincode' ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : null,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

