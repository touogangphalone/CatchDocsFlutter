import 'dart:convert';

import 'package:quizstar/core/persistence/abstract/persistable.dart';

import '../json_serializable.dart';
import 'abstract_persister.dart';


abstract class JsonPersistable implements Persistable,JsonSerializable{
  @override
  String getPersistableValue() {
    return jsonEncode(this.toJson());
  }

  @override
  newFromPersister(AbstractPersister persister) {
    if(!persister.has(this.getPersistableKey())){
      return null;
    }
    String jsonString = persister.get(this.getPersistableKey());
    try{
      return this.fromJson(jsonDecode(jsonString));
    }catch(err){
      return null;
    }
  }


  String getPersistableKey() {}

}