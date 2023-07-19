import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopital/Register/RegisterInfoMedecin.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    // var height= size.heigth

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo2.png',
              width: 150,
              height: 150,
            ),
            Text(
              "CODE",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            /* Text(
              "Code sent at aisha@gmail.com",
              style: Theme.of(context).textTheme.headline6 ,
              textAlign: TextAlign.center,
            ),
            */
            Form(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: 64,
                  child: Material(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(
                        hintText: "0",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 64,
                  child: Material(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "0",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      onSaved: (pin2) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 64,
                  child: Material(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "0",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      onSaved: (pin3) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                    height: 60,
                    width: 64,
                    child: Material(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 2)),
                        onSaved: (pin4) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            )),
            SizedBox(
              height: 60,
            ),
            Container(
              width: width * 1 / 2,
              height: 45,
              child: suivantButton(context),
            ),
          ],
        ),
      ),
    );

    /*  return Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Container(
            width: width = 9 / 10,
            child: Form(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: 64,
                  child: Material(
                    child: TextFormField(
                      onSaved: (pin1) {},
                      decoration: const InputDecoration(hintText: "0"),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 64,
                  child: Material(
                    child: TextFormField(
                      onSaved: (pin2) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 64,
                  child: Material(
                    child: TextFormField(
                      onSaved: (pin3) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                    height: 60,
                    width: 64,
                    child: Material(
                      child: TextFormField(
                        onSaved: (pin4) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ))));
  } */
  }

  ElevatedButton suivantButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => RegisterMedecinInfo()),
        );
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF1E3148),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              // Return the gradient color when the button is pressed
              return Colors.white;
            } else {
              // Return the normal background color when the button is not pressed
              return Color(0xFF1E3148);
            }
          },
        ),
      ),
      child: Text(
        'Suivant',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
