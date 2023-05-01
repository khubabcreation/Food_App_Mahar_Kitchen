part of 'itemlist_bloc.dart';

@immutable
abstract class ItemlistState {}

class ItemlistInitial extends ItemlistState {}

class itemlistLoadingState extends ItemlistState {}

class itemlistLoadedState extends ItemlistState {
  List<ProductListModel> itemlist;
  itemlistLoadedState({required this.itemlist});
}

class itemlistErrorState extends ItemlistState {
  String message;

  itemlistErrorState({required this.message});
}
