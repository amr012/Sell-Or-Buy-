class ValidationItem {
  String error;
  String value;
  ValidationItem({this.error,this.value});

  bool isValid() {
    return (value != null && value.isNotEmpty && error == null);
  }
}
