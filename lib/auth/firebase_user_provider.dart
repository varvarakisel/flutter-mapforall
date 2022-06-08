import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MapForAllFirebaseUser {
  MapForAllFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

MapForAllFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MapForAllFirebaseUser> mapForAllFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MapForAllFirebaseUser>(
        (user) => currentUser = MapForAllFirebaseUser(user));
