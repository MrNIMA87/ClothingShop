import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

appBar() {
  return PreferredSize(
      preferredSize: const Size.fromHeight(55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //menu
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_open,
              color: GeneralColors.iconsColor,
              size: Dimens.iconsAppBarSize,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //search
              SvgPicture.asset(
                Assets.icons.search,
                color: Colors.white,
              ),

              //Pending purchase
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.store,
                ),
              ),
            ],
          )
        ],
      ));
}
