part of 'contacts_cubit.dart';

sealed class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}


// الحالة الأولية (قبل تحميل البيانات)
final class ContactsInitial extends ContactsState {
  const ContactsInitial();
}

// حالة التحميل (عند جلب البيانات من API/مصدر خارجي)
final class ContactsLoading extends ContactsState {
  const ContactsLoading();
}

// حالة النجاح (تم تحميل البيانات بنجاح)
final class ContactsLoaded extends ContactsState {
  final List<UserInfoModel> contacts;
  const ContactsLoaded(this.contacts);

  @override
  List<Object> get props => [contacts];
}

// حالة الخطأ (فشل في تحميل البيانات)
final class ContactsError extends ContactsState {
  final String message;
  const ContactsError(this.message);

  @override
  List<Object> get props => [message];
}

// // حالة إضافة جهة اتصال جديدة
// final class ContactAdded extends ContactsState {
//   final UserInfoModel newContact;
//   const ContactAdded(this.newContact);

//   @override
//   List<Object> get props => [newContact];
// }

// // حالة حذف جهة اتصال
// final class ContactDeleted extends ContactsState {
//   final int contactId;
//   const ContactDeleted(this.contactId);

//   @override
//   List<Object> get props => [contactId];
// }

// // حالة تحديث جهة اتصال
// final class ContactUpdated extends ContactsState {
//   final UserInfoModel updatedContact;
//   const ContactUpdated(this.updatedContact);

//   @override
//   List<Object> get props => [updatedContact];
// }