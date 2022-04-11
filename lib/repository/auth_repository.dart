import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUserWithMobileNumber({
    required String phoneNumber,
    required Function(FirebaseAuthException e)
        verificationFailedCallback,
    required Function(User user) verificationCompletedCallBack,
    required Function(String verificationId) codeSentCallBack,
    required Function(String verificationId) codeAutoRetrivalTimeout,
  }) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted:
            (PhoneAuthCredential credential) async {
          try {
            final authResult =
                await _auth.signInWithCredential(credential);

            if (authResult.user != null) {
              verificationCompletedCallBack(authResult.user!);
            }
          } catch (e) {}
        },
        verificationFailed: verificationFailedCallback,
        codeSent: (String verificationId, int? forceResendingToken) {
          codeSentCallBack(verificationId);
        },
        codeAutoRetrievalTimeout: codeAutoRetrivalTimeout);
  }
}
