import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:newproject/Models/IndustryModel.dart';
import 'package:newproject/constants/config.dart';
import 'package:http/http.dart' as http;

class PersonalDataController extends GetxController {
  IndustryModel? _industryModel;
  IndustryModel? get industryModel => _industryModel;
  Future fetchIndustries(BuildContext context) async {
    try {
      //parse url
      final rsp = await http.get(Uri.parse(AppConstants.baseUrl));
      if (rsp.statusCode == 200) {
        //store map in a list using jsondecode
        final responseMap = jsonDecode(rsp.body);
        _industryModel = IndustryModel.fromJson(responseMap);
      } else if (rsp.statusCode == 401) {
        debugPrint('error 401');
        update();
      }
    } catch (e) {
      debugPrint('Error fetching result : $e');
      update();
    }
  }
}
