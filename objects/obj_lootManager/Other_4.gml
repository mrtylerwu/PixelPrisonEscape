// Find every chest in the room
var chest_count = instance_number(obj_chest);

show_debug_message("===== LOOT SETUP =====");
show_debug_message("Total chests: " + string(chest_count));


// Go through every loot table
for (var table = 0; table < array_length(loot_tables); table++)
{
    var table_chests = [];

    // ----------------------------------------
    // Find chests belonging to this table
    // ----------------------------------------

    for (var i = 0; i < chest_count; i++)
    {
        var chest = instance_find(obj_chest, i);

        if (chest.loot_table == table)
        {
            chest.loot = noone;
            chest.opened = false;

            array_push(table_chests, chest);
        }
    }


    var chest_total = array_length(table_chests);
    var loot_total = array_length(loot_tables[table]);


    show_debug_message(
        "Table " + string(table)
        + " | Chests: " + string(chest_total)
        + " | Loot: " + string(loot_total)
    );


    if (chest_total == 0)
        continue;


    // ----------------------------------------
    // Copy the loot pool
    // ----------------------------------------

    var available_loot = [];

    for (var i = 0; i < loot_total; i++)
    {
        array_push(
            available_loot,
            loot_tables[table][i]
        );
    }


    // ----------------------------------------
    // Shuffle both arrays
    // ----------------------------------------

    table_chests = array_shuffle(table_chests);
    available_loot = array_shuffle(available_loot);


    // ----------------------------------------
    // Assign loot
    // ----------------------------------------

    var drop_count = min(chest_total, loot_total);

    show_debug_message(
        "Giving out " + string(drop_count) + " items."
    );


    for (var i = 0; i < drop_count; i++)
    {
        var target_chest = table_chests[i];
        var target_loot = available_loot[i];

        target_chest.loot = target_loot;

        show_debug_message(
            "ASSIGNING "
            + object_get_name(target_loot)
            + " TO CHEST ID "
            + string(target_chest.chest_id)
        );
    }
}
