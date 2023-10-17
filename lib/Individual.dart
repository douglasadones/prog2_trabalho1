import 'genotype.dart';

class Individual {
  static int indivNum = 0;
  final String _genotypeString;
  late final Genotype _genotype;
  final String _auxName;
  late final String _name;
  Individual(
    this._genotypeString, [
    this._auxName = 'Indiv',
  ]) {
    _genotype = Genotype(_genotypeString);
    (_auxName == 'Indiv') ? _name = nameGenerator() : _name = _auxName;
  }

  String nameGenerator() {
    indivNum++;
    return '$_auxName$indivNum';
  }

  String get name => _name;

  Genotype get genotype => _genotype;

  @override
  String toString() {
    return '$_name(${_genotype.bloodType})';
  }
}
