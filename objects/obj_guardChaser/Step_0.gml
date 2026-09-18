// Find our target node if we don't have one
if (target_node == noone) {
    var node_count = instance_number(obj_pathNode);

    for (var i = 0; i < node_count; i++) {
        var node = instance_find(obj_pathNode, i);

        if (node.path_id == path_id && node.node_order == node_order) {
            target_node = node;
            break;
        }
    }
}


// Move toward target
if (target_node != noone) {
    var dist = point_distance(x, y, target_node.x, target_node.y);

    if (dist > move_speed) {
        move_towards_point(target_node.x, target_node.y, move_speed);
    }
    else {
        // Arrived at node
        x = target_node.x;
        y = target_node.y;

        // Go to next node
        node_order += 1;

        // Look for the next node
        target_node = noone;

        // See if the next node exists
        var next_node = noone;

        var node_count = instance_number(obj_pathNode);

        for (var i = 0; i < node_count; i++) {
            var node = instance_find(obj_pathNode, i);

            if (node.path_id == path_id && node.node_order == node_order) {
                next_node = node;
                break;
            }
        }

        // If there isn't a next node, loop back to 0
        if (next_node == noone) {
            node_order = 0;
        }
        else {
            target_node = next_node;
        }
    }
}
