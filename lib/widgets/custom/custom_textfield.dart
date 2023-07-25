import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
 final String? hintText;
 final TextEditingController? textController;
  const CustomTextField({Key? key, this.hintText, this.textController}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return               Material(
      color: Colors.white,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(12),
      shadowColor:  Color(0x8000000d),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: TextFormField(
          controller:widget.textController ,
          validator:(value) {
            if (value == null || value.isEmpty) {
              return 'Please fill the fields';
            }
            return null;
          } ,
          autofocus: false,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: widget.hintText??'',
              hintStyle: TextStyle(color: Color(0x8000000d),fontSize: 14,fontWeight: FontWeight.w400),
              fillColor: Colors.white,
              contentPadding:
              EdgeInsets.fromLTRB(10.0, 0, 0, 0.0),
              // isDense: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                  BorderSide(color: Colors.white, width: 3.0)),
              border: new UnderlineInputBorder(
                  borderSide:
                  new BorderSide(color: Colors.transparent))),
        ),
      ),
    );
  }
}
