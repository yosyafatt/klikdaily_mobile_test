import 'package:localstorage/localstorage.dart';
import './../services/localstorage_services.dart';

class LocalStorageRepos {
  LocalStorageRepos(LocalStorageService localStorageService)
      : _localStorageService = localStorageService;

  LocalStorageService _localStorageService;

  Future<dynamic> getStorage(String key) async {
    return await _localStorageService.fetchLocalStorage(key);
  }

  Future<void> saveToStorage(String key, dynamic value) async {
    await _localStorageService.saveToLocalStorage(key, value);
  }

  Future<void> removeFromStorage(String key) async {
    await _localStorageService.removeFromLocalStorage(key);
  }
}
