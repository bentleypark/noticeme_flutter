import 'package:flutter/material.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class ToggleButtonGroup extends StatefulWidget {
  List<bool> isSelected = [false, false, false, true];

  @override
  _ToggleButtonGroupState createState() => _ToggleButtonGroupState();


  int getSelectedIndex() {
    return this.isSelected.indexOf(true);
  }

  void setSelectedIndex(int index) {
    for (int indexBtn = 0; indexBtn < this.isSelected.length; indexBtn++) {
      if (indexBtn == index) {
        this.isSelected[indexBtn] = true;
      } else {
        this.isSelected[indexBtn] = false;
      }
    }
  }

}

class _ToggleButtonGroupState extends State<ToggleButtonGroup> {
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  FocusNode focusNodeButton4 = FocusNode();
  List<FocusNode> focusToggle;

  @override
  void initState() {
    super.initState();
    focusToggle = [
      focusNodeButton1,
      focusNodeButton2,
      focusNodeButton3,
      focusNodeButton4
    ];
  }

  @override
  void dispose() {
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();
    focusNodeButton4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
          borderRadius: BorderRadius.circular(7),
          isSelected: widget.isSelected,
          children: [
            SizedBox(
              width: displayWidth(context) * 0.15,
              child: Text('높음',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              width: displayWidth(context) * 0.15,
              child: Text('보통',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              width: displayWidth(context) * 0.15,
              child: Text('낮음',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              width: displayWidth(context) * 0.15,
              child: Text('없음',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ],
          focusNodes: focusToggle,
          color: TEXT_FIELD_BORDER_COLOR.parseColor(),
          selectedColor: Colors.white,
          fillColor: HOME_SCREEN_FLOATING_BUTTON_COLOR.parseColor(),
          onPressed: (int index) {
            setState(() {
              widget.setSelectedIndex(index);
            });
          }),
    );
  }

}

// extension SelectedIndex on ToggleButtonGroup {
//   int getSelectedIndex() {
//     return this.isSelected.indexOf(true);
//   }
// }

// extension SetSelectedIndex on ToggleButtonGroup {
//   void setSelectedIndex(int index) {
//     for (int indexBtn = 0; indexBtn < this.isSelected.length; indexBtn++) {
//       if (indexBtn == index) {
//         this.isSelected[indexBtn] = true;
//       } else {
//         this.isSelected[indexBtn] = false;
//       }
//     }
//   }
// }
