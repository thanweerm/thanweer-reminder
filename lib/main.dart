import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/bloc/reminder_bloc.dart';
import 'package:reminder_app/model/remindermodel.dart';
import 'package:reminder_app/services/networkingservice.dart';
import 'package:reminder_app/view/reminder_add_screen.dart';
import 'package:reminder_app/view/reminderhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReminderBloc()..add(LoadApiEvent()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.white),
        home: ReminderHome(),
        // MultiRepositoryProvider(
        //   providers: [
        //     BlocProvider(
        //       create: (context) => ReminderBloc()..add(LoadReminder()),
        //     )
        //   ],
        //   child: ReminderHome(),
        // )
      ),
    );
  }
}
