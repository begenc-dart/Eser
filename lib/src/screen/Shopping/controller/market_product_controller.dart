import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/Shopping/repository/api/MarketProductApi.dart';
import 'package:eser/src/screen/Shopping/repository/data/MarketProductData.dart';
import 'package:eser/src/utils/screen_export.dart';
part 'market_product_controller.g.dart';

class MarketProductController = _MarketProductControllerBase with _$MarketProductController;

abstract class _MarketProductControllerBase with Store {
   @observable
  bool loading = false;

  @observable
  int currentPage = 1;

  @observable
  bool hasMore = true;

  @observable
  Status status = Status.loading;

  @observable
  String? errorMessage; // Added to store error details for UI
@observable
Market? markets;
  Marketproductapi repository = Marketproductapi();
  //
  @action
  Future<void> _fetchProduct({
    bool isInitial = false,
    required int product_id,
    required ObservableList<ProductData> products,
  }) async {
    loading = true;
    if (isInitial) {
      currentPage = 1;
      
      products.clear();
      hasMore = true;
      status = Status.loading;
      errorMessage = null;
    }

    if (!hasMore) return;

    try {
      status = Status.loading;

      final newItems = await repository.getProduct(
        page: currentPage,

        limit: 10, market_id: product_id,
       
      );

      products.addAll(newItems.products!.items);
  markets = newItems.market;
      // Update hasMore based on the number of items returned
      hasMore = newItems.products!.items.length >= 10; // Adjust based on your API's page size
      currentPage++;
      status = Status.completed;
      loading = false;
    } catch (e) {
      status = Status.error;
      loading = false;
      errorMessage = e.toString();
      
    } finally {
      loading = false;
    }
  }
  @observable
  ObservableList<ProductData> market = ObservableList<ProductData>();
  @action
  Future<void> fetchProduct(bool isRefresh,int market_id) => _fetchProduct(
    
    products: market,
    isInitial: isRefresh, product_id: market_id,
  );
}