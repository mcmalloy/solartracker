import 'dart:math';
Random random = new Random();
class AnimationDurationEngine{
  int getAnimationDuration(){
    int animationDuration = random.nextInt(1200) + 800;
    return animationDuration;
  }
}