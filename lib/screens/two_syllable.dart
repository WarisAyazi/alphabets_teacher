import 'package:flutter/material.dart';
import '../components/hover_letters.dart';

class TwoSyllable extends StatelessWidget {
  TwoSyllable({super.key});

  final List<String> letters = [
    'آبشار',
    'آبی',
    'آدرس',
    'اتاق',
    'احمق',
    'ارزان',
    'اره',
    'استاد',
    'بادام',
    'بادغیس',
    'بالشت',
    'بخار',
    'بسکیت',
    'پادشاه',
    'پاسپورت',
    'پاک',
    'پایتخت',
    'تابلو',
    'تاریخ',
    'تاریک',
    'جوزا',
    'جیگر',
    'جلد',
    'جمله',
    'چارمغز',
    'چاقو',
    'چاکلیت',
    'حساب',
    'حلوا',
    'حلال',
    'خراب',
    'خرگوش',
    'خرما',
    'دانش',
    'داکتر',
    'درست',
    'راستی',
    'راضی',
    'روشن',
    'زانو',
    'زبان',
    'زیاد',
    'ساختن',
    'ساعت',
    'ساکت',
    'شجاع',
    'شاگرد',
    'شادی',
    'صابون',
    'صفحه',
    'طاووس',
    'طبله',
    'طرف',
    'ظروف',
    'عادت',
    'عاید',
    'عدد',
    'فامیل',
    'فایده',
    'فردا',
    'قیمت',
    'کابل',
    'کاسه',
    'کارگر',
    'گادی',
    'گرام',
    'گرده',
    'لاجورد',
    'لاشتک',
    'لباس',
    'محفل',
    'مردم',
    'مرطوب',
    'ناخن',
    'نارنج',
    'نازک',
    'واضح',
    'واکسین',
    'والی',
    'وزیر',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Syllable'),
      ),
      backgroundColor: Color.fromRGBO(25, 35, 54, 1),
      body: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: letters
                      .map((letter) => HoverLetter(letter: letter))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
