import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/ui/add/add_custom_consumable_controller.dart';
import 'package:noticemeflutter/widget/add_custom_consumable_app_bar.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';
import 'package:noticemeflutter/widget/noticeme_text_widget.dart';

class AddCustomConsumableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddCustomConsumableAppBar(),
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR.parseColor(),
      body: Container(
        child: GetBuilder<AddCustomConsumableController>(builder: (controller) {
          return LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 60, left: 30, right: 30),
                  child: Column(
                    children: [
                      TextField(
                        autofocus: true,
                        maxLength: 10,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: HOME_SCREEN_TEXT_COLOR.parseColor(),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: SPLASH_COLOR1.parseColor(),
                                  width: 1.0),
                            ),
                            labelText: '소모품명?',
                            labelStyle: TextStyle(
                              color: HOME_SCREEN_TEXT_COLOR.parseColor(),
                            ),
                            hintText: 'ex) 에어컨 필터',
                            hintStyle: TextStyle(
                                color: TEXT_FILED_HINT_COLOR.parseColor())),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 200),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: HOME_SCREEN_TEXT_COLOR.parseColor(),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: SPLASH_COLOR2.parseColor(),
                                    width: 2.0),
                              ),
                              labelText: '교체 주기?',
                              labelStyle: TextStyle(
                                color: HOME_SCREEN_TEXT_COLOR.parseColor(),
                              ),
                              hintText: 'ex) 30',
                              hintStyle: TextStyle(
                                  color: TEXT_FILED_HINT_COLOR.parseColor())),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget('마지막 교체날짜를 선택해주세요!'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Center(
                          child: DatePickerWidget(
                            locale: DatePicker.localeFromString('ko'),
                            pickerTheme: DateTimePickerTheme(
                                itemTextStyle: TextStyle(
                                    color: Colors.black, fontSize: 19),
                                dividerColor:
                                    DATE_PICKER_DIVIDER_COLOR.parseColor(),
                                backgroundColor: Colors.transparent),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget('우선 순위를 선택해주세요!'),
                        ),
                      ),
                    ],
                  ),
                ));
          });
        }),
      ),
    );
  }
}
