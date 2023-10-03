import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/container_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarToolbarHeight: 60,
        titleContent: Text("تواصل معنا",
           style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.primaryGray,
                    boxShadow: ContainerManager.shadow),
                child: Column(
                  children: [
                    const SizedBox(height: AppSize.s20),
                    SvgPicture.asset(
                      SvgAssets.contact,
                      width: SizeConfig.screenWidth! * 0.8,
                      height: AppSize.s180,
                    ),
                    const SizedBox(height: AppSize.s20),
                    CustomTextField(
                      enabledBorderRadius: AppSize.s8,
                      widthBorder: AppSize.s0,
                      isShadow: false,
                      hintText: 'عنوان الرسالة',
                      fillColorTextFiled: ColorManager.whiteColor,
                      hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.grayIcon),
                      inputTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.blackColor),
                      onFieldSubmitted: (value) async {
                        if(value.isNotEmpty){}
                      },
                    ),
                    const SizedBox(height: AppSize.s20),
                    CustomTextField(
                      enabledBorderRadius: AppSize.s8,
                      widthBorder: AppSize.s0,
                      isShadow: false,
                      hintText: 'نص الرسالة',
                      maxLines: 6,
                      fillColorTextFiled: ColorManager.whiteColor,
                      hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.grayIcon),
                      inputTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.blackColor),
                      onFieldSubmitted: (value) async {
                        if(value.isNotEmpty){}
                      },
                    ),

                    const SizedBox(height: AppSize.s20),
                    Container(
                      height: 50,
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient:  const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              tileMode: TileMode.decal,
                              colors: [Color(0xffEF554A), Color(0xffFF8C69)])
                      ),
                      child: ElevatedButton(
                          onPressed: (){

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              foregroundColor: ColorManager.lightOrange,
                              padding: EdgeInsets.zero
                          ),
                          child: Text('إرسال',
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: ColorManager.whiteColor)
                          )
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSize.s20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.primaryGray,
                    boxShadow: ContainerManager.shadow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LottieWidget(lottieName: JsonAssets.whatsapp,onTap: (){}),
                    LottieWidget(lottieName: JsonAssets.twitter ,onTap: (){
                      launchCustomUrl(context,"https://x.com/ValorINTEL?t=eN2HRS4r7hEuE3x0TKREcQ&s=09");
                    }),
                    LottieWidget(lottieName: JsonAssets.snapchat,onTap: (){
                      launchCustomUrl(context,"");
                    }),
                    LottieWidget(lottieName: JsonAssets.instagram,onTap: (){
                      launchCustomUrl(context,"https://instagram.com/nsoo7y?igshid=MzRlODBiNWFlZA==");
                    }),

                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}

class LottieWidget extends StatelessWidget {
  final String? lottieName;
  final Function()? onTap;
  const LottieWidget({super.key, this.lottieName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: AppSize.s60,
        width: AppSize.s60,
        child: Lottie.asset(
          lottieName!,
          animate: true,
          repeat: true,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// var url = controller.socialMediaModel!.data![1].url;
// if (await canLaunch(url!)) {
//   await launch(url);
// } else {
//   throw "Could not launch $url";
// }