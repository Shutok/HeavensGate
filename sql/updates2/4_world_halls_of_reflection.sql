-- Halls of Reflection
-- Creature Templates
START TRANSACTION;
SET @NPC_UTHER              := 37225;
SET @NPC_JAINA_INTRO        := 37221;
SET @NPC_SYLVANA_INTRO      := 37223;
SET @NPC_JAINA_OUTRO        := 36955;
SET @NPC_SYLVANA_OUTRO      := 37554;
SET @NPC_FROSTWORN_GENERAL  := 36723;
SET @NPC_LICH_KING_EVENT    := 36954;
SET @NPC_LICH_KING_BOSS     := 37226;

UPDATE `creature_template` SET `speed_walk`='1.8', `speed_run`='2.0' WHERE `entry` IN (@NPC_LICH_KING_EVENT, @NPC_LICH_KING_BOSS);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=@NPC_FROSTWORN_GENERAL;

UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_hor_part2' WHERE `entry` IN (@NPC_JAINA_OUTRO, @NPC_SYLVANA_OUTRO);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry`=@NPC_LICH_KING_BOSS;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_raging_gnoul' WHERE `entry`=36940;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_risen_witch_doctor' WHERE `entry`=36941;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_abon' WHERE `entry`=37069;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_queldelar' WHERE `entry`=37158;

UPDATE `creature_template` SET `unit_flags` = 32784, `AIName` = '', `ScriptName` = 'npc_spiritual_reflection', `difficulty_entry_1` = 37721 WHERE `entry` = 37107;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `unit_flags` = 32784, `mindmg` = '422', `maxdmg` = '586', `attackpower` = '642', `dmg_multiplier` = '13' WHERE `entry` = 37721;
UPDATE `creature_template` SET `flags_extra` = 1 WHERE `entry` = @NPC_FROSTWORN_GENERAL;
UPDATE `creature_template` SET `flags_extra` = 257 WHERE `entry` = @NPC_FROSTWORN_GENERAL;

UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` IN (@NPC_JAINA_INTRO, @NPC_JAINA_OUTRO);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` IN (@NPC_SYLVANA_INTRO, @NPC_SYLVANA_OUTRO);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=@NPC_LICH_KING_EVENT;
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (@NPC_UTHER, @NPC_SYLVANA_INTRO, @NPC_LICH_KING_BOSS, @NPC_SYLVANA_OUTRO);

-- Creature Spawns
SET @GUID_CREATURE := 202284;
DELETE FROM creature WHERE map=668 AND id IN (14881, 36723, 37221, 37704, 37906, 38112, 38113);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID_CREATURE+1,'37704','668','3','1','17612','0','5309.08','2006.32','711.422','3.93429','604800','0','0','12600','0','0','0','0','0'),
(@GUID_CREATURE+2,'14881','668','3','1','1160','0','5337.6','2012.14','707.695','3.52509','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+3,'14881','668','3','1','2536','0','5268.91','1969.17','707.696','0.321519','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+4,'14881','668','3','1','1160','0','5386.99','2080.5','707.695','4.67797','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+5,'38112','668','3','1','0','0','5271.65','2042.5','709.32','5.51217','604800','0','0','377468','0','0','0','0','0'),
(@GUID_CREATURE+6,'38113','668','3','1','0','0','5344.75','1972.87','709.319','2.33445','604800','0','0','539240','0','0','0','0','0'),
(@GUID_CREATURE+7,'37221','668','3','1','0','0','5236.67','1929.91','707.695','0.837758','604800','0','0','5040000','881400','0','0','0','0'),
(@GUID_CREATURE+8,'36723','668','3','1','0','2432','5413.9','2116.65','707.695','3.94765','604800','0','0','315000','0','0','0','0','0');

UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1594540 AND -1594430;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1594473, 'Have reached your allies, Jaina, as promised. All will be powerful agents of the Scourge.', '?????? ????????! ??? ???? ?? ????? ????? ????! ?????? ?? ???? ???????, ?????? ?????? ? ???? ????????!', 17229,1,0,0, '67234'),
(-1594474, 'Do not make the same mistake, Sylvanas. This time there will be no escape. I will serve in death!', '? ?? ??????? ??????? ??????, ????????. ?? ???? ??? ???? ?? ????????. ?? ?? ????????? ????? ??????? ? ?????? ???? ???? ?????? ????????!', 17228,1,0,0, '67234'),
-- SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', '???? ???????? ???????, ??????! ??? ?? ? ???????... ??-??-??-??... ??? ?? ??????? ???????? ????????? ?????...', 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', '? ?? ??????? ??????? ??????, ????????! ?? ???? ??? ???? ?? ????????. ?? ??? ?????? ??????? ??? ????? ??????...', 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', '?? ??????? ?????. ?? ?????? ????????? ?? ???? ??? ????? ??????. ??? ????? ???????? ??? ?????????, ??????? ?????...', 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', '?? ??????? ?????. ????? ??????, ?? ????. ?? ?????? ????????? ?????? ??????????. ? ?????????? ??? ?????????, ???? ?? ????? ???????.', 17058,0,0,1, '67234'),
-- SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', '?????? ???????????? ??????? ???????!', 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not left them us!', '?????????? ???????????, ?? ????? ?? ???????!', 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', '???????? ??! ????????? ??? ?? ????!', 17222,1,0,0, '67234'),
(-1594484, 'No...', '??????? ???!', 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', '??????? ? ???????.', 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', '?????? ??????!', 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', '? ??????? ??? ????????, ? ?? ??????????? ?????? ?? ??????????!', 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', '??????? ????? ?? ??????? ???????? ??????. ??????? ?????? ?? ??????????, ? ??????? ??? ????????.', 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', '????? ??????? ?????... ? ??????? ??, ?????? ?? ????? ?????? ???????? ??? ??????????...', 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', '??? ???? ????????. ????????? ?????! ? ??????? ??? ?????!', 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', '?????????? ????????? ??????!', 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', '?? ? ???????!', 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', '??? ????? ?? ??????? ???????????????', 17220,1,0,0, '67234'),
(-1594494, 'This playing with us. I\'ll Show what happens to ice when meeting with fire!', '?? ? ???? ??????. ?  ?????? ??? ??? ?????? ????? ??? ??????????? ?? ?????!', 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', '???? ???????? ?????? ?? ???????? ???, ????????. ? ????? ?? ? ????!', 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', '? ?????? ?? ???? ??? ?????. ???? ????? ?? ????????? ????!', 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', '?? ?? ????????? ??? ????, ??????. ??????????? ??????, ? ? ???????? ??? ????????.', 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', '?????? ?????? ??????. ?????? ??? ???????? ?????????. ??? ???? ????????? ?????!', 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', '????????? ?????, ?????? ??? ?????????? ?????. ?????????? ?????, ??? ???? ????????? ?????.', 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', '??-??-??... ?????? ??????. ?????? ?? ???!', 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', '??????? ?????????, ?????????? ?? ???? ?????????!', 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', '???????? ???????? ???? ??????????? ? ??????? ??? ????????! ??? ??? ??? ??????? ? ??????? - ??????? ???? ??????!', 16738,1,0,0, '67234'),
-- FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', '?? ?????????? ????????? ????? ??????? - ?????!', 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', '????????... ? ?????? ???...', 16922,1,0,0, '67234');

-- Waipoints to escort event on Halls of reflection

DELETE FROM script_waypoint WHERE entry IN (@NPC_JAINA_OUTRO,@NPC_LICH_KING_BOSS,@NPC_SYLVANA_OUTRO);
INSERT INTO script_waypoint VALUES
-- Jaina

   (@NPC_JAINA_OUTRO, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (@NPC_JAINA_OUTRO, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (@NPC_JAINA_OUTRO, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (@NPC_JAINA_OUTRO, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
   (@NPC_JAINA_OUTRO, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (@NPC_JAINA_OUTRO, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (@NPC_JAINA_OUTRO, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (@NPC_JAINA_OUTRO, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (@NPC_JAINA_OUTRO, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (@NPC_JAINA_OUTRO, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (@NPC_JAINA_OUTRO, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (@NPC_JAINA_OUTRO, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (@NPC_JAINA_OUTRO, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (@NPC_JAINA_OUTRO, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (@NPC_JAINA_OUTRO, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (@NPC_JAINA_OUTRO, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (@NPC_JAINA_OUTRO, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (@NPC_JAINA_OUTRO, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana

   (@NPC_SYLVANA_OUTRO, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (@NPC_SYLVANA_OUTRO, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (@NPC_SYLVANA_OUTRO, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (@NPC_SYLVANA_OUTRO, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
   (@NPC_SYLVANA_OUTRO, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (@NPC_SYLVANA_OUTRO, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (@NPC_SYLVANA_OUTRO, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (@NPC_SYLVANA_OUTRO, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (@NPC_SYLVANA_OUTRO, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (@NPC_SYLVANA_OUTRO, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (@NPC_SYLVANA_OUTRO, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (@NPC_SYLVANA_OUTRO, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (@NPC_SYLVANA_OUTRO, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (@NPC_SYLVANA_OUTRO, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (@NPC_SYLVANA_OUTRO, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (@NPC_SYLVANA_OUTRO, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (@NPC_SYLVANA_OUTRO, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (@NPC_SYLVANA_OUTRO, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King

   (@NPC_LICH_KING_BOSS, 1, 5577.19, 2236, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 2, 5580.57, 2232.22, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 3, 5586.67, 2225.54, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 4, 5590.45, 2221.41, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 5, 5595.75, 2215.62, 732.101, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 6, 5601.21, 2206.49, 731.54, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 7, 5605.01, 2197.9, 731.667, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 8, 5606.55, 2191.39, 730.977, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 9, 5604.68, 2186.11, 730.998, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 10, 5602.26, 2179.9, 730.967, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 11, 5600.06, 2174.38, 730.924, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 12, 5597.29, 2166.81, 730.924, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 13, 5596.25, 2160.36, 730.931, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 14, 5591.79, 2152.87, 731.008, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 15, 5585.47, 2146.63, 731.109, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 16, 5579.1, 2140.34, 731.18, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 17, 5572.56, 2134.21, 731.092, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 18, 5564.08, 2126.53, 730.816, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 19, 5559.04, 2117.64, 730.812, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 20, 5555.77, 2111.88, 730.995, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 21, 5550.82, 2103.14, 731.123, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 22, 5546.02, 2094.68, 731.16, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 23, 5541.53, 2084.42, 730.999, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 24, 5537.5, 2075.18, 730.901, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 25, 5533.76, 2063.84, 730.87, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 26, 5530.97, 2052.98, 730.981, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 27, 5526.75, 2041.73, 731.193, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 28, 5522.88, 2031.65, 731.7, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 29, 5521.01, 2023.02, 732.396, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 30, 5516.55, 2015.36, 733.12, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 31, 5513.06, 2007.33, 733.99, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 32, 5510.43, 1997.9, 735.016, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 33, 5504.53, 1990.39, 735.748, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 34, 5499.34, 1983.78, 736.29, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 35, 5493.11, 1975.86, 736.852, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 36, 5487.58, 1968.81, 737.394, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 37, 5483.12, 1961.78, 738.06, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 38, 5478.33, 1954.2, 739.343, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 39, 5475.2, 1945.84, 740.697, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 40, 5472.15, 1938.02, 741.884, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 41, 5469.26, 1931.34, 742.813, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 42, 5464.23, 1922.25, 744.055, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 43, 5458.43, 1912.96, 745.229, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 44, 5452.26, 1902.95, 747.091, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 45, 5442.44, 1892.51, 749.208, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 46, 5435.67, 1879.7, 751.776, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 47, 5429.03, 1870.73, 753.151, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 48, 5423.72, 1862.16, 754.263, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 49, 5417.21, 1851.7, 755.507, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 50, 5408.94, 1838.38, 757.002, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 51, 5398.8, 1829.61, 757.742, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 52, 5388.47, 1817.95, 759.285, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 53, 5378.23, 1808.5, 760.316, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 54, 5368.5, 1801.35, 760.845, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 55, 5360.86, 1793.16, 762.271, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 56, 5353.62, 1785.4, 763.868, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 57, 5344.78, 1776.09, 765.759, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 58, 5336.38, 1768.67, 767.324, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 59, 5327.56, 1760.12, 769.332, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 60, 5319.62, 1750.7, 771.487, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 61, 5313.12, 1742.99, 773.424, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 62, 5305.41, 1735.79, 775.473, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 63, 5298.93, 1728.16, 777.573, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 64, 5292.54, 1720.37, 779.862, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 65, 5287.11, 1713.96, 781.667, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 66, 5280.14, 1705.21, 784.65, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 67, 5277.98, 1701.28, 785.224, 0, 'HoR WP LichKing');

-- AreaTrigger for waves restarter
DELETE FROM `areatrigger_scripts` WHERE `entry` = 5697;
INSERT INTO `areatrigger_scripts` VALUES
(5697, 'at_hor_waves_restarter');


-- GameObjects

-- Templates
DELETE FROM gameobject_template WHERE entry IN (201709, 202211, 190236, 196391, 196392, 197341, 197342, 197343, 201385, 201596, 201710, 201747, 201756, 201885, 201976, 202079, 202212, 202236, 202302, 202336, 202337, 202396, 500001, 500002, 500003);
INSERT INTO `gameobject_template` (`entry`, `TYPE`, `displayId`, `NAME`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
('201596','0','9223','Cave In','','','','1375','4','2','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197342','0','9124','Doodad_IceCrown_Door_02','','','','1375','36','1','0','0','0','0','0','0','1','0','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197343','0','9124','Doodad_IceCrown_Door_03','','','','1375','36','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201976','0','9124','Doodad_IceCrown_Door_04','','','','114','32','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('196391','31','8196','Doodad_InstanceNewPortal_Purple01','','','','0','0','2.72','0','0','0','0','0','0','632','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201747','31','8196','Doodad_InstanceNewPortal_Purple01','','','','0','0','2.72','0','0','0','0','0','0','668','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('196392','31','8197','Doodad_InstanceNewPortal_Purple_Skull01','','','','0','0','2.72','0','0','0','0','0','0','632','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201756','31','8197','Doodad_InstanceNewPortal_Purple_Skull01','','','','0','0','2.72','0','0','0','0','0','0','668','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202302','0','9301','Frostmourne','','','','1375','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202236','0','9294','Frostmourne Altar','','','','114','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('190236','0','7876','Gate','','','','114','32','0.88','0','0','0','0','0','0','0','0','3000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201385','0','9214','Ice Wall','','','','1375','1','2.5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('500001','0','9214','Ice Wall','','','','1375','1','2.5','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('201885','0','9214','Ice Wall','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202396','0','9214','Ice Wall','','','','114','33','2','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197341','0','9124','Impenetrable Door','','','','1375','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('500003','14','8253','Orgrim\'s Hammer','','','','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('202079','22','8111','Portal to Dalaran','','','','0','0','1','0','0','0','0','0','0','53141','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201710','3','9280','The Captain\'s Chest','','','','1732','0','1','0','0','0','0','0','0','57','27985','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202337','3','9281','The Captain\'s Chest','','','','1735','0','1','0','0','0','0','0','0','57','27993','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202336','3','9280','The Captain\'s Chest','','','','1732','0','1','0','0','0','0','0','0','57','27993','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202212','3','9281','The Captain\'s Chest','','','','1735','0','1','0','0','0','0','0','0','57','27985','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','11723'),
('500002','14','9150','The Skybreaker','','','','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('201709','5','9288','Gunship Stairs','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202211','5','9289','Gunship Stairs','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340');

-- Spawns
DELETE FROM gameobject WHERE map = 668 AND id IN (190236, 196391, 196392, 197341, 197342, 197343, 201385, 201596, 201710, 201747, 201756, 201885, 201976, 202079, 202212, 202236, 202302, 202336, 202337, 202396, 500001, 500002, 500003);
SET @GUID_GO := 153000;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GUID_GO,201747,668,3,1,5231.04,1923.79,707.044,0.810935,0,0,-0.370856,0.928691,6000,100,1),
(@GUID_GO+1,201756,668,3,1,5231.04,1923.79,707.044,0.810935,0,0,-0.370856,0.928691,6000,100,1),
(@GUID_GO+2,190236,668,3,1,4926.09,1554.96,163.292,-2.26562,0,0,0.999999,-0.001655,6000,100,1),
(@GUID_GO+3,202302,668,3,1,5309.51,2006.64,709.341,5.50041,0,0,0.381473,-0.92438,604800,100,1),
(@GUID_GO+4,202236,668,3,1,5309.51,2006.64,709.341,5.53575,0,0,0.365077,-0.930977,604800,100,1),
(@GUID_GO+5,201596,668,3,1,5275.28,1694.23,786.147,0.981225,0,0,0.471166,0.882044,25,0,0),
(@GUID_GO+6,500001,668,3,1,5323.61,1755.85,770.305,0.784186,0,0,0.382124,0.924111,604800,100,0),
(@GUID_GO+7,196391,668,3,1,5232.31,1925.57,707.695,0.815481,0,0,0.396536,0.918019,300,0,1),
(@GUID_GO+8,196392,668,3,1,5232.31,1925.57,707.695,0.815481,0,0,0.396536,0.918019,300,0,1),
(@GUID_GO+9,202396,668,3,1,5434.27,1881.12,751.303,0.923328,0,0,0.445439,0.895312,604800,100,0),
(@GUID_GO+10,201885,668,3,1,5494.3,1978.27,736.689,1.0885,0,0,0.517777,0.855516,604800,100,0),
(@GUID_GO+11,197341,668,3,1,5359.24,2058.35,707.695,3.96022,0,0,0.917394,-0.397981,300,100,1),
(@GUID_GO+12,201976,668,3,1,5264.6,1959.55,707.695,0.736951,0,0,0.360194,0.932877,300,100,0),
(@GUID_GO+13,197342,668,3,1,5520.72,2228.89,733.011,0.778581,0,0,0.379532,0.925179,300,100,1),
(@GUID_GO+14,197343,668,3,1,5582.96,2230.59,733.011,5.49098,0,0,0.385827,-0.922571,300,100,1),
(@GUID_GO+15,201385,668,3,1,5540.39,2086.48,731.066,1.00057,0,0,0.479677,0.877445,604800,100,0),
(@GUID_GO+16,202337,668,2,1,5252.33,1585.36,796.062,2.80195,0,0,0.985615,0.169007,604800,100,1),
(@GUID_GO+17,202336,668,2,1,5264.22,1584.94,794.359,2.70142,0,0,0.975878,0.218315,604800,100,1),
(@GUID_GO+18,202079,668,3,1,5248.58,1574.22,795.209,0,0,0,0,1,604800,100,1),
(@GUID_GO+19,500002,668,3,1,5247.09,1586.39,773.922,5.86166,0,0,0.209207,-0.977871,300,0,1),
(@GUID_GO+20,500003,668,3,1,5245.17,1582.11,761.72,5.86166,0,0,0.209207,-0.977871,300,0,1),
(@GUID_GO+21,202212,668,1,1,5253.03,1585.13,796.089,2.75698,0,0,0.981566,0.191121,300,0,1),
(@GUID_GO+22,201710,668,1,1,5262.5,1582.41,794.342,2.75698,0,0,0.981566,0.191121,300,0,1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=27993);
INSERT INTO `gameobject_loot_template` VALUES 
(27993, 43102, 100, 1, 0, 1, 1),
(27993, 47241, 100, 1, 0, 1, 1),
(27993, 50302, 0, 1, 1, 1, 1),
(27993, 50303, 0, 1, 1, 1, 1),
(27993, 50304, 0, 1, 2, 1, 1),
(27993, 50305, 0, 1, 2, 1, 1),
(27993, 50306, 0, 1, 1, 1, 1),
(27993, 50308, 0, 1, 2, 1, 1),
(27993, 50309, 0, 1, 1, 1, 1),
(27993, 50310, 0, 1, 2, 1, 1),
(27993, 50311, 0, 1, 2, 1, 1),
(27993, 50312, 0, 1, 2, 1, 1),
(27993, 50313, 0, 1, 1, 1, 1),
(27993, 50314, 0, 1, 1, 1, 1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=27985);
INSERT INTO `gameobject_loot_template` VALUES 
(27985, 47241, 100, 1, 0, 1, 1),
(27985, 49839, 0, 1, 1, 1, 1),
(27985, 49840, 0, 1, 1, 1, 1),
(27985, 49841, 0, 1, 2, 1, 1),
(27985, 49842, 0, 1, 2, 1, 1),
(27985, 49843, 0, 1, 2, 1, 1),
(27985, 49844, 0, 1, 1, 1, 1),
(27985, 49845, 0, 1, 1, 1, 1),
(27985, 49846, 0, 1, 1, 1, 1),
(27985, 49847, 0, 1, 2, 1, 1),
(27985, 49848, 0, 1, 2, 1, 1),
(27985, 49849, 0, 1, 1, 1, 1),
(27985, 49851, 0, 1, 2, 1, 1);

-- Halls of Reflection Maewyn and Falric
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38599;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38112;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38113;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38603;

-- Utgarde Pinnacle King Ymiron
UPDATE `creature_template` SET `unit_flags`=64 WHERE `entry`=26861;
UPDATE `creature_template` SET `unit_flags`=64 WHERE `entry`=30788;

DELETE FROM gossip_menu WHERE entry=37552;
INSERT INTO gossip_menu VALUES (37552, 537552);

DELETE FROM npc_text WHERE id = 537552;
INSERT INTO npc_text (ID, text0_0) VALUES (537552, 'It seems these are the remains that Thalorien was looking for, the last carrier of Quel\'Delar');

-- NPCs
DELETE FROM `creature_template` WHERE `entry` IN (37552, 37205, 37542, 37541, 37539, 37538);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES 
(37552, 0, 0, 0, 0, 0, 30659, 0, 0, 0, 'Thalorien Dawnseeker\'s Remains', '', '', 0, 80, 80, 0, 35, 35, 1, 1, 1.14286, 1, 1, 0, 0, 0, 0, 1, 0, 0, 2, 32772, 44, 0, 0, 0, 0, 0, 0, 0, 0, 7, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 3, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_thalorien', 12340),
(37205, 0, 0, 0, 0, 0, 30570, 0, 0, 0, 'Thalorien Dawnseeker', '', '', 0, 80, 80, 0, 35, 35, 0, 1, 1.14286, 1, 1, 400, 600, 0, 472, 2, 1500, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 10.3181, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 12340),
(37542, 0, 0, 0, 0, 0, 30657, 0, 0, 0, 'Morlen Coldgrip', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 1.14286, 1, 1, 400, 600, 0, 472, 1, 1500, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 2048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 7.076, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 12340),
(37541, 0, 0, 0, 0, 0, 30651, 30653, 30654, 0, 'Crypt Raider', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 1.14286, 1, 0, 400, 600, 0, 472, 1, 1500, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 3.538, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 12340),
(37539, 0, 0, 0, 0, 0, 30647, 30648, 30649, 30650, 'Ghoul Invader', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 1.14286, 1, 0, 400, 600, 0, 472, 1, 1500, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 2.9483, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 12340),
(37538, 0, 0, 0, 0, 0, 30645, 30644, 30643, 30646, 'Scourge Zombie', '', '', 0, 80, 80, 0, 16, 16, 0, 1, 1.14286, 1, 0, 400, 600, 0, 472, 1, 1500, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 1.887, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 12340);

DELETE FROM `creature_template_addon` WHERE (`entry`=37552);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (37552, 0, 0, 0, 0, 0, '25824 31261 31261 1');

DELETE FROM `smart_scripts` WHERE (`entryorguid` IN (37552, 37205, 37542, 37541, 37539, 37538) AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(37205, 0, 0, 0, 0, 0, 100, 30, 5000, 7000, 15000, 15000, 11, 67541, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thalorien - Filotormenta'),
(37205, 0, 1, 0, 0, 0, 100, 0, 2000, 2000, 13000, 13000, 11, 67542, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thalorien - Golpe mortal'),
(37205, 0, 2, 0, 0, 0, 100, 0, 19000, 19000, 19000, 19000, 11, 67716, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Thalorien - Torbellino'),
(37205, 0, 3, 0, 0, 0, 100, 0, 1000, 1000, 8000, 8000, 11, 57846, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Thalorien - Golpe heroico'),
(37542, 0, 0, 0, 0, 0, 100, 30, 2000, 3000, 9000, 10000, 11, 50688, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Morlen Manosfrias - Golpe de peste'),
(37541, 0, 0, 0, 0, 0, 100, 30, 1000, 2000, 4000, 5000, 11, 31600, 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Asaltante de la cripta - Escarabajos de la cripta'),
(37539, 0, 0, 0, 0, 0, 100, 30, 1000, 2000, 9000, 10000, 11, 38056, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Invasor necrofago - Desgarrar carne'),
(37538, 0, 0, 0, 0, 0, 100, 30, 1000, 2000, 9000, 10000, 11, 49861, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Zombi de la plaga - Mordedura infectada');
-- Loot 
DELETE FROM `creature_loot_template` WHERE (`entry`=37158);
INSERT INTO `creature_loot_template` VALUES 
(37158, 50254, -100, 1, 0, 1, 1);

UPDATE `quest_template` SET `RequiredClasses`=431, `RequiredRaces`=1101 WHERE `Id`=24553;
UPDATE `quest_template` SET `RequiredClasses`=431, `RequiredRaces`=178 WHERE `Id`=24564;
UPDATE `quest_template` SET `RequiredClasses`=1519, `RequiredRaces`=512 WHERE `Id`=24594;
UPDATE `quest_template` SET `RequiredClasses`=1104, `RequiredRaces`=1101 WHERE `Id`=24595;
UPDATE `quest_template` SET `RequiredClasses`=16, `RequiredRaces`=512 WHERE `Id`=24596;
UPDATE `quest_template` SET `RequiredClasses`=1104, `RequiredRaces`=178 WHERE `Id`=24598;
UPDATE `quest_template` SET `RequiredClasses`=35, `RequiredRaces`=0 WHERE `Id`=24545;

DELETE FROM `creature_loot_template` WHERE (`entry`=37158);
INSERT INTO `creature_loot_template` VALUES 
(37158, 50254, -100, 1, 0, 1, 1);


-- ItemScripts
UPDATE `item_template` SET `ScriptName` = 'item_tainted_queldelar' WHERE `entry` IN (49879,49889);

-- Templates
DELETE FROM `creature_template` WHERE entry IN (37523, 36991, 37746, 37763, 37764, 37765, 37781, 38056);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('37523', 0, 0, 0, 0, 0, 30628, 30629, 30630, 30631, 'Warden of the Sunwell', '', '', 0, 80, 80, 0, 35, 35, 1, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_sunwell_warder', 12340),
('36991','0','0','0','0','0','21460','0','0','0','Sunwell Guardian','','','0','80','80','0','35','35','0','1','1.14286','1','0','0','0','0','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','9','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','3.45002','1','1','0','0','0','0','0','0','0','144','1','0','0','0','','12340'),
('37746','0','0','0','0','0','20570','17612','0','0','Sunwell Caster Bunny','','','0','1','1','0','114','114','0','1','1.14286','0.72','0','0','0','0','0','1','0','0','1','33554432','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','130','','12340'),
('37763','0','0','0','0','0','19706','0','0','0','Grand Magister Rommath','','','0','80','80','0','35','35','0','1','1.14286','1','3','0','0','0','0','1','0','0','2','0','0','0','0','0','0','0','0','0','0','7','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','261.78','15.8145','1','0','0','0','0','0','0','0','0','1','897','0','0','','12340'),
('37764','0','0','0','0','0','17122','0','0','0','Lor\'themar Theron','Regent Lord of Quel\'Thalas','','0','80','80','0','35','35','0','1','1.14286','1','3','0','0','0','0','1','0','0','2','0','0','0','0','0','0','0','0','0','0','7','76','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1305.56','64.4067','1','1','0','0','0','0','0','0','0','1','2209','0','0','','12340'),
('37765','0','0','0','0','0','18146','0','0','0','Captain Auric Sunchaser','High Elf Representative','','0','80','80','0','35','35','0','1','1.14286','1','0','0','0','0','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','3.45002','1','1','0','0','0','0','0','0','0','0','1','481','0','0','','12340'),
('37781','0','0','0','0','0','15511','0','0','0','Sunwell Honor Guard','','Directions','0','80','80','0','35','35','0','1','1.14286','1','1','0','0','0','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','7.076','1','1','0','0','0','0','0','0','0','144','1','0','0','0','','12340'),
('38056','0','0','0','0','0','21008','0','0','0','Chamberlain Galiros','','','0','80','80','0','35','35','1','1','1.14286','1','0','0','0','0','0','1','0','0','2','0','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','2.94806','2','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_queldelar_sp','12340');

DELETE FROM `gameobject_template` WHERE (`entry`=195682);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
(195682, 10, 8111, 'Portal to Dalaran', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 68328, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_dalaran_portal_sunwell', 12340);

-- Spawns
SET @guid := 14568560;
DELETE FROM `creature` WHERE id IN (37523, 36991, 37746, 37763, 37765, 37765, 37781, 38056);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid,'37781','580','1','2','0','0','1720.53','615.576','28.0503','5.59377','300','0','0','126','0','0','0','0','0'),
(@guid+1,'37781','580','1','2','0','0','1686.59','644.382','28.1838','2.15293','300','0','0','126','0','0','0','0','0'),
(@guid+2,'37781','580','1','2','0','0','1658.78','629.876','28.3649','5.07855','300','0','0','126','0','0','0','0','0'),
(@guid+3,'36991','580','1','2','0','0','1739.09','717.696','71.1903','4.4777','300','0','0','84','0','0','0','0','0'),
(@guid+4,'36991','580','1','2','0','0','1761.82','707.575','71.1904','3.84232','300','0','0','84','0','0','0','0','0'),
(@guid+5,'36991','580','1','2','0','0','1778.09','692.973','71.1904','3.73393','300','0','0','84','0','0','0','0','0'),
(@guid+6,'37746','580','1','2','0','0','1698.45','628.03','28.1989','3.47949','300','0','0','42','0','0','0','33554432','0'),
(@guid+7,'36991','580','1','2','0','0','1653.57','634.692','28.0849','0.171978','300','0','0','84','0','0','0','0','0'),
(@guid+8,'36991','580','1','2','0','0','1693.99','674.897','28.0503','4.67702','300','0','0','84','0','0','0','0','0'),
(@guid+9,'36991','580','1','2','0','0','1745.8','622.226','28.0503','3.07638','300','0','0','84','0','0','0','0','0'),
(@guid+10,'36991','580','1','2','0','0','1704.76','583.796','28.1657','1.71842','300','0','0','84','0','0','0','0','0'),
(@guid+11,'36991','580','1','2','0','0','1612.32','606.707','33.3215','0.314329','300','0','0','84','0','0','0','0','0'),
(@guid+12,'36991','580','1','2','0','0','1621.18','584.858','33.3215','0.42507','300','0','0','84','0','0','0','0','0'),
(@guid+13,'36991','580','1','2','0','0','1634.67','563.787','33.3215','0.774572','300','0','0','84','0','0','0','0','0'),
(@guid+14,'36991','580','1','2','0','0','1651.28','548.805','33.3215','0.998411','300','0','0','84','0','0','0','0','0'),
(@guid+15,'37781','580','1','2','0','0','1680.19','620.726','28.1394','3.53524','300','0','0','126','0','0','0','0','0'),
(@guid+16,'37763','580','1','2','0','897','1662.56','622.758','28.0502','4.86257','300','0','0','8200','1200','0','0','0','0'),
(@guid+17,'38056','580','1','2','0','0','1671.49','606.427','28.0504','3.83603','300','0','0','41','60','0','0','0','0'),
(@guid+18,'37764','580','1','2','0','0','1665.9','624.107','28.0504','5.00237','300','0','0','16400','1800','0','0','0','0'),
(@guid+19,'37765','580','1','2','0','0','1703.85','602.353','28.0503','2.64381','300','0','0','42','0','0','0','0','0'),
(@guid+20,'37781','580','1','2','0','0','1666.81','631.886','28.0502','4.56725','300','0','0','126','0','0','0','0','0'),
(@guid+21,'37781','580','1','2','0','0','1659.63','625.187','28.2451','1.65029','300','0','0','126','0','0','0','0','0'),
(@guid+22,'37781','580','1','2','0','0','1671.96','631.276','28.0503','4.46279','300','0','0','126','0','0','0','0','0'),
(@guid+23,'37781','580','1','2','0','0','1671.33','624.754','28.0503','1.472','300','0','0','126','0','0','0','0','0'),
(@guid+24,'37781','580','1','2','0','0','1696.11','608.161','28.1093','4.55154','300','0','0','126','0','0','0','0','0');

DELETE FROM `gameobject` WHERE id IN (195682);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('463134','195682','580','1','2','1669.68','663.748','28.0503','5.2859','0','0','0.478235','-0.878232','300','0','1'),
('463136','195682','580','1','2','1734.47','596.174','28.0503','2.33751','0','0','0.920264','0.391297','300','0','1');

-- Says
SET @entry := -1380561;
DELETE FROM script_texts WHERE entry BETWEEN -1380572 AND -1380561;
INSERT INTO script_texts (entry, content_default, emote) VALUES
(@entry, 'My lords and ladies, I present $N, bearer of Quel\'Delar.', 0),
(@entry - 1, 'Can that really be Quel\'Delar?', 0),
(@entry - 2, 'We shall see.', 0),
(@entry - 3, 'Look at it, Lor\'themar. It is certainly Quel\'Delar.', 1),
(@entry - 4, 'So it is. You have my thanks, $N, for restoring Quel\'Delar to its rightful owners', 0),
(@entry - 5, 'What is the meaning of this treachery?', 0),
(@entry - 6, 'Drop your weapon and surrender, traitor.', 0),
(@entry - 7, 'This is not my doing, Rommath. There is no treachery here.', 0),
(@entry - 8, 'Call off your men. Lor\'themar\'s own foolishness caused his injuries. Quel\'Delar is not chosen; it chooses its master.', 0),
(@entry - 9, 'Guards, return to your posts.', 0),
(@entry - 10,'You will have what you have come for, $N. Take the sword and begone. And you, Auric, have a care for what you say in this sacred place.', 0),
(@entry - 11,'Carry the sword back to Dalaran through that portal, $N. You have done what many quel\'dorei have dreamt of for years. Quel\'Delar has been restored at last.',0);

UPDATE creature_template SET unit_flags = 64 WHERE entry in (38177, 38176, 38175, 38174, 38173, 38172);
UPDATE creature_template SET equipment_id = 2425 WHERE entry = 37226;
