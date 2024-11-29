enum FcmNotificationType {
  public(1),
  order(2),
  shippingCost(3),
  logout(4),
  courierAssigned(5),
  deactivate(6);

  const FcmNotificationType(this.fcmNotificationType);

  final int fcmNotificationType;


  static FcmNotificationType fromStatus(int status) {
    return values.firstWhere((element) => element.fcmNotificationType == status);
  }
}

extension FcmNotificationTypeToInt on FcmNotificationType {
  int toInt() {
    switch (this) {
      case FcmNotificationType.public:
        return 1;
      case FcmNotificationType.order:
        return 2;
      case FcmNotificationType.shippingCost:
        return 3;
      case FcmNotificationType.logout:
        return 4;
      case FcmNotificationType.courierAssigned:
        return 5;
      case FcmNotificationType.deactivate:
        return 6;
      default:
        return -1;
    }
  }
}
