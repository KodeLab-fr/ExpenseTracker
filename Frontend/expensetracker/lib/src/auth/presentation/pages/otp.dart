import 'package:expensetracker/shared/components/custom_button.dart';
import 'package:expensetracker/src/auth/presentation/controllers/code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final CodeController _codeController = Get.put(CodeController());
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black38,
          ),
          onPressed: () {
            _codeController.reset();
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.3,
            child: SvgPicture.asset('assets/svg/otp.svg'),
          ),
          SizedBox(height: height * 0.05),
          const Text(
            "Vérification de l'e-mail",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF363f93),
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: const Text(
              'Entrez le code à 6 chiffres envoyé à votre adresse',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black38,
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          Center(
            child: Pinput(
              controller: _codeController.code,
              length: 6,
              showCursor: true,
              defaultPinTheme: PinTheme(
                width: width * 0.11,
                height: height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF363f93),
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF363f93),
                ),
              ),
              // onSubmitted: (value) {
              //   setState(() {
              //     _codeController.code.text = value;
              //   });
              // },
            ),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            height: height * 0.06,
            child: CustomButton(
              text: 'Soumettre ce code',
              onPressed: () {
                _codeController.verifyCode();
              },
            ),
          ),
          SizedBox(height: height * 0.03),
          GestureDetector(
            onTap: () {
              _codeController.resendCode();
            },
            child: const Text(
              'Vous n\'avez pas reçu de code ?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
