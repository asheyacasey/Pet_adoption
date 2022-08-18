import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/pets_controller.dart';
import 'adoption_model.dart';
import 'widgets/adoption_card.dart';
import 'widgets/input_widgets.dart';


class AdoptionScreen extends StatefulWidget {
  final AuthController auth;
  const AdoptionScreen(this.auth, {Key? key}) : super(key: key);

  @override
  State<AdoptionScreen> createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen>{

  late final PetController _todoController;
  final ScrollController _sc = ScrollController();
  AuthController get _auth => widget.auth;


  @override
  void initState() {
    _todoController = PetController(_auth.currentUser!.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _auth.logout();
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle:true,
        title: const Text('iGARCHU',
          style: TextStyle(fontWeight: FontWeight.bold, ),
        ),
        backgroundColor: const Color(0xff3f51b5),
      ),
      floatingActionButton: FloatingActionButton(
        shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        backgroundColor: const Color(0xff3f51b5),
        child: const Icon(Icons.add),
        onPressed: () {
          showAddDialog(context);
        },
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _todoController,
          builder: (context, Widget? w) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: Scrollbar(
                      controller: _sc,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(12.0),
                        controller: _sc,
                        child: Column(
                          children: [
                            for (Adoption todo in _todoController.data)
                              AdoptionCard(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                todo: todo,
                                onErase: () {
                                  _todoController.removeTodo(todo);
                                },
                                onLongPress: () {
                                  _todoController.updateTodo(todo, todo.adopteeID, todo.name, todo.age, todo.breed, todo.gender);
                                  showEditDialog(context, todo);
                                },
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  showAddDialog(BuildContext context) async {
    Adoption? result = await showDialog<Adoption>(
        context: context,
        builder: (dContext) {
          return const Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: InputWidget(),
          );
        });
    if (result != null) {
      _todoController.addTodo(result);
    }
  }

  showEditDialog(BuildContext context, Adoption todo) async {
    Adoption? result = await showDialog<Adoption>(
        context: context,
        builder: (dContext) {
          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: InputWidget(
              adoptID: todo.adopteeID,
              name: todo.name,
              age: todo.age,
              gender: todo.gender,
              breed: todo.breed,
            ),
          );
        });
    if (result != null) {
      _todoController.updateTodo(todo, result.adopteeID, result.name, result.age, result.gender, result.breed);

    }
  }
}