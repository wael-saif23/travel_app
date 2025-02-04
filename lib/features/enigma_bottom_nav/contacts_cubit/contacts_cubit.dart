import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/enums/user_status.dart';
import 'package:travel_app/data/model/enigma_app_models/user_info_model.dart';
import 'package:travel_app/res/eni_assets.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsInitial());

  final List<UserInfoModel> contacts = [
    UserInfoModel(
      id: 1,
      name: "Jasikaaaa",
      userStatus: UserStatus.available,
      imageUrl: KAppPngsEni.jasikaaaaImage,
      lastMessage: "2:14",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      id: 2,
      name: "Jasmeennn",
      userStatus: UserStatus.busy,
      imageUrl: KAppPngsEni.jasmeennnImage,
      lastMessage: "Hi, Good morning",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreadMessageCount: 1,
    ),
    UserInfoModel(
      id: 3,
      name: "Ziad Mezied",
      userStatus: UserStatus.atWork,
      imageUrl: KAppPngsEni.ziadMeziedImage,
      lastMessage: "I Love You",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      id: 4,
      name: "Aya Ahmed",
      userStatus: UserStatus.atTheGym,
      imageUrl: KAppPngsEni.ayaAhmedImage,
      lastMessage: "Good Night. I will see you soon",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreadMessageCount: 1,
    ),
    UserInfoModel(
      id: 5,
      name: "Yasmeen Adel",
      userStatus: UserStatus.sleeping,
      imageUrl: KAppPngsEni.yasmeenAdelImage,
      lastMessage: "Noooo, I don't agree",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreadMessageCount: 1,
    ),
    UserInfoModel(
      id: 6,
      name: "Hasokshaaaa",
      userStatus: UserStatus.inAMeeting,
      imageUrl: KAppPngsEni.hasokshaaaaImage,
      lastMessage: "Okay Habebit",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      id: 7,
      name: "Esraa Ayman",
      userStatus: UserStatus.available,
      imageUrl: KAppPngsEni.esraaAymanImage,
      lastMessage: "Okay Habebit",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
  ];

  // قائمة مؤقتة لتخزين جهات الاتصال (ستستبدل بالـ API لاحقًا)
  List<UserInfoModel> _newContacts = [];

  // تحميل جهات الاتصال
  Future<void> loadContacts() async {
    _tryAndCatchBlock(
      methodToExecute: () async {
        await Future.delayed(const Duration(seconds: 1)); // محاكاة جلب البيانات
        _newContacts = [...contacts];
        emit(ContactsLoaded(_newContacts));
      },
      massage: "Failed to load contacts",
    );
  }

  // إضافة جهة اتصال
  void addContact(UserInfoModel contact) {
    _tryAndCatchBlock(
      methodToExecute: () {
        _newContacts = [...contacts, contact];
        emit(ContactsLoaded(_newContacts));
      },
      massage: 'Sorry an error occurred while adding contact.',
    );
  }

  // حذف جهة اتصال
  void deleteContact(int contactId) {
    _tryAndCatchBlock(
      methodToExecute: () {
        _newContacts = [...contacts];
        _newContacts.removeAt(contactId - 1);
        for (var i = contactId; i < _newContacts.length; i++) {
          _newContacts[i] = _newContacts[i].decrementId();
        }
        emit(ContactsLoaded(_newContacts));
      },
      massage: 'Sorry an error occurred while deleting contact.',
    );
  }

  // تحديث جهة اتصال
  void updateContact(UserInfoModel updatedContact) {
    _tryAndCatchBlock(
      methodToExecute: () {
        _newContacts = [...contacts];
        final index = _newContacts.indexWhere((c) => c.id == updatedContact.id);
        if (index != -1) {
          _newContacts[index] = updatedContact;
        }
        emit(ContactsLoaded(_newContacts));
      },
      massage: 'Sorry an error occurred while updating contact.',
    );
  }

  void _tryAndCatchBlock({
    required VoidCallback methodToExecute,
    required String massage,
  }) {
    emit(ContactsLoading());
    try {
      methodToExecute.call();
    } catch (e) {
      emit(ContactsError(
        "$massage , with error : ${e.toString()}",
      ));
    }
  }
}
