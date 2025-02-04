import 'package:travel_app/core/enums/user_status.dart';

class UserInfoModel {
  final int id;
  final String name;
  final String? email;
  final int? phoneNumber;
  final bool isLoggedIn;
  final String? imageUrl;
  final UserStatus userStatus;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final int? unreadMessageCount;
  final List<UserInfoModel>? contacts;

  UserInfoModel({
    required this.id,
    required this.name,
    this.email,
    this.phoneNumber,
    required this.isLoggedIn,
    this.imageUrl,
    required this.userStatus,
    this.contacts,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadMessageCount,
  });

  UserInfoModel decrementId() {
    return UserInfoModel(
      id: id - 1,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      isLoggedIn: isLoggedIn,
      imageUrl: imageUrl,
      userStatus: userStatus,
      contacts: contacts,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      unreadMessageCount: unreadMessageCount,
    );
  }
}
