// To parse this JSON data, do
//
//     final reminder = reminderFromJson(jsonString);

import 'dart:convert';

Reminder reminderFromJson(String str) => Reminder.fromJson(json.decode(str));

String reminderToJson(Reminder data) => json.encode(data.toJson());

class Reminder {
  Reminder({
    this.id,
    this.alertText,
    this.reminderDate,
    this.reminderTime,
  });

  int? id;
  String? alertText;
  String? reminderDate;
  String? reminderTime;

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
        id: json["id"],
        alertText: json["alert_text"],
        reminderDate: json["reminder_date"],
        reminderTime: json["reminder_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alert_text": alertText,
        "reminder_date": reminderDate,
        "reminder_time": reminderTime,
      };
}
