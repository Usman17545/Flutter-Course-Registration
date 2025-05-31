import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'class.dart';

class RegisteredCourses extends StatefulWidget {
  final String id;
  const RegisteredCourses({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<RegisteredCourses> createState() => _RegisteredCoursesState();
}

class _RegisteredCoursesState extends State<RegisteredCourses> {
  List<String> courseIds = [];
  Future<void> get() async {
    try {
      List<Map<String, dynamic>> enrollmentData =
      await User.getEnrollmentsByUserId(widget.id);
      if (enrollmentData != null) {
        print("Enrollment Data: $enrollmentData");
        setState(() {
          courseIds = enrollmentData.map((enrollment) => enrollment['courseId'] as String).toList();
        });
      } else {
        print("Error: Failed to fetch user data.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<bool> deleteEnrollment(String userId, String courseId) async {
    try {
      CollectionReference enrollments = FirebaseFirestore.instance.collection('enrollments');
      QuerySnapshot querySnapshot = await enrollments
          .where('userId', isEqualTo: userId)
          .where('courseId', isEqualTo: courseId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.delete();
        print("Enrollment with userId: $userId and courseId: $courseId deleted successfully.");
        return true;
      } else {
        print("No document found with userId: $userId and courseId: $courseId.");
        return false;
      }
    } catch (e) {
      print("Error deleting enrollment: $e");
      return false;
    }
  }


  @override
  void initState() {
    super.initState();
    get(); // Automatically fetch user data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Courses'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/123.jpg"), fit: BoxFit.cover),
            ),
          ),
          // Check if the courseIds list is empty
          courseIds.isEmpty
              ? const Center(
            child: Text(
              'You have not registered for any courses.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
              : StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('courses')
                .where('id', whereIn: courseIds)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong.'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text(
                      'No courses available.',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ));
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
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text("Course ID: ${course['id']}",
                                  style:
                                  const TextStyle(color: Colors.white)),
                              Text("Course Type: ${course['type']}",
                                  style:
                                  const TextStyle(color: Colors.white)),
                              Text("Mode: ${course['mode']}",
                                  style:
                                  const TextStyle(color: Colors.white)),
                              Text(
                                  "Credit Hour: ${course['credithour']}",
                                  style:
                                  const TextStyle(color: Colors.white)),
                              Text("Section: ${course['section']}",
                                  style:
                                  const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            bool success = await deleteEnrollment(widget.id,course['id']);
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Enrollment deleted successfully!")),
                              );
                              await get();
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Failed to delete enrollment. Please try again.")),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.red, // Red for dropping courses
                          ),
                          child: const Text(
                            'Drop',
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
