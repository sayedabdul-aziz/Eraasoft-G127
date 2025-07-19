import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widgets/my_icon_button.dart';
import 'package:note_app/feature/home/page/home_screen.dart';
import 'package:note_app/feature/shared/cubit/note_cubit.dart';
import 'package:note_app/feature/shared/cubit/note_state.dart';
import 'package:note_app/feature/shared/model/note_model.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is NoteCreateState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              MyIconButton(
                icon: Icons.save,
                onTap: () {
                  var id = DateTime.now().toIso8601String();
                  context.read<NoteCubit>().addNote(
                    NoteModel(
                      id: id,
                      title: titleController.text,
                      content: descriptionController.text,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 35),
                ),
              ),

              TextFormField(
                controller: descriptionController,
                maxLines: 10,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
