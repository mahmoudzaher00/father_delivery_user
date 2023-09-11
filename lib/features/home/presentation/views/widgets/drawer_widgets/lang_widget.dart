import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangWidget extends StatelessWidget {
  const LangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: AppSize.s40,
          width: AppSize.s160,
          decoration: BoxDecoration(
            color: ColorManager.primaryGray,
            borderRadius: BorderRadius.circular(22),
          ),
          child: ListView.builder(
            itemCount: instance<HomeCubit>().lang.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  HomeCubit.get(context).changeLang(instance<HomeCubit>().lang[index].value!);
                  },
                child: Container(
                  width: AppSize.s80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: HomeCubit.get(context).lang[index].value ==  HomeCubit.get(context).currentLang ?
                      ColorManager.primaryOrange:ColorManager.primaryGray,
                      borderRadius: BorderRadius.circular(22)
                  ),
                  child: Text(
                      HomeCubit.get(context).lang[index].title!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14,
                          color: HomeCubit.get(context).lang[index].value == HomeCubit.get(context).currentLang?
                          ColorManager.whiteColor :ColorManager.primaryBlack
                  )
              ),
            ),
          );
        },
      ),
    );
  },
);
  }
}