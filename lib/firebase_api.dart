import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;


  Future<void> initNotifications() async {
    // On iOS it shows a dialog
    // in Android  it will return a value indicating
    // whether the app notification are enable/disable by the OS
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken'); // In real app we could save it into DB

  }
}