abstract class Paths {
  static const String splash = '/';
  /// auth
  static const String login = '/login';
  static const String register = '/register';
  static const String confirmOTP = '/confirm-otp';
  /// root
  static const String root = '/root';

  static const String webView = '/web-view';


  static const String accountSetting = '/account-setting';
  static const String accountInformation = '/account-info';
  static const String editAccountInformation = '/edit-account-info';
  static const String changePassword = '/change-password';
  static const String forgotPassword = '/forgot-password';

  /// service
  static const services = '/services';
  static const serviceDetail = ':serviceVariantId';

  /// cart
  static const myCart = '/my-cart';

  /// order
  static const newOrder = '/new-order';
  static const editCustomerInfo = '/edit-customer-info';
  static const updateCustomerInfo = '/update-customer-info';
  static const orderSuccess = '/order-success';
  static const orderChecklist = '/order-checklist';
  static const orderHistory = '/order-history';
  static const orderNewReview = '/order-new-review';
  static const String addOrderItem = '/add-order-item';

  static const orders = '/orders';
  static const orderId = ':orderId';


  /// address
  static const String addressLocationSelect = '/address-location-select';

  /// technician
  static const String technicians = '/technicians';
  static const String technicianId = ':technicianId';
}
