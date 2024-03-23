import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/features/casts/presentation/logic/bloc/casts_bloc.dart';
import 'package:star_wars_app/features/popular/data/model/popular_model.dart';
import 'package:star_wars_app/generated/l10n.dart';
import 'package:star_wars_app/internal/components/text_helper.dart';
import 'package:star_wars_app/internal/dependencies/get_it.dart';

@RoutePage()
class PopularInfoScreen extends StatefulWidget {
  final PopularModel popularModel;
  final int id;

  const PopularInfoScreen({
    super.key,
    required this.popularModel,
    required this.id,
  });

  @override
  State<PopularInfoScreen> createState() => _PopularInfoScreenState();
}

class _PopularInfoScreenState extends State<PopularInfoScreen> {
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
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: 70.h,
                width: 70.w,
                margin: EdgeInsets.only(
                  top: 8.h,
                  left: 8.w,
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
                widget.popularModel.title ?? '-',
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.popularModel.posterPath}',
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
                  SizedBox(height: 30.h),
                  Text(
                    widget.popularModel.overview.toString(),
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
                                      text: widget.popularModel.releaseDate
                                          .toString()
                                          .substring(
                                            0,
                                            widget.popularModel.releaseDate
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
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                ' ${widget.popularModel.voteAverage?.toStringAsFixed(1)} / 10',
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
