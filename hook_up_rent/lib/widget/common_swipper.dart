import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class CommonSwiper extends StatefulWidget {
  const CommonSwiper({super.key});

  @override
  State<CommonSwiper> createState() => _CommonSwiperState();
}

class _CommonSwiperState extends State<CommonSwiper> {
  List<String> images = [
    'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
    'https://res.5i5j.com/uploads/images/2024/0513/14/1715581598903365.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Swiper(
          autoplay: true,
          itemCount: 2,
          loop: true,
          pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: TDSwiperPagination.dots,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Image(
              image: NetworkImage(images[index]),
              fit: BoxFit.fill,
            );
          },
        ));
  }
}
