// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on _GameStoreBase, Store {
  final _$isRunningAtom = Atom(name: '_GameStoreBase.isRunning');

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  final _$_GameStoreBaseActionController =
      ActionController(name: '_GameStoreBase');

  @override
  dynamic run() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.run');
    try {
      return super.run();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stop() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.stop');
    try {
      return super.stop();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRunning: ${isRunning}
    ''';
  }
}
