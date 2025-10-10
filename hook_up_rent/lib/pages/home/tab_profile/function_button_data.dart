class FunctionButtonItem {
  final String imageUri;
  final String title;
  final Function? onTapHandle;

  FunctionButtonItem(this.imageUri, this.title, this.onTapHandle);
}

final List<FunctionButtonItem> list = [
  FunctionButtonItem('https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg', '看房记录', null),
  FunctionButtonItem('https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg', '我的订单', null),
  FunctionButtonItem('https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg', '我的收藏', null),
  FunctionButtonItem('https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg', '身份认证', null),
  FunctionButtonItem('https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg', '联系我们', null),
  FunctionButtonItem('https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg', '电子合同', null),
  FunctionButtonItem('https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg', '房源管理', null),
  FunctionButtonItem('static/images/test.png', '钱包', null),
];
