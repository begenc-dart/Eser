

import 'package:eser/src/utils/screen_export.dart';

class Networkimagewidget extends StatelessWidget {
  String url;
  BoxFit fit;
  Networkimagewidget({required this.url,this.fit=BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,fit:fit ,

      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
