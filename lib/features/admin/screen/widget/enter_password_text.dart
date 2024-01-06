import 'package:flutter/material.dart';

class EnterThePassText extends StatelessWidget {
  const EnterThePassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Enter The  ",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 26.0,
                      color: Color(0xFF374151),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    " Password",
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
            ],
          ),
        )
      ],
    );
  }
}
