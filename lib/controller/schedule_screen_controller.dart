
import 'package:mobx/mobx.dart';
import 'package:sigma/authentication/services/dio_service.dart';

// Inclua a linha abaixo para gerar o código MobX
part 'schedule_screen_controller.g.dart';

class ScheduleScreenController = _ScheduleScreenControllerBase
    with _$ScheduleScreenController;

abstract class _ScheduleScreenControllerBase with Store {
  final dioService = DioService();

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
    String specialityDoctor, 
    int patientId,
    String dateSchedule,
    String hourSchedule,
  ) async {
    try {
      final response = await dioService.postSchedule(
        specialityDoctor,
        1,
        dateSchedule,
        hourSchedule,
      );
      print(response.data);
    } catch (e) {
      print('Failed to add schedule: $e');
      print('Speciality: $specialityDoctor');
      print('Patient ID: $patientId');
      print('Date: $dateSchedule');
      print('Hour: $hourSchedule');
    }
  }

  @action
  void removeSchedule(String schedule) {
    schedules.remove(schedule);
  }

  @computed
  List<String> get allSchedules => schedules.toList();
}
