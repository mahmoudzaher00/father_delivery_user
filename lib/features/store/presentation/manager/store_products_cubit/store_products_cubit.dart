import 'package:father_delivery_user/features/store/presentation/manager/store_products_cubit/store_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreProductsCubit extends Cubit<StoreProductsState> {
  StoreProductsCubit() : super(StoreProductsInitial());

  static StoreProductsCubit get(context) => BlocProvider.of(context);

  int productTypeFilterValue = 0;
  List<String> productsTypeList =['أدوية السكرى','أدوية الضغط','أدوية القلب','مسكنات','مضاد حيوي'];
  List<int> productsCounts =[0,0,0,0,0,0,0,0,0,0,0,0,0];

  void  changeProductTypeValue(int index){
    productTypeFilterValue = index;
    emit(ChangeProductTypeValueState(index));
  }

  void incrementProductCount(int index){
    productsCounts[index] =  productsCounts[index] + 1;
    emit(IncrementProductCountState(index,productsCounts[index]));
  }

  void decrementProductCount(int index){
    if(productsCounts[index] >= 1){
      productsCounts[index] =  productsCounts[index] - 1;
    }
    emit(DecrementProductCountState(index,productsCounts[index]));
  }
}
