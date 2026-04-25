class DiscussionModel {
  String id;
  String userId;
  String userName;
  String imageUrl;
  String question;
  String description;

  DiscussionModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.imageUrl,
    required this.question,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "userName": userName,
      "imageUrl": imageUrl,
      "question": question,
      "description": description,
    };
  }

  factory DiscussionModel.fromMap(Map<String, dynamic> map) {
    return DiscussionModel(
      id: map["id"],
      userId: map["userId"],
      userName: map["userName"],
      imageUrl: map["imageUrl"],
      question: map["question"],
      description: map["description"],
    );
  }
}