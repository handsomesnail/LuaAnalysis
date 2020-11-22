测试名称:	TestMethod2
测试结果:	已通过
结果 StandardOutput:	Redirect OK

main <(input2.lua):0,0> (86 instructions at 0606B608)
0+ params, 44 slots, 1 upvalue, 43 locals, 41 constants, 37 functions
	1	[1]	GETTABUP 	0 0 -1	; _ENV "require"
	2	[1]	LOADK    	1 -2	; "Common/game"
	3	[1]	CALL     	0 2 2
	4	[4]	LOADK    	1 -3	; 2018040
	5	[5]	LOADK    	2 -4	; 11077302
	6	[8]	LOADNIL  	3 30
	7	[41]	LOADBOOL 	34 0 0
	8	[42]	LOADBOOL 	35 0 0
	9	[43]	LOADBOOL 	36 0 0
	10	[44]	LOADBOOL 	37 0 0
	11	[45]	LOADNIL  	38 4
	12	[92]	CLOSURE  	43 0	; 0606B888
	13	[51]	SETTABUP 	0 -5 43	; _ENV "awake"
	14	[96]	CLOSURE  	43 1	; 0606BA08
	15	[94]	SETTABUP 	0 -6 43	; _ENV "initData"
	16	[101]	CLOSURE  	43 2	; 0606B388
	17	[98]	SETTABUP 	0 -7 43	; _ENV "onShow"
	18	[124]	CLOSURE  	43 3	; 0606B988
	19	[103]	SETTABUP 	0 -8 43	; _ENV "requestData"
	20	[174]	CLOSURE  	43 4	; 0606D108
	21	[126]	SETTABUP 	0 -9 43	; _ENV "onDataResponse"
	22	[218]	CLOSURE  	43 5	; 0606CA88
	23	[176]	SETTABUP 	0 -10 43	; _ENV "updateProcess"
	24	[244]	CLOSURE  	43 6	; 0606CB88
	25	[220]	SETTABUP 	0 -11 43	; _ENV "convertArrangedFurnitures"
	26	[287]	CLOSURE  	43 7	; 0606CF08
	27	[246]	SETTABUP 	0 -12 43	; _ENV "convertBagFurnitures"
	28	[302]	CLOSURE  	43 8	; 0606C688
	29	[289]	SETTABUP 	0 -13 43	; _ENV "findFurnitureBySeq"
	30	[317]	CLOSURE  	43 9	; 0606CC08
	31	[304]	SETTABUP 	0 -14 43	; _ENV "findFurnitureById"
	32	[334]	CLOSURE  	43 10	; 0606D188
	33	[319]	SETTABUP 	0 -15 43	; _ENV "getDiffFurnitureBySeq"
	34	[348]	CLOSURE  	43 11	; 0606CD08
	35	[336]	SETTABUP 	0 -16 43	; _ENV "updateFurnitures"
	36	[362]	CLOSURE  	43 12	; 0606CC88
	37	[350]	SETTABUP 	0 -17 43	; _ENV "addFurnitureToHouse"
	38	[385]	CLOSURE  	43 13	; 0606C908
	39	[364]	SETTABUP 	0 -18 43	; _ENV "dragFurnitureFromStorageCallback"
	40	[409]	CLOSURE  	43 14	; 0606C988
	41	[387]	SETTABUP 	0 -19 43	; _ENV "getNextFurnitureSeq"
	42	[418]	CLOSURE  	43 15	; 0606C488
	43	[411]	SETTABUP 	0 -20 43	; _ENV "onItemSelectedCallback"
	44	[434]	CLOSURE  	43 16	; 0606C388
	45	[420]	SETTABUP 	0 -21 43	; _ENV "onItemStoreCallback"
	46	[442]	CLOSURE  	43 17	; 0606C508
	47	[436]	SETTABUP 	0 -22 43	; _ENV "updateFurnitureSelectedStatus"
	48	[458]	CLOSURE  	43 18	; 0606C588
	49	[444]	SETTABUP 	0 -23 43	; _ENV "onItemBeginDragEvent"
	50	[470]	CLOSURE  	43 19	; 0606CB08
	51	[460]	SETTABUP 	0 -24 43	; _ENV "onItemDragEvent"
	52	[490]	CLOSURE  	43 20	; 0606C788
	53	[472]	SETTABUP 	0 -25 43	; _ENV "onItemEndDragEvent"
	54	[500]	CLOSURE  	43 21	; 0606C608
	55	[492]	SETTABUP 	0 -26 43	; _ENV "getDragMousePosition"
	56	[504]	CLOSURE  	43 22	; 0606C808
	57	[502]	SETTABUP 	0 -27 43	; _ENV "updateMap"
	58	[546]	CLOSURE  	43 23	; 0606CD88
	59	[506]	SETTABUP 	0 -28 43	; _ENV "onMapLoaded"
	60	[576]	CLOSURE  	43 24	; 0606CE88
	61	[548]	SETTABUP 	0 -29 43	; _ENV "calValidPosition"
	62	[580]	CLOSURE  	43 25	; 015B3D50
	63	[578]	SETTABUP 	0 -30 43	; _ENV "onHousePointerClickEvent"
	64	[591]	CLOSURE  	43 26	; 015B3550
	65	[582]	SETTABUP 	0 -31 43	; _ENV "onHouseBeginDragEvent"
	66	[606]	CLOSURE  	43 27	; 015B3850
	67	[593]	SETTABUP 	0 -32 43	; _ENV "onHouseDragEvent"
	68	[618]	CLOSURE  	43 28	; 08189580
	69	[608]	SETTABUP 	0 -33 43	; _ENV "onHouseEndDragEvent"
	70	[623]	CLOSURE  	43 29	; 08188B00
	71	[620]	SETTABUP 	0 -34 43	; _ENV "onHide"
	72	[634]	CLOSURE  	43 30	; 08189700
	73	[626]	SETTABUP 	0 -35 43	; _ENV "onPartyButtonClicked"
	74	[640]	CLOSURE  	43 31	; 08189680
	75	[636]	SETTABUP 	0 -36 43	; _ENV "getPartyReward"
	76	[644]	CLOSURE  	43 32	; 08189380
	77	[642]	SETTABUP 	0 -37 43	; _ENV "onBackButtonClicked"
	78	[652]	CLOSURE  	43 33	; 08188F00
	79	[646]	SETTABUP 	0 -38 43	; _ENV "convertVector2ToProtoPoint"
	80	[660]	CLOSURE  	43 34	; 08189400
	81	[654]	SETTABUP 	0 -39 43	; _ENV "onShowUIButtonClicked"
	82	[668]	CLOSURE  	43 35	; 08188A80
	83	[662]	SETTABUP 	0 -40 43	; _ENV "onHideUIButtonClicked"
	84	[679]	CLOSURE  	43 36	; 08189280
	85	[670]	SETTABUP 	0 -41 43	; _ENV "onDestroy"
	86	[679]	RETURN   	0 1
constants (41) for 0606B608:
	1	"require"
	2	"Common/game"
	3	2018040
	4	11077302
	5	"awake"
	6	"initData"
	7	"onShow"
	8	"requestData"
	9	"onDataResponse"
	10	"updateProcess"
	11	"convertArrangedFurnitures"
	12	"convertBagFurnitures"
	13	"findFurnitureBySeq"
	14	"findFurnitureById"
	15	"getDiffFurnitureBySeq"
	16	"updateFurnitures"
	17	"addFurnitureToHouse"
	18	"dragFurnitureFromStorageCallback"
	19	"getNextFurnitureSeq"
	20	"onItemSelectedCallback"
	21	"onItemStoreCallback"
	22	"updateFurnitureSelectedStatus"
	23	"onItemBeginDragEvent"
	24	"onItemDragEvent"
	25	"onItemEndDragEvent"
	26	"getDragMousePosition"
	27	"updateMap"
	28	"onMapLoaded"
	29	"calValidPosition"
	30	"onHousePointerClickEvent"
	31	"onHouseBeginDragEvent"
	32	"onHouseDragEvent"
	33	"onHouseEndDragEvent"
	34	"onHide"
	35	"onPartyButtonClicked"
	36	"getPartyReward"
	37	"onBackButtonClicked"
	38	"convertVector2ToProtoPoint"
	39	"onShowUIButtonClicked"
	40	"onHideUIButtonClicked"
	41	"onDestroy"
locals (43) for 0606B608:
	0	game	4	87
	1	mapId	5	87
	2	startPartyDialogId	6	87
	3	bgContainer	7	87
	4	furnitureList	7	87
	5	houseEvtUtil	7	87
	6	editPanel	7	87
	7	bottom	7	87
	8	houseUIContainer	7	87
	9	houseContentScope	7	87
	10	furnitureProcessText	7	87
	11	ninjaProcessText	7	87
	12	partyButton	7	87
	13	partyRewardRedDot	7	87
	14	receivedTag	7	87
	15	backButton	7	87
	16	showUIButton	7	87
	17	hideUIButton	7	87
	18	switchUIArea	7	87
	19	uiContent	7	87
	20	activityId	7	87
	21	activityData	7	87
	22	taskChapter	7	87
	23	taskSection	7	87
	24	dragingObject	7	87
	25	dragingObjectMouseOffset	7	87
	26	dragingObjectOriginalPos	7	87
	27	dragingObjectSeq	7	87
	28	dragingFromStorageSeq	7	87
	29	camera	7	87
	30	bagFurnitures	7	87
	31	arrangedFurnitures	7	87
	32	mapResCache	7	87
	33	worldModel	7	87
	34	closeAfterSave	8	87
	35	closeFailed	9	87
	36	reEnterHouseAfterClose	10	87
	37	haveLoadDifferentMapRes	11	87
	38	currentSelectedItemSeq	12	87
	39	minPositionX	12	87
	40	maxPositionX	12	87
	41	minPositionY	12	87
	42	maxPositionY	12	87
upvalues (1) for 0606B608:
	0	_ENV	1	0

function <(input2.lua):51,92> (137 instructions at 0606B888)
0 params, 5 slots, 22 upvalues, 1 local, 48 constants, 0 functions
	1	[52]	LOADNIL  	0 0
	2	[54]	GETTABUP 	1 1 -1	; _ENV "bgContainerObj"
	3	[54]	SETUPVAL 	1 0	; bgContainer
	4	[55]	GETTABUP 	1 3 -2	; game "getComponent"
	5	[55]	GETTABUP 	2 1 -3	; _ENV "furnitureListObj"
	6	[55]	LOADK    	3 -4	; "MaouStaticList"
	7	[55]	CALL     	1 3 2
	8	[55]	SETUPVAL 	1 2	; furnitureList
	9	[56]	GETTABUP 	1 3 -2	; game "getComponent"
	10	[56]	GETTABUP 	2 1 -5	; _ENV "houseContentObj"
	11	[56]	LOADK    	3 -6	; "EvtUtil"
	12	[56]	CALL     	1 3 2
	13	[56]	SETUPVAL 	1 4	; houseEvtUtil
	14	[57]	GETTABUP 	1 3 -2	; game "getComponent"
	15	[57]	GETTABUP 	2 1 -7	; _ENV "editPanelObj"
	16	[57]	LOADK    	3 -8	; "LuaBehaviour"
	17	[57]	CALL     	1 3 2
	18	[57]	SETUPVAL 	1 5	; editPanel
	19	[58]	GETTABUP 	1 1 -9	; _ENV "houseUIContainerObj"
	20	[58]	SETUPVAL 	1 6	; houseUIContainer
	21	[59]	GETTABUP 	1 1 -10	; _ENV "houseContentScopeObj"
	22	[59]	SETUPVAL 	1 7	; houseContentScope
	23	[60]	GETTABUP 	1 3 -2	; game "getComponent"
	24	[60]	GETTABUP 	2 1 -11	; _ENV "furnitureProcessTextObj"
	25	[60]	GETTABUP 	3 1 -12	; _ENV "CS"
	26	[60]	GETTABLE 	3 3 -13	; "UnityEngine"
	27	[60]	GETTABLE 	3 3 -14	; "UI"
	28	[60]	GETTABLE 	3 3 -15	; "Text"
	29	[60]	CALL     	1 3 2
	30	[60]	SETUPVAL 	1 8	; furnitureProcessText
	31	[61]	GETTABUP 	1 3 -2	; game "getComponent"
	32	[61]	GETTABUP 	2 1 -16	; _ENV "ninjaProcessTextObj"
	33	[61]	GETTABUP 	3 1 -12	; _ENV "CS"
	34	[61]	GETTABLE 	3 3 -13	; "UnityEngine"
	35	[61]	GETTABLE 	3 3 -14	; "UI"
	36	[61]	GETTABLE 	3 3 -15	; "Text"
	37	[61]	CALL     	1 3 2
	38	[61]	SETUPVAL 	1 9	; ninjaProcessText
	39	[62]	GETTABUP 	1 3 -2	; game "getComponent"
	40	[62]	GETTABUP 	2 1 -17	; _ENV "partyButtonObj"
	41	[62]	LOADK    	3 -18	; "MaouButton"
	42	[62]	CALL     	1 3 2
	43	[62]	SETUPVAL 	1 10	; partyButton
	44	[63]	GETTABUP 	1 1 -19	; _ENV "partyRewardRedDotObj"
	45	[63]	SETUPVAL 	1 11	; partyRewardRedDot
	46	[64]	GETTABUP 	1 1 -20	; _ENV "receivedTagObj"
	47	[64]	SETUPVAL 	1 12	; receivedTag
	48	[65]	GETTABUP 	1 1 -21	; _ENV "bottomObj"
	49	[65]	SETUPVAL 	1 13	; bottom
	50	[66]	GETTABUP 	1 3 -2	; game "getComponent"
	51	[66]	GETTABUP 	2 1 -22	; _ENV "backButtonObj"
	52	[66]	LOADK    	3 -18	; "MaouButton"
	53	[66]	CALL     	1 3 2
	54	[66]	SETUPVAL 	1 14	; backButton
	55	[67]	GETTABUP 	1 3 -2	; game "getComponent"
	56	[67]	GETTABUP 	2 1 -23	; _ENV "showUIButtonObj"
	57	[67]	LOADK    	3 -18	; "MaouButton"
	58	[67]	CALL     	1 3 2
	59	[67]	SETUPVAL 	1 15	; showUIButton
	60	[68]	GETTABUP 	1 3 -2	; game "getComponent"
	61	[68]	GETTABUP 	2 1 -24	; _ENV "hideUIButtonObj"
	62	[68]	LOADK    	3 -18	; "MaouButton"
	63	[68]	CALL     	1 3 2
	64	[68]	SETUPVAL 	1 16	; hideUIButton
	65	[69]	GETTABUP 	1 1 -25	; _ENV "switchUIAreaObj"
	66	[69]	SETUPVAL 	1 17	; switchUIArea
	67	[70]	GETTABUP 	1 1 -26	; _ENV "uiContentObj"
	68	[70]	SETUPVAL 	1 18	; uiContent
	69	[72]	GETUPVAL 	1 4	; houseEvtUtil
	70	[72]	SELF     	1 1 -27	; "OnPointerClickEvent"
	71	[72]	LOADK    	3 -28	; "+"
	72	[72]	GETTABUP 	4 1 -29	; _ENV "onHousePointerClickEvent"
	73	[72]	CALL     	1 4 1
	74	[73]	GETUPVAL 	1 4	; houseEvtUtil
	75	[73]	SELF     	1 1 -30	; "OnBeginDragEvent"
	76	[73]	LOADK    	3 -28	; "+"
	77	[73]	GETTABUP 	4 1 -31	; _ENV "onHouseBeginDragEvent"
	78	[73]	CALL     	1 4 1
	79	[74]	GETUPVAL 	1 4	; houseEvtUtil
	80	[74]	SELF     	1 1 -32	; "OnDragEvent"
	81	[74]	LOADK    	3 -28	; "+"
	82	[74]	GETTABUP 	4 1 -33	; _ENV "onHouseDragEvent"
	83	[74]	CALL     	1 4 1
	84	[75]	GETUPVAL 	1 4	; houseEvtUtil
	85	[75]	SELF     	1 1 -34	; "OnEndDragEvent"
	86	[75]	LOADK    	3 -28	; "+"
	87	[75]	GETTABUP 	4 1 -35	; _ENV "onHouseEndDragEvent"
	88	[75]	CALL     	1 4 1
	89	[76]	GETTABUP 	1 10 -36	; partyButton "onClick"
	90	[76]	SELF     	1 1 -37	; "AddListener"
	91	[76]	GETTABUP 	3 1 -38	; _ENV "onPartyButtonClicked"
	92	[76]	CALL     	1 3 1
	93	[77]	GETTABUP 	1 14 -36	; backButton "onClick"
	94	[77]	SELF     	1 1 -37	; "AddListener"
	95	[77]	GETTABUP 	3 1 -39	; _ENV "onBackButtonClicked"
	96	[77]	CALL     	1 3 1
	97	[78]	GETTABUP 	1 15 -36	; showUIButton "onClick"
	98	[78]	SELF     	1 1 -37	; "AddListener"
	99	[78]	GETTABUP 	3 1 -40	; _ENV "onShowUIButtonClicked"
	100	[78]	CALL     	1 3 1
	101	[79]	GETTABUP 	1 16 -36	; hideUIButton "onClick"
	102	[79]	SELF     	1 1 -37	; "AddListener"
	103	[79]	GETTABUP 	3 1 -41	; _ENV "onHideUIButtonClicked"
	104	[79]	CALL     	1 3 1
	105	[81]	LOADNIL  	1 0
	106	[81]	SETUPVAL 	1 19	; dragingObject
	107	[82]	GETTABUP 	1 3 -42	; game "cache"
	108	[82]	LOADK    	2 -43	; "MapResCache"
	109	[82]	CALL     	1 2 2
	110	[82]	SETUPVAL 	1 20	; mapResCache
	111	[83]	GETTABUP 	1 3 -44	; game "model"
	112	[83]	LOADK    	2 -45	; "WorldModel"
	113	[83]	CALL     	1 2 2
	114	[83]	SETUPVAL 	1 21	; worldModel
	115	[85]	GETTABUP 	1 3 -46	; game "active"
	116	[85]	GETUPVAL 	2 10	; partyButton
	117	[85]	LOADBOOL 	3 0 0
	118	[85]	CALL     	1 3 1
	119	[86]	GETTABUP 	1 3 -46	; game "active"
	120	[86]	GETUPVAL 	2 12	; receivedTag
	121	[86]	LOADBOOL 	3 0 0
	122	[86]	CALL     	1 3 1
	123	[87]	GETTABUP 	1 3 -46	; game "active"
	124	[87]	GETUPVAL 	2 11	; partyRewardRedDot
	125	[87]	LOADBOOL 	3 0 0
	126	[87]	CALL     	1 3 1
	127	[88]	GETTABUP 	1 3 -46	; game "active"
	128	[88]	GETUPVAL 	2 16	; hideUIButton
	129	[88]	LOADBOOL 	3 1 0
	130	[88]	CALL     	1 3 1
	131	[89]	GETTABUP 	1 3 -46	; game "active"
	132	[89]	GETUPVAL 	2 15	; showUIButton
	133	[89]	LOADBOOL 	3 0 0
	134	[89]	CALL     	1 3 1
	135	[90]	SETTABUP 	8 -47 -48	; furnitureProcessText "text" ""
	136	[91]	SETTABUP 	9 -47 -48	; ninjaProcessText "text" ""
	137	[92]	RETURN   	0 1
constants (48) for 0606B888:
	1	"bgContainerObj"
	2	"getComponent"
	3	"furnitureListObj"
	4	"MaouStaticList"
	5	"houseContentObj"
	6	"EvtUtil"
	7	"editPanelObj"
	8	"LuaBehaviour"
	9	"houseUIContainerObj"
	10	"houseContentScopeObj"
	11	"furnitureProcessTextObj"
	12	"CS"
	13	"UnityEngine"
	14	"UI"
	15	"Text"
	16	"ninjaProcessTextObj"
	17	"partyButtonObj"
	18	"MaouButton"
	19	"partyRewardRedDotObj"
	20	"receivedTagObj"
	21	"bottomObj"
	22	"backButtonObj"
	23	"showUIButtonObj"
	24	"hideUIButtonObj"
	25	"switchUIAreaObj"
	26	"uiContentObj"
	27	"OnPointerClickEvent"
	28	"+"
	29	"onHousePointerClickEvent"
	30	"OnBeginDragEvent"
	31	"onHouseBeginDragEvent"
	32	"OnDragEvent"
	33	"onHouseDragEvent"
	34	"OnEndDragEvent"
	35	"onHouseEndDragEvent"
	36	"onClick"
	37	"AddListener"
	38	"onPartyButtonClicked"
	39	"onBackButtonClicked"
	40	"onShowUIButtonClicked"
	41	"onHideUIButtonClicked"
	42	"cache"
	43	"MapResCache"
	44	"model"
	45	"WorldModel"
	46	"active"
	47	"text"
	48	""
locals (1) for 0606B888:
	0	i	2	138
upvalues (22) for 0606B888:
	0	bgContainer	1	3
	1	_ENV	0	0
	2	furnitureList	1	4
	3	game	1	0
	4	houseEvtUtil	1	5
	5	editPanel	1	6
	6	houseUIContainer	1	8
	7	houseContentScope	1	9
	8	furnitureProcessText	1	10
	9	ninjaProcessText	1	11
	10	partyButton	1	12
	11	partyRewardRedDot	1	13
	12	receivedTag	1	14
	13	bottom	1	7
	14	backButton	1	15
	15	showUIButton	1	16
	16	hideUIButton	1	17
	17	switchUIArea	1	18
	18	uiContent	1	19
	19	dragingObject	1	24
	20	mapResCache	1	32
	21	worldModel	1	33

function <(input2.lua):94,96> (3 instructions at 0606BA08)
1 param, 2 slots, 1 upvalue, 1 local, 1 constant, 0 functions
	1	[95]	GETTABLE 	1 0 -1	; 0
	2	[95]	SETUPVAL 	1 0	; activityId
	3	[96]	RETURN   	0 1
constants (1) for 0606BA08:
	1	0
locals (1) for 0606BA08:
	0	params	1	4
upvalues (1) for 0606BA08:
	0	activityId	1	20

function <(input2.lua):98,101> (12 instructions at 0606B388)
0 params, 3 slots, 3 upvalues, 0 locals, 8 constants, 0 functions
	1	[99]	GETTABUP 	0 1 -1	; game "getParentComponent"
	2	[99]	GETTABUP 	1 2 -2	; _ENV "self"
	3	[99]	GETTABLE 	1 1 -3	; "gameObject"
	4	[99]	GETTABUP 	2 2 -4	; _ENV "CS"
	5	[99]	GETTABLE 	2 2 -5	; "UnityEngine"
	6	[99]	GETTABLE 	2 2 -6	; "Camera"
	7	[99]	CALL     	0 3 2
	8	[99]	SETUPVAL 	0 0	; camera
	9	[100]	GETTABUP 	0 2 -7	; _ENV "requestData"
	10	[100]	LOADK    	1 -8	; 1
	11	[100]	CALL     	0 2 1
	12	[101]	RETURN   	0 1
constants (8) for 0606B388:
	1	"getParentComponent"
	2	"self"
	3	"gameObject"
	4	"CS"
	5	"UnityEngine"
	6	"Camera"
	7	"requestData"
	8	1
locals (0) for 0606B388:
upvalues (3) for 0606B388:
	0	camera	1	29
	1	game	1	0
	2	_ENV	0	0

function <(input2.lua):103,124> (32 instructions at 0606B988)
6 params, 12 slots, 3 upvalues, 7 locals, 13 constants, 0 functions
	1	[104]	LOADNIL  	6 0
	2	[106]	NEWTABLE 	7 0 0
	3	[106]	MOVE     	6 7
	4	[107]	GETTABUP 	7 0 -2	; game "getCommActivityReq"
	5	[107]	GETUPVAL 	8 1	; activityId
	6	[107]	MOVE     	9 0
	7	[107]	CALL     	7 3 2
	8	[107]	SETTABLE 	6 -1 7	; "comm" -
	9	[108]	EQ       	1 1 -3	; - nil
	10	[108]	JMP      	0 1	; to 12
	11	[109]	SETTABLE 	6 -4 1	; "seq_id" -
	12	[111]	EQ       	1 2 -3	; - nil
	13	[111]	JMP      	0 1	; to 15
	14	[112]	SETTABLE 	6 -5 2	; "item_id" -
	15	[114]	EQ       	1 3 -3	; - nil
	16	[114]	JMP      	0 1	; to 18
	17	[115]	SETTABLE 	6 -6 3	; "pos" -
	18	[117]	EQ       	0 0 -7	; - 2
	19	[117]	JMP      	0 6	; to 26
	20	[118]	NEWTABLE 	7 0 0
	21	[118]	SETTABLE 	6 -8 7	; "get_task_reward" -
	22	[119]	GETTABLE 	7 6 -8	; "get_task_reward"
	23	[119]	SETTABLE 	7 -9 4	; "chapter_id" -
	24	[120]	GETTABLE 	7 6 -8	; "get_task_reward"
	25	[120]	SETTABLE 	7 -10 5	; "section_id" -
	26	[123]	GETTABUP 	7 0 -11	; game "luaSend"
	27	[123]	LOADK    	8 -12	; "Activity200211"
	28	[123]	MOVE     	9 6
	29	[123]	GETTABUP 	10 2 -13	; _ENV "onDataResponse"
	30	[123]	LOADBOOL 	11 1 0
	31	[123]	CALL     	7 5 1
	32	[124]	RETURN   	0 1
constants (13) for 0606B988:
	1	"comm"
	2	"getCommActivityReq"
	3	nil
	4	"seq_id"
	5	"item_id"
	6	"pos"
	7	2
	8	"get_task_reward"
	9	"chapter_id"
	10	"section_id"
	11	"luaSend"
	12	"Activity200211"
	13	"onDataResponse"
locals (7) for 0606B988:
	0	operateType	1	33
	1	itemSeq	1	33
	2	itemId	1	33
	3	itemPos	1	33
	4	chapterId	1	33
	5	sectionId	1	33
	6	request	2	33
upvalues (3) for 0606B988:
	0	game	1	0
	1	activityId	1	20
	2	_ENV	0	0

function <(input2.lua):126,174> (113 instructions at 0606D108)
3 params, 12 slots, 6 upvalues, 6 locals, 32 constants, 0 functions
	1	[127]	LOADNIL  	3 2
	2	[131]	GETTABUP 	6 0 -1	; game "isNull"
	3	[131]	GETTABUP 	7 1 -2	; _ENV "self"
	4	[131]	CALL     	6 2 2
	5	[131]	TEST     	6 0
	6	[131]	JMP      	0 1	; to 8
	7	[132]	RETURN   	0 1
	8	[135]	EQ       	1 2 -3	; - 0
	9	[135]	JMP      	0 27	; to 37
	10	[136]	GETTABUP 	6 0 -4	; game "showCodeTip"
	11	[136]	MOVE     	7 2
	12	[136]	CALL     	6 2 1
	13	[137]	GETTABLE 	6 0 -5	; "comm"
	14	[137]	GETTABLE 	6 6 -6	; "operate_type"
	15	[137]	EQ       	0 6 -7	; - 1
	16	[137]	JMP      	0 4	; to 21
	17	[138]	GETTABUP 	6 0 -8	; game "closeSelf"
	18	[138]	GETTABUP 	7 1 -2	; _ENV "self"
	19	[138]	CALL     	6 2 1
	20	[138]	JMP      	0 15	; to 36
	21	[139]	GETTABLE 	6 0 -5	; "comm"
	22	[139]	GETTABLE 	6 6 -6	; "operate_type"
	23	[139]	EQ       	1 6 -9	; - 100
	24	[139]	JMP      	0 8	; to 33
	25	[139]	GETTABLE 	6 0 -5	; "comm"
	26	[139]	GETTABLE 	6 6 -6	; "operate_type"
	27	[139]	EQ       	1 6 -10	; - 101
	28	[139]	JMP      	0 4	; to 33
	29	[139]	GETTABLE 	6 0 -5	; "comm"
	30	[139]	GETTABLE 	6 6 -6	; "operate_type"
	31	[139]	EQ       	0 6 -11	; - 102
	32	[139]	JMP      	0 3	; to 36
	33	[140]	GETTABUP 	6 1 -12	; _ENV "requestData"
	34	[140]	LOADK    	7 -7	; 1
	35	[140]	CALL     	6 2 1
	36	[143]	RETURN   	0 1
	37	[146]	SETUPVAL 	1 2	; activityData
	38	[148]	GETTABLE 	6 0 -5	; "comm"
	39	[148]	GETTABLE 	6 6 -6	; "operate_type"
	40	[148]	EQ       	0 6 -7	; - 1
	41	[148]	JMP      	0 24	; to 66
	42	[149]	GETTABUP 	6 1 -13	; _ENV "convertArrangedFurnitures"
	43	[149]	GETTABLE 	7 1 -14	; "pos_info"
	44	[149]	CALL     	6 2 2
	45	[149]	SETUPVAL 	6 3	; arrangedFurnitures
	46	[150]	GETTABUP 	6 1 -15	; _ENV "convertBagFurnitures"
	47	[150]	GETTABLE 	7 1 -16	; "task"
	48	[150]	GETTABLE 	7 7 -17	; "chapter_list"
	49	[150]	GETTABLE 	7 7 -7	; 1
	50	[150]	GETTABLE 	7 7 -18	; "section_list"
	51	[150]	GETTABLE 	8 1 -14	; "pos_info"
	52	[150]	CALL     	6 3 2
	53	[150]	SETUPVAL 	6 4	; bagFurnitures
	54	[151]	GETUPVAL 	6 5	; editPanel
	55	[151]	SELF     	6 6 -19	; "CallLuaFunction"
	56	[151]	LOADK    	8 -20	; "init"
	57	[151]	GETUPVAL 	9 3	; arrangedFurnitures
	58	[151]	GETUPVAL 	10 4	; bagFurnitures
	59	[151]	GETTABUP 	11 1 -21	; _ENV "dragFurnitureFromStorageCallback"
	60	[151]	CALL     	6 6 1
	61	[152]	GETTABUP 	6 1 -22	; _ENV "updateMap"
	62	[152]	CALL     	6 1 1
	63	[153]	GETTABUP 	6 1 -23	; _ENV "updateFurnitures"
	64	[153]	CALL     	6 1 1
	65	[153]	JMP      	0 45	; to 111
	66	[154]	GETTABLE 	6 0 -5	; "comm"
	67	[154]	GETTABLE 	6 6 -6	; "operate_type"
	68	[154]	EQ       	0 6 -24	; - 2
	69	[154]	JMP      	0 7	; to 77
	70	[155]	GETTABLE 	6 1 -25	; "get_reward"
	71	[155]	EQ       	1 6 -26	; - nil
	72	[155]	JMP      	0 38	; to 111
	73	[156]	GETTABUP 	6 0 -27	; game "showPopAward"
	74	[156]	GETTABLE 	7 1 -25	; "get_reward"
	75	[156]	CALL     	6 2 1
	76	[157]	JMP      	0 34	; to 111
	77	[158]	GETTABLE 	6 0 -5	; "comm"
	78	[158]	GETTABLE 	6 6 -6	; "operate_type"
	79	[158]	EQ       	0 6 -9	; - 100
	80	[158]	JMP      	0 30	; to 111
	81	[159]	GETTABUP 	6 1 -28	; _ENV "findFurnitureBySeq"
	82	[159]	GETUPVAL 	7 3	; arrangedFurnitures
	83	[159]	LOADK    	8 -29	; -1
	84	[159]	CALL     	6 3 2
	85	[159]	MOVE     	3 6
	86	[160]	EQ       	1 3 -26	; - nil
	87	[160]	JMP      	0 20	; to 108
	88	[161]	GETTABUP 	6 1 -13	; _ENV "convertArrangedFurnitures"
	89	[161]	GETTABLE 	7 1 -14	; "pos_info"
	90	[161]	CALL     	6 2 2
	91	[161]	MOVE     	5 6
	92	[162]	GETTABUP 	6 1 -30	; _ENV "getDiffFurnitureBySeq"
	93	[162]	GETUPVAL 	7 3	; arrangedFurnitures
	94	[162]	MOVE     	8 5
	95	[162]	CALL     	6 3 2
	96	[162]	MOVE     	4 6
	97	[163]	EQ       	1 4 -26	; - nil
	98	[163]	JMP      	0 5	; to 104
	99	[164]	GETTABLE 	6 3 -14	; "pos_info"
	100	[164]	GETTABLE 	7 4 -14	; "pos_info"
	101	[164]	GETTABLE 	7 7 -31	; "seq"
	102	[164]	SETTABLE 	6 -31 7	; "seq" -
	103	[164]	JMP      	0 7	; to 111
	104	[166]	GETTABUP 	6 1 -12	; _ENV "requestData"
	105	[166]	LOADK    	7 -7	; 1
	106	[166]	CALL     	6 2 1
	107	[167]	JMP      	0 3	; to 111
	108	[169]	GETTABUP 	6 1 -12	; _ENV "requestData"
	109	[169]	LOADK    	7 -7	; 1
	110	[169]	CALL     	6 2 1
	111	[173]	GETTABUP 	6 1 -32	; _ENV "updateProcess"
	112	[173]	CALL     	6 1 1
	113	[174]	RETURN   	0 1
constants (32) for 0606D108:
	1	"isNull"
	2	"self"
	3	0
	4	"showCodeTip"
	5	"comm"
	6	"operate_type"
	7	1
	8	"closeSelf"
	9	100
	10	101
	11	102
	12	"requestData"
	13	"convertArrangedFurnitures"
	14	"pos_info"
	15	"convertBagFurnitures"
	16	"task"
	17	"chapter_list"
	18	"section_list"
	19	"CallLuaFunction"
	20	"init"
	21	"dragFurnitureFromStorageCallback"
	22	"updateMap"
	23	"updateFurnitures"
	24	2
	25	"get_reward"
	26	nil
	27	"showPopAward"
	28	"findFurnitureBySeq"
	29	-1
	30	"getDiffFurnitureBySeq"
	31	"seq"
	32	"updateProcess"
locals (6) for 0606D108:
	0	req	1	114
	1	rsp	1	114
	2	eCode	1	114
	3	lastAddItem	2	114
	4	diffItem	2	114
	5	newArrangedFurnitures	2	114
upvalues (6) for 0606D108:
	0	game	1	0
	1	_ENV	0	0
	2	activityData	1	21
	3	arrangedFurnitures	1	31
	4	bagFurnitures	1	30
	5	editPanel	1	6

function <(input2.lua):176,218> (133 instructions at 0606CA88)
0 params, 8 slots, 11 upvalues, 7 locals, 19 constants, 0 functions
	1	[177]	LOADNIL  	0 2
	2	[181]	GETUPVAL 	3 0	; arrangedFurnitures
	3	[181]	EQ       	1 3 -1	; - nil
	4	[181]	JMP      	0 128	; to 133
	5	[181]	GETUPVAL 	3 1	; activityData
	6	[181]	EQ       	1 3 -1	; - nil
	7	[181]	JMP      	0 125	; to 133
	8	[182]	LOADK    	0 -2	; 0
	9	[183]	LOADK    	1 -2	; 0
	10	[184]	LOADK    	3 -3	; 1
	11	[184]	GETUPVAL 	4 0	; arrangedFurnitures
	12	[184]	LEN      	4 4
	13	[184]	LOADK    	5 -3	; 1
	14	[184]	FORPREP  	3 7	; to 22
	15	[185]	GETTABUP 	2 0 6	; arrangedFurnitures
	16	[186]	GETTABLE 	7 2 -4	; "type"
	17	[186]	EQ       	0 7 -3	; - 1
	18	[186]	JMP      	0 2	; to 21
	19	[187]	ADD      	0 0 -3	; - 1
	20	[187]	JMP      	0 1	; to 22
	21	[189]	ADD      	1 1 -3	; - 1
	22	[184]	FORLOOP  	3 -8	; to 15
	23	[193]	GETTABUP 	3 3 -6	; _ENV "CS"
	24	[193]	GETTABLE 	3 3 -7	; "System"
	25	[193]	GETTABLE 	3 3 -8	; "String"
	26	[193]	GETTABLE 	3 3 -9	; "Format"
	27	[193]	LOADK    	4 -10	; "??????\166\178?{0}/{1}"
	28	[193]	MOVE     	5 0
	29	[193]	GETTABUP 	6 1 -11	; activityData "item_num"
	30	[193]	CALL     	3 4 2
	31	[193]	SETTABUP 	2 -5 3	; furnitureProcessText "text"
	32	[194]	GETTABUP 	3 3 -6	; _ENV "CS"
	33	[194]	GETTABLE 	3 3 -7	; "System"
	34	[194]	GETTABLE 	3 3 -8	; "String"
	35	[194]	GETTABLE 	3 3 -9	; "Format"
	36	[194]	LOADK    	4 -12	; "?????????{0}/{1}"
	37	[194]	MOVE     	5 1
	38	[194]	GETTABUP 	6 1 -13	; activityData "ninja_num"
	39	[194]	CALL     	3 4 2
	40	[194]	SETTABUP 	4 -5 3	; ninjaProcessText "text"
	41	[196]	GETTABUP 	3 1 -14	; activityData "task"
	42	[196]	EQ       	1 3 -1	; - nil
	43	[196]	JMP      	0 89	; to 133
	44	[196]	GETTABUP 	3 1 -14	; activityData "task"
	45	[196]	GETTABLE 	3 3 -15	; "chapter_list"
	46	[196]	EQ       	1 3 -1	; - nil
	47	[196]	JMP      	0 85	; to 133
	48	[196]	GETTABUP 	3 1 -14	; activityData "task"
	49	[196]	GETTABLE 	3 3 -15	; "chapter_list"
	50	[196]	LEN      	3 3
	51	[196]	LE       	0 -16 3	; 2 -
	52	[196]	JMP      	0 80	; to 133
	53	[196]	GETTABUP 	3 1 -14	; activityData "task"
	54	[196]	GETTABLE 	3 3 -15	; "chapter_list"
	55	[196]	GETTABLE 	3 3 -16	; 2
	56	[196]	GETTABLE 	3 3 -17	; "section_list"
	57	[196]	EQ       	1 3 -1	; - nil
	58	[196]	JMP      	0 74	; to 133
	59	[196]	GETTABUP 	3 1 -14	; activityData "task"
	60	[196]	GETTABLE 	3 3 -15	; "chapter_list"
	61	[196]	GETTABLE 	3 3 -16	; 2
	62	[196]	GETTABLE 	3 3 -17	; "section_list"
	63	[196]	LEN      	3 3
	64	[196]	LE       	0 -3 3	; 1 -
	65	[196]	JMP      	0 67	; to 133
	66	[197]	GETTABUP 	3 1 -14	; activityData "task"
	67	[197]	GETTABLE 	3 3 -15	; "chapter_list"
	68	[197]	GETTABLE 	3 3 -16	; 2
	69	[197]	SETUPVAL 	3 5	; taskChapter
	70	[198]	GETTABUP 	3 5 -17	; taskChapter "section_list"
	71	[198]	GETTABLE 	3 3 -3	; 1
	72	[198]	SETUPVAL 	3 6	; taskSection
	73	[199]	GETTABUP 	3 6 -18	; taskSection "status"
	74	[199]	EQ       	0 3 -2	; - 0
	75	[199]	JMP      	0 13	; to 89
	76	[200]	GETTABUP 	3 7 -19	; game "active"
	77	[200]	GETUPVAL 	4 8	; partyButton
	78	[200]	LOADBOOL 	5 1 0
	79	[200]	CALL     	3 3 1
	80	[201]	GETTABUP 	3 7 -19	; game "active"
	81	[201]	GETUPVAL 	4 9	; receivedTag
	82	[201]	LOADBOOL 	5 0 0
	83	[201]	CALL     	3 3 1
	84	[202]	GETTABUP 	3 7 -19	; game "active"
	85	[202]	GETUPVAL 	4 10	; partyRewardRedDot
	86	[202]	LOADBOOL 	5 0 0
	87	[202]	CALL     	3 3 1
	88	[202]	JMP      	0 44	; to 133
	89	[203]	GETTABUP 	3 6 -18	; taskSection "status"
	90	[203]	EQ       	0 3 -3	; - 1
	91	[203]	JMP      	0 13	; to 105
	92	[204]	GETTABUP 	3 7 -19	; game "active"
	93	[204]	GETUPVAL 	4 8	; partyButton
	94	[204]	LOADBOOL 	5 1 0
	95	[204]	CALL     	3 3 1
	96	[205]	GETTABUP 	3 7 -19	; game "active"
	97	[205]	GETUPVAL 	4 9	; receivedTag
	98	[205]	LOADBOOL 	5 0 0
	99	[205]	CALL     	3 3 1
	100	[206]	GETTABUP 	3 7 -19	; game "active"
	101	[206]	GETUPVAL 	4 10	; partyRewardRedDot
	102	[206]	LOADBOOL 	5 1 0
	103	[206]	CALL     	3 3 1
	104	[206]	JMP      	0 28	; to 133
	105	[207]	GETTABUP 	3 6 -18	; taskSection "status"
	106	[207]	EQ       	0 3 -16	; - 2
	107	[207]	JMP      	0 13	; to 121
	108	[208]	GETTABUP 	3 7 -19	; game "active"
	109	[208]	GETUPVAL 	4 8	; partyButton
	110	[208]	LOADBOOL 	5 0 0
	111	[208]	CALL     	3 3 1
	112	[209]	GETTABUP 	3 7 -19	; game "active"
	113	[209]	GETUPVAL 	4 9	; receivedTag
	114	[209]	LOADBOOL 	5 1 0
	115	[209]	CALL     	3 3 1
	116	[210]	GETTABUP 	3 7 -19	; game "active"
	117	[210]	GETUPVAL 	4 10	; partyRewardRedDot
	118	[210]	LOADBOOL 	5 0 0
	119	[210]	CALL     	3 3 1
	120	[210]	JMP      	0 12	; to 133
	121	[212]	GETTABUP 	3 7 -19	; game "active"
	122	[212]	GETUPVAL 	4 8	; partyButton
	123	[212]	LOADBOOL 	5 0 0
	124	[212]	CALL     	3 3 1
	125	[213]	GETTABUP 	3 7 -19	; game "active"
	126	[213]	GETUPVAL 	4 9	; receivedTag
	127	[213]	LOADBOOL 	5 0 0
	128	[213]	CALL     	3 3 1
	129	[214]	GETTABUP 	3 7 -19	; game "active"
	130	[214]	GETUPVAL 	4 10	; partyRewardRedDot
	131	[214]	LOADBOOL 	5 0 0
	132	[214]	CALL     	3 3 1
	133	[218]	RETURN   	0 1
constants (19) for 0606CA88:
	1	nil
	2	0
	3	1
	4	"type"
	5	"text"
	6	"CS"
	7	"System"
	8	"String"
	9	"Format"
	10	"??????\166\178?{0}/{1}"
	11	"item_num"
	12	"?????????{0}/{1}"
	13	"ninja_num"
	14	"task"
	15	"chapter_list"
	16	2
	17	"section_list"
	18	"status"
	19	"active"
locals (7) for 0606CA88:
	0	furnitureNum	2	134
	1	ninjaNum	2	134
	2	tempArrangedFurniture	2	134
	3	(for index)	14	23
	4	(for limit)	14	23
	5	(for step)	14	23
	6	i	15	22
upvalues (11) for 0606CA88:
	0	arrangedFurnitures	1	31
	1	activityData	1	21
	2	furnitureProcessText	1	10
	3	_ENV	0	0
	4	ninjaProcessText	1	11
	5	taskChapter	1	22
	6	taskSection	1	23
	7	game	1	0
	8	partyButton	1	12
	9	receivedTag	1	14
	10	partyRewardRedDot	1	13

function <(input2.lua):220,244> (49 instructions at 0606CB88)
1 param, 15 slots, 1 upvalue, 12 locals, 10 constants, 0 functions
	1	[221]	LOADNIL  	1 2
	2	[225]	EQ       	1 0 -1	; - nil
	3	[225]	JMP      	0 44	; to 48
	4	[226]	NEWTABLE 	4 0 0
	5	[226]	MOVE     	1 4
	6	[227]	LOADK    	4 -2	; 1
	7	[227]	LEN      	5 0
	8	[227]	LOADK    	6 -2	; 1
	9	[227]	FORPREP  	4 37	; to 47
	10	[228]	GETTABLE 	3 0 7
	11	[229]	GETTABLE 	8 3 -3	; "pos_info"
	12	[229]	EQ       	1 8 -1	; - nil
	13	[229]	JMP      	0 33	; to 47
	14	[229]	GETTABLE 	8 3 -3	; "pos_info"
	15	[229]	LEN      	8 8
	16	[229]	LT       	0 -4 8	; 0 -
	17	[229]	JMP      	0 29	; to 47
	18	[230]	LOADK    	8 -2	; 1
	19	[230]	GETTABLE 	9 3 -3	; "pos_info"
	20	[230]	LEN      	9 9
	21	[230]	LOADK    	10 -2	; 1
	22	[230]	FORPREP  	8 23	; to 46
	23	[231]	NEWTABLE 	12 0 0
	24	[231]	MOVE     	2 12
	25	[232]	GETTABLE 	12 3 -5	; "id"
	26	[232]	SETTABLE 	2 -5 12	; "id" -
	27	[233]	GETTABLE 	12 3 -6	; "type"
	28	[233]	SETTABLE 	2 -6 12	; "type" -
	29	[234]	NEWTABLE 	12 0 0
	30	[234]	SETTABLE 	2 -3 12	; "pos_info" -
	31	[235]	GETTABLE 	12 2 -3	; "pos_info"
	32	[235]	GETTABLE 	13 3 -3	; "pos_info"
	33	[235]	GETTABLE 	13 13 11
	34	[235]	GETTABLE 	13 13 -7	; "seq"
	35	[235]	SETTABLE 	12 -7 13	; "seq" -
	36	[236]	GETTABLE 	12 2 -3	; "pos_info"
	37	[236]	GETTABLE 	13 3 -3	; "pos_info"
	38	[236]	GETTABLE 	13 13 11
	39	[236]	GETTABLE 	13 13 -8	; "pos"
	40	[236]	SETTABLE 	12 -8 13	; "pos" -
	41	[237]	GETTABUP 	12 0 -9	; _ENV "table"
	42	[237]	GETTABLE 	12 12 -10	; "insert"
	43	[237]	MOVE     	13 1
	44	[237]	MOVE     	14 2
	45	[237]	CALL     	12 3 1
	46	[230]	FORLOOP  	8 -24	; to 23
	47	[227]	FORLOOP  	4 -38	; to 10
	48	[243]	RETURN   	1 2
	49	[244]	RETURN   	0 1
constants (10) for 0606CB88:
	1	nil
	2	1
	3	"pos_info"
	4	0
	5	"id"
	6	"type"
	7	"seq"
	8	"pos"
	9	"table"
	10	"insert"
locals (12) for 0606CB88:
	0	originalList	1	50
	1	result	2	50
	2	tempFurniture	2	50
	3	listFurniture	2	50
	4	(for index)	9	48
	5	(for limit)	9	48
	6	(for step)	9	48
	7	i	10	47
	8	(for index)	22	47
	9	(for limit)	22	47
	10	(for step)	22	47
	11	j	23	46
upvalues (1) for 0606CB88:
	0	_ENV	0	0

function <(input2.lua):246,287> (93 instructions at 0606CF08)
2 params, 18 slots, 1 upvalue, 15 locals, 13 constants, 0 functions
	1	[247]	LOADNIL  	2 4
	2	[253]	EQ       	1 0 -1	; - nil
	3	[253]	JMP      	0 88	; to 92
	4	[254]	NEWTABLE 	7 0 0
	5	[254]	MOVE     	2 7
	6	[255]	LOADK    	7 -2	; 1
	7	[255]	LEN      	8 0
	8	[255]	LOADK    	9 -2	; 1
	9	[255]	FORPREP  	7 81	; to 91
	10	[256]	GETTABLE 	3 0 10
	11	[257]	NEWTABLE 	11 0 0
	12	[257]	SETTABUP 	0 -3 11	; _ENV "tempBagFurniture"
	13	[258]	GETTABUP 	11 0 -3	; _ENV "tempBagFurniture"
	14	[258]	GETTABLE 	12 3 -4	; "cur_value"
	15	[258]	SETTABLE 	11 -4 12	; "cur_value" -
	16	[259]	GETTABUP 	11 0 -3	; _ENV "tempBagFurniture"
	17	[259]	GETTABLE 	12 3 -5	; "status"
	18	[259]	SETTABLE 	11 -5 12	; "status" -
	19	[260]	GETTABLE 	11 3 -6	; "str_arg_list_data"
	20	[260]	EQ       	1 11 -1	; - nil
	21	[260]	JMP      	0 64	; to 86
	22	[261]	GETTABUP 	11 0 -3	; _ENV "tempBagFurniture"
	23	[261]	NEWTABLE 	12 0 0
	24	[261]	SETTABLE 	11 -6 12	; "str_arg_list_data" -
	25	[262]	LOADK    	11 -2	; 1
	26	[262]	GETTABLE 	12 3 -6	; "str_arg_list_data"
	27	[262]	LEN      	12 12
	28	[262]	LOADK    	13 -2	; 1
	29	[262]	FORPREP  	11 7	; to 37
	30	[263]	GETTABUP 	15 0 -7	; _ENV "table"
	31	[263]	GETTABLE 	15 15 -8	; "insert"
	32	[263]	GETTABUP 	16 0 -3	; _ENV "tempBagFurniture"
	33	[263]	GETTABLE 	16 16 -6	; "str_arg_list_data"
	34	[263]	GETTABLE 	17 3 -6	; "str_arg_list_data"
	35	[263]	GETTABLE 	17 17 14
	36	[263]	CALL     	15 3 1
	37	[262]	FORLOOP  	11 -8	; to 30
	38	[265]	GETTABUP 	11 0 -9	; _ENV "tonumber"
	39	[265]	GETTABUP 	12 0 -3	; _ENV "tempBagFurniture"
	40	[265]	GETTABLE 	12 12 -6	; "str_arg_list_data"
	41	[265]	GETTABLE 	12 12 -2	; 1
	42	[265]	CALL     	11 2 2
	43	[265]	MOVE     	4 11
	44	[266]	GETTABUP 	11 0 -9	; _ENV "tonumber"
	45	[266]	GETTABUP 	12 0 -3	; _ENV "tempBagFurniture"
	46	[266]	GETTABLE 	12 12 -6	; "str_arg_list_data"
	47	[266]	GETTABLE 	12 12 -10	; 2
	48	[266]	CALL     	11 2 2
	49	[266]	MOVE     	5 11
	50	[267]	EQ       	0 5 -2	; - 1
	51	[267]	JMP      	0 18	; to 70
	52	[268]	GETTABUP 	11 0 -11	; _ENV "findFurnitureById"
	53	[268]	MOVE     	12 1
	54	[268]	MOVE     	13 4
	55	[268]	CALL     	11 3 2
	56	[268]	MOVE     	6 11
	57	[269]	EQ       	1 6 -1	; - nil
	58	[269]	JMP      	0 27	; to 86
	59	[269]	GETTABLE 	11 6 -12	; "pos_info"
	60	[269]	EQ       	1 11 -1	; - nil
	61	[269]	JMP      	0 24	; to 86
	62	[270]	GETTABUP 	11 0 -3	; _ENV "tempBagFurniture"
	63	[270]	GETTABUP 	12 0 -3	; _ENV "tempBagFurniture"
	64	[270]	GETTABLE 	12 12 -4	; "cur_value"
	65	[270]	GETTABLE 	13 6 -12	; "pos_info"
	66	[270]	LEN      	13 13
	67	[270]	ADD      	12 12 13
	68	[270]	SETTABLE 	11 -4 12	; "cur_value" -
	69	[271]	JMP      	0 16	; to 86
	70	[272]	EQ       	0 5 -10	; - 2
	71	[272]	JMP      	0 12	; to 84
	72	[273]	GETTABLE 	11 3 -5	; "status"
	73	[273]	EQ       	0 11 -13	; - 0
	74	[273]	JMP      	0 3	; to 78
	75	[274]	GETTABUP 	11 0 -3	; _ENV "tempBagFurniture"
	76	[274]	SETTABLE 	11 -4 -13	; "cur_value" 0
	77	[274]	JMP      	0 8	; to 86
	78	[275]	GETTABLE 	11 3 -5	; "status"
	79	[275]	EQ       	0 11 -10	; - 2
	80	[275]	JMP      	0 5	; to 86
	81	[276]	GETTABUP 	11 0 -3	; _ENV "tempBagFurniture"
	82	[276]	SETTABLE 	11 -4 -2	; "cur_value" 1
	83	[277]	JMP      	0 2	; to 86
	84	[279]	GETTABUP 	11 0 -3	; _ENV "tempBagFurniture"
	85	[279]	SETTABLE 	11 -4 -13	; "cur_value" 0
	86	[282]	GETTABUP 	11 0 -7	; _ENV "table"
	87	[282]	GETTABLE 	11 11 -8	; "insert"
	88	[282]	MOVE     	12 2
	89	[282]	GETTABUP 	13 0 -3	; _ENV "tempBagFurniture"
	90	[282]	CALL     	11 3 1
	91	[255]	FORLOOP  	7 -82	; to 10
	92	[286]	RETURN   	2 2
	93	[287]	RETURN   	0 1
constants (13) for 0606CF08:
	1	nil
	2	1
	3	"tempBagFurniture"
	4	"cur_value"
	5	"status"
	6	"str_arg_list_data"
	7	"table"
	8	"insert"
	9	"tonumber"
	10	2
	11	"findFurnitureById"
	12	"pos_info"
	13	0
locals (15) for 0606CF08:
	0	serverBagFurnitures	1	94
	1	serverArrangedFurnitures	1	94
	2	result	2	94
	3	listBagFurniture	2	94
	4	itemId	2	94
	5	itemType	2	94
	6	foundServerArrangedFurniture	2	94
	7	(for index)	9	92
	8	(for limit)	9	92
	9	(for step)	9	92
	10	i	10	91
	11	(for index)	29	38
	12	(for limit)	29	38
	13	(for step)	29	38
	14	j	30	37
upvalues (1) for 0606CF08:
	0	_ENV	0	0

function <(input2.lua):289,302> (17 instructions at 0606C688)
2 params, 8 slots, 0 upvalues, 7 locals, 4 constants, 0 functions
	1	[290]	LOADNIL  	2 0
	2	[292]	EQ       	1 0 -1	; - nil
	3	[292]	JMP      	0 11	; to 15
	4	[293]	LOADK    	3 -2	; 1
	5	[293]	LEN      	4 0
	6	[293]	LOADK    	5 -2	; 1
	7	[293]	FORPREP  	3 6	; to 14
	8	[294]	GETTABLE 	2 0 6
	9	[295]	GETTABLE 	7 2 -3	; "pos_info"
	10	[295]	GETTABLE 	7 7 -4	; "seq"
	11	[295]	EQ       	0 7 1
	12	[295]	JMP      	0 1	; to 14
	13	[296]	RETURN   	2 2
	14	[293]	FORLOOP  	3 -7	; to 8
	15	[301]	LOADNIL  	3 0
	16	[301]	RETURN   	3 2
	17	[302]	RETURN   	0 1
constants (4) for 0606C688:
	1	nil
	2	1
	3	"pos_info"
	4	"seq"
locals (7) for 0606C688:
	0	furnitures	1	18
	1	seq	1	18
	2	tempFurniture	2	18
	3	(for index)	7	15
	4	(for limit)	7	15
	5	(for step)	7	15
	6	i	8	14
upvalues (0) for 0606C688:

function <(input2.lua):304,317> (18 instructions at 0606CC08)
2 params, 8 slots, 0 upvalues, 7 locals, 3 constants, 0 functions
	1	[305]	LOADNIL  	2 0
	2	[307]	EQ       	1 0 -1	; - nil
	3	[307]	JMP      	0 12	; to 16
	4	[307]	EQ       	1 1 -1	; - nil
	5	[307]	JMP      	0 10	; to 16
	6	[308]	LOADK    	3 -2	; 1
	7	[308]	LEN      	4 0
	8	[308]	LOADK    	5 -2	; 1
	9	[308]	FORPREP  	3 5	; to 15
	10	[309]	GETTABLE 	2 0 6
	11	[310]	GETTABLE 	7 2 -3	; "id"
	12	[310]	EQ       	0 7 1
	13	[310]	JMP      	0 1	; to 15
	14	[311]	RETURN   	2 2
	15	[308]	FORLOOP  	3 -6	; to 10
	16	[316]	LOADNIL  	3 0
	17	[316]	RETURN   	3 2
	18	[317]	RETURN   	0 1
constants (3) for 0606CC08:
	1	nil
	2	1
	3	"id"
locals (7) for 0606CC08:
	0	furnitures	1	19
	1	id	1	19
	2	tempFurniture	2	19
	3	(for index)	9	16
	4	(for limit)	9	16
	5	(for step)	9	16
	6	i	10	15
upvalues (0) for 0606CC08:

function <(input2.lua):319,334> (21 instructions at 0606D188)
2 params, 11 slots, 1 upvalue, 8 locals, 5 constants, 0 functions
	1	[320]	LOADNIL  	2 1
	2	[323]	EQ       	1 1 -1	; - nil
	3	[323]	JMP      	0 15	; to 19
	4	[324]	LOADK    	4 -2	; 1
	5	[324]	LEN      	5 1
	6	[324]	LOADK    	6 -2	; 1
	7	[324]	FORPREP  	4 10	; to 18
	8	[325]	GETTABLE 	2 1 7
	9	[326]	GETTABUP 	8 0 -3	; _ENV "findFurnitureBySeq"
	10	[326]	MOVE     	9 0
	11	[326]	GETTABLE 	10 2 -4	; "pos_info"
	12	[326]	GETTABLE 	10 10 -5	; "seq"
	13	[326]	CALL     	8 3 2
	14	[326]	MOVE     	3 8
	15	[327]	EQ       	0 3 -1	; - nil
	16	[327]	JMP      	0 1	; to 18
	17	[328]	RETURN   	2 2
	18	[324]	FORLOOP  	4 -11	; to 8
	19	[333]	LOADNIL  	4 0
	20	[333]	RETURN   	4 2
	21	[334]	RETURN   	0 1
constants (5) for 0606D188:
	1	nil
	2	1
	3	"findFurnitureBySeq"
	4	"pos_info"
	5	"seq"
locals (8) for 0606D188:
	0	oldFurnitures	1	22
	1	newFurnitures	1	22
	2	tempFurniture	2	22
	3	foundFurniture	2	22
	4	(for index)	7	19
	5	(for limit)	7	19
	6	(for step)	7	19
	7	i	8	18
upvalues (1) for 0606D188:
	0	_ENV	0	0

function <(input2.lua):336,348> (32 instructions at 0606CD08)
0 params, 17 slots, 5 upvalues, 7 locals, 11 constants, 0 functions
	1	[337]	LOADNIL  	0 2
	2	[341]	GETUPVAL 	3 0	; furnitureList
	3	[341]	SELF     	3 3 -1	; "SetItems"
	4	[341]	GETUPVAL 	5 1	; arrangedFurnitures
	5	[341]	LEN      	5 5
	6	[341]	CALL     	3 3 1
	7	[342]	LOADK    	3 -2	; 1
	8	[342]	GETUPVAL 	4 1	; arrangedFurnitures
	9	[342]	LEN      	4 4
	10	[342]	LOADK    	5 -2	; 1
	11	[342]	FORPREP  	3 17	; to 29
	12	[343]	GETTABUP 	2 1 6	; arrangedFurnitures
	13	[344]	GETUPVAL 	7 0	; furnitureList
	14	[344]	SELF     	7 7 -3	; "GetItem"
	15	[344]	SUB      	9 6 -2	; - 1
	16	[344]	CALL     	7 3 2
	17	[344]	MOVE     	1 7
	18	[345]	GETTABUP 	7 2 -4	; game "callLuaFunction"
	19	[345]	MOVE     	8 1
	20	[345]	LOADK    	9 -5	; "setData"
	21	[345]	MOVE     	10 2
	22	[345]	GETUPVAL 	11 3	; houseUIContainer
	23	[345]	GETTABUP 	12 4 -6	; _ENV "onItemSelectedCallback"
	24	[345]	GETTABUP 	13 4 -7	; _ENV "onItemStoreCallback"
	25	[345]	GETTABUP 	14 4 -8	; _ENV "onItemBeginDragEvent"
	26	[345]	GETTABUP 	15 4 -9	; _ENV "onItemDragEvent"
	27	[345]	GETTABUP 	16 4 -10	; _ENV "onItemEndDragEvent"
	28	[345]	CALL     	7 10 1
	29	[342]	FORLOOP  	3 -18	; to 12
	30	[347]	GETTABUP 	3 4 -11	; _ENV "updateFurnitureSelectedStatus"
	31	[347]	CALL     	3 1 1
	32	[348]	RETURN   	0 1
constants (11) for 0606CD08:
	1	"SetItems"
	2	1
	3	"GetItem"
	4	"callLuaFunction"
	5	"setData"
	6	"onItemSelectedCallback"
	7	"onItemStoreCallback"
	8	"onItemBeginDragEvent"
	9	"onItemDragEvent"
	10	"onItemEndDragEvent"
	11	"updateFurnitureSelectedStatus"
locals (7) for 0606CD08:
	0	i	2	33
	1	tempFurniture	2	33
	2	tempArrangedFurniture	2	33
	3	(for index)	11	30
	4	(for limit)	11	30
	5	(for step)	11	30
	6	i	12	29
upvalues (5) for 0606CD08:
	0	furnitureList	1	4
	1	arrangedFurnitures	1	31
	2	game	1	0
	3	houseUIContainer	1	8
	4	_ENV	0	0

function <(input2.lua):350,362> (30 instructions at 0606CC88)
1 param, 14 slots, 5 upvalues, 4 locals, 12 constants, 0 functions
	1	[351]	LOADNIL  	1 2
	2	[355]	GETUPVAL 	4 0	; arrangedFurnitures
	3	[355]	LEN      	3 4
	4	[356]	GETTABUP 	4 1 -1	; _ENV "table"
	5	[356]	GETTABLE 	4 4 -2	; "insert"
	6	[356]	GETUPVAL 	5 0	; arrangedFurnitures
	7	[356]	MOVE     	6 0
	8	[356]	CALL     	4 3 1
	9	[358]	GETUPVAL 	4 2	; furnitureList
	10	[358]	SELF     	4 4 -3	; "SetItems"
	11	[358]	ADD      	6 3 -4	; - 1
	12	[358]	CALL     	4 3 1
	13	[359]	GETUPVAL 	4 2	; furnitureList
	14	[359]	SELF     	4 4 -5	; "GetItem"
	15	[359]	MOVE     	6 3
	16	[359]	CALL     	4 3 2
	17	[359]	MOVE     	2 4
	18	[360]	GETTABUP 	4 3 -6	; game "callLuaFunction"
	19	[360]	MOVE     	5 2
	20	[360]	LOADK    	6 -7	; "setData"
	21	[360]	MOVE     	7 0
	22	[360]	GETUPVAL 	8 4	; houseUIContainer
	23	[360]	GETTABUP 	9 1 -8	; _ENV "onItemSelectedCallback"
	24	[360]	GETTABUP 	10 1 -9	; _ENV "onItemStoreCallback"
	25	[360]	GETTABUP 	11 1 -10	; _ENV "onItemBeginDragEvent"
	26	[360]	GETTABUP 	12 1 -11	; _ENV "onItemDragEvent"
	27	[360]	GETTABUP 	13 1 -12	; _ENV "onItemEndDragEvent"
	28	[360]	CALL     	4 10 1
	29	[361]	RETURN   	2 2
	30	[362]	RETURN   	0 1
constants (12) for 0606CC88:
	1	"table"
	2	"insert"
	3	"SetItems"
	4	1
	5	"GetItem"
	6	"callLuaFunction"
	7	"setData"
	8	"onItemSelectedCallback"
	9	"onItemStoreCallback"
	10	"onItemBeginDragEvent"
	11	"onItemDragEvent"
	12	"onItemEndDragEvent"
locals (4) for 0606CC88:
	0	furniture	1	31
	1	pos	2	31
	2	furnitureObj	2	31
	3	count	2	31
upvalues (5) for 0606CC88:
	0	arrangedFurnitures	1	31
	1	_ENV	0	0
	2	furnitureList	1	4
	3	game	1	0
	4	houseUIContainer	1	8

function <(input2.lua):364,385> (54 instructions at 0606C908)
3 params, 10 slots, 7 upvalues, 6 locals, 22 constants, 0 functions
	1	[365]	LOADNIL  	3 0
	2	[366]	NEWTABLE 	4 0 0
	3	[367]	GETTABUP 	5 0 -1	; _ENV "getDragMousePosition"
	4	[367]	GETTABUP 	6 0 -2	; _ENV "furnitureListObj"
	5	[367]	GETTABLE 	6 6 -3	; "transform"
	6	[367]	GETUPVAL 	7 1	; camera
	7	[367]	CALL     	5 3 2
	8	[369]	GETTABLE 	6 1 -4	; "id"
	9	[369]	SETTABLE 	4 -4 6	; "id" -
	10	[370]	GETTABLE 	6 1 -5	; "type"
	11	[370]	SETTABLE 	4 -5 6	; "type" -
	12	[371]	NEWTABLE 	6 0 0
	13	[371]	SETTABLE 	4 -6 6	; "pos_info" -
	14	[372]	GETTABLE 	6 4 -6	; "pos_info"
	15	[372]	SETTABLE 	6 -7 -8	; "seq" -1
	16	[373]	GETTABLE 	6 4 -6	; "pos_info"
	17	[373]	GETTABUP 	7 0 -10	; _ENV "convertVector2ToProtoPoint"
	18	[373]	MOVE     	8 5
	19	[373]	CALL     	7 2 2
	20	[373]	SETTABLE 	6 -9 7	; "pos" -
	21	[374]	GETTABUP 	6 0 -11	; _ENV "addFurnitureToHouse"
	22	[374]	MOVE     	7 4
	23	[374]	CALL     	6 2 2
	24	[374]	MOVE     	3 6
	25	[375]	GETTABLE 	6 1 -12	; "num"
	26	[375]	LT       	0 -13 6	; 1 -
	27	[375]	JMP      	0 8	; to 36
	28	[376]	GETTABLE 	6 1 -12	; "num"
	29	[376]	SUB      	6 6 -13	; - 1
	30	[376]	SETTABLE 	1 -12 6	; "num" -
	31	[377]	GETTABUP 	6 2 -14	; game "callLuaFunction"
	32	[377]	MOVE     	7 0
	33	[377]	LOADK    	8 -15	; "updateView"
	34	[377]	CALL     	6 3 1
	35	[377]	JMP      	0 5	; to 41
	36	[379]	GETUPVAL 	6 3	; editPanel
	37	[379]	SELF     	6 6 -16	; "CallLuaFunction"
	38	[379]	LOADK    	8 -17	; "updateArrangedFurnitures"
	39	[379]	GETUPVAL 	9 4	; arrangedFurnitures
	40	[379]	CALL     	6 4 1
	41	[381]	GETTABUP 	6 2 -18	; game "active"
	42	[381]	GETUPVAL 	7 5	; uiContent
	43	[381]	LOADBOOL 	8 0 0
	44	[381]	CALL     	6 3 1
	45	[382]	GETTABLE 	6 4 -7	; "seq"
	46	[382]	SETUPVAL 	6 6	; dragingFromStorageSeq
	47	[383]	SETTABLE 	2 -19 3	; "pointerDrag" -
	48	[384]	GETTABUP 	6 0 -20	; _ENV "CS"
	49	[384]	GETTABLE 	6 6 -21	; "EvtUtil"
	50	[384]	GETTABLE 	6 6 -22	; "ExecuteBeginDragEvent"
	51	[384]	MOVE     	7 3
	52	[384]	MOVE     	8 2
	53	[384]	CALL     	6 3 1
	54	[385]	RETURN   	0 1
constants (22) for 0606C908:
	1	"getDragMousePosition"
	2	"furnitureListObj"
	3	"transform"
	4	"id"
	5	"type"
	6	"pos_info"
	7	"seq"
	8	-1
	9	"pos"
	10	"convertVector2ToProtoPoint"
	11	"addFurnitureToHouse"
	12	"num"
	13	1
	14	"callLuaFunction"
	15	"updateView"
	16	"CallLuaFunction"
	17	"updateArrangedFurnitures"
	18	"active"
	19	"pointerDrag"
	20	"CS"
	21	"EvtUtil"
	22	"ExecuteBeginDragEvent"
locals (6) for 0606C908:
	0	pObj	1	55
	1	pFurniture	1	55
	2	pEventData	1	55
	3	furnitureEditItemObj	2	55
	4	tempFurniture	3	55
	5	tempPos	8	55
upvalues (7) for 0606C908:
	0	_ENV	0	0
	1	camera	1	29
	2	game	1	0
	3	editPanel	1	6
	4	arrangedFurnitures	1	31
	5	uiContent	1	19
	6	dragingFromStorageSeq	1	28

function <(input2.lua):387,409> (36 instructions at 0606C988)
0 params, 11 slots, 1 upvalue, 10 locals, 5 constants, 0 functions
	1	[388]	LOADNIL  	0 1
	2	[391]	GETUPVAL 	2 0	; arrangedFurnitures
	3	[391]	EQ       	1 2 -1	; - nil
	4	[391]	JMP      	0 4	; to 9
	5	[391]	GETUPVAL 	2 0	; arrangedFurnitures
	6	[391]	LEN      	2 2
	7	[391]	EQ       	0 2 -2	; - 0
	8	[391]	JMP      	0 2	; to 11
	9	[392]	LOADK    	2 -3	; 1
	10	[392]	RETURN   	2 2
	11	[395]	LOADK    	2 -3	; 1
	12	[395]	GETUPVAL 	3 0	; arrangedFurnitures
	13	[395]	LEN      	3 3
	14	[395]	ADD      	3 3 -3	; - 1
	15	[395]	LOADK    	4 -3	; 1
	16	[395]	FORPREP  	2 16	; to 33
	17	[396]	LOADBOOL 	1 0 0
	18	[397]	LOADK    	6 -3	; 1
	19	[397]	GETUPVAL 	7 0	; arrangedFurnitures
	20	[397]	LEN      	7 7
	21	[397]	LOADK    	8 -3	; 1
	22	[397]	FORPREP  	6 6	; to 29
	23	[398]	GETTABUP 	10 0 9	; arrangedFurnitures
	24	[398]	GETTABLE 	10 10 -4	; "seq"
	25	[398]	EQ       	0 10 5
	26	[398]	JMP      	0 2	; to 29
	27	[399]	LOADBOOL 	1 1 0
	28	[399]	JMP      	0 1	; to 30
	29	[397]	FORLOOP  	6 -7	; to 23
	30	[403]	EQ       	0 1 -5	; - false
	31	[403]	JMP      	0 1	; to 33
	32	[404]	RETURN   	5 2
	33	[395]	FORLOOP  	2 -17	; to 17
	34	[408]	LOADK    	2 -2	; 0
	35	[408]	RETURN   	2 2
	36	[409]	RETURN   	0 1
constants (5) for 0606C988:
	1	nil
	2	0
	3	1
	4	"seq"
	5	false
locals (10) for 0606C988:
	0	tempSeq	2	37
	1	exist	2	37
	2	(for index)	16	34
	3	(for limit)	16	34
	4	(for step)	16	34
	5	tempSeq	17	33
	6	(for index)	22	30
	7	(for limit)	22	30
	8	(for step)	22	30
	9	i	23	29
upvalues (1) for 0606C988:
	0	arrangedFurnitures	1	31

function <(input2.lua):411,418> (11 instructions at 0606C488)
1 param, 2 slots, 2 upvalues, 1 local, 4 constants, 0 functions
	1	[412]	EQ       	0 0 -1	; - nil
	2	[412]	JMP      	0 3	; to 6
	3	[413]	LOADNIL  	1 0
	4	[413]	SETUPVAL 	1 0	; currentSelectedItemSeq
	5	[413]	JMP      	0 3	; to 9
	6	[415]	GETTABLE 	1 0 -2	; "pos_info"
	7	[415]	GETTABLE 	1 1 -3	; "seq"
	8	[415]	SETUPVAL 	1 0	; currentSelectedItemSeq
	9	[417]	GETTABUP 	1 1 -4	; _ENV "updateFurnitureSelectedStatus"
	10	[417]	CALL     	1 1 1
	11	[418]	RETURN   	0 1
constants (4) for 0606C488:
	1	nil
	2	"pos_info"
	3	"seq"
	4	"updateFurnitureSelectedStatus"
locals (1) for 0606C488:
	0	itemData	1	12
upvalues (2) for 0606C488:
	0	currentSelectedItemSeq	1	38
	1	_ENV	0	0

function <(input2.lua):420,434> (42 instructions at 0606C388)
2 params, 9 slots, 5 upvalues, 6 locals, 14 constants, 0 functions
	1	[421]	LOADK    	2 -1	; 1
	2	[421]	GETUPVAL 	3 0	; arrangedFurnitures
	3	[421]	LEN      	3 3
	4	[421]	LOADK    	4 -1	; 1
	5	[421]	FORPREP  	2 13	; to 19
	6	[422]	GETTABUP 	6 0 5	; arrangedFurnitures
	7	[422]	GETTABLE 	6 6 -2	; "pos_info"
	8	[422]	GETTABLE 	6 6 -3	; "seq"
	9	[422]	GETTABLE 	7 1 -2	; "pos_info"
	10	[422]	GETTABLE 	7 7 -3	; "seq"
	11	[422]	EQ       	0 6 7
	12	[422]	JMP      	0 6	; to 19
	13	[423]	GETTABUP 	6 1 -4	; _ENV "table"
	14	[423]	GETTABLE 	6 6 -5	; "remove"
	15	[423]	GETUPVAL 	7 0	; arrangedFurnitures
	16	[423]	MOVE     	8 5
	17	[423]	CALL     	6 3 1
	18	[423]	JMP      	0 1	; to 20
	19	[421]	FORLOOP  	2 -14	; to 6
	20	[428]	LOADNIL  	2 0
	21	[428]	SETUPVAL 	2 2	; currentSelectedItemSeq
	22	[429]	GETTABUP 	2 3 -6	; game "callLuaFunction"
	23	[429]	MOVE     	3 0
	24	[429]	LOADK    	4 -7	; "setSelected"
	25	[429]	GETUPVAL 	5 2	; currentSelectedItemSeq
	26	[429]	CALL     	2 4 1
	27	[430]	GETTABUP 	2 1 -8	; _ENV "updateFurnitures"
	28	[430]	CALL     	2 1 1
	29	[431]	GETUPVAL 	2 4	; editPanel
	30	[431]	SELF     	2 2 -9	; "CallLuaFunction"
	31	[431]	LOADK    	4 -10	; "updateArrangedFurnitures"
	32	[431]	GETUPVAL 	5 0	; arrangedFurnitures
	33	[431]	CALL     	2 4 1
	34	[433]	GETTABUP 	2 1 -11	; _ENV "requestData"
	35	[433]	LOADK    	3 -12	; 101
	36	[433]	GETTABLE 	4 1 -2	; "pos_info"
	37	[433]	GETTABLE 	4 4 -3	; "seq"
	38	[433]	GETTABLE 	5 1 -13	; "id"
	39	[433]	GETTABLE 	6 1 -2	; "pos_info"
	40	[433]	GETTABLE 	6 6 -14	; "pos"
	41	[433]	CALL     	2 5 1
	42	[434]	RETURN   	0 1
constants (14) for 0606C388:
	1	1
	2	"pos_info"
	3	"seq"
	4	"table"
	5	"remove"
	6	"callLuaFunction"
	7	"setSelected"
	8	"updateFurnitures"
	9	"CallLuaFunction"
	10	"updateArrangedFurnitures"
	11	"requestData"
	12	101
	13	"id"
	14	"pos"
locals (6) for 0606C388:
	0	pObj	1	43
	1	pItemData	1	43
	2	(for index)	5	20
	3	(for limit)	5	20
	4	(for step)	5	20
	5	i	6	19
upvalues (5) for 0606C388:
	0	arrangedFurnitures	1	31
	1	_ENV	0	0
	2	currentSelectedItemSeq	1	38
	3	game	1	0
	4	editPanel	1	6

function <(input2.lua):436,442> (17 instructions at 0606C508)
0 params, 9 slots, 3 upvalues, 5 locals, 5 constants, 0 functions
	1	[437]	LOADNIL  	0 0
	2	[438]	LOADK    	1 -1	; 1
	3	[438]	GETTABUP 	2 0 -2	; furnitureList "num"
	4	[438]	LOADK    	3 -1	; 1
	5	[438]	FORPREP  	1 10	; to 16
	6	[439]	GETUPVAL 	5 0	; furnitureList
	7	[439]	SELF     	5 5 -3	; "GetItem"
	8	[439]	SUB      	7 4 -1	; - 1
	9	[439]	CALL     	5 3 2
	10	[439]	MOVE     	0 5
	11	[440]	GETTABUP 	5 1 -4	; game "callLuaFunction"
	12	[440]	MOVE     	6 0
	13	[440]	LOADK    	7 -5	; "setSelected"
	14	[440]	GETUPVAL 	8 2	; currentSelectedItemSeq
	15	[440]	CALL     	5 4 1
	16	[438]	FORLOOP  	1 -11	; to 6
	17	[442]	RETURN   	0 1
constants (5) for 0606C508:
	1	1
	2	"num"
	3	"GetItem"
	4	"callLuaFunction"
	5	"setSelected"
locals (5) for 0606C508:
	0	tempFurniture	2	18
	1	(for index)	5	17
	2	(for limit)	5	17
	3	(for step)	5	17
	4	i	6	16
upvalues (3) for 0606C508:
	0	furnitureList	1	4
	1	game	1	0
	2	currentSelectedItemSeq	1	38

function <(input2.lua):444,458> (45 instructions at 0606C588)
2 params, 8 slots, 8 upvalues, 4 locals, 15 constants, 0 functions
	1	[445]	LOADNIL  	2 1
	2	[448]	GETUPVAL 	4 0	; dragingObject
	3	[448]	EQ       	0 4 -1	; - nil
	4	[448]	JMP      	0 40	; to 45
	5	[449]	SETUPVAL 	0 0	; dragingObject
	6	[450]	GETTABUP 	4 1 -2	; _ENV "getDragMousePosition"
	7	[450]	GETTABLE 	5 0 -3	; "transform"
	8	[450]	GETTABLE 	5 5 -4	; "parent"
	9	[450]	GETTABLE 	5 5 -3	; "transform"
	10	[450]	GETUPVAL 	6 2	; camera
	11	[450]	CALL     	4 3 2
	12	[450]	MOVE     	2 4
	13	[451]	GETTABUP 	4 1 -5	; _ENV "CS"
	14	[451]	GETTABLE 	4 4 -6	; "UnityEngine"
	15	[451]	GETTABLE 	4 4 -7	; "Vector2"
	16	[451]	GETTABLE 	5 0 -3	; "transform"
	17	[451]	GETTABLE 	5 5 -8	; "anchoredPosition"
	18	[451]	GETTABLE 	5 5 -9	; "x"
	19	[451]	GETTABLE 	6 2 -9	; "x"
	20	[451]	SUB      	5 5 6
	21	[451]	GETTABLE 	6 0 -3	; "transform"
	22	[451]	GETTABLE 	6 6 -8	; "anchoredPosition"
	23	[451]	GETTABLE 	6 6 -10	; "y"
	24	[451]	GETTABLE 	7 2 -10	; "y"
	25	[451]	SUB      	6 6 7
	26	[451]	CALL     	4 3 2
	27	[451]	SETUPVAL 	4 3	; dragingObjectMouseOffset
	28	[452]	GETTABUP 	4 4 -11	; game "callLuaFunction"
	29	[452]	MOVE     	5 0
	30	[452]	LOADK    	6 -12	; "getData"
	31	[452]	CALL     	4 3 2
	32	[452]	MOVE     	3 4
	33	[453]	GETTABLE 	4 0 -3	; "transform"
	34	[453]	GETTABLE 	4 4 -8	; "anchoredPosition"
	35	[453]	SETUPVAL 	4 5	; dragingObjectOriginalPos
	36	[454]	GETTABLE 	4 3 -13	; "seq"
	37	[454]	SETUPVAL 	4 6	; dragingObjectSeq
	38	[455]	GETTABUP 	4 1 -14	; _ENV "onItemSelectedCallback"
	39	[455]	MOVE     	5 3
	40	[455]	CALL     	4 2 1
	41	[456]	GETTABUP 	4 4 -15	; game "active"
	42	[456]	GETUPVAL 	5 7	; uiContent
	43	[456]	LOADBOOL 	6 0 0
	44	[456]	CALL     	4 3 1
	45	[458]	RETURN   	0 1
constants (15) for 0606C588:
	1	nil
	2	"getDragMousePosition"
	3	"transform"
	4	"parent"
	5	"CS"
	6	"UnityEngine"
	7	"Vector2"
	8	"anchoredPosition"
	9	"x"
	10	"y"
	11	"callLuaFunction"
	12	"getData"
	13	"seq"
	14	"onItemSelectedCallback"
	15	"active"
locals (4) for 0606C588:
	0	obj	1	46
	1	eventData	1	46
	2	mousePosition	2	46
	3	itemData	2	46
upvalues (8) for 0606C588:
	0	dragingObject	1	24
	1	_ENV	0	0
	2	camera	1	29
	3	dragingObjectMouseOffset	1	25
	4	game	1	0
	5	dragingObjectOriginalPos	1	26
	6	dragingObjectSeq	1	27
	7	uiContent	1	19

function <(input2.lua):460,470> (30 instructions at 0606CB08)
3 params, 9 slots, 4 upvalues, 5 locals, 12 constants, 0 functions
	1	[461]	LOADNIL  	3 1
	2	[464]	GETUPVAL 	5 0	; dragingObject
	3	[464]	EQ       	0 0 5
	4	[464]	JMP      	0 25	; to 30
	5	[465]	GETTABUP 	5 1 -1	; _ENV "getDragMousePosition"
	6	[465]	GETTABLE 	6 0 -2	; "transform"
	7	[465]	GETTABLE 	6 6 -3	; "parent"
	8	[465]	GETTABLE 	6 6 -2	; "transform"
	9	[465]	GETUPVAL 	7 2	; camera
	10	[465]	CALL     	5 3 2
	11	[465]	MOVE     	3 5
	12	[466]	GETTABUP 	5 1 -4	; _ENV "CS"
	13	[466]	GETTABLE 	5 5 -5	; "UnityEngine"
	14	[466]	GETTABLE 	5 5 -6	; "Vector2"
	15	[466]	GETTABLE 	6 3 -7	; "x"
	16	[466]	GETTABUP 	7 3 -7	; dragingObjectMouseOffset "x"
	17	[466]	ADD      	6 6 7
	18	[466]	GETTABLE 	7 3 -8	; "y"
	19	[466]	GETTABUP 	8 3 -8	; dragingObjectMouseOffset "y"
	20	[466]	ADD      	7 7 8
	21	[466]	CALL     	5 3 2
	22	[466]	MOVE     	4 5
	23	[467]	GETTABLE 	5 0 -2	; "transform"
	24	[467]	SETTABLE 	5 -9 4	; "anchoredPosition" -
	25	[468]	GETTABLE 	5 2 -10	; "pos_info"
	26	[468]	GETTABUP 	6 1 -12	; _ENV "convertVector2ToProtoPoint"
	27	[468]	MOVE     	7 4
	28	[468]	CALL     	6 2 2
	29	[468]	SETTABLE 	5 -11 6	; "pos" -
	30	[470]	RETURN   	0 1
constants (12) for 0606CB08:
	1	"getDragMousePosition"
	2	"transform"
	3	"parent"
	4	"CS"
	5	"UnityEngine"
	6	"Vector2"
	7	"x"
	8	"y"
	9	"anchoredPosition"
	10	"pos_info"
	11	"pos"
	12	"convertVector2ToProtoPoint"
locals (5) for 0606CB08:
	0	obj	1	31
	1	eventData	1	31
	2	itemData	1	31
	3	mousePosition	2	31
	4	objPosition	2	31
upvalues (4) for 0606CB08:
	0	dragingObject	1	24
	1	_ENV	0	0
	2	camera	1	29
	3	dragingObjectMouseOffset	1	25

function <(input2.lua):472,490> (58 instructions at 0606C788)
3 params, 8 slots, 8 upvalues, 3 locals, 19 constants, 0 functions
	1	[474]	GETUPVAL 	3 0	; dragingObject
	2	[474]	EQ       	0 0 3
	3	[474]	JMP      	0 54	; to 58
	4	[475]	LOADNIL  	3 0
	5	[475]	SETUPVAL 	3 0	; dragingObject
	6	[476]	LOADNIL  	3 0
	7	[476]	SETUPVAL 	3 1	; dragingObjectSeq
	8	[477]	LOADNIL  	3 0
	9	[477]	SETUPVAL 	3 2	; dragingObjectMouseOffset
	10	[478]	GETTABLE 	3 2 -1	; "pos_info"
	11	[478]	GETTABUP 	4 3 -3	; _ENV "convertVector2ToProtoPoint"
	12	[478]	GETTABLE 	5 0 -4	; "transform"
	13	[478]	GETTABLE 	5 5 -5	; "anchoredPosition"
	14	[478]	CALL     	4 2 2
	15	[478]	SETTABLE 	3 -2 4	; "pos" -
	16	[479]	GETTABUP 	3 3 -6	; _ENV "CS"
	17	[479]	GETTABLE 	3 3 -7	; "UnityEngine"
	18	[479]	GETTABLE 	3 3 -8	; "Debug"
	19	[479]	GETTABLE 	3 3 -9	; "LogFormat"
	20	[479]	LOADK    	4 -10	; "[lua][onItemEndDragEvent]seq = {2}, pos = ({0}, {1})"
	21	[479]	GETTABLE 	5 2 -1	; "pos_info"
	22	[479]	GETTABLE 	5 5 -2	; "pos"
	23	[479]	GETTABLE 	5 5 -11	; "x"
	24	[479]	GETTABLE 	6 2 -1	; "pos_info"
	25	[479]	GETTABLE 	6 6 -2	; "pos"
	26	[479]	GETTABLE 	6 6 -12	; "y"
	27	[479]	GETTABLE 	7 2 -1	; "pos_info"
	28	[479]	GETTABLE 	7 7 -13	; "seq"
	29	[479]	CALL     	3 5 1
	30	[480]	GETTABUP 	3 4 -14	; game "active"
	31	[480]	GETUPVAL 	4 5	; uiContent
	32	[480]	LOADBOOL 	5 1 0
	33	[480]	CALL     	3 3 1
	34	[481]	LOADNIL  	3 0
	35	[481]	SETUPVAL 	3 6	; dragingObjectOriginalPos
	36	[482]	LOADNIL  	3 0
	37	[482]	SETUPVAL 	3 7	; dragingFromStorageSeq
	38	[484]	GETTABLE 	3 2 -1	; "pos_info"
	39	[484]	GETTABLE 	3 3 -13	; "seq"
	40	[484]	EQ       	0 3 -15	; - -1
	41	[484]	JMP      	0 8	; to 50
	42	[485]	GETTABUP 	3 3 -16	; _ENV "requestData"
	43	[485]	LOADK    	4 -17	; 100
	44	[485]	LOADK    	5 -15	; -1
	45	[485]	GETTABLE 	6 2 -18	; "id"
	46	[485]	GETTABLE 	7 2 -1	; "pos_info"
	47	[485]	GETTABLE 	7 7 -2	; "pos"
	48	[485]	CALL     	3 5 1
	49	[485]	JMP      	0 8	; to 58
	50	[487]	GETTABUP 	3 3 -16	; _ENV "requestData"
	51	[487]	LOADK    	4 -19	; 102
	52	[487]	GETTABLE 	5 2 -1	; "pos_info"
	53	[487]	GETTABLE 	5 5 -13	; "seq"
	54	[487]	GETTABLE 	6 2 -18	; "id"
	55	[487]	GETTABLE 	7 2 -1	; "pos_info"
	56	[487]	GETTABLE 	7 7 -2	; "pos"
	57	[487]	CALL     	3 5 1
	58	[490]	RETURN   	0 1
constants (19) for 0606C788:
	1	"pos_info"
	2	"pos"
	3	"convertVector2ToProtoPoint"
	4	"transform"
	5	"anchoredPosition"
	6	"CS"
	7	"UnityEngine"
	8	"Debug"
	9	"LogFormat"
	10	"[lua][onItemEndDragEvent]seq = {2}, pos = ({0}, {1})"
	11	"x"
	12	"y"
	13	"seq"
	14	"active"
	15	-1
	16	"requestData"
	17	100
	18	"id"
	19	102
locals (3) for 0606C788:
	0	obj	1	59
	1	eventData	1	59
	2	itemData	1	59
upvalues (8) for 0606C788:
	0	dragingObject	1	24
	1	dragingObjectSeq	1	27
	2	dragingObjectMouseOffset	1	25
	3	_ENV	0	0
	4	game	1	0
	5	uiContent	1	19
	6	dragingObjectOriginalPos	1	26
	7	dragingFromStorageSeq	1	28

function <(input2.lua):492,500> (32 instructions at 0606C608)
2 params, 9 slots, 1 upvalue, 5 locals, 10 constants, 0 functions
	1	[493]	GETTABUP 	2 0 -1	; _ENV "CS"
	2	[493]	GETTABLE 	2 2 -2	; "UnityEngine"
	3	[493]	GETTABLE 	2 2 -3	; "Vector2"
	4	[493]	GETTABLE 	2 2 -4	; "zero"
	5	[494]	LOADNIL  	3 1
	6	[497]	GETTABUP 	5 0 -1	; _ENV "CS"
	7	[497]	GETTABLE 	5 5 -2	; "UnityEngine"
	8	[497]	GETTABLE 	5 5 -3	; "Vector2"
	9	[497]	GETTABUP 	6 0 -1	; _ENV "CS"
	10	[497]	GETTABLE 	6 6 -2	; "UnityEngine"
	11	[497]	GETTABLE 	6 6 -5	; "Input"
	12	[497]	GETTABLE 	6 6 -6	; "mousePosition"
	13	[497]	GETTABLE 	6 6 -7	; "x"
	14	[497]	GETTABUP 	7 0 -1	; _ENV "CS"
	15	[497]	GETTABLE 	7 7 -2	; "UnityEngine"
	16	[497]	GETTABLE 	7 7 -5	; "Input"
	17	[497]	GETTABLE 	7 7 -6	; "mousePosition"
	18	[497]	GETTABLE 	7 7 -8	; "y"
	19	[497]	CALL     	5 3 2
	20	[497]	MOVE     	4 5
	21	[498]	GETTABUP 	5 0 -1	; _ENV "CS"
	22	[498]	GETTABLE 	5 5 -2	; "UnityEngine"
	23	[498]	GETTABLE 	5 5 -9	; "RectTransformUtility"
	24	[498]	GETTABLE 	5 5 -10	; "ScreenPointToLocalPointInRectangle"
	25	[498]	MOVE     	6 0
	26	[498]	MOVE     	7 4
	27	[498]	MOVE     	8 1
	28	[498]	CALL     	5 4 3
	29	[498]	MOVE     	2 6
	30	[498]	MOVE     	3 5
	31	[499]	RETURN   	2 2
	32	[500]	RETURN   	0 1
constants (10) for 0606C608:
	1	"CS"
	2	"UnityEngine"
	3	"Vector2"
	4	"zero"
	5	"Input"
	6	"mousePosition"
	7	"x"
	8	"y"
	9	"RectTransformUtility"
	10	"ScreenPointToLocalPointInRectangle"
locals (5) for 0606C608:
	0	parentRT	1	33
	1	cam	1	33
	2	position	5	33
	3	success	6	33
	4	mousePosition	6	33
upvalues (1) for 0606C608:
	0	_ENV	0	0

function <(input2.lua):502,504> (6 instructions at 0606C808)
0 params, 4 slots, 3 upvalues, 0 locals, 2 constants, 0 functions
	1	[503]	GETUPVAL 	0 0	; mapResCache
	2	[503]	SELF     	0 0 -1	; "LoadMap"
	3	[503]	GETUPVAL 	2 1	; mapId
	4	[503]	GETTABUP 	3 2 -2	; _ENV "onMapLoaded"
	5	[503]	CALL     	0 4 1
	6	[504]	RETURN   	0 1
constants (2) for 0606C808:
	1	"LoadMap"
	2	"onMapLoaded"
locals (0) for 0606C808:
upvalues (3) for 0606C808:
	0	mapResCache	1	32
	1	mapId	1	1
	2	_ENV	0	0

function <(input2.lua):506,546> (127 instructions at 0606CD88)
1 param, 19 slots, 3 upvalues, 18 locals, 35 constants, 0 functions
	1	[507]	LOADNIL  	1 8
	2	[517]	GETTABUP 	10 0 -1	; _ENV "CS"
	3	[517]	GETTABLE 	10 10 -2	; "UnityEngine"
	4	[517]	GETTABLE 	10 10 -3	; "Debug"
	5	[517]	GETTABLE 	10 10 -4	; "Log"
	6	[517]	LOADK    	11 -5	; "[NinjaHouseEditView]onMapLoaded"
	7	[517]	CALL     	10 2 1
	8	[518]	GETTABLE 	10 0 -6	; "transform"
	9	[518]	SELF     	10 10 -7	; "Find"
	10	[518]	LOADK    	12 -8	; "Background"
	11	[518]	CALL     	10 3 2
	12	[518]	MOVE     	4 10
	13	[519]	LOADK    	10 -9	; 1
	14	[519]	GETTABLE 	11 4 -10	; "childCount"
	15	[519]	LOADK    	12 -9	; 1
	16	[519]	FORPREP  	10 80	; to 97
	17	[520]	SELF     	14 4 -11	; "GetChild"
	18	[520]	SUB      	16 13 -9	; - 1
	19	[520]	CALL     	14 3 2
	20	[520]	GETTABLE 	2 14 -12	; "gameObject"
	21	[521]	GETTABUP 	14 1 -13	; game "getComponent"
	22	[521]	MOVE     	15 2
	23	[521]	GETTABUP 	16 0 -1	; _ENV "CS"
	24	[521]	GETTABLE 	16 16 -2	; "UnityEngine"
	25	[521]	GETTABLE 	16 16 -14	; "SpriteRenderer"
	26	[521]	CALL     	14 3 2
	27	[521]	MOVE     	3 14
	28	[522]	GETTABUP 	14 2 -6	; bgContainer "transform"
	29	[522]	GETTABLE 	14 14 -10	; "childCount"
	30	[522]	LE       	0 13 14
	31	[522]	JMP      	0 8	; to 40
	32	[523]	GETTABUP 	14 2 -6	; bgContainer "transform"
	33	[523]	SELF     	14 14 -11	; "GetChild"
	34	[523]	SUB      	16 13 -9	; - 1
	35	[523]	CALL     	14 3 2
	36	[523]	GETTABLE 	5 14 -12	; "gameObject"
	37	[524]	GETTABLE 	14 2 -15	; "name"
	38	[524]	SETTABLE 	5 -15 14	; "name" -
	39	[524]	JMP      	0 27	; to 67
	40	[526]	GETTABUP 	14 0 -1	; _ENV "CS"
	41	[526]	GETTABLE 	14 14 -2	; "UnityEngine"
	42	[526]	GETTABLE 	14 14 -16	; "GameObject"
	43	[526]	GETTABLE 	15 2 -15	; "name"
	44	[526]	GETTABUP 	16 0 -17	; _ENV "typeof"
	45	[526]	GETTABUP 	17 0 -1	; _ENV "CS"
	46	[526]	GETTABLE 	17 17 -2	; "UnityEngine"
	47	[526]	GETTABLE 	17 17 -18	; "RectTransform"
	48	[526]	CALL     	16 2 2
	49	[526]	GETTABUP 	17 0 -17	; _ENV "typeof"
	50	[526]	GETTABUP 	18 0 -1	; _ENV "CS"
	51	[526]	GETTABLE 	18 18 -2	; "UnityEngine"
	52	[526]	GETTABLE 	18 18 -19	; "UI"
	53	[526]	GETTABLE 	18 18 -20	; "Image"
	54	[526]	CALL     	17 2 0
	55	[526]	CALL     	14 0 2
	56	[526]	MOVE     	5 14
	57	[527]	GETTABLE 	14 5 -6	; "transform"
	58	[527]	SELF     	14 14 -21	; "SetParent"
	59	[527]	GETTABUP 	16 2 -6	; bgContainer "transform"
	60	[527]	CALL     	14 3 1
	61	[528]	GETTABLE 	14 5 -6	; "transform"
	62	[528]	GETTABUP 	15 0 -1	; _ENV "CS"
	63	[528]	GETTABLE 	15 15 -2	; "UnityEngine"
	64	[528]	GETTABLE 	15 15 -23	; "Vector3"
	65	[528]	GETTABLE 	15 15 -24	; "one"
	66	[528]	SETTABLE 	14 -22 15	; "localScale" -
	67	[530]	GETTABUP 	14 1 -25	; game "active"
	68	[530]	MOVE     	15 5
	69	[530]	LOADBOOL 	16 1 0
	70	[530]	CALL     	14 3 1
	71	[531]	GETTABLE 	14 5 -6	; "transform"
	72	[531]	GETTABUP 	15 0 -1	; _ENV "CS"
	73	[531]	GETTABLE 	15 15 -2	; "UnityEngine"
	74	[531]	GETTABLE 	15 15 -27	; "Vector2"
	75	[531]	GETTABLE 	16 2 -6	; "transform"
	76	[531]	GETTABLE 	16 16 -28	; "localPosition"
	77	[531]	GETTABLE 	16 16 -29	; "x"
	78	[531]	MUL      	16 -30 16	; 100 -
	79	[531]	GETTABLE 	17 2 -6	; "transform"
	80	[531]	GETTABLE 	17 17 -28	; "localPosition"
	81	[531]	GETTABLE 	17 17 -31	; "y"
	82	[531]	MUL      	17 -30 17	; 100 -
	83	[531]	CALL     	15 3 2
	84	[531]	SETTABLE 	14 -26 15	; "anchoredPosition" -
	85	[532]	GETTABUP 	14 1 -13	; game "getComponent"
	86	[532]	MOVE     	15 5
	87	[532]	GETTABUP 	16 0 -1	; _ENV "CS"
	88	[532]	GETTABLE 	16 16 -2	; "UnityEngine"
	89	[532]	GETTABLE 	16 16 -19	; "UI"
	90	[532]	GETTABLE 	16 16 -20	; "Image"
	91	[532]	CALL     	14 3 2
	92	[532]	MOVE     	6 14
	93	[533]	GETTABLE 	14 3 -32	; "sprite"
	94	[533]	SETTABLE 	6 -32 14	; "sprite" -
	95	[534]	SELF     	14 6 -33	; "SetNativeSize"
	96	[534]	CALL     	14 2 1
	97	[519]	FORLOOP  	10 -81	; to 17
	98	[537]	GETTABUP 	10 2 -6	; bgContainer "transform"
	99	[537]	GETTABLE 	10 10 -10	; "childCount"
	100	[537]	GETTABLE 	11 4 -10	; "childCount"
	101	[537]	LT       	0 11 10
	102	[537]	JMP      	0 16	; to 119
	103	[538]	GETTABLE 	10 4 -10	; "childCount"
	104	[538]	ADD      	10 10 -9	; - 1
	105	[538]	GETTABUP 	11 2 -6	; bgContainer "transform"
	106	[538]	GETTABLE 	11 11 -10	; "childCount"
	107	[538]	LOADK    	12 -9	; 1
	108	[538]	FORPREP  	10 9	; to 118
	109	[539]	GETTABUP 	14 2 -6	; bgContainer "transform"
	110	[539]	SELF     	14 14 -11	; "GetChild"
	111	[539]	SUB      	16 13 -9	; - 1
	112	[539]	CALL     	14 3 2
	113	[539]	GETTABLE 	5 14 -12	; "gameObject"
	114	[540]	GETTABUP 	14 1 -25	; game "active"
	115	[540]	MOVE     	15 5
	116	[540]	LOADBOOL 	16 0 0
	117	[540]	CALL     	14 3 1
	118	[538]	FORLOOP  	10 -10	; to 109
	119	[544]	GETTABUP 	10 1 -13	; game "getComponent"
	120	[544]	MOVE     	11 0
	121	[544]	LOADK    	12 -34	; "Map"
	122	[544]	CALL     	10 3 2
	123	[544]	MOVE     	9 10
	124	[545]	GETTABUP 	10 0 -35	; _ENV "calValidPosition"
	125	[545]	MOVE     	11 9
	126	[545]	CALL     	10 2 1
	127	[546]	RETURN   	0 1
constants (35) for 0606CD88:
	1	"CS"
	2	"UnityEngine"
	3	"Debug"
	4	"Log"
	5	"[NinjaHouseEditView]onMapLoaded"
	6	"transform"
	7	"Find"
	8	"Background"
	9	1
	10	"childCount"
	11	"GetChild"
	12	"gameObject"
	13	"getComponent"
	14	"SpriteRenderer"
	15	"name"
	16	"GameObject"
	17	"typeof"
	18	"RectTransform"
	19	"UI"
	20	"Image"
	21	"SetParent"
	22	"localScale"
	23	"Vector3"
	24	"one"
	25	"active"
	26	"anchoredPosition"
	27	"Vector2"
	28	"localPosition"
	29	"x"
	30	100
	31	"y"
	32	"sprite"
	33	"SetNativeSize"
	34	"Map"
	35	"calValidPosition"
locals (18) for 0606CD88:
	0	prefab	1	128
	1	i	2	128
	2	prefabImgObj	2	128
	3	prefabImg	2	128
	4	prefabBackground	2	128
	5	tempImgObj	2	128
	6	tempImg	2	128
	7	success	2	128
	8	errorStr	2	128
	9	mapComponent	2	128
	10	(for index)	16	98
	11	(for limit)	16	98
	12	(for step)	16	98
	13	i	17	97
	14	(for index)	108	119
	15	(for limit)	108	119
	16	(for step)	108	119
	17	i	109	118
upvalues (3) for 0606CD88:
	0	_ENV	0	0
	1	game	1	0
	2	bgContainer	1	3

function <(input2.lua):548,576> (80 instructions at 0606CE88)
1 param, 4 slots, 6 upvalues, 1 local, 16 constants, 0 functions
	1	[549]	EQ       	0 0 -1	; - nil
	2	[549]	JMP      	0 9	; to 12
	3	[550]	LOADK    	1 -2	; 0
	4	[550]	SETUPVAL 	1 0	; minPositionX
	5	[551]	LOADK    	1 -2	; 0
	6	[551]	SETUPVAL 	1 1	; maxPositionX
	7	[552]	LOADK    	1 -2	; 0
	8	[552]	SETUPVAL 	1 2	; minPositionY
	9	[553]	LOADK    	1 -2	; 0
	10	[553]	SETUPVAL 	1 3	; maxPositionY
	11	[554]	RETURN   	0 1
	12	[557]	GETTABUP 	1 4 -3	; _ENV "CS"
	13	[557]	GETTABLE 	1 1 -4	; "UnityEngine"
	14	[557]	GETTABLE 	1 1 -5	; "Debug"
	15	[557]	GETTABLE 	1 1 -6	; "LogFormat"
	16	[557]	LOADK    	2 -7	; "houseContentScope.transform.sizeDelta.x: {0}"
	17	[557]	GETTABUP 	3 5 -8	; houseContentScope "transform"
	18	[557]	GETTABLE 	3 3 -9	; "sizeDelta"
	19	[557]	GETTABLE 	3 3 -10	; "x"
	20	[557]	CALL     	1 3 1
	21	[558]	GETTABUP 	1 4 -3	; _ENV "CS"
	22	[558]	GETTABLE 	1 1 -4	; "UnityEngine"
	23	[558]	GETTABLE 	1 1 -5	; "Debug"
	24	[558]	GETTABLE 	1 1 -6	; "LogFormat"
	25	[558]	LOADK    	2 -11	; "houseContentScope.transform.sizeDelta.y: {0}"
	26	[558]	GETTABUP 	3 5 -8	; houseContentScope "transform"
	27	[558]	GETTABLE 	3 3 -9	; "sizeDelta"
	28	[558]	GETTABLE 	3 3 -12	; "y"
	29	[558]	CALL     	1 3 1
	30	[560]	GETTABLE 	1 0 -13	; "width"
	31	[560]	UNM      	1 1
	32	[560]	DIV      	1 1 -14	; - 2
	33	[560]	GETTABUP 	2 5 -8	; houseContentScope "transform"
	34	[560]	GETTABLE 	2 2 -15	; "rect"
	35	[560]	GETTABLE 	2 2 -13	; "width"
	36	[560]	DIV      	2 2 -14	; - 2
	37	[560]	ADD      	1 1 2
	38	[560]	SETUPVAL 	1 0	; minPositionX
	39	[561]	GETTABLE 	1 0 -13	; "width"
	40	[561]	DIV      	1 1 -14	; - 2
	41	[561]	GETTABUP 	2 5 -8	; houseContentScope "transform"
	42	[561]	GETTABLE 	2 2 -15	; "rect"
	43	[561]	GETTABLE 	2 2 -13	; "width"
	44	[561]	DIV      	2 2 -14	; - 2
	45	[561]	SUB      	1 1 2
	46	[561]	SETUPVAL 	1 1	; maxPositionX
	47	[563]	GETUPVAL 	1 0	; minPositionX
	48	[563]	GETUPVAL 	2 1	; maxPositionX
	49	[563]	LT       	0 2 1
	50	[563]	JMP      	0 4	; to 55
	51	[564]	LOADK    	1 -2	; 0
	52	[564]	SETUPVAL 	1 0	; minPositionX
	53	[565]	LOADK    	1 -2	; 0
	54	[565]	SETUPVAL 	1 1	; maxPositionX
	55	[569]	GETTABLE 	1 0 -16	; "height"
	56	[569]	UNM      	1 1
	57	[569]	DIV      	1 1 -14	; - 2
	58	[569]	GETTABUP 	2 5 -8	; houseContentScope "transform"
	59	[569]	GETTABLE 	2 2 -15	; "rect"
	60	[569]	GETTABLE 	2 2 -16	; "height"
	61	[569]	DIV      	2 2 -14	; - 2
	62	[569]	ADD      	1 1 2
	63	[569]	SETUPVAL 	1 2	; minPositionY
	64	[570]	GETTABLE 	1 0 -16	; "height"
	65	[570]	DIV      	1 1 -14	; - 2
	66	[570]	GETTABUP 	2 5 -8	; houseContentScope "transform"
	67	[570]	GETTABLE 	2 2 -15	; "rect"
	68	[570]	GETTABLE 	2 2 -16	; "height"
	69	[570]	DIV      	2 2 -14	; - 2
	70	[570]	SUB      	1 1 2
	71	[570]	SETUPVAL 	1 3	; maxPositionY
	72	[572]	GETUPVAL 	1 2	; minPositionY
	73	[572]	GETUPVAL 	2 3	; maxPositionY
	74	[572]	LT       	0 2 1
	75	[572]	JMP      	0 4	; to 80
	76	[573]	LOADK    	1 -2	; 0
	77	[573]	SETUPVAL 	1 2	; minPositionY
	78	[574]	LOADK    	1 -2	; 0
	79	[574]	SETUPVAL 	1 3	; maxPositionY
	80	[576]	RETURN   	0 1
constants (16) for 0606CE88:
	1	nil
	2	0
	3	"CS"
	4	"UnityEngine"
	5	"Debug"
	6	"LogFormat"
	7	"houseContentScope.transform.sizeDelta.x: {0}"
	8	"transform"
	9	"sizeDelta"
	10	"x"
	11	"houseContentScope.transform.sizeDelta.y: {0}"
	12	"y"
	13	"width"
	14	2
	15	"rect"
	16	"height"
locals (1) for 0606CE88:
	0	map	1	81
upvalues (6) for 0606CE88:
	0	minPositionX	1	39
	1	maxPositionX	1	40
	2	minPositionY	1	41
	3	maxPositionY	1	42
	4	_ENV	0	0
	5	houseContentScope	1	9

function <(input2.lua):578,580> (4 instructions at 015B3D50)
2 params, 4 slots, 1 upvalue, 2 locals, 1 constant, 0 functions
	1	[579]	GETTABUP 	2 0 -1	; _ENV "onItemSelectedCallback"
	2	[579]	LOADNIL  	3 0
	3	[579]	CALL     	2 2 1
	4	[580]	RETURN   	0 1
constants (1) for 015B3D50:
	1	"onItemSelectedCallback"
locals (2) for 015B3D50:
	0	obj	1	5
	1	eventData	1	5
upvalues (1) for 015B3D50:
	0	_ENV	0	0

function <(input2.lua):582,591> (36 instructions at 015B3550)
2 params, 7 slots, 7 upvalues, 3 locals, 11 constants, 0 functions
	1	[583]	LOADNIL  	2 0
	2	[584]	GETUPVAL 	3 0	; dragingObject
	3	[584]	EQ       	0 3 -1	; - nil
	4	[584]	JMP      	0 31	; to 36
	5	[585]	SETUPVAL 	0 0	; dragingObject
	6	[586]	GETTABUP 	3 1 -2	; _ENV "getDragMousePosition"
	7	[586]	GETTABLE 	4 0 -3	; "transform"
	8	[586]	GETTABLE 	4 4 -4	; "parent"
	9	[586]	GETTABLE 	4 4 -3	; "transform"
	10	[586]	GETUPVAL 	5 2	; camera
	11	[586]	CALL     	3 3 2
	12	[586]	MOVE     	2 3
	13	[587]	GETTABUP 	3 1 -5	; _ENV "CS"
	14	[587]	GETTABLE 	3 3 -6	; "UnityEngine"
	15	[587]	GETTABLE 	3 3 -7	; "Vector2"
	16	[587]	GETTABLE 	4 0 -3	; "transform"
	17	[587]	GETTABLE 	4 4 -8	; "anchoredPosition"
	18	[587]	GETTABLE 	4 4 -9	; "x"
	19	[587]	GETTABLE 	5 2 -9	; "x"
	20	[587]	SUB      	4 4 5
	21	[587]	GETTABLE 	5 0 -3	; "transform"
	22	[587]	GETTABLE 	5 5 -8	; "anchoredPosition"
	23	[587]	GETTABLE 	5 5 -10	; "y"
	24	[587]	GETTABLE 	6 2 -10	; "y"
	25	[587]	SUB      	5 5 6
	26	[587]	CALL     	3 3 2
	27	[587]	SETUPVAL 	3 3	; dragingObjectMouseOffset
	28	[588]	GETTABUP 	3 4 -11	; game "active"
	29	[588]	GETUPVAL 	4 5	; uiContent
	30	[588]	LOADBOOL 	5 0 0
	31	[588]	CALL     	3 3 1
	32	[589]	GETTABUP 	3 4 -11	; game "active"
	33	[589]	GETUPVAL 	4 6	; houseUIContainer
	34	[589]	LOADBOOL 	5 0 0
	35	[589]	CALL     	3 3 1
	36	[591]	RETURN   	0 1
constants (11) for 015B3550:
	1	nil
	2	"getDragMousePosition"
	3	"transform"
	4	"parent"
	5	"CS"
	6	"UnityEngine"
	7	"Vector2"
	8	"anchoredPosition"
	9	"x"
	10	"y"
	11	"active"
locals (3) for 015B3550:
	0	obj	1	37
	1	eventData	1	37
	2	mousePosition	2	37
upvalues (7) for 015B3550:
	0	dragingObject	1	24
	1	_ENV	0	0
	2	camera	1	29
	3	dragingObjectMouseOffset	1	25
	4	game	1	0
	5	uiContent	1	19
	6	houseUIContainer	1	8

function <(input2.lua):593,606> (49 instructions at 015B3850)
2 params, 8 slots, 8 upvalues, 4 locals, 12 constants, 0 functions
	1	[594]	LOADNIL  	2 1
	2	[597]	GETUPVAL 	4 0	; dragingObject
	3	[597]	EQ       	0 0 4
	4	[597]	JMP      	0 44	; to 49
	5	[598]	GETTABUP 	4 1 -1	; _ENV "getDragMousePosition"
	6	[598]	GETTABLE 	5 0 -2	; "transform"
	7	[598]	GETTABLE 	5 5 -3	; "parent"
	8	[598]	GETTABLE 	5 5 -2	; "transform"
	9	[598]	GETUPVAL 	6 2	; camera
	10	[598]	CALL     	4 3 2
	11	[598]	MOVE     	2 4
	12	[599]	GETTABUP 	4 1 -4	; _ENV "CS"
	13	[599]	GETTABLE 	4 4 -5	; "UnityEngine"
	14	[599]	GETTABLE 	4 4 -6	; "Vector2"
	15	[599]	GETTABLE 	5 2 -7	; "x"
	16	[599]	GETTABUP 	6 3 -7	; dragingObjectMouseOffset "x"
	17	[599]	ADD      	5 5 6
	18	[599]	GETTABLE 	6 2 -8	; "y"
	19	[599]	GETTABUP 	7 3 -8	; dragingObjectMouseOffset "y"
	20	[599]	ADD      	6 6 7
	21	[599]	CALL     	4 3 2
	22	[599]	MOVE     	3 4
	23	[600]	GETTABUP 	4 1 -9	; _ENV "math"
	24	[600]	GETTABLE 	4 4 -10	; "min"
	25	[600]	GETTABLE 	5 3 -7	; "x"
	26	[600]	GETUPVAL 	6 4	; maxPositionX
	27	[600]	CALL     	4 3 2
	28	[600]	SETTABLE 	3 -7 4	; "x" -
	29	[601]	GETTABUP 	4 1 -9	; _ENV "math"
	30	[601]	GETTABLE 	4 4 -11	; "max"
	31	[601]	GETTABLE 	5 3 -7	; "x"
	32	[601]	GETUPVAL 	6 5	; minPositionX
	33	[601]	CALL     	4 3 2
	34	[601]	SETTABLE 	3 -7 4	; "x" -
	35	[602]	GETTABUP 	4 1 -9	; _ENV "math"
	36	[602]	GETTABLE 	4 4 -10	; "min"
	37	[602]	GETTABLE 	5 3 -8	; "y"
	38	[602]	GETUPVAL 	6 6	; maxPositionY
	39	[602]	CALL     	4 3 2
	40	[602]	SETTABLE 	3 -8 4	; "y" -
	41	[603]	GETTABUP 	4 1 -9	; _ENV "math"
	42	[603]	GETTABLE 	4 4 -11	; "max"
	43	[603]	GETTABLE 	5 3 -8	; "y"
	44	[603]	GETUPVAL 	6 7	; minPositionY
	45	[603]	CALL     	4 3 2
	46	[603]	SETTABLE 	3 -8 4	; "y" -
	47	[604]	GETTABLE 	4 0 -2	; "transform"
	48	[604]	SETTABLE 	4 -12 3	; "anchoredPosition" -
	49	[606]	RETURN   	0 1
constants (12) for 015B3850:
	1	"getDragMousePosition"
	2	"transform"
	3	"parent"
	4	"CS"
	5	"UnityEngine"
	6	"Vector2"
	7	"x"
	8	"y"
	9	"math"
	10	"min"
	11	"max"
	12	"anchoredPosition"
locals (4) for 015B3850:
	0	obj	1	50
	1	eventData	1	50
	2	mousePosition	2	50
	3	objPosition	2	50
upvalues (8) for 015B3850:
	0	dragingObject	1	24
	1	_ENV	0	0
	2	camera	1	29
	3	dragingObjectMouseOffset	1	25
	4	maxPositionX	1	40
	5	minPositionX	1	39
	6	maxPositionY	1	42
	7	minPositionY	1	41

function <(input2.lua):608,618> (22 instructions at 08189580)
2 params, 5 slots, 8 upvalues, 2 locals, 1 constant, 0 functions
	1	[609]	GETUPVAL 	2 0	; dragingObject
	2	[609]	EQ       	0 0 2
	3	[609]	JMP      	0 18	; to 22
	4	[610]	LOADNIL  	2 0
	5	[610]	SETUPVAL 	2 0	; dragingObject
	6	[611]	LOADNIL  	2 0
	7	[611]	SETUPVAL 	2 1	; dragingObjectMouseOffset
	8	[612]	LOADNIL  	2 0
	9	[612]	SETUPVAL 	2 2	; dragingObjectOriginalPos
	10	[613]	LOADNIL  	2 0
	11	[613]	SETUPVAL 	2 3	; dragingObjectSeq
	12	[614]	LOADNIL  	2 0
	13	[614]	SETUPVAL 	2 4	; dragingFromStorageSeq
	14	[615]	GETTABUP 	2 5 -1	; game "active"
	15	[615]	GETUPVAL 	3 6	; uiContent
	16	[615]	LOADBOOL 	4 1 0
	17	[615]	CALL     	2 3 1
	18	[616]	GETTABUP 	2 5 -1	; game "active"
	19	[616]	GETUPVAL 	3 7	; houseUIContainer
	20	[616]	LOADBOOL 	4 1 0
	21	[616]	CALL     	2 3 1
	22	[618]	RETURN   	0 1
constants (1) for 08189580:
	1	"active"
locals (2) for 08189580:
	0	obj	1	23
	1	eventData	1	23
upvalues (8) for 08189580:
	0	dragingObject	1	24
	1	dragingObjectMouseOffset	1	25
	2	dragingObjectOriginalPos	1	26
	3	dragingObjectSeq	1	27
	4	dragingFromStorageSeq	1	28
	5	game	1	0
	6	uiContent	1	19
	7	houseUIContainer	1	8

function <(input2.lua):620,623> (10 instructions at 08188B00)
0 params, 2 slots, 2 upvalues, 0 locals, 7 constants, 0 functions
	1	[621]	GETTABUP 	0 0 -1	; game "model"
	2	[621]	LOADK    	1 -2	; "WorldModel"
	3	[621]	CALL     	0 2 2
	4	[621]	SETTABLE 	0 -3 -4	; "forceChangeMap" true
	5	[622]	GETTABUP 	0 0 -5	; game "call"
	6	[622]	GETTABUP 	1 1 -6	; _ENV "CS"
	7	[622]	GETTABLE 	1 1 -7	; "EnterDefaultMapCommand"
	8	[622]	CALL     	1 1 0
	9	[622]	CALL     	0 0 1
	10	[623]	RETURN   	0 1
constants (7) for 08188B00:
	1	"model"
	2	"WorldModel"
	3	"forceChangeMap"
	4	true
	5	"call"
	6	"CS"
	7	"EnterDefaultMapCommand"
locals (0) for 08188B00:
upvalues (2) for 08188B00:
	0	game	1	0
	1	_ENV	0	0

function <(input2.lua):626,634> (17 instructions at 08189700)
0 params, 3 slots, 4 upvalues, 0 locals, 8 constants, 0 functions
	1	[627]	GETUPVAL 	0 0	; taskSection
	2	[627]	EQ       	1 0 -1	; - nil
	3	[627]	JMP      	0 13	; to 17
	4	[628]	GETTABUP 	0 0 -2	; taskSection "status"
	5	[628]	EQ       	0 0 -3	; - 0
	6	[628]	JMP      	0 4	; to 11
	7	[629]	GETTABUP 	0 1 -4	; game "showTip"
	8	[629]	LOADK    	1 -5	; "??????\166\196????"
	9	[629]	CALL     	0 2 1
	10	[629]	JMP      	0 6	; to 17
	11	[631]	GETTABUP 	0 1 -6	; game "call"
	12	[631]	GETTABUP 	1 2 -7	; _ENV "CS"
	13	[631]	GETTABLE 	1 1 -8	; "ShowTaskNpcDialogCommand"
	14	[631]	GETUPVAL 	2 3	; startPartyDialogId
	15	[631]	CALL     	1 2 0
	16	[631]	CALL     	0 0 1
	17	[634]	RETURN   	0 1
constants (8) for 08189700:
	1	nil
	2	"status"
	3	0
	4	"showTip"
	5	"??????\166\196????"
	6	"call"
	7	"CS"
	8	"ShowTaskNpcDialogCommand"
locals (0) for 08189700:
upvalues (4) for 08189700:
	0	taskSection	1	23
	1	game	1	0
	2	_ENV	0	0
	3	startPartyDialogId	1	2

function <(input2.lua):636,640> (16 instructions at 08189680)
0 params, 7 slots, 3 upvalues, 0 locals, 7 constants, 0 functions
	1	[637]	GETUPVAL 	0 0	; taskChapter
	2	[637]	EQ       	1 0 -1	; - nil
	3	[637]	JMP      	0 12	; to 16
	4	[637]	GETUPVAL 	0 1	; taskSection
	5	[637]	EQ       	1 0 -1	; - nil
	6	[637]	JMP      	0 9	; to 16
	7	[637]	GETTABUP 	0 1 -2	; taskSection "status"
	8	[637]	EQ       	0 0 -3	; - 1
	9	[637]	JMP      	0 6	; to 16
	10	[638]	GETTABUP 	0 2 -4	; _ENV "requestData"
	11	[638]	LOADK    	1 -5	; 2
	12	[638]	LOADNIL  	2 2
	13	[638]	GETTABUP 	5 0 -6	; taskChapter "chapter_id"
	14	[638]	GETTABUP 	6 1 -7	; taskSection "section_id"
	15	[638]	CALL     	0 7 1
	16	[640]	RETURN   	0 1
constants (7) for 08189680:
	1	nil
	2	"status"
	3	1
	4	"requestData"
	5	2
	6	"chapter_id"
	7	"section_id"
locals (0) for 08189680:
upvalues (3) for 08189680:
	0	taskChapter	1	22
	1	taskSection	1	23
	2	_ENV	0	0

function <(input2.lua):642,644> (4 instructions at 08189380)
0 params, 2 slots, 2 upvalues, 0 locals, 2 constants, 0 functions
	1	[643]	GETTABUP 	0 0 -1	; game "closeSelf"
	2	[643]	GETTABUP 	1 1 -2	; _ENV "self"
	3	[643]	CALL     	0 2 1
	4	[644]	RETURN   	0 1
constants (2) for 08189380:
	1	"closeSelf"
	2	"self"
locals (0) for 08189380:
upvalues (2) for 08189380:
	0	game	1	0
	1	_ENV	0	0

function <(input2.lua):646,652> (19 instructions at 08188F00)
1 param, 4 slots, 1 upvalue, 2 locals, 7 constants, 0 functions
	1	[647]	NEWTABLE 	1 0 0
	2	[648]	GETTABUP 	2 0 -2	; _ENV "CS"
	3	[648]	GETTABLE 	2 2 -3	; "UnityEngine"
	4	[648]	GETTABLE 	2 2 -4	; "Mathf"
	5	[648]	GETTABLE 	2 2 -5	; "RoundToInt"
	6	[648]	GETTABLE 	3 0 -1	; "x"
	7	[648]	MUL      	3 3 -6	; - 100
	8	[648]	CALL     	2 2 2
	9	[648]	SETTABLE 	1 -1 2	; "x" -
	10	[649]	GETTABUP 	2 0 -2	; _ENV "CS"
	11	[649]	GETTABLE 	2 2 -3	; "UnityEngine"
	12	[649]	GETTABLE 	2 2 -4	; "Mathf"
	13	[649]	GETTABLE 	2 2 -5	; "RoundToInt"
	14	[649]	GETTABLE 	3 0 -7	; "y"
	15	[649]	MUL      	3 3 -6	; - 100
	16	[649]	CALL     	2 2 2
	17	[649]	SETTABLE 	1 -7 2	; "y" -
	18	[651]	RETURN   	1 2
	19	[652]	RETURN   	0 1
constants (7) for 08188F00:
	1	"x"
	2	"CS"
	3	"UnityEngine"
	4	"Mathf"
	5	"RoundToInt"
	6	100
	7	"y"
locals (2) for 08188F00:
	0	point	1	20
	1	result	2	20
upvalues (1) for 08188F00:
	0	_ENV	0	0

function <(input2.lua):654,660> (21 instructions at 08189400)
0 params, 3 slots, 6 upvalues, 0 locals, 1 constant, 0 functions
	1	[655]	GETTABUP 	0 0 -1	; game "active"
	2	[655]	GETUPVAL 	1 1	; showUIButton
	3	[655]	LOADBOOL 	2 0 0
	4	[655]	CALL     	0 3 1
	5	[656]	GETTABUP 	0 0 -1	; game "active"
	6	[656]	GETUPVAL 	1 2	; hideUIButton
	7	[656]	LOADBOOL 	2 1 0
	8	[656]	CALL     	0 3 1
	9	[657]	GETTABUP 	0 0 -1	; game "active"
	10	[657]	GETUPVAL 	1 3	; editPanel
	11	[657]	LOADBOOL 	2 1 0
	12	[657]	CALL     	0 3 1
	13	[658]	GETTABUP 	0 0 -1	; game "active"
	14	[658]	GETUPVAL 	1 4	; bottom
	15	[658]	LOADBOOL 	2 1 0
	16	[658]	CALL     	0 3 1
	17	[659]	GETTABUP 	0 0 -1	; game "active"
	18	[659]	GETUPVAL 	1 5	; backButton
	19	[659]	LOADBOOL 	2 1 0
	20	[659]	CALL     	0 3 1
	21	[660]	RETURN   	0 1
constants (1) for 08189400:
	1	"active"
locals (0) for 08189400:
upvalues (6) for 08189400:
	0	game	1	0
	1	showUIButton	1	16
	2	hideUIButton	1	17
	3	editPanel	1	6
	4	bottom	1	7
	5	backButton	1	15

function <(input2.lua):662,668> (21 instructions at 08188A80)
0 params, 3 slots, 6 upvalues, 0 locals, 1 constant, 0 functions
	1	[663]	GETTABUP 	0 0 -1	; game "active"
	2	[663]	GETUPVAL 	1 1	; showUIButton
	3	[663]	LOADBOOL 	2 1 0
	4	[663]	CALL     	0 3 1
	5	[664]	GETTABUP 	0 0 -1	; game "active"
	6	[664]	GETUPVAL 	1 2	; hideUIButton
	7	[664]	LOADBOOL 	2 0 0
	8	[664]	CALL     	0 3 1
	9	[665]	GETTABUP 	0 0 -1	; game "active"
	10	[665]	GETUPVAL 	1 3	; editPanel
	11	[665]	LOADBOOL 	2 0 0
	12	[665]	CALL     	0 3 1
	13	[666]	GETTABUP 	0 0 -1	; game "active"
	14	[666]	GETUPVAL 	1 4	; bottom
	15	[666]	LOADBOOL 	2 0 0
	16	[666]	CALL     	0 3 1
	17	[667]	GETTABUP 	0 0 -1	; game "active"
	18	[667]	GETUPVAL 	1 5	; backButton
	19	[667]	LOADBOOL 	2 0 0
	20	[667]	CALL     	0 3 1
	21	[668]	RETURN   	0 1
constants (1) for 08188A80:
	1	"active"
locals (0) for 08188A80:
upvalues (6) for 08188A80:
	0	game	1	0
	1	showUIButton	1	16
	2	hideUIButton	1	17
	3	editPanel	1	6
	4	bottom	1	7
	5	backButton	1	15

function <(input2.lua):670,679> (37 instructions at 08189280)
0 params, 4 slots, 6 upvalues, 0 locals, 15 constants, 0 functions
	1	[671]	GETUPVAL 	0 0	; houseEvtUtil
	2	[671]	SELF     	0 0 -1	; "OnPointerClickEvent"
	3	[671]	LOADK    	2 -2	; "-"
	4	[671]	GETTABUP 	3 1 -3	; _ENV "onHousePointerClickEvent"
	5	[671]	CALL     	0 4 1
	6	[672]	GETUPVAL 	0 0	; houseEvtUtil
	7	[672]	SELF     	0 0 -4	; "OnBeginDragEvent"
	8	[672]	LOADK    	2 -2	; "-"
	9	[672]	GETTABUP 	3 1 -5	; _ENV "onHouseBeginDragEvent"
	10	[672]	CALL     	0 4 1
	11	[673]	GETUPVAL 	0 0	; houseEvtUtil
	12	[673]	SELF     	0 0 -6	; "OnDragEvent"
	13	[673]	LOADK    	2 -2	; "-"
	14	[673]	GETTABUP 	3 1 -7	; _ENV "onHouseDragEvent"
	15	[673]	CALL     	0 4 1
	16	[674]	GETUPVAL 	0 0	; houseEvtUtil
	17	[674]	SELF     	0 0 -8	; "OnEndDragEvent"
	18	[674]	LOADK    	2 -2	; "-"
	19	[674]	GETTABUP 	3 1 -9	; _ENV "onHouseEndDragEvent"
	20	[674]	CALL     	0 4 1
	21	[675]	GETTABUP 	0 2 -10	; partyButton "onClick"
	22	[675]	SELF     	0 0 -11	; "RemoveListener"
	23	[675]	GETTABUP 	2 1 -12	; _ENV "onPartyButtonClicked"
	24	[675]	CALL     	0 3 1
	25	[676]	GETTABUP 	0 3 -10	; backButton "onClick"
	26	[676]	SELF     	0 0 -11	; "RemoveListener"
	27	[676]	GETTABUP 	2 1 -13	; _ENV "onBackButtonClicked"
	28	[676]	CALL     	0 3 1
	29	[677]	GETTABUP 	0 4 -10	; showUIButton "onClick"
	30	[677]	SELF     	0 0 -11	; "RemoveListener"
	31	[677]	GETTABUP 	2 1 -14	; _ENV "onShowUIButtonClicked"
	32	[677]	CALL     	0 3 1
	33	[678]	GETTABUP 	0 5 -10	; hideUIButton "onClick"
	34	[678]	SELF     	0 0 -11	; "RemoveListener"
	35	[678]	GETTABUP 	2 1 -15	; _ENV "onHideUIButtonClicked"
	36	[678]	CALL     	0 3 1
	37	[679]	RETURN   	0 1
constants (15) for 08189280:
	1	"OnPointerClickEvent"
	2	"-"
	3	"onHousePointerClickEvent"
	4	"OnBeginDragEvent"
	5	"onHouseBeginDragEvent"
	6	"OnDragEvent"
	7	"onHouseDragEvent"
	8	"OnEndDragEvent"
	9	"onHouseEndDragEvent"
	10	"onClick"
	11	"RemoveListener"
	12	"onPartyButtonClicked"
	13	"onBackButtonClicked"
	14	"onShowUIButtonClicked"
	15	"onHideUIButtonClicked"
locals (0) for 08189280:
upvalues (6) for 08189280:
	0	houseEvtUtil	1	5
	1	_ENV	0	0
	2	partyButton	1	12
	3	backButton	1	15
	4	showUIButton	1	16
	5	hideUIButton	1	17
<(input2.lua):54> unresolved external symbol "bgContainerObj".
<(input2.lua):55> unresolved external symbol "furnitureListObj".
<(input2.lua):56> unresolved external symbol "houseContentObj".
<(input2.lua):57> unresolved external symbol "editPanelObj".
<(input2.lua):58> unresolved external symbol "houseUIContainerObj".
<(input2.lua):59> unresolved external symbol "houseContentScopeObj".
<(input2.lua):60> unresolved external symbol "furnitureProcessTextObj".
<(input2.lua):60> unresolved external symbol "CS.UnityEngine.UI.Text".
<(input2.lua):61> unresolved external symbol "ninjaProcessTextObj".
<(input2.lua):61> unresolved external symbol "CS.UnityEngine.UI.Text".
<(input2.lua):62> unresolved external symbol "partyButtonObj".
<(input2.lua):63> unresolved external symbol "partyRewardRedDotObj".
<(input2.lua):64> unresolved external symbol "receivedTagObj".
<(input2.lua):65> unresolved external symbol "bottomObj".
<(input2.lua):66> unresolved external symbol "backButtonObj".
<(input2.lua):67> unresolved external symbol "showUIButtonObj".
<(input2.lua):68> unresolved external symbol "hideUIButtonObj".
<(input2.lua):69> unresolved external symbol "switchUIAreaObj".
<(input2.lua):70> unresolved external symbol "uiContentObj".
<(input2.lua):99> unresolved external symbol "CS.UnityEngine.Camera".
<(input2.lua):193> unresolved external symbol "CS.System.String.Format".
<(input2.lua):194> unresolved external symbol "CS.System.String.Format".
<(input2.lua):263> unresolved external symbol "tempBagFurniture.str_arg_list_data".
<(input2.lua):265> unresolved external symbol "tempBagFurniture.str_arg_list_data".
<(input2.lua):266> unresolved external symbol "tempBagFurniture.str_arg_list_data".
<(input2.lua):270> unresolved external symbol "tempBagFurniture.cur_value".
<(input2.lua):367> unresolved external symbol "furnitureListObj.transform".
<(input2.lua):384> unresolved external symbol "CS.EvtUtil.ExecuteBeginDragEvent".
<(input2.lua):451> unresolved external symbol "CS.UnityEngine.Vector2".
<(input2.lua):466> unresolved external symbol "CS.UnityEngine.Vector2".
<(input2.lua):479> unresolved external symbol "CS.UnityEngine.Debug.LogFormat".
<(input2.lua):493> unresolved external symbol "CS.UnityEngine.Vector2.zero".
<(input2.lua):497> unresolved external symbol "CS.UnityEngine.Vector2".
<(input2.lua):497> unresolved external symbol "CS.UnityEngine.Input.mousePosition.x".
<(input2.lua):497> unresolved external symbol "CS.UnityEngine.Input.mousePosition.y".
<(input2.lua):498> unresolved external symbol "CS.UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle".
<(input2.lua):517> unresolved external symbol "CS.UnityEngine.Debug.Log".
<(input2.lua):521> unresolved external symbol "CS.UnityEngine.SpriteRenderer".
<(input2.lua):526> unresolved external symbol "CS.UnityEngine.GameObject".
<(input2.lua):526> unresolved external symbol "typeof".
<(input2.lua):526> unresolved external symbol "CS.UnityEngine.RectTransform".
<(input2.lua):526> unresolved external symbol "typeof".
<(input2.lua):526> unresolved external symbol "CS.UnityEngine.UI.Image".
<(input2.lua):528> unresolved external symbol "CS.UnityEngine.Vector3.one".
<(input2.lua):531> unresolved external symbol "CS.UnityEngine.Vector2".
<(input2.lua):532> unresolved external symbol "CS.UnityEngine.UI.Image".
<(input2.lua):557> unresolved external symbol "CS.UnityEngine.Debug.LogFormat".
<(input2.lua):558> unresolved external symbol "CS.UnityEngine.Debug.LogFormat".
<(input2.lua):587> unresolved external symbol "CS.UnityEngine.Vector2".
<(input2.lua):599> unresolved external symbol "CS.UnityEngine.Vector2".
<(input2.lua):622> unresolved external symbol "CS.EnterDefaultMapCommand".
<(input2.lua):631> unresolved external symbol "CS.ShowTaskNpcDialogCommand".
<(input2.lua):648> unresolved external symbol "CS.UnityEngine.Mathf.RoundToInt".
<(input2.lua):649> unresolved external symbol "CS.UnityEngine.Mathf.RoundToInt".

