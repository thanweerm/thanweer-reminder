part of 'reminder_bloc.dart';

abstract class ReminderEvent extends Equatable {
  const ReminderEvent();
  @override
  List<Object> get props => [];
}

class LoadApiEvent extends ReminderEvent {}

class LoadReminder extends ReminderEvent {
  final List<Reminder> reminderList;

  const LoadReminder({this.reminderList = const <Reminder>[]});
  @override
  List<Object> get props => [reminderList];
}

class AddReminder extends ReminderEvent {
  final Reminder reminderList;

  const AddReminder({required this.reminderList});
  @override
  List<Object> get props => [reminderList];
}

class UpdateReminder extends ReminderEvent {
  final Reminder? reminderList;

  const UpdateReminder({this.reminderList});
  @override
  List<Object> get props => [reminderList!];
}

class DeleteReminder extends ReminderEvent {
  final Reminder? reminderList;

  const DeleteReminder({this.reminderList});
  @override
  List<Object> get props => [reminderList!];
}
