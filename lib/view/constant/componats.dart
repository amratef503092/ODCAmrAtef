import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';
class Achievement extends StatelessWidget {
  const Achievement({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SvgPicture.asset(
              ImageAssets.star ,
            ),
            SizedBox(
              width: width * .04,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Learn UI/UX for beginners" ,style: getBoldStyle(color: ColorManager.headTextColor ,fontSize: AppSize.s18),),
                  Text("Achieved April 21 2022" ,style: getSemiBoldStyle(color: ColorManager.disableTextColor ),)

                ],
              ),
            )

          ],
        )
    );
  }
}
class CategoriesDesign extends StatelessWidget {
  String ? title;
  String ? imagePath;
  CategoriesDesign({Key? key,
    required this.title,
    required this.imagePath
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p14),
          child: Container(
            width: 73,
            height: 73,
            decoration:BoxDecoration(
              color: ColorManager.bacGroundCategory,
              borderRadius: BorderRadius.circular(AppSize.s14),
              boxShadow:  const [
                BoxShadow(
                  color: ColorManager.shadowCategory,
                  blurRadius: 2,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
            ),
            child: Image(
              image: NetworkImage(imagePath! ),
            ),
          ),
        ),
        SizedBox(
          width: 65,
          child: Text(title ?? "Error",style:getSemiBoldStyle(color: ColorManager.headTextColor ,
          ),
            textAlign: TextAlign.center
            ,),
        )
      ],
    );
  }
}