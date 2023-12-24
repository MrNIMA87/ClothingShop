import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/Strings/welcome_strings.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/welcome_style.dart';
import 'package:clothing_shop/view/screens/sign/sign_in.dart';
import 'package:clothing_shop/view/widgets/notifications/eror_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //images
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //image 1
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: Get.height / 2.3,
                    width: Get.width / 2.8,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(60),
                        bottom: Radius.circular(60),
                      ),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.welcome1.path),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //image 2
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: Get.height / 4.3,
                        width: Get.width / 2.8,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(60),
                            bottom: Radius.circular(60),
                          ),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.welcome2.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //image 3
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: Get.height / 5.4,
                        width: Get.width / 2.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.welcome3.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Dimens.bodyMargin.height,
              //Title
              RichText(
                textAlign: TextAlign.center,
                maxLines: 2,
                text: const TextSpan(
                  text: '',
                  style: WelcomeStyle.title,
                  children: [
                    TextSpan(
                      text: 'The',
                      style: WelcomeStyle.title,
                    ),
                    TextSpan(
                      text: 'Fashion App',
                      style: WelcomeStyle.nameApp,
                    ),
                    TextSpan(
                      text: WelcomeStrings.textAfterWelcomeScreen,
                      style: WelcomeStyle.title,
                    ),
                  ],
                ),
              ),
              Dimens.bodyMargin.height,
              const Text(
                WelcomeStrings.info,
                style: WelcomeStyle.info,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
              Dimens.bodyMargin.height,
              //Button Next Page
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  elevation: MaterialStatePropertyAll(0),
                ),
                onPressed: () {
                  sendErrorNotification(context, 'Not Registered',
                      'You have an active account and you need to register');
                },
                child: Container(
                  width: double.maxFinite,
                  height: Get.height / 14,
                  decoration: const BoxDecoration(
                    color: GeneralColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Let\'s Get Started',
                      style: WelcomeStyle.button,
                    ),
                  ),
                ),
              ),
              Dimens.bodyMargin.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    WelcomeStrings.signIn,
                    style: WelcomeStyle.infoSignIn,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: GeneralColors.primaryColor,
                    ))),
                    child: TextButton(
                      onPressed: () => Get.to(() => SignIn()),
                      child: const Text(
                        'Sign in',
                        style: WelcomeStyle.signIn,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
