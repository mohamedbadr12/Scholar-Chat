part of 'req_cubit.dart';

@immutable
abstract class ReqState {}

class ReqInitial extends ReqState {}
class ReqLoading extends ReqState {}
class ReqSuccess extends ReqState {}
class ReqFailure extends ReqState {
  String errorM;
  ReqFailure({required this.errorM});

}
