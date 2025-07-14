import 'package:flutter/material.dart';
import 'package:eser/src/screen/auth/WelcomeScreen/widget/SelectedAuthContainer.dart';
import 'package:eser/src/utils/StaticsImage.dart';
import 'package:eser/src/utils/screen_export.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "ESER",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.welcome,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Image.asset(Staticsimage.layer),
                    Image.asset(Staticsimage.artboard),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 30),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  child: Column(
                    children: [
                      Selectedauthcontainer(
                        title: AppLocalizations.of(context)!.createAcount,
                        color: Theme.of(context).colorScheme.secondary,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(fontSize: 16), onTap: () {  
                          Navigator.pushNamed(context, RouteContstants.Createaccountscreen);
                        },
                      ),
                      SizedBox(height: 16,),
                      Selectedauthcontainer(
                        title: AppLocalizations.of(context)!.login,
                        color: Theme.of(context).colorScheme.onPrimary,
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(fontWeight: FontWeight.w500), onTap: () { 
                              Navigator.pushNamed(context, RouteContstants.loginScreen);
                             },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
