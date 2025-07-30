import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/services/cloudinary_services.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utilits/constants/keys.dart';
import 'package:ecommerce_app/utilits/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utilits/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utilits/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utilits/helpers/helper_function.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  //[UploadCategories]- function to upload list of categories

  Future<void> uploadCategories(List<CategoryModel> categoris) async {
    try {
      for (final category in categoris) {
        File image = await UHelperFUnctions.assetToFile(category.image);

        dio.Response response = await _cloudinaryServices.uploadImage(
          image,
          UKeys.categoryFolder,
        );

        if (response.statusCode == 200) {
          category.image = response.data['url'];
        }

        await _db
            .collection(UKeys.categoryCollection)
            .doc(category.id)
            .set(category.toJson());

        log(
          "Categoy Uploaded on firebase & image on clodinary......: ${category.name}",
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

  //[FetchCategoriess]- Function to fetch list of categoriess

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final query = await _db.collection(UKeys.categoryCollection).get();

      if (query.docs.isNotEmpty) {
        List<CategoryModel> categories =
            query.docs
                .map((document) => CategoryModel.fromSnapshot(document))
                .toList();
        return categories;
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
