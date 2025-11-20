import 'dart:convert';

import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/signup/TelefonNummerWidget.dart';
import 'package:flutter_launcher_icons/main.dart';

class VerifyPhoneNumberWidget extends StatefulWidget {
  final String phoneNumber;
  final String email;
  final void Function(String code)? onSubmitCode;

  const VerifyPhoneNumberWidget({Key? key, required this.phoneNumber, this.onSubmitCode, required this.email}) : super(key: key);

  @override
  State<VerifyPhoneNumberWidget> createState() => _VerifyPhoneNumberWidgetState();
}

class _VerifyPhoneNumberWidgetState extends State<VerifyPhoneNumberWidget> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  bool _isSubmitting = false;

  String get _enteredCode => _controllers.map((c) => c.text).join();
  late Appelsinapi _appelsinapi;

  @override
  void initState() {
    super.initState();
    _appelsinapi = Appelsinapi();
  }

  Future<void> _verifyCode(String code) async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);
    try {
      final resp = await _appelsinapi.verify(widget.phoneNumber, code);
     final appelsinBruger= await _appelsinapi.getBrugerByEmail(widget.email);
     print(jsonEncode(appelsinBruger));
      if (!mounted) return;
      if (resp.statusCode == 200) {
        // On successful verification, navigate to Telefonnummerwidget
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => Telefonnummerwidget(phone:widget.phoneNumber, appelsinbruger: appelsinBruger,)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verifikation mislykkedes (${resp.statusCode})')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fejl: ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _submitIfComplete() {
    _verifyCode(_enteredCode);
    final code = _enteredCode;
    if (code.length == 4) {
      if (widget.onSubmitCode != null) {
        widget.onSubmitCode!.call(code);
      } else {
        _verifyCode(code);
      }
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  Widget _buildDigitTextField(int index) {
    return Container(
      margin: EdgeInsets.only(right: index < 3 ? 8 : 0),
      width: 48,
      height: 56,
      child: TextField(
        controller: _controllers[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        style: TextStyle(fontSize: 18, letterSpacing: 2),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 3) {
              FocusScope.of(context).nextFocus();
            } else {
              // Last box filled -> call function
              _submitIfComplete();
            }
          } else {
            if (index > 0) {
              FocusScope.of(context).previousFocus();
            }
          }
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verificer dit telefonnummer"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Indtast den 4-cifrede kode sendt til\n${widget.phoneNumber}",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, _buildDigitTextField),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,

            ),
          ],
        ),
      ),
    );
  }
}
