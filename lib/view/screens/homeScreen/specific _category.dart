import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import 'package:odc/view/constant/design.dart';

import '../../constant/componats.dart';
import '../../resource/color_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/text_manager.dart';
import '../../resource/value_manager.dart';

class SpecificCategory extends StatelessWidget {
  
  const SpecificCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    return BlocConsumer<HomePageCubit, HomePageState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit = HomePageCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            cubit.getCategoryId!.data!.categoryName.toString(),
            style: getBoldStyle(color: Colors.black, fontSize: AppSize.s18),
          ),
        ),
        body: SizedBox(
          height: height*.2,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child:ListView.separated(itemBuilder: (context , index){
              return  builditemCategoryById(
                width: width, height: height,
                image: cubit.getCategoryId!.data!.courses![index].imageUrl.toString(),
                title: cubit.getCategoryId!.data!.courses![index].courseName.toString(),
                function: (){},
                admin: cubit.getCategoryId!.data!.courses![index].admin!.adminName.toString() ,
              );
            },
                separatorBuilder: (context , index){
              return Divider(
                thickness: 1,
              );

            },
                itemCount: cubit.getCategoryId!.data!.courses!.length)
          ),
        ),

    );});
  }

  GestureDetector builditemCategoryById(
      {
        required double width, required double height ,
      required Function function,
        required String image,
        required String title,
        required String admin
      }) {
    return GestureDetector(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s18),
                  child:  Image(
                    image: NetworkImage(image ),
                    width: width*.4,
                  ),
                ),
                SizedBox(
                  width: width*.05
                ),
                SizedBox(
                  width: width * .45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${title} ",
                        style: getBoldStyle(color: ColorManager.headTextColor ,fontSize: AppSize.s18 ,

                        ),
                      ),
                      SizedBox(
                          height: height*.02
                      ),
                      Text(
                          "${ admin} . 14 Hours",
                        style: getBoldStyle(color: ColorManager.textAdminColor),
                      ),
                    ],
                  ),
                )


              ],
            ),
          );
  }
}
