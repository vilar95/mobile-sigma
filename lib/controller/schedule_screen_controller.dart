// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/screens/widgets/show_confirm_schecule_dialog.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';
import 'package:sigma/services/dio_service.dart';

part 'schedule_screen_controller.g.dart';

class ScheduleScreenController = _ScheduleScreenControllerBase
    with _$ScheduleScreenController;

abstract class _ScheduleScreenControllerBase with Store {
  final dioService = DioService();



  _ScheduleScreenControllerBase() {
    final prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      patientId = value.getInt('id');
    });
  }

  @observable
  int? patientId;

  @observable
  DateTime dateSchedule = DateTime.now();

  @observable
  String dateScheduleString = '';

  @observable
  DateTime hourSchedule = DateTime.now();

  @observable
  String hourScheduleString = '';

  @observable
  String? specialityDoctor = '';

  @observable
  ObservableList<String> schedules = ObservableList<String>();

  @action
  Future<void> addSchedule(
    BuildContext context,
    String specialityDoctor,
    int patientId,
    String dateSchedule,
    String hourSchedule,
  ) async {
    try {
      final response = await dioService.postSchedule(
        specialityDoctor,
        patientId,
        dateSchedule,
        hourSchedule,
      );
      showConfirmScheculeDialog(context: context);
    } catch (e) {
      showCustomSnackBar(
          context: context,
          message: 'Não foi possível agendar a consulta.',
          duration: const Duration(seconds: 5));
          
    }
  }

  @action
  void removeSchedule(String schedule) {
    schedules.remove(schedule);
  }

  @computed
  List<String> get allSchedules => schedules.toList();
}
