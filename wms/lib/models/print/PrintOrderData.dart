class PrintOrderData {
  final String? customName;
  final String? carModelName;
  final String? vinCode;
  final List<CarModelItem>? carModellRespList;
  final int? totalQuantity;
  final String? totalAmount;
  final String? salesman;
  final String? totalAmountInWords;
  final int? totalTypes;
  final String? payableAmount;
  final String? amountPaid;
  final String? amountToBePaid;
  final String? payType;
  final String? logisticsRoute;
  final String? orderTime;
  final String? saleOrder;
  final String? orderNo;
  final String? receiverTelephone;
  final String? receiverAddress;
  final String? remark;
  final String? printTime;
  final String? headerName;
  final double? rechargeDiscount;
  final String? rechargeDiscountText;
  final int? cashDiscountType;
  final double? cashDiscount;
  final String? cashDiscountText;
  final int? rechargeDiscountType;
  final String? payQRCode;
  final String? rechargeDiscountTextDesc;

  PrintOrderData({
    this.customName,
    this.carModelName,
    this.vinCode,
    this.carModellRespList,
    this.totalQuantity,
    this.totalAmount,
    this.salesman,
    this.totalAmountInWords,
    this.totalTypes,
    this.payableAmount,
    this.amountPaid,
    this.amountToBePaid,
    this.payType,
    this.logisticsRoute,
    this.orderTime,
    this.saleOrder,
    this.orderNo,
    this.receiverTelephone,
    this.receiverAddress,
    this.remark,
    this.printTime,
    this.headerName,
    this.rechargeDiscount,
    this.rechargeDiscountText,
    this.cashDiscountType,
    this.cashDiscount,
    this.cashDiscountText,
    this.rechargeDiscountType,
    this.payQRCode,
    this.rechargeDiscountTextDesc,
  });

  factory PrintOrderData.fromJson(Map<String, dynamic> json) {
    var list = json['carModellRespList'] as List?;
    List<CarModelItem>? carModellRespList;
    if (list != null) {
      carModellRespList = list.map((item) => CarModelItem.fromJson(item)).toList();
    }

    return PrintOrderData(
      customName: json['customName'] as String?,
      carModelName: json['carModelName'] as String?,
      vinCode: json['vinCode'] as String?,
      carModellRespList: carModellRespList,
      totalQuantity: json['totalQuantity'] as int?,
      totalAmount: json['totalAmount'] as String?,
      salesman: json['salesman'] as String?,
      totalAmountInWords: json['totalAmountInWords'] as String?,
      totalTypes: json['totalTypes'] as int?,
      payableAmount: json['payableAmount'] as String?,
      amountPaid: json['amountPaid'] as String?,
      amountToBePaid: json['amountToBePaid'] as String?,
      payType: json['payType'] as String?,
      logisticsRoute: json['logisticsRoute'] as String?,
      orderTime: json['orderTime'] as String?,
      saleOrder: json['saleOrder'] as String?,
      orderNo: json['orderNo'] as String?,
      receiverTelephone: json['receiverTelephone'] as String?,
      receiverAddress: json['receiverAddress'] as String?,
      remark: json['remark'] as String?,
      printTime: json['printTime'] as String?,
      headerName: json['headerName'] as String?,
      rechargeDiscount: (json['rechargeDiscount'] is num)
          ? (json['rechargeDiscount'] as num).toDouble()
          : null,
      rechargeDiscountText: json['rechargeDiscountText'] as String?,
      cashDiscountType: json['cashDiscountType'] as int?,
      cashDiscount: (json['cashDiscount'] is num)
          ? (json['cashDiscount'] as num).toDouble()
          : null,
      cashDiscountText: json['cashDiscountText'] as String?,
      rechargeDiscountType: json['rechargeDiscountType'] as int?,
      payQRCode: json['payQRCode'] as String?,
      rechargeDiscountTextDesc: json['rechargeDiscountTextDesc'] as String?,
    );
  }
}

class CarModelItem {
  final String? sysSkuCode;
  final String? skuCode;
  final String? oeName;
  final String? brandName;
  final int? num;
  final String? totalSalesPrice;

  CarModelItem({
    this.sysSkuCode,
    this.skuCode,
    this.oeName,
    this.brandName,
    this.num,
    this.totalSalesPrice,
  });

  factory CarModelItem.fromJson(Map<String, dynamic> json) {
    return CarModelItem(
      sysSkuCode: json['sysSkuCode'] as String?,
      skuCode: json['skuCode'] as String?,
      oeName: json['oeName'] as String?,
      brandName: json['brandName'] as String?,
      num: json['num'] as int?,
      totalSalesPrice: json['totalSalesPrice'] as String?,
    );
  }
}