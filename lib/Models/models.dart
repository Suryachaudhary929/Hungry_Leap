// ignore: unused_import
import 'package:flutter/material.dart';

class FoodDetail {
  String id;
  String name;
  String image;
  double price;
  double rate;
  String kcal;
  String cookingtime;
  String description;
  FoodDetail({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.kcal,
    required this.cookingtime,
    required this.description,
  });
}

List<FoodDetail> fooditems = [
  FoodDetail(
      id: "1",
      name: 'IceCream',
      image: "assets/images/icecream1.png",
      price: 120,
      rate: 4.5,
      kcal: '100',
      cookingtime: "30min",
      description:
          'Ice cream is a frozen dessert typically made from milk or cream that has been flavoured with a sweetener, either sugar or an alternative, and a spice, such as cocoa or vanilla, or with fruit, such as strawberries or peaches. Food colouring is sometimes added in addition to stabilizers.'),
  FoodDetail(
      id: '2',
      name: 'Pizza',
      image: 'assets/images/pizza.png',
      price: 300,
      rate: 5,
      kcal: '100',
      cookingtime: '30min',
      description:
          'pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot .'),
  FoodDetail(
      id: '3',
      name: 'Salad',
      image: 'assets/images/salad1.png',
      price: 150,
      rate: 3.5,
      kcal: '100',
      cookingtime: '20min',
      description:
          'A salad is a dish consisting of mixed ingredients, frequently vegetables. They are typically served chilled or at room temperature, though some can be served warm. Condiments and salad dressings, which exist in a variety of flavors, are used to make a salad.'),
  FoodDetail(
      id: '4',
      name: 'Burger',
      image: 'assets/images/carousel2.png',
      price: 400,
      rate: 4.5,
      kcal: '100',
      cookingtime: '30min',
      description:
          'A burger is a patty of ground beef grilled and placed between two halves of a bun. Slices of raw onion, lettuce, bacon, mayonnaise, and other ingredients add flavor. Burgers are considered an American food but are popular around the world. In Japan, teriyaki burgers are popular.'),
  FoodDetail(
      id: '5',
      name: 'Fruits',
      image: 'assets/images/fruit.png',
      price: 200,
      rate: 5.5,
      kcal: '100',
      cookingtime: '5min',
      description:
          'In a botanical sense, a fruit is the fleshy or dry ripened ovary of a flowering plant, enclosing the seed or seeds. Apricots, bananas, and grapes, as well as bean pods, corn grains, tomatoes, cucumbers, and (in their shells) acorns and almonds, are all technically fruits.'),
  FoodDetail(
      id: '6',
      name: 'Cake',
      image: 'assets/images/carousel4.png',
      price: 1000,
      rate: 5.2,
      kcal: '200',
      cookingtime: '60min',
      description:
          'Look for a soft, fluffy texture with an even crumb structure. Taste the frosting. The frosting should be smooth, and creamy, and complement the flavors of the cake. Assess flavors. A good cake will have distinct, well-balanced flavors that harmonize together.'),
  FoodDetail(
      id: '7',
      name: 'Coffee',
      image: 'assets/images/coffee2.png',
      price: 50,
      rate: 4.1,
      kcal: '100',
      cookingtime: '10min',
      description:
          'Coffee is flavoursome, fragrant and deeply rich in taste. It is often earthy with a discernible bitterness, but well-made coffee (using freshly roasted coffee beans) is defined by an enjoyable balance of flavours where sweet, bitter and acidic notes all work pleasantly together.'),
  FoodDetail(
      id: '8',
      name: 'Cold Drinks',
      image: 'assets/images/coldd.png',
      price: 200,
      rate: 4.2,
      kcal: '150',
      cookingtime: '5min',
      description:
          'A cold drink is a drink that generally contains water, a sweetener, and a natural and / or artificial flavor. The sweetener can be a sugar, high fructose corn syrup, fruit juice, a sugar substitute (in the case of diet drinks), or a combination of these.'),
  FoodDetail(
      id: '9',
      name: 'Meat',
      image: 'assets/images/carousel1.png',
      price: 500,
      rate: 4.2,
      kcal: '100',
      cookingtime: '40min',
      description:
          'Roast chicken is chicken prepared as food by roasting whether in a home kitchen, over a fire, or with a rotisserie (rotary spit).'),
  FoodDetail(
      id: '10',
      name: 'Seafood',
      image: 'assets/images/seafood.png',
      price: 100,
      rate: 2.5,
      kcal: '120',
      cookingtime: '20min',
      description:
          'Seafood is any form of sea life that humans consume as food. It includes fish, shellfish, and various kinds of crustaceans and echinoderms. It is often prepared as a delicious and nutritious dish.'),
  FoodDetail(
      id: '11',
      name: 'Sandwich',
      image: 'assets/images/sandwich.png',
      price: 200,
      rate: 3.5,
      kcal: '130',
      cookingtime: '20min',
      description:
          'A sandwich is a dish typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.'),
  FoodDetail(
      id: '12',
      name: 'Kebab',
      image: 'assets/images/kebab.png',
      price: 300,
      rate: 2.2,
      kcal: '100',
      cookingtime: '30min',
      description:
          'kebab, dish of Middle Eastern or Central Asian origin that typically combines small pieces of meat such as lamb or beef with vegetables on a skewer and is then grilled. Kebab derives from a Persian term for the dish that passed into both Arabic (as kabāb) and Turkish (as kebap).'),
  FoodDetail(
      id: '13',
      name: 'Omelets',
      image: 'assets/images/omelets.png',
      price: 60,
      rate: 4.5,
      kcal: '120',
      cookingtime: '15min',
      description:
          'An omelette (also spelled omelet) is a dish made from eggs, fried with butter or oil in a frying pan. It is a common practice for an omelette to include fillings such as chives, vegetables, mushrooms, meat (often ham or bacon), cheese, onions or some combination of the above.'),
  FoodDetail(
      id: '14',
      name: 'Spaghetti',
      image: 'assets/images/spaghetti.png',
      price: 200,
      rate: 5.1,
      kcal: '95',
      cookingtime: '25min',
      description:
          'Spaghetti (Italian: [spaˈɡetti]) is a long, thin, solid, cylindrical pasta. It is a staple food of traditional Italian cuisine. Like other pasta, spaghetti is made of milled wheat, water, and sometimes enriched with vitamins and minerals. Italian spaghetti is typically made from durum-wheat semolina.')
];

List<FoodDetail> icecreams = [
  FoodDetail(
      id: "1",
      name: "Chocolatebar",
      image: "assets/images/chocolatebar.png",
      price: 150,
      rate: 1.2,
      kcal: "100",
      cookingtime: "5min",
      description:
          "A chocolate bar is a confection containing chocolate, which may also contain layerings or mixtures that include nuts, fruit, caramel, nougat, and wafers."),
  FoodDetail(
      id: "2",
      name: "Vanilla",
      image: "assets/images/vanilla.png",
      price: 200,
      rate: 1.2,
      kcal: "100",
      cookingtime: "5min",
      description:
          "It has a simple, sweet taste and creamy texture. Vanilla ice cream is perfect on its own and can also be used as a base for other flavors, such as chocolate chips, cherries, mint, or strawberry."),
  FoodDetail(
      id: "3",
      name: "Kulfi",
      image: "assets/images/kulfi.png",
      price: 60,
      rate: 1.2,
      kcal: "100",
      cookingtime: "5min",
      description:
          "Kulfi is denser and creamier than regular ice cream. It comes in various flavours. Traditional ones include cream (malai), rose, mango, cardamom (elaichi), saffron (kesar or zafran), and pistachio. Newer flavours may include apple, orange, strawberry, peanut, or avocado."),
  FoodDetail(
      id: "4",
      name: "Cotton Candy",
      image: "assets/images/cottoncandy.png",
      price: 250,
      rate: 1.2,
      kcal: "100",
      cookingtime: "5min",
      description:
          ". Made with premium Hood Milk and Cream, this sweet treat combines delicious pink and blue swirls of cotton candy-flavored ice cream."),
  FoodDetail(
      id: "5",
      name: "Dondurma",
      image: "assets/images/dondurma.png",
      price: 200,
      rate: 1.2,
      kcal: "100",
      cookingtime: "5min",
      description:
          "Dondurma is Turkish mastic ice cream. It typically includes the ingredients cream, whipped cream, salep (ground-up tuber of an orchid), mastic (plant resin), and sugar. It is believed to originate from the city and region of Kahramanmaraş and hence, is also known as maraş dondurma."),
];
List<FoodDetail> pizza = [
  FoodDetail(
      id: "1",
      name: "Pizza Slice",
      image: "assets/images/pizzaslice.png",
      price: 1000,
      rate: 2.2,
      kcal: "200",
      cookingtime: "30min",
      description:
          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot."),
  FoodDetail(
      id: "2",
      name: "Pizza Hut",
      image: "assets/images/pizzahut.png",
      price: 1000,
      rate: 2.5,
      kcal: "200",
      cookingtime: "30min",
      description:
          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
  FoodDetail(
      id: "3",
      name: "Pizza Topping",
      image: "assets/images/pizzatopping.png",
      price: 1000,
      rate: 3.2,
      kcal: "200",
      cookingtime: "30min",
      description:
          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
  FoodDetail(
      id: "4",
      name: "Margherita Pizza",
      image: "assets/images/margherita.png",
      price: 1000,
      rate: 4.2,
      kcal: "200",
      cookingtime: "30min",
      description:
          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
  FoodDetail(
      id: "5",
      name: "Dosa Pizaa",
      image: "assets/images/dosapizza.png",
      price: 1000,
      rate: 3.2,
      kcal: "200",
      cookingtime: "30min",
      description:
          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
];
List<FoodDetail> salad = [];
List<FoodDetail> burger = [];
List<FoodDetail> fruit = [];
List<FoodDetail> cake = [];
List<FoodDetail> coffee = [];
List<FoodDetail> drink = [];
List<FoodDetail> meat = [];
