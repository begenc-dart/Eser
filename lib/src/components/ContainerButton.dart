
import 'package:eser/src/utils/screen_export.dart';

class Containerbutton extends StatelessWidget {
  VoidCallback onTap;
  String title;
   Containerbutton({required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          padding: EdgeInsets.symmetric(vertical: 15),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 6),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Center(
            child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                  ),
                ),
          ),
        ),
      );
  }
}