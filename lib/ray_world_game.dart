import 'package:flame/game.dart';
import 'package:game/components/world.dart';
import 'components/player.dart';
import '../helpers/direction.dart';
import 'components/world.dart';
import 'helpers/direction.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Player _player = Player();
final World _world = World();

class RayWorldGame extends FlameGame with HasCollidables {
  @override
  // ignore: must_call_super
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    add(_player);

    _player.position = _world.size / 2;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}
