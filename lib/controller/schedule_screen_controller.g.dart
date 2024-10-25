// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduleScreenController on _ScheduleScreenControllerBase, Store {
  Computed<List<String>>? _$allSchedulesComputed;

  @override
  List<String> get allSchedules => (_$allSchedulesComputed ??=
          Computed<List<String>>(() => super.allSchedules,
              name: '_ScheduleScreenControllerBase.allSchedules'))
      .value;

  late final _$dateScheduleAtom = Atom(
      name: '_ScheduleScreenControllerBase.dateSchedule', context: context);

  @override
  DateTime get dateSchedule {
    _$dateScheduleAtom.reportRead();
    return super.dateSchedule;
  }

  @override
  set dateSchedule(DateTime value) {
    _$dateScheduleAtom.reportWrite(value, super.dateSchedule, () {
      super.dateSchedule = value;
    });
  }

  late final _$dateScheduleStringAtom = Atom(
      name: '_ScheduleScreenControllerBase.dateScheduleString',
      context: context);

  @override
  String get dateScheduleString {
    _$dateScheduleStringAtom.reportRead();
    return super.dateScheduleString;
  }

  @override
  set dateScheduleString(String value) {
    _$dateScheduleStringAtom.reportWrite(value, super.dateScheduleString, () {
      super.dateScheduleString = value;
    });
  }

  late final _$hourScheduleAtom = Atom(
      name: '_ScheduleScreenControllerBase.hourSchedule', context: context);

  @override
  DateTime get hourSchedule {
    _$hourScheduleAtom.reportRead();
    return super.hourSchedule;
  }

  @override
  set hourSchedule(DateTime value) {
    _$hourScheduleAtom.reportWrite(value, super.hourSchedule, () {
      super.hourSchedule = value;
    });
  }

  late final _$hourScheduleStringAtom = Atom(
      name: '_ScheduleScreenControllerBase.hourScheduleString',
      context: context);

  @override
  String get hourScheduleString {
    _$hourScheduleStringAtom.reportRead();
    return super.hourScheduleString;
  }

  @override
  set hourScheduleString(String value) {
    _$hourScheduleStringAtom.reportWrite(value, super.hourScheduleString, () {
      super.hourScheduleString = value;
    });
  }

  late final _$specialityDoctorAtom = Atom(
      name: '_ScheduleScreenControllerBase.specialityDoctor', context: context);

  @override
  String? get specialityDoctor {
    _$specialityDoctorAtom.reportRead();
    return super.specialityDoctor;
  }

  @override
  set specialityDoctor(String? value) {
    _$specialityDoctorAtom.reportWrite(value, super.specialityDoctor, () {
      super.specialityDoctor = value;
    });
  }

  late final _$schedulesAtom =
      Atom(name: '_ScheduleScreenControllerBase.schedules', context: context);

  @override
  ObservableList<String> get schedules {
    _$schedulesAtom.reportRead();
    return super.schedules;
  }

  @override
  set schedules(ObservableList<String> value) {
    _$schedulesAtom.reportWrite(value, super.schedules, () {
      super.schedules = value;
    });
  }

  late final _$addScheduleAsyncAction = AsyncAction(
      '_ScheduleScreenControllerBase.addSchedule',
      context: context);

  @override
  Future<void> addSchedule(String specialityDoctor, int patientId,
      String dateSchedule, String hourSchedule) {
    return _$addScheduleAsyncAction.run(() => super
        .addSchedule(specialityDoctor, patientId, dateSchedule, hourSchedule));
  }

  late final _$_ScheduleScreenControllerBaseActionController =
      ActionController(name: '_ScheduleScreenControllerBase', context: context);

  @override
  void removeSchedule(String schedule) {
    final _$actionInfo = _$_ScheduleScreenControllerBaseActionController
        .startAction(name: '_ScheduleScreenControllerBase.removeSchedule');
    try {
      return super.removeSchedule(schedule);
    } finally {
      _$_ScheduleScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateSchedule: ${dateSchedule},
dateScheduleString: ${dateScheduleString},
hourSchedule: ${hourSchedule},
hourScheduleString: ${hourScheduleString},
specialityDoctor: ${specialityDoctor},
schedules: ${schedules},
allSchedules: ${allSchedules}
    ''';
  }
}
