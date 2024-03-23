import 'dart:developer';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/features/now_playing/presentation/logic/bloc/now_playing_bloc.dart';
import 'package:star_wars_app/features/now_playing/presentation/logic/bloc/now_playing_state.dart';
import 'package:star_wars_app/features/popular/presentation/logic/bloc/popular_bloc.dart';
import 'package:star_wars_app/features/top_rated/presentation/logic/bloc/top_rated_bloc.dart';
import 'package:star_wars_app/features/upcoming/presentation/logic/bloc/upcoming_bloc.dart';
import 'package:star_wars_app/generated/l10n.dart';
import 'package:star_wars_app/internal/components/routes/auto_route.gr.dart';
import 'package:star_wars_app/internal/components/text_helper.dart';
import 'package:star_wars_app/internal/dependencies/get_it.dart';
import 'package:star_wars_app/internal/helpers/localization/bloc/global_localization_bloc.dart';

@RoutePage()
class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController controller = ScrollController();
  int current = 0;
  double itemWidth = 1.sw;
  NowPlayingBloc nowPlayingBloc = getIt<NowPlayingBloc>();
  PopularBloc popularBloc = getIt<PopularBloc>();
  TopRatedBloc topRatedBloc = getIt<TopRatedBloc>();
  UpcomingBloc upcomingBloc = getIt<UpcomingBloc>();
  @override
  void initState() {
    nowPlayingBloc.add(GetAllNowPlayingEvent());
    popularBloc.add(GetAllPopularMovieEvent());
    topRatedBloc.add(GetAllTopRatedrMovie());
    upcomingBloc.add(GetAllUpComingMoviesEvent());
    super.initState();
  }

  Widget buildDot({required int index}) {
    return Container(
      width: 8.w,
      height: 8.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: current == index ? Colors.blue : Colors.grey,
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 1, 27, 47),
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'MOVIE',
                style: TextHelper.w800s70White,
              ),
            ),
            ExpansionTile(
              title: Text(
                S.of(context).language,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<GlobalLocalizationBloc>()
                        .add(ChangeLocaleEvent(locale: 'en'));
                  },
                  child: Text(
                    S.of(context).english,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    context
                        .read<GlobalLocalizationBloc>()
                        .add(ChangeLocaleEvent(locale: 'ru'));
                  },
                  child: Text(
                    S.of(context).russian,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 1, 27, 47),
                      title: Center(
                        child: Text(
                          S.of(context).about,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      content: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 0.30.sh),
                        child: Column(
                          children: [
                            Text(
                              S.of(context).thisProduct,
                              style: TextHelper.w600s15White,
                            ),
                            SizedBox(height: 10.h),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: Image.network(
                                'https://play-lh.googleusercontent.com/XXqfqs9irPSjphsMPcC-c6Q4-FY5cd8klw4IdI2lof_Ie-yXaFirqbNDzK2kJ808WXJk=w240-h480-rw',
                                height: 125.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              gradient: const LinearGradient(
                                colors: [Colors.blue, Colors.purple],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            height: 60.h,
                            width: 150.w,
                            child: TextButton(
                              onPressed: () {
                                AutoRouter.of(context).maybePop();
                              },
                              child: Text(
                                'Okay',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              child: ListTile(
                title: Text(
                  S.of(context).about,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 1, 27, 47),
                      title: Center(
                        child: Text(
                          S.of(context).warning,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      content: Text(
                        S.of(context).areYouSure,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              gradient: const LinearGradient(
                                colors: [Colors.blue, Colors.purple],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            height: 60.h,
                            width: 150.w,
                            child: TextButton(
                              onPressed: () {
                                signOut();
                                AutoRouter.of(context)
                                    .replace(const AuthRoute());
                              },
                              child: Text(
                                'Yes',
                                style: TextHelper.s18White,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              child: ListTile(
                title: Text(
                  S.of(context).exit,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 1, 27, 47),
      body: DefaultTabController(
        length: 3,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            BlocConsumer<NowPlayingBloc, NowPlayingState>(
              bloc: nowPlayingBloc,
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
                                    filter: ImageFilter.blur(
                                      sigmaX: 5,
                                      sigmaY: 5,
                                    ),
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
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _scaffoldKey.currentState!.openDrawer();
                                      },
                                      icon: const Icon(Icons.menu)),
                                ],
                              ),
                              Text(
                                'RAZAKFLIX',
                                style: TextHelper.w700s30Red,
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
                                        onTap: () {
                                          AutoRouter.of(context).push(
                                            NowPlayingInfoRoute(
                                              nowPlayingModel: state
                                                  .nowPlayingResult
                                                  .results![index],
                                              id: state.nowPlayingResult
                                                      .results![index].id ??
                                                  0,
                                            ),
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          child: Image.network(
                                            "https://image.tmdb.org/t/p/w500${state.nowPlayingResult.results![index].backdropPath ?? '-'}",
                                            height: 250.h,
                                            width: 250.w,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        state.nowPlayingResult.results?[index]
                                                .originalTitle ??
                                            '-',
                                        style: TextHelper.w600s20White,
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
                                        duration:
                                            const Duration(microseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    });
                                  },
                                  height: 382.h,
                                  viewportFraction: 0.7,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
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
                      TabBar(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        indicatorWeight: 3,
                        labelStyle: const TextStyle(
                          fontSize: 20,
                        ),
                        indicatorColor: const Color.fromARGB(255, 27, 52, 241),
                        labelColor: const Color.fromARGB(255, 27, 52, 241),
                        unselectedLabelColor: Colors.white,
                        tabs: const [
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
                      nowPlayingBloc.add(GetAllNowPlayingEvent());
                    },
                    child: const Text('Ошибка'),
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 250.h,
              child: TabBarView(
                children: [
                  BlocConsumer<PopularBloc, PopularState>(
                    bloc: popularBloc,
                    listener: (context, state) {
                      if (state is PopularErrorState) {
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
                      if (state is PopularLoadedState) {
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.popularResult.results!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                      PopularInfoRoute(
                                        popularModel:
                                            state.popularResult.results![index],
                                        id: state.popularResult.results![index]
                                                .id ??
                                            0,
                                      ),
                                    );
                                  },
                                  child: Card(
                                    color: Colors.black,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${state.popularResult.results?[index].posterPath}',
                                        height: 200.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  state.popularResult.results![index]
                                      .originalTitle
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20.w);
                          },
                        );
                      }
                      if (state is PopularErrorState) {
                        return TextButton(
                          onPressed: () {
                            popularBloc.add(GetAllPopularMovieEvent());
                          },
                          child: const Column(
                            children: [
                              Text('Ошибка'),
                              Text('Повторите еще раз')
                            ],
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocConsumer<TopRatedBloc, TopRatedState>(
                    bloc: topRatedBloc,
                    listener: (context, state) {
                      if (state is TopRatedErrorState) {
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
                      if (state is TopRatedLoadedState) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.topRatedResult.results!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                      TopRatedInfoRoute(
                                        topRatedModel: state
                                            .topRatedResult.results![index],
                                        id: state.topRatedResult.results![index]
                                                .id ??
                                            0,
                                      ),
                                    );
                                  },
                                  child: Card(
                                    color: Colors.black,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${state.topRatedResult.results?[index].posterPath}',
                                        height: 200.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  state.topRatedResult.results![index]
                                      .originalTitle
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20.w);
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocConsumer<UpcomingBloc, UpcomingState>(
                    bloc: upcomingBloc,
                    listener: (context, state) {
                      if (state is UpcomingErrorState) {
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
                      if (state is UpcomingLoadedState) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.upComingResult.results!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                      // или можно context.router.push()
                                      UpcomingInfoRoute(
                                        upComingModel: state
                                            .upComingResult.results![index],
                                        id: state.upComingResult.results![index]
                                                .id ??
                                            0,
                                      ),
                                    );
                                  },
                                  child: Card(
                                    color: Colors.black,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${state.upComingResult.results?[index].posterPath}',
                                        height: 200.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  state.upComingResult.results![index]
                                      .originalTitle
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20.w);
                          },
                        );
                      }
                      return const SizedBox();
                    },
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
