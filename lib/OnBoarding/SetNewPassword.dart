import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/OnBoarding/EnableFingerprint.dart';
import 'package:flutter_svg/svg.dart';


class SetNewPassword extends StatefulWidget{
  final Map<String, dynamic> user;
  SetNewPassword({super.key, required this.user});
  SetNewPasswordState createState() => SetNewPasswordState();
}

class SetNewPasswordState extends State<SetNewPassword>{
  bool _obscurePassword = true;
  TextEditingController newPController = TextEditingController();
  TextEditingController confirmPController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(
           padding: EdgeInsets.only(top: getFontSize(80, context), bottom: getFontSize(40, context), left: getFontSize(20, context), right: getFontSize(20, context)),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(height: getFontSize(20, context),),
           Text('Set new password', style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
           SizedBox(height: getFontSize(15, context),),
           input_field(
               label: 'Type in new password',
             controller: newPController
               ),
           input_field(
               label: 'Confirm password',
             controller: confirmPController
           ),
           Spacer(),
           ElevatedButton(
             onPressed: () {
               String newP = newPController.text.trim();
               String confirmP = confirmPController.text.trim();
               if(newP.characters==confirmP.characters){
                 Map<String, dynamic> params =  widget.user;
                 params['password'] = newP;
                 Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> EnableFingerprint(user: params)));
               }else{
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text("Password does not match")),
                 );
               }
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
               fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(9),
               ),
             ),
             child: Padding(
               padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
               child: Text(
                 'Continue',
                 style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
               ),
             ),
           ),

         ],
       ),
       ),
   );
  }

  input_field({
    required String label, required TextEditingController controller,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: getFontSize(20, context)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: getFontSize(16, context),
              ),
            ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            controller: controller,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: '*********',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
          )
        ],
      ),
    );
  }
}