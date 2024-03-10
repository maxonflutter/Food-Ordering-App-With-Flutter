import 'package:core/entities.dart';

abstract class AuthClient {
  Stream<User?> get authStateChanges;
  User? get currentUser;

  // Tokens
  Stream<String?> get idToken;
  Future<String?> refreshIdToken();

  // Login with email and password
  Future<User?> register({
    required String email,
    required String password,
  });
  Future<User?> login({required String email, required String password});

  // Social Logins
  Future<void> loginWithApple();
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();

  // Phone Number
  Future<void> loginWithPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId, int? forceResendingToken) codeSent,
  });
  Future<User?> verifyOTP(String verificationId, String smsCode);

  // Logout and delete account
  Future<void> logout();
  Future<void> deleteAccount();
}

class RegisterWithEmailAndPasswordFailure implements Exception {
  final String message;

  const RegisterWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory RegisterWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const RegisterWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const RegisterWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const RegisterWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const RegisterWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const RegisterWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const RegisterWithEmailAndPasswordFailure();
    }
  }
}

class LoginWithEmailAndPasswordFailure implements Exception {
  final String message;

  const LoginWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LoginWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LoginWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LoginWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LoginWithEmailAndPasswordFailure();
    }
  }
}

class LoginWithPhonenNumberFailure implements Exception {
  final String message;

  const LoginWithPhonenNumberFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LoginWithPhonenNumberFailure.fromCode(String code) {
    switch (code) {
      case 'user-disabled':
        return const LoginWithPhonenNumberFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'invalid-verification-code':
        return const LoginWithPhonenNumberFailure(
          'The verification code of the credential is not valid.',
        );

      case 'invalid-verification-id':
        return const LoginWithPhonenNumberFailure(
          'The verification ID of the credential is not valid.id.',
        );
      default:
        return const LoginWithPhonenNumberFailure();
    }
  }
}

class LoginWithAppleFailure implements Exception {
  final Object error;

  const LoginWithAppleFailure(this.error);
}

class LoginWithGoogleFailure implements Exception {
  final Object error;

  const LoginWithGoogleFailure(this.error);
}

class LoginWithGoogleCanceled implements Exception {
  final Object error;

  const LoginWithGoogleCanceled(this.error);
}

class LoginWithFacebookFailure implements Exception {
  final Object error;

  const LoginWithFacebookFailure(this.error);
}

class LoginWithFacebookCanceled implements Exception {
  final Object error;

  const LoginWithFacebookCanceled(this.error);
}
