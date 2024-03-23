part of 'casts_bloc.dart';

@immutable
sealed class CastsEvent {}

class GetAllCastsEvent extends CastsEvent {
  final int id;

  GetAllCastsEvent({required this.id});
}
