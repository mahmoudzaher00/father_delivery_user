import 'package:flutter/material.dart';

talkSnackBar(context,{String? message, int? duration}){
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(
          message??"Complete the empty fields to continue",
          // style: GoogleFonts.ubuntu(
          //   textStyle: const TextStyle(
          //       fontSize: 15,
          //       fontWeight: FontWeight.w400,
          //       color:Colors.white
          //   ),
          // )
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 14),
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),

      ), duration: Duration(seconds: duration??2),));
  }
