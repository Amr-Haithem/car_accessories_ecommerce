import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/category.dart';
import '../services/firestore/general_crud_firestore.dart';

class CategoriesFirestoreRepo {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();

  Future<List<Category>> getCategories(int? limit) async {
    List<Category> categories = [];
    QuerySnapshot<Map<String, dynamic>> data;

    if (limit != null) {
      data = await _generalCrudFirestore.generalGetWithStartAfterAndLimit(
          collectionName: AppFirestoreCollections.categoriesCollection,
          attributeNameToOrderBy: "id",
          valueToStartAfter: null,
          limit: limit);
    } else {
      data = await _generalCrudFirestore
          .generalGetCollection(AppFirestoreCollections.categoriesCollection);
    }

    for (var categoryData in data.docs) {
      categories.add(Category.fromMap(categoryData.data()));
    }
    return categories;
  }

  Future<void> setCategory({required Category category}) async {
    await _generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.categoriesCollection,
        category.id,
        category.toMap());
  }

  Future<void> updateCategory(
      {required String categoryId,
      required Map<String, dynamic> updatedData}) async {
    await _generalCrudFirestore.generalUpdatedocInAppCollection(
        collectionName: AppFirestoreCollections.categoriesCollection,
        docId: categoryId,
        docData: updatedData);
  }
}
