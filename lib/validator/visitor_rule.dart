Map visitorRule = {
  'name': {
    'type': "string",
    'required': true,
    'message': "访客姓名不能为空",
  },
  'phone': {
    'type': "phone",
    'required': true,
    'message': "手机号码有误",
  },
  'companyName': {
    'type': "string",
    'required': true,
    'message': "访问企业名称不能为空",
  },
  'reason': {
    'type': "string",
    'required': true,
    'message': "来访事由不能为空",
  },
  'time': {
    'type': "dateRange",
    'required': true,
    'message': "请选择来访时间",
  },
};

Map parkM = {
  'parkFist': {
    'type': "string",
    'required': true,
    'message': "请选择车牌头两位",
  },
  'parkLast': {
    'type': "string",
    'required': true,
    'message': "车牌号不正确",
  },
  'phone': {
    'type': "phone",
    'required': true,
    'message': "手机号不能为空",
  },
};
