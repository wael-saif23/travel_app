enum UserStatus {
  sleeping,
  atTheGym,
  available,
  busy,
  offline,
  typing,
  inAMeeting,
  atWork,
  onVacation,
}

void handleUserStatus(UserStatus status) {
  switch (status) {
    case UserStatus.sleeping:
      break;
    case UserStatus.atTheGym:
      break;
    case UserStatus.available:
      break;
    case UserStatus.busy:
      break;
    case UserStatus.offline:
      break;

    case UserStatus.typing:
      break;
    case UserStatus.inAMeeting:
      break;
    case UserStatus.atWork:
      break;
    case UserStatus.onVacation:
      break;
    default:
  }
}

extension UserStatusToString on UserStatus {
  String toStringValue() {
    switch (this) {
      case UserStatus.sleeping:
        return "Sleeping";
      case UserStatus.atTheGym:
        return "At the Gym";
      case UserStatus.available:
        return "Available";
      case UserStatus.busy:
        return "Busy";
      case UserStatus.offline:
        return "Offline";
      case UserStatus.inAMeeting:
        return "In a meeting";
      case UserStatus.atWork:
        return "At work";
      case UserStatus.onVacation:
        return "On vacation";
      case UserStatus.typing:
        return "Typing...";
      default:
        return "Unknown";
    }
  }
}
