import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/DashboardScreen/repository/api/ProductApi.dart';
import 'package:eser/src/screen/DashboardScreen/repository/data/product_data.dart';
import 'package:eser/src/utils/screen_export.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  @observable
  int index = 0;
  @action
  carusel_index(int selected_index) {
    index = selected_index;
  }

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

  final ProductApi repository = ProductApi();
  //
  @action
  Future<void> _fetchProduct({
    bool isInitial = false,
    required String url,
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

        limit: 10,
        url: url + "page=${currentPage}",
      );

      products.addAll(newItems);

      // Update hasMore based on the number of items returned
      hasMore = newItems.length >= 10; // Adjust based on your API's page size
      currentPage++;
      status = Status.completed;
      loading = false;
    } catch (e) {
      status = Status.error;
      loading = false;
      errorMessage = e.toString();
      print('Error fetching categories: $e');
    } finally {
      loading = false;
    }
  }

  @observable
  String filter = "";
  @action
  changeFilter(String value) {
    filter = value;
  }

  var verification = GetIt.instance<VerificationController>();
  @observable
  ObservableList<ProductData> product = ObservableList<ProductData>();
  @action
  Future<void> fetchProducts(bool isRefresh) => _fetchProduct(
    url:
        verification.hasData
            ? '${Apiurl.productApi}?limit=10&'
            : '${Apiurl.product}?limit=10&',
    products: product,
    isInitial: isRefresh,
  );
  @observable
  ObservableList<ProductData> searchProduct = ObservableList<ProductData>();
  @action
  Future<void> fetchSearchProducts(String searched, bool isRefreht) =>
      _fetchProduct(
        url:
            verification.hasData
                ? '${Apiurl.productApi}?limit=10&search=${searched}&${filter}'
                : '${Apiurl.product}?limit=10&search=${searched}&${filter}',
        products: searchProduct,
        isInitial: isRefreht,
      );
  ObservableList<ProductData> discountProduct = ObservableList<ProductData>();
  @action
  Future<void> fetchDiscountProducts(bool isRefreht, String url) =>
      _fetchProduct(
        url:
            verification.hasData
                ? '${Apiurl.productApi}?limit=10&$url&${filter}'
                : '${Apiurl.product}?limit=10&$url&${filter}',
        products: searchProduct,
        isInitial: isRefreht,
      );
}
