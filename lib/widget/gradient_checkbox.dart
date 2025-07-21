import 'package:flutter/material.dart';
import 'package:waveauth/util/const_colors.dart';

class GradientCircularCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const GradientCircularCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<GradientCircularCheckbox> createState() => _GradientCircularCheckboxState();
}

class _GradientCircularCheckboxState extends State<GradientCircularCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: Container(
        width: 30,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient:AppGradients.mainGradient
        ),
        padding: const EdgeInsets.all(3),
        child: Container(
          
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:  Colors.white,
          ),
          child:  Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.value ? AppColors.primary : Colors.white,
          ),
        ),
      ),
      ),
    );
  }
}
