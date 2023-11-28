import 'package:flutter/material.dart';
import 'package:i_table/features/user_profile/presentation/widget/user_profile_page/user_profile_app_bar/user_profile_app_bar.dart';
import 'package:i_table/features/user_profile/presentation/widget/user_profile_page/user_profile_body/user_profile_body.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserProfileAppBar(title: 'Profil'),
      body: UserProfileBody()
    );
  }
}
