import 'package:flutter/material.dart';
import 'package:sharedpref/class.dart';

// ignore: use_key_in_widget_constructors
class CourseFormPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CourseFormPageState createState() => _CourseFormPageState();
}

class _CourseFormPageState extends State<CourseFormPage> {
  String courseType = "Core";
  String mode = "On-Campus";
  final Map<String, TextEditingController> controllers = {
    'id': TextEditingController(),
    'title': TextEditingController(),
    'credithour': TextEditingController(),
    'section': TextEditingController(),
    //'semester': TextEditingController(),
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
                    'Course Registration Form',
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
              flex: 4,
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
                              label: 'Course ID',
                              controller: controllers['id'],
                              icon: const Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Course Name',
                              controller: controllers['title'],
                              icon: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomDropdownField(
                              label: 'Course Type',
                              items: const ['Core', 'Elective'],
                              value: courseType,
                              onChanged: (value) {
                                courseType = value!;
                              },
                              icon: const Icon(
                                Icons.lock,
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
                            CustomDropdownField(
                              label: 'Course Mode',
                              items: const ['On-Campus', 'Off-Campus'],
                              value: mode,
                              onChanged: (value) {
                                mode = value!;
                              },
                              icon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'Section',
                              controller: controllers['section'],
                              icon: const Icon(
                                Icons.group,
                                color: Color.fromARGB(255, 168, 167, 167),
                              ),
                            ),
                            CustomTextField(
                              label: 'CreditHour',
                              controller: controllers['credithour'],
                              icon: const Icon(
                                Icons.lock,
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
                        bool userExists = await User.checkRegisterCourseExist(
                            controllers['id']!.text);
                        if (userExists) {
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Error"),
                              content: const Text("Course Already Registered"),
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
                          bool userAdd = await User.addCourse(
                            // ignore: use_build_context_synchronously
                            context,
                            controllers['id']!.text,
                            controllers['title']!.text,
                            courseType,
                            mode,
                            controllers['section']!.text,
                            controllers['credithour']!.text,
                          );
                          if (userAdd) {
                            clearAllControllers();
                            showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) => AlertDialog(
                                title:
                                    const Text("Course Registered Successfully"),
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
        style: const TextStyle(color: Colors.black),
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

class CustomDropdownField extends StatelessWidget {
  final String label;
  final Icon? icon;
  final List<String> items;
  final String? value;
  final Function(String?)? onChanged;

  // ignore: use_super_parameters
  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.items,
    this.value,
    this.onChanged,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: DropdownButtonFormField<String>(
        style: const TextStyle(color: Colors.black),
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
        value: value,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
