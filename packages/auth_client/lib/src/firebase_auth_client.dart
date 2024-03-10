import 'package:auth_client/auth_client.dart';
import 'package:core/entities.dart';
import 'package:core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Signature for [SignInWithApple.getAppleIDCredential].
typedef GetAppleCredentials = Future<AuthorizationCredentialAppleID> Function({
  required List<AppleIDAuthorizationScopes> scopes,
  WebAuthenticationOptions webAuthenticationOptions,
  String nonce,
  String state,
});

class FirebaseAuthClient implements AuthClient {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final GetAppleCredentials _getAppleCredentials;
  final FacebookAuth _facebookAuth;

  FirebaseAuthClient({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    GetAppleCredentials? getAppleCredentials,
    FacebookAuth? facebookAuth,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _getAppleCredentials =
            getAppleCredentials ?? SignInWithApple.getAppleIDCredential,
        _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  @override
  Stream<User?> get authStateChanges => _firebaseAuth
      .authStateChanges()
      .asyncMap((firebaseUser) => firebaseUser?.toUser);

  @override
  User? get currentUser => _firebaseAuth.currentUser?.toUser;

  @override
  Stream<String?> get idToken {
    return _firebaseAuth
        .idTokenChanges()
        .asyncMap((user) => user?.getIdToken());
  }

  @override
  Future<String?> refreshIdToken() async {
    final user = _firebaseAuth.currentUser;
    return user?.getIdToken(true);
  }

  @override
  Future<User?> register({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credentials.user?.toUser;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw RegisterWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const RegisterWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credentials.user?.toUser;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LoginWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LoginWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (err) {
      throw Exception('Error while logging out: $err');
    }
  }

  @override
  Future<void> loginWithApple() async {
    try {
      final appleIdCredential = await _getAppleCredentials(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = firebase_auth.OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LoginWithAppleFailure(error), stackTrace);
    }
  }

  @override
  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw LoginWithGoogleCanceled(
          Exception('Sign in with Google canceled'),
        );
      }
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on LoginWithGoogleCanceled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LoginWithGoogleFailure(error), stackTrace);
    }
  }

  @override
  Future<void> loginWithFacebook() async {
    try {
      final loginResult = await _facebookAuth.login();
      if (loginResult.status == LoginStatus.cancelled) {
        throw LoginWithFacebookCanceled(
          Exception('Sign in with Facebook canceled'),
        );
      } else if (loginResult.status == LoginStatus.failed) {
        throw LoginWithFacebookFailure(
          Exception(loginResult.message),
        );
      }

      final accessToken = loginResult.accessToken?.token;
      if (accessToken == null) {
        throw LoginWithFacebookFailure(
          Exception(
            'Sign in with Facebook failed due to an empty access token',
          ),
        );
      }

      final credential =
          firebase_auth.FacebookAuthProvider.credential(accessToken);

      await _firebaseAuth.signInWithCredential(credential);
    } on LoginWithFacebookCanceled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LoginWithFacebookFailure(error), stackTrace);
    }
  }

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId, int? forceResendingToken) codeSent,
  }) {
    // TODO: implement loginWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<User?> verifyOTP(String verificationId, String smsCode) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(
      id: uid,
      username: (displayName != null)
          ? Username(
              (e) => e.value = displayName,
            )
          : null,
      email: (email != null)
          ? Email(
              (e) => e.value = email,
            )
          : null,
      createdAt: metadata.creationTime ?? DateTime.now(),
    );
  }
}
