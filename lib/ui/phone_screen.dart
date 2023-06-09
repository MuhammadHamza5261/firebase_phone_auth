import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_phone_number/main.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        resizeToAvoidBottomInset: false,
        body: PhoneScreenSTF(),
    );
  }
}
///stf
class PhoneScreenSTF extends StatefulWidget {
  const PhoneScreenSTF({Key? key}) : super(key: key);

  @override
  State<PhoneScreenSTF> createState() => _PhoneScreenSTFState();
}

class _PhoneScreenSTFState extends State<PhoneScreenSTF> {




  TextEditingController codeField = TextEditingController();

  // var phone ="";


  // @override
  // void initState(){
  //   countryCode.text = "+92";
  //   super.initState();
  // }









  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
               height: height*0.55,
              child: Image.asset('assets/images/girl.png',width: 300,),
            ),
            const Text('Phone Verification',style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600
            ),),
            const SizedBox(
              height: 5,
            ),
            const Text('We need to register your phone before getting Started!',style: TextStyle(
              fontSize: 17.0,
            ),),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 17.0,),
              width: width*0.93,
              height: height*0.053,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                // onChanged: (value){
                //   phone = value;
                //
                //
                //
                // },
                controller: codeField,
                // validator: (value){
                //   if(value == null || value.isEmpty ){
                //   }
                // },
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: const Color.fromRGBO(100,100,100,1),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 17.0,top:10.0,),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 173, 25, 1), width: 1.2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                  ),
                  hintText: 'Phone Number',

                ),
              ),
              // validator: (password) {
              //   if (isPasswordValid(password)) return null;
              //   else
              //     return 'Enter a valid password';
              // },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.93,
              height: MediaQuery.of(context).size.height*0.053,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0,173,25,1),
                ),
                onPressed:() async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: codeField.text,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {},
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );

                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => mylist()));
                },

                child: const Text('Send the code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(255,255,255,1),
                  ),
                ),
              ),
            ),

          ],


        ),
      )
    );
  }
}

