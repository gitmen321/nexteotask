import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewStudentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the arguments passed from the MobileScreen
    final Map<String, String?> arguments = Get.arguments;

    // Extract the data from the arguments map
    final String? firstName = arguments['firstName'];
    final String? lastName = arguments['lastName'];
    final String? emailAddress = arguments['emailAddress'];
    final String? userId = arguments['userId'];
    final String? district = arguments['district'];
    final String? phoneNo = arguments['phoneNo'];
    final String? pincode = arguments['pincode'];
    final String? country = arguments['country'];

    return Scaffold(

      body: LayoutBuilder(

        builder: (context, constraints) {
          print(constraints.maxWidth);
          if (constraints.maxWidth > 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  width: 323,
                  color: Colors.blue,
                  child:Column(
                    children: [
                      Image(
                                image: AssetImage('assets/images/asset1.png',),
                                fit: BoxFit.contain,
                              ),
                    ],
                  ),
                        ),
                Column(
                  children: [
                    SizedBox(
                    width: constraints.maxWidth *0.25,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildInfoRow('First Name', firstName),
                                  _buildInfoRow('Last Name', lastName),
                                  // _buildInfoRow('Email Address', emailAddress),
                                  // _buildInfoRow('User ID', userId),
                                  // _buildInfoRow('District', district),
                                  // _buildInfoRow('Phone No', phoneNo),
                                  // _buildInfoRow('Pincode', pincode),
                                  // _buildInfoRow('Country', country),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            );
          } else {
            // Mobile layout
            return   SizedBox(
              width: 200,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildInfoRow('First Name', firstName),
                          _buildInfoRow('Last Name', lastName),
                          _buildInfoRow('Email Address', emailAddress),
                          _buildInfoRow('User ID', userId),
                          _buildInfoRow('District', district),
                          _buildInfoRow('Phone No', phoneNo),
                          _buildInfoRow('Pincode', pincode),
                          _buildInfoRow('Country', country),
                        ],
                      ),
                    ),
                  ),
                ),
              );

          }
        },
      ),
    );
  }


  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
             Text(value!),
        ],
      ),
    );
  }

  Widget _buildAddNewStudentButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Icon(Icons.add, color: Colors.blue),
              title: Text('Add New Student'),
              onTap: () {
                // Navigate to add new student form
                Get.toNamed(
                    '/'); // Ensure you navigate back to MobileScreen to add new student
              },
            ),
          ),
        ),
        SizedBox(width: 16), // Adjust the spacing as needed
      ],
    );
  }
}