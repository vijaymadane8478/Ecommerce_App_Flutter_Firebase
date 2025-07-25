import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/authentication_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_models.dart';
import 'package:ecommerce_app/utilits/constants/keys.dart';
import 'package:ecommerce_app/utilits/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_app/utilits/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utilits/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utilits/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instace => Get.find();

  //variables

  final _db = FirebaseFirestore.instance;

  //[Store]Funcation for store Data
  ///[Read]
  //
  //
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  //[Read]Funcation for Fetch Data
  ///[Read]
  //
  //
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db
              .collection(UKeys.userCollection)
              .doc(AuthenticationRepository.instance.currentUser!.uid)
              .get();
      if (documentSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }
      return UserModel.empty();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  //[Update]Funcation for update user Data
  ///[update]
  //
  //
  Future<void> updateSingleFields(Map<String, dynamic> map) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .update(map);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  //delete user record
  Future<void> removeUserRecord(String id) async {
    try {
      await _db.collection(UKeys.userCollection).doc(id).delete();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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
