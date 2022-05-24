part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}
class ChangeIndexState extends HomePageState {}
class GetCategoriesSuccessful extends HomePageState {}
class GetCategoriesError extends HomePageState {}

