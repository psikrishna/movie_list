import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/model/movie.dart';
import 'movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Movies",
          style: TextStyle(color: Colors.blueGrey.shade100),
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children:<Widget>[
                  Positioned(

                      child: movieCard(movieList[index], context)),
                  Positioned(
                      top: 20.0,
                      left: 10.0,
                      child: movieImage(movieList[index].images[0])),
                  //movieCard(movieList[index], context)
                ]);
//            return Card(
//              color: Colors.blueGrey.shade100,
//              elevation: 2,
//              child: ListTile(
//                leading: CircleAvatar(
//                  backgroundColor: Colors.blueGrey.shade900,
//                  child: Container(
//                    width: 200,
//                    height: 200,
//                    decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: NetworkImage(movieList[index].images[0]),
//                          fit: BoxFit.cover
//                        ),
//                        color: Colors.blueGrey.shade900,
//                        borderRadius: BorderRadius.circular(19.0)),
//                    /*child: Text(
//                      "ABC",
//                      style: TextStyle(color: Colors.blueGrey.shade100),
//                    ),*/
//                  ),
//                ),
//                trailing: Text(
//                  "...",
//                  style: TextStyle(
//                      color: Colors.blueGrey.shade400,
//                      fontWeight: FontWeight.bold),
//                ),
//                title: Text(
//                  movieList[0].title,
//                  style: TextStyle(
//                      color: Colors.blueGrey.shade700,
//                      fontWeight: FontWeight.bold),
//                ),
//                subtitle: Text(movieList[index].genre,
//                  style: TextStyle(color: Colors.blueGrey.shade400),
//                ),
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => MovieListViewDetails(movieName: "${movieList[index].title+" ("+movieList[index].year})",
//                            movie: movieList[index],)));
//                },
//                //onTap: () => debugPrint("Movie Name: ${movies[index]}"),
//              ),
//            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 43.0,right: 10.0),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 120,
        child: Card(
          color: Colors.blueGrey.shade100,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 50.0, right: 19.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(movie.title, style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,fontSize: 19.0),),
                    ),
                    Text("Rating: ${movie.imdbRating}/10",
                      style: TextStyle(color: Colors.blueGrey.shade700,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Released: ${movie.released}",
                      style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 12.0),),
                    Text(movie.runtime,
                      style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 12.0),),
                    Text(movie.rated,
                      style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 12.0),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movieName: "${movie.title+" ("+movie.year})",
        movie: movie, )))
    },
    );
  }

  Widget movieImage(String imageUrl){
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://source.unsplash.com/random'),
              fit: BoxFit.cover
        )
      ),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.movieName}",
          style: TextStyle(
              color: Colors.blueGrey.shade100, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
        backgroundColor: Colors.blueGrey.shade100,
        body: ListView(
          children: <Widget>[
            MovieDetailsThumbnail(thumbnail: movie.images[0]),
            MovieDetailsHeaderWithPoster(movie: movie),
            HorizantalLine(),
            MovieCastDetails(movie: movie),
            HorizantalLine(),
            MovieExtraPosters(posters: movie.images),
          ],
        ),
//      body: Center(
//        child: Container(
//          color: Colors.transparent,
//          child: RaisedButton(
//            color: Colors.blueGrey.shade900,
//            child: Text(
//              "Back",
//              style: TextStyle(color: Colors.blueGrey.shade100),
//            ),
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
//        ),
//      ),
    );
  }
}






