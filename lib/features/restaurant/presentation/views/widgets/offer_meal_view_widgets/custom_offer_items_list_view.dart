import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';

class CustomOfferItemsListView extends StatefulWidget {
  const CustomOfferItemsListView({super.key,});


  @override
  State<CustomOfferItemsListView> createState() => _CustomOfferItemsListViewState();
}

class _CustomOfferItemsListViewState extends State<CustomOfferItemsListView> {
  List<String>list=[
    '2 وجبة مسحب 5 قطع',
    '2 باكت بطاطس مقلية',
    '2 بيبسى',
    '2 صوص تومية بارد',
    '2 صوص تومية حار',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      shrinkWrap: true,
      itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) =>const Padding(padding: EdgeInsets.only(bottom: 10)),
      itemBuilder:  (context, index) {
        return Row(
          children: [
            Container(height: 10,width: 10, decoration: const BoxDecoration(
                color: ColorManager.primaryOrange, shape: BoxShape.circle
            ),),
            const SizedBox(width: 12,),
            Text(list[index],style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),)

          ],
        );

      });
  }
}