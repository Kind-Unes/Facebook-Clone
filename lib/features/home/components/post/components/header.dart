import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/user_profile_widgets.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String userPicture;
  final String timeAgo;
  final String privacy;
  // to show up the full post in other route
  final Function() onPressed;

  const PostHeader({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.userPicture,
    required this.timeAgo,
    required this.privacy,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    IconData myIcon(String privacy) {
      switch (privacy) {
        case "friends":
          return Icons.supervised_user_circle_rounded;
        case "public":
          return Icons.public;
        case "private":
          return Icons.supervised_user_circle_rounded;
        default:
          return Icons.public;
      }
    }

    IconData iconData = myIcon(privacy);

    double raduis = 56;
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
          leading: Transform.translate(
            offset: const Offset(-10, 0),
            child: UserProfileThumbnail(
              isActive: true,
              raduis: raduis,
              userPicture: userPicture,
              onPressed: () {},
            ),
          ),
          title: Transform.translate(
            offset: const Offset(-15, 0),
            child: UserFullName(
              firstName: firstName,
              lastName: lastName,
              onPressed: () {},
            ),
          ),
          subtitle: Transform.translate(
            offset: const Offset(-11, 0),
            child: Row(
              children: [
                Text("$timeAgo   . "),
                Icon(
                  iconData,
                  size: 20,
                ),
              ],
            ),
          ),
          trailing: Transform.translate(
            offset: const Offset(15, -10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MySmallButton(
                  onPressed: () {},
                  icon: Icons.more_horiz,
                ),
                MySmallButton(
                  onPressed: () {},
                  icon: Icons.clear,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
