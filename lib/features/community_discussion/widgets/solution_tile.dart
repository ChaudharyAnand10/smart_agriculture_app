import 'package:flutter/material.dart';

class SolutionTile extends StatelessWidget {
  final String solution;
  final String userName;

  const SolutionTile({
    super.key,
    required this.solution,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 👤 AVATAR
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Text(
              userName.isNotEmpty
                  ? userName[0].toUpperCase()
                  : "U",
              style: const TextStyle(color: Colors.white),
            ),
          ),

          const SizedBox(width: 10),

          // 📝 CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  solution,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}