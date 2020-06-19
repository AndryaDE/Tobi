#cs
[x-pos, y-pos, red, green, blue, tolerance_red, tolerance_green, tolerance_blue]
#ce

#include-once
#include "..\Config\AutoIt.au3"

#region Overworld
Local $__adlr_overworld1 = [1009, 114, 60, 232, 234, 3, 5, 5]
Local $__adlr_overworld2 = [1146,  62, 60, 232, 234, 3, 5, 5]
Global Const $OVERWORLD[2] = [$__adlr_overworld1, $__adlr_overworld2]
#endregion
#region Battle
Local $__adlr_battle1 = [ 497, 557,  255, 167,  50,   5, 10, 10]
Local $__adlr_battle2 = [ 494, 615,   28, 209, 211,  20,  9,  5]
Global Const $BATTLE = [$__adlr_battle1, $__adlr_battle2]

;~ Local $__adlr_battle1 = [1079, 628,  106, 106, 106,   3,  3,  3]
;~ Local $__adlr_battle2 = [1079, 629,  132, 132, 132,   3,  3,  3]
;~ Local $__adlr_battle3 = [ 497, 557,  255, 167,  50,  25, 50, 50]
;~ Local $__adlr_battle4 = [ 494, 615,   28, 209, 211, 100, 45, 25]
;~ Global Const $BATTLE = [$__adlr_battle1, $__adlr_battle2]

Local $__adlr_battle_choose_target1_eng = [  86, 553,  255, 255, 255,   1,  1,  1]
Local $__adlr_battle_choose_target2_eng = [ 141, 553,  255, 255, 255,   1,  1,  1]
Local $__adlr_battle_choose_target3_eng = [ 189, 558,  255, 255, 255,   1,  1,  1]
Local $__adlr_battle_choose_target4_eng = [ 149, 578,    0,   0,   0, 254,254,254]
Global Const $BATTLE_CHOOSE_TARGET_ENG = [$__adlr_battle_choose_target1_eng, $__adlr_battle_choose_target2_eng, $__adlr_battle_choose_target3_eng, $__adlr_battle_choose_target4_eng]
Global $BATTLE_CHOOSE_TARGET = $BATTLE_CHOOSE_TARGET_ENG

Local $__adlr_battle_tem1_alive1 = [  29, 453,   30,  30,  30,   3,  3,  3]
Local $__adlr_battle_tem1_alive2 = [ 198, 454,   30,  30,  30,   3,  3,  3]
Global Const $BATTLE_TEM1_ALIVE = [$__adlr_battle_tem1_alive1, $__adlr_battle_tem1_alive2]

Local $__adlr_battle_tem2_alive1 = [ 282, 487,   30,  30,  30,   3,  3,  3]
Local $__adlr_battle_tem2_alive2 = [ 450, 488,   30,  30,  30,   3,  3,  3]
Global Const $BATTLE_TEM2_ALIVE = [$__adlr_battle_tem2_alive1, $__adlr_battle_tem2_alive2]

Local $__adlr_battle_tem1_selected1 = [  52, 414,   46, 247, 207,   9,  9,  9]
Local $__adlr_battle_tem1_selected2 = [  39, 468,   30,  30,  30,   3,  3,  3]
Global Const $BATTLE_TEM1_SELECTED = [$__adlr_battle_tem1_selected1, $__adlr_battle_tem1_selected2]

Local $__adlr_battle_tem2_selected1 = [ 307, 448,   46, 247, 207,   9,  9,  9]
Local $__adlr_battle_tem2_selected2 = [ 302, 501,   30,  30,  30,   3,  3,  3]
Global Const $BATTLE_TEM2_SELECTED = [$__adlr_battle_tem2_selected1, $__adlr_battle_tem2_selected2]

#endregion
#region Inventory
Local $__adlr_inventory1 = [ 870,  29,   74,  74,  74,   3,  3,  3]
Local $__adlr_inventory2 = [ 284,  32,  155, 155, 155,   3,  3,  3]
Global Const $INVENTORY[2] = [$__adlr_inventory1, $__adlr_inventory2]

Local $__adlr_inventory_capture1 = [ 491,  15, 177, 254, 255,   3,   3,   3]
Local $__adlr_inventory_capture2 = [ 517,  12, 177, 254, 255,   3,   3,   3]
Global Const $INVENTORY_CAPTURE[2] = [$__adlr_inventory_capture1, $__adlr_inventory_capture2]

Local $__adlr_inventory_item1 = [ 427,  45, 177, 254, 255,   3,   3,   3]
Local $__adlr_inventory_item2 = [ 444,  14, 177, 254, 255,   3,   3,   3]
Global Const $INVENTORY_ITEMS[2] = [$__adlr_inventory_item1, $__adlr_inventory_item2]
#endregion
#region Inventory Item
Local $__adlr_item_low1 = [ 979, 142,  30,  30,  30,   1,   1,   1]
Local $__adlr_item_low2 = [ 976, 142,  30,  30,  30,   1,   1,   1]
Global Const $ITEM_LOW[2] = [$__adlr_item_low1, $__adlr_item_low2]

Local $__adlr_item_temcard1 = [ 963, 296,  177, 254, 255,   3,  3,  3]
Local $__adlr_item_temcard2 = [ 760, 285,  177, 254, 255,   3,  3,  3]
Local $__adlr_item_temcard3 = [ 818, 153,  177, 254, 255,   3,  3,  3]
Local $__adlr_item_temcard4 = [ 843, 296,  177, 254, 255,   3,  3,  3]
Global Const $ITEM_TEMCARD = [$__adlr_item_temcard1, $__adlr_item_temcard2, $__adlr_item_temcard3, $__adlr_item_temcard4]

Local $__adlr_item_smokebomb1 = [ 938, 153,  177, 254, 255,   3,  3,  3]
Local $__adlr_item_smokebomb2 = [ 964, 291,  177, 254, 255,   3,  3,  3]
Local $__adlr_item_smokebomb3 = [ 791, 227,  177, 254, 255,   3,  3,  3]
Local $__adlr_item_smokebomb4 = [ 761, 291,  177, 254, 255,   3,  3,  3]
Global Const $ITEM_SMOKEBOMB = [$__adlr_item_smokebomb1, $__adlr_item_smokebomb2, $__adlr_item_smokebomb3, $__adlr_item_smokebomb4]
#endregion
#region Catch
Local $__adlr_catch1 = [ 423, 213,   27, 209, 211,   3,  3,  3]
Local $__adlr_catch2 = [ 891, 198,  255, 147,  56,   3,  3,  3]
Global Const $CATCH = [$__adlr_catch1, $__adlr_catch2]

Local $__adlr_catch_releasing1 = [ 423, 213,   72, 165, 167,   3,  3,  3]
Local $__adlr_catch_releasing2 = [ 891, 198,  197, 125,  80,   3,  3,  3]
Global Const $CATCH_RELEASING[2] = [$__adlr_catch_releasing1, $__adlr_catch_releasing2]

Local $__adlr_catch_sv50vit = [ 920, 236,  27, 209, 211,   5,  5,  5]
Global Const $CATCH_SV50VIT[1] = [$__adlr_catch_sv50vit]

Local $__adlr_catch_sv50sta = [ 920, 260,  27, 209, 211,   5,  5,  5]
Global Const $CATCH_SV50STA[1] = [$__adlr_catch_sv50sta]

Local $__adlr_catch_sv50spd = [ 920, 284,  27, 209, 211,   5,  5,  5]
Global Const $CATCH_SV50SPD[1] = [$__adlr_catch_sv50spd]

Local $__adlr_catch_sv50atk = [ 920, 308,  27, 209, 211,   5,  5,  5]
Global Const $CATCH_SV50ATK[1] = [$__adlr_catch_sv50atk]

Local $__adlr_catch_sv50def = [ 920, 332,  27, 209, 211,   5,  5,  5]
Global Const $CATCH_SV50DEF[1] = [$__adlr_catch_sv50def]

Local $__adlr_catch_sv50spz = [ 920, 356,  27, 209, 211,   5,  5,  5]
Global Const $CATCH_SV50SPZ[1] = [$__adlr_catch_sv50spz]

Local $__adlr_catch_sv50res = [ 920, 380,  27, 209, 211,   5,  5,  5]
Global Const $CATCH_SV50RES[1] = [$__adlr_catch_sv50res]

Local $__adlr_catch_8fert = [ 457, 336,  28, 209, 211,   5,  5,  5]
Global Const $CATCH_8FERT[1] = [$__adlr_catch_8fert]

Local $__adlr_catch_rename1 = [ 404, 207,   91, 171, 172,   3,  3,  3]
Local $__adlr_catch_rename2 = [ 891, 198,  201, 135,  97,   3,  3,  3]
Global Const $CATCH_RENAME[2] = [$__adlr_catch_rename1, $__adlr_catch_rename2]
#endregion
#region NPC
Local $__adlr_npcdialog1 = [ 131, 603,  42,  42,  42, 5, 5, 5]
Local $__adlr_npcdialog2 = [1031, 600,  27, 209, 211, 5, 5, 5]
Global Const $NPCDIALOG[2] = [$__adlr_npcdialog1, $__adlr_npcdialog2]

Local $__adlr_npcdialog_btn12 = [ 883, 342,  27, 209, 211, 5, 5, 5]
Local $__adlr_npcdialog_btn11 = [ 857, 350,  42,  42,  42, 5, 5, 5]
Global Const $NPCDIALOG_BTN1[2] = [$__adlr_npcdialog_btn11, $__adlr_npcdialog_btn12]
#endregion
#region Vendor
Local $__adlr_vendor1 = [ 792,  20,  26,  26,  26, 2, 2, 2]
Local $__adlr_vendor2 = [  80, 424,  20, 123, 123, 5, 3, 3]
Global Const $VENDOR = [$__adlr_vendor1, $__adlr_vendor2]

Local $__adlr_vendorquantity1 = [ 792,  20,  23,  23,  23, 2, 2, 2]
Local $__adlr_vendorquantity2 = [  80, 424,  17, 111, 111, 5, 3, 3]
Global Const $VENDORQUANTITY = [$__adlr_vendorquantity1, $__adlr_vendorquantity2]
#endregion
#region Misc
Local $__adlr_confirmbutton1 = [1092, 636,  173, 173, 173,   3,  3,  3]
Local $__adlr_confirmbutton2 = [1098, 623,   30,  30,  30,   3,  3,  3]
Global Const $CONFIRMBUTTON = [$__adlr_confirmbutton1, $__adlr_confirmbutton2]

Local $__adlr_newtechnique1 = [ 188, 298,   30,  30,  30,   3,  3,  3]
Local $__adlr_newtechnique2 = [ 792, 243,   27, 209, 211,   3,  3,  3]
Global Const $NEWTECHNIQUE = [$__adlr_newtechnique1, $__adlr_newtechnique2]
#endregion
