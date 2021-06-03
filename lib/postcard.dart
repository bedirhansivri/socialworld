import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String profileImageUrl;
  final String nameSurname;
  final String passingTime;
  final String sendPictureLink;
  final String explanation;

  const PostCard({Key key, this.profileImageUrl, this.nameSurname, this.passingTime, this.sendPictureLink, this.explanation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          height: 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo,
                          image: DecorationImage(
                              image: NetworkImage(
                                  profileImageUrl),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameSurname,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            passingTime,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(height: 15),
              Text(
                explanation,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Image.network(
                sendPictureLink,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconWithButton(
                    myIcon: Icons.favorite,
                    comment: "Beğen",
                    myFunction: () {
                      print("Beğen");
                    },
                  ),
                  IconWithButton(
                    myIcon: Icons.comment,
                    comment: "Yorum Yap",
                    myFunction: () {
                      print("Yorum Yap");
                    },
                  ),
                  // ignore: deprecated_member_use
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.share, color: Colors.grey),
                      label: Text(
                        "Paylaş",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconWithButton extends StatelessWidget {
  final IconData myIcon;
  final String comment;
  final myFunction;

  IconWithButton({this.myIcon, this.comment, this.myFunction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: myFunction,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(myIcon, color: Colors.grey),
              SizedBox(width: 8.0),
              Text(
                comment,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
