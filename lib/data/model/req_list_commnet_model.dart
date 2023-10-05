class RequestListCommentModel {
  RequestListCommentModel({
    required this.name,
    required this.email,
    required this.body,
  });

  late String? name;
  late String? email;
  late String? body;

   RequestListCommentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    email = json['email'] as String?;
    body = json['body'] as String?;
   }
}
