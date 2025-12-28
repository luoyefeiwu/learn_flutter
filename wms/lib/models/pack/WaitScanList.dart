class WaitScanList {
  String receiver;
  String receiverAddress;
  int firstPackage;
  String remark;
  String internalRemarks;
  String orderLabel;
  String logisticsRoute;
  String warehouseCode;
  int checkScanNo;
  dynamic drawer; // 使用 dynamic 表示可以接受任何类型的值，包括 null
  List<OrderItem> list;
  dynamic changeGoodsRemark;
  dynamic changeGoodsRemarkImages;
  dynamic changeGoodsRemarkErrorImages;
  dynamic pickNum;
  dynamic checkNum;
  dynamic showChangeGoodsRemark;
  dynamic skuName;
  dynamic oeCode;
  dynamic brandName;
  dynamic carModelName;
  dynamic brandCategoryName;
  dynamic showOrderLabels;
  dynamic outOrderNo;
  dynamic saleOrderNo;
  dynamic containerNo;
  dynamic taskNumber;
  String customerCode;
  String customerName;

  WaitScanList({
    required this.receiver,
    required this.receiverAddress,
    required this.firstPackage,
    required this.remark,
    required this.internalRemarks,
    required this.orderLabel,
    required this.logisticsRoute,
    required this.warehouseCode,
    required this.checkScanNo,
    this.drawer,
    required this.list,
    this.changeGoodsRemark,
    this.changeGoodsRemarkImages,
    this.changeGoodsRemarkErrorImages,
    this.pickNum,
    this.checkNum,
    this.showChangeGoodsRemark,
    this.skuName,
    this.oeCode,
    this.brandName,
    this.carModelName,
    this.brandCategoryName,
    this.showOrderLabels,
    this.outOrderNo,
    this.saleOrderNo,
    this.containerNo,
    this.taskNumber,
    required this.customerCode,
    required this.customerName,
  });

  factory WaitScanList.fromJson(Map<String, dynamic> json) {
    return WaitScanList(
      receiver: json['receiver'],
      receiverAddress: json['receiverAddress'],
      firstPackage: json['firstPackage'],
      remark: json['remark'],
      internalRemarks: json['internalRemarks'],
      orderLabel: json['orderLabel'],
      logisticsRoute: json['logisticsRoute'],
      warehouseCode: json['warehouseCode'],
      checkScanNo: json['checkScanNo'],
      drawer: json['drawer'],
      list: List.from(json['list']).map((item) => OrderItem.fromJson(item)).toList(),
      changeGoodsRemark: json['changeGoodsRemark'],
      changeGoodsRemarkImages: json['changeGoodsRemarkImages'],
      changeGoodsRemarkErrorImages: json['changeGoodsRemarkErrorImages'],
      pickNum: json['pickNum'],
      checkNum: json['checkNum'],
      showChangeGoodsRemark: json['showChangeGoodsRemark'],
      skuName: json['skuName'],
      oeCode: json['oeCode'],
      brandName: json['brandName'],
      carModelName: json['carModelName'],
      brandCategoryName: json['brandCategoryName'],
      showOrderLabels: json['showOrderLabels'],
      outOrderNo: json['outOrderNo'],
      saleOrderNo: json['saleOrderNo'],
      containerNo: json['containerNo'],
      taskNumber: json['taskNumber'],
      customerCode: json['customerCode'],
      customerName: json['customerName'],
    );
  }
}

class OrderItem {
  int skuId;
  String saleOrderNo;
  String oeCode;
  String skuCode;
  String sysSkuCode;
  String oeName;
  String externalOrderNo;
  String outboundOrderNo;
  int totalNum;
  String carModelName;
  String scanNo;
  CustomerInfo customerInfo;
  String reducedPriceUniqueCode;
  int isBatchOperate;
  String containerNo;
  String drawer;
  String internalRemarks;
  String storeInfo;

  OrderItem({
    required this.skuId,
    required this.saleOrderNo,
    required this.oeCode,
    required this.skuCode,
    required this.sysSkuCode,
    required this.oeName,
    required this.externalOrderNo,
    required this.outboundOrderNo,
    required this.totalNum,
    required this.carModelName,
    required this.scanNo,
    required this.customerInfo,
    required this.reducedPriceUniqueCode,
    required this.isBatchOperate,
    required this.containerNo,
    required this.drawer,
    required this.internalRemarks,
    required this.storeInfo,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      skuId: json['skuId'],
      saleOrderNo: json['saleOrderNo'],
      oeCode: json['oeCode'],
      skuCode: json['skuCode'],
      sysSkuCode: json['sysSkuCode'],
      oeName: json['oeName'],
      externalOrderNo: json['externalOrderNo'],
      outboundOrderNo: json['outboundOrderNo'],
      totalNum: json['totalNum'],
      carModelName: json['carModelName'],
      scanNo: json['scanNo'],
      customerInfo: CustomerInfo.fromJson(json['customerInfo']),
      reducedPriceUniqueCode: json['reducedPriceUniqueCode'],
      isBatchOperate: json['isBatchOperate'],
      containerNo: json['containerNo'],
      drawer: json['drawer'],
      internalRemarks: json['internalRemarks'],
      storeInfo: json['storeInfo'],
    );
  }
}

class CustomerInfo {
  String receiver;
  String receiverAddress;
  int firstPackage;
  String logisticsRoute;
  String remark;
  String orderLabel;
  String customerCode;
  String customerName;

  CustomerInfo({
    required this.receiver,
    required this.receiverAddress,
    required this.firstPackage,
    required this.logisticsRoute,
    required this.remark,
    required this.orderLabel,
    required this.customerCode,
    required this.customerName,
  });

  factory CustomerInfo.fromJson(Map<String, dynamic> json) {
    return CustomerInfo(
      receiver: json['receiver'],
      receiverAddress: json['receiverAddress'],
      firstPackage: json['firstPackage'],
      logisticsRoute: json['logisticsRoute'],
      remark: json['remark'],
      orderLabel: json['orderLabel'],
      customerCode: json['customerCode'],
      customerName: json['customerName'],
    );
  }
}