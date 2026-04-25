// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'ask_question_screen.dart';

// class AllDiscussionScreen extends StatefulWidget {
//   const AllDiscussionScreen({super.key});

//   @override
//   State<AllDiscussionScreen> createState() => _AllDiscussionScreenState();
// }

// class _AllDiscussionScreenState extends State<AllDiscussionScreen> {

//   final Stream<QuerySnapshot> doubtsStream =
//       FirebaseFirestore.instance.collection("doubts").snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All Discussions"),
//         backgroundColor: Colors.green,
//       ),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: doubtsStream,
//         builder: (context, snapshot) {

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text("No discussions yet"),
//             );
//           }

//           final docs = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: docs.length,
//             itemBuilder: (context, index) {

//               final data = docs[index].data() as Map<String, dynamic>;

//               return Card(
//                 margin: const EdgeInsets.all(10),
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),

//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [

//                       // 🖼 IMAGE
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(
//                           data['imageUrl'],
//                           height: 180,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),

//                       const SizedBox(height: 10),

//                       // ❓ QUESTION
//                       Text(
//                         data['question'],
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),

//                       const SizedBox(height: 5),

//                       // 📝 DESCRIPTION
//                       Text(
//                         data['description'],
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),

//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: Colors.green,
//         icon: const Icon(Icons.add),
//         label: const Text("Ask Solution"),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => AskQuestionScreen()),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ask_question_screen.dart';
import 'discussion_detail_screen.dart';

class AllDiscussionScreen extends StatefulWidget {
  const AllDiscussionScreen({super.key});

  @override
  State<AllDiscussionScreen> createState() => _AllDiscussionScreenState();
}

class _AllDiscussionScreenState extends State<AllDiscussionScreen> {

  final Stream<QuerySnapshot> doubtsStream =
      FirebaseFirestore.instance.collection("doubts").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Discussions"),
        backgroundColor: Colors.green,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: doubtsStream,
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {

              final data = docs[index].data() as Map<String, dynamic>;

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DiscussionDetailScreen(
                        doubtId: docs[index].id,
                        data: data,
                      ),
                    ),
                  );
                },

                child: Card(
                  margin: const EdgeInsets.all(10),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Stack(
                        children: [

                          Image.network(
                            data['imageUrl'],
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                          Positioned(
                            left: 10,
                            top: 10,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              color: Colors.black54,
                              child: Text(
                                data['userName'] ?? "User",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              data['question'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(data['description']),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add),
        label: const Text("Ask Solution"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AskQuestionScreen()),
          );
        },
      ),
    );
  }
}