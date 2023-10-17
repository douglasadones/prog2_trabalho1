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

  Genotype(this._possibleGenotype) {
    if (!_allGenotypes.containsKey(_possibleGenotype)) {
      throw 'Bad individual genotype: $_possibleGenotype';
    }
    ;
  }

  _toBloodTpe() => _allGenotypes[_possibleGenotype];

  List<String> _existingAlleles() {
    Set<String> singleAlleleSet = {};
    var genoTypeList = _possibleGenotype.split('');
    genoTypeList.forEach((element) {
      singleAlleleSet.add(element);
    });
    return singleAlleleSet.toList();
  }

  List<String> _allAgglutinogens() {
    List<String> singleAgglutinogens = [];
    _possibleGenotype.split('').forEach((element) {
      if (element != 'i') {
        singleAgglutinogens.add(element);
      }
    });
    return singleAgglutinogens;
  }

  List<String> _allAgglutinins() {
    List<String> singleAgglutinins = [];

    if (alleles.length == 1) {
      _formatingAgglutinins(alleles, singleAgglutinins);
    } else {
      if (alleles.contains('i')) {
        _formatingAgglutinins(alleles, singleAgglutinins);
      }
    }
    return singleAgglutinins;
  }

  void _formatingAgglutinins(List<String> alleles, List<String> agglutinins) {
    switch (alleles[0]) {
      case 'A':
        agglutinins.add('B');
        break;
      case 'B':
        agglutinins.add('A');
        break;
      case 'i':
        agglutinins.addAll(['A', 'B']);
    }
  }

  String get bloodType => _toBloodTpe();

  List<String> get alleles => _existingAlleles();

  List<String> get agglutinogens => _allAgglutinogens();

  List<String> get agglutinins => _allAgglutinins();

  @override
  String toString() {
    return _possibleGenotype;
  }

  List<String> offsprings(Genotype r) {
    List<String> results = [];
    var firstIndiv = _possibleGenotype.split('');
    var secondIndiv = r._possibleGenotype.split('');
    for (var i in firstIndiv) {
      for (var a in secondIndiv) {
        String possible = i + a;
        if (!results.contains(possible)) {
          results.add(possible);
        }
      }
    }
    return _formatingGenotypeList(results);
  }

  List<String> _formatingGenotypeList(List<String> r) {
    List<String> formated = [];
    r.forEach((element) {
      switch (element) {
        case 'iA':
          formated.add('Ai');
          break;
        case 'iB':
          formated.add('Bi');
          break;
        case 'BA':
          formated.add('AB');
          break;
        default:
          formated.add(element);
      }
    });
    return formated;
  }

  bool compatible(Genotype r) {
    bool status = false;
    if (_possibleGenotype == 'ii' ||
        r._possibleGenotype == 'AB' ||
        _possibleGenotype == r._possibleGenotype) {
      return true;
    } else if (_possibleGenotype == 'AB') {
      return false;
    } else if (r.agglutinogens.contains(agglutinogens[0])) {
      return true;
    }
    return status;
  }
}
