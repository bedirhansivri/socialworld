import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socia_world/postcard.dart';
import 'package:socia_world/profilecard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social World',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 32.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          'SociaWorld',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.purple[200],
              ),
              onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, 3), blurRadius: 5),
              ],
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profileCard(
                    "Selçuk",
                    "https://cdn.pixabay.com/photo/2014/04/12/14/59/portrait-322470_960_720.jpg",
                    "sslck",
                    "https://cdn.pixabay.com/photo/2014/05/22/16/52/pyrenees-351266_960_720.jpg"),
                profileCard(
                    "Tom",
                    "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg",
                    "tmclskn",
                    "https://cdn.pixabay.com/photo/2017/03/29/15/18/tianjin-2185510_960_720.jpg"),
                profileCard(
                    "Jessica",
                    "https://cdn.pixabay.com/photo/2015/09/02/12/39/woman-918583_960_720.jpg",
                    "jcabldr",
                    "https://cdn.pixabay.com/photo/2015/03/26/10/04/buildings-690868_960_720.jpg"),
                profileCard(
                    "Belma",
                    "https://cdn.pixabay.com/photo/2019/11/03/20/11/portrait-4599553_960_720.jpg",
                    "blmbdr",
                    "https://cdn.pixabay.com/photo/2017/02/06/11/58/desert-2042738_960_720.jpg"),
                profileCard(
                    "Yıldız",
                    "https://cdn.pixabay.com/photo/2020/08/21/08/46/african-5505598_960_720.jpg",
                    "yildzasyl",
                    "https://cdn.pixabay.com/photo/2017/09/16/16/08/lake-2755907_960_720.jpg"),
                profileCard(
                    "Nadir",
                    "https://cdn.pixabay.com/photo/2016/03/26/22/13/man-1281562_960_720.jpg",
                    "ndrndr",
                    "https://cdn.pixabay.com/photo/2016/11/29/09/29/beach-1868716_960_720.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          PostCard(
            profileImageUrl:
                "https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508_960_720.jpg",
            nameSurname: "Burak Yıldız",
            sendPictureLink:
                "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074_960_720.jpg",
            passingTime: "1 saat önce",
            explanation: "Harika bir köpek",
          ),
          PostCard(
            profileImageUrl:
                "https://cdn.pixabay.com/photo/2019/11/30/22/38/girl-4664439_960_720.jpg",
            nameSurname: "Selin Yılmaz",
            sendPictureLink:
                "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_960_720.jpg",
            passingTime: "2 saat önce",
            explanation: "Sevimli Kedi",
          ),
        ],
      ),
    );
  }

  Widget profileCard(String userName, String url, String nameSurname,
      String coverProfileLink) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenVeri = await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProfileCard(
                    profilResimLink: url,
                    kullaniciAdi: nameSurname,
                    kapakResimLink: coverProfileLink,
                    isimSoyad: userName,
                  )));
          if (donenVeri) {
            print("kulanıcı giriş yaptı");
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Hero(
                    tag: "UcanProfilResmi",
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(35),
                        image: DecorationImage(
                            image: NetworkImage(url), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(height: 4),
              Text(
                userName,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
