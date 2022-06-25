import 'dart:math';

enum PlanetType { terrestrial, gas, ice }

void main() {
  print("Hello world!");

  var year = 1997;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  for (final object in flybyObjects) {
    print(object);
  }

  if (year >= 2001) {
    print('21 century');
  } else if (year >= 1901) {
    print('20 century');
  }

  flybyObjects.where((name) => name.contains('turn')).forEach(print);
  printInteger(10);

  int? lineCount;
  assert(lineCount == null);
}

void printInteger(int aNumber) {
  print('The number is $aNumber');
}

class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {
    // inicjalizacja
  }

  void describe() {
    print("Spacecraft $name");

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(super.name, DateTime super.launchDate, this.altitude) {}
}

mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, DateTime super.launchDate) {}
}

// class MockSpaceship implements Spacecraft {
//   MockSpaceship(super.name, DateTime super.launchDate) {}
// }

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=====');
    describe();
    print('=====');
  }
}
