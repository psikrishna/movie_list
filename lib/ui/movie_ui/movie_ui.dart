import 'package:flutter/material.dart';
import 'package:movie_list/model/movie.dart';

class MovieDetailsThumbnail extends StatelessWidget {

  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                //color: Colors.blueGrey.shade100,
                  image: DecorationImage(
                      image: NetworkImage(thumbnail),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.blueGrey.shade100)
          ],
        ),
        //Spacer(),
//        Container(
//          decoration: BoxDecoration(
//            gradient: RadialGradient(
//              colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
//              focalRadius: 5.0,
//              radius: 50
//            )
//          ),
//        )
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x00f5f5f5),Color(0xFFCFD8DC)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          height: 40,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {

  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(width: 16),
          //Text("ABC")
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          )
        ],
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {

  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(movie.title,style: TextStyle(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 33.0),),
        Text("${movie.year} | ${movie.genre}",style: TextStyle(color: Colors.blueGrey.shade400,fontWeight: FontWeight.bold,fontSize: 14.0),),
        Text.rich(TextSpan(style: TextStyle(color: Colors.blueGrey.shade300,fontSize: 14.0,fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(text: movie.plot),
              TextSpan(text: "More...",style: TextStyle(color: Colors.blueGrey.shade200))
            ]))
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {

  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.circular(10.0);
    return Card(
      elevation: 0.0,
      color: Colors.blueGrey.shade100,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          //color: Colors.blueGrey,
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10.0),
            //color: Colors.transparent,
              image: DecorationImage(image: NetworkImage(poster),
                  fit: BoxFit.cover
              )
          ),
        ),
      ),
    );
  }
}

class MovieCastDetails extends StatelessWidget {

  final Movie movie;

  const MovieCastDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field: "Cast",value: movie.actors),
          MovieField(field: "Director",value: movie.director),
          MovieField(field: "Awards",value: movie.awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {

  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field:",style: TextStyle(color: Colors.blueGrey.shade700,fontSize: 14.0,fontWeight: FontWeight.w300),),
        Expanded(
            child: Text(value,style: TextStyle(color: Colors.blueGrey.shade400,fontSize: 14.0,fontWeight: FontWeight.w300),)
        )
      ],
    );
  }
}

class HorizantalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
      child: Container(
        height: 0.5,
        color: Colors.blueGrey.shade500,
      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {

  final List<String> posters;

  const MovieExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("More Images:",style: TextStyle(color: Colors.blueGrey.shade400,fontSize: 14.0),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
          child: Container(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context,index) => SizedBox(width: 8.0,),
                itemCount: posters.length,
                itemBuilder: (context,index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/4,
                    height: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(posters[index]),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                )
            ),
          ),
        )
      ],
    );
  }
}