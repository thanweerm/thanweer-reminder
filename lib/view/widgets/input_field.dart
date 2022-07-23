import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.label, this.iconchild, this.ontap})
      : super(key: key);
  final String label;
  final Widget? iconchild;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.indigo[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
            labelText: label,
            suffixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: iconchild,
            )),
        onTap: ontap,
      ),
    );
  }
}
