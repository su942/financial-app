import 'package:firebase_auth/firebase_auth.dart';
import '../core/services/profile_service.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ProfileService _profileService = ProfileService();

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  // Phone number verification
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String, int?) onCodeSent,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String) onCodeAutoRetrievalTimeout,
    required Function(PhoneAuthCredential) onVerificationCompleted,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }

  // Sign in with SMS Code
  Future<UserCredential> signInWithSmsCode(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    
    // Create or update user profile on first login
    if (userCredential.user != null) {
      final user = userCredential.user!;
      final existingProfile = await _profileService.getUserProfile(user.uid);
      
      if (existingProfile == null) {
        final newProfile = UserProfile(
          uid: user.uid,
          phoneNumber: user.phoneNumber,
          joinedDate: DateTime.now(),
        );
        await _profileService.createUserProfile(newProfile);
      }
    }
    
    return userCredential;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
