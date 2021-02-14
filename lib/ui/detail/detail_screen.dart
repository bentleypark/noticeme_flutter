import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/resources/const.dart';
import 'package:noticemeflutter/ui/detail/detail_controller.dart';
import 'package:noticemeflutter/widget/add_custom_consumable_app_bar.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';
import 'package:noticemeflutter/widget/noticeme_text_widget.dart';
import 'package:noticemeflutter/widget/toggle_button_group_widget.dart';

class DetailScreen extends StatelessWidget {
  UserConsumableEntity item = Get.arguments;
  final durationController = TextEditingController();
  DateTime _selectedDate;
  ToggleButtonGroup toggleButtonGroup = ToggleButtonGroup();

  DetailScreen() {
    toggleButtonGroup.setSelectedIndex(item.priority);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddCustomConsumableAppBar(from: 'DetailScreen'),
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR.parseColor(),
      body: Container(
        child: GetBuilder<DetailController>(builder: (controller) {
          return LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget('소모품명'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              color: Colors.white,
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: DETAIL_TEXT_COLOR.parseColor(),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30, right: 180),
                            child: TextField(
                              autofocus: true,
                              controller: durationController
                                ..text = (item.duration / ONE_DAY_MILLISECONDS)
                                    .toStringAsFixed(0),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          HOME_SCREEN_TEXT_COLOR.parseColor(),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: SPLASH_COLOR2.parseColor(),
                                      width: 2.0),
                                ),
                                labelText: '교체주기 입력',
                                labelStyle: TextStyle(
                                  color: HOME_SCREEN_TEXT_COLOR.parseColor(),
                                ),
                                hintText: 'ex) 30',
                                hintStyle: TextStyle(
                                  color: TEXT_FILED_HINT_COLOR.parseColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget('마지막 교체날짜를 선택해주세요'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Center(
                              child: DatePickerWidget(
                                initialDate:
                                    DateTime.fromMillisecondsSinceEpoch(
                                        item.starDate),
                                locale: DatePicker.localeFromString('ko'),
                                pickerTheme: DateTimePickerTheme(
                                    itemTextStyle: TextStyle(
                                        color: Colors.black, fontSize: 19),
                                    dividerColor:
                                        DATE_PICKER_DIVIDER_COLOR.parseColor(),
                                    backgroundColor: Colors.transparent),
                                onChange: (DateTime newDate, _) {
                                  _selectedDate = newDate;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget('우선 순위를 선택해주세요'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: toggleButtonGroup,
                            ),
                          ),
                        ])

                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: 150,
                        //       height: 50,
                        //       child: RaisedButton(
                        //         color: HOME_SCREEN_TEXT_COLOR.parseColor(),
                        //         child: Text(
                        //           '추가하기',
                        //           style: TextStyle(
                        //               fontSize: 20, color: Colors.white),
                        //         ),
                        //         onPressed: () {
                        //           // insert();
                        //           final snackBar = SnackBar(
                        //             content: Text('소모품이 수정되었습니다!'),
                        //           );
                        //           Scaffold.of(context).showSnackBar(snackBar);
                        //
                        //           Future.delayed(const Duration(seconds: 2), () {
                        //             Get.offNamed(Routes.HOME);
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        ),
                  ),
                ]),
              ),
            );
          });
        }),
      ),
    );
  }
}
