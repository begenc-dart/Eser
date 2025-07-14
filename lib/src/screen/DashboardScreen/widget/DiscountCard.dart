import 'package:eser/src/utils/screen_export.dart';

class Discountcard extends StatelessWidget {
  String image;
  String title;
  VoidCallback onTap;
  Discountcard({required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 10, bottom: 8),
          // height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Image.asset(image, width: 115, height: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
