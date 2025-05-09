import 'package:flutter/material.dart';
import 'package:syntic_earth/controllers/utils/app_color.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';
import 'package:syntic_earth/views/widgets/leaderboard_data.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double avatarSize = screenWidth * 0.15;
    double firstPlaceSize = screenWidth * 0.2;
    double fontSize = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomWalletAppBar(
        title: "Leaderboard",
        iconData: Icon(Icons.arrow_back_ios_new, color: Colors.white),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: buildTopUser(
                      leaderboard[1],
                      AppColors.primaryColor,
                      avatarSize,
                      10,
                      2,
                      screenHeight,
                      screenWidth,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.12),
                  Expanded(
                    child: buildTopUser(
                      leaderboard[0],
                      AppColors.primaryColor,
                      firstPlaceSize,
                      20,
                      1,
                      screenHeight,
                      screenWidth,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.12),
                  Expanded(
                    child: buildTopUser(
                      leaderboard[2],
                      AppColors.primaryColor,
                      avatarSize,
                      10,
                      3,
                      screenHeight,
                      screenWidth,
                    ),
                  ),
                ],
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.7,
            maxChildSize: 0.75,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 10, 9, 36),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: leaderboard.length - 3,
                  itemBuilder: (context, index) {
                    int listIndex = index + 3;
                    bool isYou = leaderboard[listIndex]["name"] == "You";
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.007,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isYou
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${leaderboard[listIndex]["position"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          CircleAvatar(
                            radius: avatarSize * 0.4,
                            backgroundImage: AssetImage(
                              leaderboard[listIndex]["image"],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(
                            child: Text(
                              leaderboard[listIndex]["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize * 0.9,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "${leaderboard[listIndex]["time"]} mins",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize * 0.9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildTopUser(
    Map<String, dynamic> user,
    Color color,
    double size,
    double positionOffset,
    int rank,
    double screenHeight,
    double screenWidth,
  ) {
    return Column(
      children: [
        SizedBox(height: positionOffset),
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 3),
              ),
              child: CircleAvatar(
                radius: size / 2,
                backgroundImage: AssetImage(user["image"]),
              ),
            ),
            Positioned(
              bottom: -size * 0.15,
              child: Container(
                padding: EdgeInsets.all(size * 0.1),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text(
                  "$rank",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size * 0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          user["name"],
          style: TextStyle(color: Colors.white, fontSize: size * 0.2),
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/vector.png",
              height: screenHeight * 0.01,
            ),
            SizedBox(width: screenWidth * 0.01),
            Text(
              "${user["time"]} mins",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: size * 0.17,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
