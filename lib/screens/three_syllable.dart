import 'package:flutter/material.dart';

import '../components/hover_letters.dart';

class ThreeSyllable extends StatelessWidget {
  ThreeSyllable({super.key});

  final List<String> letters = [
    'آب میوه',
    'آببازی',
    'استخوان',
    'اسلحه',
    'باادب',
    'بادپکه',
    'بادرنگ',
    'پرسیدن',
    'پس فردا',
    'پلاستیک',
    'تابستان',
    'تجارت',
    'تباشیر',
    'ثانیه',
    'جایزه',
    'جای نماز',
    'جلغوزه',
    'چپرکت',
    'چهارشنبه',
    'حل کردن',
    'حیوانات',
    'خداوند',
    'خارجی',
    'خربوزه',
    'درس دادن',
    'در میان',
    'ذخیره',
    'ذوب شدن',
    'رخصتی',
    'رستورانت',
    'ستاره',
    'سرطان',
    'شفتالو',
    'شکستن',
    'صحتمند',
    'صمیمی',
    'ضعف کردن',
    'طبقه',
    'طیاره',
    'علاقه',
    'علامه',
    'غیر حاضر',
    'غرق شدن',
    'فاتحه',
    'فابریکه',
    'فاصله',
    'قبرستان',
    'قالب گوش',
    'کار کردن',
    'کامیاب',
    'کچالو',
    'گذاشتن',
    'گذشته',
    'مایعات',
    'مثلث',
    'محصل',
    'نوشیدن',
    'ناراحت',
    'نوشیدن',
    'وارخطا',
    'واسلین',
    'والیبال',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three Syllable'),
      ),
      backgroundColor: Color.fromRGBO(25, 35, 54, 1),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/single-litter.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: letters
                      .map((letter) => HoverLetter(word: letter, voice: letter))
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
