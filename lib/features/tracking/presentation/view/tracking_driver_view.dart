import 'package:father_delivery_user/core/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/app/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../manager/tracking_map_cubit.dart';
import '../manager/tracking_map_state.dart';

class TrackingDriverView extends StatefulWidget{
  const TrackingDriverView({super.key});

  @override
  State<TrackingDriverView> createState() => _TrackingDriverViewState();
}

class _TrackingDriverViewState extends State<TrackingDriverView> {

  @override
  void initState() {

    instance<TrackingMapCubit>().getPolyLineData(
      startPointLat: 31.447340394687288, startPointLng:31.685297484620047 ,
      endPointLat: 31.462351801738357, endPointLng: 31.687636621389956,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async{
        Navigator.pop(context);
        //Navigator.pushReplacementNamed(context, Routes.restaurantRoute);
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<TrackingMapCubit, TrackingMapState>(

          builder: (context, state) {
            print(state);
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(target: LatLng(31.447340394687288, 31.685297484620047), zoom: 13.2),
                  mapType: MapType.normal,
                  onMapCreated:(GoogleMapController googleMapController) {},
                  polylines: instance<TrackingMapCubit>().polyLines,
                  markers: instance<TrackingMapCubit>().markers,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  compassEnabled: false,
                ), TrackingMapCubit.get(context).state is GetPolyLineDataLoading?
                const Center(
                  child: CustomLoadingWidget(
                    loadingColor: ColorManager.primaryOrange,
                  ),
                ):const SizedBox(),
                Positioned(
                  top: AppSize.s0, right: AppSize.s0, left: AppSize.s0,
                  child: SafeArea(
                    child: SizedBox(
                      height:AppSize.s60,
                      child: CustomAppBar(
                        appBarToolbarHeight: AppSize.s60,
                        leadingOnPressed: (){
                          Navigator.pop(context);
                          },
                        appBarBackgroundColor: ColorManager.transparentColor,
                        titleContent: const Text(""),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: SizeConfig.screenWidth ,
                  color: ColorManager.whiteColor,
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const CustomImage(
                            image:ImageAssets.profileImage,
                            isShadow: false,
                            isNetwork: false,
                            width: AppSize.s60,
                            height: AppSize.s60,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Text("اسم السائق",
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)
                              ),
                              const SizedBox(height: AppSize.s6),
                              RatingBarIndicator(
                                rating: 3,
                                unratedColor: Colors.grey,
                                itemBuilder: (context, index) => Icon(
                                  index < 3 ? CupertinoIcons.star_fill: CupertinoIcons.star,
                                  color: ColorManager.primaryOrange,
                                ),
                                itemCount: AppSize.s5i,
                                itemSize: AppSize.s14,
                                direction: Axis.horizontal,
                              ),
                            ]),
                          const Spacer(),
                          IconButton(onPressed: (){
                            makePhoneCall('+201156643287');
                          },
                              icon: const Icon(
                                CupertinoIcons.phone_circle_fill,
                                color: ColorManager.successColor,
                                size: 40,
                              ))

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButtonWidget(
                            width: SizeConfig.screenWidth!*.42 -12,
                            child: Text('استلام',style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: 16.sp,color: ColorManager.whiteColor)),
                          ),
                          CustomElevatedButtonWidget(
                            buttonIsGradient: false,
                            width: SizeConfig.screenWidth!*.42 -12,
                            buttonBorderColor: ColorManager.primaryOrange,
                            buttonBackgroundColor: ColorManager.whiteColor,
                            child: Text('شكوي',style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: 16.sp,color: ColorManager.primaryOrange),),
                          ),
                        ])
                    ],
                  ),
                ),

              ],
            );
            },
        ),
      ),
    );
  }
}