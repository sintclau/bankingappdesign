import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ToolCard extends StatelessWidget {
  String _toolName;
  IconData _toolIcon;

  ToolCard(this._toolName, this._toolIcon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 150,
        height: 189,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.purpleAccent.withOpacity(0.3),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Icon(_toolIcon, size: 40, color: Colors.white),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                width: 130,
                child: Text(
                  _toolName,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}