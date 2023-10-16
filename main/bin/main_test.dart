import 'package:main/genotype.dart';

void main() {
  var a = Genotype('AB');
  var b = Genotype('Ai');
  print('Genotype: ${a.possibleGenotype}');
  // print('Blood type: ${a.bloodType}');
  print('Alleles: ${a.alleles}');
  print('Agglutinogens: ${a.agglutinogens}');
  print('Agglutinins: ${a.agglutinins}');
  // print('Genotype a: ${a.possibleGenotype}, Genotype b: ${b.possibleGenotype}');
  // print('List of Possible Genotypes: ${a.offsprings(b)}');
  print(
      'Donation:\n${a.possibleGenotype} -> ${b.possibleGenotype} ${a.compatible(b)}');

  print('');
  print('Genotype: ${b.possibleGenotype}');
  print('Alleles: ${b.alleles}');
  print('Agglutinogens: ${b.agglutinogens}');
  print('Agglutinins: ${b.agglutinins}');
}
