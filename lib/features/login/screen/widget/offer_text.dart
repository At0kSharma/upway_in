import 'package:flutter/material.dart';
import 'package:upway_in/utils/constant/strings.dart';

class OfferText extends StatelessWidget {
  const OfferText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      TextString.offerTitle1,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 26.0,
                        color: Color(0xFF374151),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      TextString.offerTitle2,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        backgroundColor: Color(0xFF83A2FF),
                      ),
                    ),
                    Text(
                      '!',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF83A2FF),
                        backgroundColor: Color(0xFF83A2FF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'please register with your phone number',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF374151),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
