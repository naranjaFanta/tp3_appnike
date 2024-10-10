import 'package:appnike/domain/discounts/discount.dart';

List<Discount> discountDB = [
  Discount(
      id: 1,
      business: "Gym Pro Fitness",
      description: "20% off on annual memberships",
      type: "Percentage",
      regular: 20,
      premium: 30,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPY7X4dgFOK3bjrJTFKTXGCwj_kpBMmJ3ETg&s"),
  Discount(
      id: 2,
      business: "Nike Store Downtown",
      description: "15% off on all running shoes",
      type: "Percentage",
      regular: 15,
      premium: 25,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPY7X4dgFOK3bjrJTFKTXGCwj_kpBMmJ3ETg&s"),
  Discount(
      id: 3,
      business: "Sport Gear Outlet",
      description: "Buy 1 get 1 free on select training apparel",
      type: "BOGO",
      regular: 0,
      premium: 1,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPY7X4dgFOK3bjrJTFKTXGCwj_kpBMmJ3ETg&s"),
  Discount(
      id: 4,
      business: "Pro Athlete Equipment",
      description: "10% off on all gym equipment purchases",
      type: "Percentage",
      regular: 10,
      premium: 20,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPY7X4dgFOK3bjrJTFKTXGCwj_kpBMmJ3ETg&s"),
  Discount(
      id: 5,
      business: "The Yoga Lounge",
      description: "Free yoga mat with a 6-month membership",
      type: "Freebie",
      regular: 0,
      premium: 0,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPY7X4dgFOK3bjrJTFKTXGCwj_kpBMmJ3ETg&s"),
  Discount(
      id: 6,
      business: "CrossFit Extreme",
      description: "25% off on the first 3 months of training",
      type: "Percentage",
      regular: 25,
      premium: 35,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPY7X4dgFOK3bjrJTFKTXGCwj_kpBMmJ3ETg&s"),
  Discount(
      id: 7,
      business: "Nike Outlet Store",
      description: "Up to 50% off on clearance sportswear",
      type: "Percentage",
      regular: 40,
      premium: 50,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPY7X4dgFOK3bjrJTFKTXGCwj_kpBMmJ3ETg&s"),
];
