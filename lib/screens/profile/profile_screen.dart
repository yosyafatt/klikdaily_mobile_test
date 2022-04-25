import 'package:flutter/material.dart';
import './../../utils/app_colors.dart';
import './../../utils/size_config.dart';
import 'components/profile_info_item.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.antiflashWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: vH(32.0),
                horizontal: vW(32.0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(vH(32.0)),
                ),
                color: AppColors.seaGreen,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(vH(36.0)),
                    child: Image.network(
                      'https://randomuser.me/api/portraits/women/50.jpg',
                      height: vH(120.0),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: vW(12.0)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Rizky Kurnia',
                          style: TextStyle(
                            fontSize: vH(32.0),
                            fontWeight: FontWeight.bold,
                            color: AppColors.antiflashWhite,
                          ),
                        ),
                        Text(
                          '@usernameeer',
                          style: TextStyle(
                            fontSize: vH(20.0),
                            fontWeight: FontWeight.bold,
                            color: AppColors.chineseYellow,
                          ),
                        ),
                        SizedBox(height: vH(16.0)),
                        OutlineButton(
                          onPressed: () {},
                          child: Text('Edit Profile'),
                          visualDensity: VisualDensity.compact,
                          textColor: AppColors.antiflashWhite,
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(vH(8.0)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(vW(32.0)),
              child: Column(
                children: [
                  AppProfileInfo(
                    icon: Icons.mail_rounded,
                    text: 'rizky.kurnia@bmail.com',
                  ),
                  AppProfileInfo(
                    icon: Icons.call_rounded,
                    text: '(+62) 8967 925 0191',
                  ),
                  AppProfileInfo(
                    icon: Icons.home_rounded,
                    text: 'Entertainment District 34, Shinjuku, Japan',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
