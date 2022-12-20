import 'dart:developer';
import 'package:example/demo/demo.dart';
import 'package:flutter/material.dart';

const _height = 0.06;
const _width = 0.6;

class SubmitButton extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;

  const SubmitButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * _height,
      width: screenSize.width * _width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: (_isLoading || widget.onPressed == null)
              ? Colors.grey
              : widget.buttonColor,
          shape: const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed:
            (_isLoading || widget.onPressed == null) ? null : _loadFuture,
        child: _isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                widget.text,
                style: TextStyle(color: widget.textColor, fontSize: 13.0),
              ),
      ),
    );
  }

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error $e')));
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
