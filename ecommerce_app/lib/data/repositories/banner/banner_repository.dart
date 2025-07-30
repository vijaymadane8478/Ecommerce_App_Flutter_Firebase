import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/services/cloudinary_services.dart';
import 'package:ecommerce_app/features/shop/models/banners_models.dart';
import 'package:ecommerce_app/utilits/constants/keys.dart';
import 'package:ecommerce_app/utilits/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utilits/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utilits/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;
  final _cloudinarySerrvices = Get.put(CloudinaryServices());

  ///[UPLOADBANNERS]----function to upload banner
  Future<void> uploadBanner(List<BannerModel> banners) async {
    try {
      for (final banner in banners) {
        //Convert assetspath to file
        File image = await UHelperFUnctions.assetToFile(banner.imageUrl);

        //upload banner image to cloudinary
        dio.Response response = await _cloudinarySerrvices.uploadImage(
          image,
          UKeys.bannersFolder,
        );
        if (response.statusCode == 200) {
          banner.imageUrl = response.data['url'];
        }

        //push to firebaser firestore
        await _db.collection(UKeys.bannerCollection).doc().set(banner.toJson());

        log(
          "Banner url Uploaded on firebase & image on clodinary......: ${banner.targetScreen}",
        );
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong, Please try Again");
    }
  }

  Future<List<BannerModel>> fetchActiveBanners() async {
    try {
      final query =
          await _db
              .collection(UKeys.bannerCollection)
              .where('active', isEqualTo: true)
              .get();
      if (query.docs.isNotEmpty) {
        List<BannerModel> banners =
            query.docs
                .map((document) => BannerModel.fromDocument(document))
                .toList();
        return banners;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong, Please try Again");
    }
  }
}
