import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customTextFIeld extends StatefulWidget {
  customTextFIeld({
    super.key,
    this.isObscureText = false,

    required this.textController,
    required this.prefixIcon,
    required this.hintText,
    required this.validator
  });

  TextEditingController textController = TextEditingController();
  Widget prefixIcon;
  String? Function(String?)? validator;
  String hintText;
  bool isObscureText;

  @override
  State<customTextFIeld> createState() => _customTextFIeldState();
}

class _customTextFIeldState extends State<customTextFIeld> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color:Colors.grey[200] ,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        obscureText: widget.isObscureText,

        controller: widget.textController,
        validator:widget.validator,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
