// Services

import 'key_value_storage_base.dart';

/// A service class for providing methods to store and retrieve key-value data
/// from common or secure storage.
class KeyValueStorageService {
  /// The name of auth token key
  static const _authTokenKey = 'authToken';

  /// The name of user password key
  static const _authPasswordKey = 'authPasswordKey';


  /// Instance of key-value storage base class
  final _keyValueStorage = KeyValueStorageBase();

  // /// Returns last authenticated user
  String getSharedPref(String key) {
    final db = _keyValueStorage.getCommon<String>(key);
   
    return db ??"tk";
  }

  // /// Sets the authenticated user to this value. Even though this method is
  // /// asynchronous, we don't care about it's completion which is why we don't
  // /// use `await` and let it execute in the background.
  void setShared(String key,String value) {
    _keyValueStorage.setCommon(key, value);
  }

  /// Returns logged in user password
  Future<String> getCityId() async {
    return await _keyValueStorage.getEncrypted(_authPasswordKey) ?? '';
  }

  /// Returns last authentication token
  Future<String> getAuthToken(String key) async {
    
    return await _keyValueStorage.getEncrypted(key) ?? '';
  }

  /// Sets the authentication password to this value. Even though this method is
  /// asynchronous, we don't care about it's completion which is why we don't
  /// use `await` and let it execute in the background.
  void setCityID(String password) {
    _keyValueStorage.setEncrypted(_authPasswordKey, password);
  }

  /// Sets the authentication token to this value. Even though this method is
  /// asynchronous, we don't care about it's completion which is why we don't
  /// use `await` and let it execute in the background.
  void setAuthToken(String key,String token) {
    _keyValueStorage.setEncrypted(key, token.toString());
  }

  /// Resets the authentication. Even though these methods are asynchronous, we
  /// don't care about their completion which is why we don't use `await` and
  /// let them execute in the background.
  void resetKeys() {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}
