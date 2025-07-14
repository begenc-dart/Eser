import 'package:eser/src/utils/screen_export.dart';
import 'package:toastification/toastification.dart';
class Toastwidget {
  toast(BuildContext context, String title) {
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      alignment: Alignment.bottomCenter,
       foregroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
      icon: Icon(Icons.done, color: Theme.of(context).colorScheme.onSecondary),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  toastError(BuildContext context, String title) {
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
        ),
      ),
      backgroundColor: Colors.red,
      alignment: Alignment.bottomCenter,
      primaryColor: Theme.of(context).colorScheme.onPrimaryFixed,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
      icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onPrimaryFixed),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
