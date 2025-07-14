import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/CategoriesScreen/repository/api/MarketApi.dart';
import 'package:eser/src/screen/CategoriesScreen/repository/data/CategoryData.dart';
import 'package:eser/src/screen/CategoriesScreen/repository/data/MarketData.dart';
part 'categories_controller.g.dart';

class CategoriesController = _CategoriesControllerBase with _$CategoriesController;

abstract class _CategoriesControllerBase with Store {
  @observable
  bool isCategories = true;

  @action
  void changeType() {
    isCategories = !isCategories;
  }

  @observable
  bool loading = false;

  final Marketapi repository = Marketapi(); // Fixed typo in class name

  @observable
  Status status = Status.loading;

  @action
  Future<bool> _fetchMarket(String url, ObservableList<MarketData> marketList) async {
    try {
      loading = true;
      status = Status.loading;
      final result = await repository.getMarket(url);
      runInAction(() {
        marketList.clear();
        marketList.addAll(result);
        status = Status.completed;
        loading = false;
      });
      return true;
    } catch (e) {
      runInAction(() {
        status = Status.error;
        loading = false;
      });
      return false;
    }
  }

  @observable
  ObservableList<MarketData> markets = ObservableList.of([]);

  @action
  Future<void> fetchVip(String url) => _fetchMarket(url, markets);

  @observable
  ObservableList<MarketData> newMarket = ObservableList.of([]);

  @action
  Future<void> fetchNewMarket(String url) => _fetchMarket(url, newMarket);
  
  @observable
  bool loadingCategory = false;

  @observable
  int currentPage = 1;

  @observable
  bool hasMore = true;

  @observable
  Status statusCategory = Status.loading;

  @observable
  String? errorMessage; // Added to store error details for UI

  
  //
  @action
  Future<void> _fetchCategy({
    bool isInitial = false,
    
    required ObservableList<CategoryData> products,
  }) async {
    loadingCategory = true;
    if (isInitial) {
      currentPage = 1;
      products.clear();
      hasMore = true;
      statusCategory = Status.loading;
      errorMessage = null;
    }

    if (!hasMore) return;

    try {
      statusCategory = Status.loading;

      final newItems = await repository.getCategory(
        page: currentPage,

        limit: 10,
       
      );

      products.addAll(newItems);

      // Update hasMore based on the number of items returned
      hasMore = newItems.length >= 10; // Adjust based on your API's page size
      currentPage++;
      statusCategory = Status.completed;
      loadingCategory = false;
    } catch (e) {
      statusCategory = Status.error;
      loadingCategory = false;
      errorMessage = e.toString();
      print('Error fetching categories: $e');
    } finally {
      loadingCategory = false;
    }
  }
  @observable
  ObservableList<CategoryData> category = ObservableList<CategoryData>();
  @action
  Future<void> fetchCategory(bool isRefresh) => _fetchCategy(
    
    products: category,
    isInitial: isRefresh,
  );
}