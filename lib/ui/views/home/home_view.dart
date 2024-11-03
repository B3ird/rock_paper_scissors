import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rock_paper_scissors/ui/views/widgets/coin/coin.dart';
import 'package:stacked/stacked.dart';
import 'package:rock_paper_scissors/ui/common/app_colors.dart';
import 'package:rock_paper_scissors/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      HomeViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(
          minWidth: 375,
          maxWidth: 1366,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.5,
            colors: <Color>[fromBckgrd, toBckgrd],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/logo.svg",
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      height: 64,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "SCORE",
                            style: TextStyle(
                              height: 0,
                              color: scoreTxt,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            viewModel.scoreLabel,
                            style: TextStyle(
                              height: 0,
                              color: darkTxt,
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              if (viewModel.playerChoice.isEmpty)
                Stack(
                  children: [
                    const SizedBox(
                      width: 300,
                      height: 300,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/bg-triangle.svg",
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () => viewModel.pick("paper"),
                        child: const CoinWidget(type: "paper"),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => viewModel.pick("scissors"),
                        child: const CoinWidget(type: "scissors"),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => viewModel.pick("rock"),
                        child: const Center(child: CoinWidget(type: "rock")),
                      ),
                    ),
                  ],
                ),
              if (viewModel.playerChoice.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CoinWidget(type: viewModel.playerChoice),
                        verticalSpaceMedium,
                        const Text(
                          "YOU PICKED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    horizontalSpaceLarge,
                    Column(
                      children: [
                        if (viewModel.cpuChoice.isEmpty)
                        //placeholder
                          Container(
                            width: 128,
                            height: 128,
                            decoration: BoxDecoration(
                              color: toBckgrd,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        if (viewModel.cpuChoice.isNotEmpty)
                          CoinWidget(type: viewModel.cpuChoice),
                        verticalSpaceMedium,
                        const Text(
                          "THE HOUSE PICKED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (viewModel.result == "win")
                const Text(
                  "YOU WIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              if (viewModel.result == "loose")
                const Text(
                  "YOU LOSE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              if (viewModel.result == "tie")
                const Text(
                  "TIE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              verticalSpaceMedium,
              if (viewModel.result.isNotEmpty)
                ElevatedButton(
                  onPressed: viewModel.resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 64,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    "PLAY AGAIN",
                    style: TextStyle(
                      color: darkTxt,
                      fontSize: 18,
                    ),
                  ),
                ),
              verticalSpaceLarge,
              ElevatedButton(
                onPressed: viewModel.showDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: fromBckgrd,
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  shadowColor: Colors.transparent,
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  "RULES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      HomeViewModel();
}
