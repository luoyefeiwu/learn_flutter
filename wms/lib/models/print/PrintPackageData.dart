class PrintPackageData {
  final String? printTime;
  final String? remark;
  final String? customName;
  final String? receiver;
  final String? receiverTelephone;
  final String? receiverAddress;
  final String? payType;
  final String? packageCoSourcingPerson;
  final String? packageCoSourcingNo;
  final String? whetherToCollectGoods;
  final String? logisticsRoute;
  final List<CarModel>? carModellRespList;
  final int? total;
  final String? gridName;
  final String? headerName;
  final String? earliestShippingTime;
  final String? frameNo;
  final String? carLicence;

  PrintPackageData({
    this.printTime,
    this.remark,
    this.customName,
    this.receiver,
    this.receiverTelephone,
    this.receiverAddress,
    this.payType,
    this.packageCoSourcingPerson,
    this.packageCoSourcingNo,
    this.whetherToCollectGoods,
    this.logisticsRoute,
    this.carModellRespList,
    this.total,
    this.gridName,
    this.headerName,
    this.earliestShippingTime,
    this.frameNo,
    this.carLicence,
  });

  factory PrintPackageData.fromJson(Map<String, dynamic> json) {
    final carModellRespListJson = json['carModellRespList'];
    List<CarModel>? carModellRespList;
    if (carModellRespListJson is List) {
      carModellRespList = carModellRespListJson
          .map(
            (e) =>
                e != null ? CarModel.fromJson(e as Map<String, dynamic>) : null,
          )
          .where((e) => e != null)
          .cast<CarModel>()
          .toList();
    }

    return PrintPackageData(
      printTime: json['printTime'] as String?,
      remark: json['remark'] as String?,
      customName: json['customName'] as String?,
      receiver: json['receiver'] as String?,
      receiverTelephone: json['receiverTelephone'] as String?,
      receiverAddress: json['receiverAddress'] as String?,
      payType: json['payType'] as String?,
      packageCoSourcingPerson: json['packageCoSourcingPerson'] as String?,
      packageCoSourcingNo: json['packageCoSourcingNo'] as String?,
      whetherToCollectGoods: json['whetherToCollectGoods'] as String?,
      logisticsRoute: json['logisticsRoute'] as String?,
      carModellRespList: carModellRespList,
      total: json['total'] as int?,
      gridName: json['gridName'] as String?,
      headerName: json['headerName'] as String?,
      earliestShippingTime: json['earliestShippingTime'] as String?,
      frameNo: json['frameNo'] as String?,
      carLicence: json['carLicence'] as String?,
    );
  }
}

class CarModel {
  final String? carModelName;
  final String? vinCode;
  final List<Detail>? detailRespList;

  CarModel({this.carModelName, this.vinCode, this.detailRespList});

  factory CarModel.fromJson(Map<String, dynamic> json) {
    final detailRespListJson = json['detailRespList'];
    List<Detail>? detailRespList;
    if (detailRespListJson is List) {
      detailRespList = detailRespListJson
          .map(
            (e) =>
                e != null ? Detail.fromJson(e as Map<String, dynamic>) : null,
          )
          .where((e) => e != null)
          .cast<Detail>()
          .toList();
    }

    return CarModel(
      carModelName: json['carModelName'] as String?,
      vinCode: json['vinCode'] as String?,
      detailRespList: detailRespList,
    );
  }
}

class Detail {
  final String? sysSkuCode;
  final String? skuCode;
  final String? oeName;
  final int? num;
  final String? oddNumbers;
  final String? outboundOrderNo;

  Detail({
    this.sysSkuCode,
    this.skuCode,
    this.oeName,
    this.num,
    this.oddNumbers,
    this.outboundOrderNo,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      sysSkuCode: json['sysSkuCode'] as String?,
      skuCode: json['skuCode'] as String?,
      oeName: json['oeName'] as String?,
      num: json['num'] as int?,
      oddNumbers: json['oddNumbers'] as String?,
      outboundOrderNo: json['outboundOrderNo'] as String?,
    );
  }
}
