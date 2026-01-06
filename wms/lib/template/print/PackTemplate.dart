import 'package:flutter/foundation.dart';

import '../../models/print/PrintPackageData.dart';


class PackTemplate {
  static String printPackage({
    required DateTime time,
    required PrintPackageData list,
  }) {
    var content = '';
    final date = DateTime.now();

    if (kDebugMode) {
      // print('playPackage: ${jsonEncode(list)}');
    }

    var height = 200;

    try {
      content += 'TEXT 0 24 10 20 ${list.printTime}\r\n';

      if (list.headerName != null && list.headerName!.isNotEmpty) {
        content +=
            'SETBOLD 5\r\n'
            'TEXT 0 32 350 15 ${list.headerName}\r\n'
            'SETBOLD 0\r\n';
      } else {
        content +=
            'EG 25 30 350 15 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFC007FFE3E0000F801FFF80003E3FFFF039FFFCE07F8F39EFFFF01FFFE3E0000F807FFF80003E3FFFF03BFFFEE0FFDFFFFFFFFC7FFFE3E0000F80FFFF80003E3FFFF03BC01EE0F3DFFFFFFFFEFFFFE3E0000F83FFFF80003E3FFFF03BFFFEE0F3C97CAFFFFF7FFFE3E0000F83FFFB80003E1FFFF03BFFFEE0F3DFFFFF803F780003E0000F87E00000003E0078003BC01EE0F3DFFFFF801FB00003E0000F8FC00000003E0078003BC03EE0FBD2FEBF800FA00003E0000F8F800000003E0078003BFFFEE0FFDFFFFF8007C00003E0000F8F800000003E0078003BC01EE0FFDFEFF0F807C3FFE3E0000F8F00078FFFFE0078003BC01EE0F3D18240F807C3FFE3E0000F9F00078FFFFE0078003BFFFEE0F3DFFFE0F807C3FFE3E0000F9F00078FFFFE00780039FFFCE0F3DFFFF0F807C3FFE3E0000F8F00078FFFFE007800380000E0FFC0A0F00007C00003E0000F8F800780003E0078003FF8FFE0FFCE00E0000FA00003E0000F8F800780003E0078003FF8FFE0F3DFFFE0001FB00003E0000F8FC00780003E0078000038E000F3DFFFF0003F780003E0000F87F00780003E0078000578FA00F3C000FFFFFFFFFFE3FFFF0F83FFFF80003E0078003FF8FFE0F3DFFE7FFFFEFFFFE3FFFF8F83FFFF80003E0078007FF8FFF0F3DFFFFFFFFC7FFFE3FFFF8F80FFFF80003E0078007078E0F0F3C000FFFFF01FFFE3FFFF8F807FFF80003E007800F038F071F7DFFFFFFFC007FFE3FFFF8F801FFF80003E007800F078E079E79FFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000......';
      }

      content +=
          'LINE 10 55 570 55 2\r\n'
          'TEXT 0 24 10 72 订单备注：${list.remark ?? ""}\r\n'
          'LINE 10 100 570 100 2\r\n'
          'SETBOLD 5\r\n'
          'TEXT 0 32 10 110 ${list.customName ?? ""}\r\n'
          'SETBOLD 0\r\n'
          'BARCODE QR 400 150 M 2 U 5\r\n'
          'MA,${list.packageCoSourcingNo}\r\n'
          'ENDQR\r\n'
          'TEXT 0 24 10 150 ${list.receiver ?? ""} ${list.receiverTelephone ?? ""}\r\n';

      if (list.receiverAddress != null && list.receiverAddress!.length > 14) {
        String address11 = list.receiverAddress!.substring(0, 14);
        String address22 = list.receiverAddress!.length > 28
            ? list.receiverAddress!.substring(14, 28)
            : list.receiverAddress!.substring(14);
        content +=
            'TEXT 0 24 10 190 ${address11}\r\n'
            'TEXT 0 24 10 220 ${address22}\r\n';
      } else {
        content += 'TEXT 0 24 10 190 ${list.receiverAddress ?? ""}\r\n';
      }

      content +=
          'ENDML\r\n'
          'TEXT 0 24 10 300 ${list.payType ?? ""}\r\n'
          'TEXT 0 24 150 300 ${list.packageCoSourcingPerson ?? ""}\r\n'
          'TEXT 0 24 290 300 ${list.packageCoSourcingNo ?? ""}\r\n'
          'SETBOLD 5\r\n'
          'TEXT 0 32 10 340 ${list.logisticsRoute ?? ""}\r\n'
          'SETBOLD 0\r\n';

      if (list.whetherToCollectGoods != null &&
          list.whetherToCollectGoods!.isNotEmpty) {
        content +=
            'LINE 400 340 510 340 2\r\n'
            'LINE 400 390 510 390 2\r\n'
            'TEXT 0 32 430 350 ${list.whetherToCollectGoods}\r\n'
            'LINE 400 340 400 390 2\r\n'
            'LINE 510 340 510 390 2\r\n';
      }

      content +=
          'SETBOLD 0\r\n'
          'LINE 10 400 570 400 2\r\n'
          'TEXT 0 28 10 420 此包裹明细：\r\n';

      var addHeight = 420;

      final carModellRespList = list.carModellRespList;
      if (carModellRespList != null) {
        for (int i = 0; i < carModellRespList.length; i++) {
          addHeight += 40;

          if (carModellRespList[i].carModelName != null &&
              carModellRespList[i].carModelName!.length > 6) {
            String str = carModellRespList[i].carModelName!.length > 5
                ? carModellRespList[i].carModelName!.substring(0, 5)
                : carModellRespList[i].carModelName!;
            String str1 = carModellRespList[i].carModelName!.length > 5
                ? carModellRespList[i].carModelName!.substring(5)
                : '';

            content +=
                'TEXT 0 24 10 ${addHeight} 车型:${str}\r\n'
                'TEXT 0 24 200 ${addHeight} VIN码:${carModellRespList[i].vinCode}\r\n';
            addHeight += 40;
            content += 'TEXT 0 24 10 ${addHeight} ${str1}\r\n';
          } else {
            content +=
                'TEXT 0 24 10 ${addHeight} 车型:${carModellRespList[i].carModelName ?? ""}\r\n'
                'TEXT 0 24 200 ${addHeight} VIN码:${carModellRespList[i].vinCode}\r\n';
          }

          addHeight += 40;
          content += 'LINE 10 ${addHeight} 570 ${addHeight} 2\r\n';

          addHeight += 10;
          content +=
              'TEXT 0 24 10 ${addHeight} 零件编码 \r\n'
              'TEXT 0 24 170 ${addHeight} 零件名称 \r\n'
              'TEXT 0 24 360 ${addHeight} 数量 \r\n'
              'TEXT 0 24 450 ${addHeight} 单号 \r\n';

          final detailRespList = carModellRespList[i].detailRespList;
          if (detailRespList != null) {
            for (int j = 0; j < detailRespList.length; j++) {
              addHeight += 30;
              int rowIndex = 1;

              int maxFieldLength = 0;
              if (detailRespList[j].sysSkuCode != null) {
                maxFieldLength = detailRespList[j].sysSkuCode!.length;
              }
              if (detailRespList[j].oeName != null &&
                  detailRespList[j].oeName!.length > maxFieldLength) {
                maxFieldLength = detailRespList[j].oeName!.length;
              }
              if (detailRespList[j].oddNumbers != null &&
                  detailRespList[j].oddNumbers!.length > maxFieldLength) {
                maxFieldLength = detailRespList[j].oddNumbers!.length;
              }

              if (maxFieldLength > 9) {
                rowIndex = (maxFieldLength / 9).ceil();
              }

              // 处理较长的字段
              String sysSkuCode = detailRespList[j].sysSkuCode ?? '';
              String oeName = detailRespList[j].oeName ?? '';
              String oddNumbers = detailRespList[j].oddNumbers ?? '';

              if (sysSkuCode.length > 9) {
                String sysSkuCode1 = sysSkuCode.length > 9
                    ? sysSkuCode.substring(0, 9)
                    : sysSkuCode;
                String sysSkuCode2 = sysSkuCode.length > 18
                    ? sysSkuCode.substring(9, 18)
                    : (sysSkuCode.length > 9 ? sysSkuCode.substring(9) : '');
                String sysSkuCode3 = sysSkuCode.length > 27
                    ? sysSkuCode.substring(18, 27)
                    : '';
                String sysSkuCode4 = sysSkuCode.length > 36
                    ? sysSkuCode.substring(27, 36)
                    : '';

                if (sysSkuCode2.isNotEmpty) {
                  content +=
                      'TEXT 10 10 20 ${addHeight} ${sysSkuCode1}\r\n'
                      'TEXT 10 10 20 ${addHeight + 30} ${sysSkuCode2}\r\n';
                  if (sysSkuCode3.isNotEmpty) {
                    content +=
                        'TEXT 10 10 20 ${addHeight + 60} ${sysSkuCode3}\r\n';
                    if (sysSkuCode4.isNotEmpty) {
                      content +=
                          'TEXT 10 10 20 ${addHeight + 90} ${sysSkuCode4}\r\n';
                    }
                  }
                } else {
                  content += 'TEXT 10 10 20 ${addHeight} ${sysSkuCode}\r\n';
                }
              } else {
                content += 'TEXT 10 10 20 ${addHeight} ${sysSkuCode}\r\n';
              }

              if (oeName.length > 9) {
                String oeName1 = oeName.length > 9
                    ? oeName.substring(0, 9)
                    : oeName;
                String oeName2 = oeName.length > 18
                    ? oeName.substring(9, 18)
                    : (oeName.length > 9 ? oeName.substring(9) : '');
                String oeName3 = oeName.length > 27
                    ? oeName.substring(18, 27)
                    : '';
                String oeName4 = oeName.length > 36
                    ? oeName.substring(27, 36)
                    : '';

                if (oeName2.isNotEmpty) {
                  content +=
                      'TEXT 10 10 135 ${addHeight} ${oeName1}\r\n'
                      'TEXT 10 10 135 ${addHeight + 30} ${oeName2}\r\n';
                  if (oeName3.isNotEmpty) {
                    content +=
                        'TEXT 10 10 135 ${addHeight + 60} ${oeName3}\r\n';
                    if (oeName4.isNotEmpty) {
                      content +=
                          'TEXT 10 10 135 ${addHeight + 90} ${oeName4}\r\n';
                    }
                  }
                } else {
                  content += 'TEXT 10 10 135 ${addHeight} ${oeName}\r\n';
                }
              } else {
                content += 'TEXT 10 10 135 ${addHeight} ${oeName}\r\n';
              }

              content +=
                  'TEXT 0 24 380 ${addHeight} ${detailRespList[j].num}\r\n'
                  'TEXT 0 24 430 ${addHeight} ${oddNumbers}\r\n';

              addHeight = addHeight + (28 * rowIndex);
              content += 'LINE 10 ${addHeight} 570 ${addHeight} 2\r\n';
            }
          }
        }
      }

      addHeight += 20;
      content += 'TEXT 0 24 10 ${addHeight} 网格：${list.gridName ?? 5}\r\n';
      content += 'TEXT 0 24 430 ${addHeight} 合计：${list.total ?? 5}\r\n';
      height += addHeight;

      if (kDebugMode) {
        print('123: $content');
      }

      return '! 0 200 200 ${height} 1\r\n${content}PRINT\r\n';
    } catch (e) {
      if (kDebugMode) {
        print('打印: $e');
      }
      return '';
    }
  }
}
