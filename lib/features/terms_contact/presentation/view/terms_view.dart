import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/container_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarToolbarHeight: 60,
        titleContent: Text('الشروط و الأحكام',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p12),
          margin: const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorManager.primaryGray,
              boxShadow: ContainerManager.shadow),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('الشروط و الأحكام',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 14, fontWeight: FontWeight.bold)),
              const Divider(color: ColorManager.whiteColor,height: AppSize.s40),
              Text(terms, style: Theme.of(context).textTheme.displaySmall!),
              const SizedBox(height: AppSize.s20),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: 'للشكاوي والاقتراحات',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 13, fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    const WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: SizedBox(width: AppSize.s10)),
                    TextSpan(
                      text: 'تواصل معنا',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w500,color: ColorManager.primaryOrange,
                        decoration: TextDecoration.underline,
                        decorationColor:ColorManager.primaryOrange),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pushNamed(context, Routes.contactUsRoute);
                      },
                    ),
                  ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



String terms = "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.";
