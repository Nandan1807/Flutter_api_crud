class ApiModel{

  String _id="";
  String _name="";
  String _image="";
  String _description="";

  String get id => _id;

  set id(String value) {
    _id = value;
  }

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