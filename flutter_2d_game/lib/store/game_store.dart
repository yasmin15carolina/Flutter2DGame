import 'package:mobx/mobx.dart';
part 'game_store.g.dart';

class GameStore = _GameStoreBase with _$GameStore;

abstract class _GameStoreBase with Store {
  @observable
  bool isRunning = false;
  @observable
  int above = -1;

  @action
  run() {
    isRunning = true;
  }

  @action
  stop() {
    isRunning = false;
  }

  @observable
  bool isAbove = false;

  @action
  jumpAbove(int index) {
    isAbove = true;
    above = index;
  }

  @action
  jumpDown() {
    isAbove = false;
    above = -1;
  }
}
