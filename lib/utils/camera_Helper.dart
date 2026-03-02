import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app_utils.dart';
import 'color.dart' as AppColor;

enum ImageType { logo, shopImages,fssaiDoc,panCardDoc,merchantDoc,otherDoc }

abstract class CameraOnCompleteListener {
  void onSuccessFile(String file, String fileType,{ImageType? imageType});
  // void onSuccessVideo(String selectedUrl, Uint8List? thumbnail);
}

class CameraHelper {
  final picker = ImagePicker();
  BuildContext context = Get.context!;
  CropAspectRatioPreset? cropAspectRatioPreset;
  late CameraOnCompleteListener callback;

  CameraHelper(this.callback);

  void setCropping(CropAspectRatioPreset cropAspectRatioPreset) {
    this.cropAspectRatioPreset = cropAspectRatioPreset;
  }

  void openAttachmentDialog({ImageType? imageType}) async {
    if (await isStorageEnabled()) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'docx',
          'xlsx',
          'pptx',
          'doc',
          'xls',
          'ppt',
          'txt',
        ],
      );
      if (result != null) {
        File file = File(result.files.single.path!);
        debugPrint(file.path);
        callback.onSuccessFile(file.path, "document",imageType: imageType);
      } else {
        // user canceled the picker
      }
    }
  }

  // Future<bool> openVideoPicker() async {
  //   await showModalBottomSheet(
  //     context: context,
  //     useRootNavigator: false,
  //     backgroundColor: Colors.transparent,
  //     builder: (BuildContext bc) => GestureDetector(
  //       child: Container(
  //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //         padding: const EdgeInsets.symmetric(vertical: 15),
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //           shape: BoxShape.rectangle,
  //           borderRadius: BorderRadius.all(Radius.circular(30)),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const SizedBox(height: 20),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 GestureDetector(
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         height: 50,
  //                         width: 50,
  //                         decoration: BoxDecoration(
  //                           color: Colors.black.withValues(alpha:0.5),
  //                           shape: BoxShape.circle,
  //                         ),
  //                         child: const Icon(
  //                           Icons.camera_alt_rounded,
  //                           size: 25,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       const Text(
  //                         "Camera",
  //                         style: TextStyle(
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: 12),
  //                       )
  //                     ],
  //                   ),
  //                   onTap: () async {
  //                     if (await isCameraEnabled()) {
  //                       Navigator.pop(context);
  //                       getVideo(ImageSource.camera);
  //                     }
  //                   },
  //                 ),
  //                 const SizedBox(width: 60),
  //                 GestureDetector(
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         height: 50,
  //                         width: 50,
  //                         decoration: const BoxDecoration(
  //                           color: Color(0xffFF8E01),
  //                           shape: BoxShape.circle,
  //                         ),
  //                         child: const Icon(
  //                           Icons.image_rounded,
  //                           size: 25,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       const Text(
  //                         "Gallery",
  //                         style: TextStyle(
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: 12),
  //                       )
  //                     ],
  //                   ),
  //                   onTap: () async {
  //                     if (await isStorageEnabled()) {
  //                       Navigator.pop(context);
  //                       getVideo(ImageSource.gallery);
  //                     }
  //                   },
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 15),
  //             InkWell(
  //               child: const Padding(
  //                 padding: EdgeInsets.all(13.0),
  //                 child: Text(
  //                   "Cancel",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 14,
  //                     decoration: TextDecoration.underline,
  //                   ),
  //                 ),
  //               ),
  //               onTap: () {
  //                 Navigator.pop(context);
  //               },
  //             )
  //           ],
  //         ),
  //       ),
  //       onTap: () {
  //         FocusScope.of(context).requestFocus(FocusScopeNode());
  //       },
  //     ),
  //   );
  //   return false;
  // }

  // Future<void> getVideo(ImageSource source, {isTrimming = true}) async {
  //   XFile? imageFile = await picker.pickVideo(
  //       source: source, maxDuration: const Duration(minutes: 2));
  //   if (imageFile != null) {
  //     debugPrint("Selected video => ${imageFile.path}");
  //     String? result;
  //     result = imageFile.path;
  //
  //     debugPrint("pickVideoGallery $result");
  //     if (result != null) {
  //       final uint8List = await VideoThumbnail.thumbnailData(
  //         video: result,
  //         imageFormat: ImageFormat.PNG,
  //         maxWidth:
  //             256, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  //         quality: 60,
  //       );
  //       debugPrint("uint8List thumbnail $uint8List");
  //       if (uint8List != null) {
  //         XFile xFile = XFile.fromData(uint8List);
  //
  //         debugPrint("Video Thumbnail ${xFile.path}");
  //         debugPrint("thumbnail $uint8List");
  //         callback.onSuccessVideo(result, uint8List as Uint8List?);
  //       } else {
  //         debugPrint('No video selected. 2');
  //       }
  //     }
  //   } else {
  //     debugPrint('No video selected. 3');
  //   }
  // }

  void openImagePicker({ImageType? imageType=.logo}) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) => GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 55),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColor.greenColorPrimery,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Camera",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      if (await isCameraEnabled()) {
                        Navigator.pop(context);
                        cropAspectRatioPreset != null
                            ? getImageWithCropping(ImageSource.camera)
                            : getImageWithoutCropping(ImageSource.camera,imageType:imageType);
                      }
                    },
                  ),
                  const SizedBox(width: 60),
                  GestureDetector(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColor.greenColorPrimery,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.image_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      if (await isStorageEnabled()) {
                        Navigator.pop(context);
                        cropAspectRatioPreset != null
                            ? getImageWithCropping(ImageSource.gallery)
                            : getImageWithoutCropping(ImageSource.gallery,imageType:imageType);
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.0,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusScopeNode());
        },
      ),
    );
  }

  /*Future<bool> openVideoPicker() async {
    await showModalBottomSheet(
      context: context,
      useRootNavigator: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) => GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha:0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Camera",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                    onTap: () async {
                      if (await isCameraEnabled()) {
                        Navigator.pop(context);
                        getVideo(ImageSource.camera);
                      }
                    },
                  ),
                  const SizedBox(width: 60),
                  GestureDetector(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.image_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                    onTap: () async {
                      if (await isStorageEnabled()) {
                        Navigator.pop(context);
                        getVideo(ImageSource.gallery);
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusScopeNode());
        },
      ),
    );
    return false;
  }*/

  /*Future<void> getVideo(ImageSource source, {isTrimming = true}) async {
    XFile? imageFile = await picker.pickVideo(
        source: source, maxDuration: const Duration(seconds: 10));
    if (imageFile != null) {
      debugPrint("Selected video => ${imageFile.path}");
      String? result;
      result = imageFile.path;

      debugPrint("pickVideoGallery $result");
      if (result != null) {
        final uint8List = await VideoThumbnail.thumbnailData(
          video: result,
          imageFormat: ImageFormat.PNG,
          maxWidth:
              256, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
          quality: 60,
        );
        debugPrint("uint8List thumbnail $uint8List");
        if (uint8List != null) {
          XFile xFile = XFile.fromData(uint8List);

          debugPrint("Video Thumbnail ${xFile.path}");
          debugPrint("thumbnail $uint8List");
          callback.onSuccessVideo(result, uint8List as Uint8List?);
        } else {
          debugPrint('No video selected.');
        }
      }
    } else {
      debugPrint('No video selected.');
    }
  }*/

  // void openImagePickerNew() {
  //   showAdaptiveActionSheet(
  //     context: context,
  //     title: const Text("Add a profile photo"),
  //     isDismissible: true,
  //     actions: [
  //       BottomSheetAction(
  //         title: Text(
  //           'Choose from library',
  //           style: TextStyle(
  //             color: AppColor.blueColor,
  //             fontWeight: FontWeight.w500,
  //             fontSize: 16,
  //           ),
  //         ),
  //         onPressed: (context) async {
  //           if (await isStorageEnabled()) {
  //             Navigator.pop(context);
  //             cropAspectRatio != null
  //                 ? getImageWithCropping(ImageSource.gallery)
  //                 : getImageWithoutCropping(ImageSource.gallery);
  //           }
  //         },
  //       ),
  //       BottomSheetAction(
  //           title: Text(
  //             'Take photo',
  //             style: TextStyle(
  //                 color: AppColor.blueColor,
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16),
  //           ),
  //           onPressed: (context) async {
  //             if (await isCameraEnabled()) {
  //               Navigator.pop(context);
  //               cropAspectRatio != null
  //                   ? getImageWithCropping(ImageSource.camera)
  //                   : getImageWithoutCropping(ImageSource.camera);
  //             }
  //           }),
  //     ],
  //     cancelAction: CancelAction(
  //         title: Text(
  //           'Cancel',
  //           style: TextStyle(
  //               color: AppColor.redColor,
  //               fontWeight: FontWeight.w400,
  //               fontSize: 16),
  //         ),
  //         onPressed: (BuildContext context) {
  //           Get.back();
  //         }),
  //   );
  // }

  Future getImageWithCropping(ImageSource imageSource) async {
    XFile? imageFile = await picker.pickImage(source: imageSource);
    CroppedFile? croppedFile;
    if (imageFile != null) {
      croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        /* aspectRatioPresets: [
          cropAspectRatioPreset!,
        ],*/
        aspectRatio: const CropAspectRatio(ratioX: 1.1, ratioY: 1.1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(minimumAspectRatio: 1.1, resetAspectRatioEnabled: true),
        ],
      );
    }
    if (croppedFile != null) {
      callback.onSuccessFile(croppedFile.path, "image");
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }

  Future getImageWithoutCropping(ImageSource imageSource,{ImageType? imageType}) async {
    if(imageType==.shopImages){
      List<XFile>? imageFiles = await picker.pickMultiImage();
      if (imageFiles.isNotEmpty) {
        for (XFile imageFile in imageFiles) {
          callback.onSuccessFile(imageFile.path, "image",imageType:imageType);
        }
      }
      return;
    }
    XFile? imageFile = await picker.pickImage(source: imageSource);
    if (imageFile != null) {
      callback.onSuccessFile(imageFile.path, "image",imageType:imageType);
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }

  Future<bool> isCameraEnabled() async {
    return true;
    /* var status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    }

    var newStatus = await Permission.camera.request();
    print("Camera Permission Status: $newStatus");

    if (newStatus.isGranted) {
      return true;
    } else if (newStatus.isPermanentlyDenied) {
      Future.delayed(const Duration(seconds: 1), () async {
        Utils.sucessSnackBar("Camera permission denied. Please allow access.");
        await openAppSettings();
      });
      return false;
    } else {
      Get.back();
      Utils.sucessSnackBar("Camera permission denied. Please allow access.");
      Future.delayed(const Duration(seconds: 1), () async {
        await openAppSettings();
      });
      return false;
    }*/
  }

  Future<bool> isStorageEnabled() async {
    return true;
    /*    Permission permission = Platform.isAndroid ? Permission.storage : Permission.photos;
    var status = await permission.status;

    if (status.isGranted || status.isLimited) {
      return true;
    }

    var newStatus = await permission.request();
    print("Storage/Photos Permission Status: $newStatus");

    if (newStatus.isGranted || newStatus.isLimited) {
      return true;
    } else if (newStatus.isPermanentlyDenied) {
      Future.delayed(const Duration(seconds: 1), () async {
        Utils.sucessSnackBar(
            Platform.isAndroid
                ? "Storage permission denied. Please allow access."
                : "Photos permission denied. Please allow access."
        );
        await openAppSettings();
      });
      return false;
    } else {
      Get.back();
      Utils.sucessSnackBar(
          Platform.isAndroid
              ? "Storage permission denied. Please allow access."
              : "Photos permission denied. Please allow access."
      );
      Future.delayed(const Duration(seconds: 1), () async {
        await openAppSettings();
      });
      return false;
    }*/
  }
}
