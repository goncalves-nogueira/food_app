import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_fade/image_fade.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: const [
              SizedBox(height: 50.0),
              TopWidget(),
              Spacer(),
              BottonWidget(),
            ],
          ),
          Center(
            child: ImageFade(
              height: 300.0,
              image: const NetworkImage(
                'https://www.nicepng.com/png/full/878-8788790_hamburguer-x-tudo-png.png',
              ),
              duration: const Duration(milliseconds: 900),
              loadingBuilder: (context, progress, chunkEvent) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 10.0,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class BottonWidget extends StatefulWidget {
  const BottonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottonWidget> createState() => _BottonWidgetState();
}

class _BottonWidgetState extends State<BottonWidget> {
  double _heigth = 0;
  int _count = 1;

  @override
  void initState() {
    _restart();
    super.initState();
  }

  void _restart() {
    _heigth = 0;
    Timer.periodic(const Duration(milliseconds: 50), (_) {
      if (_heigth == 500) {
        _.cancel();
      }
      _heigth += 10;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _heigth, //MediaQuery.of(context).size.height * .45,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(46.0),
          topRight: Radius.circular(46.0),
        ),
      ),
      child: Visibility(
        visible: _heigth >= 400,
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _heigth >= 410 ? 1 : 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Smash Burguer',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Bacon Burguer',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'R\$28',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 26.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(width: 10.0),
                  const Text('5,0'),
                  const SizedBox(width: 10.0),
                  const Text('(16543 Reviews)'),
                ],
              ),
              const SizedBox(height: 18.0),
              Container(
                padding: const EdgeInsets.all(6.0),
                width: 130.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _count++;
                        setState(() {});
                      },
                      child: const CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.add,
                          size: 22.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18.0),
                    Text('$_count', style: const TextStyle(fontSize: 18.0)),
                    const SizedBox(width: 18.0),
                    InkWell(
                      onTap: () {
                        _count--;
                        setState(() {});
                      },
                      child: const CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.remove,
                          size: 22.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Visibility(
                visible: _heigth >= 150,
                child: SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 148, 20, 11)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () => _restart(),
                    child: Text(
                      'Adicionar Cartao'.toUpperCase(),
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ImageFade(
                  height: 300.0,
                  image: const NetworkImage(
                    'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile.png',
                  ),
                  duration: const Duration(milliseconds: 900),
                  loadingBuilder: (context, progress, chunkEvent) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 6.0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
          const Text(
            'Outros detalhes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Smash Burguer',
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'O Smash burger é uma tendencia já conhecida nos \n EUA e que vem se espalhando pelo Brasil. um \n hambúrguer menor, achatado diretamente na chapa\n e com um sabor único.',
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
