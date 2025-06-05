import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:unitontro/ui/chat_with_ai/widgets/ask_ai.dart';
import 'package:unitontro/ui/routine/widgets/individual_routine_page.dart'; 

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    final double circularBtnWidth = width * 0.22; // 15% of screen width
    final double circularBtnHeight = circularBtnWidth;

    final double centerX = width / 2;
    final double centerY = height * 0.5; // Adjust the center position vertically

    // Colors
    final Color btnColor1 = const Color(0xFF1A502E);
    final Color btnColor2 = const Color(0xBF1A502E);
    final Color btnColor3 = const Color(0xFFB7E4C8);
    final Color btnColor4 = const Color(0x731A502E);

    print("hi");

    //Corners
    const Radius cornerRadius =
        Radius.circular(100); // Adjust this value for rounded corners

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: centerX - circularBtnWidth - 3,
            top: centerY - circularBtnHeight - 3,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const IndividualRoutinePage());
              },
              child: Container(
                      width: circularBtnWidth,
                      height: circularBtnHeight,
                      decoration: BoxDecoration(
                        color: btnColor1,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(1000),
                          bottomLeft: cornerRadius,
                          topRight: cornerRadius,
                          bottomRight: cornerRadius,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: circularBtnWidth * 0.10),
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: circularBtnWidth * 0.4, // Adjust icon size
                        ),
                      ))
                  .animate()
                  .fade(
                    begin: 0.5,
                    end: 1,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  )
                  .slideX(
                    begin: -0.5,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
          ),
          Positioned(
            right: centerX - circularBtnWidth - 3,
            top: centerY - circularBtnHeight - 3,
            child: GestureDetector(
              child: Container(
                      width: circularBtnWidth,
                      height: circularBtnHeight,
                      decoration: BoxDecoration(
                        color: btnColor2,
                        borderRadius: const BorderRadius.only(
                          topLeft: cornerRadius,
                          bottomLeft: cornerRadius,
                          topRight: Radius.circular(1000),
                          bottomRight: cornerRadius,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: circularBtnWidth * 0.10),
                        child: Icon(
                          Icons.bus_alert,
                          color: Colors.white,
                          size: circularBtnWidth * 0.4, // Adjust icon size
                        ),
                      ))
                  .animate()
                  .fade(
                    begin: 0.5,
                    end: 1,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  )
                  .slideY(
                    begin: -0.5,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
          ),
          Positioned(
            left: centerX - circularBtnWidth - 3,
            bottom: centerY - circularBtnHeight - 3,
            child: GestureDetector(
              child: Container(
                      width: circularBtnWidth,
                      height: circularBtnHeight,
                      decoration: BoxDecoration(
                        color: btnColor3,
                        borderRadius: const BorderRadius.only(
                          topLeft: cornerRadius,
                          bottomLeft: Radius.circular(1000),
                          topRight: cornerRadius,
                          bottomRight: cornerRadius,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: circularBtnWidth * 0.10,
                            bottom: circularBtnHeight * 0.10),
                        child: Icon(
                          Icons.fastfood,
                          color: Colors.white,
                          size: circularBtnWidth * 0.4, // Adjust icon size
                        ),
                      ))
                  .animate()
                  .fade(
                    begin: 0.5,
                    end: 1,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  )
                  .slideY(
                    begin: 0.5,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
          ),
          Positioned(
            right: centerX - circularBtnWidth - 3,
            bottom: centerY - circularBtnHeight - 3,
            child: GestureDetector(
              onTap: () {
                Get.to(() => AskAi());  //ekhane

              },
              child: Container(
                      width: circularBtnWidth,
                      height: circularBtnHeight,
                      decoration: BoxDecoration(
                        color: btnColor4,
                        borderRadius: const BorderRadius.only(
                          topLeft: cornerRadius,
                          bottomLeft: cornerRadius,
                          topRight: cornerRadius,
                          bottomRight: Radius.circular(1000),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: circularBtnWidth * 0.10,
                            bottom: circularBtnHeight * 0.10),
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: circularBtnWidth * 0.4, // Adjust icon size
                        ),
                      ))
                  .animate()
                  .fade(
                    begin: 0.5,
                    end: 1,
                    duration: 1000.ms,
                    curve: Curves.easeInOut,
                  )
                  .slideX(
                    begin: 0.5,
                    end: 0,
                    duration: 1000.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
          ),
          Positioned(
            width: 150,
            top: centerY + circularBtnHeight + 20,
            left: centerX - 150 / 2,
            child: Center(
              child: Text('Unitontro',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: btnColor1,
                            letterSpacing: 3, 
                          )).animate().fade(
                    begin: 0.5,
                    end: 1,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
