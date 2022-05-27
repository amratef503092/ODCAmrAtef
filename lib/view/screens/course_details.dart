import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc/view/resource/assets_manager.dart';
import 'package:odc/view/resource/color_manager.dart';
import 'package:odc/view/resource/style_manager.dart';
import 'package:odc/view/resource/text_manager.dart';
import 'package:odc/view/resource/value_manager.dart';

import '../../controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import '../constant/componats.dart';

class CourseDetails extends StatelessWidget {

    CourseDetails();

  @override
  Widget build(BuildContext context) {
   final CourseDetail courseDetails= ModalRoute.of(context)?.settings.arguments as CourseDetail;

    if (kDebugMode) {
      print(courseDetails);
    }
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = HomePageCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  imageDetailesScreen(context: context , height: height ,width: width ,image: courseDetails.image),
                  SizedBox(
                    height: height*.01,
                  ),
                 textDetailesScreen(title :  courseDetails.title, subTitle : courseDetails.subTitle
                     ),
                  SizedBox(
                    height: height*.01,
                  ),
                  buildButton(width: width, height: height , function : (){}),
                  SizedBox(
                    height: height*.01,
                  ),
                  Align(alignment: Alignment.topLeft,child:  Text(TextManager.aboutThisCourse
                    , style: getSemiBoldStyle(color: ColorManager.black ,fontSize: AppSize.s18),)),
                  SizedBox(
                    height: height*.01,
                  ),
                  Text(
                      "Welcome to your UX Design for Beginners Course. In the following tutorials, you'll get a thorough introduction to UX design, from its definition, areas and origins through to the skills you need to build a professional portfolio and become a UX designer. "

                 ,style: getMediumStyle(color: ColorManager.black , fontSize: AppSize.s14), ),
                  textRowCourse(
                    text: courseDetails.level,
                    pathSvg: ImageAssets.level
                  ),
                  textRowCourse(
                      text: "Cairo",
                      pathSvg: ImageAssets.location
                  ),

                  Align(alignment: Alignment.topLeft,child:  Text(TextManager.youMayBeInterestedIn
                    , style: getSemiBoldStyle(color: ColorManager.black ,fontSize: AppSize.s18),)),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row textRowCourse({
  required String ? pathSvg,
    required  String ? text
}) {
    return Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p14),
                    child: SvgPicture.asset(
                      pathSvg!,
                    ),
                  ),
                  Text(text! ,style: getSemiBoldStyle(color: ColorManager.headTextColor
                      ,fontSize: AppSize.s14 )),
                ]
              );
  }

  Column textDetailesScreen({String  ? title  , String ?subTitle}) {

    return Column(
               children: [
                 Text(title! ,style: getBoldStyle(color: ColorManager.headTextColor,fontSize: AppSize.s24), ),
                 Text(subTitle! ,style: getSemiBoldStyle(color: ColorManager.captionTextColor,fontSize: AppSize.s14), ),
               ],
             );
  }

  ElevatedButton buildButton(
      {double? width, double ? height, Function? function}) {
    return ElevatedButton(onPressed: (){
      function!();
              },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width!*0.8,height!*.1)
                ), child:  Text(TextManager.startCourse ,
                style: getSemiBoldStyle(color: ColorManager.whiteColor ,
                    fontSize: AppSize.s14),
                ) ,

              );
  }

  Stack imageDetailesScreen(
      {required BuildContext context, double? height, double? width , String?image}) {
    return Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s18),
                    child:  Image(
                        image: NetworkImage(
                    image!,),
                    width: width,
                    ),
                  ),
                 Positioned(
                   left: 24,
                   top: 24,
                   child: buutonBack(context: context),
                 ),

                ],
              );
  }

  GestureDetector buutonBack({
  required BuildContext context,
}) {
    return GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: Container(
                      height: 50,
                       width: 50,
                       decoration: BoxDecoration(
                         color: ColorManager.black.withOpacity(0.30),
                          borderRadius: BorderRadius.circular(AppSize.s10),
                       ),
                       child:const  Center(
                         child:Icon(
                           Icons.arrow_back,
                           size: AppSize.s28,
                           color: ColorManager.whiteColor,
                         ),
                       ),

                     ),
                   );
  }
}
