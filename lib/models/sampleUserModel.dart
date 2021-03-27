import 'package:equatable/equatable.dart';

class SampleUserModel extends Equatable {
  final int userID;
  final int id;
  final String title;
  final String body;

  SampleUserModel({
    this.userID,
    this.id,
    this.title,
    this.body,
  });

  @override
  List<Object> get props => [userID, id, title, body];

  static sampleUserModelFromJSon(dynamic json) {
    return SampleUserModel(
      userID: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
  
  @override
  String toString() {
    return "$userID";
  }
}
