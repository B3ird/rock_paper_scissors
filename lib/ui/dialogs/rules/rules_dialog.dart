import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rock_paper_scissors/ui/common/app_colors.dart';
import 'package:rock_paper_scissors/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/app_colors.dart';
import 'rules_dialog_model.dart';

const double _graphicSize = 60;

class RulesDialog extends StackedView<RulesDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const RulesDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RulesDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog.fullscreen(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          request.title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: darkTxt,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      verticalSpaceTiny,
                      Text(
                        request.description!,
                        style:
                            const TextStyle(fontSize: 14, color: kcMediumGrey),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            Expanded(
              child: SvgPicture.asset(
                "assets/image-rules.svg",
              ),
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: () => completer(DialogResponse(
                confirmed: true,
              )),
              child: Container(
                height: 24,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/icon-close.svg",
                  colorFilter: const ColorFilter.mode(
                    kcLightGrey,
                    BlendMode.srcIn,
                  ),
                  height: 32,
                ),
              ),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }

  @override
  RulesDialogModel viewModelBuilder(BuildContext context) => RulesDialogModel();
}
