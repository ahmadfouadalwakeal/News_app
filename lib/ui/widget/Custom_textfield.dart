import 'package:flutter/material.dart';

class Custom_TextFormField extends StatelessWidget {
   Custom_TextFormField({super.key,this.hinitText,this.onchanged,this.textempty,this.controller,this.obscureText =false,this.prefixIcon,this.textvalid});
  String? hinitText;
  Icon? prefixIcon;
  Function(String)? onchanged;
  bool? obscureText;
  String? textvalid;
  String? textempty;
   TextEditingController? controller=TextEditingController();

   String? validatortext(String? email){
     RegExp emailRegex = RegExp(
         "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$");
     final isEmailValid = emailRegex.hasMatch(email ?? '' );
     if(email!.isEmpty){return textempty;}
     if (!isEmailValid) {
       return textvalid;
     }
     return null;
   }

   @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller: controller ,
      obscureText: obscureText!,
      validator: validatortext,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onchanged,
      decoration: InputDecoration(
        prefixIcon:prefixIcon ,
        hintText: hinitText,
        hintStyle:TextStyle(
          color: Colors.white,
        ) ,
        enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )
        ) ,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
      ),
    );
    ;
  }
}
