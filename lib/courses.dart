import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoursesScreen extends StatelessWidget {
  final String userId;

  const CoursesScreen({Key? key, required this.userId}) : super(key: key);
  Future<bool> enrollInCourse(String courseId) async {
    try {
      final existingEnrollment = await FirebaseFirestore.instance
          .collection('enrollments')
          .where('userId', isEqualTo: userId)
          .where('courseId', isEqualTo: courseId)
          .get();

      if (existingEnrollment.docs.isNotEmpty) {
        return false;
      } else {
        await FirebaseFirestore.instance.collection('enrollments').add({
          'userId': userId,
          'courseId': courseId,
          'timestamp': FieldValue.serverTimestamp(),
        });
        return true;
      }
    } catch (e) {
      print("Error enrolling in course: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Courses'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/123.jpg"), fit: BoxFit.cover),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('courses').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong.'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No courses available.'));
              }

              final courses = snapshot.data!.docs;

              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(120, 3, 26, 70),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title: ${course['title']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text("Course ID: ${course['id']}"),
                              Text("Course Type: ${course['type']}"),
                              Text("Mode: ${course['mode']}"),
                              Text("Credit Hour: ${course['credithour']}"),
                              Text("Section: ${course['section']}"),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final success = await enrollInCourse(course['id']);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(success
                                    ? "Course Registered Successfully"
                                    : "Failed to Add Course"),
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
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Green color
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
