import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'req_state.dart';

class ReqCubit extends Cubit<ReqState> {
  ReqCubit() : super(ReqInitial());


  Future<void> registerUser({required String email ,required String password}) async {
    emit(ReqLoading());
 try{
   UserCredential user = await FirebaseAuth.instance
       .createUserWithEmailAndPassword(email: email, password: password);
   emit(ReqSuccess());

   } on FirebaseAuthException catch (ex) {
     if (ex.code == 'weak-password') {
       emit(ReqFailure(errorM: "weak password"));
     } else if (ex.code == 'email-already-in-use') {
       emit(ReqFailure(errorM:"email-already-in-use" ));
     }

 }catch(e){
   emit(ReqFailure(errorM: "Something wrong"));
 }
  }
}
