import 'package:flutter/material.dart';

class TextSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const TextSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<TextSwitch> createState() => _TextSwitchState();
}

class _TextSwitchState extends State<TextSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 80,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.value ? Colors.blue : Colors.grey,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Tekst "ON" eller "OFF"
            Align(
              alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.value ? "ON" : "OFF",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Knappen der flytter sig
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: widget.value
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
