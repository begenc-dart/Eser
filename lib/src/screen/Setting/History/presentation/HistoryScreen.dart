import 'package:eser/src/screen/Setting/History/controller/history_controller.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Historyscreen extends StatefulWidget {
  Historyscreen({super.key});

  @override
  State<Historyscreen> createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  var controller = GetIt.instance<HistoryController>();
@override
  void initState() {
    // TODO: implement initState
    controller.fetchHistory();
    super.initState();
  }
  var language_controller = GetIt.instance<LangugaeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.order,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: controller.loading,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                 language_controller.currentLocale == Locale("tk")? controller.history[index].marketName!:controller.history[index].marketNameRu!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 20),
                                ),
                                // Icon(Icons.info_outline)
                                Container(),
                              ],
                            ),
                          ),
                          Divider(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerLow,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          for (
                            int i = 0;
                            i < controller.history[index].products.length;
                            i++
                          )
                            Historyproduct(
                              product: controller.history[index].products[i],
                            ),
                          Divider(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerLow,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.sum,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${controller.history[index].sum} TMT",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: controller.history.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
            ),
          );
        },
      ),
    );
  }
}
