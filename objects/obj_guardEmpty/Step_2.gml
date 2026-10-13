// Patrol movement uses GameMaker's built-in direction. Keep the light facing
// the last movement direction while stopped at a patrol point.
if (!guard_chasing && speed > 0) vision_direction = direction;
