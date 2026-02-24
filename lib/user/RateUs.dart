
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';


class RateUs extends StatefulWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();

  String? dropdownValue = "";

  int quantity = 2;
  @override
  void initState() {
    super.initState();

  }
  int selectedRating = 0;
  final TextEditingController feedbackController = TextEditingController();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }
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
                          "Rate Your Experience",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height: 15.sp),

                    /// Title
                     Text(
                      'How was your experience?',
                       style: TextStyle(
                           fontSize: 16.sp,
                           fontFamily: 'GeneralSans-Semibold',
                           color: textColor),
                    ),
                     SizedBox(height: 12.sp),

                    /// Star Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          iconSize: 40,
                          onPressed: () {
                            setState(() {
                              selectedRating = index + 1;
                            });
                          },
                          icon: Icon(
                            Icons.star,
                            color: index < selectedRating
                                ? buttonsColororange
                                : Colors.grey.shade300,
                          ),
                        );
                      }),
                    ),

                    Center(
                      child: Text(
                        _ratingText(selectedRating),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),
                    ),

                     SizedBox(height: 20.sp),

                    /// Feedback Field
                     Text(
                      'Write a review (optional)',
                       style: TextStyle(
                           fontSize: 14.sp,
                           fontFamily: 'GeneralSans-Semibold',
                           color: textColor),
                    ),
                     SizedBox(height: 10.sp),
                    TextField(
                      controller: feedbackController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Share your experience...',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
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
                          'Submit Rating',
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
  /// Rating text helper
  String _ratingText(int rating) {
    switch (rating) {
      case 1:
        return 'Very Bad';
      case 2:
        return 'Bad';
      case 3:
        return 'Okay';
      case 4:
        return 'Good';
      case 5:
        return 'Excellent';
      default:
        return 'Tap a star to rate';
    }
  }
}

