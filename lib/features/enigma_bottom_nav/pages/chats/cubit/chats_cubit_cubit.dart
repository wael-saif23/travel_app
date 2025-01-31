import 'package:bloc/bloc.dart';

part 'chats_cubit_state.dart';

class ChatsCubit extends Cubit<ChatsCubitState> {
  ChatsCubit() : super(ChatsCubitInitial());

  void showAddFriendView() {
    emit(AddFriendviewState());
  }

  void showChats() {
    emit(ChatsCubitInitial());
  }
}
