class UserModel {
  final String uid;
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final String gender;

  UserModel({
    required this.uid,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.gender,
  });

  // Convert UserModel to a Map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'profilePicture': profilePicture,
      'gender': gender,
    };
  }

  // Create a UserModel instance from a Map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      gender: json['gender'] ?? '',
    );
  }
}
