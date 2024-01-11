import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/screens/movie_screen.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell( // Removi o ConstrainedBox que envolvia esse  inkWell e adicionei o Expanded no card para ele ocupar o máximo de espaço possível na Column
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieScreen(movie: movie),
                      ),
                    );
                  },
                  child: movie.imageURI != null
                      ? Ink(
                          width: double.infinity,
                          // Removi o decorador e adicionei esse child para tratar uma Imagem que não estava carregando corretamente
                          child: Image.network(
                            movie.imageURI!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Ink(
                              child: const Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                        )
                      : Ink(
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        ))),
        ),
        Text(
          movie.name,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
