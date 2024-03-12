import 'dart:developer';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/features/now_playing/presentation/logic/bloc/now_playing_bloc.dart';
import 'package:star_wars_app/features/now_playing/presentation/logic/bloc/now_playing_state.dart';
import 'package:star_wars_app/features/popular/presentation/logic/bloc/popular_bloc.dart';
import 'package:star_wars_app/internal/dependencies/get_it.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  ScrollController controller = ScrollController();
  int current = 0;
  double itemWidth = 1.sw;

  PopularBloc popularBloc = getIt<PopularBloc>();

  NowPlayingBloc bloc = getIt<NowPlayingBloc>();

  @override
  void initState() {
    bloc.add(GetAllNowPlayingEvent());
    popularBloc.add(GetAllPopularMovieEvent());
    super.initState();
  }

  Widget buildDot({required int index}) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: current == index ? Colors.blue : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 27, 47),
      body: DefaultTabController(
        length: 3,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            BlocConsumer<NowPlayingBloc, NowPlayingState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is NowPlayingErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error.message ?? '0',
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                log('state is $state');
                if (state is NowPlayingLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is NowPlayingLoadedState) {
                  return Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 0.4.sh,
                            child: ListView.builder(
                              controller: controller,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.nowPlayingResult.results!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${state.nowPlayingResult.results![index].backdropPath ?? '-'}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'RAZAKFLIX',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 60.h),
                              CarouselSlider.builder(
                                itemCount:
                                    state.nowPlayingResult.results!.length,
                                itemBuilder:
                                    (context, int index, int pageViewIndex) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            "https://image.tmdb.org/t/p/w500${state.nowPlayingResult.results![index].backdropPath ?? '-'}",
                                            height: 250,
                                            width: 250,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        state.nowPlayingResult.results?[index]
                                                .originalTitle ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  );
                                },
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      current = index;
                                      controller.animateTo(
                                        index * itemWidth,
                                        duration: const Duration(microseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    });
                                  },
                                  height: 382.h,
                                  viewportFraction: 0.7,
                                  initialPage: 0,
                                  enableInfiniteScroll:
                                      true, // по умолчанию true
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 4),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.nowPlayingResult.results!.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      const TabBar(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        indicatorWeight: 3,
                        labelStyle: TextStyle(
                          fontSize: 20,
                        ),
                        indicatorColor: Color.fromARGB(255, 27, 52, 241),
                        labelColor: Color.fromARGB(255, 27, 52, 241),
                        unselectedLabelColor: Colors.white,
                        tabs: [
                          Tab(text: 'POPULAR'),
                          Tab(text: 'TOP RATED'),
                          Tab(text: 'UPCOMING'),
                        ],
                      ),
                    ],
                  );
                }
                if (state is NowPlayingErrorState) {
                  return ElevatedButton(
                    onPressed: () {
                      bloc.add(GetAllNowPlayingEvent());
                    },
                    child: const Text('Ошибка'),
                  );
                }
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                );
              },
            ),
            SizedBox(
              height: 250,
              child: TabBarView(
                children: [
                  BlocConsumer<PopularBloc, PopularState>(
                    bloc: popularBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is PopularLoadedState) {
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.popularResult.results!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Card(
                                  color: Colors.black,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${state.popularResult.results?[index].posterPath}',
                                      height: 200,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  state.popularResult.results![index]
                                      .originalTitle
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 20);
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const Text('razak'),
                  const Text('dastan'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
