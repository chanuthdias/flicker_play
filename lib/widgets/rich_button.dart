import 'package:flutter/material.dart';

class RichButton extends StatefulWidget {
  final String btnName;
  final Function()? onPressed;
  const RichButton({super.key, required this.btnName, this.onPressed});

  @override
  State<RichButton> createState() => _RichButtonState();
}

class _RichButtonState extends State<RichButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed!();
      },
      child: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          widget.btnName,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
    );
  }
}
