import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter/cupertino.dart';
import '../screens/HomeScreen.dart';

class buton extends StatelessWidget {
  buton({Key? key, required this.myKey, required this.model}) : super(key: key);

  GlobalKey<FormState> myKey;
  dynamic model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        onPressed: () {
           Navigator.push(
             context,
            CupertinoPageRoute(
               builder: (context) => const HomeScreen(),
             ),
           );
          if (myKey.currentState!.validate()) {
            myKey.currentState?.save();
            
           
          }else{
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Data girişi hatalı.')),
            );

          }
        },
        child: const Text(
          'Giriş Yap',
          style: kButtonText,
        
        ),
      
      ),
    
    );
   
  
  }
}
