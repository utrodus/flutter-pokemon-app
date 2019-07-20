import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;
  PokeDetail({this.pokemon});

  BodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height/1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                          height: 80.0,
                        ),
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Height : ${pokemon.height}"),
                    Text("Weight : ${pokemon.weight}"),
                    Text(
                      "Types",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type
                          .map((t) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(t),
                              onSelected: (b) {}))
                          .toList(),
                    ),
                    Text(
                        "Weakness",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses
                          .map((t) => FilterChip(
                              backgroundColor: Colors.red,
                              label: Text(
                                t,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onSelected: (b) {}))
                          .toList(),
                    ),
                    Text(
                      "Next Evolution",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    rowWidget(pokemon.nextEvolution, Colors.blue),

                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 180.0,
                width: 180.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pokemon.img)
                  )
                ),
              ),
            ),
          ),
        ],
      );


  Widget rowWidget(List<dynamic> method, Color color){
    if(method != null ){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: method
            .map((n) => FilterChip(
            backgroundColor: color,
            label: (method == pokemon.nextEvolution)?
            Text(
              n.name,
              style: TextStyle(
                color: Colors.white,
              ),
            ) : Text(n),

            onSelected: (b) {}))
            .toList(),
      );
    }else {
      return FilterChip(
        backgroundColor: Colors.orange,
        label: Text('Ini Adalah Evolusi Terakhir dari Pokemon Ini',
          style: TextStyle(fontSize: 12.0, color: Colors.white),
        ),
        onSelected: (b) {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
      ),
      body: BodyWidget(context),
    );
  }
}
