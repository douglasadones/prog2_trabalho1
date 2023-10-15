import 'package:main/genotype.dart';

void main() {
  var abc = Genotype('ii');
  print('Genotype: ${abc.possibleGenotype}');
  print('Blood type: ${abc.bloodType}');
  print('Alleles: ${abc.alleles}');
  print('Agglutinogens: ${abc.agglutinogens}');
  print('Agglutinins: ${abc.agglutinins}');
}
