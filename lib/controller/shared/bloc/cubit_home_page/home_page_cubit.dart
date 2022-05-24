
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:odc/controller/web_service/api.dart';
import 'package:odc/view/constant/getCacheData.dart';
import '../../../../model/categories.dart';
import '../../../../model/course_model.dart';
import '../../../../view/screens/homeScreen/module/main_page.dart';
import '../../../../view/screens/homeScreen/module/my_course.dart';
import '../../../../view/screens/homeScreen/module/my_profile.dart';
import '../../../web_service/end_point.dart';
part 'home_page_state.dart';
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  static HomePageCubit get(context) => BlocProvider.of(context);
  int defaultIndex =0;
  Categories ?allCategory;
  AllCourses ? allCourses;
  List<Widget>screen = [
    MainPage(),
    const MyCourse(),
    const MyProfile(),
  ];
  void changeIndex(int newIndex){
    defaultIndex = newIndex;
    emit(ChangeIndexState());
  }
  Future<void> getAllCategory() async {
    await DioHelper.getData(
      code: categories,
      token: GetCacheData().token,
    ).then((value) {
      allCategory = Categories.fromJson(value!.data);
      // value?.data.forEach((element){
      //   allCategory.add(AllCategory.fromJson(element!.data));
      // });
      emit(GetCategoriesSuccessful());
    }).catchError((error){
      print(error);
      emit(GetCategoriesError());

    });
  }
  Future<void> getAllCourses() async {
    await DioHelper.getData(
      code: courses,
      token: GetCacheData().token,
    ).then((value) {
      allCourses = AllCourses.fromJson(value!.data);
      print(allCourses!.data![0].courseName);

      emit(GetCategoriesSuccessful());
    }).catchError((error){
      print(error);
      emit(GetCategoriesError());

    });
  }
}
