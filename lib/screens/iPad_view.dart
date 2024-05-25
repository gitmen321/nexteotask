import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WebScreenView(),
  ));
}

class WebScreenView extends StatelessWidget {
  WebScreenView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, constraints) {

            return buildWebLayout(context);
          }

      ),
    );
  }


  Widget buildWebLayout(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          color: Colors.blue,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 323,
                width: 982,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/asset1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BASIC DETAILS',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField('First Name', (value) {
                              if (value == null || value.length < 3) {
                                return 'Please enter at least 3 characters';
                              }
                              return null;
                            })),
                        SizedBox(width: 20),
                        Expanded(
                            child: _buildFormField('Last Name', (value) {
                              if (value == null || value.length < 3) {
                                return 'Please enter at least 3 characters';
                              }
                              return null;
                            })),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField('Email Address', (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            })),
                        SizedBox(width: 20),
                        Expanded(
                            child: _buildFormField('User ID', (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a User ID';
                              }
                              return null;
                            })),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField('District', (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a User ID';
                              }
                              return null;
                            })),
                        SizedBox(width: 20),
                        Expanded(
                            child: _buildFormField('Phone No', (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r'^\d{10}$').hasMatch(value)) {
                                return 'Please enter a valid 10-digit phone number';
                              }
                              return null;
                            })),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _buildFormField('Pincode', (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r'^\d+$').hasMatch(value)) {
                                return 'Please enter a valid pincode';
                              }
                              return null;
                            })),
                        SizedBox(width: 20),
                        Expanded(
                            child: _buildFormField('Country', (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a User ID';
                              }
                              return null;
                            })),
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _formKey.currentState!.reset();
                            },
                            child: const Text(
                              'Reset all',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 100),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                              foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                              minimumSize:
                              MaterialStateProperty.all(Size(200, 50)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                            child: const Text('Save & Proceed'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormField(String label, String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          TextFormField(
            validator: validator,
            keyboardType:
            label == 'Pincode' ? TextInputType.number : TextInputType.text,
            inputFormatters: label == 'Pincode'
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
