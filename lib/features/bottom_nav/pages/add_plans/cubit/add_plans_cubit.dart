import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_plans_state.dart';

class AddPlansCubit extends Cubit<AddPlansState> {
  AddPlansCubit() : super(AddPlansInitial());
}
