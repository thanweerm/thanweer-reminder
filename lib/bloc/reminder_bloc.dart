import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:reminder_app/services/networkingservice.dart';

import '../model/remindermodel.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  // final NetworkingService _dataService;
  // ReminderBloc(this._dataService) : super(ReminderLoadingState()) {
  ReminderBloc() : super(ReminderLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      final data = await NetworkingService().getData();
      emit(ReminderLoadedState());

      // emit(ReminderLoadedState(
      //     data.alertText, data.reminderDate, data.reminderTime));
    });
    on<LoadReminder>(_onLoadReminder);
    on<AddReminder>(_onAddReminder);
    on<UpdateReminder>(_onUpdateReminder);
    on<DeleteReminder>(_onDeleteReminder);
  }
  void _onLoadReminder(LoadReminder event, Emitter<ReminderState> emit) {
    emit(
      ReminderLoadedState(reminderList: event.reminderList),
    );
  }

  void _onAddReminder(AddReminder event, Emitter<ReminderState> emit) {}
  void _onUpdateReminder(UpdateReminder event, Emitter<ReminderState> emit) {}
  void _onDeleteReminder(DeleteReminder event, Emitter<ReminderState> emit) {}
}
