import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class RazorPayScreen extends StatefulWidget {
  static String tag = '/RazorPayScreen';

  @override
  RazorPayScreenState createState() => RazorPayScreenState();
}

class RazorPayScreenState extends State<RazorPayScreen> {
  //TODO Without NullSafety Razor pay
  //Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    //TODO Without NullSafety Razor pay
    /*_razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);*/
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 2000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    //TODO Without NullSafety Razor pay
    try {
      //TODO Without NullSafety Razor pay
     // _razorpay.open(options);
    } catch (e) {
      //debugPrint(e);
    }
  }
//TODO Without NullSafety Razor pay
/*  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    toast("SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    toast("ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    toast("EXTERNAL_WALLET: " + response.walletName);
  }*/

  @override
  void dispose() {
    super.dispose();
    //TODO Without NullSafety Razor pay
    //_razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    return Scaffold(
      appBar: appBar(context, 'RazorPay Payment checkout'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 28),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), boxShadow: defaultBoxShadow(), color: whiteColor),
                    child: Image.asset(
                      "images/integrations/icons/ic_razorpay.png",
                      width: 120,
                      height: 120,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("RazorPay", fontSize: textSizeLarge, fontFamily: fontMedium, textColor: Colors.lightBlue[600]),
                        text("Order#567880", fontSize: textSizeMedium, textColor: Theme.of(context).secondaryHeaderColor),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "\$2000",
                          style: boldTextStyle(size: 30),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(height: 0.5),
              text("Name", textColor: appColorPrimary, fontFamily: fontSemibold, fontSize: textSizeLargeMedium).paddingAll(16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text("Acme Corp.", style: secondaryTextStyle()),
              ),
              text("Email", textColor: appColorPrimary, fontFamily: fontSemibold, fontSize: textSizeLargeMedium).paddingAll(16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text("test@razorpay.com", style: secondaryTextStyle()),
              ),
              text("Contact", textColor: appColorPrimary, fontFamily: fontSemibold, fontSize: textSizeLargeMedium).paddingAll(16),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text("8888888888", style: secondaryTextStyle()),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 80),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                decoration: BoxDecoration(
                  color: appColorPrimary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Pay with RazorPay',
                  style: primaryTextStyle(color: white),
                ),
              ).onTap(() {
                openCheckout();
              })
            ],
          )

          /*MaterialButton(
            color: appColorPrimary,
            onPressed: () => openCheckout(),
            child: textPrimary('Pay with RazorPay'),
          )*/
          ,
        ),
      ),
    );
  }
}
