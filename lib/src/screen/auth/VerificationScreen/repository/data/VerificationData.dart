class VerificationData {
  String code;
  String phone;
  
  VerificationData(
      {required this.code,
      required this.phone,
      });
  Map<String, String> toJson() => {
        'phone': "+993$phone",
        'code': code,
      
      };
}
