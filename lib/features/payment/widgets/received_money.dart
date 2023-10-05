
import 'package:driver_app/features/payment/widgets/label_text_widgets.dart';
import 'package:driver_app/shared/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ReceivedMoney extends StatefulWidget {
  const ReceivedMoney({
    super.key,
    required this.khmerMoney,
    required this.usdMoney,
    required this.enable,
    this.onPressed,
  });

  final TextEditingController khmerMoney;
  final TextEditingController usdMoney;
  final bool enable;
  final VoidCallback? onPressed;

  @override
  State<ReceivedMoney> createState() => _ReceivedMoneyState();
}

class _ReceivedMoneyState extends State<ReceivedMoney> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelTextPay(label: 'Received Money'),
        SizedBox(height: 10),
        GestureDetector(
          onTap: widget.onPressed,
          child: TextFieldForms(
            controller: widget.khmerMoney,
            enable: widget.enable,
            minWith: 45,
            onChange: (value) {
              setState(() {});
              return null;
            },
            minHeight: 30,
            prefixIcon: SvgPicture.asset(
              'assets/svg/riel.svg',
            ),
            hintText: 'Khmer Money',
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: widget.onPressed,
          child: TextFieldForms(
            onChange: (value) {
              setState(() {});
              return null;
            },
            controller: widget.usdMoney,
            enable: widget.enable,
            minWith: 45,
            minHeight: 30,
            prefixIcon: SvgPicture.asset(
              'assets/svg/dolar.svg',
            ),
            hintText: 'USD Money',
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
