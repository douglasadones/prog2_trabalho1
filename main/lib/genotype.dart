
class Genotype {
  final Map<String, String> _allGenotypes = {
    'AA': 'A',
    'Ai': 'A',
    'BB': 'B',
    'Bi': 'B',
    'AB': 'AB',
    'ii': 'O',
  };

  final String _possibleGenotype;
  late final String _bloodType;
  late final List<String> _alleles;
  late final List<String> _agglutinogens;
  late final List<String> _agglutinins;

  Genotype(this._possibleGenotype) {
    if (!_allGenotypes.containsKey(_possibleGenotype)) {
      // throw 'Invalid genotype. Run Genotype.validGenotypes() to see all valid entries.';
      throw 'Invalid genotype. Please, enter a valid value.';
    } else {
      _bloodType = toBloodTpe();
      _alleles = existingAlleles();
      _agglutinogens = allAgglutinogens();
      _agglutinins = allAgglutinins();
    }
  }

  List<String> existingAlleles() {
    Set<String> singleAlleleSet = {};
    var genoTypeList = _possibleGenotype.split('');

    genoTypeList.forEach((element) {
      singleAlleleSet.add(element);
    });
    return singleAlleleSet.toList();
  }

  List<String> allAgglutinogens() {
    List<String> singleAgglutinogens = [];
    _alleles.forEach((element) {
      if (element != 'i') {
        singleAgglutinogens.add(element);
      }
    });
    return singleAgglutinogens;
  }

  List<String> allAgglutinins() {
    List<String> singleAgglutinins = [];
    String agglutininsSplitSuport = 'AB';
    if (_agglutinogens.length == 1) {
      singleAgglutinins
          .add(agglutininsSplitSuport.split(_agglutinogens[0]).join(''));
    } else if (_agglutinogens.isEmpty) {
      singleAgglutinins.addAll(agglutininsSplitSuport.split(''));
    }
    return singleAgglutinins;
  }

  toBloodTpe() => _allGenotypes[_possibleGenotype];

  String get possibleGenotype => _possibleGenotype;

  String get bloodType => _bloodType;

  List<String> get alleles => _alleles;

  List<String> get agglutinogens => _agglutinogens;

  List<String> get agglutinins => _agglutinins;
}
