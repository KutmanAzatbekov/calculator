part of 'naruto_bloc.dart';

@immutable
sealed class NarutoEvent {}

class GetCharactersEvent extends NarutoEvent{}

class GetLocalCharactersEvent extends NarutoEvent{}
