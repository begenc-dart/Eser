import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:eser/main.dart';
import 'package:eser/src/screen/auth/VerificationScreen/controller/verification_controller.dart';
import 'package:eser/src/utils/screen_export.dart';

class Verificationpage extends StatefulWidget {
  String phone;
  Verificationpage({required this.phone});

  @override
  State<Verificationpage> createState() => _VerificationpageState();
}

class _VerificationpageState extends State<Verificationpage> {
  var _controller = GetIt.instance<VerificationController>();
  // var logincontroller = GetIt.instance<LoginController>();
  @override
  void initState() {
    // TODO: implement initState
    _controller.startTimer();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.verificationCode,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.code,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: VerificationCode(
              itemSize: 50,
              // textStyle: Theme.of(context).colorScheme.secondary,
              keyboardType: TextInputType.number,
              fillColor: Theme.of(context).colorScheme.onPrimary,
              underlineWidth: 0,
              length: 4,
              cursorColor: Colors.black,
              fullBorder: true,
              margin: EdgeInsets.only(left: 2, right: 2),
              onCompleted: (String value) {
                _controller.writingCode(value);
              },
              onEditing: (bool value) {
                _controller.isEditing(value);
                if (_controller.onEditing) FocusScope.of(context).unfocus();
              },
            ),
          ),

          Observer(
            builder: (_) {
              return Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 22),
                child:
                    _controller.seconds != 0
                        ? Text(
                          _controller.formattedTime,
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                        : InkWell(
                          onTap: () {
                            _controller.startTimer();
                          },
                          child: Column(
                            children: [
                              Text(
                                _controller.formattedTime,
                                style: Theme.of(
                                  context,
                                ).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                AppLocalizations.of(context)!.newSend,
                                style:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyLarge!.copyWith(),
                              ),
                            ],
                          ),
                        ),
              );
            },
          ),
          SizedBox(height: 25),
          Containerbutton(
            onTap: () {
              _controller.verification(context, () async {
                await GetIt.instance<VerificationController>().tokenGet();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (e) => false,
                );
              }, widget.phone);
            },
            title: AppLocalizations.of(context)!.next,
          ),
        ],
      ),
    );
  }
}
