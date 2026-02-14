import 'package:cinema_culture/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:cinema_culture/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlidesShow(movies: nowPlayingMovies),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'No te lo pierdas!!',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
            ],
          );
        }, childCount: 1)),
      ],
    );
  }
}
