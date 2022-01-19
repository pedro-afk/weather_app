// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$weatherAtom = Atom(name: '_HomeControllerBase.weather');

  @override
  Weather get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(Weather value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$messageAtom = Atom(name: '_HomeControllerBase.message');

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

  final _$isNightAtom = Atom(name: '_HomeControllerBase.isNight');

  @override
  bool get isNight {
    _$isNightAtom.reportRead();
    return super.isNight;
  }

  @override
  set isNight(bool value) {
    _$isNightAtom.reportWrite(value, super.isNight, () {
      super.isNight = value;
    });
  }

  final _$dateInFullAtom = Atom(name: '_HomeControllerBase.dateInFull');

  @override
  String get dateInFull {
    _$dateInFullAtom.reportRead();
    return super.dateInFull;
  }

  @override
  set dateInFull(String value) {
    _$dateInFullAtom.reportWrite(value, super.dateInFull, () {
      super.dateInFull = value;
    });
  }

  final _$weatherCodeAtom = Atom(name: '_HomeControllerBase.weatherCode');

  @override
  String get weatherCode {
    _$weatherCodeAtom.reportRead();
    return super.weatherCode;
  }

  @override
  set weatherCode(String value) {
    _$weatherCodeAtom.reportWrite(value, super.weatherCode, () {
      super.weatherCode = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMessage(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNightMode(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setNightMode');
    try {
      return super.setNightMode(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weather: ${weather},
isLoading: ${isLoading},
message: ${message},
isNight: ${isNight},
dateInFull: ${dateInFull},
weatherCode: ${weatherCode}
    ''';
  }
}
