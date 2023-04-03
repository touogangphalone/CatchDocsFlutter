import 'package:flutter/cupertino.dart';
import 'package:quizstar/core/persistence/abstract/persistable.dart';

import 'abstract_persister.dart';

class PrefsPersister extends AbstractPersister{
  final SharedPreferences _prefs;
  PrefsPersister(this._prefs);
  @override
  getInstance() {
    return _prefs;
  }

  @override
  bool has(String key) {
  }

  @override
  persist(Persistable persistable) {
    dynamic value =  persistable.getPersistableValue();
    String key = persistable.getPersistableKey();
  }

  @override
  get(key, {defaultValue}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  remove(String key) {
    // TODO: implement remove
    throw UnimplementedError();
  }

}

class SharedPreferences {
}