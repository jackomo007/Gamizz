import 'items.dart';

class Core {
  int _itemNumber = 0;

  List<Item> _items = [
    Item(
        'The main character in the \"Half-Life\" franchise is named Morgan Freeman.',
        'half-life.jpg',
        true),
    Item('Donkey Kong was originally set to be a Popeye arcade game.',
        'MARIO_popeye_dk.jpg', true),
    Item(
        'In \"Super Mario Bros.\", the clouds and bushes have the same artwork and are just different colors.',
        'super-mario.jpg',
        true),
    Item(
        'The ultimate phrase used by Pharah from Overwatch is: \"Justice rains from above!\"',
        'pharah.jpg',
        true),
    Item('Minecraft can be played with a virtual reality headset.',
        'minecraft.jpg', true),
    Item('In Splatoon, the Squid Sisters are named Tako and Yaki.',
        'splatoon2.png', false),
    Item(
        'Valve\'s \"Portal\" and \"Half-Life\" franchises exist within the same in-game universe.',
        'valve.jpg',
        true),
    Item(
        'In \"Need for Speed: Porsche Unleashed\", the player can only drive cars manufactured by Porsche.',
        'unleashed.jpg',
        true),
    Item('Each piece in Tetris is called a tetris.', 'tetris.png', true),
    Item(
        'Deus Ex (2000) does not feature the World Trade Center because it was destroyed by terrorist attacks.',
        'deus-ex.jpg',
        false),
    Item(
        'In the \"S.T.A.L.K.E.R.\" series, the Freedom faction wishes to destroy the supernatural area known as \"the Zone\"',
        'STALKER.jpg',
        false),
    Item('The shotgun appears in every numbered Resident Evil game.',
        'resident-evil.png', true),
    Item('Big the Cat is a playable character in \"Sonic Generations\".',
        'sonic.jpg', false)
  ];

  void nextItem() {
    if (_itemNumber < _items.length - 1) {
      _itemNumber++;
    }
  }

  bool isFinished() {
    if (_itemNumber < _items.length - 1) {
      return false;
    } else {
      return true;
    }
  }

  void reset() {
    _itemNumber = 0;
  }

  String getItemText() {
    return _items[_itemNumber].itemText;
  }

  String getItemImage() {
    return _items[_itemNumber].itemImg;
  }

  bool getItemAnswer() {
    return _items[_itemNumber].itemAnswer;
  }
}
