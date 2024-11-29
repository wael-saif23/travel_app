import 'package:bloc/bloc.dart';

import '../../../data/api/utils/custom_response_handler.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool isRegisterLoading = false;

  Future<void> register() async => responseHandler(
        onStart: () {},
        apiRequest: () async {},
        onSuccess: (result) {},
        onError: (error) {},
      );
}
