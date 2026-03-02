import 'package:SastaKhana/controller/admin/manage_user_controller.dart';
import 'package:SastaKhana/data/models/admin_models/manage_user_model.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import 'CustomerDetails.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({Key? key}) : super(key: key);

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  late final ManageUserController _controller;
  late ColorNotifire notifire;

  @override
  void initState() {
    super.initState();
    _controller = Get.isRegistered<ManageUserController>()
        ? Get.find<ManageUserController>()
        : Get.put(ManageUserController());
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifire.backgrounde,
      body: Body(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.sp),
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => finish(context),
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
                      'Manage User',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Bold',
                        color: notifire.gettextcolor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              _buildSearchBar(),
              SizedBox(height: 10.sp),
              Expanded(
                child: Obx(() {
                  // if (_controller.isInitialLoading.value &&
                  //     _controller.users.isEmpty) {
                  //   return const Center(child: CircularProgressIndicator());
                  // }

                  if (_controller.users.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: _controller.refreshUsers,
                      child: ListView(
                        controller: _controller.scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          SizedBox(height: 20.h),
                          Center(
                            child: Text(
                              'No users found',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  final showBottomLoader = _controller.isLoadingMore.value;
                  final totalCount =
                      _controller.users.length + (showBottomLoader ? 1 : 0);

                  return RefreshIndicator(
                    onRefresh: _controller.refreshUsers,
                    child: ListView.builder(
                      controller: _controller.scrollController,
                      padding: EdgeInsets.all(15.sp),
                      itemCount: totalCount,
                      itemBuilder: (context, index) {
                        if (index >= _controller.users.length) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        final user = _controller.users[index];
                        return _userCard(user: user);
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
    );
  }

  String _resolveImageUrl(String image) {
    final sanitized = image.trim();
    if (sanitized.isEmpty) {
      return '';
    }
    if (sanitized.startsWith('http://') || sanitized.startsWith('https://')) {
      return sanitized;
    }
    return sanitized.toImageUrl();
  }

  Widget _userCard({required ManageUserModel user}) {
    final name = user.fName ?? 'Unknown';
    final email = user.email ?? 'N/A';
    final phone = user.mobile ?? 'N/A';
    final image = _resolveImageUrl(user.image ?? '');

    return Card(
      margin: EdgeInsets.only(bottom: 15.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(14.sp),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                CustomerDetails(user: user).launch(
                  context,
                  isNewTask: false,
                  pageRouteAnimation: PageRouteAnimation.Scale,
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: whiteColor,
                    elevation: 3,
                    shadowColor: darkgrey_100,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        height: 40.sp,
                        width: 40.sp,
                        fit: BoxFit.fill,
                        imageUrl: image,
                        placeholder: (context, url) => Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/profile.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 40.sp,
                          width: 40.sp,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/profile.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.sp),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.isEmpty ? 'N/A' : name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: notifire.gettextcolor,
                          ),
                        ),
                        Text(
                          email.isEmpty ? 'N/A' : email,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16.sp,
                              backgroundColor: Colors.blue.shade50,
                              child: Icon(
                                Icons.call,
                                size: 16.sp,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 10.sp),
                            Expanded(
                              child: Text(
                                phone.isEmpty ? 'N/A' : phone,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'GeneralSans-Medium',
                                  color: textColorSecond,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Card(
      margin: EdgeInsets.only(
        bottom: 0.sp,
        left: 15.sp,
        right: 15.sp,
        top: 10.sp,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.sp)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.sp),
        child: TextField(
          controller: _controller.searchController,
          onChanged: _controller.searchUsers,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: _controller.clearSearch,
            ),
            hintText: 'Search with user name',
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.sp),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
