import 'package:eser/src/screen/CategoriesScreen/repository/data/CategoryData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Categoriesgrid extends StatelessWidget {
  CategoryData category;
  VoidCallback onTap;
  Categoriesgrid({required this.category,required this.onTap});
  var controller_langauge = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
             controller_langauge.currentLocale==Locale("tk")?   category.name!:category.nameRu!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  SizedBox(
                    width: 105,
                    child: Networkimagewidget(
                      url: Configs.imageUrl + category.thumbnailUrl!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
