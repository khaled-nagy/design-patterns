import 'package:decorator_order_example/decorator_order_example.dart'
    as decorator_order_example;

// Component
abstract class Order {
  String getDescription();
  double getCost();
}

class BasicOrder implements Order {
  @override
  String getDescription() {
    return 'طلب عادي';
  }

  @override
  double getCost() {
    return 100.0;
  }
}

abstract class OrderDecorator implements Order{
  final Order order;
  OrderDecorator(this.order);

  @override
  String getDescription() {
    return order.getDescription();
  }

  @override
  double getCost() {
    return order.getCost();
  }
}

class GiftWrappingDecorator extends OrderDecorator{
  GiftWrappingDecorator(super.order);
@override
  String getDescription() {
    
    return '${order.getDescription()} , تغليف هدية';
  }
  @override
  double getCost() {
    return order.getCost()+10.0;
  }
}

class ExpressShippingDecorator extends OrderDecorator{
  ExpressShippingDecorator(super.order);
  @override
  String getDescription() {
    // TODO: implement getDescription
    return  '${order.getDescription()} ,  شحن سريع';
  }

  @override
  double getCost() {
    // TODO: implement getCost
    return  order.getCost()+25.0;
  }
}


void main() {

  // طلب عادي بدون ميزات إضافية

Order order = BasicOrder();
print('${order.getDescription()} تكلفته \$${order.getCost()}');

  // إضافة تغليف الهدايا
  order = GiftWrappingDecorator(order);
  print('${order.getDescription()} تكلفته \$${order.getCost()}');
  // إضافة شحن سريع
  order = ExpressShippingDecorator(order);
  print('${order.getDescription()} تكلفته \$${order.getCost()}');
}
