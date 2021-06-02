import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/theme14/model/T14Model.dart';
import 'package:prokit_flutter/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/theme14/utils/T14Widget.dart';

class T14SubscriptionScreen3 extends StatefulWidget {
  @override
  _T14SubscriptionScreen3State createState() => _T14SubscriptionScreen3State();
}

class _T14SubscriptionScreen3State extends State<T14SubscriptionScreen3> {
  List<CheckBoxTextModel> checkBoxTxtList = getCheckBoxTxtList();
  List<ChoosePlanModel> choosePlanList = getChoosePlanList();

  int? i;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: t14_colorWhite,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, size: 20),
            onPressed: () {
              finish(context);
            }),
        title: Text(t14_txt_subscription, style: boldTextStyle(color: t14_colorBlue, size: 18)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(t14_txt_choose_plan, textAlign: TextAlign.center, style: boldTextStyle(color: t14_colorBlue, size: 20)),
          30.height,
          Wrap(
            spacing: 16.0,
            runSpacing: 24.0,
            children: List.generate(
              choosePlanList.length,
              (index) {
                ChoosePlanModel data = choosePlanList[index];
                return Container(
                  height: 90,
                  width: 150,
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radius(16) as BorderRadius?,
                    backgroundColor: i == index ? t14_choosePlan_bgColor : white,
                    border: Border.all(color: t14_colorBlue, width: 0.8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.title!, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                      8.height,
                      Text(data.subTitle!, style: secondaryTextStyle(size: 14)),
                    ],
                  ),
                ).onTap(() {
                  i = index;
                  setState(() {});
                });
              },
            ),
          ),
          16.height,
          ListView.builder(
              itemCount: checkBoxTxtList.length,
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                CheckBoxTextModel data = checkBoxTxtList[index];
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: data.checkBox! ? t14_btn_checkBoxColor : Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: data.checkBox! ? Colors.transparent : appStore.textPrimaryColor!,
                            ),
                            shape: BoxShape.circle),
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.transparent),
                          child: Checkbox(
                            value: data.checkBox,
                            onChanged: (state) {
                              setState(() {
                                 data.checkBox = state;
                              });
                            },
                            activeColor: Colors.transparent,
                            checkColor: t14_colorWhite,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                        ),
                      ),
                      16.width,
                      Text(data.name!, style: secondaryTextStyle()),
                    ],
                  ),
                ).onTap(() {
                  data.checkBox = !data.checkBox!;
                  setState(() {});
                });
              }).expand(),
          t14AppButton(
            context,
            btnText: t14_btn_SubscibeNow,
            bgColor: t14_btn_subscription,
            width: context.width(),
            shape: 10.0,
            txtColor: t14_colorBlue,
          ).paddingAll(16),
        ],
      ),
    );
  }
}
