import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/app_colors.dart';

class CoinWidget extends StatefulWidget {
  final String? type;

  const CoinWidget({Key? key, @required this.type}) : super(key: key);

  @override
  _CoinWidgetState createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
  Color color = fromPaper;
  Color shadow = toPaper;
  String asset = "assets/icon-paper.svg";

  @override
  void initState() {
    switch (widget.type) {
      case "paper":
        color = fromPaper;
        shadow = toPaper;
        asset = "assets/icon-paper.svg";
        break;
      case "scissors":
        color = fromScissors;
        shadow = toScissors;
        asset = "assets/icon-scissors.svg";
        break;
      case "rock":
        color = fromRock;
        shadow = toRock;
        asset = "assets/icon-rock.svg";
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 128,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: color,
          width: 12,
        ),
        boxShadow: [
          BoxShadow(
            color: shadow,
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
        borderRadius: BorderRadius.circular(100),
      ),
      child: SvgPicture.asset(
        asset,
        colorFilter: ColorFilter.mode(
          fromBckgrd,
          BlendMode.srcIn,
        ),
        height: 8,
        width: 8,
      ),
    );
  }
}
