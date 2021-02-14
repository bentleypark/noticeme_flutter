import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/ui/add/add_custom_consumable_controller.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:noticemeflutter/widget/add_custom_consumable_app_bar.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';
import 'package:noticemeflutter/widget/noticeme_text_widget.dart';
import 'package:noticemeflutter/widget/toggle_button_group_widget.dart';

class AddCustomConsumableScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final durationController = TextEditingController();
  NoticemeProvider provider = Get.put(NoticemeProvider());
  ToggleButtonGroup toggleButtonGroup = ToggleButtonGroup();
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddCustomConsumableAppBar(
        from: 'AddCustomConsumableScreen',
        button: Material(
          type: MaterialType.transparency,
          child: InkWell(
              child: TextWidget('추가'),
              onTap: () {
            insert();
            // final snackBar = SnackBar(
            //   content: Text('소모품이 추가되었습니다!'),
            // );
            // Scaffold.of(context).showSnackBar(snackBar);

            Future.delayed(const Duration(seconds: 2), () {
              Get.offNamed(Routes.HOME);
            });
          }),
        ),
      ),
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
                      controller: titleController,
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
                                color: SPLASH_COLOR1.parseColor(), width: 1.0),
                          ),
                          labelText: '소모품명',
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
                        controller: durationController,
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
                            labelText: '교체주기 입력',
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
                        child: TextWidget('마지막 교체날짜를 선택해주세요'),
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
                              itemTextStyle:
                                  TextStyle(color: Colors.black, fontSize: 19),
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
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                    //     child: SizedBox(
                    //       width: double.infinity,
                    //       height: 50,
                    //       child: RaisedButton(
                    //         color: HOME_SCREEN_TEXT_COLOR.parseColor(),
                    //         child: Text(
                    //           '추가하기',
                    //           style:
                    //               TextStyle(fontSize: 20, color: Colors.white),
                    //         ),
                    //         onPressed: () {
                    //           insert();
                    //           final snackBar = SnackBar(
                    //             content: Text('소모품이 추가되었습니다!'),
                    //           );
                    //           Scaffold.of(context).showSnackBar(snackBar);
                    //
                    //           Future.delayed(const Duration(seconds: 2), () {
                    //             Get.offNamed(Routes.HOME);
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  insert() async {
    final database = await $FloorNoticemeDatabase
        .databaseBuilder('noticeme_database.db')
        .build();
    var dao = database.userConsumableDao;
    var consumableDao = database.consumableDao;

    if (_selectedDate == null) {
      _selectedDate = DateTime.now();
    }

    var selectedDateMilliseconds = _selectedDate.millisecondsSinceEpoch;
    dao.insertUserConsumable(UserConsumableEntity(
        titleController.text,
        provider.fetchRandomImage(),
        '나의 목록',
        durationController.text.convertDuration(),
        selectedDateMilliseconds,
        selectedDateMilliseconds + durationController.text.convertDuration(),
        toggleButtonGroup.getSelectedIndex()));

    consumableDao.insertConsumable(ConsumableEntity(
        titleController.text,
        provider.fetchRandomImage(),
        '나의 목록',
        durationController.text.convertDuration()));
  }
}
