import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solartracker/Theme/customcolors.dart';

enum DataType { Current, Voltage, kWh }

class SolarIODataField extends StatefulWidget {
  final DataType dataType;
  final double dataValue;
  final double percentValue;
  const SolarIODataField(
      {Key? key,
      required this.dataType,
      required this.dataValue,
      required this.percentValue})
      : super(key: key);

  @override
  State<SolarIODataField> createState() => _SolarIODataFieldState();
}
CustomColors customColors = CustomColors();
class _SolarIODataFieldState extends State<SolarIODataField>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          dataTypeText(),
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        Container(
          width: 40,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.redAccent.withOpacity(0.2)),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: controller.value == 0 ? 0 : (widget.percentValue*controller.value),
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: controller.value == 0 ? Colors.transparent : customColors.highlightRed),
          ),
        )
      ],
    );
  }

  String dataTypeText() {
    switch (widget.dataType) {
      case DataType.Current:
        return "Input Current";
      case DataType.Voltage:
        return "Input Voltage";
      case DataType.kWh:
        return "kWh produced";
    }
  }
}
