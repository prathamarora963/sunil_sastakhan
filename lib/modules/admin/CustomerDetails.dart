import 'package:SastaKhana/data/models/admin_models/manage_user_model.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key, this.user}) : super(key: key);

  final ManageUserModel? user;

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();
  }

  String? password;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgrounde,
      body: Body(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 28.sp),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 0.sp,
                          bottom: 0,
                          left: 0.sp,
                          right: 0.sp,
                        ),
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            finish(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: textColor,
                            size: 3.h,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Customer Details",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.gettextcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.sp),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 0,
                              top: 0.sp,
                              left: 0.sp,
                              right: 0,
                            ),
                            child: Card(
                              color: whiteColor,
                              elevation: 3,
                              shadowColor: darkgrey_100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: 0,
                                  top: 0.sp,
                                  left: 0.sp,
                                  right: 0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: CachedNetworkImage(
                                    // maxHeightDiskCache:100,
                                    // maxWidthDiskCache: 90,
                                    // memCacheHeight: 100,
                                    // memCacheWidth: 90,
                                    height: 50.sp,
                                    width: 50.sp,
                                    fit: BoxFit.fill,
                                    imageUrl: (widget.user?.image).toImageUrl(),
                                    placeholder: (context, url) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "images/profile.png",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Text(
                            (widget.user?.fName ?? "").isEmpty
                                ? "N/A"
                                : widget.user!.fName!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Semibold',
                              color: textColor,
                            ),
                          ),

                          SizedBox(height: 20.sp),
                          _infoRow(
                            Icons.location_on_outlined,
                            "Address:",
                            "N/A",
                          ),
                          SizedBox(height: 14.sp),
                          _infoRow(
                            Icons.call,
                            "Contact:",
                            (widget.user?.mobile ?? "").isEmpty
                                ? "N/A"
                                : widget.user!.mobile!,
                          ),
                          SizedBox(height: 14.sp),
                          _infoRow(
                            Icons.email_outlined,
                            "Email :",
                            (widget.user?.email ?? "").isEmpty
                                ? "N/A"
                                : widget.user!.email!,
                          ),
                          SizedBox(height: 25.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _actionButton(Icons.call, "Call"),
                              _actionButton(Icons.message, "Message"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= Buttons =================
  Widget _actionButton(IconData icon, String text) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16.sp, color: Colors.white),
      label: Text(
        maxLines: 1,
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'GeneralSans-Medium',
          color: Colors.white,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        side: BorderSide(color: buttonColor),
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
    );
  }

  // ================= Info Row =================
  Widget _infoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: textColor),
        SizedBox(width: 10.sp),
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'GeneralSans-Semibold',
            color: textColor,
          ),
        ),
        SizedBox(width: 10.sp),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColorSecond,
            ),
          ),
        ),
      ],
    );
  }
}
