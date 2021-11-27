import 'package:flutter/material.dart';



class CustomLargeButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color txtColor;
  final Function onTap;

  const CustomLargeButton({Key? key,required this.btnText, required this.btnColor,required this.txtColor, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 20,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                color: txtColor,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
