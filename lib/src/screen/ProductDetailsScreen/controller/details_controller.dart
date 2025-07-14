import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/dio_helper.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/ProductDetailsScreen/repository/api/OneProductApi.dart';
import 'package:eser/src/screen/ProductDetailsScreen/repository/data/OneProductData.dart';
part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  @observable
  int index = 0;
  @action
  change_index(int realIndex) {
    index = realIndex;
  }

  @observable
  int selectColor = 0;
  @action
  changeColor(int colorIndex) {
    selectColor = colorIndex;
  }

  @observable
  int selectSize = 0;
  @action
  changeSize(int sizeIndex) {
    selectSize = sizeIndex;
  }

  @observable
  int count = 1;
  @action
  add_count() {
    count++;
  }

  @action
  remove_count() {
    if (count > 1) {
      count--;
    }
  }
  @action
  changeFavourity(){
    isLike = !isLike;
  }
  @observable
  bool isLike = false;
  @observable
  bool loading = true;
  @observable
  Status status = Status.none;
  Oneproductapi repository = Oneproductapi();
  @observable
  OneProductData? products;
  @observable
  ObservableList image = ObservableList.of([]);
  @action
  Future<void> fetchProduct({required int product_id}) async {
    loading = true;
    try {
      status = Status.loading;
      final newItems = await repository.getProduct(product_id: product_id);
      products = newItems;
      image = ObservableList.of([
        Configs.imageUrl + newItems.thumbnailUrl.toString(),
        for (int i = 0; i < newItems.thumbnails.length; i++)
          Configs.imageUrl + newItems.thumbnails[i].imageUrl.toString(),
      ]);
      isLike = newItems.isFavorite!;
      status = Status.completed;
      loading = false;
    } catch (e) {
      status = Status.error;
      loading = false;
    } finally {
      loading = false;
    }
  }
}
