
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:odc/controller/web_service/api.dart';
import 'package:odc/view/constant/getCacheData.dart';
import '../../../../model/categories.dart';
import '../../../../model/course_model.dart';
import '../../../../model/course_model_by_id.dart';
import '../../../../model/get_categories_id_Model.dart';
import '../../../../model/profile.dart';
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
  GetCategoryId ? getCategoryId;
  Profile ? profile;
  List<CourseById> ? getEnrolled = [];

  List<Widget>screen = [
    MainPage(),
     MyCourse(),
    const MyProfile(),
  ];
  void changeIndex(int newIndex){
    defaultIndex = newIndex;
    emit(ChangeIndexState());
  }
  Future<void> getAllCategory() async {
    await DioHelper.getData(
      endPoint: categories,
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
      endPoint: courses,
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
  Future<void> getAllCategoryId({required String token ,required int id ,

  }) async{
    await DioHelper.getData(
      token: token,
      //   query: {
      //   'categoryId' :1,
      // },
        endPoint:'categories/$id/courses'
    ).then((value) {
      getCategoryId = GetCategoryId.fromJson(value!.data);
      print(getCategoryId!.data!.courses![0].courseName);
    }).catchError((e){
      print(e);
    });
  }
  Future<void> getAllCourseId({required String token ,required int id ,

  }) async{
    await DioHelper.getData(
        token: token,
        //   query: {
        //   'categoryId' :1,
        // },
        endPoint:'courses/$id'
    ).then((value) {
      print(value!.data);
      getEnrolled?.add(CourseById.fromJson(value.data));
      print(getEnrolled![0].data!.courseName);
    }).catchError((e){
      print(e);
    });
  }
  Future<void> getProfileData(String token) async {
    await DioHelper.getData(
        token: GetCacheData().token,
        endPoint:profileEndPoint
    ).then((value) {
      print(value!.data);
      profile = Profile.fromJson(value.data);
      print(profile?.data?.student?.enrolls?.length);
      emit(GetProfileSuccessful());

    }).then((value) {
      profile!.data!.student!.enrolls!.forEach((element) async{
        await getAllCourseId(
          id: element.courseId!.toInt(),
          token: token
        ).then((value) {
          print(getEnrolled![0].success);
          emit(GetCourseSuccessful());
        }).catchError((e){
          print(e);
          emit(GetCourseError());

        });
      });
    });
  }


}

