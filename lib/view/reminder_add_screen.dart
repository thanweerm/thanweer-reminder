import 'package:flutter/material.dart';
import 'package:reminder_app/view/constants.dart';
import 'package:reminder_app/view/widgets/input_field.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:reminder_app/view/widgets/roundbutton.dart';

class ReminderAddScreen extends StatelessWidget {
  const ReminderAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Set a Reminder',
          style: kAppbarTitle,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              label: 'Alert Text',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DateTimePicker(
                decoration: kTextFieldDecoration,
                initialValue: '',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DateTimePicker(
                decoration: kTextFieldDecoration.copyWith(
                    suffixIcon: Icon(Icons.access_time),
                    labelText: 'Pick a Time'),
                initialValue: '',
                locale: Locale('pt', 'BR'),
                type: DateTimePickerType.time,
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            RoundButton(
              text: 'Set an Alert',
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
