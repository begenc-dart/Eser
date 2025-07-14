import 'package:eser/src/utils/screen_export.dart';

class Filterscreen extends StatefulWidget {
  VoidCallback onTap;
  Filterscreen({required this.onTap});

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  var controller = GetIt.instance<FilterController>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.init_sort(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Containerbutton(
        onTap: () {
          widget.onTap();
          Navigator.pop(context);
        },
        title: AppLocalizations.of(context)!.filted,
      ),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.filter,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                controller.clearController();
              },
              child: Text(
                AppLocalizations.of(context)!.clean,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.price,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Pricesorttextfield(
                  controller: controller.minController,
                  focusNode: controller.minFocus,
                  hintText: AppLocalizations.of(context)!.started,
                  onTapOutside: (value) {
                    controller.minFocus.unfocus();
                  },
                ),
                SizedBox(width: 10),
                Pricesorttextfield(
                  controller: controller.maxController,
                  focusNode: controller.maxFocus,
                  hintText: AppLocalizations.of(context)!.ended,
                  onTapOutside: (value) {
                    controller.maxFocus.unfocus();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.sorted,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children:
                  controller.filterList
                      .map(
                        (e) => Observer(
                          builder: (context) {
                            return RadioListTile(
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: e.value,
                              groupValue: controller.select_sort,
                              onChanged: (value) {
                                controller.change_value(value!);
                              },
                              title: Text(e.title),
                            );
                          },
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
