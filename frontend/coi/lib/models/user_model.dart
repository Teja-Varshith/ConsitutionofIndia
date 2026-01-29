import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String emailId;
  final String profilePictureUrl;
  final int coins;
  final String name;
  UserModel({
    required this.id,
    required this.emailId,
    required this.profilePictureUrl,
    required this.name,
    required this.coins,
  });

  UserModel copyWith({
    String? id,
    String? emailId,
    String? profilePictureUrl,
    String? name,
    int? coins,
  }) {
    return UserModel(
      id: id ?? this.id,
      emailId: emailId ?? this.emailId,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      coins: coins ?? this.coins,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'emailId': emailId,
      'name': name,
      'profilePictureUrl': profilePictureUrl,
      'coins': coins,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      emailId: map['emailId'] as String,
      profilePictureUrl: map['profilePictureUrl'] as String,
      coins: map['coins'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, emailId: $emailId, profilePictureUrl: $profilePictureUrl, coins: $coins, name: $name)';
  }
}
