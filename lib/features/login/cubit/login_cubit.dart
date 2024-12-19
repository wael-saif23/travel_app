import 'package:bloc/bloc.dart';

import '../../../data/api/utils/custom_response_handler.dart';
import '../../../data/repository/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // final _repo = Repository.instance;

  // Future<void> login() async => responseHandler(
  //       onStart: () {
  //         emit(LoginLoadingState());
  //       },
  //       apiRequest: () async {},
  //       onSuccess: (result) {
  //         emit(LoginSuccessState());
  //       },
  //       onError: (error) {
  //         LoginFailureState();
  //       },
  //     );
}
