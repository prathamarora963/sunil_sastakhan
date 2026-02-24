class ApiConstants {
  static const String _baseUrl =
      "https://conceptitsolutions.com/projects/sastakhana/";

  /// -------------------------- auth api ---------------------
  static const String login = "$_baseUrl/api/Auth/login";
  static const String signUp = "$_baseUrl/api/Auth/signup";
  static const String getOtp = "$_baseUrl/api/Auth/get_otp";
  static const String verifyOpt = "$_baseUrl/api/Auth/verify_otp";

  ///----------------------- profile Api------------------------
  static const String profileApi = "$_baseUrl/api/Auth/profile";
  static const String uploadPhoto = "$_baseUrl/api/Auth/upload_photo";

  ///----------------------- home Api------------------------
  static const String getSupperDiscountItemsList =
      "$_baseUrl/api/Auth/getSupperDiscountItemsList";
  static const String getHomeItemsList = "$_baseUrl/api/Auth/getHomeItemsList";
  static const String getShopDetail = "$_baseUrl/api/Auth/get_shop_details";
  static const String viewItemDetail = "$_baseUrl/api/Auth/view_item_details";
  static const String getCustomerReview =
      "$_baseUrl/api/Auth/get_customer_review";
  static const String addToCart = "$_baseUrl/api/Auth/add_to_cart";
  static const String deleteCartItem = "$_baseUrl/api/Auth/delete_cart_items";
  static const String cartList = "$_baseUrl/api/Auth/cart_list";
  static const String payNow = "$_baseUrl/api/Auth/pay_now";
  static const String orderHistory = "$_baseUrl/api/Auth/order_history";
  static const String orderDetail = "$_baseUrl/api/Auth/order_details";
  static const String addReview = "$_baseUrl/api/Auth/add_review";
  static const String contactUs = "$_baseUrl/api/Auth/contact_us";
  static const String contactEnquiry = "$_baseUrl/api/Auth/contact_enquiry";
  static const String liveCampaign = "$_baseUrl/api/Auth/live_campaign";
  static const String merchantCampaign = "$_baseUrl/api/Auth/merchant_campaign";
  static const String businessCategory = "$_baseUrl/api/Auth/businessCategory";
  static const String state = "$_baseUrl/api/Auth/state";
  static const String city = "$_baseUrl/api/Auth/city";
  static const String masterApi = "$_baseUrl/api/Auth/master_api";
  static const String uploadDocument = "$_baseUrl/api/Auth/upload_document";
  static const String merchantDetail = "$_baseUrl/api/Auth/merchent_details";
  static const String createItem = "$_baseUrl/api/Auth/create_items";
  static const String editItems = "$_baseUrl/api/Auth/edit_items";
  static const String deleteItemImage = "$_baseUrl/api/Auth/delete_items_image";
  static const String itemDetail = "$_baseUrl/api/Auth/items_details";
  static const String itemsList = "$_baseUrl/api/Auth/itemsList";
  static const String listOfReview = "$_baseUrl/api/Auth/list_of_review";
  static const String uploadShopImages =
      "$_baseUrl/api/Auth/upload_shop_images";
  static const String deleteItem = "$_baseUrl/api/Auth/delete_items";
  static const String updateOrderStatusByMerchant =
      "$_baseUrl/api/Auth/update_order_status_by_merchant";
  static const String getMerchantOrder =
      "$_baseUrl/api/Auth/get_merchant_order";
  static const String merchantRegistration =
      "$_baseUrl/api/Auth/merchant_registration";
  static const String todaySale = "$_baseUrl/api/Auth/today_sale";
  static const String addCampaign = "$_baseUrl/api/Auth/add_campaign";
  static const String editCampaign = "$_baseUrl/api/Auth/edit_campaign";
  static const String campaignDetail = "$_baseUrl/api/Auth/campaingn_details";
  static const String deleteCampaign = "$_baseUrl/api/Auth/delete_campaign";
  static const String campaignList = "$_baseUrl/api/Auth/campaignList";
  static const String payoutHistory = "$_baseUrl/api/Auth/payout_history";
  static const String analytics = "$_baseUrl/api/Auth/analytics";
  static const String contactEnquiryOld = "$_baseUrl/api/Auth/contact_enquiry";
  static const String sendOtpForTesting =
      "$_baseUrl/api/Auth/send_otp_for_testing";
  static const String manageMerchant =
      "$_baseUrl/api/AdminAuth/manage_merchant";
  static const String updateVerifyStatus =
      "$_baseUrl/api/AdminAuth/update_verify_status";
  static const String deleteMerchant =
      "$_baseUrl/api/AdminAuth/delete_merchant";
  static const String manageUser = "$_baseUrl/api/AdminAuth/manage_user";
  static const String supportCenter = "$_baseUrl/api/AdminAuth/support_center";
  static const String report = "$_baseUrl/api/AdminAuth/report";

  ///--------------------------Admin Auth----------------------------
  static const String adminAuthLogin = "$_baseUrl/api/AdminAuth/login";

  ///--------------------------Admin Home----------------------------
  static const String adminDetail = "$_baseUrl/api/AdminAuth/admin_details";
  static const String todaySaleAdmin = "$_baseUrl/api/AdminAuth/today_sale";
  static const String merchantDetailAdmin = "$_baseUrl/api/AdminAuth/merchent_details";
  static const String trackOrder = "$_baseUrl/api/AdminAuth/track_order";
  static const String adminOrderDetail = "$_baseUrl/api/AdminAuth/order_details";
}
