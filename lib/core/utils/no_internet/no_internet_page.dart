import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../data/api/utils/ui_messages.dart';
import '../../../res/assets.dart';
import '../../../routes/k_routes.dart';
import '../../../widgets/customs/custom_button.dart';
import '../../extension/sizedbox_extention.dart';
import '../../utils/app_text_styles.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Column(
              children: [
                10.sH,
                Text(
                  ' اتصال الانترنت',
                  style: KAppTextStyle.boldTextStyle.copyWith(fontSize: 20, color: Colors.black),
                ),
                10.sH,
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                KAppPngs.noInternet,
                height: 200,
                width: 200,
              ),
              15.sH,
              Text(
                'لا يوجد اتصال بالانترنت ',
                style: KAppTextStyle.regularTextStyle.copyWith(
                  fontSize: 20,
                  // color: Colors.black
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
            child: CustomButton(
              isLoading: isLoading,
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                // print('/===/=====//==//=/=/=/=/=/=/=/=//=/=/=/=/=/=//=/=/=//=/=/=/=/=/=/=/');
                bool hasConnection = await InternetConnectionChecker().hasConnection;
                Future.delayed(Duration.zero, () {
                  if (hasConnection) {
                    Navigator.pushReplacementNamed(context, KAppRoutes.splash);
                  } else {
                    showErrorToast(
                      context: context,
                      msg: 'لا يوجد اتصال بالانترنت',
                    );
                  }
                });

                setState(() {
                  isLoading = false;
                });
              },
              text: 'اعد المحاولة',
              textSize: 16,
              borderRadius: 40,
            ),
          ),
        ],
      ),
    );
  }
}
