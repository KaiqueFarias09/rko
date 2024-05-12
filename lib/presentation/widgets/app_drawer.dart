import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rko/core/colors/app_colors.dart';
import 'package:rko/core/constants/app_images.dart';
import 'package:rko/core/dimensions/app_dimensions.dart';
import 'package:rko/core/icons/app_icons.dart';
import 'package:rko/core/typography/app_typography.dart';
import 'package:rko/presentation/bloc/audio/audio_cubit.dart';
import 'package:rko/presentation/views/cpr/cpr_view.dart';
import 'package:rko/presentation/views/home/home_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blue500,
      width: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  AppIcons.x,
                  color: AppColors.blue100,
                  size: AppDimensions().spacing6,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Column(
                children: [
                  CustomListTile(
                      icon: AppIcons.goBack,
                      text: 'Menu główne',
                      onTap: () async {
                        await BlocProvider.of<AudioCubit>(context).stop();
                        await Navigator.of(context).pushNamedAndRemoveUntil(
                          HomeView.id,
                          (route) => false,
                        );
                      }),
                  const SizedBox(height: 20),
                  CustomListTile(
                      icon: AppIcons.heart,
                      text: 'Tempo uciskania',
                      onTap: () async {
                        await BlocProvider.of<AudioCubit>(context).stop();
                        await Navigator.of(context).pushNamedAndRemoveUntil(
                          CprView.id,
                          (route) => false,
                        );
                      }),
                  const SizedBox(height: 20),
                  CustomListTile(
                      icon: AppIcons.call,
                      text: 'Numer alarmowy',
                      onTap: () async {
                        await BlocProvider.of<AudioCubit>(context).stop();
                        await launchUrlString('tel: 112');
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  SvgPicture.asset(
                    AppImages.huggingHeartTinted,
                    height: 150,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: AppDimensions().spacing6,
        color: AppColors.blue100,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          text,
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.blue100,
          ),
        ),
      ),
    );
  }
}
