import 'package:eser/src/utils/screen_export.dart';

class Savebutton extends StatelessWidget {
  VoidCallback onTapCancel;
  VoidCallback onTapConform;
  String titleCancel;
  String titleConform;
  bool isColorless;
  Savebutton({
    required this.onTapCancel,
    required this.isColorless,
    required this.onTapConform,
    required this.titleCancel,
    required this.titleConform,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTapCancel,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color:
                    isColorless ? Theme.of(context).colorScheme.onError : null,
                borderRadius: BorderRadius.circular(15),
                border:
                    isColorless
                        ? null
                        : Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
              ),
              child: Center(
                child: Text(
                  titleCancel,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color:
                        isColorless
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: InkWell(
            onTap: onTapConform,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 6),
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                ],
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Center(
                child: Text(
                  titleConform,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
