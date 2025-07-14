import 'package:eser/src/utils/screen_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Favourityscreen extends StatefulWidget {
  Favourityscreen({super.key});

  @override
  State<Favourityscreen> createState() => _FavourityscreenState();
}

class _FavourityscreenState extends State<Favourityscreen> {
  var controller = GetIt.instance<FavourityController>();
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchFavourity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.favourity,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: controller.loading,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Prodcutlistwidget(
                    product: controller.favourity[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteContstants.productDetailsRoute,
                        arguments: controller.favourity[index].id,
                      );
                    },
                    onTapFavourity: () {
                      controller.favourity.removeAt(index);
                      GetIt.instance<FavourityController>().favourityData(
                        context,
                        () {},
                        FavourityData(
                          productId: controller.favourity[index].id,
                        ),
                      );
                    },
                  );
                },
                itemCount: controller.favourity.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
