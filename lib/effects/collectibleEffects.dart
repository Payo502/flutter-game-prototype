import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class CollectibleEffect extends ParticleSystemComponent {
  CollectibleEffect(Vector2 position)
      : super(
          position: position,
          particle: Particle.generate(
            count: 10,
            lifespan: 0.5,
            generator: (i) => AcceleratedParticle(
              acceleration: Vector2(0, -100),
              child: CircleParticle(
                radius: 3,
                paint: Paint()..color = Colors.yellow.withOpacity(0.8),
              ),
            ),
          ),
        );
}
