import 'package:eser/src/utils/screen_export.dart';

class Bottomnavorder extends StatelessWidget {
  VoidCallback onTap;
  String sum;
   Bottomnavorder({required this.onTap,required this.sum});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 55,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${sum} TMT",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
              ),
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.conformOrder,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.onPrimaryFixed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
