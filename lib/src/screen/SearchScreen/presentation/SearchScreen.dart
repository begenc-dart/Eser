import 'package:eser/src/screen/SearchScreen/widget/SearchResult.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.colorScheme.onSecondary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Rounded pill shape
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
        // prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        // suffixIcon: Icon(Icons.tune, color: Colors.grey[600]),
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: TextStyle(color: theme.colorScheme.primary, fontSize: 16),
      ),
    );
  }
var filterController = GetIt.instance<FilterController>();
var dashboard_controller = GetIt.instance<DashboardController>();
  // These methods are mandatory you cannot skip them.
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteContstants.filterScreenRoute,arguments: (){
            String filter = "";
            if (filterController.minController.text.isNotEmpty) {
              filter += "start_price=${filterController.minController.text}&";
            }
            if(filterController.maxController.text.isNotEmpty){
              filter +="end_price=${filterController.maxController.text}&";
            }
            if (filterController.select_sort=="cheep") {
               filter +="sort=cheap_to_expensive&";
            }
            else if(filterController.select_sort == "expensive"){
              filter +="sort=expensive_to_cheap &";
            }
            else if(filterController.select_sort =="discount"){
              filter += "has_discount=true";
            }
            else if(filterController.select_sort =="new"){
              filter += "is_new=true";
            }
            dashboard_controller.changeFilter(filter);
            // dashboard_controller.fetchSearchProducts(query, true);
            
          });
        },
        child: SvgPicture.asset(
          Staticsimage.filter,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      SizedBox(width: 15),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).colorScheme.primary,
      ),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

 @override
  Widget buildResults(BuildContext context) {
    // Simplified query passing
    return Searchresult(query: query, controller: dashboard_controller,); }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
