import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/view/screens/sign/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/dimens.dart';
import '../../../theme/textStyle/welcome_style.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  RxInt selectIndexPage = 0.obs;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimens.bodyMargin),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              selectIndexPage.value = index;
            },
            children: [
              //page 1
              OnboardingPage(
                image: Assets.images.onboarding1.path,
                boldTitle: 'Seamless',
                info: '''Lorem ipsum dolor sit amet, consecrator
adipiscing elit, sed do eiusmod tempor incididunt''',
                titleAfterBoldTitle: 'Shopping Experience',
                selectIndexPage: selectIndexPage,
                pageController: pageController,
              ),
              //Page 2
              OnboardingPage(
                image: Assets.images.onboarding2.path,
                boldTitle: 'Seamless',
                info: '''Lorem ipsum dolor sit amet, consecrator
adipiscing elit, sed do eiusmod tempor incididunt''',
                titleAfterBoldTitle: 'Shopping Experience',
                selectIndexPage: selectIndexPage,
                pageController: pageController,
              ),
              //Page 3
              OnboardingPage(
                image: Assets.images.onboarding3.path,
                boldTitle: 'Seamless',
                info: '''Lorem ipsum dolor sit amet, consecrator
adipiscing elit, sed do eiusmod tempor incididunt''',
                titleAfterBoldTitle: 'Shopping Experience',
                selectIndexPage: selectIndexPage,
                pageController: pageController,
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  OnboardingPage({
    super.key,
    required this.image,
    required this.boldTitle,
    required this.info,
    required this.titleAfterBoldTitle,
    required this.selectIndexPage,
    required this.pageController,
  });
  String image = Assets.images.onboarding1.path;
  String boldTitle = 'Seamless';
  String titleAfterBoldTitle = 'Shopping Experience';
  String info = 'Lorem';
  RxInt selectIndexPage = 0.obs;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //sample Image
        Container(
          width: Get.width / 1.5,
          height: Get.height / 1.8,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Dimens.bodyMargin.height,
        //Title
        RichText(
          textAlign: TextAlign.center,
          maxLines: 2,
          text: TextSpan(
            text: '',
            style: WelcomeStyle.title,
            children: [
              TextSpan(
                text: boldTitle,
                style: WelcomeStyle.nameApp,
              ),
              TextSpan(
                text: titleAfterBoldTitle,
                style: WelcomeStyle.title,
              ),
            ],
          ),
        ),
        Dimens.bodyMargin.height,
        //info
        Text(
          info,
          style: WelcomeStyle.info,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
        Dimens.bodyMargin.height,
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Button For back page
            Container(
              width: Get.width / 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: GeneralColors.primaryColor),
              ),
              child: IconButton(
                onPressed: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.ease);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: GeneralColors.primaryColor,
                  size: 20,
                ),
              ),
            ),

            //
            SizedBox(
              width: Get.width / 5,
              height: Get.height / 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Container(
                      margin: const EdgeInsets.all(5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectIndexPage == index
                            ? GeneralColors.primaryColor
                            : Colors.grey[300],
                      ),
                    ),
                  );
                },
              ),
            ),
            //Button For go to next page
            Container(
              width: Get.width / 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: GeneralColors.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  if (selectIndexPage == 2) {
                    Get.to(() => const SignUp(),);
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.ease);
                    print(selectIndexPage);
                  }
                },
                icon: Obx(
                  () => Icon(
                    selectIndexPage == 2
                        ? Icons.check
                        : Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
