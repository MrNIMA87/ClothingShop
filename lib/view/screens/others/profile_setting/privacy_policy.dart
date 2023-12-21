import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/theme/textStyle/profile_style.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarSinglePage(title: 'Privacy Policy'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(Dimens.bodyMargin),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cancelation Policy',
                    style: ProfileStyle.titlePrivacy,
                  ),
                ),
                Text(
                  '''

The DuckDuckGo search engine does not track user searches or store online browsing history in any way. Its Privacy Policy agreement states that it does not collect or share any user information.
''',
                  style: ProfileStyle.bodyPrivacy,
                ),
                //Terms
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Terms & Condition',
                    style: ProfileStyle.titlePrivacy,
                  ),
                ),
                Text(
                  '''

Companies whose business models revolve around handling sensitive customer information find it incredibly important to establish trust with their users. A clear and comprehensive Privacy Policy agreement that tells users exactly what information the company collects and what it does with that information inspires confidence in a business. It gives users a sense of security knowing how much control they have over their personal data under the conditions they sign up for.

Your Privacy Policy agreement should inform your users about how your website or app handles their personal information. Your users must be also be informed about the reason for the collection of information, as well as how long their data will be stored on your servers.

Even if you don't collect personal information, you should disclose this fact in a Privacy Policy. It helps with transparency because users expect to see a Privacy Policy. If you don't have one at all, users may assume you're collecting a lot of personal information and not disclosing it rather than not collecting any.

The DuckDuckGo search engine does not track user searches or store online browsing history in any way. Its Privacy Policy agreement states that it does not collect or share any user information.''',
                  style: ProfileStyle.bodyPrivacy,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
