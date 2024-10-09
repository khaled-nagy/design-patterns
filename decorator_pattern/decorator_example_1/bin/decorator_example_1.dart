import 'package:decorator_example_1/decorator_example_1.dart'
    as decorator_example_1;

// component
abstract class Coffee {
  String getDescription();
  double cost();
}

// Concrete Component

class SimpleCoffee implements Coffee {
  @override
  String getDescription() {
    return 'Simple Coffee';
  }

  @override
  double cost() {
    return 5.0; // Base price for simple coffee
  }
}

// Decorator
abstract class CoffeeDecorator implements Coffee {
  final Coffee coffee;
  CoffeeDecorator(this.coffee);

  @override
  String getDescription() {
    return coffee.getDescription();
  }

  @override
  double cost() {
    return coffee.cost();
  }
}

// Concret Decorator for milk
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return '${coffee.getDescription()} , milk';
  }

  @override
  double cost() {
    return coffee.cost() + 1.5; // Extra cost for milk
  }
}

// Concret Decorator for suger

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee coffee) : super(coffee);
  @override
  String getDescription() {
    // TODO: implement getDiscription
    return '${coffee.getDescription()} , Sugar';
  }

  @override
  double cost() {
    // TODO: implement cost
    return coffee.cost() + 0.5;
  }
}

void main() {
  Coffee coffee = SimpleCoffee();
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
  // Add milk to the coffee
  coffee = MilkDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
  // Add Sugar to the coffee
  coffee = SugarDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
}
