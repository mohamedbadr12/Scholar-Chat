import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
  FirebaseFirestore.instance.collection(kMessagesCollections);

  Future Send({required String message,required String email})async{
try{
  messages.add(
      {kMessage: message, kCreatedAt: DateTime.now(), 'id' : email });
}catch(e)
{

};

  }
  void getMessage(){
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List <Message>messagesList=[];
      for(var doc in event.docs){
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages:messagesList ));
    });
  }
}
