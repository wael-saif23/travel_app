import 'package:travel_app/core/enums/user_status.dart';

class UserInfoModel {
  final String? name;
  final String? email;
  final int? phoneNumber;
  final bool? isLoggedIn;
  final String? imageUrl;
  final UserStatus? userStatus;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final int? unreedMessageCount;
  final List<UserInfoModel>? contacts;

  UserInfoModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.isLoggedIn,
    this.imageUrl,
    this.userStatus,
    this.contacts,
    this.lastMessage,
    this.lastMessageTime,
    this.unreedMessageCount,
  });
}
