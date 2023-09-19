import 'package:flutter/cupertino.dart';

class SloganText extends StatelessWidget {
  const SloganText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(fontSize: 13, color: Color(0XFF8A8A8A)),
          children: <TextSpan>[
            TextSpan(text: '© 2023. Ứng dụng '),
            TextSpan(
                text: 'Tuổi trẻ Đà Nẵng.',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '\n Một sản phẩm của Thành đoàn Đà Nẵng'),
          ],
        ),
      ),
    );
  }
}
