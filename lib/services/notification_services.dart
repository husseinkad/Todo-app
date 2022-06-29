// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:get/get.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:todo/models/task.dart';
// import 'package:todo/ui/pages/notification_screen.dart';
//
// class NotifyHelper {
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//
//   initializeNotification() async{
//
//
//     tz.initializeTimeZones();
//     final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(timeZoneName));
//
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('appicon');
//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//         requestSoundPermission: false,
//         requestBadgePermission: false,
//         requestAlertPermission: false,
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//         );
//
//     final InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String? payload) async {
//           selectNotification(payload!);
//         });
//   }
//
//   requestAndroidPermissions() {
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//   }
//
//
//
//   displayNotification({required String title, required String body}) async {
//     print("doing test");
//     var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//         'your channel id', 'your channel name', 'your channel description',
//         importance: Importance.max, priority: Priority.high);
//     var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//     var platformChannelSpecifics = new NotificationDetails(
//         android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'You change your theme',
//       'You changed your theme back !',
//       platformChannelSpecifics,
//       payload: 'It could be anything you pass',
//     );
//   }
//
// // int hour, int minutes, Task task
//   scheduledNotification(int hour, int minutes,Task task) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         task.id!,task.title,task.note,
//
//        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//         const NotificationDetails(
//             android: AndroidNotificationDetails('your channel id',
//                 'your channel name', 'your channel description')),
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime);
//
//   }
//
//   Future selectNotification(String payload) async {
//     if (payload != null) {
//       //selectedNotificationPayload = "The best";
//       //selectNotificationSubject.add(payload);
//       print('notification payload: $payload');
//     } else {
//       print("Notification Done");
//     }
//
//     if(payload == 'Theme Changed'){
//       //going nowhere
//     }else{
//       Get.to(()=>NotificationScreen(payload: payload,),);
//     }
//   }
//
//
//
//   Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title!),
//         content: Text(body!),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => NotificationScreen(payload: payload!,),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
