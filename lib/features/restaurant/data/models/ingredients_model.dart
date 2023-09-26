class IngredientsData{
  final List<IngredientsModel> list;
  final double mealPrice;
  String get flavors{
    String text='';
    for (var element in list) {
      var item=element.count>0?"${element.name} X ${element.count}":"";
      text+=item;
    }
    return text;
  }
  double get flavorsPricing{
    double price=0.0;
    for (var element in list) {
      var item=element.count*(double.tryParse(element.price)??0);
      price+=item;
    }
    return price;
  }

  IngredientsData({required this.list,required this.mealPrice });
}

class IngredientsModel{
  final int id;
  final String name;
  final String price;
  int count;

  IngredientsModel ({required this.id,required this.name, required this.price, this.count = 0});
  void increment(){
    count++;
  }
  void decrement(){
    if(count>0) {
      count--;
    }
  }
}