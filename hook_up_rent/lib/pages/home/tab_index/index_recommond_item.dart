class IndexRecommondItem {
  String title;
  String subTitle;
  String imageUri;
  String navigateUri;

  IndexRecommondItem(this.title, this.subTitle, this.imageUri,
      this.navigateUri);
}

List<IndexRecommondItem> IndexRecommondItemList = [
  IndexRecommondItem(
      '家住回龙观', '归属的感觉',
      'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
      '/'),
  IndexRecommondItem(
      '宜居四五环', '大都市生活',
      'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
      '/'),
  IndexRecommondItem(
      '喧嚣三里屯', '繁华的背后',
      'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
      '/'),
  IndexRecommondItem(
      '比邻十号线', '地铁心连心',
      'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
      '/'),
];
