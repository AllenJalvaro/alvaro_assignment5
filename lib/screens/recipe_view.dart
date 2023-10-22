import 'package:alvaro_assignment5/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeViewScreen extends StatefulWidget {
  final Recipe recipe;

  RecipeViewScreen(this.recipe, {Key? key}) : super(key: key);

  @override
  _RecipeViewScreenState createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: widget.recipe.imageUrl == null
                ? const Center(
                    child: Text('No Image'),
                  )
                : Image.network(
                    widget.recipe.imageUrl!,
                    fit: BoxFit.cover,
                  ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            tabs: const [
              Tab(icon: Icon(Icons.restaurant_menu), text: "Ingredients"),
              Tab(icon: Icon(Icons.list), text: "Steps"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: widget.recipe.ingredients?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(widget.recipe.ingredients![index]),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: widget.recipe.steps?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(widget.recipe.steps![index]),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
