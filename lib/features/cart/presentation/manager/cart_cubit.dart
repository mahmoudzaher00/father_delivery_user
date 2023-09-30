import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/cart_model.dart';
import '../../data/model/delivery_and_payment_radio_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context)=>BlocProvider.of(context);

  int? deliveryStatusValue;
  int? paymentStatusValue;
  List<int> productCounts = [];

  List<CartModel> cartList = [
    CartModel(productPrice: 20,productName: 'وجبة بروست 5 قطع',productCount: 1,productDescription: "صدور حاره خالص"),
    CartModel(productPrice: 20,productName: 'وجبة بروست 5 قطع',productCount: 2,productDescription: null),
    CartModel(productPrice: 20,productName: 'وجبة بروست 5 قطع',productCount: 3,productDescription: null),
    CartModel(productPrice: 20,productName: 'وجبة بروست 5 قطع',productCount: 4,productDescription: null)
  ];

  List<DeliveryAndPaymentRadioModel> deliveryRadioList = [
    DeliveryAndPaymentRadioModel(title: 'التوصيل من التطبيق',description: '(05.00 ر.س)',radioValue: 0),
    DeliveryAndPaymentRadioModel(title: 'الاستلام من المتجر',description: '(مجانا)',radioValue: 1),
  ];

  List<DeliveryAndPaymentRadioModel> paymentRadioList = [
    DeliveryAndPaymentRadioModel(title: 'الدفع عند الإستلام',description: '',radioValue: 0),
    DeliveryAndPaymentRadioModel(title: 'الدفع ببطاقة الإئتمان',description: '',radioValue: 1),
  ];


  void getCountFromApi(){
    for(int i =0 ;i< cartList.length ;i++){
      productCounts.add(cartList[i].productCount!);
    }
  }
  void changeDeliveryStatus(int value){
    deliveryStatusValue = value ;
    emit(ChangeDeliveryStatusState(value));
  }

  void changePaymentStatus(int value){
    paymentStatusValue = value ;
    emit(ChangePaymentStatusState(value));
  }

  void incrementProductCount(int index){
    productCounts[index] =  productCounts[index] + 1;
    emit(IncrementProductCountState(index,productCounts[index]));
  }

  void decrementProductCount(int index){
    if(productCounts[index] > 1){
      productCounts[index] =  productCounts[index] - 1;
    }
    emit(DecrementProductCountState(index,productCounts[index]));
  }

  void deleteProductFromCart(int index){
    cartList.removeAt(index);
    productCounts.removeAt(index);
    emit(RemoveProductState(index));
  }

}
