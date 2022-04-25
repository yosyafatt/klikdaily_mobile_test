import 'package:localstorage/localstorage.dart';

class LocalStorageService {
  final LocalStorage _localStorage;

  LocalStorageService(String storageKey)
      : _localStorage = LocalStorage(storageKey);

  Future fetchLocalStorage(String key) async {
    await _localStorage.ready;
    return _localStorage.getItem(key);
  }

  Future<void> saveToLocalStorage(String key, dynamic value) async {
    await _localStorage.ready;
    return _localStorage.setItem(key, value);
  }

  Future<void> removeFromLocalStorage(String key) async {
    await _localStorage.ready;
    return _localStorage.deleteItem(key);
  }
}
