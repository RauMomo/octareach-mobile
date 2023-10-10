import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/store/profile_store.dart';
import 'package:boilerplate/utils/conversion/extensions.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileStore _profileStore = getIt<ProfileStore>();
  final UserStore _userStore = getIt<UserStore>();
  final ThemeStore _themeStore = getIt<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await _profileStore.logoutAccount().then((value) {
            _themeStore.resetTabIndex();
            _userStore.logout();
            context.navigator.pushNamedAndRemoveUntil(
              Routes.login,
              (route) => false,
            );
          });
        },
        child: Text('Log Out'),
      ),
    );
  }
}
