
import 'package:SastaKhana/utils/color.dart';
import 'package:SastaKhana/utils/colornotifire.dart';
import 'package:SastaKhana/utils/commonutills.dart';
import 'package:SastaKhana/utils/globalwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MarchentHome.dart';
import '../../loginsignup/ProfilePage.dart';
import '../../loginsignup/SignupWelcome.dart';
import '../../loginsignup/login.dart';
import '../shared_ui/OrdersList.dart';
import 'RevenueImpactAnalytics.dart';

class MerchentBottombar extends StatefulWidget {
  const MerchentBottombar({Key? key}) : super(key: key);

  @override
  _MerchentBottombarState createState() => _MerchentBottombarState();
}

class _MerchentBottombarState extends State<MerchentBottombar> {
  late ColorNotifire notifire;

  late int _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;
  int _selectedIndex = 0;
  var isLogin = false;

  final _pageOption = [
    const MarchentHome(),
    OrdersList(navFlag: true),
    RevenueImpactAnalytics(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    // getDeviceType();

  }
  String release = "";

  double barHeight=32.sp;

  String? name='';
  String? email='';
  String? phone='';
  String? agent='';
  String? profileimage='';
  bool loginflag=false;


  Future<bool> _handleWillPop() async {
    final _currentTime = DateTime.now().millisecondsSinceEpoch;

    if (_lastTimeBackButtonWasTapped != null &&
        (_currentTime - _lastTimeBackButtonWasTapped) < exitTimeInMillis) {
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      return false;
    }
  }
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return WillPopScope(
      onWillPop: _handleWillPop,
      child: Scaffold(
          key: _scaffoldKey,
          // drawer: DrawerBar(scaffoldKey: _scaffoldKey, mainContext: context,fullname:"fullname",email:"email",profileimage:"profileimage"),
          appBar: homeAppbar(_scaffoldKey,context,notifire,name,email,phone,profileimage,loginflag,barHeight,1),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: notifire.bottommenucolore,
              backgroundColor: notifire.backgrounde,
              selectedLabelStyle: const TextStyle(
                  fontFamily: 'GeneralSans-Medium', fontWeight: FontWeight.w500,),
              fixedColor: buttonColor,
              unselectedFontSize: 13,
              selectedFontSize: 13,
              unselectedLabelStyle: const TextStyle(fontFamily: 'GeneralSans-Medium'),
              currentIndex: _selectedIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: MediaQuery.of(context).size.height / 33,color: _selectedIndex == 0
                        ? buttonColor
                        : notifire.bottommenucolore,),
                    label: 'Home'.tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.receipt_long, size: MediaQuery.of(context).size.height / 33,color: _selectedIndex == 1
                      ? buttonColor
                      : notifire.bottommenucolore,),
                    // Image.asset(, , height: MediaQuery.of(context).size.height / 33),
                    label: 'Orders'.tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.analytics_sharp, size: MediaQuery.of(context).size.height / 33,color: _selectedIndex == 2
                        ? buttonColor
                        : notifire.bottommenucolore,),
                    label: 'Analytics'.tr),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle, size: MediaQuery.of(context).size.height / 33,color: _selectedIndex == 3
                      ? buttonColor
                      : notifire.bottommenucolore,),
                  label: 'Profile'.tr,
                ),
              ],
              onTap: (index) {
                setState(() {});
                _selectedIndex = index;
              }),
          body: _pageOption[_selectedIndex]),
    );
  }
}

