import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(ExamInitial());
}
