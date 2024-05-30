import 'package:alquran_app/core/design_system/themes/textstyles.dart';
import 'package:alquran_app/features/prayer/presentation/ui/widgets/prayer_time_widget.dart';
import 'package:alquran_app/features/quran/presentation/ui/screens/quran_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/design_system/themes/pallet.dart';
import '../../../../core/design_system/themes/dimension.dart';
import '../widgets/home_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.whiteScaffold,
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderWidget(),
            const PrayerTimeWidget(),
            const QuranScreen(),
            SizedBox(height: Dimension.width10),
            Center(
              child: Text(
                'Feature Widget',
                style: TextStyles.textBaseXtraBold,
              ),
            ),
            const Center(
              child: Text(' Sholat Time Widget'),
            ),
            const Spacer(),
            const Center(
              child: Text('Bottom Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}
