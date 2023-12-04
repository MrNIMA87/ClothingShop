
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedColorCategory extends StatelessWidget {
  const SelectedColorCategory({
    super.key,
    required this.selectColor,
    required this.selectedIndexColor,
  });

  final List selectColor;
  final RxInt selectedIndexColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectColor.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () => selectedIndexColor.value = index,
              child: Obx(
                () => Container(
                  width: 32,
                  decoration: BoxDecoration(
                    color: selectColor[index],
                    shape: BoxShape.circle,
                  ),
                  child: Visibility(
                      visible: selectedIndexColor == index
                          ? true
                          : false,
                      child: Center(
                        child: Container(
                          width: 15,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
