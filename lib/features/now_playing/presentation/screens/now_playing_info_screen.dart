import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/features/casts/presentation/logic/bloc/casts_bloc.dart';
import 'package:star_wars_app/features/now_playing/data/models/now_playing_model.dart';
import 'package:star_wars_app/generated/l10n.dart';
import 'package:star_wars_app/internal/components/text_helper.dart';
import 'package:star_wars_app/internal/dependencies/get_it.dart';

@RoutePage()
class NowPlayingInfoScreen extends StatefulWidget {
  final NowPlayingModel nowPlayingModel;
  final int id;

  const NowPlayingInfoScreen({
    super.key,
    required this.nowPlayingModel,
    required this.id,
  });

  @override
  State<NowPlayingInfoScreen> createState() => _NowPlayingInfoScreenState();
}

class _NowPlayingInfoScreenState extends State<NowPlayingInfoScreen> {
  CastsBloc castsBloc = getIt<CastsBloc>();

  @override
  void initState() {
    castsBloc.add(GetAllCastsEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 27, 47),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 1, 27, 47),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70.h,
                width: 70.w,
                margin: EdgeInsets.only(
                  top: 10.h,
                  left: 10.w,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            expandedHeight: 500.h,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.nowPlayingModel.title ?? '-',
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.nowPlayingModel.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  SizedBox(height: 10.h),
                  Text(
                    widget.nowPlayingModel.overview.toString(),
                    style: TextHelper.s20White,
                  ),
                  SizedBox(height: 25.h),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Release Date: ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.nowPlayingModel.releaseDate
                                          .toString()
                                          .substring(
                                            0,
                                            widget.nowPlayingModel.releaseDate
                                                    .toString()
                                                    .length -
                                                12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                               Text(
                                S.of(context).rating,
                                style:const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                ' ${widget.nowPlayingModel.voteAverage?.toStringAsFixed(1)} / 10',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    S.of(context).casts,
                    style: TextHelper.s25White,
                  ),
                  SizedBox(height: 10.h),
                  BlocConsumer<CastsBloc, CastsState>(
                    bloc: castsBloc,
                    listener: (context, state) {
                      if (state is CastsErrorState) {
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
                      if (state is CastsLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CastsLoadedState) {
                        return SizedBox(
                          height: 330.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.castsResult.cast!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.r),
                                      topLeft: Radius.circular(20.r),
                                    ),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${state.castsResult.cast?[index].profilePath}',
                                      height: 230.h,
                                      width: 180.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r),
                                    ),
                                    child: Container(
                                      height: 80.h,
                                      width: 180.w,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 5.h,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.castsResult.cast?[index]
                                                      .name ??
                                                  '-',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.h,
                                              ),
                                            ),
                                            Text(
                                              state.castsResult.cast?[index]
                                                      .character ??
                                                  '-',
                                              style: TextHelper.w600s15Purple,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 20.w);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
