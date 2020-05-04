// This imports the Dart Sentry.io client that sends crash reports to Sentry.io.
import 'dart:async';

import 'package:sentry/sentry.dart';

import 'package:business_consultancy/stand_mark_home_screen.dart';
import 'package:business_consultancy/stand_mark_launcher_screen.dart';
import 'package:business_consultancy/stand_mark_login_screen.dart';
import 'package:flutter/material.dart';

/// Sentry.io client used to send crash reports (or more generally "events").

/// This client uses the default client parameters. For example, it uses a plain HTTP client that does not retry failed report attempts and does not support offline mode. You might want to use a different HTTP client, one that has these features. Please read the documentation for the [SentryClient] constructor to learn how you can customize it.

/// [SentryClient.environmentAttributes] are particularly useful in a real app. Use them to specify attributes of your app that do not change from one event to another, such as operating system type and version, the version of Flutter, and [device information][1].

/// [1]:https://github.com/flutter/plugins/tree/master/packages/device_info
final SentryClient _sentry =
    new SentryClient(dsn: 'beff9d168df011ea8cd14201c0a8d02b');

/// Whether the VM is running in debug mode.

/// This is useful to decide whether a report should be sent to sentry. Usually reports from dev mode are not very useful, as these happen on developers' workspaces rather than on users' devices in production.
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

/// Reports [error] along with its [stackTrace] to Sentry.io.
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  // Errors thrown in development mode are unlikely to be interesting. You can check if you are running in dev mode using an assertion and omit sending the report.
  if (isInDebugMode) {
    print(stackTrace);
    print('In dev mode. Not sending report to Sentry.io.');
    return;
  }

  print('Reporting to Sentry.io...');

  final SentryResponse response = await _sentry.captureException(
    exception: error,
    stackTrace: stackTrace,
  );

  if (response.isSuccessful) {
    print('Success! Event ID: ${response.eventId}');
  } else {
    print('Failed to report to Sentry.io: ${response.error}');
  }
}

Future<Null> main() async {
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to Sentry.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  // This creates a [Zone] that contains the Flutter application and stablishes an error handler that captures errors and reports them.

  // Using a zone makes sure that as many errors as possible are captured, including those thrown from [Timer]s, microtasks, I/O, and those forwarded from the `FlutterError` handler.

  // More about zones:
  // - https://api.dartlang.org/stable/1.24.2/dart-async/Zone-class.html
  // - https://www.dartlang.org/articles/libraries/zones
  runZonedGuarded(() {
    runApp(new StandMarkApp());
  }, (Object error, StackTrace stackTrace) {
    _reportError(error, stackTrace);
  });
}

class StandMarkApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
        // This makes the visual density adapt to the platform that you run the app on. For desktop platforms, the controls will be smaller and closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'StandMark Pvt. Ltd.',
      home: StandMarkLauncherScreen(),
      routes: {
        // 'launcher': (context) => StandMarkLauncherScreen(),
        'login': (context) => StandMarkLoginScreen(),
        'home': (context) => StandMarkHomeScreen(),
      },
    );
  }
}
