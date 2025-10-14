import 'package:flutter/material.dart';

class OtpInputRow extends StatefulWidget {
  final int length;
  final Function(String otp)? onCompleted;

  const OtpInputRow({super.key, this.length = 6, this.onCompleted});

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    // Move to next box if user entered something
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    // Move back if user cleared and pressed backspace
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Check if all boxes filled
    final otp = _controllers.map((e) => e.text).join();
    if (otp.length == widget.length && !otp.contains('')) {
      widget.onCompleted?.call(otp);
    }
  }

  String getOtpValue() {
    return _controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.length, (index) {
          return Container(
            width: 34,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF007083)),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: TextField(
              onTapOutside: (event) {
                _focusNodes[index].unfocus();
              },
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 0.9,
                color: Color(0xff007083),
              ),
              maxLength: 1,
              decoration: const InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 0.9,
                color: Color(0xFF757575),
              ),
                isCollapsed: true,
                contentPadding: EdgeInsets.all(0),
                counterText: "",
                border: InputBorder.none,
              ),
              onChanged: (val) => _onChanged(val, index),
            ),
          );
        }),
      ),
    );
  }
}
