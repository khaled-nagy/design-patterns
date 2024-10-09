// Component
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

// Concrete Decorator for Milk
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return coffee.getDescription() + ', Milk';
  }

  @override
  double cost() {
    return coffee.cost() + 1.5; // Extra cost for milk
  }
}

// Concrete Decorator for Sugar
class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() {
    return coffee.getDescription() + ', Sugar';
  }

  @override
  double cost() {
    return coffee.cost() + 0.5; // Extra cost for sugar
  }
}

void main() {
  Coffee coffee = SimpleCoffee();
  print('${coffee.getDescription()} costs \$${coffee.cost()}');

  // Add milk to the coffee
  coffee = MilkDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.cost()}');

  // Add sugar to the coffee
  coffee = SugarDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
}
