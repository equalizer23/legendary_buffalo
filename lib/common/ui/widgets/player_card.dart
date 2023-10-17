import 'package:flutter/material.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_row.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_text.dart';
import 'package:legendary_buffalo/models/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  const PlayerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 8.0,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusableText(
                text: player.name,
                size: 26,
                color: Colors.black,
              ),
              ReusableRow(value: player.birth, description: 'Birth'),
              ReusableRow(value: player.nbaStart, description: 'Nba Start'),
              ReusableRow(value: player.weight, description: 'Weight'),
            ],
          ),
        ),
      ),
    );
  }
}
