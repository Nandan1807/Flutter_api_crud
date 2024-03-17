class ApiModel{

  String _name="";
  String _image="";
  String _description="";

  String get name => _name;

  set name(String newName){
    _name = newName;
  }

  String get image => _image;

  set image(String newImage){
    _image = newImage;
  }

  String get description => _description;

  set description(String newDescription){
    _description = newDescription;
  }

  Map<String,dynamic> mapConvert(){
    return{
      "itemName": _name,
      "itemImg": _image,
      "itemDes": _description
    };
  }

}