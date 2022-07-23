part of 'reminder_bloc.dart';

abstract class ReminderState extends Equatable {
  const ReminderState();
  @override
  List<Object> get props => [];
}

class ReminderLoadingState extends ReminderState {}

class ReminderLoadedState extends ReminderState {
  final String? alertText;
  final String? reminderDate;
  final String? reminderTime;
  final List<Reminder> reminderList;

  ReminderLoadedState(
      {this.alertText,
      this.reminderDate,
      this.reminderTime,
      this.reminderList = const <Reminder>[]});
  @override
  List<Object> get props => [reminderList];
}
