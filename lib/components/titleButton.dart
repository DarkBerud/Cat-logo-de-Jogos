import 'package:flutter/material.dart';

class gameTitleButton extends StatelessWidget {
  final String title;
  final String plataform;
  final String genre;
  final String media;
  final String image;

  gameTitleButton(this.title, this.plataform, this.genre, this.media,this.image, {Key? key})
      : super(key: key);

  bool assetOrNetwork() {
    if (image.contains("http")) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleButtons(
        fillColor: Colors.white70,
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.white,
        constraints: BoxConstraints(maxHeight: 100),
        isSelected: [true],
        children: [Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white70,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black26,
                      ),
                      width: 65,
                      height: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: assetOrNetwork()
                            ? Image.asset(
                          image,
                          fit: BoxFit.cover,
                        )
                            : Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            title,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text(
                                plataform,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                genre,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                media,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),],
        onPressed: (index){
          print("clicou");
        },
      ),
    );
  }
}
