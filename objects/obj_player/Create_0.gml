image_xscale = 0.5;
image_yscale = 0.5;

start_x = x;
start_y = y;

resets = 5;

interact = function(_distance)
{
    var _target = instance_nearest(x, y, obj_blockEmpty);

    if (_target != noone)
    {
        if (point_distance(x, y, _target.x, _target.y) <= _distance)
        {
            with (_target)
            {
                interacted();
            }
        }
    }
};
