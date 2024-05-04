/// Prevent multiple clicks on tool classes
class BaseMultiClickUtils {
  const BaseMultiClickUtils._();

  static DateTime? _lastClickTime;

  /// Determine whether there are multiple clicks
  /// [intervalMilliseconds] Interval time, unit milliseconds, default 500 milliseconds
  static bool isMultiClick({int intervalMilliseconds = 500}) {
    if (_lastClickTime == null || DateTime.now().difference(_lastClickTime!) > Duration(milliseconds: intervalMilliseconds)) {
      _lastClickTime = DateTime.now();
      return false;
    }
    return true;
  }
}
