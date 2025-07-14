import 'package:eser/src/utils/screen_export.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showSearch(context: context, delegate: CustomSearchDelegate());
      },
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Theme.of(context).colorScheme.onSurface),
            SizedBox(width: 10),
            Text(
              AppLocalizations.of(context)!.search,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
