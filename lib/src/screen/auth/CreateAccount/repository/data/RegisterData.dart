class RegisterData {
  String phone;
  String full_name;

  RegisterData({required this.phone, required this.full_name});
  Map<String, String> toJson() => {
    'phone': "+993$phone",
    'full_name': full_name,
  };
}
