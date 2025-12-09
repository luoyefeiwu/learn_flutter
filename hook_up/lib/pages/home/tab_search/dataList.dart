class RoomListItemData {
  final String id;
  final String title;
  final String subTitle;
  final String imageUri;
  final List<String> tags;
  final String price;

  const RoomListItemData({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.imageUri,
    required this.tags,
    required this.price,
  });
}

const List<RoomListItemData> dataList = [
  RoomListItemData(
    id: '1',
    title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
    subTitle: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
    imageUri:
        'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
    tags: [
      'Living Room',
      'Living Room',
      'Living Room',
      'Living Room',
      'Living Room',
      'Living Room',
      'Living Room'
    ],
    price: '1000',
  ),
  RoomListItemData(
    id: '2',
    title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
    subTitle: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
    imageUri:
        'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
    tags: [
      'Kitchen',
      'Kitchen',
      'Kitchen',
      'Kitchen',
      'Kitchen',
      'Kitchen',
      'Kitchen' 'Kitchen'
    ],
    price: '1000',
  )
];
