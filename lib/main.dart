import 'package:provider/provider.dart';
import 'package:sharedpref/class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sharedpref/homepage.dart';
import 'package:sharedpref/signup_page.dart';
import 'firebase_options.dart';
import 'package:sharedpref/courseregister.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Provider1()),
        ChangeNotifierProvider(create: (context) => Provider2()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Loginpage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 109, 175, 236),
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/456.png"),
                  fit: BoxFit.contain)),
        ),
      ),
    );
  }
}

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final String studentadminname = "student_admin.usman@gmail.com";
  final String studentadminpass = "usman123";
  final String courseadminname = "course_admin.usman@gmail.com";
  final String courseadminpass = "usman123";
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/123.jpg"), fit: BoxFit.cover),
        ),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 50, top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME TO",
                      style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 12, 12, 12),
                          letterSpacing: 2.0),
                    ),
                    Text(
                      "UMT PORTAL.",
                      style: TextStyle(
                          fontSize: 60,
                          color: Color.fromARGB(255, 17, 17, 17),
                          letterSpacing: 2.0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(120, 3, 26, 70),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "WELCOME BACK",
                        style: TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 248, 247, 247),
                            letterSpacing: 2.0),
                      ),
                      const Row(
                        children: [
                          Text(
                            "Don't Have An Account,",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 248, 247, 247),
                                letterSpacing: 2.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        cursorColor: Colors.white,
                        controller: id,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            prefixIcon: Icon(Icons.mail,
                                color: Color.fromARGB(255, 168, 167, 167)),
                            labelText: "Enter Your ID",
                            labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 168, 167, 167))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<Provider1>(builder: (context, provider1, child) {
                        return TextFormField(
                          cursorColor: Colors.white,
                          controller: password,
                          style: const TextStyle(color: Colors.white),
                          obscureText: provider1.obs,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              suffixIcon: IconButton(
                                  color:
                                      const Color.fromARGB(255, 168, 167, 167),
                                  onPressed: () {
                                    provider1.setvalue();
                                  },
                                  icon: Icon(provider1.obs
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              prefixIcon: const Icon(Icons.lock,
                                  color: Color.fromARGB(255, 168, 167, 167)),
                              labelText: "Enter Password",
                              labelStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 173, 173, 173))),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<Provider2>(builder: (context, provider2, child) {
                        return TextFormField(
                          cursorColor: Colors.white,
                          controller: confirmpassword,
                          style: const TextStyle(color: Colors.white),
                          obscureText: provider2.obs,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              suffixIcon: IconButton(
                                  color:
                                      const Color.fromARGB(255, 168, 167, 167),
                                  onPressed: () {
                                    provider2.setvalue();
                                  },
                                  icon: Icon(provider2.obs
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              prefixIcon: const Icon(Icons.lock,
                                  color: Color.fromARGB(255, 168, 167, 167)),
                              labelText: "Confirm Password",
                              labelStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 173, 173, 173))),
                        );
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: const Size(70, 50),
                              ),
                              onPressed: checkPasswordConfirmMatch,
                              child: const Text(
                                "Sign In",
                                style: TextStyle(color: Colors.black),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkPasswordConfirmMatch() async {
    if (password.text.isNotEmpty &&
        confirmpassword.text.isNotEmpty &&
        id.text.isNotEmpty) {
      if (password.text == confirmpassword.text) {
        if (id.text == studentadminname && password.text == studentadminpass) {
          password.clear();
          confirmpassword.clear();
          id.clear();
          Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) => StudentFormPage()));
        } else if (id.text == courseadminname &&
            password.text == courseadminpass) {
          password.clear();
          confirmpassword.clear();
          id.clear();
          Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) => CourseFormPage()));
        } else if (await User.checkUserExist(id.text, password.text)) {
            password.clear();
            confirmpassword.clear();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage(id: id.text.toLowerCase()),
              ),
            );
        } else {
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: const Text("User Not Found."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
          password.clear();
          confirmpassword.clear();
          id.clear();
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: const Text("Passwords Not Matched"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
        password.clear();
        confirmpassword.clear();
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Some Fields Are Missing"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
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

  @override
  void dispose() {
    password.dispose();
    confirmpassword.dispose();
    id.dispose();
    super.dispose();
  }
}
