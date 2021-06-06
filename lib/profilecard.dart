import 'package:flutter/material.dart';
import 'package:socia_world/postcard.dart';

class ProfileCard extends StatelessWidget {
  final String isimSoyad;
  final String kullaniciAdi;
  final kapakResimLink;
  final profilResimLink;

  const ProfileCard(
      {Key key,
      this.isimSoyad,
      this.kullaniciAdi,
      this.kapakResimLink,
      this.profilResimLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 230.0,
                //color: Colors.yellow,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2016/10/24/22/43/dubai-1767540_960_720.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 0,
                child: Hero(
                  tag: isimSoyad,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(profilResimLink),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.lightBlue,
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 145,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isimSoyad,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      kullaniciAdi,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[200],
                    border: Border.all(width: 2.0, color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        size: 16.0,
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        "Takip Et",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 75,
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                counterMethod("200K", "Takipçi"),
                counterMethod("500", "Takip"),
                counterMethod("100", "Paylaşım"),
              ],
            ),
          ),
          PostCard(
            profileImageUrl: profilResimLink,
            nameSurname: isimSoyad,
            sendPictureLink:
                "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_960_720.jpg",
            passingTime: "2 saat önce",
            explanation: "Tipsiz Kedi poz veriyor...",
          ),
        ],
      ),
    );
  }

  Column counterMethod(String sayi, String baslik) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          baslik,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          sayi,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
