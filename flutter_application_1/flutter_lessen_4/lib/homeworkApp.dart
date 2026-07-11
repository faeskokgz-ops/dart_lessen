import 'package:flutter/material.dart';

class HomeworkApp extends StatelessWidget {
  const HomeworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeworkHome();
  }
}

class HomeworkHome extends StatelessWidget {
  const HomeworkHome({super.key});

  final List<Map<String, String>> news = const [
    {
      'title': 'Финал Чемпионата мира',
      'subtitle': 'Невероятный матч завершился серией пенальти. Сборная завоевала главный трофей в драматичной борьбе, забив решающий гол на последних минутах.',
      'image': 'https://picsum.photos/seed/worldcupfinal/400/250',
      'tag': 'Футбол',
      'time': '10 мин назад'
    },
    {
      'title': 'Новый рекорд турнира',
      'subtitle': 'Молодой нападающий забил свой десятый гол на чемпионате, обойдя легендарных футболистов прошлых лет и установив историческое достижение.',
      'image': 'https://picsum.photos/seed/footballrecord/400/250',
      'tag': 'Спорт',
      'time': '45 мин назад'
    },
    {
      'title': 'Сенсация в полуфинале',
      'subtitle': 'Главный аутсайдер турнира разгромил фаворитов со счетом 3:0. Эксперты называют эту игру главным потрясением в истории чемпионатов.',
      'image': 'https://picsum.photos/seed/sensationsport/400/250',
      'tag': 'Аналитика',
      'time': '2 ч назад'
    },
    {
      'title': 'Церемония закрытия ЧМ',
      'subtitle': 'Грандиозное шоу с участием мировых звезд эстрады и технологичным лазерным представлением официально завершило главный спортивный праздник года.',
      'image': 'https://picsum.photos/seed/closingceremony/400/250',
      'tag': 'События',
      'time': '3 ч назад'
    },
    {
      'title': 'Лучший вратарь турнира',
      'subtitle': 'Голкипер сборной получил «Золотую перчатку». В ходе чемпионата он отразил рекордное количество одиннадцатиметровых ударов.',
      'image': 'https://picsum.photos/seed/goalkeeper/400/250',
      'tag': 'Награды',
      'time': '5 ч назад'
    },
    {
      'title': 'Подготовка к следующему ЧМ',
      'subtitle': 'Организационный комитет уже представил логотип и список городов, которые примут матчи следующего мирового первенства через четыре года.',
      'image': 'https://picsum.photos/seed/nextworldcup/400/250',
      'tag': 'Анонсы',
      'time': '1 день назад'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text(
          'ЧМ Новости',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final item = news[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        item['image']!,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        right: 16,
                        child: Text(
                          item['title']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: const Offset(0, 1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['subtitle']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.7),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEBEE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['tag']!,
                                style: const TextStyle(
                                  color: Color(0xFFC62828),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Text(
                              item['time']!,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}