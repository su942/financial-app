import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final String? phoneNumber;
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final DateTime joinedDate;

  UserProfile({
    required this.uid,
    this.phoneNumber,
    this.displayName,
    this.email,
    this.photoUrl,
    required this.joinedDate,
  });

  factory UserProfile.fromMap(Map<String, dynamic> data, String uid) {
    return UserProfile(
      uid: uid,
      phoneNumber: data['phoneNumber'],
      displayName: data['displayName'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      joinedDate: (data['joinedDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'joinedDate': Timestamp.fromDate(joinedDate),
    };
  }
}
