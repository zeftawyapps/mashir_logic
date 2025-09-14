import 'dart:io';

import 'package:JoDija_reposatory/source/firebase/crud_firebase_source.dart';
import 'package:JoDija_reposatory/source/user/accountLoginLogout/auth_email_source.dart';
import 'package:JoDija_reposatory/source/user/accountLoginLogout/auth_google_source.dart';
import 'package:JoDija_reposatory/source/user/proflle_actions.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mashir_service/data/interface/offers_interface.dart';
import 'package:mashir_service/data/repo/auth_repo.dart';
import 'package:mashir_service/data/repo/images_repo.dart';
import 'package:mashir_service/data/repo/landing_repo.dart';
import 'package:mashir_service/data/repo/offers_repo.dart';
import 'package:mashir_service/data/repo/products_repo.dart';
import 'package:mashir_service/data/repo/profile_repo.dart';
import 'package:mashir_service/data/repo/suggestment_repo.dart';
import 'package:mashir_service/data/repo/users_repo.dart';
import 'package:mashir_service/data/source/images_souerce.dart';
import 'package:mashir_service/data/source/offes_souerce.dart';
import 'package:mashir_service/data/source/suggestment_source.dart';

import '../consts/values/firebase_collections.dart';
import 'model/category.dart';
import 'model/product.dart';
import 'model/users_data.dart';
import 'repo/category_repo.dart';

class CategoryInjects {
  static CategoryRepo addCategory(
      {required Map<String, dynamic> dataModel, Object? file}) {
    CategoryRepo categoryRepo =
        CategoryRepo(DataSourceFirebaseSource<CategoryDataModel>.insert(
      dataModel: CategoryDataModel.fromJson(dataModel, ""),
      path: FirebaseCollection.categories,
      file: file,
    ));

    return categoryRepo;
  }

  static CategoryRepo editCategory(
      {required Map<String, dynamic> dataModel, Object? file, String? id}) {
    CategoryDataModel data = CategoryDataModel.fromJson(dataModel, id ?? "");

    CategoryRepo categoryRepo = CategoryRepo(
        DataSourceFirebaseSource<CategoryDataModel>.edit(
            dataModel: data,
            path: FirebaseCollection.categories,
            file: file,
            oldImg: data.image));
    return categoryRepo;
  }

  static CategoryRepo deleteCategory(String? oldImage) {
    CategoryRepo categoryRepo = CategoryRepo(
        DataSourceFirebaseSource<CategoryDataModel>.delete(
            path: FirebaseCollection.categories, oldImg: oldImage));
    return categoryRepo;
  }

  static CategoryRepo getCategoryRepo() {
    return CategoryRepo(DataSourceFirebaseSource(
      FirebaseCollection.categories,
    ));
  }
}

class ProductInjects {
  static ProductsRepo addProduct({
    required Map<String, dynamic> dataModel,
    Object? file,
    required String categoryId,
  }) {
    ProductsRepo productsRepo =
        ProductsRepo(DataSourceFirebaseSource<ProductDataModel>.insert(
      file: file,
      dataModel: ProductDataModel.fromJson(dataModel, ""),
      path: FirebaseCollection.productPath(categoryId),
    ));

    return productsRepo;
  }

  static ProductsRepo editProduct({
    required Map<String, dynamic> dataModel,
    required String categoryId,
    required String id,
  }) {
    ProductDataModel data = ProductDataModel.fromJson(dataModel, id);

    ProductsRepo productsRepo =
        ProductsRepo(DataSourceFirebaseSource<ProductDataModel>.edit(
      dataModel: data,
      path: FirebaseCollection.productPath(categoryId),
    ));
    return productsRepo;
  }

  static ProductsRepo deleteProduct({
    required String categoryId,
    String? oldImage,
  }) {
    ProductsRepo productsRepo =
        ProductsRepo(DataSourceFirebaseSource<ProductDataModel>.delete(
      path: FirebaseCollection.productPath(categoryId),
    ));
    return productsRepo;
  }

  static ProductsRepo getProductRepo(String categoryId) {
    return ProductsRepo(DataSourceFirebaseSource(
      FirebaseCollection.productPath(categoryId),
    ));
  }
}

class AuthInjects {
  static LogicAuthRepo signUp({required Map<String, dynamic> map}) {
    LogicAuthRepo accountSource = LogicAuthRepo(EmailPassowrdAuthSource(
        email: map["email"], pass: map["pass"], name: map["name"]));

    return accountSource;
  }

  static LogicAuthRepo signUpGoogle() {
    LogicAuthRepo accountSource = LogicAuthRepo(GoogleAuthSoucre());

    return accountSource;
  }

  static LogicAuthRepo signINGoogle() {
    LogicAuthRepo accountSource = LogicAuthRepo(GoogleAuthSoucre());

    return accountSource;
  }

  static LogicAuthRepo signIn({required Map<String, dynamic> map}) {
    LogicAuthRepo accountSource = LogicAuthRepo(EmailPassowrdAuthSource(
        email: map["email"], pass: map["pass"], name: map["name"]));
    return accountSource;
  }

  static LogicAuthRepo signInAsAdmin({required Map<String, dynamic> map}) {
    LogicAuthRepo accountSource = LogicAuthRepo(EmailPassowrdAuthSource(
        email: map["email"], pass: map["pass"], name: map["name"]));
    return accountSource;
  }
}
class UsersDataInjects {
 static UsersRepo getUsersDataRepo() {
    return UsersRepo(DataSourceFirebaseSource(
      FirebaseCollection.UsersData,
    ));
  }
}

class ProfileInjects {
  static ProfileRepo editProfile() {
    ProfileRepo accountSource =
        ProfileRepo(ProfileActions());
    return accountSource;
  }

  static LogicAuthRepo deleteProfile() {
    LogicAuthRepo accountSource =
        LogicAuthRepo(EmailPassowrdAuthSource(email: "", pass: "", name: ""));
    return accountSource;
  }
}

class OfferInjects {
  static OffersRepo injectOffer() {
    return OffersRepo(OffersDataSource());
  }
}

class StickerInjects {
  static ImagesRepo injectSticker() {
    return ImagesRepo(ImagesDataSource(path: "stickers"));
  }
}

class SuggestmentInjects{
  static SuggestmentRepo injectSuggestment() {
    return SuggestmentRepo(SuggestmentSource());
  }
}

class AvatarInjects {
  static ImagesRepo injectAvatar() {
    return ImagesRepo(ImagesDataSource(path: "avatars"));
  }
}

class BackgroundInjects {
  static ImagesRepo injectBackground() {
    return ImagesRepo(ImagesDataSource(path: "backgrounds"));
  }
}

class EventsInjects {
  static ImagesRepo injectEvent() {
    return ImagesRepo(ImagesDataSource(path: "events"));
  }
}

class LandingInjects {
  static LandingRepo injectLanding() {
    return LandingRepo();
  }
}
