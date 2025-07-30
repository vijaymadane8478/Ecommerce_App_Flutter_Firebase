import 'package:ecommerce_app/data/repositories/category/category_repository.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utilits/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  //Variables
  final _repository = Get.put(CategoryRepository());
  RxList<CategoryModel> allcategoris = <CategoryModel>[].obs;
  RxList<CategoryModel> featureCategoris = <CategoryModel>[].obs;

  RxBool isCategoriesLoading = false.obs;

  onInit() {
    fetchCategories();
    super.onInit();
  }

  //Function fetch all categories & featured categories
  Future<void> fetchCategories() async {
    try {
      //start loading
      isCategoriesLoading.value = true;

      //fetch categories
      List<CategoryModel> categories = await _repository.getAllCategories();
      allcategoris.assignAll(categories);
      //get featured categories
      featureCategoris.assignAll(
        categories.where(
          (category) => category.isFeatured && category.parentId.isEmpty,
        ),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    } finally {
      isCategoriesLoading.value = false;
    }
  }
}
