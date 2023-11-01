import 'package:fcm_example/main.dart';
import 'package:fcm_example/notification_screen.dart';
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

    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if(message == null) return;

    navigatorKey.currentState?.pushNamed(
        NotificationScreen.route,
        arguments: message
    );
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}