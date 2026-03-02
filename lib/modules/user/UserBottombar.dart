import 'package:SastaKhana/modules/user/ImpactPage.dart';
import 'package:SastaKhana/modules/user/UserOrders.dart';
import 'package:SastaKhana/modules/user/UserProfile.dart';
import 'package:SastaKhana/utils/color.dart';
import 'package:SastaKhana/utils/colornotifire.dart';
import 'package:SastaKhana/utils/commonutills.dart';
import 'package:SastaKhana/utils/globalwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'UserHome.dart';


class UserBottombar extends StatefulWidget {
  const UserBottombar({Key? key}) : super(key: key);

  @override
  _UserBottombarState createState() => _UserBottombarState();
}

class _UserBottombarState extends State<UserBottombar> {
  late ColorNotifire notifire;

  late int _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;
  int _selectedIndex = 0;
  var isLogin = false;

  final _pageOption = [
    UserHome(),
    UserOrders(navFlag: true),
    ImpactPage(navFlag: true),
    UserProfile(),
  ];

  @override
  void initState() {
    super.initState();
    getDeviceType();
    try {
      // versionCheck(context);
      // Instantiate NewVersion manager object (Using GCP Console app as example)
      final newVersion = NewVersionPlus(
        iOSId: 'com.sastakhana.sastakhana',
        androidId: 'com.sastakhana.sastakhana',
        androidPlayStoreCountry: "es_ES",
        androidHtmlReleaseNotes: true, //support country code
      );
      // You can let the plugin handle fetching the status and showing a dialog,
      // or you can fetch the status and display your own dialog, or no dialog.
      const simpleBehavior = true;
      basicStatusCheck(newVersion);
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  String release = "";
  basicStatusCheck(NewVersionPlus newVersion) async {
    final version = await newVersion.getVersionStatus();
    if (version != null) {
      release = version.releaseNotes ?? "";
      setState(() {});
    }
    newVersion.showAlertIfNecessary(
      context: context,
      launchModeVersion: LaunchModeVersion.external,
    );
  }

  double barHeight = 32.sp;
  getDeviceType() async {
    bool iPad = await CommonUtills.isTablet(context);
    if (iPad) {
      barHeight = 12.0.h;
    } else {
      barHeight = 32.sp;
    }
    setState(() {});
  }

  String? name = '';
  String? email = '';
  String? phone = '';
  String? agent = '';
  String? profileimage = '';
  bool loginflag = false;

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
        appBar: homeAppbar(
          _scaffoldKey,
          context,
          notifire,
          name,
          email,
          phone,
          profileimage,
          loginflag,
          barHeight,
          3,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: notifire.bottommenucolore,
          backgroundColor: notifire.backgrounde,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'GeneralSans-Medium',
            fontWeight: FontWeight.w500,
          ),
          fixedColor: buttonColor,
          unselectedFontSize: 13,
          selectedFontSize: 13,
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'GeneralSans-Medium',
          ),
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: MediaQuery.of(context).size.height / 33,
                color: _selectedIndex == 0
                    ? buttonColor
                    : notifire.bottommenucolore,
              ),
              label: 'Home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long,
                size: MediaQuery.of(context).size.height / 33,
                color: _selectedIndex == 1
                    ? buttonColor
                    : notifire.bottommenucolore,
              ),
              // Image.asset(, , height: MediaQuery.of(context).size.height / 33),
              label: 'Orders'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.energy_savings_leaf_sharp,
                size: MediaQuery.of(context).size.height / 33,
                color: _selectedIndex == 2
                    ? buttonColor
                    : notifire.bottommenucolore,
              ),
              label: 'Impact'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: MediaQuery.of(context).size.height / 33,
                color: _selectedIndex == 3
                    ? buttonColor
                    : notifire.bottommenucolore,
              ),
              label: 'Profile'.tr,
            ),
          ],
          onTap: (index) {
            setState(() {});
            _selectedIndex = index;
          },
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pageOption,
        ),
      ),
    );
  }
}
