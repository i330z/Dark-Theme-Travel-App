import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark theme travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      home: MyHomePage(),
    );
  }
}

var newZealandImage =
    'https://images.unsplash.com/photo-1492531622965-b556ff0402df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var parisImage =
    'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1307&q=80';
var auroraImage =
    'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

var berlinImage =
    'https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var amsterdamImage =
    'https://images.unsplash.com/photo-1524047934617-cb782c24e5f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

var gradient1 = [Color(0xFFdc5f89), Color(0xFFeea694)];
var gradient2 = [Color(0xFF269b70), Color(0xFF7ce6a9)];
var gradient3 = [Color(0xFF526fe2), Color(0xFF8351e5)];

var images = [
  newZealandImage,
  parisImage,
  auroraImage,
  berlinImage,
  amsterdamImage
];

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1359),
      bottomNavigationBar: Theme(
        data: ThemeData(
            canvasColor: Color(0xFF382f6e)
        ),
        child: BottomNavigationBar(
          fixedColor: Colors.pink,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(title: Container(), icon: Icon(Icons.home)),
            BottomNavigationBarItem(title: Container(), icon: Icon(Icons.place, color: Colors.grey.withOpacity(0.6))),
            BottomNavigationBarItem(title: Container(), icon: Icon(Icons.person, color: Colors.grey.withOpacity(0.6))),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 16.0),
          TopSection(),
          MainCarousel(),
          TourSection(),
        ],
      ),
    );
  }
}


class TourSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Popular Tour',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TourCard('Paris Tour', parisImage),
                TourCard('Berlin Tour', berlinImage),
                TourCard('Amsterdam Tour', amsterdamImage),
              ],
            ),
          ),
        )
      ],
    );
  }
}



class TourCard extends StatelessWidget {
  final name;
  final image;
  TourCard(this.name, this.image);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            SizedBox(height: 5.0),
            Text('USD 1200/5days', style: TextStyle(color: Colors.white70, fontSize: 13.0),),
          ],
        ),
      ),
    );
  }
}



class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Travel',
            style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Container(
            color: Color(0xFF382f6e),
            child: Row(
              children: <Widget>[
                SizedBox(width: 16.0),
                Icon(Icons.search),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search Destination',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 32.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                GradientButton('Italy', gradient1),
                GradientButton('Rome', gradient2),
                GradientButton('French', gradient3),
                GradientButton('Denmark', gradient2),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Destination',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }
}


class MainCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 200.0,
      autoPlay: false,
      viewportFraction: 0.9,
      enlargeCenterPage: true,
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: double.infinity,
                      child: Image.network(i, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'New Zealand',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellowAccent, size: 14.0),
                              Icon(Icons.star, color: Colors.yellowAccent, size: 14.0),
                              Icon(Icons.star, color: Colors.yellowAccent, size: 14.0),
                              Icon(Icons.star, color: Colors.yellowAccent, size: 14.0),
                              Icon(Icons.star_border, color: Colors.yellowAccent, size: 14.0),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'USD 500',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            Text('4.5',style: TextStyle(color: Colors.white),),
                            Text(
                              '(620 review)',
                              style: TextStyle(color: Colors.white54),
                            )
                          ],
                        )

                      ],
                    )
                  ],
                )
            );
          },
        );
      }).toList(),
    );
  }
}


class GradientButton extends StatelessWidget {
  final name;
  final color;
  GradientButton(this.name, this.color);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: color,
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(4.0)

        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
        ),
      ),
    );
  }
}

