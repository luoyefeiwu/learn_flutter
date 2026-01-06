enum PrintScene {
  packSales('packSales', '打包/集包-销售单'),
  packFace('packFace', '打包/集包-包裹面单'),
  packBox('packBox', '打包/集包-装箱清单'),
  pickSupplier('pickSupplier', '取件-供应商回执单'),
  dispatchWander('dispatchWander', '发运-物流交接单'),
  itemLabel('itemLabel', '打印鼎腾商品标签');

  final String code;
  final String desc;

  const PrintScene(this.code, this.desc);

  static PrintScene? fromSceneCode(String code) {
    switch (code) {
      case 'packSales':
        return PrintScene.packSales;
      case 'packFace':
        return PrintScene.packFace;
      case 'packBox':
        return PrintScene.packBox;
      default:
        return null;
    }
  }
}
