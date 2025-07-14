import 'package:eser/src/screen/Shopping/repository/data/MarketProductData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Storyinformationwidget extends StatelessWidget {
  Market? market;
  Storyinformationwidget({this.market});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            child: Networkimagewidget(
              url: Configs.imageUrl + market!.thumbnailUrl!,
            ),
          ),
          SizedBox(height: 16),
          Storyinformation(title: market!.location!, url: Staticsimage.located),
          SizedBox(height: 16),
          Storyinformation(title: market!.phone!, url: Staticsimage.phone),
        ],
      ),
    );
  }
}
