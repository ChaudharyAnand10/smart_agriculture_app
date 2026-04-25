import 'package:agro_app/features/community_discussion/widgets/doubt_card.dart';
import 'package:agro_app/features/community_discussion/widgets/solution_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiscussionDetailScreen extends StatefulWidget {
  final String doubtId;
  final Map<String, dynamic> data;

  const DiscussionDetailScreen({
    super.key,
    required this.doubtId,
    required this.data,
  });

  @override
  State<DiscussionDetailScreen> createState() => _DiscussionDetailScreenState();
}

class _DiscussionDetailScreenState extends State<DiscussionDetailScreen> {
  TextEditingController solutionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final solutionsStream = FirebaseFirestore.instance
        .collection("doubts")
        .doc(widget.doubtId)
        .collection("solutions")
        .snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text("Discussion")),

      body: Column(
        children: [
          DoubtCard(
            imageUrl: widget.data['imageUrl'],
            question: widget.data['question'],
            description: widget.data['description'],
          ),

          const Divider(),

          // 🔵 SOLUTIONS LIST
          Expanded(
            child: StreamBuilder(
              stream: solutionsStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;

                    return SolutionTile(
                      solution: data['solution'],
                      userName: data['userName'] ?? "User",
                    );
                  },
                );
              },
            ),
          ),

          // 🟢 INPUT BOX (WHATSAPP STYLE)
          Container(
            margin: EdgeInsets.only(bottom: 60),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: solutionController,
                    decoration: const InputDecoration(
                      hintText: "Write solution...",
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: () async {
                    if (solutionController.text.isEmpty) return;

                    String uid = FirebaseAuth.instance.currentUser!.uid;
                    final userDoc = await FirebaseFirestore.instance
                        .collection("users")
                        .doc(uid)
                        .get();

                    String userName = userDoc['name'] ?? "User";

                    await FirebaseFirestore.instance
                        .collection("doubts")
                        .doc(widget.doubtId)
                        .collection("solutions")
                        .add({
                          "solution": solutionController.text,
                          "userId": uid,
                          "userName": userName,
                          "time": DateTime.now(),
                        });

                    solutionController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
