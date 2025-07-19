import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/extension/navigation.dart';
import 'package:note_app/core/utils/app_colors.dart';
import 'package:note_app/feature/create_note/create_note_screen.dart';
import 'package:note_app/feature/home/widgets/empty_state.dart';
import 'package:note_app/feature/shared/cubit/note_cubit.dart';
import 'package:note_app/feature/shared/cubit/note_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NoteCubit>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.darkColor,
        child: const Icon(Icons.add, color: Colors.white, size: 35),
        onPressed: () {
          context.pushTo(context, const CreateNoteScreen());
          // .then((value) {
          // context.read<NoteCubit>().getNotes();
          // });
        },
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, asyncSnapshot) {
          var notes = context.read<NoteCubit>().notes;
          return notes.isEmpty
              ? EmptyState()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: notes.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 15);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(notes[index].title),
                    );
                  },
                );
        },
      ),
    );
  }
}
