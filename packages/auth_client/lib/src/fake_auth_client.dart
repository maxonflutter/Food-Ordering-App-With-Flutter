import 'dart:async';

import 'package:auth_client/auth_client.dart';
import 'package:core/entities.dart';
import 'package:core/value_objects.dart';
import 'package:flutter/foundation.dart';

class FakeAuthClient implements AuthClient {
  User? _currentUser;
  final Map<String, User> _users = {};

  final StreamController<User?> _authStateController =
      StreamController<User?>.broadcast();

  @override
  Stream<User?> get authStateChanges => _authStateController.stream;

  @override
  User? get currentUser => _currentUser;

  @override
  Stream<String?> get idToken => Stream.value('fake_id_token');

  @override
  Future<String?> refreshIdToken() {
    return Future.value('fake_refresh_id_token');
  }

  @override
  Future<User?> register({
    required String email,
    required String password,
  }) async {
    debugPrint('FakeAuthClient: register');

    // Check if user already exists
    if (_users.containsKey(email)) {
      throw RegisterWithEmailAndPasswordFailure.fromCode(
        'email-already-in-use',
      );
    }

    if (password.length < 6) {
      throw RegisterWithEmailAndPasswordFailure.fromCode('weak-password');
    }

    final now = DateTime.now();
    // Simulate user registration with a fake user
    var newUser = User(
      id: now.millisecondsSinceEpoch.toString(),
      email: Email((e) => e.value = email),
      createdAt: DateTime.now(),
    );
    _users[email] = newUser;
    _currentUser = newUser;
    _authStateController.add(_currentUser);
    return _currentUser;
  }

  @override
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    debugPrint('FakeAuthClient: login');
    // Simulate user login
    var user = _users[email];

    if (user != null) {
      _currentUser = user;
      _authStateController.add(_currentUser);
      return _currentUser;
    } else {
      throw LoginWithEmailAndPasswordFailure.fromCode('user-not-found');
    }
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
    _authStateController.add(_currentUser);
  }

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  void dispose() {
    _authStateController.close();
  }

  @override
  Future<void> loginWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId, int? forceResendingToken) codeSent,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<User?> verifyOTP(
    String verificationId,
    String smsCode,
  ) async {
    throw UnimplementedError();
  }
}
