import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/theme14/model/T14Model.dart';
import 'package:prokit_flutter/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/theme14/utils/T14Widget.dart';

class T14SubscriptionScreen6 extends StatefulWidget {
  @override
  _T14SubscriptionScreen6State createState() => _T14SubscriptionScreen6State();
}

class _T14SubscriptionScreen6State extends State<T14SubscriptionScreen6> {
  List<ChoosePlanModel> subscription5choosePlanList = getSubscription5ChoosePlanList();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(t14SubscriptionImg6, fit: BoxFit.cover, height: context.height() * 0.40, width: context.width()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t14_txt_SubScription_GoPro, style: boldTextStyle(size: 22, color: t14_OppsColor1)),
                8.height,
                UL(
                  symbolType: SymbolType.Bullet,
                  spacing: 8,
                  padding: 16,
                  children: [
                    Text(t14_txt_Subscription2_Sentiment, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                    Text(t14_txt_Subscription2_update, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                    Text(t14_txt_Subscription2_analyze, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                  ],
                ),
                16.height,
                Text(t14_txt_Subscription_Choose_Period, style: boldTextStyle(color: t14_colorBlue)),
                ListView.builder(
                    itemCount: subscription5choosePlanList.length,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      ChoosePlanModel data = subscription5choosePlanList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          backgroundColor: i == index ? t14_subscription_bgListColor : white,
                          border: Border.all(color: t14_colorBlue.withOpacity(0.2), width: 0.8),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: 25,
                                height: 25,
                                decoration: new BoxDecoration(
                                    color: data.checkBox! ? Colors.transparent : white,
                                    border: Border.all(
                                      width: 1,
                                      color: i == index ? white : t14_colorBlue,
                                    ),
                                    shape: BoxShape.circle),
                                child: i == index ? Icon(Icons.check, size: 18) : 0.height),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.title!, style: boldTextStyle(size: 16)),
                                4.height,
                                Text(data.subTitle!, style: primaryTextStyle(size: 14, color: i == index ? t14_colorBlue : t14_SuccessTxtColor)),
                              ],
                            ).expand(),
                            t14AppButton(
                              context,
                              btnText: t14_btn_bye,
                              bgColor: t14_btn_bye_bgColor,
                              width: 70,
                              shape: 10.0,
                              txtColor: white,
                            ).visible(i == index).withHeight(45),
                          ],
                        ),
                      ).onTap(() {
                        i = index;
                        setState(() {});
                      });
                    }),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
