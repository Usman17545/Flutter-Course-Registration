import 'package:flutter/material.dart';
import 'package:sharedpref/courses.dart';
import 'package:sharedpref/main.dart';
import 'package:sharedpref/registeredcourses.dart';
import 'chatbot.dart';
import 'class.dart';

class Homepage extends StatefulWidget {
  final String id;
  const Homepage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String username = '';
  String password = '';
  String email = '';
  String contactNumber = '';
  String program = '';
  String semester = '';
  String programLevel = '';
  String batch = '';
  String cgpa = '';
  String maxCreditHours = '';
  String registeredCreditHours = '';
  String completedCreditHours = '';
  String requiredCreditHours = '';
  Future<void> get() async {
    try {
      Map<String, dynamic>? userData = await User.getStudentById(widget.id);
      if (userData != null) {
        setState(() {
          username = userData['username'] ?? '';
          password = userData['password'] ?? '';
          email = userData['email'] ?? '';
          contactNumber = userData['contactNumber'] ?? '';
          program = userData['program'] ?? '';
          semester = userData['semester'] ?? '';
          programLevel = userData['programLevel'] ?? '';
          batch = userData['batch'] ?? '';
          cgpa = userData['cgpa'] ?? '';
          maxCreditHours = userData['maxCreditHours'] ?? '';
          registeredCreditHours = userData['registeredCreditHours'] ?? '';
          completedCreditHours = userData['completedCreditHours'] ?? '';
          requiredCreditHours = userData['requiredCreditHours'] ?? '';
        });
      } else {
        print("Error: Failed to fetch user data.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 238, 235, 236),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 7, left: 7),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 100,
                          child: Image.asset("assets/images/456.png")),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(id: widget.id),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.dashboard,
                                color: Color.fromARGB(255, 88, 87, 87), // Set icon color
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Dashboard",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 231, 229, 229),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                       const SizedBox(
                        height: 30,
                      ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursesScreen(userId: widget.id,),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.dashboard,
                        color: Color.fromARGB(255, 88, 87, 87), // Set icon color
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Add Courses",
                        style: TextStyle(
                          color: Color.fromARGB(255, 231, 229, 229),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisteredCourses(id: widget.id,),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.dashboard,
                                color: Color.fromARGB(255, 88, 87, 87), // Set icon color
                              ),
                              SizedBox(width: 8),
                              Text(
                                "My Courses",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 231, 229, 229),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyChatApp(id: widget.id,),
                            ),
                          );
                        },
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.dashboard,
                                  color: Color.fromARGB(
                                      255, 88, 87, 87), // Set icon color
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Chat With Us",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 231, 229, 229),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 7, left: 3, right: 3),
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Text(
                          "Annoucements",
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 160, 240),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Loginpage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            "LOG OUT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 3, right: 3),
                    color: const Color.fromARGB(255, 247, 247, 241),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 60, bottom: 30),
                            child: Text(
                              "STUDENT ACADEMIC DETAIL",
                              style: TextStyle(
                                color: Color.fromARGB(255, 34, 5, 116),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            margin:
                                const EdgeInsets.only(left: 10, right: 10),
                            height: 150,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Name\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Student Name',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 60),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$username",
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Semester\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Current',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 20),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$semester",
                                                  style: const TextStyle(
                                                    color: Colors.yellow,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Program\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Enrolled',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 60),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$program",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Program Level\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Current',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 20),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$programLevel",
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            margin:
                                const EdgeInsets.only(left: 10, right: 10),
                            height: 150,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Batch\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Student Batch',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 60),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$batch",
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Credit Hours\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Maximum Allowed',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 20),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$maxCreditHours",
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Completed Credit Hours\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Total Earned',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 20),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$completedCreditHours",
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'CGPA\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Earned',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 60),
                                                child:Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$cgpa",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 3),
                                                child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Credit Hours\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Registered+Requested',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 20),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$registeredCreditHours",
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: const Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Required Credit Hours\n',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'For Degree Completion',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 7, right: 20),
                                                child: Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  "$requiredCreditHours",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}