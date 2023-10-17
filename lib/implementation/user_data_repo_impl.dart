import 'package:advertising_id/advertising_id.dart';
import 'package:android_play_install_referrer/android_play_install_referrer.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'dart:convert';
import 'package:legendary_buffalo/repositories/user_data_repository.dart';

class UserDataRepoImpl extends UserDataRepository {
  //For calling android native code
  static const platform = MethodChannel('example.com/channel');

  //Returns all user data in a list
  @override
  Future<List<String>> getUserData() async {
    String phoneId = await _getPhoneId();
    String adb = await _getADB();
    String batteryCharge = await _getBatteryCharge();
    print(phoneId);
    print(adb);
    print(batteryCharge);
    return [phoneId, adb, batteryCharge];
  }

  //Returns a phone id
  Future<String> _getPhoneId() async {
    try {
      String phoneId = await AdvertisingId.id(true) ?? 'null';
      return phoneId;
    } on PlatformException catch (e) {
      print(e);
      return 'null';
    } catch (e) {
      return 'null';
    }
  }

  //Checks if developer settings enabled, if yes - returns true else - false
  Future<String> _getADB() async {
    bool adb;
    try {
      adb = await FlutterJailbreakDetection.developerMode;
      return adb.toString();
    } catch (e) {
      adb = true;
      return adb.toString();
    }
  }

  //Returns a battery level
  Future<String> _getBatteryCharge() async {
    int batteryCharge;
    try {
      var battery = Battery();
      batteryCharge = await battery.batteryLevel;
      return batteryCharge.toDouble().toString();
    } catch (e) {
      return '100.0';
    }
  }

  //Returns an Account Id from Install Referrer
  @override
  Future<String> getReferrer() async {
    try {
      ReferrerDetails referrerDetails =
          await AndroidPlayInstallReferrer.installReferrer;
      print('Referrer: ${referrerDetails.installReferrer}');
      List<int> bytes = utf8.encode(referrerDetails.installReferrer!);
      var encodedReferrer = base64Encode(bytes);
      print('Referrer: $encodedReferrer');
      return encodedReferrer;
    } catch (e) {
      return 'null';
    }
  }
}
