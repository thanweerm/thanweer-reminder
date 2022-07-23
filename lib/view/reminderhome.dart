import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reminder_app/bloc/reminder_bloc.dart';

import 'package:reminder_app/services/networkingservice.dart';
import 'package:reminder_app/view/constants.dart';
import 'package:reminder_app/view/reminder_add_screen.dart';

class ReminderHome extends StatelessWidget {
  const ReminderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        // create: (context) => ReminderBloc(
        //   RepositoryProvider.of<NetworkingService>(context),
        // )..add(LoadApiEvent()),
        // child:
        Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Reminders',
          style: kAppbarTitle,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReminderAddScreen()));
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('New Alert')),
                )
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<ReminderBloc, ReminderState>(builder: (context, state) {
        if (state is ReminderLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is ReminderLoadedState) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reminderList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(reminderList[index].alertText.toString()),
                          subtitle: Row(
                            children: [
                              Text(reminderList[index].reminderDate.toString()),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(reminderList[index].reminderTime.toString()),
                            ],
                          ),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons
                                .more_vert), //don't specify icon if you want 3 dot menu
                            color: Colors.white,
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                  value: 0,
                                  child: Column(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<ReminderBloc>()
                                                .add(UpdateReminder());
                                          },
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<ReminderBloc>()
                                                .add(DeleteReminder());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.black87),
                                            ),
                                          )),
                                    ],
                                  )),
                            ],
                            onSelected: (item) => {print(item)},
                          ),
                          // InkWell(
                          //   child: Icon(Icons.more_vert),
                          // ),
                        ),
                      ),
                    )
                  ],
                );
              });
        } else {
          return const Text('Somthing went wrong');
        }
      }),
    );
    // );
  }
}
