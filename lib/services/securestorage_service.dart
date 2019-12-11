import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';


class KeyType{

  static final String FIRETOKEN = 'firetoken';
  static final String APPPATH = 'apppath';

}


class SecureStorageService {

  static final _storage = new FlutterSecureStorage();

  static Future printKey(String keyType) async {

    String value  = await _storage.read(key: keyType);

    if (value == null){
      print(keyType + ": EMPTY");
    } else {
      print(keyType + ":" + await _storage.read(key: keyType));
    }
  }

  static Future readKey(String keyType) async {
    return await _storage.read(key: keyType);
  }

  static Future writeKey(String keyType, String value) async {
    await _storage.write(key: keyType, value: value);
  }

}