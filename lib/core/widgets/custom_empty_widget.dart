import 'package:flutter/material.dart';
import 'custom_image_widget.dart';

class CustomEmptyWidget extends StatelessWidget {
 final String? image;
 final String? text;
 final double? heightImage;
 final double? widthImage;
 final bool? reload;
 final void Function()? onPressed;
  const CustomEmptyWidget({
    Key? key,
    required this.mediaQuery, this.image, this.text, this.heightImage, this.widthImage, this.onPressed, this.reload=false,
  }) : super(key: key);

  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height:mediaQuery.height*0.1 ,),
          CustomImage(
            image:image??'assets/images/no_documents.png',
            height: heightImage??mediaQuery.height*.3,
            width: widthImage??mediaQuery.width*.6,
            fit: BoxFit.fill,
            isNetwork: false,
            isShadow: false,
          ),
          const SizedBox(height: 15,),
          reload!?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // CustomText(
              //   text: text??AppStrings.search.tr(),
              //   color: ColorManager.primaryBlack,
              //   fontWeight: FontWeight.bold,
              //   textAlign: TextAlign.center,
              //   fontSize: 17,
              //   height: 1.4,
              // ),
              SizedBox(width: 5,),
              // InkWell(
              //   onTap: onPressed,
              //   child: CustomText(
              //     text:AppStrings.search.tr(),
              //     color: Colors.lightBlueAccent,
              //     fontWeight: FontWeight.bold,
              //     textAlign: TextAlign.center,
              //     lineDecoration: TextDecoration.underline,
              //     fontSize: 15,
              //     height: 1.4,
              //
              //   ),
              // ),
            ],
          ):
              const SizedBox()
          // CustomText(
          //   text: text??AppStrings.search.tr(),
          //   color: ColorManager.primaryBlue,
          //   fontWeight: FontWeight.bold,
          //   textAlign: TextAlign.center,
          //   fontSize: 17,
          //   height: 1.4,
          // )
        ],
      ),
    );
  }
}