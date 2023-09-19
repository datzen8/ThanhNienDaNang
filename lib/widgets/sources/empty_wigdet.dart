import 'package:flutter/cupertino.dart';
import 'package:zen8app/router/router.dart';

enum EmptyType {
  campaign,
  news,
  contest,
  notification;

  String get title {
    return switch (this) {
      EmptyType.campaign => "Không có cuộc tình nguyện nào",
      EmptyType.news => "Không có bài viết nào",
      EmptyType.contest => "Không có cuộc thi nào",
      EmptyType.notification => "Không có bài viết nào",
    };
  }

  String get content {
    return switch (this) {
      EmptyType.campaign =>
        "Không có đợt tình nguyện nào đã kết thúc. Vui lòng kiểm tra lại sau để cập nhật thông tin mới.",
      EmptyType.news =>
        "Danh mục không có bài viết nào. Vui lòng kiểm tra lại sau để cập nhật thông tin mới.",
      EmptyType.contest =>
        "Không có cuộc thi nào sắp diễn ra. Vui lòng kiểm tra lại sau để cập nhật thông tin mới.",
      EmptyType.notification =>
        "Hiện tại bạn không có thông báo nào. Vui lòng kiểm tra lại sau để cập nhật thông tin mới.",
    };
  }

  String get imageUrl {
    return switch (this) {
      EmptyType.campaign => "images/grey_donation.png",
      EmptyType.news => "images/grey_news.png",
      EmptyType.contest => "images/grey_stage.png",
      EmptyType.notification => "images/grey_stage.png",
    };
  }
}

class EmptyWidget extends StatelessWidget {
  final EmptyType type;
  EmptyWidget({Key? key, required this.type}) : super(key: key);
  Color mainColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5F5F5),
              ),
              child: Image.asset(
                type.imageUrl,
                width: 48,
                height: 48,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Text(
              type.title,
              style: TextStyle(
                  color: mainColor, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              type.content,
              style: TextStyle(
                  color: mainColor, fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32,),
            GestureDetector(
              onTap: (){
                context.router.pop();
              },
                child: Text(
              "Quay về trang trước",
              style: TextStyle(
                  color: Color(0xFF005CE7),
                  fontWeight: FontWeight.w500,
                  fontSize: 14),

            )),
          ],
        ),
      ),
    );
  }
}
