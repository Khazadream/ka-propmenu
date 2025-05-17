### ka-propmenu
Prop menu list to buy props as item

### Dependencies:
* [qb-core](https://github.com/qbcore-framework/qb-core)
* [qb-target](https://github.com/qbcore-framework/qb-target)
* [ox_inventory](https://github.com/overextended/ox_inventory)
* [ka-placeableitems](https://github.com/Khazadream/ka-placeableitems)

### Config your item name in server/main.lua ligne 3:

```
local itemName = 'testplaceable' -- change this to the item name you want to use
```

### Config locations, ped & menuV in config.lua:

### Add more props:

You can add more categories and props in Config.lua.
Copy & Paste this example below the last categorie and modify as you want.
Note that model should be the FiveM Object Name.

```
["CategorieName"] = { -- Name it as you want, but it will be shown in the categorie list when opening the props menu.
        {label = 'Label 1',                 model = 'prop_boxpile_07d',                 price = 100},
        {label = 'Label 2',                 model = 'prop_roadcone02a',                 price = 200},
        {label = 'Label 3',                 model = 'prop_barrier_work05',              price = 300},
    },
```