import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/ctextfield.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test>
    with TickerProviderStateMixin {
  bool expanded = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body: Body(child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                      "Orders Payment",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'GeneralSans-Bold',
                          color: notifire.gettextcolor),
                    ),),
                ]),
                Column(
                  children: [
                    ListTile(
                      title: const Text("Order Details"),
                      trailing: Icon(
                        expanded ? Icons.remove : Icons.add,
                      ),
                      onTap: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: expanded
                          ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text("Extra order information here"),
                      )
                          : const SizedBox(),
                    ),
                  ],
                ),

                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }
}
