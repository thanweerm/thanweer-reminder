import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:reminder_app/model/remindermodel.dart';

List<Reminder> reminderList = [];

class NetworkingService {
  Future getData() async {
    String token = '48|vDnkVIDZPZgXYDV1m9o4R0AKiaLujRVSkxI9ZXPm';
    final response = await post(
        Uri.parse(
          'https://dev.boq.wireandswitch.com/api/list_reminder?page_no=0',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token ',
        });
    String responseData = response.body.toString();
    var jsonData = jsonDecode(responseData); //check response string
    // if(jsonData['success']) {
    var data = jsonData['data']; //based on response string give array name

    reminderList = List<Reminder>.from(data.map((x) => Reminder.fromJson(x)));
    // print(reminderList);
    return data;
  }
}
