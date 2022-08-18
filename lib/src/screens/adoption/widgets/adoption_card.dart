import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../adoption_model.dart';


class AdoptionCard extends StatelessWidget {
  final Adoption todo;



  final Function()? onErase;
  final Function()? onLongPress;
  final EdgeInsets? margin;
  final ScrollController _sc = ScrollController();

  AdoptionCard(
      {required this.todo,
        this.onErase,
        this.onLongPress,
        this.margin,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      child: GestureDetector(
        onLongPress: onLongPress,

        child: AspectRatio(
          aspectRatio: 11 / 5,
          child: Container(

            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Row (
                        children: const [
                          Icon(CupertinoIcons.doc),
                          SizedBox(width: 10),
                          Text(
                            'Adoption Form'
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close),
                      iconSize: 20,
                      onPressed: onErase,
                    ),
                  ],
                ),

                Expanded(
                  child: SingleChildScrollView(
                    controller: _sc,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                             'Adoptee ID: ',
                            ),
                            Text(
                              todo.adopteeID,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Name: ',
                            ),
                            Text(
                              todo.name,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Age: ',
                            ),
                            Text(
                              todo.age,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Gender: ',
                            ),
                            Text(
                              todo.gender,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Breed: ',
                            ),
                            Text(
                              todo.breed,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}