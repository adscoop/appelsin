import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/pincode/PinCodeVerifyWidget.dart';
class PinCodeSetupWidget extends StatefulWidget {
  final Appelsinbruger appelsinbruger;
  const PinCodeSetupWidget({Key? key , required this.appelsinbruger}): super(key: key);

  @override
  State<PinCodeSetupWidget> createState() => _PinCodeSetupWidgetState();
}

class _PinCodeSetupWidgetState extends State<PinCodeSetupWidget> {

  late Appelsinapi _appelsinapi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appelsinapi = Appelsinapi();
  }
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
          "Pin-kode",
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
              Customwidgets.step(0.3, "3", "10"),
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
          fontSize: 11,
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

    navigateWithSlide(context, PinCodeVerifyWidget(pin:  pin, appelsinbruger: widget.appelsinbruger,), SlideDirection.right);
    // TODO: handle PIN logic (validate or save)
  }
}
