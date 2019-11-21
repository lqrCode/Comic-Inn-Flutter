// 装修申请
Map decorationRule = {
  'untilId': {
    'type' : 'string',
    'message' : '装修单元不能为空', 
  },
  'rangeDate': {
    'type' : 'dateRange',
    'message' : '来访日期不能为空', 
  },
  'name': {
    'type' : 'string',
    'message' : '联系人不能为空', 
  },
  'phone': {
    'type' : 'phone',
    'message' : '手机号码有误', 
  },
};

// 饭卡申请
Map foodCardRule = {
  'name': {
    'type': "string",
    'message': "姓名不能为空",
  },
  'phone': {
    'type': "phone",
    'message': "手机号码有误",
  },
  'identityNumber':{
    'type': "idCard",
    'message': "身份证号有误",
  },
};