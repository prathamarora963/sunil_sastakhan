
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../MerchentBottombar.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../main.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/commonutills.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}
double distance = 10;
double price = 500;
String pickupTime = 'Anytime';

final Map<String, bool> items = {
  'Red Roses': false,
  'Flower Bouquet': false,
  'Gluten-Free Food': false,
  'South Indian': false,
  'Kitchen Essentials': false,
  'Chocolates': false,
};
class _FilterState extends State<Filter> {
  // final Filter = Get.put(AuthController());
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        /// BOTTOM ADD BUTTON
        bottomNavigationBar: Container(
          padding:  EdgeInsets.all(16.sp),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding:  EdgeInsets.symmetric(vertical: 15.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.sp),
              ),
            ),
            onPressed: () {},
            icon:  Icon(Icons.search, color: Colors.white,size: 18.sp,),
            label:  Text(
              "Search",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: Colors.white),
            ),
          ),
        ),
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
                          "Filter",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height: 15.sp),
                    /// Search
                    TextField(
                      controller: searchController,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'Search for location',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: searchController.text.isNotEmpty
                            ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            searchController.clear();
                            setState(() {});
                          },
                        )
                            : null,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),


                    SizedBox(height: 15.sp),

                    /// Current Location
                     Text(
                      'Current Location',
                      style: TextStyle(
                        fontFamily:
                        'GeneralSans-Semibold',
                        color: textColor,
                        fontSize: 16.sp,),
                    ),

                     SizedBox(height: 15.sp),

                    /// Map
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'images/gmap.jpg', // replace with your image
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.gps_fixed),
                            label: const Text('Pin Location'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: currentLatLng,
                                zoom: 14,
                              ),
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                              onMapCreated: (controller) {
                                mapController = controller;
                              },
                              markers: {
                                Marker(
                                  markerId: const MarkerId('current'),
                                  position: currentLatLng,
                                ),
                              },
                            ),
                          ),
                        ),

                        /// Pin Location Button
                        Positioned(
                          bottom: 16,
                          child: ElevatedButton.icon(
                            onPressed: getCurrentLocation,
                            icon: const Icon(Icons.gps_fixed),
                            label: const Text('Pin Location'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),*/


                    SizedBox(height: 15.sp),

                    /// Distance
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Distance',
                              style:
                              TextStyle(
                                fontFamily:
                                'GeneralSans-Semibold',
                                color: textColor,
                                fontSize: 16.sp,),),
                           SizedBox(height: 10.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Max Distance',style:
                          TextStyle(
                            fontFamily:
                            'GeneralSans-Medium',
                            color: textColor,
                            fontSize: 14.sp,),),
                              Text('${distance.toInt()} km'),
                            ],
                          ),
                          Slider(
                            activeColor: buttonColor,
                            value: distance,
                            min: 1,
                            max: 50,
                            onChanged: (v) => setState(() => distance = v),
                          ),
                        ],
                      ),
                    ),

                    /// Price Range
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Price Range',
                            style:
                            TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: textColor,
                              fontSize: 16.sp,),),
                          SizedBox(height: 10.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('Price Range',style:
                              TextStyle(
                                fontFamily:
                                'GeneralSans-Medium',
                                color: textColor,
                                fontSize: 14.sp,)),
                              Text('₹0 - ₹${price.toInt()}'),
                            ],
                          ),
                          Slider(
                            activeColor: buttonColor,
                            value: price,
                            min: 0,
                            max: 5000,
                            onChanged: (v) => setState(() => price = v),
                          ),
                        ],
                      ),
                    ),

                    /// Item Type
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Item Type',
                            style:
                            TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: textColor,
                              fontSize: 16.sp,),),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 4,
                            physics: const NeverScrollableScrollPhysics(),
                            children: items.keys.map((key) {
                              return CheckboxListTile(
                                activeColor: buttonColor,
                                value: items[key],
                                onChanged: (v) =>
                                    setState(() => items[key] = v!),
                                title: Text(key),
                                controlAffinity: ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 15.sp),
                        ],
                      ),
                    ),

                    /// Pickup Time
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pickup Time',
                            style:
                            TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: textColor,
                              fontSize: 16.sp,),),
                           SizedBox(height: 10.sp),
                          DropdownButtonFormField<String>(
                            value: pickupTime,
                            items: const [
                              DropdownMenuItem(
                                  value: 'Anytime', child: Text('Anytime')),
                              DropdownMenuItem(
                                  value: 'Morning', child: Text('Morning')),
                              DropdownMenuItem(
                                  value: 'Evening', child: Text('Evening')),
                            ],
                            onChanged: (v) => setState(() => pickupTime = v!),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.sp),



                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

  }
  Widget _card({required Widget child}) {
    return Container(
      margin:  EdgeInsets.only(top: 15.sp),
      padding:  EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
