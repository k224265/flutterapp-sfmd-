import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<TodoItem> _todos = [
    TodoItem(title: 'My todo item', isDone: true),
    TodoItem(title: 'My todo item', isDone: false),
    TodoItem(title: 'My todo item', isDone: true),
  ];

  void _addTodo() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _todos.add(TodoItem(title: text, isDone: false));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0F8),
      appBar: AppBar(
        title: const Text('To Do List'),
        backgroundColor: const Color(0xFFF5F0F8),
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _todos[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: _todos[index].isDone
                              ? TextDecoration.lineThrough
                              : null,
                          color: _todos[index].isDone
                              ? Colors.grey
                              : Colors.black87,
                        ),
                      ),
                      Checkbox(
                        value: _todos[index].isDone,
                        activeColor: Colors.deepPurple,
                        onChanged: (value) {
                          setState(() {
                            _todos[index].isDone = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a todo item',
                      border: UnderlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                TextButton(
                  onPressed: _addTodo,
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});
}
