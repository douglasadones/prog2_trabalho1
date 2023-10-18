class Genotype {
  final _allGenotypes = <String, String>{
    'AA': 'A',
    'Ai': 'A',
    'BB': 'B',
    'Bi': 'B',
    'AB': 'AB',
    'ii': 'O',
  };

  final String _possibleGenotype;

  Genotype(this._possibleGenotype) {
    _validate();
  }

  void _validate() {
    if (!_allGenotypes.containsKey(_possibleGenotype)) {
      throw 'Bad individual genotype: $_possibleGenotype';
    }
  }

  String get bloodType => _allGenotypes[_possibleGenotype] ?? '';

  List<String> get alleles {
    var singleAlleleSet = <String>{};
    var genoTypeList = _possibleGenotype.split('');
    genoTypeList.forEach((element) {
      singleAlleleSet.add(element);
    });
    return singleAlleleSet.toList();
  }

  List<String> get agglutinogens {
    var singleAgglutinogens = <String>[];
    if (bloodType != 'O') {
      return bloodType.split('');
    }
    return singleAgglutinogens;
  }

  List<String> get agglutinins {
    var singleAgglutinins = <String>[];
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

  @override
  String toString() {
    return _possibleGenotype;
  }

  List<String> offsprings(Genotype r) {
    var results = <String>[];
    var firstGenotype = _possibleGenotype.split('');
    var secondGenotype = r._possibleGenotype.split('');

    for (var i in firstGenotype) {
      for (var a in secondGenotype) {
        var possibility = (i + a).split('');
        possibility.sort();
        if (!results.contains(possibility.join())) {
          results.add(possibility.join());
        }
      }
    }
    return results;
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
