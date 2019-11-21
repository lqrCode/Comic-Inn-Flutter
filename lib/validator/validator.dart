export 'package:ComicInn/validator/visitor_rule.dart';

Map ruleMap = {
  'string': (val) => !(val == null || val.isEmpty),
  'int': (val) => !(val is int && val != null),
  'timestamp13': (val) => !(val == null || val.toString().length != 13),
  'phone': (val) => LqrValidator.matches(LqrValidator.isPhone, val),
  'list': (val) => !(val == null || val.isEmpty),
  'dateRange': (val) => !(val == null || val.isEmpty || val.length != 2 || val[0].toString().length != 13 || val[1].toString().length != 13),
  'idCard': (val) => LqrValidator.matches(LqrValidator.isIdCard, val),
  'email': (val) => LqrValidator.matches(LqrValidator.isEmail, val),
  'postCode': (val) => LqrValidator.matches(LqrValidator.isPostCode, val),
  'url': (val) => LqrValidator.matches(LqrValidator.isURL, val),
  'null': (val) => !(val == null),
  // "passworld": (val) => LqrValidator.matches(LqrValidator.isPassworld, val),
  "passworld": (val) => val.length == 8,
};

class LqrValidator {
  // 手机号码
  static final String isPhone = "^(0|86|17951)?(13[0-9]|15[012356789]|166|17[3678]|18[0-9]|14[57])[0-9]{8}\$";
  // 身份证
  static final String isIdCard = "^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])\$)\$";
  // 邮箱
  static final String isEmail = "^([a-zA-Z]|[0-9])(\\w|\\-)+@[a-zA-Z0-9]+\\.([a-zA-Z]{2,4})\$";
  // 路径
  static final String isURL = "^https?:\\/\\/(([a-zA-Z0-9_-])+(\\.)?)*(:\\d+)?(\\/((\\.)?(\\?)?=?&?[a-zA-Z0-9_-](\\?)?)*)*\$";
  // 路径
  static final String isPostCode = "^[1-9]\\d{5}(?!\\d)\$";
  // 密码
  static final String isPassworld = "^[0-9a-zA-Z]{6,15}\$";
  // static final String isPassworld = "\\d{6,15}\$";

  // 单个验证
  static verifyOnly(type, value) {
    return ruleMap[type](value);
  }

  // 对象验证
  static Future verify(rule, value) async {
    List res = [];
    rule.forEach((k, v) {
      String type = v['type'];
      String msg = v['message'];
      var thisVal = value[k];
      var validator = v['validator'];
      if (type != null) {
        if (!ruleMap[type](thisVal)) res.add({'msg': msg, 'key': k});
      } else {
        if (!validator(thisVal)) res.add({'msg': msg, 'key': k});
      }
    });
    if (res.length > 0) throw (res[0]['msg']);
    return res;
  }

  // 正则
  static bool matches(String regex, String input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(regex).hasMatch(input);
  }
}
