import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/controller/shared/bloc/cubit_home_page/home_page_cubit.dart';

import '../../constant/componats.dart';
import '../../resource/style_manager.dart';
import '../../resource/text_manager.dart';
import '../../resource/value_manager.dart';

class seeAllPage extends StatelessWidget {
  const seeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            TextManager.categories,
            style: getBoldStyle(color: Colors.black, fontSize: AppSize.s18),
          ),
        ),
        body: SizedBox(
          child: BlocConsumer<HomePageCubit, HomePageState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = HomePageCubit.get(context);
              return GridView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return CategoriesDesign(
                    title: cubit
                        .allCategory!.data![index].categoryName
                        .toString(),
                    imagePath: cubit
                        .allCategory!.data![index].imageUrl
                        .toString(),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9 / 0.6,
                ),
                itemCount: cubit.allCategory!.data!.length,
              );
            },
          ),
        ));
  }
}
