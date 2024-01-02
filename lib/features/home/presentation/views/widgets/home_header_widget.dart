import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/global/theme/app_colors_light.dart';
import '../../../../../core/utilities/assets_data.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
    String _value = '1';

  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AssetsData.locationIconSVG),
                    SizedBox(width: 5.w),
                    Theme(
                      data: ThemeData(
                        canvasColor: kWhiteColor,
                      ),
                      child: DropdownButton<String>(
                        value: _value,
                        hint: const Text('Egypt'),
                        elevation: 0,
                        borderRadius: BorderRadius.zero,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        padding: EdgeInsets.zero,
                        items: const [
                          DropdownMenuItem(value: '1', child: Text('Egypt')),
                          DropdownMenuItem(value: '2', child: Text('Egypt')),
                          DropdownMenuItem(value: '3', child: Text('Egypt')),
                          DropdownMenuItem(value: '4', child: Text('Egypt')),
                          DropdownMenuItem(value: '5', child: Text('Egypt')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value ?? '1';
                          });
                        },
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AssetsData.notificationIconSVG),
                ),
              ],
            );
  }
}