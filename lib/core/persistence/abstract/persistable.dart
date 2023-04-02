import 'abstract_persister.dart';

abstract class Persistable{
  String getPersistableKey();
  getPersistableValue();
  newFromPersister(AbstractPersister persister);
}