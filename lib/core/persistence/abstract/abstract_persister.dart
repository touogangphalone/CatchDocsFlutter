
import 'package:quizstar/core/persistence/abstract/persistable.dart';

abstract class AbstractPersister{
  persist(Persistable value);
  remove(String key);
  bool has(String key);
  get(key,{defaultValue});
  getInstance();
}