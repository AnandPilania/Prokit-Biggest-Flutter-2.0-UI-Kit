import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class SettingScreen extends StatefulWidget {
  static String tag = '/SettingScreen';

  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: boldTextStyle(size: 22)),
        backgroundColor: appStore.appBarColor,
        leading: BackButton(
          color: appStore.textPrimaryColor,
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Divider(height: 0),
            settingItem(
              context,
              "Dark Mode",
              () {
                appStore.setDarkMode(!appStore.isDarkModeOn);
                setState(() {});
              },
              leading: Image.asset('images/app/ic_theme.png', height: 24, width: 24, color: primaryColor),
              detail: Switch(
                value: appStore.isDarkModeOn,
                onChanged: (s) {
                  appStore.setDarkMode(s);
                  setState(() {});
                },
              ).withHeight(24),
            ),
            Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
