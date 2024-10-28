import 'package:api/common/colors.dart';
import 'package:api/common/constants.dart';
import 'package:api/common/utils.dart';
import 'package:api/models/recommended_movie_model.dart';
import 'package:api/models/search_models.dart';
import 'package:api/screens/movie_detail/movie_detail_page.dart';
import 'package:api/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<RecommendedMovieModel> reconmmendeMovie;

  ApiServices apiServices = ApiServices();
  SearchMovieModel? searchModel;

  void search(String query) {
    apiServices.getSearchMovie(context, query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    reconmmendeMovie = apiServices.getMovieRecomendation(context);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoSearchTextField(
                  padding: const EdgeInsets.all(10),
                  controller: searchController,
                  style: const TextStyle(color: kWhiteColor),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onChanged: (value) {
                    if (value.isEmpty) {
                    } else {
                      search(searchController.text);
                    }
                  },
                ),
                searchController.text.isEmpty
                    ? FutureBuilder(
                        future: reconmmendeMovie,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data?.results;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kHeight20,
                                const Text(
                                  "Top searches",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                kHeight10,
                                ListView.builder(
                                    padding: const EdgeInsets.all(10),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: data?.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MovieDetailPage(movieId: data[index].id,)));
                                        },
                                        child: Container(
                                          height: 150,
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            children: [
                                              Image.network(
                                                  "$imageUrl${data?[index].posterPath}"),
                                              kHeight20,
                                              SizedBox(
                                                  width: 160,
                                                  child: Text(
                                                    data![index].title,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        })
                    : searchModel == null
                        ? const SizedBox.shrink()
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: searchModel?.results.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 1.2 / 2),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  searchModel!.results[index].backdropPath ==
                                          null
                                      ? Image.asset(
                                          "assets/netflix.png",
                                          width: 100,
                                          height: 100,
                                        )
                                      : Image.network(
                                          "$imageUrl${searchModel?.results[index].backdropPath}",
                                          height: 100,
                                        ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      searchModel!.results[index].originalTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              );
                            })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
