import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 151, 150, 150),
      highlightColor: Color.fromARGB(255, 219, 218, 218),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 145,
              width: 110,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 15,
              width: 110,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
