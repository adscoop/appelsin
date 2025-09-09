import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/pincode/PinCodeVerifyWidget.dart';
import 'package:appelsin/pincode/SavePinCodeWidget.dart';
class PinCodeVerifyWidget extends StatefulWidget {
  const PinCodeVerifyWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PinCodeVerifyWidget();
}

class _PinCodeVerifyWidget extends State<PinCodeVerifyWidget> {
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verify Pincode",
          style: TextStyle(fontFamily: 'Sora', fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Angiv en firecifret PIN-kode der skal bruges når du vil "
                    "logge ind i Appelsin app’en.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Customwidgets.step(0.4, "4", "10"),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                      (index) => _buildPinBox(_controllers[index]),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  child: const Text("Videre"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildPinBox(TextEditingController controller) {
    return Container(
      width: 60,
      height: 75,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7FF),
        border: Border.all(color: const Color(0xFFCCDDFE)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          color: Color(0xFF392919),
          fontSize: 22,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
        ),
        decoration: const InputDecoration(
          counterText: '', // removes the char counter
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            // move to next box automatically
            final index = _controllers.indexOf(controller);
            if (index < _controllers.length - 1) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
      ),
    );
  }

  void _onSubmit() {
    final pin = _controllers.map((c) => c.text).join();
    debugPrint("PIN entered: $pin");
    navigateWithSlide(context, SavePinCodeWidget(), SlideDirection.right);
    // TODO: handle PIN logic (validate or save)
  }
}
