import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleCheckbox extends StatefulWidget {
  final double size;
  final String initialState;
  final Function(String) onChanged;

  const ToggleCheckbox({
    Key? key,
    required this.onChanged,
    this.size = 30,
    this.initialState = "none",
  }) : super(key: key);

  @override
  State<ToggleCheckbox> createState() => _ToggleCheckboxState();
}

class _ToggleCheckboxState extends State<ToggleCheckbox> {
  late String _currentState;

  @override
  void initState() {
    super.initState();
    _currentState = widget.initialState;
  }

  void _toggleState() {
    setState(() {
      if (_currentState == "none") {
        _currentState = "checked";
      } else if (_currentState == "checked") {
        _currentState = "none";
      }
      widget.onChanged(_currentState);
    });
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    switch (_currentState) {
      case "checked":
        iconData = Icons.check;
        iconColor = Colors.green;
        break;
      case "crossed":
        iconData = Icons.close;
        iconColor = Colors.red;
        break;
      default:
        iconData = Icons.crop_square;
        iconColor = Colors.grey;
    }

    return GestureDetector(
      onTap: _toggleState,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Icon(iconData, color: iconColor, size: widget.size - 6),
      ),
    );
  }
}
