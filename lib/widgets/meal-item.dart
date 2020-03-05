import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  const MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      this.removeItem});

  void _onMealSelect(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((value) {
      if (value != null && removeItem != null) {
        removeItem(value);
      }
    });
  }

  String get _complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
    }
    return '';
  }

  String get _affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onMealSelect(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.local_dining),
                      SizedBox(width: 6),
                      Text(_complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(_affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
