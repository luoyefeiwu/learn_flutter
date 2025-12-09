class FilterBarResult {
  final String areaId;
  final String priceId;
  final String rentTypeId;
  final List<String> moreIds;

  FilterBarResult(this.areaId, this.priceId, this.rentTypeId, this.moreIds);
}

//通用
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType> areaList = [
  GeneralType('区域1', '11'),
  GeneralType('区域2', '22'),
];

List<GeneralType> priceList = [
  GeneralType('价格1', '33'),
  GeneralType('价格2', '44'),
];

List<GeneralType> roomTypeList = [
  GeneralType('出租类型1', '55'),
  GeneralType('出租类型2', '66'),
];

List<GeneralType> orientedList = [
  GeneralType('方向1', '77'),
  GeneralType('方向2', '88'),
];

List<GeneralType> floorList = [
  GeneralType('楼层1', '99'),
  GeneralType('楼层2', '1010'),
];
