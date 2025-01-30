import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newproject/Models/IndustryModel.dart';
import 'package:newproject/constants/textStyle.dart';
import 'package:newproject/controller/personal_data_controller.dart';

class interfaceUI extends StatefulWidget {
  const interfaceUI({super.key});

  @override
  State<interfaceUI> createState() => _interfaceUIState();
}

class _interfaceUIState extends State<interfaceUI> {
  final _personalDataController = Get.find<PersonalDataController>();
  String? selectedOption;

  Future <void> _loadIndustries() async{
    await _personalDataController.fetchIndustries(context);
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadIndustries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Getx'),),
      body: GetBuilder(
          init: _personalDataController,
          builder: (personalDataController) {
            final industries = personalDataController.industryModel;
            return Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (industries?.data.isEmpty ?? false) {
                        // Handle the case when the industryList is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No industries available')),
                        );
                        return; // Exit the function early
                      }
                      final button = context.findRenderObject() as RenderBox;
                      final overlay = Overlay.of(context)
                          .context
                          .findRenderObject() as RenderBox;
                      final position =
                          button.localToGlobal(Offset.zero, ancestor: overlay);
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            position.dx, position.dy, position.dx, position.dy),
                        items: industries?.data.map(
                              (item) {
                                return PopupMenuItem(
                                  child: Text(
                                    item.inName,
                                    style: sfMedium.copyWith(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedOption=item.inName;
                                    });
                                  },
                                );
                              },
                            ).toList() ??
                            [],
                      );
                    },
                    child: Container(
                      width: 120,
                      child: Wrap(
                        children: [
                          Text(
                            selectedOption?? '',
                            style: sfMedium.copyWith(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )));
          }),
    );
  }
}
