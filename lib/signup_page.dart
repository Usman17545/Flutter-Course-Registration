import 'package:flutter/material.dart';
import 'package:sharedpref/class.dart';

// ignore: use_key_in_widget_constructors
class StudentFormPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _StudentFormPageState createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final Map<String, TextEditingController> controllers = {
    'username': TextEditingController(),
    'id': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
    'contactnumber': TextEditingController(),
    'program': TextEditingController(),
    'semester': TextEditingController(),
    'programLevel': TextEditingController(),
    'batch': TextEditingController(),
    'cgpa': TextEditingController(),
    'maxCreditHours': TextEditingController(),
    'registeredCreditHours': TextEditingController(),
    'completedCreditHours': TextEditingController(),
    'requiredCreditHours': TextEditingController(),
  };

  final _formKey =
      GlobalKey<FormState>(); // Add a global key for form validation

  @override
  void dispose() {
    controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }
  void clearAllControllers() {
  controllers.forEach((key, controller) {
    controller.clear();
  });
}

  bool isAnyFieldEmpty() {
    for (var controller in controllers.values) {
      if (controller.text.isEmpty) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/123.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(120, 3, 26, 70),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Student Registration Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            Expanded(
              flex: 9,
              child: Form(
                // Wrap your fields inside a Form widget
                key: _formKey, // Use the form key for validation
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(120, 3, 26, 70),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: ListView(
                          children: [
                            CustomTextField(
                              label: 'Student Name',
                              controller: controllers['username'],
                              icon: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Student ID (In Lower Cases)',
                              controller: controllers['id'],
                              icon: const Icon(
                                Icons.perm_identity,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Student Email',
                              controller: controllers['email'],
                              icon: const Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Password',
                              controller: controllers['password'],
                              icon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Contact Number(Without Dashes)',
                              controller: controllers['contactnumber'],
                              isNumber: true,
                              icon: const Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Student Program(Enrolled)',
                              controller: controllers['program'],
                              icon: const Icon(
                                Icons.school,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Semester(Current)',
                              controller: controllers['semester'],
                              isNumber: true,
                              icon: const Icon(
                                Icons.date_range,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                      height: double.infinity,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(120, 3, 26, 70),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: ListView(
                          children: [
                            CustomTextField(
                              label: 'Program Level e.g.Bachelor',
                              controller: controllers['programLevel'],
                              icon: const Icon(
                                Icons.book,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Batch e.g.F2022105',
                              controller: controllers['batch'],
                              icon: const Icon(
                                Icons.group,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'CGPA',
                              controller: controllers['cgpa'],
                              isNumber: true,
                              icon: const Icon(
                                Icons.assessment,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Credit Hours Registered',
                              controller: controllers['registeredCreditHours'],
                              icon: const Icon(
                                Icons.library_books,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Max Credit Hours Allowed',
                              controller: controllers['maxCreditHours'],
                              icon: const Icon(
                                Icons.calendar_today,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Completed Credit Hours',
                              controller: controllers['completedCreditHours'],
                              icon: const Icon(
                                Icons.check_circle_outline,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Required Credit Hour',
                              controller: controllers['requiredCreditHours'],
                              icon: const Icon(
                                Icons.assignment_turned_in,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        bool userExists = await User.checkRegisterUserExist(
                            controllers['id']!.text);
                        if (userExists) {
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Error"),
                              content: const Text("User Already Registered"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                          controllers['id']!.clear();
                        } else {
                          bool userAdd = await User.addUser(
                            // ignore: use_build_context_synchronously
                            context,
                            controllers['username']!.text,
                            controllers['id']!.text,
                            controllers['password']!.text,
                            controllers['email']!.text,
                            controllers['contactnumber']!.text,
                            controllers['program']!.text,
                            controllers['semester']!.text,
                            controllers['programLevel']!.text,
                            controllers['batch']!.text,
                            controllers['cgpa']!.text,
                            controllers['maxCreditHours']!.text,
                            controllers['registeredCreditHours']!.text,
                            controllers['completedCreditHours']!.text,
                            controllers['requiredCreditHours']!.text,
                          );
                          if (userAdd) {
                            clearAllControllers();
                            showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) => AlertDialog(
                                title:
                                    const Text("User Registered Successfully"),
                                content: const Text("Please Login To Continue"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      } else {
                        // If the form is invalid, show an error
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please fill out all fields correctly.')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 55, 154, 235),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 55, 154, 235),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      "Back to Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isNumber;
  final Icon? icon;

  // ignore: use_super_parameters
  const CustomTextField({
    Key? key,
    required this.label,
    this.controller,
    this.isNumber = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          prefixIcon: icon,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 167, 165, 165),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          if (isNumber && double.tryParse(value) == null) {
            return '$label must be a number';
          }
          return null;
        },
      ),
    );
  }
}
