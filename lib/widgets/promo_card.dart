import 'package:dilo/utils/colors.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accent = AppColors.orange;
    return Container(
      width: double.maxFinite,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: accent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "D I L O",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 8,
                  ),
                  margin: const EdgeInsets.only(
                    left: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "PLUS",
                    style: TextStyle(
                      color: accent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                "Enjoy 3 colored post every week and unlock many more DILO Plus Powers!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
