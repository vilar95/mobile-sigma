// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupportScreenController on _SupportScreenControllerBase, Store {
  late final _$summaryMessageAtom = Atom(
      name: '_SupportScreenControllerBase.summaryMessage', context: context);

  @override
  String get summaryMessage {
    _$summaryMessageAtom.reportRead();
    return super.summaryMessage;
  }

  @override
  set summaryMessage(String value) {
    _$summaryMessageAtom.reportWrite(value, super.summaryMessage, () {
      super.summaryMessage = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_SupportScreenControllerBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_SupportScreenControllerBase.sendMessage', context: context);

  @override
  Future<void> sendMessage(BuildContext context, String message) {
    return _$sendMessageAsyncAction
        .run(() => super.sendMessage(context, message));
  }

  late final _$_SupportScreenControllerBaseActionController =
      ActionController(name: '_SupportScreenControllerBase', context: context);

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_SupportScreenControllerBaseActionController
        .startAction(name: '_SupportScreenControllerBase.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_SupportScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
summaryMessage: ${summaryMessage},
message: ${message}
    ''';
  }
}
