Config = {}

-- Config for the ped
Config.PedModel = `a_m_m_business_01`
Config.PedLocation = vector4(2761.31, 3495.36, 54.39, 252.56)

-- Config for the target
Config.TargetLabel = 'Achetez des Props'
Config.TargetIcon = 'fas fa-shop'
Config.TargetDistance = 2.0

-- Config for the prop spawn location
Config.PropSpawnLocation = vector3(2770.48, 3497.06, 55.24)

-- Config for the menu
Config.MenuTitle = 'Youtool'
Config.MenuDescription = 'Preview & Achat de Props'

Config.MenuLocation = 'topright'
Config.MenutColorR = 255
Config.MenutColorG = 0
Config.MenutColorB = 0
Config.MenuSize = 'size-125'
Config.MenuFont = 'default'

Config.MenuNamespace = 'prop_visualizer'
Config.MenuNamespace2 = 'prop_visualizer2'

Config.MenuItemIcon = '🗿'
Config.MenuItemDescription = 'Appuyez sur ENTRER pour acheter '
Config.MenuItemDescription2 = 'Appuyez sur ENTRER pour découvrir la catégorie '


-- Config for the props
Config.Props = {
    {label = 'Box de carton',               model = 'prop_boxpile_07d',                 price = 100},
    {label = 'Cone de circulation',         model = 'prop_roadcone02a',                 price = 200},
    {label = 'Barrière',                    model = 'prop_barrier_work05',              price = 300},
    {label = 'Chaise',                      model = 'prop_chair_01a',                   price = 400},
    {label = 'Table',                       model = 'prop_table_03',                    price = 500},
    {label = 'Canapé',                      model = 'prop_couch_01',                    price = 800},
    {label = 'Lit',                         model = 'prop_bed_01',                      price = 1000},
    {label = 'Bureau',                      model = 'prop_desk_01',                     price = 750},
    {label = 'Armoire',                     model = 'prop_cabinet_01',                  price = 600},
    {label = 'Télévision',                  model = 'prop_tv_flat_01',                  price = 1200},
    {label = 'Lampe',                       model = 'prop_lamp_01',                     price = 300},
    {label = 'Plante',                      model = 'prop_plant_int_01a',              price = 250},
    {label = 'Tapis',                       model = 'prop_rug_01',                      price = 400},
    {label = 'Bibliothèque',               model = 'prop_bookshelf_01',                price = 900},
    {label = 'Micro-ondes',                model = 'prop_microwave_1',                 price = 450},
    {label = 'Réfrigérateur',              model = 'prop_fridge_01',                   price = 1500},
    {label = 'Machine à laver',            model = 'prop_washing_machine_1',           price = 1300},
    {label = 'Poubelle',                   model = 'prop_bin_01a',                     price = 150},
    {label = 'Ventilateur',                model = 'prop_fan_01',                      price = 200},
    {label = 'Radio',                      model = 'prop_radio_01',                    price = 350},
    {label = 'Ordinateur',                 model = 'prop_pc_01a',                      price = 1000},
    {label = 'Imprimante',                 model = 'prop_printer_01',                  price = 400},
    {label = 'Tableau',                    model = 'prop_painting_01',                 price = 600},
    {label = 'Horloge murale',            model = 'prop_clock_01',                    price = 250},
    {label = 'Miroir',                     model = 'prop_mirror_01',                   price = 300},
    {label = 'Guitare',                    model = 'prop_guitar_01',                   price = 800},
    {label = 'Piano',                      model = 'prop_piano_01',                    price = 2000},
    {label = 'Batterie',                   model = 'prop_drum_kit_01',                 price = 1500},
    {label = 'Barbecue',                   model = 'prop_bbq_1',                       price = 700},
    {label = 'Parasol',                    model = 'prop_parasol_01',                  price = 400},
    {label = 'Chaise de jardin',          model = 'prop_chair_02',                    price = 300},
    {label = 'Table de jardin',           model = 'prop_table_02',                    price = 450},
    {label = 'Hamac',                      model = 'prop_hammock_01',                  price = 500},
    {label = 'Balançoire',                model = 'prop_swing_01',                    price = 600},
    {label = 'Toboggan',                   model = 'prop_slide_01',                    price = 800},
    {label = 'Piscine gonflable',         model = 'prop_pool_01',                     price = 1000},
    {label = 'Vélo',                       model = 'prop_bike_01',                     price = 500},
    {label = 'Skateboard',                 model = 'prop_skateboard_01',               price = 300},
    {label = 'Ballon de foot',            model = 'prop_football_01',                 price = 100},
    {label = 'Ballon de basket',          model = 'prop_basketball_01',               price = 100},
    {label = 'Raquette de tennis',        model = 'prop_tennis_rack_01',              price = 200},
    {label = 'Club de golf',              model = 'prop_golf_club_01',                price = 400},
    {label = 'Sac de boxe',               model = 'prop_boxing_bag_01',               price = 500},
    {label = 'Haltères',                   model = 'prop_weight_1',                    price = 300},
    {label = 'Tapis de yoga',             model = 'prop_yoga_mat_01',                 price = 150},
    {label = 'Banc de musculation',       model = 'prop_weight_bench_01',             price = 800},
    {label = 'Échelle',                    model = 'prop_ladder_01',                   price = 400},
    {label = 'Boîte à outils',            model = 'prop_toolbox_01',                  price = 300},
    {label = 'Marteau',                    model = 'prop_hammer_01',                   price = 100},
    {label = 'Scie',                       model = 'prop_saw_01',                      price = 150},
    {label = 'Perceuse',                   model = 'prop_drill_01',                    price = 200},
    {label = 'Pelle',                      model = 'prop_shovel_01',                   price = 150},
    {label = 'Râteau',                     model = 'prop_rake_01',                     price = 120},
    {label = 'Tondeuse',                   model = 'prop_lawnmower_01',               price = 600},
    {label = 'Arrosoir',                   model = 'prop_wateringcan',                 price = 100},
    {label = 'Pot de fleurs',             model = 'prop_flowerpot_01',               price = 150},
    {label = 'Statue de jardin',          model = 'prop_garden_statue',              price = 800},
    {label = 'Fontaine',                   model = 'prop_fountain_01',                 price = 1200},
    {label = 'Lanterne',                   model = 'prop_lantern_01',                  price = 250},
    {label = 'Panneau solaire',           model = 'prop_solar_panel',                price = 2000},
    {label = 'Éolienne',                   model = 'prop_windmill_01',                 price = 2500},
    {label = 'Composteur',                model = 'prop_composter',                   price = 400},
    {label = 'Récupérateur d\'eau',       model = 'prop_water_collector',            price = 600},
    {label = 'Serre',                      model = 'prop_greenhouse_01',               price = 1500},
    {label = 'Poulailler',                model = 'prop_chicken_coop',                price = 1000},
    {label = 'Niche',                      model = 'prop_doghouse_01',                 price = 500},
    {label = 'Aquarium',                   model = 'prop_aquarium_01',                price = 800},
    {label = 'Cage à oiseaux',            model = 'prop_birdcage_01',                price = 400},
    {label = 'Terrarium',                  model = 'prop_terrarium_01',               price = 600},
    {label = 'Ruche',                      model = 'prop_beehive_01',                 price = 1000},
    {label = 'Épouvantail',               model = 'prop_scarecrow_01',               price = 300},
    {label = 'Brouette',                   model = 'prop_wheelbarrow_01',             price = 350},
    {label = 'Commode',                    model = 'prop_dresser_01',                 price = 700},
    {label = 'Table de chevet',           model = 'prop_bedside_table_01',           price = 400},
    {label = 'Porte-manteau',             model = 'prop_coatstand_01',               price = 250},
    {label = 'Panier à linge',            model = 'prop_laundry_basket_01',          price = 150},
    {label = 'Séchoir à linge',           model = 'prop_clothesline_01',             price = 200},
    {label = 'Fer à repasser',            model = 'prop_iron_01',                    price = 150},
    {label = 'Planche à repasser',        model = 'prop_ironing_board_01',           price = 200},
    {label = 'Aspirateur',                model = 'prop_vacuum_01',                   price = 400},
    {label = 'Balai',                      model = 'prop_broom_01',                   price = 100},
    {label = 'Serpillière',               model = 'prop_mop_01',                     price = 100},
    {label = 'Seau',                       model = 'prop_bucket_01',                  price = 80},
    {label = 'Éponge',                     model = 'prop_sponge_01',                  price = 50},
    {label = 'Produit ménager',           model = 'prop_cleaning_spray',             price = 100},
    {label = 'Désodorisant',              model = 'prop_air_freshener',              price = 80},
    {label = 'Papier toilette',           model = 'prop_toilet_paper_01',            price = 50},
    {label = 'Savon',                      model = 'prop_soap_01',                    price = 30},
    {label = 'Serviette',                  model = 'prop_towel_01',                   price = 100},
    {label = 'Tapis de bain',             model = 'prop_bath_mat_01',                price = 150},
    {label = 'Rideau de douche',          model = 'prop_shower_curtain',             price = 200},
    {label = 'Porte-savon',               model = 'prop_soap_holder',                price = 100},
    {label = 'Brosse à dents',            model = 'prop_toothbrush_01',              price = 50},
    {label = 'Dentifrice',                model = 'prop_toothpaste_01',              price = 30},
    {label = 'Peigne',                     model = 'prop_comb_01',                    price = 40},
    {label = 'Brosse à cheveux',          model = 'prop_hairbrush_01',               price = 60},
    {label = 'Sèche-cheveux',             model = 'prop_hairdryer_01',               price = 200},
    {label = 'Rasoir',                     model = 'prop_razor_01',                   price = 80},
    {label = 'Crème à raser',             model = 'prop_shaving_cream',              price = 60},
    {label = 'Coton-tige',                model = 'prop_cotton_swab',                price = 30},
    {label = 'Pansement',                  model = 'prop_bandage_01',                 price = 40},
    {label = 'Trousse de premiers soins', model = 'prop_first_aid_kit',             price = 300},
    {label = 'Thermomètre',               model = 'prop_thermometer_01',             price = 100},
    {label = 'Balance',                    model = 'prop_scale_01',                   price = 150},
    {label = 'Pèse-personne',             model = 'prop_weighing_scale',             price = 200},
    {label = 'Miroir grossissant',        model = 'prop_magnifying_mirror',          price = 250},
    {label = 'Tabouret de salle de bain', model = 'prop_bathroom_stool',            price = 150},
    {label = 'Porte-serviettes',          model = 'prop_towel_rail_01',             price = 120},
    {label = 'Porte-papier toilette',     model = 'prop_toilet_roll_holder',        price = 80},
    {label = 'Poubelle de salle de bain', model = 'prop_bathroom_bin',              price = 100},
    {label = 'Tapis antidérapant',        model = 'prop_nonslip_mat',               price = 120},
    {label = 'Distributeur de savon',     model = 'prop_soap_dispenser',            price = 150},
    {label = 'Porte-brosses à dents',     model = 'prop_toothbrush_holder',         price = 100},
    {label = 'Panier à linge sale',       model = 'prop_laundry_basket_02',         price = 180},
    {label = 'Séchoir mural',             model = 'prop_wall_dryer',                price = 250},
    {label = 'Patère murale',             model = 'prop_wall_hook',                 price = 80}
    -- Add more props as needed
}

Config.Props2 = {
    ["LSPD"] = {
        {label = 'Box de carton',               model = 'prop_boxpile_07d',                 price = 100},
        {label = 'Cone de circulation',         model = 'prop_roadcone02a',                 price = 200},
        {label = 'Barrière',                    model = 'prop_barrier_work05',              price = 300},
        {label = 'Chaise',                      model = 'prop_chair_01a',                   price = 400},
    },
    ["Tables"] = {
        {label = 'Table',                       model = 'prop_table_03',                    price = 500},
        {label = 'Canapé',                      model = 'prop_couch_01',                    price = 800},
        {label = 'Lit',                         model = 'prop_bed_01',                      price = 1000},
    },
    ["Canapés"] = {
        {label = 'Canapé',                      model = 'prop_couch_01',                    price = 800},
    },
    ["Lits"] = {
        {label = 'Lit',                         model = 'prop_bed_01',                      price = 1000},
    },
    ["Bureaux"] = {
        {label = 'Bureau',                      model = 'prop_desk_01',                     price = 750},
    },
    ["Armoires"] = {
        {label = 'Armoire',                     model = 'prop_cabinet_01',                  price = 600},
    },
    ["Télévisions"] = {
        {label = 'Télévision',                  model = 'prop_tv_flat_01',                  price = 1200},
    },
    ["Lampes"] = {
        {label = 'Lampe',                       model = 'prop_lamp_01',                     price = 300},
    },
    ["Plantes"] = {
        {label = 'Plante',                      model = 'prop_plant_int_01a',              price = 250},
    },
    ["Tapis"] = {
        {label = 'Tapis',                       model = 'prop_rug_01',                      price = 400},
    },
    ["Bibliothèques"] = {
        {label = 'Bibliothèque',               model = 'prop_bookshelf_01',                price = 900},
    },
    ["Cuisines"] = {
        {label = 'Micro-ondes',                model = 'prop_microwave_1',                 price = 450},
        {label = 'Réfrigérateur',              model = 'prop_fridge_01',                   price = 1500},
        {label = 'Machine à laver',            model = 'prop_washing_machine_1',           price = 1300},
    },
    ["Poubelles"] = {
        {label = 'Poubelle',                   model = 'prop_bin_01a',                     price = 150},
    },
    
    


}