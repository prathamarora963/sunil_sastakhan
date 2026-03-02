
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';


class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({Key? key}) : super(key: key);

  @override
  _ChoosePaymentMethodState createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();


  }

  String selectedMethod = 'card';
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body: Body(child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height:28.sp),
                    Row(children: [
                      Container( margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                        alignment: Alignment.topLeft,
                        child:  IconButton(onPressed: (){
                          finish(context);
                        }, icon:  Icon(Icons.arrow_back_ios_new_outlined,color: textColor,size: 3.h,)),
                      ),
                      Container(alignment: Alignment.centerLeft,
                        child: Text(
                          "Payment",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height: 10.sp),
                     Text(
                      'Choose Payment Method',
                      style: TextStyle(
                         fontSize: 17.sp,
                         fontFamily: 'GeneralSans-Semibold',
                         color: textColor)
                    ),
                    SizedBox(height: 16.sp),

                    _paymentTile(
                      icon: Icons.credit_card,
                      title: 'Credit/Debit Card',
                      value: 'card',
                    ),
                    _paymentTile(
                      icon: Icons.account_balance_wallet,
                      title: 'UPI / NetBanking',
                      value: 'upi',
                    ),
                    _paymentTile(
                      icon: Icons.apple,
                      title: 'Apple Pay',
                      value: 'apple',
                    ),
                    _paymentTile(
                      icon: Icons.g_mobiledata,
                      title: 'Google Pay',
                      value: 'gpay',
                    ),
                    _paymentTile(
                      icon: Icons.check_circle_outline,
                      title: 'PayPal',
                      value: 'paypal',
                    ),

                    if (selectedMethod == 'card') _cardDetails(),
                    _orderSummary(),
                    SizedBox(height: 25.sp),

                    Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 15.sp, right: 15.sp),
                      width: double.infinity,
                      height: 28.sp,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                        onPressed: () {
                          // AdminBottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
                        },
                        child:  Text(
                          'Pay Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Semibold',
                              color: white),
                        ),
                      ),
                    ),

                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

  }

  // 💳 PAYMENT OPTION TILE
  Widget _paymentTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    final bool selected = selectedMethod == value;

    return GestureDetector(
      onTap: () => setState(() => selectedMethod = value),
      child: Container(
        width: double.infinity,
        margin:  EdgeInsets.only(bottom: 15.sp),
        padding:  EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.sp),
          border: Border.all(
            color: selected ? buttonColor : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: buttonColor),
            SizedBox(width: 15.sp),
            Expanded(
              child: Text(
                title,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColor)
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? buttonColor : Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  // 🧾 CARD DETAILS
  Widget _cardDetails() {
    return Container(
      padding:  EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Card Details',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans-Semibold',
                  color: textColor)
          ),
           SizedBox(height: 15.sp),
          _textField('Card Number', 'XXXX XXXX XXXX XXXX'),
           SizedBox(height: 15.sp),
          Row(
            children: [
              Expanded(child: _textField('Expiry Date', 'MM/YY')),
              const SizedBox(width: 12),
              Expanded(child: _textField('CVV', '***')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: textColor)),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            isDense: true,
          ),
        ),
      ],
    );
  }

  // 📦 ORDER SUMMARY
  Widget _orderSummary() {
    return Container(
      padding:  EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Order Summary',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans-Semibold',
                  color: textColor)
          ),
          const SizedBox(height: 12),
          _priceRow('Bag Price', '₹ 199.00'),
          _priceRow('Delivery Fee', '₹ 25.00'),
          const Divider(height: 24),
          _priceRow(
            'Total Amount',
            '₹ 224.00',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6.sp),
      child: Row(
        children: [
          Expanded(child: Text(title,style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'GeneralSans-Semibold',
              color: textColor))),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.green.shade800 : Colors.black,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
