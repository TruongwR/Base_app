class ApiPath {
  static const String _apiVersion = 'api/v1';
  static const String noti = '/noti';
  static const String setupNoti = '/noti/check-notice';

  static const String baseUrl = 'http://devapikb.tappeasy.com/$_apiVersion';

  // static const String baseUrl = 'http://api.khangbaby.com/$_apiVersion';

  static const String login = '/user/login-app';
  static const String infoUser = '/user/get-user-info';
  static const String customer = '/customer'; //Khách hàng
  static const String supplierAll = '/supplier/all'; //Nhà cung cấp
  static const String branchFindAll = '/branch/find-all'; // Toàn Bộ nhánh
  static const String productFilter =
      '/product/app/filter'; // lọc toàn bộ sản phẩm có thể nhập vào code hoặc tên (dùng cho search)
  static const String productGroup = '/product-group';
  static const String newProduct = '/product';
  static const String code =
      '/code'; // có hai loại là NTK(Nhập trả hàng ),PNK(Nhập kho)
  static const String sreachProduct = '/product/search-warehouse';
  static const String codeBill = '/bill/find-code-app';
  static const String billDetail = '/bill-detail/find-code';

  //import Goods
  static const String confirmImportGoods = '/bill-detail/pay-product';
  static const String quantityNotify = '/code/unread-notification';

  //Nhập kho
  static const String getReceipt = '/code/display-import-app';
  static const String getReceiptById = '/code/display-detail-import';
  static const String searchProductWarehouse = '/product/search-warehouse-app';
  static const String warehouse = '/product/import-warehouse';
  static const String searchSupplier = '/supplier/name-phone';
  static const String searchReceipt = '/code/search-pnk';
  static const String sumReceipt = '/code/sum-pnk';

  //export goods
  // static const String exportedGoods = '/code/report-export';
  static const String exportedGoods = '/code/display-export-app';
  static const String getlistEpGoods = '/code/display-detail-export';
  static const String seachListProductEP = '/product/branch-user-app';
  static const String completeExport = '/product/export-return';

  //revenue
  static const String topLoiNhuan = '/report/top-profit';
  static const String topDoanhThu = '/report/top-revenue';
  static const String topGiaTriKho = '/report/top-price';
  static const String topTonKHo = '/report/top-quantity';
  static const String allRevenue = '/report/total-product-app';
  static const String loiNhuan = '/report/top-profit-detail';
  static const String doanhThuTHuan = '/report/top-revenue-detail';
  static const String soLuong = '/report/top-quantity-payment';
  static const String giaTriKho = '/report/top-price-detail';
  static const String tonKho = '/report/top-quantity-detail';
  static const String dailyReport = '/payment-slip/report';
  static const String thuChi =
      '/payment-slip/reportList'; //null =all,bill=hóa đơn, repay== trả hàng
  static const String dsSanPham =
      '/payment-slip/reportProduct'; // bill =bán hàng, repay=trả hàng
  // tranfer Branch
  static const String historySend = '/code/lcn-send';
  static const String historyAgree = '/code/lcn-receive';
  static const String detailListTranfer = '/code/display-detailcode';
  static const String acceptTranfer = '/code/save-lcn';
  static const String refuseTranfer = '/code/reject-lcn';
  static const String acceptTranferApp = '/code/save-lcn-app';
  static const String refuseTranferApp = '/code/reject-lcn-app';
  static const String createNewTranfer = '/product/move-branch';
  static const String tranferToBranch = '/user/branch-vip-app';
  static const String inforTranferBranch = '/code/display-notificationlcn-app';
  static const String pushSeenNTf = '/code/update-reason';

  //Bán hàng
  static const String sellingProduct = '/product/choose-branch-app';
  static const String searchCustomer = '/customer/search-name-phone-app';
  static const String bill = '/bill';
  static const String lskiemke = '/code/display-pkk';

  //inventory
  static const String completeInventory = '/product/create-inventory';
  static const String detailInventory = '/code/display-detail-pkk';

  //detail billl
  static const String detailbill = '/bill/detail';

  //sell report
  static const String sellReport = '/report/getReportSell';
  static const String reportByBill = '/report/getReportByBill';

  //home
  static const String getProfitHome = '/report/getProfitHome';
  static const String totalProduct = '/report/total-product-app';
  static const String branchRevenue = '/report/getRevenueHome';
  static const String sellReportProduct = '/report/reportSellWithTime';
  static const String sellReportBill = '/report/reportProfitByBill';
  static const String billReport = '/report/getBillReport';
}
