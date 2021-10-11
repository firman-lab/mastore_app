import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mastore_app/models/message_model.dart';
import 'package:mastore_app/models/product_model.dart';
import 'package:mastore_app/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({int? userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());

          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        // Mengurutkan berdasarkan data yang paling baru
        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage(
    UserModel? user,
    bool? isFromUser,
    String? message,
    ProductModel? product,
  ) async {
    try {
      firestore.collection('messages').add({
        'userId': user!.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'created_at': DateTime.now().toString(),
        'updated_at': DateTime.now().toString(),
      }).then(
        (value) => print('Message sent!'),
      );
    } catch (e) {
      throw Exception('Message not sent!');
    }
  }
}
