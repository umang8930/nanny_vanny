// import 'dart:async';
// import 'dart:developer';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   '0', // id
//   'High Importance Notifications', // title
//   importance: Importance.max,
// );
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   // Log the notification response
//   log('notification(${notificationResponse.id}) action tapped: '
//       '${notificationResponse.actionId} with payload: ${notificationResponse.payload}');
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     log('notification action tapped with input: ${notificationResponse.input}');
//   }
//
//   // Handle "Yes" action
//   if (notificationResponse.actionId == 'yes_action') {}
// }
//
// class PushNotificationService {
//   static Future initiateLocalNotification() async {
//     try {
//       await _fcm.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//     } catch (e) {
//       print("log requestPermission fcm : $e");
//     }
//
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const iOS = DarwinInitializationSettings();
//     const initSettings = InitializationSettings(android: android, iOS: iOS);
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initSettings,
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//       onDidReceiveNotificationResponse: (details) {
//         _onSelectNotification(details);
//       },
//     );
//   }
//
//   Future initialise() async {
//     await initiateLocalNotification();
//     FirebaseMessaging.onMessage.listen((event) async {
//       RemoteNotification? notification = event.notification;
//       AndroidNotification? android = event.notification?.android;
//       // AppleNotification? apple = event.notification?.apple;
//       if (notification != null && android != null) {
//         showNotificationWithButton(notification, android);
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       (Map<String, dynamic> message) async => _serialiseAndNavigate(message);
//     });
//   }
//
//   void _serialiseAndNavigate(message) {
//     log("serial mes : $message");
//   }
//
//   static Future<void> _onSelectNotification(
//       NotificationResponse notificationResponse) async {
//     if (notificationResponse != null) {
//       log("Action Id : ${notificationResponse.actionId}");
//       switch (notificationResponse.actionId) {
//         case 'yes_action':
//           print("Press Yes");
//           break;
//         case 'no_action':
//           print("Press No");
//           // Handle "No" action if needed
//           break;
//       }
//     }
//   }
//
//   static showNotificationWithButton(
//       RemoteNotification? notification, AndroidNotification? android) async {
//     await flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification?.title ?? "",
//       notification?.body ?? "",
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           icon: android?.smallIcon,
//           channelDescription: channel.description,
//           priority: Priority.high,
//           importance: Importance.high,
//           // sound: const RawResourceAndroidNotificationSound('notification'),
//           visibility: NotificationVisibility.public,
//           /* actions: <AndroidNotificationAction>[
//             const AndroidNotificationAction(
//               'yes_action', // Unique identifier for the action
//               'Yes',
//               showsUserInterface: true,
//               cancelNotification: false,
//             ),
//             const AndroidNotificationAction(
//               'no_action',
//               'No',
//               showsUserInterface: true,
//               cancelNotification: false,
//             ),
//           ],*/
//           // other properties...
//         ),
//         iOS: const DarwinNotificationDetails(
//             presentAlert: true, presentSound: true, presentBadge: true),
//       ),
//     );
//   }
//
//   static showDefaultNotification(
//       RemoteNotification? notification, AndroidNotification? android) async {
//     await flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification?.title ?? "",
//       notification?.body ?? "",
//       NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             icon: android?.smallIcon,
//             channelDescription: channel.description,
//             visibility: NotificationVisibility.public,
//           ),
//           iOS: const DarwinNotificationDetails(
//               presentAlert: true, presentSound: true, presentBadge: true)),
//     );
//   }
// }
