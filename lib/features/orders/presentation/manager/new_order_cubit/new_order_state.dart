part of 'new_order_cubit.dart';

abstract class NewOrderState extends Equatable {
  const NewOrderState();
  @override
  List<Object> get props => [];
}

class NewOrderInitial extends NewOrderState {

}
class PickedImageFromCamera extends NewOrderState {
  final XFile image;

  const PickedImageFromCamera(this.image);
  @override
  List<Object> get props => [image];
}

class PickedImageFromGallery extends NewOrderState {
  final List<XFile> imageList;

  const PickedImageFromGallery(this.imageList);
  @override
  List<Object> get props => [imageList];
}

class DeleteImageFromList extends NewOrderState {
  final int index;

  const DeleteImageFromList(this.index);
  @override
  List<Object> get props => [index];
}
