//Maya ASCII 6.0 scene
//Name: fish-walk.ma
//Last modified: Mon, Nov 1, 2004 8:42:40 PM
requires maya "6.0";
currentUnit -l meter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya Complete 6.0";
fileInfo "version" "6.0";
fileInfo "cutIdentifier" "200404092210-618567";
fileInfo "osv" "Mac OS X 10.3.4";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.023295555062304376 0.013244928014616917 0.057078206999265982 ;
	setAttr ".r" -type "double3" 705.86164726921186 743.79999999996699 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 10;
	setAttr ".fd" 0.05;
	setAttr ".coi" 0.067067224727587582;
	setAttr ".ow" 0.1;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.028794586658477783 -1.7266537249088287 
		-0.57957565784454346 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.00034814094227908932 1 6.9628188455817607e-05 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 10;
	setAttr ".fd" 0.05;
	setAttr ".coi" 1;
	setAttr ".ow" 0.04707139486584188;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.00043676317358291834 -0.015996611946339796 
		1.0003886832525135 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 10;
	setAttr ".fd" 0.05;
	setAttr ".coi" 1;
	setAttr ".ow" 0.094343708161986742;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1 -0.014189819116814663 -0.0048409153775751538 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 10;
	setAttr ".fd" 0.05;
	setAttr ".coi" 1;
	setAttr ".ow" 0.091071206354968903;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pCube1";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr ".s" -type "double3" 1.5 1.5 1.5 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "pCubeShape1" -p "pCube1";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".dr" 1;
createNode mesh -n "pCubeShape1Orig" -p "pCube1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
createNode joint -n "joint1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000028 10.459909092929163 90 ;
	setAttr ".bps" -type "matrix" -0 0.98338218038722636 -0.18154747945610394 0
		 5.5511151231257827e-16 0.18154747945610406 0.98338218038722625 0 0.99999999999999989 5.5511151231257827e-17 -4.4408920985006262e-16 0
		 0 -2.3266829938518687 -0.10112195508370005 1;
createNode joint -n "joint2" -p "joint1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.0077204268001734933 0.00077518613731292533 
		-4.3031474900752401e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999914622634 7.5002631438214137e-15 
		13.639739212793446 ;
	setAttr ".bps" -type "matrix" 1.3090428147222918e-16 0.99846035320541238 0.055470019622523702 0
		 1.4901160776856255e-08 0.05547001962252366 -0.99846035320541215 0 -0.99999999999999989 8.2656765510308425e-10 -1.4878218346966828e-08 0
		 -1.3855224001996712e-33 -1.5533966708905624 -0.16505393428171158 1;
createNode joint -n "joint3" -p "joint2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.009389946141314531 4.5061368867563062e-05 
		6.7146793150493721e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 176.82016961966212 89.999999146226372 90.000000853773656 ;
	setAttr ".bps" -type "matrix" 1 -1.914599292360081e-16 -1.5758005736094441e-18 0
		 3.4205152564096672e-16 0.99999999999999989 -1.9447283060821217e-08 0 2.0594900693116643e-16 1.9447283142223045e-08 0.99999999999999989 0
		 -2.2518975708751936e-25 -0.61559782130536167 -0.11746708363793845 1;
createNode joint -n "rightArm" -p "joint3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.005195224219623833 -0.0010971511743210439 
		0.00049146664101635032 ;
	setAttr ".r" -type "double3" 39.169619627334804 15.112985054788076 -11.307471023295307 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.99869275951126379 0.051115282448374426 -9.940533680811087e-10 0
		 -0.051115282448374287 0.99869275951126368 -1.942186078492765e-08 0 2.0594900693116643e-16 1.9447283142223045e-08 0.99999999999999989 0
		 0.5195224219623833 -0.72531293778169703 -0.068320417402642497 1;
createNode joint -n "joint5" -p "rightArm";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.0063361651494793217 0 -0.0005727246590126378 ;
	setAttr ".r" -type "double3" -5.4397679207920653e-15 -54.372196396193644 
		-4.0816691927356354e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -2.4263358316022159 0 ;
	setAttr ".bps" -type "matrix" 0.9977974080200972 0.051069457221643487 0.042334892080439716 0
		 -0.051115282448374287 0.99869275951126368 -1.942186078492765e-08 0 -0.042279551187289557 -0.0021639405870306945 0.99910347657914655 0
		 1.1523106477476435 -0.69292545176997267 -0.1255928839337549 1;
createNode joint -n "joint6" -p "joint5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.0069454244036747225 -1.1102230246251566e-18 
		0.00055329734980219764 ;
	setAttr ".r" -type "double3" 0 -32.68268800595834 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.4263358316022159 0 ;
	setAttr ".bps" -type "matrix" 0.99869275951126368 0.051115282448374426 -9.9405338069439833e-10 0
		 -0.051115282448374287 0.99869275951126368 -1.942186078492765e-08 0 2.2134572575333694e-16 1.9447283142785852e-08 0.99999999999999989 0
		 1.8429839781439847 -0.65757527658220361 -0.040909374098572343 1;
createNode joint -n "joint24" -p "joint6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.016406264050596184 0.0048242091533583211 
		-0.00040802439132786757 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.9299667188663463 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 1.2057357744119529e-09 -3.7620890487403893e-17 0
		 -1.2057356363678893e-09 1 -1.9447283061465948e-08 0 2.2134572575333694e-16 1.9447283142785852e-08 0.99999999999999989 0
		 3.5199098281884504 -0.43172035328514174 -0.13094910575006596 1;
createNode joint -n "joint25" -p "joint6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.016685029714522709 -0.0043687630342591393 
		-0.0007696301317600563 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.1142472424665145e-06 -1.7549584092409613e-15 
		-2.9299667188663463 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 1.2057357744119529e-09 -3.7620890487403893e-17 0
		 -1.2057356363678893e-09 1 -1.9447283061465948e-08 0 2.2134572575333694e-16 1.9447283142785852e-08 0.99999999999999989 0
		 3.499559898659069 -0.83967014959659592 -0.091581278961233581 1;
createNode ikEffector -n "effector1" -p "joint5";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "leftArm" -p "joint3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" -0.0051952200000000004 -0.0010971517965040667 
		0.00049146643134637309 ;
	setAttr ".r" -type "double3" 1.8711031214895262 50.659916139815053 -42.353138047477941 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999888575275 0 0 ;
	setAttr ".bps" -type "matrix" 0.9986927596345182 -0.051115280040223594 -2.2065354990171161e-17 0
		 -0.05111528004022374 -0.99869275963451809 -4.0028558042337149e-16 0 -2.0594900038259094e-16 3.1948835914829093e-16 -0.99999999999999978 0
		 -0.51952200000000004 -0.72531299999999954 -0.068320438369638997 1;
createNode joint -n "joint8" -p "leftArm";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" -0.0063361631567355019 -5.2527295069104701e-09 
		0.00057272200000000001 ;
	setAttr ".r" -type "double3" 2.3303646855006906e-05 -75.088837010112741 
		-0.00029444135652211283 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -2.4263358316020645 0 ;
	setAttr ".bps" -type "matrix" 0.99779740814324125 -0.051069453992352958 -0.042334893073599271 0
		 -0.05111528004022374 -0.99869275963451809 -4.0028558042337149e-16 0 -0.042279551192505302 0.0021639599149302674 -0.99910347653706344 0
		 -1.1523099999999999 -0.69292499999999857 -0.12559263836963896 1;
createNode joint -n "joint9" -p "joint8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.4263358316020649 0 ;
	setAttr ".bps" -type "matrix" 0.9986927596345182 -0.051115280040223587 -2.1359202935393352e-17 0
		 -0.05111528004022374 -0.99869275963451809 -4.0028558042337149e-16 0 -2.0739794315158338e-16 3.1955449978681395e-16 -0.99999999999999978 0
		 -1.8429799999999998 -0.65757499999999758 -0.040909338369638962 1;
createNode joint -n "joint26" -p "joint9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" -0.016319957173584091 -0.0033347588977125243 
		0.0012825509868511665 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999997 -1.7655625192200639e-31 
		-2.9299666497923602 ;
	setAttr ".bps" -type "matrix" 1 -1.2748185726283815e-15 -8.7057178373812427e-19 0
		 1.4296900930922915e-15 1 -1.6569979717039747e-16 0 2.073979431515842e-16 2.4699938997798401e-16 0.99999999999999978 0
		 -3.50273421431725 -0.48437682295131956 -0.1436046317983313 1;
createNode joint -n "joint27" -p "joint9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" -0.016491285147219894 0.0010198202140280078 
		0.0018403712167986746 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999997 -1.7655625192200639e-31 
		-2.9299666497923602 ;
	setAttr ".bps" -type "matrix" 1 -1.2748185726283815e-15 -8.7057178373812427e-19 0
		 1.4296900930922915e-15 1 -1.6569979717039747e-16 0 2.073979431515842e-16 2.4699938997798401e-16 0.99999999999999978 0
		 -3.5051146796887585 -0.80487809698205326 -0.15083145336098885 1;
createNode ikEffector -n "effector2" -p "joint8";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "head" -p "joint3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" -8.2853271836453574e-19 0.0022776234817780644 
		0.00024019602995749859 ;
	setAttr ".r" -type "double3" 0 0 -17.736579836682015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000028 10.619654161907867 90.000000000000028 ;
	setAttr ".bps" -type "matrix" -1.4585031441905789e-16 0.9828721869343221 -0.18428853505018505 0
		 4.3199117330527925e-16 0.18428853505018503 0.9828721869343221 0 1 2.5262927197772587e-16 -4.4566501906000055e-16 0
		 -3.1722221434582908e-32 -0.38783547266043927 -0.093447485071547459 1;
createNode joint -n "joint16" -p "head";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.0012297324460901343 -2.7755575615628914e-19 
		9.2444637330587318e-35 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 4.0789761497814096e-15 25.308442049473516 ;
	setAttr ".bps" -type "matrix" 5.2820829047571214e-17 0.96731739664177874 0.25356863795464135 0
		 -3.3041350243515114e-16 0.25356863795464141 -0.96731739664177863 0 -1 -2.215760698941953e-16 3.2720280370431002e-16 0
		 -1.7935686391356357e-17 -0.26696849079716889 -0.11611004417091064 1;
createNode joint -n "joint17" -p "joint16";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.0092473203452774853 0.00031551185453618588 
		6.4947010331945883e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 75.31121322668163 89.999999999999986 0 ;
	setAttr ".bps" -type "matrix" 1 4.5043956607763306e-16 -3.2459615796190177e-16 0
		 -1.9922144862532014e-16 1.0000000000000002 4.6969955188429949e-16 0 3.3300843466808998e-16 -4.872316031615172e-16 1 0
		 -4.4462521704410427e-17 0.63554128455479664 0.087852987723358644 1;
createNode joint -n "joint28" -p "joint17";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -11.888658039627991 ;
	setAttr ".bps" -type "matrix" 0.97854978498674894 -0.20601048104984176 -4.1439653121372361e-16 0
		 0.20601048104984196 0.97854978498674927 3.9275418485609166e-16 0 3.3300843466808998e-16 -4.872316031615172e-16 1 0
		 0.41632555240806851 0.630330800822551 -0.090099208683109833 1;
createNode joint -n "joint29" -p "joint28";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.0087459408727391091 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 11.888658039627968 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 5.28059714897935e-17 -3.2459615796190196e-16 0
		 2.1445560750550195e-16 1.0000000000000002 4.6969955188429939e-16 0 3.3300843466808998e-16 -4.872316031615172e-16 1 0
		 1.272159408460636 0.45015525217990532 -0.090099208683110193 1;
createNode joint -n "joint30" -p "joint17";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999997 0 11.888658039627968 ;
	setAttr ".bps" -type "matrix" 0.97854978498674905 0.20601048104984226 -2.2087046994856417e-16 0
		 0.20601048104984196 -0.97854978498674894 4.0059283611382678e-17 0 -2.1629239529698483e-16 -6.7169583851232095e-17 -1 0
		 -0.42083884856759829 0.63034961589196126 -0.092725210125975538 1;
createNode joint -n "joint31" -p "joint30";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" -0.0087459627821755582 -4.4408920985006263e-18 
		4.9303806576313239e-34 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.505099231390503e-16 1.4455156579780673e-15 
		11.888658039627966 ;
	setAttr ".bps" -type "matrix" 1 5.4710015688815044e-16 -2.0788011859079669e-16 0
		 2.1874406211879518e-16 -1 8.4701635128450039e-17 0 -2.1629239529698483e-16 -6.7169583851232095e-17 -1 0
		 -1.2766748485675985 0.45017361589196137 -0.092725210125975344 1;
createNode transform -n "group2" -p "head";
	setAttr ".t" -type "double3" 0.0036397139905651279 0.0016332056511287262 
		-1.7467699556054301e-19 ;
	setAttr ".r" -type "double3" -79.380344723844885 -89.999999999999972 0 ;
	setAttr ".s" -type "double3" 6.5111053872861415 6.5111053872861406 6.5111053872861406 ;
createNode transform -n "pasted__pSphere1" -p "group2";
	setAttr ".t" -type "double3" -0.00036221027301249045 0.00027998349772740143 
		0.00066588555895099363 ;
	setAttr ".s" -type "double3" 0.0043391336395846303 0.0043391336395846303 
		0.0043391336395846303 ;
createNode mesh -n "pasted__pSphereShape1" -p "pasted__pSphere1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".dr" 1;
createNode transform -n "group3" -p "head";
	setAttr ".t" -type "double3" 0.0036397139905651279 0.0016332056511287262 
		-1.7467699556054301e-19 ;
	setAttr ".r" -type "double3" -79.380344723844885 -89.999999999999972 0 ;
	setAttr ".s" -type "double3" 6.5111053872861415 6.5111053872861406 6.5111053872861406 ;
createNode transform -n "pSphere1" -p "group3";
	setAttr ".t" -type "double3" 0.00041985236699636653 0.00027998349772740143 
		0.00066588555895099363 ;
	setAttr ".s" -type "double3" 0.0043391336395846303 0.0043391336395846303 
		0.0043391336395846303 ;
createNode mesh -n "pSphereShape1" -p "pSphere1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".dr" 1;
createNode joint -n "tale" -p "joint1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" -0.0019812402669183824 -0.00040829417753008158 
		2.2664879835714383e-19 ;
	setAttr ".r" -type "double3" 0.60732859303294717 0.58616134875617476 9.5075053760097337 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -169.05039531394161 ;
	setAttr ".bps" -type "matrix" -1.0544094352905735e-16 -0.99996347632351468 -0.008546696378833471 0
		 -5.4500550321043549e-16 0.0085466963788333981 -0.99996347632351457 0 0.99999999999999989 5.5511151231257827e-17 -4.4408920985006262e-16 0
		 -1.1760770877455986e-32 -2.5289271090879044 -0.10530395927199704 1;
createNode joint -n "joint11" -p "tale";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.013919662210542888 2.4980018054066021e-18 
		-1.5453929481149427e-18 ;
	setAttr ".r" -type "double3" -1.3850183339584744e-10 -2.1814579329145915e-06 
		-2.9381857309412007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 41.221061728378899 ;
	setAttr ".bps" -type "matrix" -4.3844989874957044e-16 -0.7465132716757229 -0.66537052475444747 0
		 -3.4045627823326933e-16 0.66537052475444747 -0.74651327167572268 0 0.99999999999999989 5.5511151231257827e-17 -4.4408920985006262e-16 0
		 -3.0130952652003502e-16 -3.9208424904182566 -0.11720067193294048 1;
createNode joint -n "joint12" -p "joint11";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.0073307307876115729 4.4408920985006263e-18 
		-8.8033213337285425e-19 ;
	setAttr ".r" -type "double3" -1.9574775842866746e-10 -1.6525415872637911e-06 
		-2.6642665356413735 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 37.378114294208423 ;
	setAttr ".bps" -type "matrix" -5.5509429846126639e-16 -0.18928616226399939 -0.98192196674448995 0
		 -4.371603567620823e-18 0.98192196674449006 -0.18928616226399925 0 0.99999999999999989 5.5511151231257827e-17 -4.4408920985006262e-16 0
		 -7.1075855701618589e-16 -4.4680912728216429 -0.60496589103161047 1;
createNode joint -n "joint13" -p "joint12";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.010056065393180338 8.8817841970012525e-18 
		-7.6789886994535434e-19 ;
	setAttr ".r" -type "double3" -3.3934997784863106e-17 -8.5330456212170114e-07 
		-0.54055928532367126 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 7.5837241425568989 ;
	setAttr ".bps" -type "matrix" -5.5081586903823922e-16 -0.058041521504599701 -0.99831416987911747 0
		 6.8925100780537671e-17 0.99831416987911759 -0.058041521504599569 0 0.99999999999999989 5.5511151231257827e-17 -4.4408920985006262e-16 0
		 -1.3457549004815271e-15 -4.6584386753967344 -1.5923930418898946 1;
createNode joint -n "joint14" -p "joint13";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".t" -type "double3" 0.010248450034171096 8.8817841970012525e-18 
		-6.433869326355811e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.3274042417265544 -89.999999999999986 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 4.9067247875389548e-17 -5.5492434757099734e-16 0
		 1.111874367332755e-16 1.0000000000000002 1.9460510451357583e-17 0 6.5690907179851e-16 1.0946726866422171e-16 1.0000000000000002 0
		 -1.9745944849317777e-15 -4.7179222387014494 -2.6155103307310075 1;
createNode ikEffector -n "effector3" -p "joint13";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikHandle -n "ikHandle1";
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle2";
	setAttr ".roc" yes;
createNode ikHandle -n "ikHandle3";
	setAttr ".roc" yes;
createNode lightLinker -n "lightLinker1";
	setAttr -s 2 ".lnk";
createNode displayLayerManager -n "layerManager";
	setAttr -s 5 ".dli[1:4]"  1 3 4 5;
	setAttr -s 5 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
createNode renderLayer -s -n "globalRender";
createNode polyCube -n "polyCube1";
createNode polySmoothFace -n "polySmoothFace1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".suv" yes;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 23 ".tk";
	setAttr ".tk[0:8]" -type "float3" 0.13302474 0 0  -0.13302474 
		0 0  0.070987657 0.07443437 0  -0.070987657 0.07443437 0  0.070987657 0.07443437 
		0  -0.070987657 0.07443437 0  0.13302474 0 0  -0.13302474 0 0  0 -7.4505806e-09 
		0 ;
	setAttr ".tk[10:18]" -type "float3" -0.095833331 -7.4505806e-09 
		0  0 0.014886858 0  0.095833331 -7.4505806e-09 0  0 0.014886858 0  -0.095833331 
		0.07443437 0  0 0.014886858 0  0.095833331 0.07443437 0  0 -7.4505806e-09 
		0  -0.095833331 -7.4505806e-09 0 ;
	setAttr ".tk[20]" -type "float3" 0.095833331 -7.4505806e-09 0 ;
	setAttr ".tk[22:25]" -type "float3" -0.17958339 0 0  0.17958339 
		0 0  -0.12777779 -7.4505806e-09 0  0.12777779 -7.4505806e-09 0 ;
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 7 "f[0:3]" "f[5]" "f[8]" "f[11]" "f[14]" "f[17]" "f[21:23]";
createNode polySmoothFace -n "polySmoothFace2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".suv" yes;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 17 ".tk[0:16]" -type "float3"  0 0 -0.078183062 
		0 0 -0.078183062 0 0 0.078183062 0 0 0.078183062 0 0 -0.14072949 0 0.087218374 
		-0.10554713 0 0 -0.10554713 0 0 -0.10554713 0 -0.046447463 0 0 -0.046447463 
		0 0 0 0.10554713 0 0 0.14072949 0 0 0.10554713 0 0.087218374 0.10554713 0 
		0.087218374 0 0 0 0 0 0 0;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	setAttr ".ics" -type "componentList" 3 "f[0]" "f[14]" "f[16:17]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00036682616 -6.0928254e-05 0.00041383586 ;
	setAttr ".rs" 2055680546;
	setAttr ".lt" -type "double3" -5.5950273135089363e-20 -2.7438402765994361e-20 
		0.00017279187006746997 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyTweak -n "polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 27 ".tk";
	setAttr ".tk[1:2]" -type "float3" 0.023352237 -1.110223e-16 0  
		0.077527463 0.029947901 0 ;
	setAttr ".tk[4]" -type "float3" -7.5299781e-18 0.11964972 0 ;
	setAttr ".tk[6]" -type "float3" 0 0.034897827 0 ;
	setAttr ".tk[9]" -type "float3" 0.077527463 0 -8.2718061e-25 ;
	setAttr ".tk[11:12]" -type "float3" -7.5299781e-18 0.11964972 0  
		0 0.034897827 0 ;
	setAttr ".tk[18]" -type "float3" -5.5511151e-17 0.014956213 -2.7755576e-17 ;
	setAttr ".tk[22]" -type "float3" -2.7755576e-17 0.029912423 0 ;
	setAttr ".tk[24:25]" -type "float3" 0 0.079766467 0  0 0.089737296 
		0 ;
	setAttr ".tk[27:28]" -type "float3" -0.072681986 -2.7755576e-17 
		0  0.077527463 0 0 ;
	setAttr ".tk[30:32]" -type "float3" 0.077527463 0 0  0.077527463 
		0 0  0.077527463 0 -8.9764334e-25 ;
	setAttr ".tk[34:36]" -type "float3" 0.077527463 0 0  0.077527463 
		0 0  0.077527463 0 0 ;
	setAttr ".tk[39:40]" -type "float3" -0.072681986 -2.7755576e-17 
		0  0 0.079766467 0 ;
	setAttr ".tk[42:43]" -type "float3" -2.7755576e-17 0.029912423 0  
		-5.5511151e-17 0.011304699 2.7755576e-17 ;
	setAttr ".tk[45]" -type "float3" 0 0.089737296 0 ;
	setAttr ".tk[54:56]" -type "float3" -0.072681986 -2.7755576e-17 
		0  -0.072681986 -2.7755576e-17 0  -0.072681986 -2.7755576e-17 0 ;
createNode deleteComponent -n "deleteComponent2";
	setAttr ".dc" -type "componentList" 1 "f[61]";
createNode deleteComponent -n "deleteComponent3";
	setAttr ".dc" -type "componentList" 1 "f[58]";
createNode deleteComponent -n "deleteComponent4";
	setAttr ".dc" -type "componentList" 1 "f[61]";
createNode deleteComponent -n "deleteComponent5";
	setAttr ".dc" -type "componentList" 2 "f[49]" "f[56]";
createNode deleteComponent -n "deleteComponent6";
	setAttr ".dc" -type "componentList" 2 "f[50]" "f[53]";
createNode polyMergeVert -n "polyMergeVert1";
	setAttr ".ics" -type "componentList" 2 "vtx[67]" "vtx[69]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyTweak -n "polyTweak4";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[70:71]" -type "float3"  -0.024957361 0 0 
		-0.024957361 0 0;
createNode polyMergeVert -n "polyMergeVert2";
	setAttr ".ics" -type "componentList" 2 "vtx[68]" "vtx[71]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert3";
	setAttr ".ics" -type "componentList" 2 "vtx[57]" "vtx[66]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert4";
	setAttr ".ics" -type "componentList" 2 "vtx[59]" "vtx[65]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert5";
	setAttr ".ics" -type "componentList" 2 "vtx[58]" "vtx[63]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert6";
	setAttr ".ics" -type "componentList" 2 "vtx[60]" "vtx[63]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode deleteComponent -n "deleteComponent7";
	setAttr ".dc" -type "componentList" 2 "f[41]" "f[50]";
createNode polyMergeEdge -n "polyMergeEdge1";
	setAttr ".fe" 108;
	setAttr ".se" 85;
createNode polyTweak -n "polyTweak5";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[61:62]" -type "float3"  -0.081858836 0.038154203 
		-0.12274361 -0.073211357 0.024189899 -0.1324228;
createNode polyMergeEdge -n "polyMergeEdge2";
	setAttr ".fe" 107;
	setAttr ".se" 89;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n"
		+ "//\n"
		+ "//  This script is machine generated.  Edit at your own risk.\n"
		+ "//\n"
		+ "//\n"
		+ "global string $gMainPane;\n"
		+ "if (`paneLayout -exists $gMainPane`) {\n"
		+ "\tglobal int $gUseScenePanelConfig;\n"
		+ "\tint    $useSceneConfig = $gUseScenePanelConfig;\n"
		+ "\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n"
		+ "\tint    $nPanes = 0;\n"
		+ "\tstring $editorName;\n"
		+ "\tstring $panelName;\n"
		+ "\tstring $itemFilterName;\n"
		+ "\tstring $panelConfig;\n"
		+ "\t//\n"
		+ "\t//  get current state of the UI\n"
		+ "\t//\n"
		+ "\tsceneUIReplacement -update $gMainPane;\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Top View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Top View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"top\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 1024\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -colorResolution 256 256 \n"
		+ "                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n"
		+ "                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n"
		+ "                -occlusionCulling 0\n"
		+ "                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n"
		+ "                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -hairSystems 1\n"
		+ "                -follicles 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Top View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"top\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 0\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 1024\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n"
		+ "            -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n"
		+ "            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n"
		+ "            -smallObjectCulling 0\n"
		+ "            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -hairSystems 1\n"
		+ "            -follicles 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Side View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Side View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"side\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 1024\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -colorResolution 256 256 \n"
		+ "                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n"
		+ "                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n"
		+ "                -occlusionCulling 0\n"
		+ "                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n"
		+ "                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -hairSystems 1\n"
		+ "                -follicles 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Side View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"side\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 0\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 1024\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n"
		+ "            -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n"
		+ "            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n"
		+ "            -smallObjectCulling 0\n"
		+ "            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -hairSystems 1\n"
		+ "            -follicles 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Front View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Front View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"front\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 1024\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -colorResolution 256 256 \n"
		+ "                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n"
		+ "                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n"
		+ "                -occlusionCulling 0\n"
		+ "                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n"
		+ "                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -hairSystems 1\n"
		+ "                -follicles 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Front View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"front\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 0\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 1024\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n"
		+ "            -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n"
		+ "            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n"
		+ "            -smallObjectCulling 0\n"
		+ "            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -hairSystems 1\n"
		+ "            -follicles 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Persp View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Persp View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"persp\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 1024\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -colorResolution 256 256 \n"
		+ "                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n"
		+ "                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n"
		+ "                -occlusionCulling 0\n"
		+ "                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n"
		+ "                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -hairSystems 1\n"
		+ "                -follicles 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 0\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Persp View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"persp\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 0\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 1024\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n"
		+ "            -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n"
		+ "            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n"
		+ "            -smallObjectCulling 0\n"
		+ "            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -hairSystems 1\n"
		+ "            -follicles 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 0\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" \"Outliner\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `outlinerPanel -unParent -l \"Outliner\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"worldList\" \n"
		+ "                -selectionConnection \"modelList\" \n"
		+ "                -showShapes 0\n"
		+ "                -showAttributes 0\n"
		+ "                -showConnected 0\n"
		+ "                -showAnimCurvesOnly 0\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 1\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 0\n"
		+ "                -highlightActive 1\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"defaultSetFilter\" \n"
		+ "                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\toutlinerPanel -edit -l \"Outliner\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        outlinerEditor -e \n"
		+ "            -mainListConnection \"worldList\" \n"
		+ "            -selectionConnection \"modelList\" \n"
		+ "            -showShapes 0\n"
		+ "            -showAttributes 0\n"
		+ "            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n"
		+ "            -autoExpand 0\n"
		+ "            -showDagOnly 1\n"
		+ "            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n"
		+ "            -showUnitlessCurves 1\n"
		+ "            -showCompounds 1\n"
		+ "            -showLeafs 1\n"
		+ "            -showNumericAttrsOnly 0\n"
		+ "            -highlightActive 1\n"
		+ "            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n"
		+ "            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n"
		+ "            -setFilter \"defaultSetFilter\" \n"
		+ "            -showSetMembers 1\n"
		+ "            -allowMultiSelection 1\n"
		+ "            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n"
		+ "            -displayMode \"DAG\" \n"
		+ "            -expandObjects 0\n"
		+ "            -setsIgnoreFilters 1\n"
		+ "            -editAttrName 0\n"
		+ "            -showAttrValues 0\n"
		+ "            -highlightSecondary 0\n"
		+ "            -showUVAttrsOnly 0\n"
		+ "            -showTextureNodesOnly 0\n"
		+ "            -sortOrder \"none\" \n"
		+ "            -longNames 0\n"
		+ "            -niceNames 1\n"
		+ "            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" \"Graph Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l \"Graph Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"graphEditorList\" \n"
		+ "                -selectionConnection \"graphEditor1FromOutliner\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 1\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"GraphEd\");\n"
		+ "            animCurveEditor -e \n"
		+ "                -mainListConnection \"graphEditor1FromOutliner\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n"
		+ "                -smoothness \"fine\" \n"
		+ "                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Graph Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"graphEditorList\" \n"
		+ "                -selectionConnection \"graphEditor1FromOutliner\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 1\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"GraphEd\");\n"
		+ "            animCurveEditor -e \n"
		+ "                -mainListConnection \"graphEditor1FromOutliner\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n"
		+ "                -smoothness \"fine\" \n"
		+ "                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" \"Dope Sheet\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l \"Dope Sheet\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"animationList\" \n"
		+ "                -selectionConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n"
		+ "            dopeSheetEditor -e \n"
		+ "                -mainListConnection \"dopeSheetPanel1FromOutliner\" \n"
		+ "                -highlightConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n"
		+ "                -showScene 0\n"
		+ "                -hierarchyBelow 0\n"
		+ "                -showTicks 0\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Dope Sheet\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"animationList\" \n"
		+ "                -selectionConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n"
		+ "            dopeSheetEditor -e \n"
		+ "                -mainListConnection \"dopeSheetPanel1FromOutliner\" \n"
		+ "                -highlightConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n"
		+ "                -showScene 0\n"
		+ "                -hierarchyBelow 0\n"
		+ "                -showTicks 0\n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" \"Trax Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l \"Trax Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n"
		+ "                -mainListConnection \"lockedList1\" \n"
		+ "                -highlightConnection \"clipEditorPanel1HighlightConnection\" \n"
		+ "                -displayKeys 0\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Trax Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n"
		+ "                -mainListConnection \"lockedList1\" \n"
		+ "                -highlightConnection \"clipEditorPanel1HighlightConnection\" \n"
		+ "                -displayKeys 0\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" \"Hypergraph\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l \"Hypergraph\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -zoom 1\n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                -useDrawOverrideColor 0\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Hypergraph\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -zoom 1\n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                -useDrawOverrideColor 0\n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" \"Hypershade\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l \"Hypershade\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Hypershade\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" \"Visor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l \"Visor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Visor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" \"UV Texture Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l \"UV Texture Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"UV Texture Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"multiListerPanel\" \"Multilister\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"multiListerPanel\" -l \"Multilister\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Multilister\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" \"Render View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l \"Render View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Render View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" \"Blend Shape\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\tblendShapePanel -unParent -l \"Blend Shape\" -mbv $menusOkayInPanels ;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l \"Blend Shape\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" \"Dynamic Relationships\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l \"Dynamic Relationships\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Dynamic Relationships\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"devicePanel\" \"Devices\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\tdevicePanel -unParent -l \"Devices\" -mbv $menusOkayInPanels ;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tdevicePanel -edit -l \"Devices\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" \"Relationship Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l \"Relationship Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Relationship Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" \"Reference Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l \"Reference Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Reference Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" \"Component Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l \"Component Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Component Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" \"Paint Effects\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l \"Paint Effects\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Paint Effects\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"webBrowserPanel\" \"Web Browser\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"webBrowserPanel\" -l \"Web Browser\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Web Browser\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\tif ($useSceneConfig) {\n"
		+ "        string $configName = `getPanel -cwl \"Current Layout\"`;\n"
		+ "        if (\"\" != $configName) {\n"
		+ "\t\t\tpanelConfiguration -edit -label \"Current Layout\"\n"
		+ "\t\t\t\t-defaultImage \"\"\n"
		+ "\t\t\t\t-image \"\"\n"
		+ "\t\t\t\t-sc false\n"
		+ "\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 19 100 -ps 2 80 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n"
		+ "\t\t\t\t-ap false\n"
		+ "\t\t\t\t\t\"Outliner\"\n"
		+ "\t\t\t\t\t\"outlinerPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l \\\"Outliner\\\" -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -mainListConnection \\\"worldList\\\" \\n    -selectionConnection \\\"modelList\\\" \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l \\\"Outliner\\\" -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -mainListConnection \\\"worldList\\\" \\n    -selectionConnection \\\"modelList\\\" \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n"
		+ "\t\t\t\t\t\"Persp View\"\n"
		+ "\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l \\\"Persp View\\\" -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 1024\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 0\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l \\\"Persp View\\\" -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 1024\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 0\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n"
		+ "            setNamedPanelLayout \"Current Layout\";\n"
		+ "        }\n"
		+ "        panelHistory -e -clear mainPanelHistory;\n"
		+ "        setFocus `paneLayout -q -p1 $gMainPane`;\n"
		+ "        sceneUIReplacement -deleteRemaining;\n"
		+ "        sceneUIReplacement -clear;\n"
		+ "\t}\n"
		+ "grid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\n"
		+ "}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 15 -ast 1 -aet 15 ";
	setAttr ".st" 6;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	setAttr ".ics" -type "componentList" 2 "f[18:19]" "f[44]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00034533805 0.00065112027 0.00048426061 ;
	setAttr ".rs" 296241687;
	setAttr ".lt" -type "double3" -6.7271936587303915e-20 1.7052836699033469e-19 
		0.00027252298575818431 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyTweak -n "polyTweak6";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[5]" -type "float3" 0 -5.5511151e-17 -0.023167493 ;
	setAttr ".tk[14]" -type "float3" 0 0.029219206 -7.5299781e-18 ;
	setAttr ".tk[51]" -type "float3" 0 0.00016690162 -2.7755576e-17 ;
	setAttr ".tk[59]" -type "float3" -0.0086717661 -2.7755576e-17 2.7755576e-17 ;
createNode deleteComponent -n "deleteComponent8";
	setAttr ".dc" -type "componentList" 1 "f[60]";
createNode deleteComponent -n "deleteComponent9";
	setAttr ".dc" -type "componentList" 2 "f[57]" "f[61]";
createNode deleteComponent -n "deleteComponent10";
	setAttr ".dc" -type "componentList" 1 "f[55]";
createNode deleteComponent -n "deleteComponent11";
	setAttr ".dc" -type "componentList" 1 "f[60]";
createNode polyMergeVert -n "polyMergeVert7";
	setAttr ".ics" -type "componentList" 2 "vtx[67]" "vtx[70]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyTweak -n "polyTweak7";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[67:69]" -type "float3" -0.047014348 0.035306938 0.036679268  
		-0.05639283 0.044364356 0.037634559  -0.039036267 0 0 ;
	setAttr ".tk[71]" -type "float3" -0.039036267 0 0 ;
createNode polyMergeVert -n "polyMergeVert8";
	setAttr ".ics" -type "componentList" 2 "vtx[68]" "vtx[71]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert9";
	setAttr ".ics" -type "componentList" 2 "vtx[66]" "vtx[71]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert10";
	setAttr ".ics" -type "componentList" 2 "vtx[65]" "vtx[72]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polySplit -n "polySplit1";
	setAttr -s 2 ".e[0:1]"  0.73543298 0.81918913;
	setAttr -s 2 ".d[0:1]"  -2147483607 -2147483643;
createNode polyTweak -n "polyTweak8";
	setAttr ".uopa" yes;
	setAttr -s 21 ".tk";
	setAttr ".tk[1]" -type "float3" 5.5511151e-17 0.023114659 0 ;
	setAttr ".tk[4]" -type "float3" 0 0.083440311 0 ;
	setAttr ".tk[6]" -type "float3" 2.7755576e-17 -0.022621058 0 ;
	setAttr ".tk[11]" -type "float3" 4.6222319e-33 8.3266727e-17 0.045583617 ;
	setAttr ".tk[22]" -type "float3" -2.7755576e-17 0.018273506 -5.5511151e-17 ;
	setAttr ".tk[24:25]" -type "float3" 0 0.0017159537 1.110223e-16  
		0 0.063091323 -1.110223e-16 ;
	setAttr ".tk[31]" -type "float3" 0 -0.041445814 1.3877788e-17 ;
	setAttr ".tk[45]" -type "float3" 0 0.078039721 0 ;
	setAttr ".tk[56:57]" -type "float3" 5.5511151e-17 -0.022621058 0  
		-0.04753783 -1.5612511e-17 0 ;
	setAttr ".tk[59]" -type "float3" -0.04753783 -2.7755576e-17 0 ;
	setAttr ".tk[61:64]" -type "float3" 0 0.0017159537 1.110223e-16  
		0 0.024467662 -5.5511151e-17  4.1799776e-34 0.083440311 0  0 0.082798123 
		0.027752701 ;
	setAttr ".tk[66:67]" -type "float3" -0.054867979 -0.023005391 -0.031150565  
		-0.053924046 -0.082508355 -1.110223e-16 ;
	setAttr ".tk[69]" -type "float3" 0 -0.10453839 5.5511151e-17 ;
	setAttr ".tk[71:72]" -type "float3" -0.060251966 -0.01389007 -0.052564539  
		-0.060251966 0.032645464 -0.052564539 ;
createNode polyMergeVert -n "polyMergeVert11";
	setAttr ".ics" -type "componentList" 1 "vtx[73:74]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyTweak -n "polyTweak9";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[73:74]" -type "float3"  0.021660902 0 0 -0.02171706 
		0.0052674711 1.110223e-16;
createNode polySplit -n "polySplit2";
	setAttr -s 4 ".e[0:3]"  0.6540764 0.74306893 0.64564627 
		0.43406767;
	setAttr -s 4 ".d[0:3]"  -2147483516 -2147483557 -2147483622 -2147483552;
createNode polyTweak -n "polyTweak10";
	setAttr ".uopa" yes;
	setAttr -s 21 ".tk";
	setAttr ".tk[1]" -type "float3" 5.5511151e-17 0.010916519 0 ;
	setAttr ".tk[4]" -type "float3" 0 -0.028672518 -5.5511151e-17 ;
	setAttr ".tk[6]" -type "float3" -0.061861701 0.036364794 9.3132257e-10 ;
	setAttr ".tk[16]" -type "float3" -0.14477521 8.6736174e-19 0 ;
	setAttr ".tk[21]" -type "float3" -1.8626451e-09 0.063771375 9.3132257e-10 ;
	setAttr ".tk[24]" -type "float3" -0.015711565 0.018572217 -1.110223e-16 ;
	setAttr ".tk[27]" -type "float3" -1.8626451e-09 -3.7252903e-09 9.3132257e-10 ;
	setAttr ".tk[29]" -type "float3" 4.1799776e-34 -0.028672518 -5.5511151e-17 ;
	setAttr ".tk[38:39]" -type "float3" 0.024103668 -5.5511151e-17 5.5511151e-17  
		0.10020307 -2.7755576e-17 2.7755576e-17 ;
	setAttr ".tk[53:55]" -type "float3" 0.090247788 -2.7755576e-17 1.3877788e-17  
		0.078224137 0 0  -1.4901161e-08 -1.4901161e-08 -1.3877788e-17 ;
	setAttr ".tk[57]" -type "float3" 0 0.063771382 0 ;
	setAttr ".tk[63]" -type "float3" 4.1799776e-34 -0.028672518 -5.5511151e-17 ;
	setAttr ".tk[65:66]" -type "float3" -1.110223e-16 0.086954974 5.5511151e-17  
		-0.0093373973 0.046567138 1.110223e-16 ;
	setAttr ".tk[68]" -type "float3" 0 0.011655401 -5.5511151e-17 ;
	setAttr ".tk[70]" -type "float3" 4.1799776e-34 -0.028672518 -5.5511151e-17 ;
	setAttr ".tk[72:73]" -type "float3" -7.4505806e-09 0.03254275 1.8626451e-09  
		0.018546043 -0.009386275 9.3132257e-10 ;
createNode deleteComponent -n "deleteComponent12";
	setAttr ".dc" -type "componentList" 1 "f[47]";
createNode deleteComponent -n "deleteComponent13";
	setAttr ".dc" -type "componentList" 1 "f[59]";
createNode polyExtrudeFace -n "polyExtrudeFace3";
	setAttr ".ics" -type "componentList" 1 "f[45]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00057264126 0.00028181172 0.00031685486 ;
	setAttr ".rs" 601327458;
	setAttr ".lt" -type "double3" -1.3108652725139352e-19 1.4579997388312217e-20 
		0.00011161402184991572 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode deleteComponent -n "deleteComponent14";
	setAttr ".dc" -type "componentList" 1 "f[65]";
createNode polyTweak -n "polyTweak11";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[79:80]" -type "float3"  0.016044237 -0.054731071 
		0.034707021 -0.01382218 -0.031263925 0.0045831697;
createNode deleteComponent -n "deleteComponent15";
	setAttr ".dc" -type "componentList" 1 "f[66]";
createNode polyMergeVert -n "polyMergeVert12";
	setAttr ".ics" -type "componentList" 2 "vtx[74]" "vtx[78]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyTweak -n "polyTweak12";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[78]" -type "float3" 0.011249106 0.0095176324 5.5511151e-17 ;
	setAttr ".tk[81]" -type "float3" -2.7755576e-17 2.7755576e-17 -0.014023574 ;
createNode polyMergeVert -n "polyMergeVert13";
	setAttr ".ics" -type "componentList" 2 "vtx[72]" "vtx[80]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert14";
	setAttr ".ics" -type "componentList" 2 "vtx[57]" "vtx[79]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert15";
	setAttr ".ics" -type "componentList" 1 "vtx[77:78]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyExtrudeFace -n "polyExtrudeFace4";
	setAttr ".ics" -type "componentList" 1 "f[60]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0003260824 0.00023318549 0.00060720858 ;
	setAttr ".rs" 2019346062;
	setAttr ".lt" -type "double3" 4.8171970743947059e-20 1.9026897111581246e-20 
		0.00012307268639532518 ;
	setAttr ".ls" -type "double3" 1 1 0.88195085688699471 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyTweak -n "polyTweak13";
	setAttr ".uopa" yes;
	setAttr ".tk[76]" -type "float3"  -0.017415248 1.3877788e-17 0;
createNode polySphere -n "polySphere1";
createNode displayLayer -n "layer1";
	setAttr ".do" 1;
createNode displayLayer -n "pasted__layer1";
	setAttr ".do" 2;
createNode polySphere -n "pasted__polySphere2";
createNode displayLayer -n "pasted__layer2";
	setAttr ".do" 3;
createNode displayLayer -n "pasted__pasted__layer1";
	setAttr ".do" 4;
createNode polySplit -n "polySplit3";
	setAttr -s 4 ".e[0:3]"  0.43190843 0.45495126 0.5 0.67047966;
	setAttr -s 4 ".d[0:3]"  -2147483626 -2147483569 -2147483621 -2147483619;
createNode polyTweak -n "polyTweak14";
	setAttr ".uopa" yes;
	setAttr -s 19 ".tk";
	setAttr ".tk[0]" -type "float3" 2.7755576e-17 0.026613913 -1.3038516e-08 ;
	setAttr ".tk[3]" -type "float3" 5.5511151e-17 -0.020136107 0 ;
	setAttr ".tk[5]" -type "float3" 1.5059956e-17 0.026613913 -1.3038516e-08 ;
	setAttr ".tk[13:15]" -type "float3" 3.0119913e-17 -0.020136107 0  
		3.0119913e-17 -0.020136107 3.7649891e-18  5.5511151e-17 -0.020136107 3.7649891e-18 ;
	setAttr ".tk[19]" -type "float3" 5.5511151e-17 -0.020136107 0 ;
	setAttr ".tk[23]" -type "float3" 1.3877788e-17 0.026613913 -1.3038516e-08 ;
	setAttr ".tk[25]" -type "float3" -0.011009939 -1.3877788e-17 -0.033199318 ;
	setAttr ".tk[44]" -type "float3" 2.7755576e-17 -0.020136107 0 ;
	setAttr ".tk[46:51]" -type "float3" 2.7755576e-17 -0.020136107 0  
		5.5511151e-17 -0.020136107 0  2.7755576e-17 -0.020136107 3.7649887e-18  3.0119913e-17 
		-0.020136107 0  2.7755576e-17 -0.020136107 0  3.0119913e-17 -0.020136107 
		0 ;
	setAttr ".tk[78:80]" -type "float3" -0.034752835 0.034603812 0.017263057  
		0.012732961 -0.0093413247 -0.035018448  -0.027365668 -0.034603812 0.0017032517 ;
createNode polyExtrudeFace -n "polyExtrudeFace5";
	setAttr ".ics" -type "componentList" 2 "f[12]" "f[36:37]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00027135777 -0.00049893232 0.00044901634 ;
	setAttr ".rs" 2086779130;
	setAttr ".lt" -type "double3" -1.970559867945671e-19 9.4976251930213252e-20 
		8.9355772872627592e-05 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode deleteComponent -n "deleteComponent16";
	setAttr ".dc" -type "componentList" 1 "f[81]";
createNode polyTweak -n "polyTweak15";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[90]" -type "float3" -0.013294994 0 2.7755576e-17 ;
	setAttr ".tk[93:95]" -type "float3" -0.016275652 0 0  -0.036896847 
		-5.5511151e-17 0  -0.016275654 0 0 ;
createNode deleteComponent -n "deleteComponent17";
	setAttr ".dc" -type "componentList" 2 "f[78]" "f[82]";
createNode polyMergeVert -n "polyMergeVert16";
	setAttr ".ics" -type "componentList" 2 "vtx[91]" "vtx[94]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyTweak -n "polyTweak16";
	setAttr ".uopa" yes;
	setAttr ".tk[94]" -type "float3"  0.02986153 -5.5511151e-17 0;
createNode polyMergeVert -n "polyMergeVert17";
	setAttr ".ics" -type "componentList" 2 "vtx[92]" "vtx[95]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode deleteComponent -n "deleteComponent18";
	setAttr ".dc" -type "componentList" 2 "f[73]" "f[76]";
createNode polyMergeVert -n "polyMergeVert18";
	setAttr ".ics" -type "componentList" 2 "vtx[85]" "vtx[90]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert19";
	setAttr ".ics" -type "componentList" 2 "vtx[87]" "vtx[89]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyExtrudeFace -n "polyExtrudeFace6";
	setAttr ".ics" -type "componentList" 2 "f[1]" "f[15]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00021476561 -0.00028573981 0.00053362234 ;
	setAttr ".rs" 1420664846;
	setAttr ".lt" -type "double3" 3.9918054140936473e-21 -5.5370399072655715e-20 
		-0.00014348553538373585 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyTweak -n "polyTweak17";
	setAttr ".uopa" yes;
	setAttr -s 39 ".tk";
	setAttr ".tk[0]" -type "float3" 0 0.062015135 -2.7755576e-17 ;
	setAttr ".tk[3]" -type "float3" -2.7755576e-17 0.060886722 0 ;
	setAttr ".tk[5]" -type "float3" -3.0119913e-17 0.034010593 0 ;
	setAttr ".tk[7:8]" -type "float3" 1.5059956e-17 0.061443865 0  
		1.5059956e-17 0.061443865 -7.5299781e-18 ;
	setAttr ".tk[11]" -type "float3" -1.8824945e-18 -0.029844958 0 ;
	setAttr ".tk[13:16]" -type "float3" -3.0119913e-17 0.060886722 0  
		-3.0119913e-17 0.060886722 -3.7649891e-18  -2.7755576e-17 0.060886722 -3.7649891e-18  
		0.13497831 0.037296575 0 ;
	setAttr ".tk[19]" -type "float3" -2.7755576e-17 0.060886722 0 ;
	setAttr ".tk[23]" -type "float3" -4.1633363e-17 0.045036055 -1.6653345e-16 ;
	setAttr ".tk[25]" -type "float3" -1.7347235e-18 -0.029844958 0 ;
	setAttr ".tk[30]" -type "float3" 2.7755576e-17 0.061443865 -1.3877788e-17 ;
	setAttr ".tk[32:34]" -type "float3" 2.7755576e-17 0.061443865 -7.5299781e-18  
		1.5059956e-17 0.061443865 0  2.7755576e-17 0.061443865 -1.3877788e-17 ;
	setAttr ".tk[37]" -type "float3" 1.5059956e-17 0.061443865 0 ;
	setAttr ".tk[43:51]" -type "float3" 0 0.019797489 0  -2.7755576e-17 
		0.060886722 0  0 -0.07020691 5.5511151e-17  -2.7755576e-17 0.060886722 0  
		-2.7755576e-17 0.060886722 0  -2.7755576e-17 0.060886722 -3.7649891e-18  
		-3.0119913e-17 0.060886722 0  -2.7755576e-17 0.060886722 0  -3.0119913e-17 
		0.060886722 0 ;
	setAttr ".tk[64]" -type "float3" -1.8824945e-18 -0.029844958 0 ;
	setAttr ".tk[81:83]" -type "float3" -3.0119913e-17 0.034010593 0  
		-2.7755576e-17 0.060886722 0  -2.7755576e-17 0.060886722 0 ;
	setAttr ".tk[85:92]" -type "float3" -0.012904481 0.057526596 0.079807572  
		0.024811437 0.0020310795 0.018390883  -5.5511151e-17 0.060886722 0.062353097  
		-0.009561182 0.0061824415 0.055893511  -0.011253602 0.050033305 0.065503798  
		-5.5511151e-17 0.060886722 0.055893511  -6.0239825e-17 0.05305516 0.055893511  
		-6.0239825e-17 0.034010593 0.055893511 ;
createNode deleteComponent -n "deleteComponent19";
	setAttr ".dc" -type "componentList" 1 "f[86]";
createNode deleteComponent -n "deleteComponent20";
	setAttr ".dc" -type "componentList" 1 "f[81]";
createNode deleteComponent -n "deleteComponent21";
	setAttr ".dc" -type "componentList" 1 "f[1]";
createNode deleteComponent -n "deleteComponent22";
	setAttr ".dc" -type "componentList" 1 "f[80]";
createNode deleteComponent -n "deleteComponent23";
	setAttr ".dc" -type "componentList" 1 "f[78]";
createNode polyMergeVert -n "polyMergeVert20";
	setAttr ".ics" -type "componentList" 1 "vtx[94:95]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyTweak -n "polyTweak18";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[93:100]" -type "float3"  -3.7252903e-09 3.7252903e-09 
		0 5.5879354e-09 0.01145941 -0.042982992 0 0 -3.7252903e-09 -1.8626451e-09 
		-3.7252903e-09 0 4.6566129e-10 1.8626451e-09 0 0 7.2759576e-12 3.7252903e-09 
		-5.5879354e-09 0 -4.6566129e-10 4.6566129e-10 0 -3.7252903e-09;
createNode polyMergeVert -n "polyMergeVert21";
	setAttr ".ics" -type "componentList" 1 "vtx[93]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert22";
	setAttr ".ics" -type "componentList" 1 "vtx[93]";
	setAttr ".ix" -type "matrix" -0.23037562914109222 -0 -0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".mp" -type "matrix" -0.23037562914109222 -0 -0 0 0 0.23037562914109222 0 0
		 0 0 0.27382719177240433 0 0 0 -0.00094563298597324236 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert23";
	setAttr ".ics" -type "componentList" 1 "vtx[93]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert24";
	setAttr ".ics" -type "componentList" 1 "vtx[93]";
	setAttr ".ix" -type "matrix" -0.23037562914109222 -0 -0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".mp" -type "matrix" -0.23037562914109222 -0 -0 0 0 0.23037562914109222 0 0
		 0 0 0.27382719177240433 0 0 0 -0.00094563298597324236 1;
	setAttr ".d" 0.032886000000000006;
createNode polyMergeVert -n "polyMergeVert25";
	setAttr ".ics" -type "componentList" 1 "vtx[93]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyTweak -n "polyTweak19";
	setAttr ".uopa" yes;
	setAttr ".tk[93]" -type "float3"  0 0.022200247 0;
createNode polyMergeVert -n "polyMergeVert26";
	setAttr ".ics" -type "componentList" 1 "vtx[93]";
	setAttr ".ix" -type "matrix" -0.23037562914109222 -0 -0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".mp" -type "matrix" -0.23037562914109222 -0 -0 0 0 0.23037562914109222 0 0
		 0 0 0.27382719177240433 0 0 0 -0.00094563298597324236 1;
	setAttr ".d" 0.061744000000000007;
createNode polyAppend -n "polyAppend1";
	setAttr -s 2 ".d[0:1]"  -2147483615 -2147483472;
	setAttr ".tx" 1;
createNode polyTweak -n "polyTweak20";
	setAttr ".uopa" yes;
	setAttr ".tk[93]" -type "float3"  0.008233143 0 0;
createNode polyAppend -n "polyAppend2";
	setAttr -s 2 ".d[0:1]"  -2147483469 -2147483470;
	setAttr ".tx" 1;
createNode polyTweak -n "polyTweak21";
	setAttr ".uopa" yes;
	setAttr ".tk[25]" -type "float3"  0.011009939 0 0;
createNode polyAppend -n "polyAppend3";
	setAttr -s 2 ".d[0:1]"  -2147483468 -2147483477;
	setAttr ".tx" 1;
createNode polySplit -n "polySplit4";
	setAttr -s 2 ".e[0:1]"  0.74721467 0.68220454;
	setAttr -s 2 ".d[0:1]"  -2147483537 -2147483615;
createNode polyTweak -n "polyTweak22";
	setAttr ".uopa" yes;
	setAttr ".tk[93]" -type "float3"  0 2.7755576e-17 -0.072743438;
createNode polySplit -n "polySplit5";
	setAttr -s 2 ".e[0:1]"  0.5 0.62126315;
	setAttr -s 2 ".d[0:1]"  -2147483537 -2147483615;
createNode polyExtrudeFace -n "polyExtrudeFace7";
	setAttr ".ics" -type "componentList" 1 "f[52]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00025266755 -0.00016154133 0.0007381895 ;
	setAttr ".rs" 830226422;
	setAttr ".ls" -type "double3" 0.69999999999999973 0.69999999999999973 0.69999999999999973 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace8";
	setAttr ".ics" -type "componentList" 1 "f[52]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00025198076 -0.00016128263 0.00073600753 ;
	setAttr ".rs" 1934596730;
	setAttr ".lt" -type "double3" -5.0344812772716257e-20 -9.4401747618567394e-20 
		5.8362475208334313e-05 ;
	setAttr ".lr" -type "double3" 0 -23.21026196779038 0 ;
	setAttr ".ls" -type "double3" 0.66067636545814934 0.65000000000000047 0.65000000000000047 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace9";
	setAttr ".ics" -type "componentList" 1 "f[52]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00022731288 -0.00021436633 0.00073950668 ;
	setAttr ".rs" 1326715363;
	setAttr ".lt" -type "double3" 1.04213628025818e-19 9.2846620395406804e-21 
		3.6561961126876259e-05 ;
	setAttr ".lr" -type "double3" 0 -27.799242979711206 0 ;
	setAttr ".ls" -type "double3" 0.71824457753010518 0.70000000000000029 0.70000000000000029 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace10";
	setAttr ".ics" -type "componentList" 1 "f[52]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0001998412 -0.00023896804 0.00074081839 ;
	setAttr ".rs" 1354848213;
	setAttr ".lt" -type "double3" -3.4316532986745541e-20 -1.4061192635902552e-19 
		4.1931138521005602e-05 ;
	setAttr ".ls" -type "double3" 0.40776923175830354 0.39999999999999897 0.39999999999999897 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace11";
	setAttr ".ics" -type "componentList" 1 "f[86]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 6.1634375e-05 -6.7363093e-05 0.00079684571 ;
	setAttr ".rs" 1685137281;
	setAttr ".ls" -type "double3" 0.66666666666666585 0.6718822497687934 0.66666666666666585 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace12";
	setAttr ".ics" -type "componentList" 1 "f[86]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 5.9188184e-05 -6.7057081e-05 0.00079412217 ;
	setAttr ".rs" 1608863394;
	setAttr ".lt" -type "double3" 5.555003023165455e-05 -2.6311122249864693e-19 
		8.6609313762323344e-05 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polySplit -n "polySplit6";
	setAttr -s 2 ".e[0:1]"  0.55177695 0.6374231;
	setAttr -s 2 ".d[0:1]"  -2147483618 -2147483488;
createNode polyTweak -n "polyTweak23";
	setAttr ".uopa" yes;
	setAttr -s 18 ".tk";
	setAttr ".tk[20]" -type "float3" -0.02191392 5.5511151e-17 0 ;
	setAttr ".tk[103]" -type "float3" -0.028303042 -0.01849946 0 ;
	setAttr ".tk[106:117]" -type "float3" -0.028303048 -0.01849946 0  
		-0.028303048 -0.01849946 0  -0.028303048 -0.01849946 0  -0.028303048 -0.01849946 
		0  -0.041222483 -0.010771703 0  -0.041222483 -0.010771703 0  -0.041222483 
		-0.010771703 0  -0.041222483 -0.010771703 0  -0.044447441 -0.001762172 1.110223e-16  
		-0.044447441 -0.001762172 1.110223e-16  -0.044447441 -0.001762172 1.110223e-16  
		-0.044447441 -0.001762172 1.110223e-16 ;
	setAttr ".tk[122:125]" -type "float3" -1.7347235e-18 -0.027597178 
		0.01375926  -6.9388939e-18 -0.012086474 0.013973496  -6.9388939e-18 -0.012086474 
		-0.0087024262  -1.7347235e-18 -0.027597178 -0.013973496 ;
createNode polyExtrudeFace -n "polyExtrudeFace13";
	setAttr ".ics" -type "componentList" 1 "f[111]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00024461211 -0.00042322176 0.00058131327 ;
	setAttr ".rs" 1730066822;
	setAttr ".ls" -type "double3" 0.66177454446355943 0.65000000000000069 0.65000000000000069 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace14";
	setAttr ".ics" -type "componentList" 1 "f[111]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00024389967 -0.00042338026 0.00058252632 ;
	setAttr ".rs" 1922896836;
	setAttr ".lt" -type "double3" 1.3180870851358194e-20 1.5896460075480806e-19 
		0.0001248003685261652 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace15";
	setAttr ".ics" -type "componentList" 1 "f[3]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00058663177 0.00094254187 -0.00012756838 ;
	setAttr ".rs" 1200972918;
	setAttr ".ls" -type "double3" 0.58333333333333459 0.61029082530034084 0.58333333333333459 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace16";
	setAttr ".ics" -type "componentList" 1 "f[3]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00058518961 0.00094268704 -0.00012506003 ;
	setAttr ".rs" 1821660381;
	setAttr ".lt" -type "double3" 5.7958763622785694e-05 -1.5688007358048185e-19 
		0.00023739798806778051 ;
	setAttr ".lr" -type "double3" 0 28.853434363072569 0 ;
	setAttr ".ls" -type "double3" 0.72249999999999304 0.72249999999999304 0.72249999999999304 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace17";
	setAttr ".ics" -type "componentList" 1 "f[3]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00080284779 0.0010479756 -0.00015571206 ;
	setAttr ".rs" 1709312429;
	setAttr ".lt" -type "double3" -4.7216829009168999e-20 4.3575633958002819e-20 
		0.00015213412688890003 ;
	setAttr ".lr" -type "double3" 0 20.532684671780864 0 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace18";
	setAttr ".ics" -type "componentList" 1 "f[3]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00095151633 0.0010771222 -0.00016398008 ;
	setAttr ".rs" 2097511951;
	setAttr ".lt" -type "double3" 9.6702822114970619e-19 1.833748546954239e-19 
		0.00029285737957374482 ;
	setAttr ".ls" -type "double3" 1.5166666666666655 3.066242390212603 1.5166666666666655 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polySplit -n "polySplit7";
	setAttr -s 2 ".e[0:1]"  0.73441339 0.69243729;
	setAttr -s 2 ".d[0:1]"  -2147483367 -2147483363;
createNode polySplit -n "polySplit8";
	setAttr -s 2 ".e[0:1]"  0.5 0.46493679;
	setAttr -s 2 ".d[0:1]"  -2147483367 -2147483363;
createNode polyExtrudeFace -n "polyExtrudeFace19";
	setAttr ".ics" -type "componentList" 1 "f[3]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0012944649 0.0011073085 -0.00013731339 ;
	setAttr ".rs" 1639306897;
	setAttr ".ls" -type "double3" 0.76500000000000146 0.76500000000000146 0.77160646004490641 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyTweak -n "polyTweak24";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[148:155]" -type "float3"  -0.020731613 0.0098629594 
		-0.00010970875 0.032668635 -0.011624021 0.00017224302 -0.032460369 0.012459617 
		-0.00017129235 0.018805066 -0.0093676867 9.9581979e-05 0.018486241 -0.0059173801 
		9.7360411e-05 0.0030377146 -0.0026544295 1.6271066e-05 -0.001122685 0.0019727885 
		-6.1741698e-06 -0.015955988 0.0054325503 -8.4087143e-05;
createNode polyExtrudeFace -n "polyExtrudeFace20";
	setAttr ".ics" -type "componentList" 1 "f[3]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0012948154 0.0011076013 -0.00013784294 ;
	setAttr ".rs" 1191635637;
	setAttr ".lt" -type "double3" 4.0241988404051933e-05 8.0438188110539304e-20 
		0.00012420903165044812 ;
	setAttr ".ls" -type "double3" 1.4333333333333325 1.4333333333333325 1.4333333333333325 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace21";
	setAttr ".ics" -type "componentList" 1 "f[136]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0012435415 0.0010385868 -0.00014866034 ;
	setAttr ".rs" 1996797147;
	setAttr ".ls" -type "double3" 0.70000000000000207 0.70000000000000207 0.73677501359308628 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace22";
	setAttr ".ics" -type "componentList" 1 "f[136]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0012436138 0.0010384714 -0.00014884261 ;
	setAttr ".rs" 888199769;
	setAttr ".lt" -type "double3" 3.4681978350518941e-19 7.8699087413846962e-20 
		0.00014468860580058908 ;
	setAttr ".ls" -type "double3" 1.9259577231217819 1.6933635111959153 1.0838746631421521 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace23";
	setAttr ".ics" -type "componentList" 1 "f[137]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0011883376 0.00096372468 -0.00016148627 ;
	setAttr ".rs" 277448857;
	setAttr ".ls" -type "double3" 0.69999999999999762 0.69999999999999762 0.7693061771577927 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace24";
	setAttr ".ics" -type "componentList" 1 "f[137]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0011879138 0.00096302113 -0.0001610227 ;
	setAttr ".rs" 375967459;
	setAttr ".lt" -type "double3" -5.8114797783598582e-05 -8.648045117811398e-20 
		0.0001422578878279994 ;
	setAttr ".ls" -type "double3" 1.7 1.7759546909348598 1.7 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace25";
	setAttr ".ics" -type "componentList" 3 "f[6:7]" "f[32:34]" "f[37]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00020816867 -0.00061917678 -0.00015518843 ;
	setAttr ".rs" 415495822;
	setAttr ".lt" -type "double3" 7.6988873354251426e-20 -8.6528695263413363e-20 
		0.00026749530869898816 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyTweak -n "polyTweak25";
	setAttr ".uopa" yes;
	setAttr -s 41 ".tk";
	setAttr ".tk[7:8]" -type "float3" -3.0814879e-33 0.039695129 -5.5511151e-17  
		-3.0814879e-33 0.038793407 1.540744e-33 ;
	setAttr ".tk[10:11]" -type "float3" 0 -5.5511151e-17 -0.077112854  
		-3.0814879e-33 -2.7755576e-17 -0.071557552 ;
	setAttr ".tk[37]" -type "float3" 0 -3.7252903e-09 0 ;
	setAttr ".tk[144:179]" -type "float3" 0.049403157 -0.039727986 0.023873124  
		0.091143213 -0.020839738 0.027855609  0.049356069 -0.037880212 -0.022935009  
		0.091303356 -0.021261783 -0.020839058  0.13479781 -0.15262115 0.060946453  
		0.24148394 -0.095195822 0.088980101  0.1169252 -0.1533338 -0.079551578  0.22140856 
		-0.099260896 -0.057693113  0.21314958 -0.11044724 0.081534758  0.18927331 
		-0.11589171 -0.064416006  0.17397366 -0.13153417 0.071240634  0.15056252 
		-0.13592559 -0.072514497  0.21387386 -0.10921912 0.06504707  0.23554866 -0.097549945 
		0.070742801  0.19560756 -0.11338232 -0.046605192  0.22019196 -0.10066162 
		-0.041462269  0.2549043 -0.15145876 0.086994462  0.28597146 -0.13473299 0.095158361  
		0.2287225 -0.15742601 -0.073040403  0.26396015 -0.13919294 -0.065668903  
		0.17635374 -0.12909447 0.051137596  0.20376988 -0.11432051 0.058343947  0.15995891 
		-0.13215534 -0.049490467  0.1870635 -0.11814476 -0.04382199  0.2015314 -0.19086097 
		0.08148592  0.25441903 -0.16256331 0.093836248  0.17058352 -0.19796892 -0.088998668  
		0.22264162 -0.17071427 -0.07924366  0.13769963 -0.14981483 0.041580997  0.16511014 
		-0.13503075 0.048787881  0.12517633 -0.15029043 -0.05676667  0.14873493 -0.13812795 
		-0.051841695  0.14036436 -0.22299714 0.073490813  0.18697082 -0.19788872 
		0.08622212  0.11894222 -0.22342397 -0.10114508  0.15899752 -0.20276396 -0.092454694 ;
createNode deleteComponent -n "deleteComponent24";
	setAttr ".dc" -type "componentList" 2 "f[166]" "f[175]";
createNode deleteComponent -n "deleteComponent25";
	setAttr ".dc" -type "componentList" 2 "f[171]" "f[175]";
createNode deleteComponent -n "deleteComponent26";
	setAttr ".dc" -type "componentList" 2 "f[164]" "f[171]";
createNode deleteComponent -n "deleteComponent27";
	setAttr ".dc" -type "componentList" 2 "f[164]" "f[174]";
createNode deleteComponent -n "deleteComponent28";
	setAttr ".dc" -type "componentList" 2 "f[171]" "f[175]";
createNode deleteComponent -n "deleteComponent29";
	setAttr ".dc" -type "componentList" 1 "f[173]";
createNode deleteComponent -n "deleteComponent30";
	setAttr ".dc" -type "componentList" 1 "f[171]";
createNode deleteComponent -n "deleteComponent31";
	setAttr ".dc" -type "componentList" 1 "f[162]";
createNode deleteComponent -n "deleteComponent32";
	setAttr ".dc" -type "componentList" 1 "f[171]";
createNode deleteComponent -n "deleteComponent33";
	setAttr ".dc" -type "componentList" 1 "f[165]";
createNode deleteComponent -n "deleteComponent34";
	setAttr ".dc" -type "componentList" 1 "f[168:169]";
createNode polyMergeVert -n "polyMergeVert27";
	setAttr ".ics" -type "componentList" 2 "vtx[183]" "vtx[199]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyTweak -n "polyTweak26";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk";
	setAttr ".tk[176:177]" -type "float3" -0.047024991 0 0  -0.047024991 
		0 0 ;
	setAttr ".tk[193:194]" -type "float3" -0.019674279 0 0  -0.019674279 
		0 0 ;
	setAttr ".tk[196:197]" -type "float3" -0.019572414 0 0  -0.019572414 
		0 0 ;
createNode polyMergeVert -n "polyMergeVert28";
	setAttr ".ics" -type "componentList" 2 "vtx[181]" "vtx[198]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert29";
	setAttr ".ics" -type "componentList" 2 "vtx[190]" "vtx[192]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert30";
	setAttr ".ics" -type "componentList" 2 "vtx[191]" "vtx[194]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert31";
	setAttr ".ics" -type "componentList" 2 "vtx[179]" "vtx[187]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert32";
	setAttr ".ics" -type "componentList" 2 "vtx[178]" "vtx[184]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert33";
	setAttr ".ics" -type "componentList" 2 "vtx[190]" "vtx[193]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert34";
	setAttr ".ics" -type "componentList" 2 "vtx[177]" "vtx[191]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert35";
	setAttr ".ics" -type "componentList" 2 "vtx[179]" "vtx[189]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert36";
	setAttr ".ics" -type "componentList" 2 "vtx[181]" "vtx[188]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert37";
	setAttr ".ics" -type "componentList" 2 "vtx[180]" "vtx[187]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert38";
	setAttr ".ics" -type "componentList" 1 "vtx[185:186]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polySplit -n "polySplit9";
	setAttr -s 4 ".e[0:3]"  0.10312923 0.094850011 0.11186004 
		0.15265511;
	setAttr -s 4 ".d[0:3]"  -2147483309 -2147483311 -2147483302 -2147483304;
createNode polyTweak -n "polyTweak27";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk[176:187]" -type "float3"  1.1175871e-07 -0.96544391 
		-1.3411045e-07 1.1175871e-07 -0.96544427 2.9802322e-08 -1.3038516e-08 -0.96544433 
		-1.4901161e-07 6.9849193e-10 -0.96544427 3.7252903e-09 -3.7252903e-08 -0.96544445 
		-1.4901161e-08 6.9849193e-09 -0.96544409 2.2351742e-08 1.2665987e-07 -0.96544355 
		-1.1920929e-07 -6.4028427e-10 -0.96544307 -1.937151e-07 5.5879354e-08 -0.96544391 
		-1.4901161e-08 3.7252903e-09 -0.96544325 -5.2154064e-08 1.1175871e-07 -0.96544367 
		7.4505806e-09 1.1175871e-07 -0.96544492 1.3411045e-07;
createNode polySplit -n "polySplit10";
	setAttr -s 2 ".e[0:1]"  0.25243217 0.2760841;
	setAttr -s 2 ".d[0:1]"  -2147483291 -2147483289;
createNode polyTweak -n "polyTweak28";
	setAttr ".uopa" yes;
	setAttr -s 18 ".tk";
	setAttr ".tk[3]" -type "float3" 2.7755576e-17 -0.04404572 5.5511151e-17 ;
	setAttr ".tk[18]" -type "float3" 5.5511151e-17 -0.027444029 -0.034539305 ;
	setAttr ".tk[43]" -type "float3" 0.039722353 -0.039471202 0 ;
	setAttr ".tk[46]" -type "float3" 0.068312414 -5.5511151e-17 0 ;
	setAttr ".tk[177:186]" -type "float3" 0 0.012722476 -0.05366613  0.23155184 
		0 0  0 0.012722476 -0.05366613  0.23155184 2.220446e-16 0.064083256  0.15269999 
		0.020865357 0.064083256  0.23155184 0 0  0.15269999 0.020865357 0  0.23155184 
		-0.038338572 -2.7755576e-17  0.23155184 0.012722476 -0.05366613  0 2.220446e-16 
		0.064083256 ;
	setAttr ".tk[188:191]" -type "float3" 0.23155184 0 0  0.23155184 2.220446e-16 
		0.064083256  0.23155184 0.012722476 -0.05366613  0.23155184 0 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace26";
	setAttr ".ics" -type "componentList" 1 "f[170]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00096518808 -0.0011117093 -0.0001283665 ;
	setAttr ".rs" 1197104748;
	setAttr ".lt" -type "double3" 6.4957153865246567e-20 1.6307849025558353e-19 
		0.00040815348235589017 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace27";
	setAttr ".ics" -type "componentList" 1 "f[170]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0013722625 -0.0010887093 -0.00014709475 ;
	setAttr ".rs" 493840558;
	setAttr ".lt" -type "double3" -4.9771829135704772e-20 -3.5862663618743375e-05 
		0.00036832084458262259 ;
	setAttr ".ls" -type "double3" 1.1999999999999997 1.1999999999999997 1.1999999999999997 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace28";
	setAttr ".ics" -type "componentList" 1 "f[170]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0017395612 -0.0010429192 -0.00013658195 ;
	setAttr ".rs" 534172330;
	setAttr ".lt" -type "double3" 8.846518410617616e-05 -7.7984267540181352e-05 
		0.00046640577949559663 ;
	setAttr ".ls" -type "double3" 0.81666666666667009 0.81666666666667009 0.83884399596886439 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace29";
	setAttr ".ics" -type "componentList" 1 "f[170]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0022112138 -0.0010384434 -4.1364394e-05 ;
	setAttr ".rs" 814259427;
	setAttr ".lt" -type "double3" 3.7403796980286752e-20 9.1721551326451681e-21 
		0.00043929680846869546 ;
	setAttr ".ls" -type "double3" 0.63333333333333297 0.63333333333333297 0.65453583266004978 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace30";
	setAttr ".ics" -type "componentList" 1 "f[170]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0026494348 -0.0010179833 -6.080998e-05 ;
	setAttr ".rs" 936953128;
	setAttr ".lt" -type "double3" 2.5004260428599175e-19 3.7277543240703234e-19 
		0.00059423014709358651 ;
	setAttr ".ls" -type "double3" 2.5277777777777879 2.7189752527404694 2.5277777777777879 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polySplit -n "polySplit11";
	setAttr -s 2 ".e[0:1]"  0.52710104 0.53317893;
	setAttr -s 2 ".d[0:1]"  -2147483246 -2147483243;
createNode polyExtrudeFace -n "polyExtrudeFace31";
	setAttr ".ics" -type "componentList" 1 "f[170]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0032302085 -0.00075889536 -7.2476061e-05 ;
	setAttr ".rs" 1456826549;
	setAttr ".ls" -type "double3" 0.76666666666667072 0.76666666666667072 0.75651791182742667 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace32";
	setAttr ".ics" -type "componentList" 1 "f[170]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0032302404 -0.00076143688 -7.2546864e-05 ;
	setAttr ".rs" 2003162485;
	setAttr ".lt" -type "double3" -0.00017193198013792607 -3.4846426565097454e-19 
		0.00064218551367914445 ;
	setAttr ".ls" -type "double3" 1.5999999999999854 1.5999999999999854 1.6211018887925368 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace33";
	setAttr ".ics" -type "componentList" 1 "f[193]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0032554809 -0.001239843 -9.9004603e-05 ;
	setAttr ".rs" 486656907;
	setAttr ".ls" -type "double3" 0.81666666666667209 0.81666666666667209 0.83444519382225657 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polyExtrudeFace -n "polyExtrudeFace34";
	setAttr ".ics" -type "componentList" 1 "f[193]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0032554888 -0.001239137 -9.8803917e-05 ;
	setAttr ".rs" 1078883500;
	setAttr ".lt" -type "double3" 7.0844462407853451e-05 0.00012358062204848803 
		0.00062875759891697859 ;
	setAttr ".ls" -type "double3" 1.4865314043209858 1.5286991794206382 1.4865314043209858 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polySplit -n "polySplit12";
	setAttr ".e[0]"  0.092869975;
	setAttr ".d[0]"  -2147483296;
createNode polyTweak -n "polyTweak29";
	setAttr ".uopa" yes;
	setAttr -s 34 ".tk";
	setAttr ".tk[176:187]" -type "float3" 0 -2.4973352 0  0 -2.4973352 
		-5.5511151e-17  -0.16451883 -2.4973352 0  0.043211788 -2.4973352 -5.5511151e-17  
		-0.16451883 -2.4973352 -4.1633363e-17  -0.08451096 -2.4973352 -4.1633363e-17  
		-0.16451883 -2.4973352 -8.3266727e-17  -0.08451096 -2.4973352 -8.3266727e-17  
		-0.16451883 -2.4973352 -8.3266727e-17  -0.16451883 -2.4973352 -8.3266727e-17  
		0 -2.4973352 -2.7755576e-17  0 -2.4973352 -5.5511151e-17 ;
	setAttr ".tk[210:231]" -type "float3" 0.028176976 0.037080731 0.0511631  
		0.024375292 0.040399835 -0.026938373  0.032650236 -0.044860534 0.048217319  
		0.029011438 -0.046974137 -0.033927273  0.030534795 -0.0061106179 0.049610358  
		0.02684718 -0.006186164 -0.030664733  0.028011337 0.032189518 0.041610077  
		0.025096828 0.034734115 -0.01826773  0.02981909 -0.00092387054 0.040419653  
		0.026991807 -0.00098179583 -0.021124566  0.085330762 0.057172649 0.047920041  
		0.080667466 0.061244026 -0.047884412  0.088223055 0.0041912342 0.0460154  
		0.083699591 0.0040985709 -0.052455358  0.030391574 -0.0097923782 0.041970946  
		0.027379856 -0.0098540857 -0.023587022  0.032119017 -0.0414382 0.040833272  
		0.029147469 -0.043164268 -0.026251446  0.088082328 -0.009668801 0.052455351  
		0.083605349 -0.011114337 -0.046665959  0.090650275 -0.057264991 0.050082251  
		0.08623296 -0.061244026 -0.051381782 ;
createNode polySplit -n "polySplit13";
	setAttr -s 4 ".e[0:3]"  0.80425179 0.10397751 0.068844818 
		0;
	setAttr -s 4 ".d[0:3]"  -2147483296 -2147483307 -2147483292 -2147483285;
createNode polyExtrudeFace -n "polyExtrudeFace35";
	setAttr ".ics" -type "componentList" 2 "f[164]" "f[168]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0004677322 -0.0010876558 0.0002392832 ;
	setAttr ".rs" 2136324416;
	setAttr ".lt" -type "double3" 3.1732116107200374e-07 1.8030658079945238e-05 
		0.00019900377425860878 ;
	setAttr ".lr" -type "double3" -16.635093109924547 0.23621602741694761 -0.058761056721879333 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode deleteComponent -n "deleteComponent35";
	setAttr ".dc" -type "componentList" 1 "f[219]";
createNode deleteComponent -n "deleteComponent36";
	setAttr ".dc" -type "componentList" 1 "f[220]";
createNode deleteComponent -n "deleteComponent37";
	setAttr ".dc" -type "componentList" 1 "f[214]";
createNode polyMergeVert -n "polyMergeVert39";
	setAttr ".ics" -type "componentList" 2 "vtx[238]" "vtx[244]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert40";
	setAttr ".ics" -type "componentList" 2 "vtx[237]" "vtx[242]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert41";
	setAttr ".ics" -type "componentList" 2 "vtx[46]" "vtx[237]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyTweak -n "polyTweak30";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk";
	setAttr ".tk[18]" -type "float3" 0 0 1.8626451e-09 ;
	setAttr ".tk[46:47]" -type "float3" 0 0 1.8626451e-09  0 0 1.8626451e-09 ;
	setAttr ".tk[188]" -type "float3" 0 0 1.8626451e-09 ;
	setAttr ".tk[233:235]" -type "float3" 0 0 1.8626451e-09  0 0 1.8626451e-09  
		0 0 1.8626451e-09 ;
	setAttr ".tk[237]" -type "float3" 5.5511151e-17 0 -0.02600548 ;
	setAttr ".tk[239:242]" -type "float3" -0.06072516 -0.0099575855 -0.041649453  
		-0.06072516 -0.0099575855 -0.041649453  -0.0057623694 0 0  -0.01650966 0 
		0 ;
createNode polySplit -n "polySplit14";
	setAttr -s 3 ".e[0:2]"  0.059319194 0.045899823 0.086571641;
	setAttr -s 3 ".d[0:2]"  -2147483209 -2147483207 -2147483205;
createNode polyTweak -n "polyTweak31";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[236]" -type "float3" 0.046231709 -0.031986084 2.7755576e-17 ;
	setAttr ".tk[240]" -type "float3" 0 -0.035985723 -2.7755576e-17 ;
createNode polyExtrudeFace -n "polyExtrudeFace36";
	setAttr ".ics" -type "componentList" 1 "f[210:211]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00045893173 -0.0016684973 0.00028649741 ;
	setAttr ".rs" 896985966;
	setAttr ".lt" -type "double3" 2.0772669830831302e-08 -3.158444116864754e-05 
		0.00026337736684690173 ;
	setAttr ".lr" -type "double3" -12.345683088432638 0 0 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode deleteComponent -n "deleteComponent38";
	setAttr ".dc" -type "componentList" 2 "f[225]" "f[227]";
createNode polySplit -n "polySplit15";
	setAttr -s 3 ".e[0:2]"  0.070399046 0.095837317 0.073282048;
	setAttr -s 3 ".d[0:2]"  -2147483189 -2147483188 -2147483186;
createNode polyExtrudeFace -n "polyExtrudeFace37";
	setAttr ".ics" -type "componentList" 1 "f[219:220]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00044862705 -0.0022129798 0.00029065463 ;
	setAttr ".rs" 1908697942;
	setAttr ".lt" -type "double3" -5.2088254325729959e-20 -4.956314814030057e-05 
		0.00030480979087644399 ;
	setAttr ".lr" -type "double3" -16.985964186401031 0 0 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polySplit -n "polySplit16";
	setAttr -s 3 ".e[0:2]"  0.10441589 0.068183102 0.10351197;
	setAttr -s 3 ".d[0:2]"  -2147483166 -2147483165 -2147483163;
createNode polyExtrudeFace -n "polyExtrudeFace38";
	setAttr ".ics" -type "componentList" 1 "f[228:229]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.00044065938 -0.002783949 0.00029501703 ;
	setAttr ".rs" 930829477;
	setAttr ".lt" -type "double3" -2.2980609621238959e-20 -6.2324905946951512e-05 
		0.00029941861383856133 ;
	setAttr ".lr" -type "double3" -20.178103794435881 0 0 ;
	setAttr ".ls" -type "double3" 1 0.79488160578412836 1 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
createNode polySplit -n "polySplit17";
	setAttr -s 4 ".e[0:3]"  0.026921613 0.085237026 0.084589973 
		0.15324022;
	setAttr -s 4 ".d[0:3]"  -2147483186 -2147483287 -2147483286 -2147483289;
createNode polyMergeVert -n "polyMergeVert42";
	setAttr ".ics" -type "componentList" 2 "vtx[244]" "vtx[276]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polySplit -n "polySplit18";
	setAttr ".e[0]"  0.031706702;
	setAttr ".d[0]"  -2147483132;
createNode polySplit -n "polySplit19";
	setAttr -s 3 ".e[0:2]"  0 0.069640756 0.066258289;
	setAttr -s 3 ".d[0:2]"  -2147483164 -2147483124 -2147483122;
createNode polyMergeVert -n "polyMergeVert43";
	setAttr ".ics" -type "componentList" 2 "vtx[256]" "vtx[279]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polySplit -n "polySplit20";
	setAttr -s 3 ".e[0:2]"  0 0.10012415 0.10199966;
	setAttr -s 3 ".d[0:2]"  -2147483143 -2147483118 -2147483116;
createNode polySplit -n "polySplit21";
	setAttr -s 2 ".e[0:1]"  0 0.067027077;
	setAttr -s 2 ".d[0:1]"  -2147483116 -2147483121;
createNode polyTweak -n "polyTweak32";
	setAttr ".uopa" yes;
	setAttr -s 15 ".tk";
	setAttr ".tk[244]" -type "float3" -0.035708025 -2.220446e-16 0 ;
	setAttr ".tk[253]" -type "float3" -0.035708025 -2.220446e-16 0 ;
	setAttr ".tk[256]" -type "float3" -7.4505806e-09 0 0 ;
	setAttr ".tk[262]" -type "float3" -0.035708025 -2.220446e-16 0 ;
	setAttr ".tk[264]" -type "float3" -7.4505806e-09 0 0 ;
	setAttr ".tk[267]" -type "float3" 7.4505806e-09 0 0 ;
	setAttr ".tk[273]" -type "float3" -7.4505806e-09 0 0 ;
	setAttr ".tk[275:282]" -type "float3" 7.4505806e-09 0 0  -0.035708025 
		-2.220446e-16 0  -0.035708025 -2.220446e-16 0  -0.035708025 -2.220446e-16 
		0  -7.4505806e-09 0 0  -7.4505806e-09 0 0  7.4505806e-09 0 0  7.4505806e-09 
		0 0 ;
createNode polyMergeVert -n "polyMergeVert44";
	setAttr ".ics" -type "componentList" 1 "vtx[280]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polySplit -n "polySplit22";
	setAttr -s 2 ".e[0:1]"  0 0.10408103;
	setAttr -s 2 ".d[0:1]"  -2147483112 -2147483110;
createNode polyMergeVert -n "polyMergeVert45";
	setAttr ".ics" -type "componentList" 1 "vtx[282]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polySplit -n "polySplit23";
	setAttr -s 8 ".e[0:7]"  0.059316643 0.11432396 0.071774393 
		0.072746858 0.081541143 0.080594815 0.40050051 0.39600846;
	setAttr -s 8 ".d[0:7]"  -2147483146 -2147483145 -2147483143 -2147483114 -2147483112 
		-2147483108 -2147483315 -2147483317;
createNode polyTweak -n "polyTweak33";
	setAttr ".uopa" yes;
	setAttr -s 51 ".tk";
	setAttr ".tk[176:187]" -type "float3" -1.2047965e-16 -0.19041377 0  
		-1.2047965e-16 -0.19041377 0  -1.110223e-16 -0.19041377 0  -1.110223e-16 
		-0.19041377 0  -1.110223e-16 -0.19041377 0  -1.110223e-16 -0.19041377 0  
		-1.110223e-16 -0.19041377 0  -1.110223e-16 -0.19041377 0  -1.110223e-16 -0.19041377 
		0  -1.110223e-16 -0.19041377 0  -1.2047965e-16 -0.19041377 0  -1.2047965e-16 
		-0.19041377 0 ;
	setAttr ".tk[231]" -type "float3" -2.220446e-16 -0.044909082 0 ;
	setAttr ".tk[242:244]" -type "float3" -1.2047965e-16 -0.044909082 
		0  -1.110223e-16 -0.044909082 0  -1.110223e-16 -0.044909082 0 ;
	setAttr ".tk[248:249]" -type "float3" -1.2143064e-16 -0.044909082 
		0  -1.110223e-16 -0.044909082 0 ;
	setAttr ".tk[252:284]" -type "float3" -1.110223e-16 -0.044909082 0  
		-1.110223e-16 -0.044909082 0  -1.2047965e-16 -0.11210537 0  -1.110223e-16 
		-0.11210537 0  -0.075762443 -0.11210537 0  -1.1969592e-16 -0.044909082 0  
		-1.110223e-16 -0.044909082 0  -1.2143064e-16 -0.11210537 0  -1.110223e-16 
		-0.11210537 0  -1.110223e-16 -0.044909082 0  -1.110223e-16 -0.044909082 0  
		-1.110223e-16 -0.11210537 0  -0.075762443 -0.11210537 0  -1.2047965e-16 -0.19041377 
		0  -1.110223e-16 -0.19041377 0  -0.11336431 -0.19041377 -1.3877788e-17  -1.1969592e-16 
		-0.11210537 0  -1.110223e-16 -0.11210537 0  -1.2143064e-16 -0.19041377 0  
		-1.110223e-16 -0.19041377 0  -1.110223e-16 -0.11210537 0  -0.075762443 -0.11210537 
		0  -1.110223e-16 -0.19041377 0  -0.11336431 -0.19041377 0  -1.110223e-16 
		-0.044909082 0  -1.110223e-16 -0.044909082 0  -1.110223e-16 -0.044909082 
		0  -0.075762443 -0.11210537 0  -0.075762443 -0.11210537 0  -0.11336431 -0.19041377 
		-1.3877788e-17  -0.11336431 -0.19041377 0  -0.075762443 -0.11210537 0  -0.11336431 
		-0.19041377 0 ;
createNode polySplit -n "polySplit24";
	setAttr -s 8 ".e[0:7]"  0.13620184 0.1208657 0.13546935 
		0.13525781 0.13705027 0.13898787 0.1396807 0.14309299;
	setAttr -s 8 ".d[0:7]"  -2147483106 -2147483105 -2147483103 -2147483101 -2147483099 
		-2147483097 -2147483095 -2147483093;
createNode polyTweak -n "polyTweak34";
	setAttr ".uopa" yes;
	setAttr -s 20 ".tk";
	setAttr ".tk[176:187]" -type "float3" -6.8503589e-08 -0.45227417 0.14917652  
		-6.8503589e-08 -0.41550452 0.090956718  -0.12390324 -0.47425088 0.1188734  
		-0.1027462 -0.42493173 0.079403885  -0.1884563 -0.43526042 -0.089082658  
		-0.12024224 -0.40820739 -0.089093536  -0.18087465 -0.4490042 -0.13111505  
		-0.11446978 -0.42421654 -0.13615006  -0.16733249 -0.46801478 0.10133646  
		-0.17960277 -0.46195877 0.075842232  -6.8503589e-08 -0.38104892 -0.089104407  
		-6.8503589e-08 -0.40154979 -0.14917652 ;
	setAttr ".tk[285:292]" -type "float3" -6.7428081e-09 -0.0081595611 
		-0.03956943  -0.029381711 0.0081595611 -0.035869338  -0.047770422 0.00068520289 
		-0.034634423  -0.052832689 0.00092938275 -0.025067898  -0.050699838 0.0013021405 
		0.020092685  -0.039604619 0.0016582861 0.024968598  -0.028195182 0.0013835758 
		0.030115489  -8.0495788e-09 -9.6494914e-05 0.039569426 ;
createNode polyCut -n "polyCut1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:270]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".pc" -type "double3" 0.0013889166754901591 -0.0060200997610890331 
		5.0136484205722808e-05 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 0.01 0.011649758964776992 ;
createNode polyCut -n "polyCut2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:277]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".pc" -type "double3" 0.0014405297596389991 -0.0073620399489588689 
		5.0136484205722808e-05 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 0.01 0.011649758964776992 ;
createNode polyCut -n "polyCut3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:284]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".pc" -type "double3" 0.001560960289319625 -0.0086351626912969191 
		5.0136484205722808e-05 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 0.01 0.011649758964776992 ;
createNode polyCut -n "polyCut4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:291]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".pc" -type "double3" 0.0021459085763398103 -0.0077577402607666417 
		5.0136484205722808e-05 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 0.01 0.01193184033036232 ;
createNode polyTweak -n "polyTweak35";
	setAttr ".uopa" yes;
	setAttr -s 44 ".tk";
	setAttr ".tk[176:187]" -type "float3" -4.4703484e-08 -0.1224442 -8.3266727e-17  
		-4.4703484e-08 -0.1224442 -8.3266727e-17  0.0039590965 -0.1224442 -8.3266727e-17  
		0.010031099 -0.1224442 -8.3266727e-17  -0.014567519 -0.1224442 -4.1633363e-17  
		0.0050097797 -0.1224442 -4.1633363e-17  -0.012391579 -0.1224442 -4.488597e-17  
		0.0066664619 -0.1224442 -4.4235449e-17  -0.0085050166 -0.1224442 -8.3266727e-17  
		-0.012026522 -0.1224442 -8.3266727e-17  -4.4703484e-08 -0.1224442 -4.1633363e-17  
		-4.4703484e-08 -0.1224442 -4.6837534e-17 ;
	setAttr ".tk[293:324]" -type "float3" -0.029347453 7.6368451e-08 2.9802322e-08  
		-0.0084693823 -6.9849193e-10 1.4901161e-08  0.0082717547 0 -2.2351742e-08  
		0.012738028 -5.5879354e-09 0  0.010707149 1.8626451e-09 0  0.00099565531 
		-8.3819032e-09 -1.4901161e-08  -0.009541288 -5.5879354e-09 0  -0.029347457 
		-1.8626451e-09 0  -3.3527613e-08 0.23950635 0  -0.01200134 0.23950635 0  
		-0.043301549 0.23950635 0  -0.05106983 0.23950635 0  -0.047214035 0.23950635 
		0  -0.030750882 0.23950635 0  -0.010935189 0.23950635 0  -3.7252903e-08 0.23950635 
		0  -3.7252903e-08 0.56691587 -4.4703484e-08  0.0084553547 0.56691599 -1.4901161e-08  
		0.04627499 0.56691599 2.9802322e-08  0.054631714 0.56691593 2.2351742e-08  
		0.049734265 0.56691599 -2.9802322e-08  0.032668434 0.56691599 4.4703484e-08  
		0.0085130772 0.56691599 0  -4.0978193e-08 0.56691599 4.4703484e-08  -4.0978193e-08 
		0.7894246 -2.7755576e-17  -0.00053315185 0.7894246 -2.7755576e-17  -0.024150401 
		0.7894246 -2.7755576e-17  -0.028560406 0.7894246 -3.1225023e-17  -0.025314849 
		0.7894246 -5.5511151e-17  -0.016876925 0.7894246 -5.5511151e-17  -0.0016260121 
		0.7894246 -5.5511151e-17  -4.0978193e-08 0.7894246 -5.5511151e-17 ;
createNode polyCut -n "polyCut5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:298]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".pc" -type "double3" 0.0027136525019770485 -0.0086867757754457587 
		5.0136484205722808e-05 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 0.01 0.01193184033036232 ;
createNode polyCut -n "polyCut6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:305]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".pc" -type "double3" 0.0026964481405941016 -0.009581402567358982 
		5.0136484205722808e-05 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 0.01 0.01193184033036232 ;
createNode polyTweak -n "polyTweak36";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[325:332]" -type "float3"  -0.00071594864 0 
		0 0.00032959133 0 0 0.00065926462 0 0 0.00071599334 0 0 0.00067041069 0 0 
		0.00056482106 0 0 0.00035119802 0 0 -0.00071594864 0 0;
createNode deleteComponent -n "deleteComponent39";
	setAttr ".dc" -type "componentList" 2 "f[233]" "f[235]";
createNode deleteComponent -n "deleteComponent40";
	setAttr ".dc" -type "componentList" 2 "f[241]" "f[243]";
createNode polyMergeVert -n "polyMergeVert46";
	setAttr ".ics" -type "componentList" 2 "vtx[246]" "vtx[250]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert47";
	setAttr ".ics" -type "componentList" 2 "vtx[249]" "vtx[251]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert48";
	setAttr ".ics" -type "componentList" 3 "vtx[243]" "vtx[256]" "vtx[259]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert49";
	setAttr ".ics" -type "componentList" 2 "vtx[257]" "vtx[259]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert50";
	setAttr ".ics" -type "componentList" 2 "vtx[264]" "vtx[267]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode polyMergeVert -n "polyMergeVert51";
	setAttr ".ics" -type "componentList" 2 "vtx[266]" "vtx[268]";
	setAttr ".ix" -type "matrix" 0.23037562914109222 0 0 0 0 0.23037562914109222 0 0
		 0 0 0.23037562914109222 0 0 0 0 1;
	setAttr ".d" 0.061744000000000007;
createNode deleteComponent -n "deleteComponent41";
	setAttr ".dc" -type "componentList" 3 "f[223]" "f[231]" "f[239]";
createNode polySmoothFace -n "polySmoothFace3";
	setAttr ".ics" -type "componentList" 4 "f[6:7]" "f[32:34]" "f[37]" "f[162:305]";
	setAttr ".suv" yes;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
createNode polyTweak -n "polyTweak37";
	setAttr ".uopa" yes;
	setAttr -s 16 ".tk";
	setAttr ".tk[232:233]" -type "float3" -1.0379029e-08 0 0  -8.3473521e-09 
		0 0 ;
	setAttr ".tk[242]" -type "float3" -1.6392791e-08 0 0 ;
	setAttr ".tk[245]" -type "float3" -0.011549349 0 0 ;
	setAttr ".tk[247:248]" -type "float3" -0.013455402 0 0  -0.019097323 
		0 0 ;
	setAttr ".tk[252]" -type "float3" -2.3106463e-08 0 0 ;
	setAttr ".tk[255:256]" -type "float3" -0.013136439 0 0  -0.021606252 
		0 0 ;
	setAttr ".tk[260]" -type "float3" -3.2363168e-08 0 0 ;
	setAttr ".tk[263]" -type "float3" -0.011810576 0 0 ;
	setAttr ".tk[265:266]" -type "float3" -0.022577696 4.4408921e-16 -0.038251869  
		0 4.4408921e-16 -0.038251869 ;
	setAttr ".tk[268]" -type "float3" 0 4.4408921e-16 -0.038251869 ;
	setAttr ".tk[278]" -type "float3" -3.0329836e-08 0 0 ;
	setAttr ".tk[285]" -type "float3" -3.6207819e-08 0 0 ;
createNode polySmoothFace -n "polySmoothFace4";
	setAttr ".ics" -type "componentList" 3 "f[3]" "f[121]" "f[124:161]";
	setAttr ".suv" yes;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
createNode tweak -n "tweak1";
	setAttr -s 794 ".vl[0].vt";
	setAttr ".vl[0].vt[3]" -type "float3" -4.6566123e-12 2.220446e-18 -0.0011879236 ;
	setAttr ".vl[0].vt[7:8]" -type "float3" -6.1629757e-35 0.00081359124 
		0.00078113913  -3.0814878e-35 0.00071148417 1.5407439e-35 ;
	setAttr ".vl[0].vt[10:11]" -type "float3" 0 0.00030202817 -0.00084565335  
		-3.0814878e-35 -0.0006339114 -0.0010924764 ;
	setAttr ".vl[0].vt[13:14]" -type "float3" -3.7252902e-11 -0.00054707547 
		-0.0024238722  2.3283064e-12 -3.7252902e-11 -4.1047413e-05 ;
	setAttr ".vl[0].vt[18]" -type "float3" 0 7.4505804e-11 9.2792317e-05 ;
	setAttr ".vl[0].vt[32]" -type "float3" -3.0814878e-35 -0.00036005833 -2.7755575e-19 ;
	setAttr ".vl[0].vt[36]" -type "float3" -3.0814878e-35 -0.00032791652 2.7755575e-19 ;
	setAttr ".vl[0].vt[40]" -type "float3" 0 -2.7755575e-19 0.00032957154 ;
	setAttr ".vl[0].vt[43:47]" -type "float3" 5.551115e-19 7.4505804e-11 
		-0.001250661  0 -0.00059966202 0.00019769341  0 0 -0.00024003211  4.6566128e-12 
		-3.7252902e-11 0.00060785218  -3.7252902e-11 7.4505804e-11 0.0006762789 ;
	setAttr ".vl[0].vt[77]" -type "float3" -3.0119913e-19 0 0.00055286934 ;
	setAttr ".vl[0].vt[88]" -type "float3" -3.0119913e-19 0 0.00018993951 ;
	setAttr ".vl[0].vt[140:819]" -type "float3" 0.00091560965 -0.00027723768 
		0.00010802105  0.0010479068 -6.5109969e-05 0.00011986673  0.00090809667 -0.00028915744 
		-0.00014047405  0.0010417333 -8.3494604e-05 -0.00013502479  0.0013573916 
		-0.00059299509 0.00022824387  0.0017712993 -0.00022166334 0.00033404271  
		0.0013025068 -0.00063950452 -0.00031787113  0.0017123652 -0.0002815726 -0.00023640836  
		0.0017434264 -0.0003415423 0.00036530531  0.0016584685 -0.00042097084 -0.00031132667  
		0.0015664283 -0.00049532496 0.00031801045  0.0014828565 -0.00056902372 -0.00034613546  
		0.0018161178 -0.00034913502 0.00030143687  0.0019038884 -0.00027308942 0.00032423745  
		0.0017496373 -0.00041176446 -0.00023250938  0.0018454586 -0.00033079766 -0.00021179819  
		0.0019996052 -0.00046124778 0.00027264777  0.0020787395 -0.00039306469 0.00029217495  
		0.001942616 -0.00051553472 -0.00019955597  0.0020257356 -0.00044491666 -0.0001810628  
		0.0016325194 -0.00051846058 0.00024607798  0.0017491479 -0.00041746558 0.00027610897  
		0.0015655174 -0.00057774567 -0.00025850607  0.0016816502 -0.00047951803 -0.00023345178  
		0.0017860821 -0.00070112443 0.0002395059  0.0019079448 -0.00059633027 0.00026702031  
		0.0017166206 -0.00076303416 -0.00024872494  0.0018380753 -0.00065961969 -0.00022382243  
		0.0014334673 -0.00068944471 0.000202209  0.0015445589 -0.00059311016 0.00023176309  
		0.0013810062 -0.00073256885 -0.00029656495  0.0014819595 -0.00064734876 -0.00027402048  
		0.0015149041 -0.00092843437 0.00020096183  0.0016202547 -0.00083766022 0.0002284567  
		0.0014619762 -0.00097237981 -0.00029625415  0.001562004 -0.00088746095 -0.00027251913  
		0.00035727027 0.014589321 -0.017678617  0.00035727027 0.014658481 -0.018115297  
		-0.00011260186 0.013943137 -0.017674215  -9.1340866e-05 0.0144925 -0.018242972  
		-0.00029294883 0.013583916 -0.018887909  -0.0001098789 0.014234874 -0.019123714  
		-0.00027222151 0.013044959 -0.019043775  -0.00010686061 0.013506101 -0.01926804  
		-0.00025137144 0.013516829 -0.017631702  -0.00027519875 0.013842349 -0.018038893  
		0.00035727027 0.014387572 -0.019287474  0.00035727027 0.014101473 -0.019606519  
		-9.3132255e-12 0 0.0005245136  1.8626451e-11 3.7252902e-11 0.00027986593  
		1.8626451e-11 7.4505804e-11 -0.00031790661  -9.3132247e-12 2.220446e-18 -0.0011947457  
		1.8626451e-11 0 0.00029274778  -1.8626451e-11 -3.7252902e-11 -0.00031694293  
		0.00057714293 5.8463458e-05 0  0.00055893726 7.4324256e-05 0  0.00059889327 
		-0.00019347988 0  0.00058120379 -0.00018835482 0  0.00091994024 9.424187e-05 
		0  0.00089954713 0.00011199909 0  0.00094428071 -0.00018793497 0  0.00092446589 
		-0.00018219657 0  0.0013226877 8.0110003e-05 0  0.0013054977 9.5017451e-05 
		0  0.0013430885 -0.00015693191 0  0.0013263862 -0.00015210635 0  0.0015910397 
		0.00018245605 0.00016303379  0.0015634142 0.0002064991 -5.640263e-05  0.0016244687 
		-0.00028942208 0.00015834619  0.0015976327 -0.00028528515 -6.8203721e-05  
		0.0025074326 0.00053896988 3.8485508e-05  0.0024512415 0.00057103118 -0.00016379255  
		0.0025856865 -0.00058530876 0.00026844061  0.0025310838 -0.00060415088 -0.00020743415  
		0.0026586968 -4.7071058e-05 7.3036674e-05  0.0025925594 -4.6729347e-05 -0.00037272551  
		0.0027934678 0.00061103393 0.0002667263  0.0027392369 0.00084327383 -0.00044570104  
		0.0028277466 0.00011836614 0.00025592974  0.0027745983 0.00012370471 -0.00046450549  
		0.0062556178 -0.00042207428 0.00018452854  0.0062045343 -0.00039837847 -0.00022859174  
		0.0053884024 -0.00018450132 0.0001726092  0.0053378809 3.3414384e-05 -0.00024466793  
		0.0028463425 -0.00018690249 0.0002673328  0.0027927426 -0.00019728676 -0.00047678166  
		0.0028779795 -0.00064838759 0.00025648027  0.0028248676 -0.00068321318 -0.00049485097  
		0.0051889969 0.00011542169 -0.0002733673  0.0051875855 0.00012152907 0.00019340076  
		0.0051898537 1.3519949e-05 -0.00025888023  0.0051884484 2.3409768e-05 0.00021189831  
		-3.7252902e-11 -1.8626451e-11 0.00068752177  -3.7252902e-11 -3.7252902e-11 
		0.00068532169  4.6566128e-12 0 0.00072839647  9.3132255e-12 -1.8626451e-11 
		0.00059927523  1.4551888e-13 7.4505804e-11 0.00056432578  -9.3132255e-12 
		0 0.0010403219  9.3132255e-12 -3.7252902e-11 0.00082817947  -9.3132255e-12 
		0 0.00064934877  -3.7252902e-11 -7.4505804e-11 0.00085301558  -3.7252902e-11 
		0 0.00065709866  -3.7252902e-11 -4.6566128e-12 0.00069403625  -2.7755575e-19 
		0 0.00090981327  9.3132255e-12 1.1641532e-12 0.00063565257  1.8626451e-11 
		-1.8626451e-11 0.00098818296  -2.7755575e-19 1.8626451e-11 0.0010003401  
		-3.7252902e-11 0 0.0011170733  -3.7252902e-11 4.6566128e-12 0.00048073314  
		9.3132255e-12 0 0.0011323601  9.3132255e-12 1.8626451e-11 0.00092646363  
		-5.551115e-19 9.3132255e-12 0.0010215326  -3.7252902e-11 1.8626451e-11 0.00070130959  
		4.6566128e-12 0 0.00076842197  9.3132255e-12 0 0.00064020505  -3.7252902e-11 
		-0.00037453079 0.0011210461  -3.7252902e-11 1.8626451e-11 0.00052307552  
		-4.6566128e-12 -1.8626451e-11 0.0012222312  -5.551115e-19 -4.6566128e-12 
		0.00096974731  4.6566123e-12 1.8626451e-11 0.0011070223  0 0 0.00071133743  
		-4.6566128e-12 0 0.00067205727  2.328306e-12 -7.4505804e-11 0.00060725847  
		-3.7252902e-11 -3.7252902e-11 0.0010936834  -4.6566128e-12 3.7252902e-11 
		0.0010155044  -4.6566128e-12 0.00037548109 0.00049401034  -4.6566128e-12 
		0 0.0010739561  4.6566123e-12 0 0.00095219567  -5.551115e-19 3.7252902e-11 
		0.0010050873  -5.551115e-19 0 0.000257623  -1.8626451e-11 0 -0.00032430378  
		-9.3132247e-12 2.220446e-18 -0.001212075  -1.8626451e-11 1.8626451e-11 0.00025770589  
		0 -1.8626451e-11 -0.00032831836  -4.6566136e-12 3.7252902e-11 0.00024444307  
		-4.6566128e-12 -7.4505804e-11 -0.00032953144  1.110223e-18 4.440892e-18 -0.0012188919  
		-0.00017826907 3.7252902e-11 -0.0018319893  0 0 0.00015557049  0 0 0.00013245031  
		0 0 0.00011017529  0 0 -2.3065288e-06  0 0 -0.00031055327  0 0 -0.00039546887  
		-9.3132255e-12 4.440892e-18 -0.00092055305  0 2.220446e-18 -0.00038521443  
		0.00029347421 0 0.00013211637  0 0 0.00010595484  0 0 8.4052896e-05  0 0 
		-1.9515523e-05  0 0 -0.00030147881  0 0 -0.00038091294  0 0 -0.00042532809  
		0.00029347421 4.440892e-18 -0.00031237592  -1.0755273e-11 0 9.8638026e-05  
		0 0 7.6288503e-05  0 0 5.6391629e-05  0 0 -3.8186092e-05  0 0 -0.00029326152  
		0 0 -0.00036641222  0 0 -0.00040645979  -1.2493118e-11 -4.440892e-18 -0.0003122444  
		-5.6797232e-13 0 6.2579027e-05  0 0 4.2968448e-05  0 0 2.5156785e-05  0 0 
		-5.9457765e-05  0 0 -0.00028402009  0 0 -0.00034987929  0 0 -0.0003848669  
		9.631229e-12 -4.440892e-18 -0.00028135709  1.1007337e-11 -0.00076409476 -0.0031190133  
		0 -0.00069808617 -0.0031658413  0 -0.00064239441 -0.0031659848  0 -0.00037905783 
		-0.0031666977  0 0.00030328421 -0.0031583735  0 0.00050825463 -0.003154713  
		0 0.00061384594 -0.0031544059  -4.7214854e-12 0.00074871106 -0.0031036758  
		0.00016065 0.0020059536 -0.0088620605  -5.1320847e-05 0.0020777029 -0.0087732114  
		-0.00013437563 0.0021481006 -0.0086992783  -0.00015121812 0.0024800876 -0.0083467932  
		-0.00014252568 0.0033390853 -0.0074398196  -0.00011844657 0.0036020062 -0.0071642678  
		-5.2267584e-05 0.0037337553 -0.0070247585  0.00016065 0.0039369673 -0.0068230629  
		0.00020559708 0.0058529498 -0.013079723  -6.4970933e-05 0.0058998452 -0.012986817  
		-0.00017205971 0.0059585748 -0.012915665  -0.00019250911 0.0062359511 -0.012574625  
		-0.00018160156 0.0069478597 -0.011704255  -0.00015350546 0.00716851 -0.011436551  
		-6.7882065e-05 0.0072771572 -0.011303047  0.00020559705 0.0074560274 -0.01111966  
		0.00020559708 0.0095603755 -0.015519884  -5.7561716e-05 0.0096658273 -0.015471319  
		-0.00015979839 0.0097069256 -0.01539364  -0.00017803397 0.0099742245 -0.015069277  
		-0.00016799438 0.010634794 -0.014234441  -0.00014424004 0.010840627 -0.013972441  
		-6.2170184e-05 0.010941554 -0.013844945  0.00020559705 0.011084274 -0.013656619  
		0.00010757891 0.014546082 -0.017934293  0.00035727027 0.014623898 -0.017896954  
		9.7188196e-05 0.014015783 -0.017609585  -9.6466254e-05 0.014479836 -0.017982859  
		0.00011340718 0.014558084 -0.018230729  -0.00022845026 0.014036939 -0.019314373  
		-0.00023172761 0.014153483 -0.019089665  -0.00028905991 0.013475321 -0.019108316  
		-0.00022649055 0.013450554 -0.019225305  -0.00010767175 0.01410919 -0.019354157  
		-0.00019905795 0.014429523 -0.018019469  -0.00021545775 0.013907679 -0.017730672  
		-0.00026255727 0.013887923 -0.017838161  -0.00020980841 0.014408206 -0.018234771  
		-0.00022258468 0.01429947 -0.018652655  -0.00028673778 0.013722169 -0.018458964  
		-9.9074852e-05 0.014387186 -0.018688068  0.00011257343 0.014457868 -0.018709013  
		0.00010433314 0.014311894 -0.019155607  0.00035727027 0.014523022 -0.018701382  
		0.00010998324 0.014180657 -0.019399654  0.00035727027 0.014244522 -0.019446997  
		0.0001053155 0.013556204 -0.019321032  1.8626451e-11 2.220446e-18 -0.0012904545  
		-9.3132255e-12 -7.4505804e-11 -0.00130167  -9.3132255e-12 -4.6566106e-12 
		-0.0012525308  -2.7939677e-11 -3.7252899e-11 -0.00095639646  -3.7252902e-11 
		-4.6566084e-12 -0.0029840169  4.6566123e-12 7.4505804e-11 0.00034321539  
		4.6566128e-12 0 2.5872401e-05  -4.6566136e-12 -3.7252902e-11 0.00045243264  
		-2.7939677e-11 -3.7252902e-11 0.00043240123  9.3132255e-12 3.7252902e-11 
		0.00016054383  -2.7755575e-19 -7.4505804e-11 0.00083932781  -2.7755575e-19 
		3.7252902e-11 0.00062396639  -2.7755575e-19 -3.7252902e-11 0.00090938417  
		-5.551115e-19 0 0.00094686536  -5.551115e-19 3.7252902e-11 0.00075626158  
		-4.6566136e-12 3.7252902e-11 0.00062322355  -1.1641532e-12 -2.3283042e-12 
		-0.0025386596  9.3132255e-12 2.220446e-18 -0.0012192924  2.3283075e-12 -3.7252902e-11 
		-0.0011925069  1.110223e-18 -1.8626449e-11 -0.0012129542  1.110223e-18 4.440892e-18 
		-0.0012210811  5.551115e-19 4.440892e-18 -0.0012259898  -0.00017826907 3.7252902e-11 
		-0.0018287374  9.3132255e-12 3.7252902e-11 -0.00089534163  0 1.1175871e-10 
		-0.00034224879  9.3132255e-12 0 -0.00031227167  4.6566128e-12 -3.7252902e-11 
		-0.00026777777  9.3132255e-12 0 -0.00037148147  0 -3.7252902e-11 -0.00013791016  
		4.6566128e-12 7.4505804e-11 -0.00014053962  -1.8626451e-11 3.7252902e-11 
		-0.00013805609  9.3132255e-12 3.7252902e-11 0.00096689851  -9.3132255e-12 
		0 0.00078176724  -3.7252902e-11 -5.551115e-19 0.00088891096  9.3132255e-12 
		0 0.0010784114  -5.551115e-19 -3.7252902e-11 0.00046279273  -5.551115e-19 
		-3.7252902e-11 0.00056384271  -5.551115e-19 1.8626451e-11 0.00046559423  
		1.8626451e-11 0 0.00038428075  0.007804424 -0.0021533854 -5.5874028e-05  
		0.0063509424 -0.00028133468 -3.1456133e-05  0.0058893939 -0.00021379735 0.00025741314  
		0.005498528 -0.00022235235 -5.1593473e-05  0.0058167488 -0.00018945562 -0.00033604319  
		-2.7939677e-11 3.7252902e-11 -0.00038968533  0 0 -0.00037047241  0 -1.8626451e-11 
		-0.00032120265  0 0 -0.00039647662  -1.8626451e-11 9.3132255e-12 -0.00014621331  
		1.8626451e-11 3.7252902e-11 -0.00014807718  1.8626451e-11 -9.3132255e-12 
		0.00025781913  9.3132255e-12 0 -0.00014745732  0.00038606778 9.6701442e-05 
		0  0.00039852786 4.7151865e-05 0  0.00056547753 0.00010947041 0  0.00038075729 
		6.2609186e-05 0  0.0004120456 -7.7395773e-05 0.00025860369  0.00041972371 
		-0.0001985366 0  0.00059216772 -6.9067137e-05 0  0.00041466494 -0.00023786578 
		0  0.00040245685 -0.00019355319 0  0.00059488718 -0.00023391189 0  0.00038868759 
		-6.3768675e-05 0  0.00056826166 -5.5031102e-05 0  0.00073978177 0.00013443366 
		0  0.00074906403 7.9054713e-05 0  0.00090529135 0.00015150686 0  0.00072955241 
		9.6126016e-05 0  0.00076861074 -5.7424986e-05 0  0.0007724773 -0.00019165344 
		0  0.00093511899 -4.8572379e-05 0  0.00077162945 -0.00023539366 0  0.00075351959 
		-0.00018610351 0  0.00093817915 -0.0002334062 0  0.00074306002 -4.2162043e-05 
		0  0.00090830988 -3.2855485e-05 0  0.0010942123 0.0001468977 0  0.0011136227 
		9.2135684e-05 0  0.001306579 0.00012852513 0  0.0010942108 0.0001089956 0  
		0.0011223475 -4.3727439e-05 0  0.0011367004 -0.00017621109 0  0.0013315135 
		-4.0148734e-05 0  0.0011252824 -0.00021996614 0  0.0011178389 -0.00017076776 
		0  0.0013341032 -0.00019570855 0  0.0010967214 -2.8827908e-05 0  0.001308697 
		-2.6917211e-05 0  0.0014954344 0.0001086139 0  0.0015160358 6.6832363e-05 
		0  0.0015819643 0.00028629665 5.5704637e-05  0.0015015207 7.9306083e-05 0  
		0.0015161207 -3.4226101e-05 0  0.0015330196 -0.00013143889 0  0.001624176 
		-5.5178305e-05 0.0002031496  0.0015184103 -0.00016570548 0  0.0015189117 
		-0.00012734764 0  0.0016288067 -0.00037852503 4.3312837e-05  0.0014962632 
		-2.2908549e-05 0  0.0015875004 -3.7778744e-05 -0.00010499061  0.0021800438 
		0.00052306853 6.4444546e-05  0.0021487384 0.0003418086 0.00023213998  0.0024874948 
		0.00066913292 6.7291119e-05  0.0021067956 0.00036622182 -0.00011741896  0.0022496812 
		-2.9269588e-05 0.00030256214  0.0022013143 -0.00040508795 0.00021766358  
		0.0025923217 -0.00030249194 0.00010605113  0.0025546474 0.0002361872 0.00011396183  
		0.0022578167 -0.00057318329 3.1974443e-05  0.0021605771 -0.00041183335 -0.00014322583  
		0.0025819628 -0.00069974607 2.7205257e-05  0.0021945422 -2.3662195e-05 -0.00020965209  
		0.00248039 0.00025759966 -0.00025715391  0.002518981 -0.0003158731 -0.0004208688  
		0.0078722397 0.001490437 -4.1142815e-05  0.0051918994 0.00010548054 -3.4480046e-05  
		0.0051933848 -2.1654167e-05 -0.00035654291  0.005193118 3.7554077e-05 -1.0070961e-05  
		0.0051914416 -8.9849109e-06 0.00030966167  0.0025918651 0.00075488485 6.7552915e-05  
		0.0026261103 0.00058386003 3.7939681e-05  0.0027714435 0.00091699994 4.9711685e-05  
		0.0025699525 0.0006153452 -0.00030068259  0.0026533371 0.00032580231 0.00011088396  
		0.0026614058 7.3422816e-05 0.00027852057  0.0028260811 0.0003643705 0.00033638018  
		0.002640056 -1.4575096e-05 4.5915156e-05  0.0026427431 -5.2105082e-05 4.5785695e-05  
		0.002606371 7.864408e-05 -0.00018071206  0.0028187225 3.6083635e-05 2.9406909e-05  
		0.0025786329 0.00034902547 -0.00038916923  0.0027539844 0.00038798383 -0.0005302768  
		0.003303427 0.00089335203 1.7454187e-06  0.0032983988 0.00076068699 5.6957226e-05  
		0.0032347334 0.00079657848 -0.00024783899  0.0033550893 0.00047828714 0.00012911519  
		0.0033391966 0.00026542787 0.00024946846  0.0033616959 0.00036178334 -2.2889331e-05  
		0.0032767982 0.0005820212 -0.00027003171  0.0032695837 0.0005059563 -0.00034989868  
		0.0026450318 -8.4126208e-05 4.5643192e-05  0.0026785536 -0.00016262787 0.00028024949  
		0.0028243682 -0.00011186123 3.5662215e-05  0.0026224977 -0.00016842491 -0.00019513322  
		0.0027041768 -0.00039349377 0.00010467691  0.0027108956 -0.00063057954 0.00026974114  
		0.0028764363 -0.00041502644 0.00034174326  0.0026886123 -0.00072276266 2.5461575e-05  
		0.0026553357 -0.00065259094 -0.00021297291  0.0028669355 -0.00074811524 1.5116664e-05  
		0.0026295024 -0.00041427778 -0.00070269161  0.0028084489 -0.00044828039 -0.00056624063  
		0.0033578621 -0.00012485057 1.0271302e-05  0.0033521748 -0.00020873414 0.00028025196  
		0.0032944554 -0.0002355637 -0.0002589364  0.0034011947 -0.00047486366 0.00036740507  
		0.0033883136 -0.0007478933 0.00026538075  0.00340653 -0.00089335203 -1.8899664e-05  
		0.0033311511 -0.00082711742 -0.00028216056  0.0033374894 -0.0005557785 -0.00036740507  
		9.3132255e-12 -1.8626451e-11 0.0011511858  -2.7755575e-19 -1.8626451e-11 
		0.0010240845  -1.8626451e-11 3.7252902e-11 0.0010522649  -3.7252902e-11 0 
		0.0012102497  -1.8626451e-11 9.3132255e-12 0.0011635177  -2.7755575e-19 -1.8626451e-11 
		0.0011175077  4.6566123e-12 -1.8626451e-11 0.0010869077  -4.6566136e-12 -1.8626451e-11 
		0.00096417806  -4.6566136e-12 0 0.0011081069  9.3132255e-12 -1.8626451e-11 
		0.0010156143  -5.551115e-19 0 0.00046857819  1.8626451e-11 1.8626451e-11 
		0.00060938823  -9.3132255e-12 -1.1641532e-12 0.00047070824  -2.7755575e-19 
		3.7252902e-11 0.00051367132  -4.6566128e-12 0 0.00050117052  -5.8207687e-13 
		-3.7252902e-11 0.0004889252  -2.328307e-12 1.8626451e-11 0.00081115327  4.6566123e-12 
		1.8626451e-11 0.00068981783  -1.8626451e-11 0 0.00073943846  -4.6566128e-12 
		1.8626451e-11 0.00088932784  9.3132255e-12 3.7252902e-11 0.00066617003  -9.3132255e-12 
		-3.7252902e-11 0.00058605539  4.6566123e-12 -7.4505804e-11 0.00051252724  
		9.3132255e-12 0 0.00069930323  1.8626451e-11 0 0.00064206583  -3.7252902e-11 
		7.4505804e-11 0.00076464744  9.3132255e-12 3.7252902e-11 0.00092727062  -2.7755575e-19 
		0 0.00076351158  -3.7252902e-11 0 0.00094067084  9.3132255e-12 0 0.0011872543  
		-9.3132255e-12 0 0.0010164781  -3.7252902e-11 9.3132281e-12 0.0010160375  
		-9.3132255e-12 0 0.001249562  4.6566128e-12 9.3132255e-12 0.0011415068  -2.7755575e-19 
		0 0.0011346927  2.328306e-12 -5.820766e-13 0.0009669303  -2.3283068e-12 1.8626451e-11 
		0.001201501  9.3132255e-12 0 0.0010952378  -1.8626451e-11 -1.8626451e-11 
		0.00084602891  -3.1225024e-19 3.7252902e-11 0.00086803653  4.6566128e-12 
		-3.7252902e-11 0.00081806019  -3.7252902e-11 1.8626451e-11 0.00088668091  
		-3.7252902e-11 -1.8626451e-11 0.00068642182  -3.7252902e-11 -1.110223e-18 
		0.0014348425  -2.7755575e-19 -4.6566128e-12 0.001012526  -9.3132255e-12 4.6566128e-12 
		0.00086604402  -4.6566128e-12 0 0.0010031438  -3.7252902e-11 0 0.00099873077  
		-4.6566136e-12 -1.8626451e-11 0.00078578194  9.3132255e-12 1.8626451e-11 
		0.0007795245  -5.551115e-19 -4.6566128e-12 0.00094844756  -5.551115e-19 0 
		0.00080477132  -9.3132255e-12 0 0.00089016318  -9.3132255e-12 9.3132255e-12 
		0.00082639226  1.8626451e-11 0 0.0011470108  -9.3132255e-12 1.8626451e-11 
		0.0010427054  0 0 0.0011905825  -1.8626451e-11 3.7252902e-11 0.0011247772  
		4.6566128e-12 0 0.0011056778  -2.7755575e-19 0 0.0010899472  -2.7755575e-19 
		0 0.00099235796  -7.2759852e-14 -7.4505804e-11 0.0010662168  4.6566123e-12 
		-3.7252902e-11 0.0010245455  -2.7755575e-19 4.6566128e-12 0.0008929497  -3.7252902e-11 
		0 0.00090754195  9.3132255e-12 0 0.0010289468  9.3132255e-12 1.8626451e-11 
		0.00080206984  -4.6566128e-12 3.7252902e-11 0.00099713821  -3.7252902e-11 
		-1.8626451e-11 0.0010519709  4.6566123e-12 -2.3283064e-12 0.00083029567  
		-5.551115e-19 0 0.00083256548  1.164153e-12 1.8626451e-11 0.00096992718  
		1.164153e-12 -1.8626451e-11 0.00074578344  9.3132255e-12 1.8626451e-11 0.00094177085  
		-5.551115e-19 9.3132255e-12 0.00088622066  9.3132255e-12 -9.3132255e-12 0.00063133589  
		-2.7755575e-19 0 0.00057926698  1.8626451e-11 0 0.00071211136  0 0 0.00062645675  
		0 0 0.00014538011  -2.7755575e-19 0 0.000549916  -2.7755575e-19 0 0.00053575763  
		-1.1641535e-12 0 0.00065334374  0 0 0.00012493192  0 0 0.00013609811  -9.3132255e-12 
		-1.8626451e-11 0.00086776039  -3.7252902e-11 1.8626451e-11 0.00089749595  
		9.3132255e-12 1.8626451e-11 0.00083859183  -9.3132255e-12 0 0.00094123004  
		-9.3132255e-12 7.4505804e-11 0.00088779104  0 -3.7252902e-11 0.00099940924  
		1.164153e-12 0 0.00081398268  -4.6566136e-12 -1.8626451e-11 0.00080739486  
		-2.7755575e-19 -7.4505804e-11 0.0008699288  -5.551115e-19 -3.7252902e-11 
		0.00086652464  -5.551115e-19 -7.4505804e-11 0.00082349184  -5.551115e-19 
		-3.7252902e-11 0.00062035839  -5.551115e-19 0 0.00047448211  -5.551115e-19 
		0 0.00047636166  9.3132255e-12 0 0.00025905095  1.8626451e-11 0 -0.00014663023  
		0 -1.8626451e-11 -0.00014972885  -9.3132255e-12 0 -0.0003260407  -9.3132255e-12 
		9.3132255e-12 -0.00040055107  4.6566141e-12 1.8626456e-11 -0.0012062375  
		-5.551115e-19 7.4505804e-11 0.00047790117  -4.6566136e-12 0 0.00046164368  
		-5.551115e-19 7.4505804e-11 0.00025680166  0 3.7252902e-11 -0.00015192933  
		-4.6566128e-12 0 -0.00015426931  0 7.4505804e-11 -0.00033074681  0 0 0.00010090684  
		0 0 7.775944e-05  0 0 1.3329715e-05  0 0 -0.00015994918  0 0 -0.0001598034  
		0 0 -0.00032150681  4.6566141e-12 3.7252902e-11 -0.0012092747  5.551115e-19 
		7.4505804e-11 -0.00088352693  0 0 6.3329936e-10  0 0 -0.00037486543  0 0 
		0.00013011401  0.0001467371 0 0.00014384357  0 0 0.00011787147  0 0 0.00011708442  
		0 0 0.00010876002  0 0 9.8208257e-05  0 0 9.4870709e-05  0 0 6.3888656e-05  
		0 0 5.3770906e-05  0 0 -1.2141528e-05  0 0 -0.00016120434  0 0 -0.00016266273  
		0 0 -0.00030494915  0 0 -0.00036643405  0 0 -0.00036097382  0 0 -0.00038682713  
		0 0 -0.00040764106  0 0 -0.00040104453  0 0 -0.00043311532  0 0 -0.00046748796  
		0 0 -0.00045802668  0.0001467371 -4.440892e-18 -0.00034879442  0 0 0.00010397043  
		0.0001467371 0 0.00011537733  0 0 8.6723652e-05  0 0 9.2496186e-05  0 0 8.5656036e-05  
		0 0 6.9182206e-05  0 0 7.126962e-05  0 0 4.1853775e-05  0 0 2.8490203e-05  
		0 0 -2.812809e-05  0 0 -0.00016409962  0 0 -0.00016748923  0 0 -0.00029736635  
		0 0 -0.00035463637  0 0 -0.00034767375  0 0 -0.00037410937  0 0 -0.00039357186  
		0 0 -0.00038463369  0 0 -0.00041652302  0 0 -0.00044767244  0 0 -0.00043566289  
		0.00014673709 0 -0.00027312236  0 0 6.9213325e-05  -5.6616222e-12 0 8.0608508e-05  
		0 0 5.2206153e-05  0 0 5.9280424e-05  0 0 5.1563275e-05  0 0 3.6689231e-05  
		0 0 4.0492228e-05  0 0 1.4145767e-05  0 0 -1.2676205e-07  0 0 -4.8718935e-05  
		0 0 -0.00017020896  0 0 -0.00017336282  0 0 -0.00028856308  0 0 -0.00033992631  
		0 0 -0.00033264811  0 0 -0.00035801719  0 0 -0.00037485096  0 0 -0.0003660059  
		0 0 -0.00039560013  0 0 -0.00042283273  0 0 -0.00041004605  -1.4309442e-12 
		-4.440892e-18 -0.00029679964  0 0 -0.0009970637  5.2196823e-12 0 -0.00098734896  
		0 -0.0007266223 -0.0031666798  0 0 -0.0010057392  0 0 -0.0010107254  0 -0.00068362505 
		-0.0031521332  0 0 -0.0010226574  0 0 -0.0010469627  0 -0.00056201575 -0.0031678388  
		0 0 -0.0011026504  0 0 -0.0012087852  0 -3.3793378e-05 -0.0031590827  0 0 
		-0.0013122601  0 0 -0.0013582219  0 0.00045235991 -0.003151929  0 0 -0.0013747092  
		0 0 -0.0013901006  0 0.00055565365 -0.0031467793  0 0 -0.0014072289  0 0 
		-0.0014305004  0 0.0006881606 -0.0031525921  2.4548718e-12 -4.440892e-18 
		-0.0012995272  1.929087e-05 -4.5686611e-05 -0.0070358776  7.4816446e-05 -9.5210344e-05 
		-0.0070831226  4.2136289e-05 0.0020400623 -0.0088107549  -2.4174429e-05 -1.8996943e-07 
		-0.0069981371  -4.9819919e-05 2.8228984e-05 -0.0069710948  -0.00010617995 
		0.0021013031 -0.0087471101  -6.3120526e-05 8.5330073e-05 -0.0069234334  -6.9558708e-05 
		0.00020717317 -0.006814891  -0.00014785602 0.0022490155 -0.0085917208  -7.1236704e-05 
		0.00048830739 -0.0065678265  -7.0266768e-05 0.0010133322 -0.0060954071  -0.00014907232 
		0.0029123151 -0.0078830011  -6.7109082e-05 0.0015377854 -0.0056525297  -6.2274339e-05 
		0.0017714214 -0.0054509402  -0.00013275116 0.0035306492 -0.0072386591  -5.5310753e-05 
		0.0018581504 -0.0053773071  -4.5774337e-05 0.001933172 -0.0053099399  -9.8320168e-05 
		0.0036637178 -0.0070978655  -2.4328401e-05 0.0020196808 -0.0052365172  1.835926e-05 
		0.0021323732 -0.0051365215  3.9807837e-05 0.0038250524 -0.0069262371  7.4816438e-05 
		0.0022620254 -0.0050269947  5.5986413e-05 0.0039578979 -0.011764182  0.0002091768 
		0.0039279466 -0.011812733  5.7620895e-05 0.0058679897 -0.013022892  -6.8906098e-05 
		0.0039927317 -0.011728697  -0.00014183798 0.0040119863 -0.011702639  -0.00013616701 
		0.005919226 -0.012961911  -0.00017896369 0.0040534898 -0.011656202  -0.00019648783 
		0.0041394993 -0.011549299  -0.00018876245 0.0060434137 -0.01281101  -0.00020064977 
		0.0043360307 -0.011307044  -0.00019773118 0.0046989936 -0.010847862  -0.00018955259 
		0.0065934835 -0.012129894  -0.00018928212 0.0050667329 -0.010413731  -0.00017706143 
		0.005231014 -0.01021516  -0.00017045972 0.0071080239 -0.011509648  -0.00015885322 
		0.0052929032 -0.010141331  -0.00013247546 0.0053444528 -0.010075212  -0.0001281314 
		0.0072196615 -0.011372578  -7.1009832e-05 0.0054040635 -0.010003683  5.2433672e-05 
		0.0054785297 -0.0099056009  5.3686101e-05 0.0073513119 -0.011209569  0.0002091768 
		0.0055721253 -0.0098023936  5.9387181e-05 0.0077372189 -0.014254685  0.00020559708 
		0.0077066654 -0.014299806  6.1765131e-05 0.0096441964 -0.015511557  -6.132049e-05 
		0.0077691628 -0.01422002  -0.0001310395 0.0077873771 -0.014195382  -0.00012589703 
		0.009676937 -0.015443082  -0.00016582981 0.0078265807 -0.014150623  -0.00018178503 
		0.0079093007 -0.014047522  -0.00017507246 0.0097902426 -0.015293547  -0.00018514227 
		0.0080969194 -0.013816172  -0.00018217297 0.0084412275 -0.013380301  -0.000175056 
		0.010305759 -0.014645113  -0.00017465086 0.0087904688 -0.01296839  -0.00016452227 
		0.0089478903 -0.012778523  -0.00015887857 0.010784311 -0.01404516  -0.00014873729 
		0.0090078721 -0.012706752  -0.00012427008 0.0090571847 -0.01264387  -0.00012065938 
		0.01088716 -0.013910052  -6.5025852e-05 0.0091134068 -0.012576849  5.5071152e-05 
		0.0091843829 -0.012485889  5.7056201e-05 0.011017305 -0.013761607  0.00020559705 
		0.0092701558 -0.012388134  0.00010373433 0.011944998 -0.018801635  0.00035727027 
		0.011963427 -0.018855566  -0.00011034671 0.011928442 -0.01875441  -0.00023117535 
		0.011908068 -0.018720612  -0.00029130396 0.011898721 -0.018664524  -0.00031779747 
		0.011948798 -0.018563621  -0.00032239367 0.012049773 -0.018340811  -0.00031718772 
		0.012199242 -0.01791524  -0.00030528131 0.012355041 -0.017492021  -0.00029071796 
		0.01242319 -0.017296523  -0.00026639595 0.012446004 -0.017220436  -0.000225525 
		0.012462285 -0.017155826  -0.00012070665 0.012493371 -0.017090769  9.4495743e-05 
		0.012553905 -0.01701205  0.00035727027 0.012630398 -0.016930187  0.0020701103 
		-0.00049053098 4.2111296e-05  0.0020768528 -0.00043232448 0.00037901997  
		0.0019827003 -0.00052042468 3.2330368e-05  0.0019992315 -0.00050733663 -0.00028825423  
		0.0020973515 -0.00042230741 5.9405047e-05 ;
	setAttr ".vl[0].vt[842:843]" -type "float3" 0.00099341339 -0.00016406842 
		0.00016009928  0.00076701998 -1.9472236e-05 6.3537649e-05 ;
	setAttr ".vl[0].vt[846:939]" -type "float3" 0.00089889875 -0.00032766591 
		-1.9040108e-05  0.00075282698 -0.00010770259 -0.00012127703  0.00076777185 
		-3.0360794e-05 -9.714123e-05  0.00098203227 -0.00018664383 -0.00018339955  
		0.00078842038 -1.773145e-07 -1.8343466e-05  0.0010816873 -4.4565255e-05 -3.2248913e-06  
		0.0013611382 -0.00028801974 0.00029782628  0.001192878 -0.00043632678 0.00018374092  
		0.0014579323 -0.00050535169 0.00034489713  0.0015989966 -0.00038243915 0.00038199595  
		0.0017208256 -0.00027627035 0.00041669412  0.0014492682 -0.00016463667 0.00023828534  
		0.001160027 -0.0005282358 -4.048496e-05  0.0011594702 -0.0004684203 -0.00023966408  
		0.0013097754 -0.00064904452 -5.2758398e-05  0.0013070196 -0.00034569271 -0.00030235009  
		0.0014150052 -0.0002055759 -0.00019642919  0.0016347825 -0.00036039652 -0.00034936241  
		0.0015065175 -0.00046817132 -0.00037241087  0.0013752069 -0.00057856092 -0.0003987019  
		0.001519913 -0.00015614617 4.1152514e-05  0.0017771769 -0.00023291358 5.7622754e-05  
		0.001861446 -0.00073611923 1.034839e-05  0.0018857253 -0.00066070555 0.00036100522  
		0.0017475613 -0.00078411744 -1.0412612e-05  0.0017840053 -0.00075200357 -0.00034324118  
		0.0019251294 -0.00063218584 2.8068367e-05  0.0015668939 -0.00098051457 -2.6603862e-05  
		0.0015911389 -0.00090685225 0.00032697152  0.0014788472 -0.0010077138 -5.3044838e-05  
		0.0015109777 -0.00097417226 -0.00039374153  0.0016269352 -0.00088116742 -1.5554016e-05  
		0.0018382388 -0.00027484517 0.00042565734  0.0017792014 -0.00032707548 0.00031582188  
		0.0018715255 -0.00030073489 0.0004033549  0.0018721876 -0.00024653052 0.00034096121  
		0.0017266262 -0.00037507783 2.7378528e-05  0.0017184482 -0.00038203408 2.914307e-05  
		0.0017082623 -0.00039377887 -0.00024905178  0.0017697723 -0.00039565281 3.0473571e-05  
		0.0017463932 -0.0003628876 -0.00033504592  0.0018097451 -0.00030803384 -0.00022611846  
		0.0017873694 -0.00038194619 -0.00031293032  0.001858101 -0.00026260011 6.398635e-05  
		0.0018931139 -0.00029008559 6.1109095e-05  0.0019874366 -0.00036325603 0.00044660241  
		0.0019238053 -0.00041708481 0.00033195841  0.0020218838 -0.00033204156 0.00035740086  
		0.0018794421 -0.00047431912 3.0691113e-05  0.0018499139 -0.00048693045 -0.00026357011  
		0.0018942863 -0.00045410459 -0.0003547752  0.001956959 -0.00039640884 -0.00024045432  
		0.0020181506 -0.0003553252 6.501493e-05  0.0016755506 -0.00041644872 0.00037319236  
		0.0016004428 -0.00048202014 0.0002610923  0.0017047517 -0.00045829377 0.00034902926  
		0.0017217888 -0.00037682589 0.00029451682  0.0015430269 -0.00053220766 -1.7230002e-05  
		0.0015318585 -0.00054175913 -1.4942746e-05  0.0015298217 -0.00054450711 -0.00027739993  
		0.001581033 -0.00056930719 -1.2673488e-05  0.001576142 -0.0005060602 -0.00035838375  
		0.0016507406 -0.00044229373 -0.00024927573  0.001612497 -0.00054136792 -0.00033374454  
		0.001708218 -0.00039074357 3.1306416e-05  0.0017390638 -0.00043405927 2.7666934e-05  
		0.0018161722 -0.00056247856 0.00041791462  0.0017200651 -0.00063479162 0.00029093231  
		0.0018676742 -0.00050733268 0.00032721431  0.0016610507 -0.00070974097 -1.77164e-05  
		0.0016359627 -0.00070922391 -0.00030819248  0.0016980342 -0.00066821207 -0.00040149249  
		0.0017826542 -0.00058486947 -0.0002777871  0.0018649953 -0.00053532631 3.3705724e-05  
		0.0014880553 -0.0005795703 0.00032498821  0.0014159487 -0.00064193929 0.00021485641  
		0.0014995195 -0.00063376309 0.00030388442  0.0015345331 -0.00053906324 0.00024745191  
		0.0013669631 -0.0006830669 -5.7929126e-05  0.0013592863 -0.00068880297 -0.00031290043  
		0.0013901845 -0.00073211658 -5.3753647e-05  0.0014009754 -0.00065358693 -0.00039323236  
		0.0014670319 -0.00059769518 -0.00028770129  0.001421022 -0.00069969968 -0.00037147832  
		0.0015211506 -0.00055092387 -1.2709515e-05  0.001533794 -0.00060941122 -1.6267613e-05  
		0.0015548556 -0.00077842019 0.00037742793  0.0014759611 -0.00084079406 0.00025053576  
		0.0016085241 -0.00072609889 0.00028660163  0.0014279037 -0.00090659701 -6.1631108e-05  
		0.0014135046 -0.00089158321 -0.00035349466  0.001460737 -0.0008553479 -0.00044660244  
		0.0015340917 -0.00079006224 -0.00032588857  0.0016023526 -0.0007585978 -1.48581e-05 ;
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode ikSCsolver -n "ikSCsolver";
createNode polyChipOff -n "polyChipOff1";
	setAttr ".ics" -type "componentList" 1 "f[0:884]";
	setAttr ".ix" -type "matrix" 1.5 0 0 0 0 1.5 0 0 0 0 1.5 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".t" -type "double3" 0.038424421600000001 0 0 ;
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".pvt" -type "float3" 0.019212211 -0.019223791 -0.011437221 ;
	setAttr ".rs" 618325851;
	setAttr ".ld" -type "double3" 1 0 0 ;
	setAttr ".g" -type "double3" 0 -1 0 ;
createNode polyTweak -n "polyTweak38";
	setAttr ".uopa" yes;
	setAttr -s 23 ".tk";
	setAttr ".tk[176:177]" -type "float3" -0.035727028 0 0  -0.035727028 
		0 0 ;
	setAttr ".tk[186:187]" -type "float3" -0.035727028 0 0  -0.035727028 
		0 0 ;
	setAttr ".tk[310]" -type "float3" 1.3877788e-17 0 0 ;
	setAttr ".tk[317:318]" -type "float3" 1.3877788e-17 0 0  -0.01534905 
		0 0 ;
	setAttr ".tk[325:326]" -type "float3" -0.015349051 0 0  -0.020559706 
		0 0 ;
	setAttr ".tk[333:334]" -type "float3" -0.020559706 0 0  -0.020559706 
		0 0 ;
	setAttr ".tk[341]" -type "float3" -0.020559704 0 0 ;
	setAttr ".tk[343]" -type "float3" -0.035727028 0 0 ;
	setAttr ".tk[361]" -type "float3" -0.035727028 0 0 ;
	setAttr ".tk[363]" -type "float3" -0.035727028 0 0 ;
	setAttr ".tk[735]" -type "float3" -0.0071236696 0 0 ;
	setAttr ".tk[755]" -type "float3" -0.0071236696 0 0 ;
	setAttr ".tk[757]" -type "float3" -0.020559704 0 0 ;
	setAttr ".tk[777]" -type "float3" -0.020559706 0 0 ;
	setAttr ".tk[779]" -type "float3" -0.020559706 0 0 ;
	setAttr ".tk[799]" -type "float3" -0.020559706 0 0 ;
	setAttr ".tk[801]" -type "float3" -0.035727028 0 0 ;
	setAttr ".tk[814]" -type "float3" -0.035727028 0 0 ;
createNode polyMergeVert -n "polyMergeVert52";
	setAttr ".ics" -type "componentList" 101 "vtx[4:5]" "vtx[7:8]" "vtx[10:11]" "vtx[13]" "vtx[24]" "vtx[28]" "vtx[32]" "vtx[36]" "vtx[40]" "vtx[44]" "vtx[47]" "vtx[59:60]" "vtx[65:66]" "vtx[77]" "vtx[87:89]" "vtx[176:177]" "vtx[186:187]" "vtx[232:233]" "vtx[240:242]" "vtx[247:248]" "vtx[252]" "vtx[255:256]" "vtx[260]" "vtx[263]" "vtx[265]" "vtx[278]" "vtx[285:286]" "vtx[293:294]" "vtx[301:302]" "vtx[309:310]" "vtx[317:318]" "vtx[325:326]" "vtx[333:334]" "vtx[341]" "vtx[343]" "vtx[361]" "vtx[363]" "vtx[369]" "vtx[398]" "vtx[528]" "vtx[550]" "vtx[553]" "vtx[556]" "vtx[567:568]" "vtx[572]" "vtx[581]" "vtx[589]" "vtx[593]" "vtx[603]" "vtx[611]" "vtx[615]" "vtx[647]" "vtx[667]" "vtx[669]" "vtx[689]" "vtx[691]" "vtx[711]" "vtx[713]" "vtx[733]" "vtx[735]" "vtx[755]" "vtx[757]" "vtx[777]" "vtx[779]" "vtx[799]" "vtx[801]" "vtx[814]" "vtx[948:949]" "vtx[956:957]" "vtx[965:966]" "vtx[997:998]" "vtx[1005:1008]" "vtx[1012]" "vtx[1016:1017]" "vtx[1022:1023]" "vtx[1038:1039]" "vtx[1041:1042]" "vtx[1065:1066]" "vtx[1074:1075]" "vtx[1078]" "vtx[1256]" "vtx[1456:1457]" "vtx[1471]" "vtx[1473:1474]" "vtx[1495:1496]" "vtx[1519:1520]" "vtx[1589:1590]" "vtx[1617:1618]" "vtx[1645:1646]" "vtx[1673:1674]" "vtx[1701:1702]" "vtx[1729:1730]" "vtx[1757:1758]" "vtx[1785:1786]" "vtx[1789]" "vtx[1799:1800]" "vtx[1806:1808]" "vtx[1822:1824]" "vtx[1829:1832]" "vtx[1837:1841]" "vtx[1846:1864]";
	setAttr ".ix" -type "matrix" 1.5 0 0 0 0 1.5 0 0 0 0 1.5 0 0 0 0 1;
	setAttr ".d" 1e-06;
createNode polyNormal -n "polyNormal1";
	setAttr ".ics" -type "componentList" 1 "f[885:1769]";
createNode skinCluster -n "skinCluster1";
	setAttr -s 1791 ".wl";
	setAttr -s 5 ".wl[0].w";
	setAttr ".wl[0].w[13:16]" 0.4443175196647644 0.52647548913955688 
		0.029108298942446709 9.5686569693498313e-05;
	setAttr ".wl[0].w[18]" 3.1106517326406902e-06;
	setAttr -s 4 ".wl[1].w";
	setAttr ".wl[1].w[14:15]" 0.35156118869781494 0.64112848043441772;
	setAttr ".wl[1].w[17:18]" 0.0070054028183221817 0.00030495418468490243;
	setAttr -s 4 ".wl[2].w[14:17]"  0.044359494 0.95001924 0.00084532553 
		0.0047760392;
	setAttr -s 4 ".wl[3].w";
	setAttr ".wl[3].w[2]" 0.30953437089920044;
	setAttr ".wl[3].w[13:15]" 0.34295248985290527 0.33985987305641174 
		0.0076532717794179916;
	setAttr -s 5 ".wl[4].w";
	setAttr ".wl[4].w[13:16]" 0.083332881331443787 0.56168431043624878 
		0.35497349500656128 6.5738418015826028e-06;
	setAttr ".wl[4].w[18]" 2.8666947855526814e-06;
	setAttr -s 5 ".wl[5].w";
	setAttr ".wl[5].w[1:3]" 0.18720193207263947 0.39041712880134583 
		0.031729884445667267;
	setAttr ".wl[5].w[8]" 0.00023397464246954769;
	setAttr ".wl[5].w[13]" 0.39041712880134583;
	setAttr -s 5 ".wl[6].w";
	setAttr ".wl[6].w[13:16]" 0.1708238422870636 0.66566586494445801 
		0.163434237241745 3.1280862458515912e-05;
	setAttr ".wl[6].w[18]" 4.480529241845943e-05;
	setAttr -s 5 ".wl[7].w";
	setAttr ".wl[7].w[13:16]" 0.0099748484790325165 0.49439772963523865 
		0.49439772963523865 0.00011532031930983067;
	setAttr ".wl[7].w[18]" 0.0011143226874992251;
	setAttr -s 4 ".wl[8].w[14:17]"  0.4930324 0.50152081 0.0036827724 
		0.0017639679;
	setAttr -s 5 ".wl[9].w[14:18]"  0.0084746005 0.82377893 0.16636378 
		0.001057698 0.00032507841;
	setAttr -s 5 ".wl[10].w[14:18]"  0.42773595 0.53926164 0.00066777988 
		0.029129369 0.003205261;
	setAttr -s 5 ".wl[11].w";
	setAttr ".wl[11].w[13:16]" 0.41721752285957336 0.46570700407028198 
		0.11320232599973679 0.00012633641017600894;
	setAttr ".wl[11].w[18]" 0.003746747737750411;
	setAttr -s 4 ".wl[12].w";
	setAttr ".wl[12].w[13:15]" 0.28914177417755127 0.53192383050918579 
		0.15715523064136505;
	setAttr ".wl[12].w[18]" 0.021779078990221024;
	setAttr -s 5 ".wl[13].w";
	setAttr ".wl[13].w[1:3]" 0.27802795171737671 0.28926378488540649 
		0.080843798816204071;
	setAttr ".wl[13].w[8]" 0.080843925476074219;
	setAttr ".wl[13].w[13]" 0.27102062106132507;
	setAttr -s 5 ".wl[14].w";
	setAttr ".wl[14].w[1:3]" 0.15181370079517365 0.43445399403572083 
		0.022030230611562729;
	setAttr ".wl[14].w[8]" 0.0017533418722450733;
	setAttr ".wl[14].w[13]" 0.38994881510734558;
	setAttr -s 5 ".wl[15].w";
	setAttr ".wl[15].w[13:16]" 0.21768637001514435 0.52827638387680054 
		0.22290866076946259 0.030897773802280426;
	setAttr ".wl[15].w[18]" 0.00023082143161445856;
	setAttr -s 5 ".wl[16].w";
	setAttr ".wl[16].w[13:16]" 0.45391365885734558 0.48768889904022217 
		0.035434700548648834 0.022838354110717773;
	setAttr ".wl[16].w[18]" 0.00012435381358955055;
	setAttr -s 4 ".wl[17].w[13:16]"  0.41903749 0.52456671 0.055634268 
		0.00076158426;
	setAttr -s 5 ".wl[18].w";
	setAttr ".wl[18].w[1:3]" 0.17878508567810059 0.38616970181465149 
		0.048483777791261673;
	setAttr ".wl[18].w[8]" 0.0004109344445168972;
	setAttr ".wl[18].w[13]" 0.38615044951438904;
	setAttr -s 4 ".wl[19].w[13:16]"  0.47943988 0.48551297 0.017197222 
		0.017849958;
	setAttr -s 5 ".wl[20].w";
	setAttr ".wl[20].w[13:16]" 0.17856146395206451 0.5451120138168335 
		0.27007144689559937 0.005163850262761116;
	setAttr ".wl[20].w[18]" 0.001091189100407064;
	setAttr -s 5 ".wl[21].w";
	setAttr ".wl[21].w[13:16]" 0.35096627473831177 0.56537818908691406 
		0.081998132169246674 7.4306553869973868e-05;
	setAttr ".wl[21].w[18]" 0.0015830642078071833;
	setAttr -s 5 ".wl[22].w";
	setAttr ".wl[22].w[2:3]" 0.3115241527557373 0.048949986696243286;
	setAttr ".wl[22].w[13:15]" 0.31433531641960144 0.3098711371421814 
		0.015319387428462505;
	setAttr -s 5 ".wl[23].w";
	setAttr ".wl[23].w[13:16]" 0.11961162090301514 0.63532650470733643 
		0.24504142999649048 4.32952901974204e-06;
	setAttr ".wl[23].w[18]" 1.6095140381366946e-05;
	setAttr -s 5 ".wl[24].w";
	setAttr ".wl[24].w[13:16]" 0.26498064398765564 0.63102847337722778 
		0.10181601345539093 1.5850739146117121e-05;
	setAttr ".wl[24].w[18]" 0.002159021096304059;
	setAttr -s 4 ".wl[25].w";
	setAttr ".wl[25].w[13:15]" 0.066341079771518707 0.62614893913269043 
		0.30731776356697083;
	setAttr ".wl[25].w[18]" 0.00019224629795644432;
	setAttr -s 4 ".wl[26].w";
	setAttr ".wl[26].w[13:15]" 0.052568886429071426 0.66938704252243042 
		0.27794760465621948;
	setAttr ".wl[26].w[18]" 9.6403658972121775e-05;
	setAttr -s 5 ".wl[27].w[14:18]"  0.41792628 0.57399046 7.5263188e-06 
		0.0067288089 0.0013469362;
	setAttr -s 5 ".wl[28].w";
	setAttr ".wl[28].w[13:16]" 0.072957180440425873 0.6136096715927124 
		0.31118938326835632 1.3978019524074625e-06;
	setAttr ".wl[28].w[18]" 0.0022424128837883472;
	setAttr -s 5 ".wl[29].w[14:18]"  0.14819345 0.84986383 5.6678513e-05 
		0.001093811 0.00079230568;
	setAttr -s 5 ".wl[30].w[14:18]"  0.15764642 0.80938834 0.019553063 
		0.013340655 7.1518763e-05;
	setAttr -s 5 ".wl[31].w[14:18]"  0.0083607668 0.98647904 0.0049968986 
		9.8437777e-05 6.4848879e-05;
	setAttr -s 5 ".wl[32].w";
	setAttr ".wl[32].w[13:16]" 0.0001151237593148835 0.49993196129798889 
		0.49993196129798889 1.14495296656969e-05;
	setAttr ".wl[32].w[18]" 9.5217446869355626e-06;
	setAttr -s 5 ".wl[33].w[14:18]"  0.015821351 0.96911544 0.01449258 
		0.00034288087 0.00022778647;
	setAttr -s 5 ".wl[34].w[14:18]"  0.0077301455 0.97044218 0.020739971 
		0.0010083511 7.9355646e-05;
	setAttr -s 5 ".wl[35].w[14:18]"  0.14339861 0.84780836 2.4390545e-05 
		0.0061888117 0.0025798921;
	setAttr -s 5 ".wl[36].w[14:18]"  0.42038387 0.57819521 9.9500048e-06 
		0.0011051141 0.00030592113;
	setAttr -s 4 ".wl[37].w";
	setAttr ".wl[37].w[13:15]" 0.14124996960163116 0.53604346513748169 
		0.31580907106399536;
	setAttr ".wl[37].w[18]" 0.0068974550813436508;
	setAttr -s 5 ".wl[38].w[14:18]"  0.3638933 0.60208827 5.0023318e-06 
		0.027117524 0.0068958793;
	setAttr -s 5 ".wl[39].w";
	setAttr ".wl[39].w[13:16]" 0.25763213634490967 0.58891880512237549 
		0.14379492402076721 2.9384161734924419e-06;
	setAttr ".wl[39].w[18]" 0.0096512166783213615;
	setAttr -s 5 ".wl[40].w";
	setAttr ".wl[40].w[13:16]" 0.13006590306758881 0.67927032709121704 
		0.1906600147485733 7.9988245715867379e-07;
	setAttr ".wl[40].w[18]" 2.9154600724723423e-06;
	setAttr -s 5 ".wl[41].w";
	setAttr ".wl[41].w[13:16]" 0.48026052117347717 0.50357550382614136 
		0.015337510965764523 0.00012113607954233885;
	setAttr ".wl[41].w[18]" 0.00070536747807636857;
	setAttr -s 5 ".wl[42].w";
	setAttr ".wl[42].w[13:16]" 0.47647058963775635 0.49855032563209534 
		0.019374977797269821 0.0040620975196361542;
	setAttr ".wl[42].w[18]" 0.0015420785639435053;
	setAttr -s 4 ".wl[43].w";
	setAttr ".wl[43].w[2]" 0.32229655981063843;
	setAttr ".wl[43].w[13:15]" 0.33756512403488159 0.33145216107368469 
		0.0086861420422792435;
	setAttr -s 4 ".wl[44].w";
	setAttr ".wl[44].w[13:15]" 0.490714430809021 0.49996799230575562 
		0.0090821627527475357;
	setAttr ".wl[44].w[18]" 0.00023537759261671454;
	setAttr -s 5 ".wl[45].w";
	setAttr ".wl[45].w[2:3]" 0.34320938587188721 0.0095385210588574409;
	setAttr ".wl[45].w[13:15]" 0.35498937964439392 0.2904822826385498 
		0.001780430437065661;
	setAttr -s 4 ".wl[46].w";
	setAttr ".wl[46].w[1:3]" 0.24304737150669098 0.38948175311088562 
		0.00038399948971346021;
	setAttr ".wl[46].w[13]" 0.36708682775497437;
	setAttr -s 5 ".wl[47].w";
	setAttr ".wl[47].w[1:3]" 0.24844315648078918 0.37836089730262756 
		1.9423844150878722e-06;
	setAttr ".wl[47].w[8]" 0.00021673667652066797;
	setAttr ".wl[47].w[13]" 0.37297731637954712;
	setAttr -s 5 ".wl[48].w";
	setAttr ".wl[48].w[13:16]" 0.30914750695228577 0.51189941167831421 
		0.17165146768093109 0.0018516788259148598;
	setAttr ".wl[48].w[18]" 0.0054499050602316856;
	setAttr -s 5 ".wl[49].w[14:18]"  0.24397907 0.72738183 1.7199994e-06 
		0.028440095 0.00019729593;
	setAttr -s 5 ".wl[50].w[14:18]"  0.25104761 0.72094363 0.00082757749 
		0.026127039 0.0010541379;
	setAttr -s 5 ".wl[51].w";
	setAttr ".wl[51].w[13:16]" 0.046097766607999802 0.60875469446182251 
		0.34503075480461121 4.8757483455119655e-05;
	setAttr ".wl[51].w[18]" 6.8093424488324672e-05;
	setAttr -s 4 ".wl[52].w[13:16]"  0.26987457 0.51514798 0.21492451 
		5.285913e-05;
	setAttr -s 5 ".wl[53].w";
	setAttr ".wl[53].w[13:16]" 0.2021300196647644 0.51557832956314087 
		0.27378889918327332 0.0076218261383473873;
	setAttr ".wl[53].w[18]" 0.00088093540398404002;
	setAttr -s 5 ".wl[54].w";
	setAttr ".wl[54].w[13:16]" 0.42443609237670898 0.4878692626953125 
		0.086347617208957672 0.00014169653877615929;
	setAttr ".wl[54].w[18]" 0.001205258653499186;
	setAttr -s 5 ".wl[55].w";
	setAttr ".wl[55].w[13:16]" 0.47096201777458191 0.47822269797325134 
		0.040236987173557281 0.01033406425267458;
	setAttr ".wl[55].w[18]" 0.00024426757590845227;
	setAttr -s 5 ".wl[56].w";
	setAttr ".wl[56].w[13:16]" 0.48303771018981934 0.4859776496887207 
		0.019473014399409294 0.011225859634578228;
	setAttr ".wl[56].w[18]" 0.00028579405625350773;
	setAttr -s 4 ".wl[57].w";
	setAttr ".wl[57].w[13:15]" 0.17956553399562836 0.55024421215057373 
		0.27013242244720459;
	setAttr ".wl[57].w[18]" 5.7862678659148514e-05;
	setAttr -s 5 ".wl[58].w";
	setAttr ".wl[58].w[13:16]" 0.35939431190490723 0.51862102746963501 
		0.1219526007771492 7.661793461011257e-06;
	setAttr ".wl[58].w[18]" 2.443086304992903e-05;
	setAttr -s 5 ".wl[59].w";
	setAttr ".wl[59].w[13:16]" 0.11455375701189041 0.51271718740463257 
		0.37250527739524841 1.221145339513896e-06;
	setAttr ".wl[59].w[18]" 0.00022256496595218778;
	setAttr -s 4 ".wl[60].w[13:16]"  0.27957648 0.5230788 0.19734253 
		2.2159666e-06;
	setAttr -s 5 ".wl[61].w[14:18]"  0.48179466 0.48496783 3.0484805e-05 
		0.032522231 0.00068490225;
	setAttr -s 5 ".wl[62].w[14:18]"  0.40290254 0.5795058 4.9221879e-05 
		0.017353704 0.00018868608;
	setAttr -s 5 ".wl[63].w";
	setAttr ".wl[63].w[13:16]" 0.043829664587974548 0.49715608358383179 
		0.45667541027069092 8.3175081044828403e-07;
	setAttr ".wl[63].w[18]" 0.0023380876518785954;
	setAttr -s 4 ".wl[64].w";
	setAttr ".wl[64].w[13:15]" 0.083287157118320465 0.50666242837905884 
		0.40784502029418945;
	setAttr ".wl[64].w[18]" 0.0022054545115679502;
	setAttr -s 4 ".wl[65].w[13:16]"  0.031496048 0.4907957 0.47770581 
		2.5056379e-06;
	setAttr -s 4 ".wl[66].w[13:16]"  0.09244971 0.50821269 0.39933553 
		2.0788482e-06;
	setAttr -s 4 ".wl[67].w[14:17]"  0.16032334 0.76300263 0.052674495 
		0.023999503;
	setAttr -s 4 ".wl[68].w[14:17]"  0.4880307 0.49597695 5.6805016e-05 
		0.015935609;
	setAttr -s 5 ".wl[69].w";
	setAttr ".wl[69].w[13:16]" 0.08780844509601593 0.64006108045578003 
		0.27207261323928833 1.4058147144169197e-06;
	setAttr ".wl[69].w[18]" 5.6385266361758113e-05;
	setAttr -s 5 ".wl[70].w";
	setAttr ".wl[70].w[13:16]" 0.044920433312654495 0.47853690385818481 
		0.47651049494743347 8.3947770690429024e-06;
	setAttr ".wl[70].w[18]" 2.3770202460582368e-05;
	setAttr -s 4 ".wl[71].w";
	setAttr ".wl[71].w[13:15]" 0.046106167137622833 0.64385503530502319 
		0.31003475189208984;
	setAttr ".wl[71].w[18]" 4.1383982534171082e-06;
	setAttr -s 4 ".wl[72].w";
	setAttr ".wl[72].w[13:15]" 0.16798758506774902 0.64329659938812256 
		0.18870438635349274;
	setAttr ".wl[72].w[18]" 1.1424421245465055e-05;
	setAttr -s 5 ".wl[73].w";
	setAttr ".wl[73].w[13:16]" 0.24057465791702271 0.52519762516021729 
		0.23383423686027527 0.00024979756562970579;
	setAttr ".wl[73].w[18]" 0.00014374077727552503;
	setAttr -s 5 ".wl[74].w";
	setAttr ".wl[74].w[13:16]" 0.1553884744644165 0.60851883888244629 
		0.23588715493679047 7.8127968663466163e-06;
	setAttr ".wl[74].w[18]" 0.00019777516718022525;
	setAttr -s 3 ".wl[75].w[13:15]"  0.14511776 0.60384142 0.25104082;
	setAttr -s 4 ".wl[76].w";
	setAttr ".wl[76].w[13:15]" 0.13819259405136108 0.60424810647964478 
		0.2575477659702301;
	setAttr ".wl[76].w[18]" 1.152716049546143e-05;
	setAttr -s 5 ".wl[77].w";
	setAttr ".wl[77].w[1:3]" 0.23101449012756348 0.3825116753578186 
		0.0037739730905741453;
	setAttr ".wl[77].w[8]" 0.00018823814752977341;
	setAttr ".wl[77].w[13]" 0.3825116753578186;
	setAttr -s 5 ".wl[78].w";
	setAttr ".wl[78].w[1:3]" 0.15538063645362854 0.42151844501495361 
		0.0014436069177463651;
	setAttr ".wl[78].w[8]" 0.0001389419921906665;
	setAttr ".wl[78].w[13]" 0.42151844501495361;
	setAttr -s 5 ".wl[79].w";
	setAttr ".wl[79].w[2:3]" 0.32761925458908081 0.02209366112947464;
	setAttr ".wl[79].w[13:15]" 0.33206015825271606 0.30795109272003174 
		0.01027585007250309;
	setAttr -s 5 ".wl[80].w";
	setAttr ".wl[80].w[13:16]" 0.44451066851615906 0.50150251388549805 
		0.039649777114391327 0.014174480922520161;
	setAttr ".wl[80].w[18]" 0.00016263213183265179;
	setAttr -s 5 ".wl[81].w";
	setAttr ".wl[81].w[13:16]" 0.45807185769081116 0.48285079002380371 
		0.058804113417863846 0.00026426909607835114;
	setAttr ".wl[81].w[18]" 8.9187205958296545e-06;
	setAttr -s 5 ".wl[82].w";
	setAttr ".wl[82].w[13:16]" 0.42778792977333069 0.48864221572875977 
		0.081371702253818512 0.0020656643901020288;
	setAttr ".wl[82].w[18]" 0.00013242934073787183;
	setAttr -s 5 ".wl[83].w";
	setAttr ".wl[83].w[1:3]" 0.19917720556259155 0.3764992356300354 
		0.047357548028230667;
	setAttr ".wl[83].w[8]" 0.00046678510261699557;
	setAttr ".wl[83].w[13]" 0.3764992356300354;
	setAttr -s 5 ".wl[84].w";
	setAttr ".wl[84].w[13:16]" 0.44392257928848267 0.47881951928138733 
		0.063724756240844727 0.012973609380424023;
	setAttr ".wl[84].w[18]" 0.00055956462165340781;
	setAttr -s 4 ".wl[85].w";
	setAttr ".wl[85].w[1:2]" 0.21453654766082764 0.3927154541015625;
	setAttr ".wl[85].w[8]" 3.2558880775468424e-05;
	setAttr ".wl[85].w[13]" 0.3927154541015625;
	setAttr -s 5 ".wl[86].w";
	setAttr ".wl[86].w[1:3]" 0.22090265154838562 0.38913485407829285 
		0.00078555068466812372;
	setAttr ".wl[86].w[8]" 4.2054252844536677e-05;
	setAttr ".wl[86].w[13]" 0.38913485407829285;
	setAttr -s 5 ".wl[87].w";
	setAttr ".wl[87].w[1:3]" 0.22919753193855286 0.37957844138145447 
		0.011642414145171642;
	setAttr ".wl[87].w[8]" 3.2467398796143243e-06;
	setAttr ".wl[87].w[13]" 0.37957844138145447;
	setAttr -s 5 ".wl[88].w";
	setAttr ".wl[88].w[1:3]" 0.25990211963653564 0.35805231332778931 
		0.023658517748117447;
	setAttr ".wl[88].w[8]" 0.00034167358535341918;
	setAttr ".wl[88].w[13]" 0.35804542899131775;
	setAttr -s 5 ".wl[89].w";
	setAttr ".wl[89].w[2:3]" 0.31634616851806641 0.0072020338848233223;
	setAttr ".wl[89].w[13:15]" 0.34356659650802612 0.32988157868385315 
		0.003003700403496623;
	setAttr -s 5 ".wl[90].w";
	setAttr ".wl[90].w[13:16]" 0.44087007641792297 0.54780185222625732 
		0.011312535963952541 1.5227947187668178e-06;
	setAttr ".wl[90].w[18]" 1.4027868928678799e-05;
	setAttr -s 5 ".wl[91].w";
	setAttr ".wl[91].w[13:16]" 0.37901803851127625 0.59967696666717529 
		0.021251803264021873 2.7443273211247288e-05;
	setAttr ".wl[91].w[18]" 2.5871651814668439e-05;
	setAttr -s 5 ".wl[92].w";
	setAttr ".wl[92].w[13:16]" 0.36356633901596069 0.58761608600616455 
		0.046938616782426834 0.0017132832435891032;
	setAttr ".wl[92].w[18]" 0.00016568969294894487;
	setAttr -s 5 ".wl[93].w";
	setAttr ".wl[93].w[13:16]" 0.27861973643302917 0.64691704511642456 
		0.074053823947906494 0.00010043429938377813;
	setAttr ".wl[93].w[18]" 0.0003089816018473357;
	setAttr -s 5 ".wl[94].w";
	setAttr ".wl[94].w[13:16]" 0.33824688196182251 0.52528482675552368 
		0.13646529614925385 4.9141402058694439e-08;
	setAttr ".wl[94].w[18]" 2.9417979021673091e-06;
	setAttr -s 5 ".wl[95].w";
	setAttr ".wl[95].w[13:16]" 0.32409438490867615 0.58996254205703735 
		0.085674494504928589 2.8188316719024442e-05;
	setAttr ".wl[95].w[18]" 0.00024037554976530373;
	setAttr -s 5 ".wl[96].w";
	setAttr ".wl[96].w[13:16]" 0.30739229917526245 0.52815920114517212 
		0.16394242644309998 7.1252384259423707e-06;
	setAttr ".wl[96].w[18]" 0.0004989063018001616;
	setAttr -s 5 ".wl[97].w";
	setAttr ".wl[97].w[13:16]" 0.30113017559051514 0.60786324739456177 
		0.090344041585922241 1.5519291991950013e-05;
	setAttr ".wl[97].w[18]" 0.00064713286701589823;
	setAttr -s 5 ".wl[98].w";
	setAttr ".wl[98].w[13:16]" 0.33116564154624939 0.57614821195602417 
		0.091980189085006714 6.6146603785455227e-05;
	setAttr ".wl[98].w[18]" 0.00063983938889577985;
	setAttr -s 5 ".wl[99].w";
	setAttr ".wl[99].w[13:16]" 0.36868610978126526 0.54991137981414795 
		0.076957046985626221 0.0029287596698850393;
	setAttr ".wl[99].w[18]" 0.0015166536904871464;
	setAttr -s 5 ".wl[100].w";
	setAttr ".wl[100].w[13:16]" 0.3556273877620697 0.52695339918136597 
		0.1174011155962944 5.5769496611901559e-06;
	setAttr ".wl[100].w[18]" 1.2488599168136716e-05;
	setAttr -s 5 ".wl[101].w";
	setAttr ".wl[101].w[13:16]" 0.34039098024368286 0.53208327293395996 
		0.12751062214374542 4.8175261326832697e-06;
	setAttr ".wl[101].w[18]" 1.0292451406712644e-05;
	setAttr -s 4 ".wl[102].w";
	setAttr ".wl[102].w[13:15]" 0.37799316644668579 0.54231798648834229 
		0.07805352658033371;
	setAttr ".wl[102].w[18]" 0.0016353852115571499;
	setAttr -s 5 ".wl[103].w";
	setAttr ".wl[103].w[13:16]" 0.36700525879859924 0.4942564070224762 
		0.068711645901203156 0.040708795189857483;
	setAttr ".wl[103].w[18]" 0.029317881911993027;
	setAttr -s 5 ".wl[104].w";
	setAttr ".wl[104].w[13:16]" 0.40072974562644958 0.51162683963775635 
		0.087536253035068512 2.2206009816727601e-05;
	setAttr ".wl[104].w[18]" 8.5024847066961229e-05;
	setAttr -s 5 ".wl[105].w";
	setAttr ".wl[105].w[13:16]" 0.38507130742073059 0.51851308345794678 
		0.096341885626316071 9.2251053729341947e-07;
	setAttr ".wl[105].w[18]" 7.275079406099394e-05;
	setAttr -s 5 ".wl[106].w";
	setAttr ".wl[106].w[13:16]" 0.38102474808692932 0.53845226764678955 
		0.079060479998588562 6.9380553213704843e-06;
	setAttr ".wl[106].w[18]" 0.0014556309906765819;
	setAttr -s 5 ".wl[107].w";
	setAttr ".wl[107].w[13:16]" 0.39420148730278015 0.52701640129089355 
		0.074285499751567841 0.0020801657810807228;
	setAttr ".wl[107].w[18]" 0.0024164086207747459;
	setAttr -s 5 ".wl[108].w";
	setAttr ".wl[108].w[13:16]" 0.40337905287742615 0.51352930068969727 
		0.082712069153785706 2.2495987650472671e-06;
	setAttr ".wl[108].w[18]" 0.00037727906601503491;
	setAttr -s 5 ".wl[109].w";
	setAttr ".wl[109].w[13:16]" 0.38877680897712708 0.52051651477813721 
		0.090460620820522308 6.6146144490630832e-06;
	setAttr ".wl[109].w[18]" 0.00023948070884216577;
	setAttr -s 5 ".wl[110].w";
	setAttr ".wl[110].w[13:16]" 0.38203567266464233 0.53422027826309204 
		0.082006044685840607 2.2510697817779146e-05;
	setAttr ".wl[110].w[18]" 0.0017154529923573136;
	setAttr -s 5 ".wl[111].w";
	setAttr ".wl[111].w[13:16]" 0.38779577612876892 0.53033703565597534 
		0.080032117664813995 6.1296086641959846e-06;
	setAttr ".wl[111].w[18]" 0.0018290027510374784;
	setAttr -s 5 ".wl[112].w";
	setAttr ".wl[112].w[13:16]" 0.39173796772956848 0.52465671300888062 
		0.083467543125152588 8.164284736267291e-06;
	setAttr ".wl[112].w[18]" 0.00012962812616024166;
	setAttr -s 5 ".wl[113].w";
	setAttr ".wl[113].w[13:16]" 0.38573956489562988 0.52751266956329346 
		0.086647436022758484 1.4693814875954558e-07;
	setAttr ".wl[113].w[18]" 0.00010023904906120151;
	setAttr -s 5 ".wl[114].w";
	setAttr ".wl[114].w[13:16]" 0.27556195855140686 0.60942679643630981 
		0.11493583768606186 4.2584483139762597e-07;
	setAttr ".wl[114].w[18]" 7.5003910751547664e-05;
	setAttr -s 5 ".wl[115].w";
	setAttr ".wl[115].w[13:16]" 0.29787424206733704 0.595062255859375 
		0.10612594336271286 2.1971500245854259e-05;
	setAttr ".wl[115].w[18]" 0.000915622862521559;
	setAttr -s 4 ".wl[116].w";
	setAttr ".wl[116].w[13:15]" 0.30252373218536377 0.54040384292602539 
		0.15664893388748169;
	setAttr ".wl[116].w[18]" 0.00042354298057034612;
	setAttr -s 4 ".wl[117].w";
	setAttr ".wl[117].w[13:15]" 0.28348684310913086 0.53730738162994385 
		0.17918483912944794;
	setAttr ".wl[117].w[18]" 2.0938219677191228e-05;
	setAttr -s 5 ".wl[118].w";
	setAttr ".wl[118].w[13:16]" 0.37074518203735352 0.54132950305938721 
		0.08694072812795639 8.1266480265185237e-05;
	setAttr ".wl[118].w[18]" 0.00090332550462335348;
	setAttr -s 5 ".wl[119].w";
	setAttr ".wl[119].w[13:16]" 0.37134826183319092 0.53992557525634766 
		0.087856732308864594 1.0029667464550585e-05;
	setAttr ".wl[119].w[18]" 0.00085943395970389247;
	setAttr -s 5 ".wl[120].w";
	setAttr ".wl[120].w[13:16]" 0.36505696177482605 0.51650768518447876 
		0.11799275875091553 1.3985271607452887e-06;
	setAttr ".wl[120].w[18]" 0.00044134238851256669;
	setAttr -s 5 ".wl[121].w";
	setAttr ".wl[121].w[13:16]" 0.36238858103752136 0.51324796676635742 
		0.12421244382858276 4.3857571654370986e-06;
	setAttr ".wl[121].w[18]" 0.00014664999616798013;
	setAttr -s 4 ".wl[122].w";
	setAttr ".wl[122].w[13:15]" 0.46436506509780884 0.50976890325546265 
		0.025854382663965225;
	setAttr ".wl[122].w[18]" 1.1623806130955927e-05;
	setAttr -s 4 ".wl[123].w";
	setAttr ".wl[123].w[13:15]" 0.47052493691444397 0.47476768493652344 
		0.054706703871488571;
	setAttr ".wl[123].w[18]" 7.3151085189238074e-07;
	setAttr -s 5 ".wl[124].w";
	setAttr ".wl[124].w[2:3]" 0.30799540877342224 0.056700829416513443;
	setAttr ".wl[124].w[13:15]" 0.31008008122444153 0.30729585886001587 
		0.01792784221470356;
	setAttr -s 5 ".wl[125].w";
	setAttr ".wl[125].w[13:16]" 0.47076937556266785 0.49950671195983887 
		0.029607392847537994 0.00010992072930093855;
	setAttr ".wl[125].w[18]" 6.5998410718748346e-06;
	setAttr -s 5 ".wl[126].w";
	setAttr ".wl[126].w[1:3]" 0.18334168195724487 0.35608270764350891 
		0.098215721547603607;
	setAttr ".wl[126].w[8]" 0.0062771379016339779;
	setAttr ".wl[126].w[13]" 0.35608270764350891;
	setAttr -s 3 ".wl[127].w[13:15]"  0.47417933 0.4774563 0.048364438;
	setAttr -s 5 ".wl[128].w";
	setAttr ".wl[128].w[13:16]" 0.42454630136489868 0.536415696144104 
		0.03875274583697319 0.00027688461705110967;
	setAttr ".wl[128].w[18]" 8.4685170804732479e-06;
	setAttr -s 4 ".wl[129].w";
	setAttr ".wl[129].w[13:15]" 0.40813368558883667 0.5521203875541687 
		0.039731595665216446;
	setAttr ".wl[129].w[18]" 1.4324787116493098e-05;
	setAttr -s 5 ".wl[130].w";
	setAttr ".wl[130].w[13:16]" 0.43258950114250183 0.5062330961227417 
		0.060793031007051468 0.00034698221134021878;
	setAttr ".wl[130].w[18]" 3.7412301026051864e-05;
	setAttr -s 4 ".wl[131].w[13:16]"  0.41877207 0.5171138 0.06383726 
		0.00027692321;
	setAttr -s 5 ".wl[132].w[14:18]"  0.0014133122 0.7760843 0.22234316 
		0.00010981901 4.9404029e-05;
	setAttr -s 5 ".wl[133].w[14:18]"  0.0004691495 0.99280703 0.0067066806 
		9.159593e-06 7.9914362e-06;
	setAttr -s 5 ".wl[134].w[14:18]"  0.0013210066 0.89010006 0.10844211 
		0.0001114499 2.5433643e-05;
	setAttr -s 5 ".wl[135].w[14:18]"  0.0017040905 0.94521111 0.053013507 
		4.6547928e-05 2.4775773e-05;
	setAttr -s 5 ".wl[136].w[14:18]"  1.6682934e-05 0.0067222738 
		0.99325413 4.9644495e-06 1.9125011e-06;
	setAttr -s 5 ".wl[137].w[14:18]"  0.0010629892 0.26362559 0.73493856 
		0.00025060042 0.00012238551;
	setAttr -s 5 ".wl[138].w[14:18]"  0.00014278629 0.063927762 
		0.93586397 4.6934259e-05 1.8549224e-05;
	setAttr -s 5 ".wl[139].w[14:18]"  0.00093487592 0.26658899 
		0.73210031 0.00025157962 0.00012422448;
	setAttr -s 5 ".wl[140].w[14:18]"  3.7125894e-05 0.00048822802 
		0.99890095 0.00056616962 7.5173762e-06;
	setAttr -s 5 ".wl[141].w[14:18]"  0.0011912502 0.011915014 
		0.95329839 0.033318069 0.00027719236;
	setAttr -s 5 ".wl[142].w[14:18]"  0.00015484187 0.0022411535 
		0.99512237 0.0024460442 3.5614896e-05;
	setAttr -s 5 ".wl[143].w[14:18]"  0.0010259756 0.011709824 
		0.95493799 0.032054804 0.00027138434;
	setAttr -s 5 ".wl[144].w[14:18]"  0.00058207393 0.0024372605 
		0.60156536 0.39526212 0.00015313018;
	setAttr -s 5 ".wl[145].w[14:18]"  0.00091878884 0.0033416329 
		0.49771115 0.49771115 0.00031725672;
	setAttr -s 5 ".wl[146].w[14:18]"  0.002032948 0.0088865338 
		0.58595866 0.40254506 0.00057685626;
	setAttr -s 5 ".wl[147].w[14:18]"  0.00027468716 0.0011804472 
		0.49922109 0.49922109 0.00010270636;
	setAttr -s 5 ".wl[148].w[14:18]"  0.00074942922 0.002666543 
		0.49816534 0.49816534 0.00025332251;
	setAttr -s 5 ".wl[149].w[14:18]"  0.00034606142 0.0014430281 
		0.49904257 0.49904257 0.00012573185;
	setAttr -s 5 ".wl[150].w[14:18]"  0.00037416804 0.0014176618 
		0.49904719 0.49904719 0.00011385691;
	setAttr -s 5 ".wl[151].w[14:18]"  0.00084105786 0.0035145469 
		0.50048965 0.49488136 0.00027333456;
	setAttr -s 5 ".wl[152].w[14:18]"  0.00059578975 0.0020807355 
		0.49855724 0.49855724 0.00020899026;
	setAttr -s 5 ".wl[153].w[14:18]"  0.001171311 0.0039170641 
		0.49724212 0.49724212 0.0004274114;
	setAttr -s 5 ".wl[154].w[14:18]"  0.00022869874 0.000902217 
		0.4993923 0.4993923 8.4495347e-05;
	setAttr -s 5 ".wl[155].w[14:18]"  0.00041478834 0.0015846726 
		0.49892008 0.49892008 0.00016040853;
	setAttr -s 5 ".wl[156].w[14:18]"  0.0012348931 0.0037891287 
		0.49725699 0.49725699 0.00046204787;
	setAttr -s 5 ".wl[157].w[14:18]"  0.0018654886 0.005603035 
		0.4959043 0.4959043 0.00072287029;
	setAttr -s 5 ".wl[158].w[14:18]"  0.00073966244 0.0024430701 
		0.49826634 0.49826634 0.00028466774;
	setAttr -s 5 ".wl[159].w[14:18]"  0.0010390496 0.0033928719 
		0.497576 0.497576 0.00041602869;
	setAttr -s 5 ".wl[160].w[14:18]"  0.00017388747 0.00064201845 
		0.49956462 0.49956462 5.4868524e-05;
	setAttr -s 5 ".wl[161].w[14:18]"  0.000322921 0.0011579018 
		0.4992049 0.4992049 0.0001093796;
	setAttr -s 5 ".wl[162].w[14:18]"  0.0003054734 0.0012131264 
		0.49919057 0.49919057 0.00010026858;
	setAttr -s 5 ".wl[163].w[14:18]"  0.00017045421 0.00067776488 
		0.49954572 0.49954572 6.030978e-05;
	setAttr -s 5 ".wl[164].w[14:18]"  0.00085366721 0.0025368992 
		0.49816516 0.49816516 0.00027916097;
	setAttr -s 5 ".wl[165].w[14:18]"  0.00099020824 0.002977818 
		0.49784112 0.49784112 0.00034974096;
	setAttr -s 5 ".wl[166].w[14:18]"  0.0011391584 0.0034609735 
		0.49751285 0.49751285 0.00037414522;
	setAttr -s 5 ".wl[167].w[14:18]"  0.00078273419 0.0024773299 
		0.4982301 0.4982301 0.0002797601;
	setAttr -s 5 ".wl[168].w[14:18]"  0.0007086448 0.0025445526 
		0.50960255 0.48695347 0.00019083075;
	setAttr -s 5 ".wl[169].w[14:18]"  0.00024380202 0.00090086251 
		0.49939159 0.49939159 7.2176299e-05;
	setAttr -s 5 ".wl[170].w[14:18]"  0.0021525444 0.007855041 
		0.5156635 0.47372219 0.000606724;
	setAttr -s 5 ".wl[171].w[14:18]"  0.00070924964 0.0027538689 
		0.49887288 0.49744558 0.00021842889;
	setAttr -s 5 ".wl[172].w[14:18]"  0.0034887246 0.0088835228 
		0.49336091 0.49336091 0.00090589974;
	setAttr -s 5 ".wl[173].w[14:18]"  0.0016817518 0.0046600583 
		0.49658749 0.49658749 0.00048325423;
	setAttr -s 5 ".wl[174].w[14:18]"  0.0066364785 0.01633295 0.48765111 
		0.48765111 0.001728333;
	setAttr -s 5 ".wl[175].w[14:18]"  0.0029719076 0.0081785442 
		0.49399638 0.49399638 0.00085675204;
	setAttr -s 5 ".wl[176].w[20:24]"  6.1590486e-05 0.0001496061 
		0.0014115665 0.4991886 0.4991886;
	setAttr -s 5 ".wl[177].w[20:24]"  6.5612425e-05 0.00015954503 
		0.0014895962 0.49914259 0.49914259;
	setAttr -s 5 ".wl[178].w[20:24]"  5.0184924e-05 0.00012355269 
		0.0012095424 0.49930835 0.49930835;
	setAttr -s 5 ".wl[179].w[20:24]"  7.1207316e-05 0.00017372449 
		0.0016262104 0.49906445 0.49906445;
	setAttr -s 5 ".wl[180].w[20:24]"  5.162456e-05 0.00012891165 
		0.0012623217 0.49927858 0.49927858;
	setAttr -s 5 ".wl[181].w[20:24]"  7.1842391e-05 0.00017704724 
		0.0016581304 0.49904653 0.49904653;
	setAttr -s 5 ".wl[182].w[20:24]"  3.9733761e-05 0.00010052891 
		0.0010170334 0.49942136 0.49942136;
	setAttr -s 5 ".wl[183].w[20:24]"  5.1082563e-05 0.00012804421 
		0.0012527178 0.49928412 0.49928412;
	setAttr -s 5 ".wl[184].w[20:24]"  4.0619991e-05 0.00010093638 
		0.0010163949 0.49942103 0.49942103;
	setAttr -s 5 ".wl[185].w[20:24]"  5.1495692e-05 0.00012729528 
		0.0012451246 0.49928802 0.49928802;
	setAttr -s 5 ".wl[186].w[20:24]"  6.8413246e-05 0.00016833775 
		0.0015662247 0.49909854 0.49909854;
	setAttr -s 5 ".wl[187].w[20:24]"  6.4323482e-05 0.00015948461 
		0.001500185 0.499138 0.499138;
	setAttr -s 5 ".wl[188].w";
	setAttr ".wl[188].w[2:5]" 0.88014000654220581 0.061630450189113617 
		0.047190096229314804 0.0038593315985053778;
	setAttr ".wl[188].w[8]" 0.0071800905279815197;
	setAttr -s 5 ".wl[189].w";
	setAttr ".wl[189].w[2:5]" 0.59478074312210083 0.38204780220985413 
		0.020631527528166771 0.001114643644541502;
	setAttr ".wl[189].w[8]" 0.0014253227273002267;
	setAttr -s 5 ".wl[190].w";
	setAttr ".wl[190].w[2:5]" 0.5546613335609436 0.41564777493476868 
		0.026715686544775963 0.0012119560269638896;
	setAttr ".wl[190].w[8]" 0.0017632566159591079;
	setAttr -s 5 ".wl[191].w";
	setAttr ".wl[191].w[1:3]" 0.14116154611110687 0.77375030517578125 
		0.0033295017201453447;
	setAttr ".wl[191].w[8]" 0.012640164233744144;
	setAttr ".wl[191].w[13]" 0.069118507206439972;
	setAttr -s 5 ".wl[192].w";
	setAttr ".wl[192].w[2:5]" 0.55046796798706055 0.40849068760871887 
		0.036739587783813477 0.0020819802302867174;
	setAttr ".wl[192].w[8]" 0.0022198488004505634;
	setAttr -s 5 ".wl[193].w";
	setAttr ".wl[193].w[2:5]" 0.49683639407157898 0.45352059602737427 
		0.045420929789543152 0.0019980897195637226;
	setAttr ".wl[193].w[8]" 0.0022239640820771456;
	setAttr -s 5 ".wl[194].w";
	setAttr ".wl[194].w[2:5]" 0.021906744688749313 0.74583929777145386 
		0.22972790896892548 0.0022686216980218887;
	setAttr ".wl[194].w[8]" 0.0002573252422735095;
	setAttr -s 5 ".wl[195].w";
	setAttr ".wl[195].w[2:5]" 0.015725068747997284 0.76219499111175537 
		0.22045351564884186 0.0014338715700432658;
	setAttr ".wl[195].w[8]" 0.00019248787430115044;
	setAttr -s 5 ".wl[196].w";
	setAttr ".wl[196].w[2:5]" 0.033732298761606216 0.68017750978469849 
		0.28171062469482422 0.0039408565498888493;
	setAttr ".wl[196].w[8]" 0.00043866917258128524;
	setAttr -s 5 ".wl[197].w";
	setAttr ".wl[197].w[2:5]" 0.022617371752858162 0.70760446786880493 
		0.26722034811973572 0.0022622926626354456;
	setAttr ".wl[197].w[8]" 0.00029537815134972334;
	setAttr -s 5 ".wl[198].w[3:7]"  0.32778099 0.65296704 0.019069118 
		9.1177753e-05 9.1669928e-05;
	setAttr -s 5 ".wl[199].w[3:7]"  0.39401868 0.59752542 0.0083554564 
		5.0442941e-05 4.9906099e-05;
	setAttr -s 5 ".wl[200].w[3:7]"  0.34221587 0.63283139 0.024699472 
		0.00011895077 0.00013433842;
	setAttr -s 5 ".wl[201].w[3:7]"  0.39776096 0.59265894 0.0094624991 
		5.5613753e-05 6.2001709e-05;
	setAttr -s 5 ".wl[202].w[3:7]"  0.014685122 0.76011008 0.22500154 
		0.00010120831 0.00010208102;
	setAttr -s 5 ".wl[203].w[3:7]"  0.012269836 0.8796584 0.10796054 
		5.5891891e-05 5.5312201e-05;
	setAttr -s 5 ".wl[204].w[3:7]"  0.021708868 0.70729917 0.2706511 
		0.00015807271 0.00018280774;
	setAttr -s 5 ".wl[205].w[3:7]"  0.018200116 0.83831239 0.14330485 
		8.5330728e-05 9.7283817e-05;
	setAttr -s 5 ".wl[206].w[3:7]"  0.0015620608 0.27275389 0.72536582 
		0.00015987527 0.00015842005;
	setAttr -s 5 ".wl[207].w[3:7]"  0.0011350471 0.22579643 0.77287847 
		9.6723888e-05 9.3353498e-05;
	setAttr -s 5 ".wl[208].w[3:7]"  0.0023187348 0.26150262 0.73566645 
		0.00023085519 0.00028125205;
	setAttr -s 5 ".wl[209].w[3:7]"  0.0019999021 0.24522257 0.75241518 
		0.00016501136 0.00019731151;
	setAttr -s 5 ".wl[210].w[3:7]"  0.0028032281 0.032177165 
		0.45759374 0.50177884 0.0056470321;
	setAttr -s 5 ".wl[211].w[3:7]"  0.0032133735 0.035164278 
		0.68653983 0.26975602 0.0053264466;
	setAttr -s 5 ".wl[212].w[3:7]"  0.0029759589 0.030030267 
		0.48270372 0.00077903742 0.483511;
	setAttr -s 5 ".wl[213].w[3:7]"  0.0034173725 0.031526197 
		0.50630891 0.00037951791 0.458368;
	setAttr -s 5 ".wl[214].w[3:7]"  0.0015718413 0.019674674 
		0.66464955 0.0032191107 0.3108848;
	setAttr -s 5 ".wl[215].w[3:7]"  0.0024349263 0.027767185 
		0.92431414 0.037264813 0.0082189841;
	setAttr -s 5 ".wl[216].w[3:7]"  0.00014473638 0.0012318401 
		0.026664302 0.97132558 0.00063354755;
	setAttr ".wl[217].w[6]"  1;
	setAttr -s 5 ".wl[218].w[3:7]"  0.0004965532 0.0053349398 
		0.36885288 0.62528771 2.7902452e-05;
	setAttr -s 5 ".wl[219].w[3:7]"  0.00037974634 0.0037583783 
		0.41539317 0.5781908 0.0022778744;
	setAttr ".wl[220].w[6]"  1;
	setAttr ".wl[221].w[6]"  1;
	setAttr ".wl[222].w[6]"  1;
	setAttr ".wl[223].w[6]"  1;
	setAttr -s 5 ".wl[224].w[3:7]"  0.0004543227 0.0046568052 
		0.36910862 3.4848024e-05 0.62574542;
	setAttr -s 5 ".wl[225].w[3:7]"  0.0005931129 0.0055528502 
		0.41133168 0.0017415418 0.5807808;
	setAttr -s 5 ".wl[226].w[3:7]"  0.0018654796 0.014508202 
		0.40953827 0.0039152475 0.57017285;
	setAttr -s 5 ".wl[227].w[3:7]"  0.0026644822 0.018010875 
		0.36866289 0.0015288582 0.60913289;
	setAttr ".wl[228].w[7]"  1;
	setAttr ".wl[229].w[7]"  1;
	setAttr ".wl[230].w[7]"  1;
	setAttr -s 5 ".wl[231].w[3:7]"  7.5118835e-05 0.00030576158 
		0.21683982 3.5562356e-05 0.78274375;
	setAttr -s 4 ".wl[232].w[0:3]"  0.074233033 0.63352865 0.2922301 
		8.2813585e-06;
	setAttr -s 5 ".wl[233].w";
	setAttr ".wl[233].w[0:3]" 0.043164703994989395 0.57470744848251343 
		0.3820665180683136 5.9446203522384167e-05;
	setAttr ".wl[233].w[8]" 1.8183729935117299e-06;
	setAttr -s 5 ".wl[234].w";
	setAttr ".wl[234].w[1:3]" 0.4278070330619812 0.47565290331840515 
		2.2948584955884144e-05;
	setAttr ".wl[234].w[8]" 2.5736037059687078e-05;
	setAttr ".wl[234].w[13]" 0.096491366624832153;
	setAttr -s 5 ".wl[235].w";
	setAttr ".wl[235].w[2:5]" 0.90457326173782349 0.0093701770529150963 
		0.068733304738998413 0.0062874872237443924;
	setAttr ".wl[235].w[8]" 0.011035787872970104;
	setAttr -s 5 ".wl[236].w";
	setAttr ".wl[236].w[1:3]" 0.18897822499275208 0.5790092945098877 
		0.0073852003552019596;
	setAttr ".wl[236].w[8]" 0.00039489186019636691;
	setAttr ".wl[236].w[13]" 0.22423242032527924;
	setAttr -s 5 ".wl[237].w";
	setAttr ".wl[237].w[1:3]" 0.35242545604705811 0.48533880710601807 
		8.3330662164371461e-05;
	setAttr ".wl[237].w[8]" 0.00039528546039946377;
	setAttr ".wl[237].w[13]" 0.16175715625286102;
	setAttr -s 5 ".wl[238].w";
	setAttr ".wl[238].w[1:3]" 0.1469443142414093 0.74268382787704468 
		0.0030928291380405426;
	setAttr ".wl[238].w[8]" 0.023587519302964211;
	setAttr ".wl[238].w[13]" 0.083691529929637909;
	setAttr -s 5 ".wl[239].w";
	setAttr ".wl[239].w[1:3]" 0.10348513722419739 0.78577107191085815 
		0.008966514840722084;
	setAttr ".wl[239].w[8]" 0.010040471330285072;
	setAttr ".wl[239].w[13]" 0.091736793518066406;
	setAttr -s 5 ".wl[240].w";
	setAttr ".wl[240].w[1:3]" 0.29547768831253052 0.35444575548171997 
		0.011966660618782043;
	setAttr ".wl[240].w[8]" 5.5118554882938042e-05;
	setAttr ".wl[240].w[13]" 0.33805477619171143;
	setAttr -s 5 ".wl[241].w";
	setAttr ".wl[241].w[0:3]" 0.079480327665805817 0.49522995948791504 
		0.42520639300346375 7.563533290522173e-05;
	setAttr ".wl[241].w[8]" 7.6909545896342024e-06;
	setAttr -s 5 ".wl[242].w";
	setAttr ".wl[242].w[0:3]" 0.3366008996963501 0.57932311296463013 
		0.065199397504329681 0.0027496747206896544;
	setAttr ".wl[242].w[8]" 0.016126871109008789;
	setAttr -s 5 ".wl[243].w";
	setAttr ".wl[243].w[0:2]" 0.33784645795822144 0.43488496541976929 
		0.13272927701473236;
	setAttr ".wl[243].w[4]" 0.050490982830524445;
	setAttr ".wl[243].w[8]" 0.044048335403203964;
	setAttr -s 5 ".wl[244].w";
	setAttr ".wl[244].w[0:3]" 0.32159340381622314 0.3791462779045105 
		0.26850450038909912 0.00019154477922711521;
	setAttr ".wl[244].w[8]" 0.03056425042450428;
	setAttr -s 4 ".wl[245].w[0:3]"  0.11199259 0.5168277 0.37107161 
		0.00010813063;
	setAttr -s 4 ".wl[246].w[0:3]"  0.14462957 0.42786303 0.42746434 
		4.3042772e-05;
	setAttr -s 5 ".wl[247].w";
	setAttr ".wl[247].w[0:3]" 0.14883720874786377 0.50929826498031616 
		0.34183686971664429 2.4864793886081316e-05;
	setAttr ".wl[247].w[8]" 2.8727954486384988e-06;
	setAttr -s 5 ".wl[248].w";
	setAttr ".wl[248].w[0:3]" 0.37608626484870911 0.50337189435958862 
		0.12026076018810272 3.8534337363671511e-05;
	setAttr ".wl[248].w[8]" 0.00024245609529316425;
	setAttr -s 5 ".wl[249].w";
	setAttr ".wl[249].w[0:3]" 0.31547984480857849 0.4414122998714447 
		0.22889378666877747 1.2568241800181568e-05;
	setAttr ".wl[249].w[8]" 0.01420152559876442;
	setAttr -s 5 ".wl[250].w";
	setAttr ".wl[250].w[1:3]" 0.22695890069007874 0.65036541223526001 
		0.00084040663205087185;
	setAttr ".wl[250].w[8]" 0.037865839898586273;
	setAttr ".wl[250].w[13]" 0.083969399333000183;
	setAttr -s 5 ".wl[251].w";
	setAttr ".wl[251].w[1:3]" 0.40195661783218384 0.44918140769004822 
		5.4911597544560209e-05;
	setAttr ".wl[251].w[8]" 0.061035290360450745;
	setAttr ".wl[251].w[13]" 0.08777172863483429;
	setAttr -s 5 ".wl[252].w";
	setAttr ".wl[252].w[0:2]" 0.57097947597503662 0.37266230583190918 
		0.013878326863050461;
	setAttr ".wl[252].w[20:21]" 0.041397932916879654 0.0010820040479302406;
	setAttr -s 5 ".wl[253].w";
	setAttr ".wl[253].w[0:2]" 0.56806778907775879 0.31977465748786926 
		0.023147908970713615;
	setAttr ".wl[253].w[20:21]" 0.086725935339927673 0.0022837005089968443;
	setAttr -s 5 ".wl[254].w";
	setAttr ".wl[254].w[0:2]" 0.51191747188568115 0.33896973729133606 
		0.044080503284931183;
	setAttr ".wl[254].w[20:21]" 0.10171947628259659 0.0033127570059150457;
	setAttr -s 4 ".wl[255].w";
	setAttr ".wl[255].w[0:2]" 0.41962447762489319 0.47751748561859131 
		0.10234426707029343;
	setAttr ".wl[255].w[8]" 0.00051378243369981647;
	setAttr -s 5 ".wl[256].w";
	setAttr ".wl[256].w[0:2]" 0.49029719829559326 0.36541232466697693 
		0.036888886243104935;
	setAttr ".wl[256].w[20:21]" 0.10349392145872116 0.0039076535031199455;
	setAttr -s 5 ".wl[257].w";
	setAttr ".wl[257].w[0:2]" 0.4545741081237793 0.35508719086647034 
		0.060641337186098099;
	setAttr ".wl[257].w[20:21]" 0.12410549819469452 0.0055918255820870399;
	setAttr -s 5 ".wl[258].w";
	setAttr ".wl[258].w[0:3]" 0.37910467386245728 0.39340043067932129 
		0.18639518320560455 3.5591063351603225e-05;
	setAttr ".wl[258].w[8]" 0.041064109653234482;
	setAttr -s 5 ".wl[259].w";
	setAttr ".wl[259].w[0:2]" 0.42714670300483704 0.36303159594535828 
		0.090721875429153442;
	setAttr ".wl[259].w[20:21]" 0.1133909747004509 0.0057087661698460579;
	setAttr -s 5 ".wl[260].w";
	setAttr ".wl[260].w[0:2]" 0.60770630836486816 0.030535168945789337 
		0.0023254051338881254;
	setAttr ".wl[260].w[20:21]" 0.35698387026786804 0.0024492691736668348;
	setAttr -s 5 ".wl[261].w";
	setAttr ".wl[261].w[0:2]" 0.58711129426956177 0.039891716092824936 
		0.0036979420110583305;
	setAttr ".wl[261].w[20:21]" 0.36604535579681396 0.0032536487560719252;
	setAttr -s 5 ".wl[262].w";
	setAttr ".wl[262].w[0:2]" 0.54459220170974731 0.053649481385946274 
		0.0063093863427639008;
	setAttr ".wl[262].w[20:21]" 0.3902132511138916 0.0052355825901031494;
	setAttr -s 5 ".wl[263].w";
	setAttr ".wl[263].w[0:2]" 0.5207369327545166 0.32153040170669556 
		0.028614837676286697;
	setAttr ".wl[263].w[20:21]" 0.12503963708877563 0.0040782219730317593;
	setAttr -s 5 ".wl[264].w";
	setAttr ".wl[264].w[0:2]" 0.53605937957763672 0.26188153028488159 
		0.028820004314184189;
	setAttr ".wl[264].w[20:21]" 0.16829094290733337 0.0049481512978672981;
	setAttr -s 5 ".wl[265].w";
	setAttr ".wl[265].w[0:2]" 0.54836767911911011 0.087028577923774719 
		0.0084511470049619675;
	setAttr ".wl[265].w[20:21]" 0.34972703456878662 0.0064255045726895332;
	setAttr -s 5 ".wl[266].w";
	setAttr ".wl[266].w[0:2]" 0.52311760187149048 0.11223407834768295 
		0.014231116510927677;
	setAttr ".wl[266].w[20:21]" 0.34210896492004395 0.0083081861957907677;
	setAttr -s 5 ".wl[267].w";
	setAttr ".wl[267].w[0:2]" 0.51091277599334717 0.2456333339214325 
		0.036391060799360275;
	setAttr ".wl[267].w[20:21]" 0.20053958892822266 0.0065231393091380596;
	setAttr -s 5 ".wl[268].w";
	setAttr ".wl[268].w[0:2]" 0.50616121292114258 0.12066303193569183 
		0.018046418204903603;
	setAttr ".wl[268].w[20:21]" 0.345481276512146 0.0096481004729866982;
	setAttr -s 5 ".wl[269].w";
	setAttr ".wl[269].w[0:3]" 0.32488164305686951 0.38212502002716064 
		0.26698595285415649 0.0047167190350592136;
	setAttr ".wl[269].w[8]" 0.021290648728609085;
	setAttr -s 5 ".wl[270].w";
	setAttr ".wl[270].w[0:3]" 0.34766882658004761 0.42229646444320679 
		0.21274006366729736 0.00032436317997053266;
	setAttr ".wl[270].w[8]" 0.016970289871096611;
	setAttr -s 5 ".wl[271].w";
	setAttr ".wl[271].w[0:3]" 0.33850616216659546 0.44168347120285034 
		0.19746646285057068 0.00015650074055884033;
	setAttr ".wl[271].w[8]" 0.02218741737306118;
	setAttr -s 5 ".wl[272].w";
	setAttr ".wl[272].w[0:2]" 0.54313379526138306 0.34012418985366821 
		0.034251086413860321;
	setAttr ".wl[272].w[20:21]" 0.080206453800201416 0.0022845847997814417;
	setAttr -s 5 ".wl[273].w";
	setAttr ".wl[273].w[0:2]" 0.55192780494689941 0.36968964338302612 
		0.023547042161226273;
	setAttr ".wl[273].w[20:21]" 0.053353194147348404 0.0014822899829596281;
	setAttr -s 5 ".wl[274].w";
	setAttr ".wl[274].w[0:2]" 0.57755464315414429 0.04314674437046051 
		0.0044133425690233707;
	setAttr ".wl[274].w[20:21]" 0.37148311734199524 0.0034021679311990738;
	setAttr -s 5 ".wl[275].w";
	setAttr ".wl[275].w[0:2]" 0.60020828247070312 0.045664113014936447 
		0.0037282933481037617;
	setAttr ".wl[275].w[20:21]" 0.34763669967651367 0.0027625972870737314;
	setAttr -s 5 ".wl[276].w";
	setAttr ".wl[276].w[0:2]" 0.51565510034561157 0.4083952009677887 
		0.024679040536284447;
	setAttr ".wl[276].w[20:21]" 0.049660272896289825 0.0016104275127872825;
	setAttr -s 5 ".wl[277].w";
	setAttr ".wl[277].w[0:2]" 0.57689744234085083 0.12844748795032501 
		0.0094952825456857681;
	setAttr ".wl[277].w[20:21]" 0.28029489517211914 0.0048649138770997524;
	setAttr -s 5 ".wl[278].w";
	setAttr ".wl[278].w[0:1]" 0.49763917922973633 0.0027588263619691133;
	setAttr ".wl[278].w[20:22]" 0.49859833717346191 0.00082816468784585595 
		0.00017548208415973932;
	setAttr -s 5 ".wl[279].w";
	setAttr ".wl[279].w[0:1]" 0.44026169180870056 0.0035252217203378677;
	setAttr ".wl[279].w[20:22]" 0.55374592542648315 0.0020647600758820772 
		0.00040232558967545629;
	setAttr -s 5 ".wl[280].w";
	setAttr ".wl[280].w[0:1]" 0.45977193117141724 0.0072185522876679897;
	setAttr ".wl[280].w[20:22]" 0.52804124355316162 0.0041232267394661903 
		0.00084508873987942934;
	setAttr -s 5 ".wl[281].w";
	setAttr ".wl[281].w[0:1]" 0.45847168564796448 0.0064622405916452408;
	setAttr ".wl[281].w[20:22]" 0.53072810173034668 0.0035715289413928986 
		0.00076640030601993203;
	setAttr -s 5 ".wl[282].w";
	setAttr ".wl[282].w[0:1]" 0.45521426200866699 0.0063274935819208622;
	setAttr ".wl[282].w[20:22]" 0.53429245948791504 0.0033381227403879166 
		0.00082766998093575239;
	setAttr -s 5 ".wl[283].w";
	setAttr ".wl[283].w[0:1]" 0.48617449402809143 0.0065636541694402695;
	setAttr ".wl[283].w[20:22]" 0.5042993426322937 0.0023332610726356506 
		0.00062920484924688935;
	setAttr -s 5 ".wl[284].w";
	setAttr ".wl[284].w[0:2]" 0.53680253028869629 0.019409630447626114 
		0.0014117180835455656;
	setAttr ".wl[284].w[20:21]" 0.44023615121841431 0.0021400456316769123;
	setAttr -s 5 ".wl[285].w";
	setAttr ".wl[285].w[0:1]" 0.47559440135955811 0.0045560616999864578;
	setAttr ".wl[285].w[20:22]" 0.51759892702102661 0.0017633227398619056 
		0.00048722641076892614;
	setAttr -s 5 ".wl[286].w";
	setAttr ".wl[286].w[0:1]" 0.030064923688769341 0.00077510054688900709;
	setAttr ".wl[286].w[20:22]" 0.95920324325561523 0.0091214394196867943 
		0.00083537370664998889;
	setAttr -s 5 ".wl[287].w";
	setAttr ".wl[287].w[0:1]" 0.036682531237602234 0.001055452972650528;
	setAttr ".wl[287].w[20:22]" 0.94757992029190063 0.013435555621981621 
		0.0012465547770261765;
	setAttr -s 5 ".wl[288].w";
	setAttr ".wl[288].w[0:1]" 0.065962657332420349 0.0023003930691629648;
	setAttr ".wl[288].w[20:22]" 0.90080738067626953 0.028079977259039879 
		0.0028496473096311092;
	setAttr -s 5 ".wl[289].w";
	setAttr ".wl[289].w[0:1]" 0.058643266558647156 0.0020200356375426054;
	setAttr ".wl[289].w[20:22]" 0.91110610961914062 0.025492517277598381 
		0.0027380080427974463;
	setAttr -s 5 ".wl[290].w";
	setAttr ".wl[290].w[0:1]" 0.053037304431200027 0.0018728930735960603;
	setAttr ".wl[290].w[20:22]" 0.91750568151473999 0.024328703060746193 
		0.003255512798205018;
	setAttr -s 5 ".wl[291].w";
	setAttr ".wl[291].w[0:1]" 0.044877808541059494 0.0015676902839913964;
	setAttr ".wl[291].w[20:22]" 0.92894256114959717 0.021588684991002083 
		0.0030232609715312719;
	setAttr -s 5 ".wl[292].w";
	setAttr ".wl[292].w[0:1]" 0.034039542078971863 0.0011312449350953102;
	setAttr ".wl[292].w[20:22]" 0.94620233774185181 0.016320962458848953 
		0.0023059144150465727;
	setAttr -s 5 ".wl[293].w";
	setAttr ".wl[293].w[0:1]" 0.02831137552857399 0.0010204936843365431;
	setAttr ".wl[293].w[20:22]" 0.94989985227584839 0.018219996243715286 
		0.0025483001954853535;
	setAttr -s 5 ".wl[294].w";
	setAttr ".wl[294].w[0:1]" 0.0024201241321861744 0.00017867180577013642;
	setAttr ".wl[294].w[20:22]" 0.91109335422515869 0.084668509662151337 
		0.0016393233090639114;
	setAttr -s 5 ".wl[295].w";
	setAttr ".wl[295].w[0:1]" 0.0034190705046057701 0.00025417149299755692;
	setAttr ".wl[295].w[20:22]" 0.89198827743530273 0.10202637314796448 
		0.002312046941369772;
	setAttr -s 5 ".wl[296].w";
	setAttr ".wl[296].w[0:1]" 0.0054533258080482483 0.00041941893869079649;
	setAttr ".wl[296].w[20:22]" 0.84960097074508667 0.14065723121166229 
		0.0038689787033945322;
	setAttr -s 5 ".wl[297].w";
	setAttr ".wl[297].w[0:1]" 0.0038505892734974623 0.00029185530729591846;
	setAttr ".wl[297].w[20:22]" 0.87919414043426514 0.11354420334100723 
		0.0031192437745630741;
	setAttr -s 5 ".wl[298].w";
	setAttr ".wl[298].w[0:1]" 0.0037985735107213259 0.00029392435681074858;
	setAttr ".wl[298].w[20:22]" 0.87583965063095093 0.11533487588167191 
		0.004732995294034481;
	setAttr -s 5 ".wl[299].w";
	setAttr ".wl[299].w[0:1]" 0.0042958958074450493 0.00033772579627111554;
	setAttr ".wl[299].w[20:22]" 0.86199837923049927 0.12715117633342743 
		0.0062168934382498264;
	setAttr -s 5 ".wl[300].w";
	setAttr ".wl[300].w[0:1]" 0.0038636866956949234 0.00030283129308372736;
	setAttr ".wl[300].w[20:22]" 0.87056189775466919 0.11919664591550827 
		0.006074950098991394;
	setAttr -s 5 ".wl[301].w";
	setAttr ".wl[301].w[0:1]" 0.0037050724495202303 0.00029139505932107568;
	setAttr ".wl[301].w[20:22]" 0.87173730134963989 0.11788185685873032 
		0.0063843969255685806;
	setAttr -s 5 ".wl[302].w";
	setAttr ".wl[302].w[0:1]" 0.00023430146393366158 2.9184813683968969e-05;
	setAttr ".wl[302].w[20:22]" 0.4990275502204895 0.4990275502204895 
		0.0016814426053315401;
	setAttr -s 5 ".wl[303].w";
	setAttr ".wl[303].w[0:1]" 0.00042637006845325232 5.4516873206011951e-05;
	setAttr ".wl[303].w[20:22]" 0.49807623028755188 0.49807623028755188 
		0.0033666074741631746;
	setAttr -s 5 ".wl[304].w";
	setAttr ".wl[304].w[0:1]" 0.0011685132049024105 0.00015346841246355325;
	setAttr ".wl[304].w[20:22]" 0.494852215051651 0.494852215051651 
		0.0089735360816121101;
	setAttr -s 5 ".wl[305].w";
	setAttr ".wl[305].w[0:1]" 0.0011144243180751801 0.00014673981058876961;
	setAttr ".wl[305].w[20:22]" 0.49404975771903992 0.49404975771903992 
		0.010639352723956108;
	setAttr -s 5 ".wl[306].w";
	setAttr ".wl[306].w[0]" 0.00090242520673200488;
	setAttr ".wl[306].w[20:23]" 0.43131816387176514 0.54922127723693848 
		0.017851710319519043 0.00070639769546687603;
	setAttr -s 5 ".wl[307].w";
	setAttr ".wl[307].w[0]" 0.00061961181927472353;
	setAttr ".wl[307].w[20:23]" 0.35705351829528809 0.6250460147857666 
		0.01671113632619381 0.00056970037985593081;
	setAttr -s 5 ".wl[308].w";
	setAttr ".wl[308].w[0]" 0.00027048823540098965;
	setAttr ".wl[308].w[20:23]" 0.25283646583557129 0.73723185062408447 
		0.0093889934942126274 0.00027220437186770141;
	setAttr -s 5 ".wl[309].w";
	setAttr ".wl[309].w[0]" 0.00014197090058587492;
	setAttr ".wl[309].w[20:23]" 0.17687393724918365 0.8175007700920105 
		0.0053374790586531162 0.00014595435641240329;
	setAttr -s 5 ".wl[310].w";
	setAttr ".wl[310].w[0]" 4.9859423597808927e-05;
	setAttr ".wl[310].w[20:23]" 0.0036953978706151247 0.54720014333724976 
		0.44860973954200745 0.0004449488187674433;
	setAttr -s 5 ".wl[311].w";
	setAttr ".wl[311].w[0]" 7.5684729381464422e-05;
	setAttr ".wl[311].w[20:23]" 0.0050510023720562458 0.52062851190567017 
		0.47352686524391174 0.00071799685247242451;
	setAttr -s 5 ".wl[312].w";
	setAttr ".wl[312].w[0]" 0.00011834570614155382;
	setAttr ".wl[312].w[20:23]" 0.0073978542350232601 0.51269441843032837 
		0.47865468263626099 0.0011346567189320922;
	setAttr -s 5 ".wl[313].w";
	setAttr ".wl[313].w[0]" 7.5400275818537921e-05;
	setAttr ".wl[313].w[20:23]" 0.0044558020308613777 0.51000350713729858 
		0.48463907837867737 0.00082616228610277176;
	setAttr -s 5 ".wl[314].w[20:24]"  0.002840067 0.47778273 0.51834333 
		0.00097548077 5.8522488e-05;
	setAttr -s 5 ".wl[315].w[20:24]"  0.0028888478 0.42242533 0.57338333 
		0.0012339195 6.8576468e-05;
	setAttr -s 5 ".wl[316].w[20:24]"  0.0019594289 0.3600949 0.63695991 
		0.00093658909 4.9150771e-05;
	setAttr -s 5 ".wl[317].w[20:24]"  0.0017084952 0.29698652 0.70039403 
		0.00086744339 4.346278e-05;
	setAttr -s 5 ".wl[318].w[20:24]"  0.00011147367 0.001605639 
		0.9550609 0.043073986 0.00014800498;
	setAttr -s 5 ".wl[319].w[20:24]"  0.00021181125 0.002966315 
		0.92873448 0.067811504 0.00027589098;
	setAttr -s 5 ".wl[320].w[20:24]"  0.00030091286 0.0041188812 
		0.90988594 0.085307293 0.00038702827;
	setAttr -s 5 ".wl[321].w[20:24]"  0.00020342154 0.0027602408 
		0.93811172 0.058677513 0.00024704088;
	setAttr -s 5 ".wl[322].w[20:24]"  0.00017736816 0.0022351299 
		0.95655799 0.040845398 0.00018407355;
	setAttr -s 5 ".wl[323].w[20:24]"  0.00022741842 0.0027636471 
		0.95084417 0.04594025 0.00022454375;
	setAttr -s 5 ".wl[324].w[20:24]"  0.00018807537 0.0022711281 
		0.95945996 0.037899878 0.00018090107;
	setAttr -s 5 ".wl[325].w[20:24]"  0.00012950196 0.0015464256 
		0.97178084 0.026422855 0.00012031973;
	setAttr -s 5 ".wl[326].w[20:24]"  6.2511785e-06 2.9648847e-05 
		0.0064457939 0.9930861 0.00043229997;
	setAttr -s 5 ".wl[327].w[20:24]"  2.2274342e-05 0.00010488854 
		0.020206483 0.97820276 0.0014635933;
	setAttr -s 5 ".wl[328].w[20:24]"  3.6418867e-05 0.00017035316 
		0.030331127 0.96712279 0.0023392534;
	setAttr -s 5 ".wl[329].w[20:24]"  2.7548902e-05 0.00012700273 
		0.023257343 0.97483009 0.0017580347;
	setAttr -s 5 ".wl[330].w[20:24]"  3.5719208e-05 0.0001573664 
		0.026532281 0.97111952 0.0021551605;
	setAttr -s 5 ".wl[331].w[20:24]"  4.8038455e-05 0.00020825258 
		0.03296994 0.9639526 0.0028211419;
	setAttr -s 5 ".wl[332].w[20:24]"  4.2190604e-05 0.00018182331 
		0.029256973 0.96804458 0.0024743835;
	setAttr -s 5 ".wl[333].w[20:24]"  2.7957953e-05 0.00011935063 
		0.019960653 0.9782185 0.0016736009;
	setAttr -s 5 ".wl[334].w[20:24]"  3.8864946e-06 1.3411271e-05 
		0.00044027195 0.98925185 0.010290702;
	setAttr -s 5 ".wl[335].w[20:24]"  1.204102e-05 4.1197971e-05 
		0.0012956323 0.96974736 0.028903732;
	setAttr -s 5 ".wl[336].w[20:24]"  1.8704688e-05 6.3797415e-05 
		0.0019808537 0.95738876 0.040547956;
	setAttr -s 5 ".wl[337].w[20:24]"  1.3416108e-05 4.5239136e-05 
		0.0014063909 0.96749681 0.031038076;
	setAttr -s 5 ".wl[338].w[20:24]"  1.4106162e-05 4.6085512e-05 
		0.0014002193 0.96688223 0.031657271;
	setAttr -s 5 ".wl[339].w[20:24]"  1.8359216e-05 5.9331585e-05 
		0.0017751615 0.95930076 0.038846418;
	setAttr -s 5 ".wl[340].w[20:24]"  1.5276399e-05 4.9156755e-05 
		0.0014753549 0.96505845 0.033401784;
	setAttr -s 5 ".wl[341].w[20:24]"  8.4633057e-06 2.7088874e-05 
		0.00082388776 0.9789483 0.020192262;
	setAttr -s 5 ".wl[342].w[20:24]"  6.7918932e-05 0.00016527237 
		0.0015519437 0.49910739 0.49910739;
	setAttr -s 5 ".wl[343].w[20:24]"  6.3363972e-05 0.00015399989 
		0.0014455478 0.49916855 0.49916855;
	setAttr -s 5 ".wl[344].w[20:24]"  4.8840717e-05 0.0001200448 
		0.0011732173 0.49932894 0.49932894;
	setAttr -s 5 ".wl[345].w[20:24]"  6.9411668e-05 0.00016913962 
		0.0015906519 0.49908537 0.49908537;
	setAttr -s 5 ".wl[346].w[20:24]"  6.9785317e-05 0.00017005905 
		0.0015888271 0.49908566 0.49908566;
	setAttr -s 5 ".wl[347].w[20:24]"  7.0688329e-05 0.00017506852 
		0.0016511603 0.49905154 0.49905154;
	setAttr -s 5 ".wl[348].w[20:24]"  7.112258e-05 0.00017551778 
		0.0016509701 0.49905124 0.49905124;
	setAttr -s 5 ".wl[349].w[20:24]"  5.1491243e-05 0.00012902093 
		0.0012663666 0.49927658 0.49927658;
	setAttr -s 5 ".wl[350].w[20:24]"  5.1245392e-05 0.00012855827 
		0.0012615933 0.49927932 0.49927932;
	setAttr -s 5 ".wl[351].w[20:24]"  7.1218346e-05 0.00017617311 
		0.0016550601 0.49904874 0.49904874;
	setAttr -s 5 ".wl[352].w[20:24]"  6.9892376e-05 0.00017050173 
		0.0016058988 0.49907681 0.49907681;
	setAttr -s 5 ".wl[353].w[20:24]"  5.1202318e-05 0.00012617373 
		0.0012355287 0.49929354 0.49929354;
	setAttr -s 5 ".wl[354].w[20:24]"  5.1846921e-05 0.00012788693 
		0.0012511852 0.49928457 0.49928457;
	setAttr -s 5 ".wl[355].w[20:24]"  7.0531176e-05 0.00017234746 
		0.0016200537 0.49906853 0.49906853;
	setAttr -s 5 ".wl[356].w[20:24]"  7.0432463e-05 0.00017289838 
		0.0016249951 0.49906585 0.49906585;
	setAttr -s 5 ".wl[357].w[20:24]"  5.0960924e-05 0.0001265981 
		0.0012390297 0.49929169 0.49929169;
	setAttr -s 5 ".wl[358].w[20:24]"  7.1349124e-05 0.00017488429 
		0.0016358665 0.49905896 0.49905896;
	setAttr -s 5 ".wl[359].w[20:24]"  7.0230679e-05 0.00017195752 
		0.0016041665 0.49907684 0.49907684;
	setAttr -s 5 ".wl[360].w[20:24]"  7.1040682e-05 0.0001748668 
		0.0016323716 0.49906087 0.49906087;
	setAttr -s 5 ".wl[361].w[20:24]"  6.5226348e-05 0.00015958352 
		0.0014888579 0.49914318 0.49914318;
	setAttr -s 5 ".wl[362].w[20:24]"  7.0422298e-05 0.00017403034 
		0.001629706 0.49906293 0.49906293;
	setAttr -s 5 ".wl[363].w[20:24]"  6.6144974e-05 0.00016337987 
		0.0015285881 0.49912095 0.49912095;
	setAttr -s 5 ".wl[364].w[20:24]"  4.9774975e-05 0.00012470168 
		0.0012174187 0.49930409 0.49930409;
	setAttr -s 5 ".wl[365].w";
	setAttr ".wl[365].w[0:3]" 0.4857117235660553 0.49865522980690002 
		0.015252153389155865 3.900575393345207e-05;
	setAttr ".wl[365].w[8]" 0.00034188700374215841;
	setAttr -s 5 ".wl[366].w";
	setAttr ".wl[366].w[2:3]" 0.31016650795936584 0.018129667267203331;
	setAttr ".wl[366].w[13:15]" 0.3325938880443573 0.3303295373916626 
		0.0087803797796368599;
	setAttr -s 5 ".wl[367].w";
	setAttr ".wl[367].w[0:3]" 0.48138457536697388 0.4996204674243927 
		0.018807899206876755 3.2446969271404669e-05;
	setAttr ".wl[367].w[8]" 0.00015460417489521205;
	setAttr -s 5 ".wl[368].w";
	setAttr ".wl[368].w[0:2]" 0.53543436527252197 0.019860882312059402 
		0.0013611689209938049;
	setAttr ".wl[368].w[20:21]" 0.44116535782814026 0.0021782449912279844;
	setAttr -s 5 ".wl[369].w";
	setAttr ".wl[369].w[0:3]" 0.46327626705169678 0.46599456667900085 
		0.061450056731700897 0.0087486542761325836;
	setAttr ".wl[369].w[8]" 0.00053054932504892349;
	setAttr -s 5 ".wl[370].w";
	setAttr ".wl[370].w[1:3]" 0.10171613097190857 0.75688183307647705 
		0.01318128127604723;
	setAttr ".wl[370].w[8]" 0.0057258862070739269;
	setAttr ".wl[370].w[13]" 0.1224948838353157;
	setAttr -s 5 ".wl[371].w";
	setAttr ".wl[371].w[1:3]" 0.16376136243343353 0.40960344672203064 
		0.032395899295806885;
	setAttr ".wl[371].w[8]" 0.00092677836073562503;
	setAttr ".wl[371].w[13]" 0.39331254363059998;
	setAttr -s 4 ".wl[372].w";
	setAttr ".wl[372].w[1:2]" 0.12543939054012299 0.71953779458999634;
	setAttr ".wl[372].w[8]" 0.0047391252592206001;
	setAttr ".wl[372].w[13]" 0.15028364956378937;
	setAttr -s 5 ".wl[373].w";
	setAttr ".wl[373].w[2:5]" 0.83367913961410522 0.12625180184841156 
		0.033582743257284164 0.0023946897126734257;
	setAttr ".wl[373].w[8]" 0.0040916805155575275;
	setAttr -s 5 ".wl[374].w";
	setAttr ".wl[374].w[1:3]" 0.065005674958229065 0.85064917802810669 
		0.004513877909630537;
	setAttr ".wl[374].w[8]" 0.0039252336136996746;
	setAttr ".wl[374].w[13]" 0.075906127691268921;
	setAttr -s 5 ".wl[375].w";
	setAttr ".wl[375].w[1:3]" 0.20068079233169556 0.62701600790023804 
		1.7122756617027335e-06;
	setAttr ".wl[375].w[8]" 0.030977670103311539;
	setAttr ".wl[375].w[13]" 0.14132377505302429;
	setAttr -s 5 ".wl[376].w";
	setAttr ".wl[376].w[1:3]" 0.21652065217494965 0.52934235334396362 
		0.015519757755100727;
	setAttr ".wl[376].w[8]" 9.3325485067907721e-05;
	setAttr ".wl[376].w[13]" 0.2385239452123642;
	setAttr -s 5 ".wl[377].w";
	setAttr ".wl[377].w[1:3]" 0.28320208191871643 0.50440770387649536 
		7.7342454460449517e-05;
	setAttr ".wl[377].w[8]" 0.01830194890499115;
	setAttr ".wl[377].w[13]" 0.19401100277900696;
	setAttr -s 5 ".wl[378].w";
	setAttr ".wl[378].w[1:3]" 0.24854390323162079 0.61728888750076294 
		4.5890815272287e-06;
	setAttr ".wl[378].w[8]" 0.011572232469916344;
	setAttr ".wl[378].w[13]" 0.12259040772914886;
	setAttr -s 5 ".wl[379].w";
	setAttr ".wl[379].w[1:3]" 0.11101788282394409 0.7883419394493103 
		0.0032097287476062775;
	setAttr ".wl[379].w[8]" 0.01628778874874115;
	setAttr ".wl[379].w[13]" 0.081142671406269073;
	setAttr -s 5 ".wl[380].w";
	setAttr ".wl[380].w[1:3]" 0.14924854040145874 0.69717502593994141 
		0.0034127365797758102;
	setAttr ".wl[380].w[8]" 0.0030287143308669329;
	setAttr ".wl[380].w[13]" 0.14713504910469055;
	setAttr -s 5 ".wl[381].w";
	setAttr ".wl[381].w[0:3]" 0.43887588381767273 0.45452865958213806 
		0.074710972607135773 0.0065406565554440022;
	setAttr ".wl[381].w[8]" 0.025343878194689751;
	setAttr -s 4 ".wl[382].w";
	setAttr ".wl[382].w[2]" 0.31577488780021667;
	setAttr ".wl[382].w[13:15]" 0.3403564989566803 0.33577823638916016 
		0.0080904494971036911;
	setAttr -s 4 ".wl[383].w";
	setAttr ".wl[383].w[1:2]" 0.19983817636966705 0.68944239616394043;
	setAttr ".wl[383].w[8]" 0.014281686395406723;
	setAttr ".wl[383].w[13]" 0.096437782049179077;
	setAttr -s 5 ".wl[384].w";
	setAttr ".wl[384].w[1:3]" 0.36611366271972656 0.54492050409317017 
		0.00095629604766145349;
	setAttr ".wl[384].w[8]" 0.026653433218598366;
	setAttr ".wl[384].w[13]" 0.061356104910373688;
	setAttr -s 5 ".wl[385].w";
	setAttr ".wl[385].w[0:2]" 0.46403789520263672 0.46403789520263672 
		0.048864144831895828;
	setAttr ".wl[385].w[20:21]" 0.022034922614693642 0.0010251785861328244;
	setAttr -s 5 ".wl[386].w";
	setAttr ".wl[386].w[0:2]" 0.59648400545120239 0.30553993582725525 
		0.014921139925718307;
	setAttr ".wl[386].w[20:21]" 0.081122457981109619 0.0019324215827509761;
	setAttr -s 5 ".wl[387].w";
	setAttr ".wl[387].w[0:2]" 0.57922118902206421 0.1074170395731926 
		0.007689865306019783;
	setAttr ".wl[387].w[20:21]" 0.30106496810913086 0.0046069272793829441;
	setAttr -s 5 ".wl[388].w";
	setAttr ".wl[388].w[0:2]" 0.5364258885383606 0.022742768749594688 
		0.0017675352282822132;
	setAttr ".wl[388].w[20:21]" 0.43660834431648254 0.0024554338306188583;
	setAttr -s 5 ".wl[389].w";
	setAttr ".wl[389].w[1:3]" 0.15020039677619934 0.66087925434112549 
		0.0024212857242673635;
	setAttr ".wl[389].w[8]" 0.0078100366517901421;
	setAttr ".wl[389].w[13]" 0.17868900299072266;
	setAttr -s 5 ".wl[390].w";
	setAttr ".wl[390].w[2:3]" 0.32736045122146606 0.0057092215865850449;
	setAttr ".wl[390].w[13:15]" 0.35073098540306091 0.31396239995956421 
		0.0022370053920894861;
	setAttr -s 5 ".wl[391].w";
	setAttr ".wl[391].w[1:3]" 0.10020119696855545 0.77752667665481567 
		0.00084796996088698506;
	setAttr ".wl[391].w[8]" 0.0049966732040047646;
	setAttr ".wl[391].w[13]" 0.11642748117446899;
	setAttr -s 5 ".wl[392].w";
	setAttr ".wl[392].w[2:5]" 0.85417413711547852 0.1131003275513649 
		0.027915021404623985 0.001528487540781498;
	setAttr ".wl[392].w[8]" 0.0032820191700011492;
	setAttr -s 4 ".wl[393].w";
	setAttr ".wl[393].w[1:2]" 0.048137355595827103 0.89576852321624756;
	setAttr ".wl[393].w[8]" 0.0025170566514134407;
	setAttr ".wl[393].w[13]" 0.053577020764350891;
	setAttr -s 5 ".wl[394].w";
	setAttr ".wl[394].w[2:3]" 0.36793923377990723 0.013496212661266327;
	setAttr ".wl[394].w[13:15]" 0.36795616149902344 0.24902153015136719 
		0.0015868539921939373;
	setAttr -s 5 ".wl[395].w";
	setAttr ".wl[395].w[2:5]" 0.56596380472183228 0.41863644123077393 
		0.013972665183246136 0.0006092822877690196;
	setAttr ".wl[395].w[8]" 0.00081784429494291544;
	setAttr -s 5 ".wl[396].w";
	setAttr ".wl[396].w[1:3]" 0.33805060386657715 0.42642965912818909 
		0.00071543938247486949;
	setAttr ".wl[396].w[8]" 0.0002832708996720612;
	setAttr ".wl[396].w[13]" 0.23452112078666687;
	setAttr -s 5 ".wl[397].w";
	setAttr ".wl[397].w[1:3]" 0.3071296215057373 0.36123213171958923 
		0.0054392805323004723;
	setAttr ".wl[397].w[8]" 0.00012381604756228626;
	setAttr ".wl[397].w[13]" 0.3260752260684967;
	setAttr -s 5 ".wl[398].w";
	setAttr ".wl[398].w[1:3]" 0.36333683133125305 0.37024229764938354 
		0.00061980175087228417;
	setAttr ".wl[398].w[8]" 2.1635843950207345e-05;
	setAttr ".wl[398].w[13]" 0.26577946543693542;
	setAttr -s 4 ".wl[399].w";
	setAttr ".wl[399].w[1:2]" 0.39637508988380432 0.41100698709487915;
	setAttr ".wl[399].w[8]" 0.00078249169746413827;
	setAttr ".wl[399].w[13]" 0.19183547794818878;
	setAttr -s 5 ".wl[400].w";
	setAttr ".wl[400].w[2:5]" 0.69754016399383545 0.26739901304244995 
		0.030665723606944084 0.0019190862076357007;
	setAttr ".wl[400].w[8]" 0.0024759436491876841;
	setAttr -s 5 ".wl[401].w";
	setAttr ".wl[401].w[2:5]" 0.8228948712348938 0.12233491241931915 
		0.046171426773071289 0.0034617974888533354;
	setAttr ".wl[401].w[8]" 0.0051369452849030495;
	setAttr -s 5 ".wl[402].w";
	setAttr ".wl[402].w[2:5]" 0.82976830005645752 0.10090440511703491 
		0.058819398283958435 0.004409213550388813;
	setAttr ".wl[402].w[8]" 0.0060987500473856926;
	setAttr -s 5 ".wl[403].w";
	setAttr ".wl[403].w[2:5]" 0.37553852796554565 0.60242682695388794 
		0.020065944641828537 0.0010025713127106428;
	setAttr ".wl[403].w[8]" 0.00096616084920242429;
	setAttr -s 5 ".wl[404].w[3:7]"  4.8894184e-05 0.00016205199 
		0.14604507 0.84957707 0.004166909;
	setAttr -s 5 ".wl[405].w[3:7]"  1.0375722e-06 3.881401e-06 
		0.021333506 0.97840601 0.00025556062;
	setAttr ".wl[406].w[6]"  1;
	setAttr -s 4 ".wl[407].w[3:6]"  7.6798938e-07 3.2559083e-06 
		0.1161597 0.88383627;
	setAttr ".wl[408].w[6]"  1;
	setAttr -s 5 ".wl[409].w";
	setAttr ".wl[409].w[2:5]" 0.85314309597015381 0.061991047114133835 
		0.072024069726467133 0.0045602582395076752;
	setAttr ".wl[409].w[8]" 0.0082815168425440788;
	setAttr -s 5 ".wl[410].w";
	setAttr ".wl[410].w[2:5]" 0.60064798593521118 0.35427951812744141 
		0.041504580527544022 0.0016395094571635127;
	setAttr ".wl[410].w[8]" 0.0019284065347164869;
	setAttr -s 5 ".wl[411].w";
	setAttr ".wl[411].w[2:5]" 0.8440127968788147 0.011068595573306084 
		0.12052162736654282 0.0092758173123002052;
	setAttr ".wl[411].w[8]" 0.015121222473680973;
	setAttr -s 5 ".wl[412].w";
	setAttr ".wl[412].w[0:3]" 0.32900440692901611 0.43035531044006348 
		0.22223585844039917 0.00025174079928547144;
	setAttr ".wl[412].w[8]" 0.018152626231312752;
	setAttr -s 5 ".wl[413].w";
	setAttr ".wl[413].w[2:5]" 0.84194713830947876 0.0142896743491292 
		0.11890686303377151 0.0098637994378805161;
	setAttr ".wl[413].w[8]" 0.014992557466030121;
	setAttr -s 5 ".wl[414].w";
	setAttr ".wl[414].w[2:5]" 0.37202182412147522 0.59936332702636719 
		0.02618258073925972 0.001188917551189661;
	setAttr ".wl[414].w[8]" 0.0012433396186679602;
	setAttr -s 5 ".wl[415].w";
	setAttr ".wl[415].w[2:5]" 0.8383033275604248 0.0036240371409803629 
		0.12707102298736572 0.01245428528636694;
	setAttr ".wl[415].w[8]" 0.01854737289249897;
	setAttr -s 4 ".wl[416].w";
	setAttr ".wl[416].w[0:2]" 0.3436318039894104 0.4099382758140564 
		0.22976215183734894;
	setAttr ".wl[416].w[8]" 0.01666770875453949;
	setAttr -s 5 ".wl[417].w";
	setAttr ".wl[417].w[2:5]" 0.073056995868682861 0.8741142749786377 
		0.051499441266059875 0.00097425648709759116;
	setAttr ".wl[417].w[8]" 0.00035500916419550776;
	setAttr -s 5 ".wl[418].w";
	setAttr ".wl[418].w[2:5]" 0.075801171362400055 0.87309145927429199 
		0.049730308353900909 0.0010299185523763299;
	setAttr ".wl[418].w[8]" 0.00034718154347501695;
	setAttr -s 5 ".wl[419].w";
	setAttr ".wl[419].w[2:5]" 0.019330481067299843 0.74818313121795654 
		0.23035295307636261 0.0018982776673510671;
	setAttr ".wl[419].w[8]" 0.00023513077758252621;
	setAttr -s 5 ".wl[420].w";
	setAttr ".wl[420].w[2:5]" 0.067062988877296448 0.88007044792175293 
		0.05165216326713562 0.0008760906639508903;
	setAttr ".wl[420].w[8]" 0.00033830609754659235;
	setAttr -s 5 ".wl[421].w";
	setAttr ".wl[421].w[2:5]" 0.11459317058324814 0.80910462141036987 
		0.073786571621894836 0.0019019403262063861;
	setAttr ".wl[421].w[8]" 0.00061372766504064202;
	setAttr -s 5 ".wl[422].w";
	setAttr ".wl[422].w[2:5]" 0.11555596441030502 0.79836159944534302 
		0.083351299166679382 0.0020623374730348587;
	setAttr ".wl[422].w[8]" 0.00066882144892588258;
	setAttr -s 5 ".wl[423].w";
	setAttr ".wl[423].w[2:5]" 0.021005125716328621 0.7487141489982605 
		0.22777704894542694 0.0022630046587437391;
	setAttr ".wl[423].w[8]" 0.00024059075803961605;
	setAttr -s 5 ".wl[424].w";
	setAttr ".wl[424].w[2:5]" 0.11331209540367126 0.79486465454101562 
		0.089093528687953949 0.0020301176700741053;
	setAttr ".wl[424].w[8]" 0.00069963856367394328;
	setAttr -s 5 ".wl[425].w";
	setAttr ".wl[425].w[2:5]" 0.094222992658615112 0.82516151666641235 
		0.078544788062572479 0.0015116827562451363;
	setAttr ".wl[425].w[8]" 0.00055901758605614305;
	setAttr -s 5 ".wl[426].w";
	setAttr ".wl[426].w[2:5]" 0.030639356002211571 0.67710453271865845 
		0.28840741515159607 0.0034371465444564819;
	setAttr ".wl[426].w[8]" 0.00041158596286550164;
	setAttr -s 5 ".wl[427].w";
	setAttr ".wl[427].w[2:5]" 0.046870362013578415 0.91451823711395264 
		0.037839140743017197 0.00055855279788374901;
	setAttr ".wl[427].w[8]" 0.00021372904302552342;
	setAttr -s 5 ".wl[428].w";
	setAttr ".wl[428].w[2:5]" 0.0090615563094615936 0.812591552734375 
		0.17745094001293182 0.00079144554911181331;
	setAttr ".wl[428].w[8]" 0.00010453027789480984;
	setAttr -s 5 ".wl[429].w";
	setAttr ".wl[429].w[2:5]" 0.0072747631929814816 0.50041806697845459 
		0.48795890808105469 0.0041752657853066921;
	setAttr ".wl[429].w[8]" 0.0001730181829771027;
	setAttr -s 5 ".wl[430].w";
	setAttr ".wl[430].w[2:5]" 0.0089979209005832672 0.50221836566925049 
		0.48305532336235046 0.0055211312137544155;
	setAttr ".wl[430].w[8]" 0.00020723434863612056;
	setAttr -s 5 ".wl[431].w[3:7]"  0.36816138 0.61750704 0.01417651 
		7.8377954e-05 7.6653676e-05;
	setAttr -s 5 ".wl[432].w";
	setAttr ".wl[432].w[2:5]" 0.0049026547931134701 0.50311827659606934 
		0.48942741751670837 0.0024371761828660965;
	setAttr ".wl[432].w[8]" 0.00011439230729592964;
	setAttr -s 5 ".wl[433].w";
	setAttr ".wl[433].w[2:5]" 0.0080496454611420631 0.49778756499290466 
		0.48854470252990723 0.0054357331246137619;
	setAttr ".wl[433].w[8]" 0.00018233929586131126;
	setAttr -s 5 ".wl[434].w";
	setAttr ".wl[434].w[2:5]" 0.012673084624111652 0.49547582864761353 
		0.48341107368469238 0.008136676624417305;
	setAttr ".wl[434].w[8]" 0.00030339063960127532;
	setAttr -s 5 ".wl[435].w[3:7]"  0.29703057 0.68503225 0.017779658 
		7.6165088e-05 8.1342885e-05;
	setAttr -s 5 ".wl[436].w";
	setAttr ".wl[436].w[2:5]" 0.010087491013109684 0.49513465166091919 
		0.48842230439186096 0.0061089987866580486;
	setAttr ".wl[436].w[8]" 0.00024654658045619726;
	setAttr -s 5 ".wl[437].w";
	setAttr ".wl[437].w[2:5]" 0.0062133339233696461 0.49943482875823975 
		0.49099993705749512 0.0032050057779997587;
	setAttr ".wl[437].w[8]" 0.00014684935740660876;
	setAttr -s 5 ".wl[438].w[3:7]"  0.37592435 0.60632825 0.017544184 
		9.4728712e-05 0.00010842772;
	setAttr -s 5 ".wl[439].w";
	setAttr ".wl[439].w[2:5]" 0.0018736120546236634 0.50372332334518433 
		0.4934239387512207 0.00093732948880642653;
	setAttr ".wl[439].w[8]" 4.1801409679464996e-05;
	setAttr -s 5 ".wl[440].w[3:7]"  0.36012092 0.63658762 0.0032536346 
		1.8491986e-05 1.936843e-05;
	setAttr -s 5 ".wl[441].w[3:7]"  0.11219153 0.83891791 0.048667274 
		0.00011311741 0.00011020969;
	setAttr -s 5 ".wl[442].w[3:7]"  0.094867997 0.83674455 0.068124972 
		0.00013094745 0.00013155815;
	setAttr -s 5 ".wl[443].w[3:7]"  0.015524568 0.81828958 0.16601522 
		8.6341541e-05 8.4290536e-05;
	setAttr -s 5 ".wl[444].w[3:7]"  0.10355884 0.86579788 0.030494804 
		7.4768948e-05 7.3788389e-05;
	setAttr -s 5 ".wl[445].w[3:7]"  0.084433995 0.85051435 0.06481792 
		0.0001127184 0.00012106338;
	setAttr -s 5 ".wl[446].w[3:7]"  0.1149055 0.79724169 0.087469459 
		0.00017888829 0.00020448153;
	setAttr -s 5 ".wl[447].w[3:7]"  0.01387904 0.75334793 0.23257269 
		9.6158059e-05 0.00010411652;
	setAttr -s 5 ".wl[448].w[3:7]"  0.13223889 0.80524385 0.062198393 
		0.00014762825 0.00017124764;
	setAttr -s 5 ".wl[449].w[3:7]"  0.11772651 0.84528238 0.036799289 
		9.0166701e-05 0.00010163864;
	setAttr -s 5 ".wl[450].w[3:7]"  0.024042193 0.75980604 0.21584632 
		0.00014043608 0.00016506239;
	setAttr -s 5 ".wl[451].w[3:7]"  0.06105686 0.92688656 0.012000565 
		2.7309792e-05 2.8714103e-05;
	setAttr -s 5 ".wl[452].w[3:7]"  0.0059501654 0.94323909 0.050765328 
		2.2053749e-05 2.335148e-05;
	setAttr -s 5 ".wl[453].w[3:7]"  0.0016947716 0.54689437 0.45133919 
		3.6171528e-05 3.5471876e-05;
	setAttr -s 5 ".wl[454].w[3:7]"  0.0014013136 0.50880522 0.4897218 
		3.5610072e-05 3.6111731e-05;
	setAttr -s 5 ".wl[455].w[3:7]"  0.001463076 0.23776317 0.76049161 
		0.00014538682 0.00013661874;
	setAttr -s 5 ".wl[456].w[3:7]"  0.00139217 0.57593077 0.4226211 
		2.8053442e-05 2.7907066e-05;
	setAttr -s 5 ".wl[457].w[3:7]"  0.001534443 0.50999689 0.48839107 
		3.711032e-05 4.0422219e-05;
	setAttr -s 5 ".wl[458].w[3:7]"  0.0028567037 0.50396091 0.49302381 
		7.3305921e-05 8.5339969e-05;
	setAttr -s 5 ".wl[459].w[3:7]"  0.0016650253 0.27291775 0.72504151 
		0.00017863563 0.00019705962;
	setAttr -s 5 ".wl[460].w[3:7]"  0.0035998037 0.52797943 0.46825275 
		7.6902666e-05 9.1038179e-05;
	setAttr -s 5 ".wl[461].w[3:7]"  0.0025507323 0.55290961 0.44442973 
		5.1182433e-05 5.8742353e-05;
	setAttr -s 5 ".wl[462].w[3:7]"  0.0025031634 0.23919465 0.75776529 
		0.00023776846 0.00029919189;
	setAttr -s 5 ".wl[463].w[3:7]"  0.0009707642 0.6511144 0.34788054 
		1.655415e-05 1.7628448e-05;
	setAttr -s 5 ".wl[464].w[3:7]"  0.0010346579 0.22856948 0.77021837 
		8.5711421e-05 9.1708309e-05;
	setAttr -s 5 ".wl[465].w[3:7]"  0.0031253248 0.061183386 
		0.93301934 0.000354527 0.0023173911;
	setAttr -s 5 ".wl[466].w[3:7]"  0.00366582 0.085175022 0.90855116 
		5.4031148e-06 0.0026026743;
	setAttr -s 5 ".wl[467].w[3:7]"  0.0022087514 0.02472846 0.48285365 
		0.48619595 0.0040132129;
	setAttr -s 5 ".wl[468].w[3:7]"  0.002021546 0.04815365 0.9486177 
		2.7795413e-05 0.0011793497;
	setAttr -s 5 ".wl[469].w[3:7]"  0.0041000363 0.0865594 0.9044205 
		0.00048815258 0.0044319681;
	setAttr -s 5 ".wl[470].w[3:7]"  0.0025621504 0.052860849 
		0.7379967 0.0012311643 0.20534915;
	setAttr -s 5 ".wl[471].w[3:7]"  0.0029033262 0.033997834 
		0.68136084 0.00023629535 0.28150171;
	setAttr -s 5 ".wl[472].w[3:7]"  0.0037546337 0.046690766 
		0.72249544 0.2172271 0.0098320832;
	setAttr -s 5 ".wl[473].w[3:7]"  0.0023938387 0.039284177 
		0.70465922 0.0018760323 0.25178671;
	setAttr -s 5 ".wl[474].w[3:7]"  0.0023116376 0.045046609 
		0.70169824 0.00057458732 0.25036889;
	setAttr -s 5 ".wl[475].w[3:7]"  0.0028804552 0.028398251 
		0.70465457 0.0012186629 0.26284817;
	setAttr -s 5 ".wl[476].w[3:7]"  0.0025502483 0.054194462 
		0.94104266 5.6515877e-05 0.0021561128;
	setAttr -s 5 ".wl[477].w[3:7]"  0.0026673404 0.031380769 
		0.84537494 0.11517643 0.0054004989;
	setAttr -s 5 ".wl[478].w[3:7]"  0.0048231315 0.048067745 
		0.76546544 0.00060279184 0.18104085;
	setAttr -s 5 ".wl[479].w[3:7]"  9.9977478e-05 0.00032575036 
		0.28883466 0.0016988516 0.70904076;
	setAttr -s 5 ".wl[480].w[3:7]"  1.1040352e-07 4.8373221e-07 
		0.070626095 5.733296e-05 0.92931598;
	setAttr ".wl[481].w[7]"  1;
	setAttr -s 4 ".wl[482].w";
	setAttr ".wl[482].w[3:5]" 2.2115811589173973e-05 8.8159882579930127e-05 
		0.13967381417751312;
	setAttr ".wl[482].w[7]" 0.86021590232849121;
	setAttr -s 5 ".wl[483].w[3:7]"  1.1778908e-05 4.6929919e-05 
		0.033333156 6.9706337e-05 0.96653843;
	setAttr -s 5 ".wl[484].w[3:7]"  0.00038778549 0.0038161853 
		0.084492937 0.910366 0.0009370941;
	setAttr -s 5 ".wl[485].w[3:7]"  0.001401678 0.013948857 0.23480856 
		0.74594593 0.0038949875;
	setAttr -s 5 ".wl[486].w[3:7]"  0.00049925596 0.0040686605 
		0.11532519 0.87817526 0.0019316381;
	setAttr -s 5 ".wl[487].w[3:7]"  0.00025908972 0.0024157932 
		0.052106995 0.94462031 0.0005978113;
	setAttr -s 5 ".wl[488].w[3:7]"  0.001419081 0.015367956 0.28093255 
		0.69746029 0.0048201163;
	setAttr -s 5 ".wl[489].w[3:7]"  0.0019574198 0.024811929 
		0.86907768 0.099295147 0.0048579024;
	setAttr -s 5 ".wl[490].w[3:7]"  0.00041183698 0.0037392734 
		0.089245498 0.90431345 0.0022899441;
	setAttr -s 5 ".wl[491].w[3:7]"  1.3084396e-05 0.00020188995 
		0.84508818 0.1546398 5.7085406e-05;
	setAttr -s 5 ".wl[492].w[3:7]"  3.5212054e-06 5.3962482e-05 
		0.71670836 0.12287416 0.16035998;
	setAttr -s 5 ".wl[493].w[3:7]"  0.0005394686 0.0069092894 
		0.9184832 0.072181858 0.0018861505;
	setAttr -s 5 ".wl[494].w[3:7]"  3.4941193e-06 4.2019896e-05 
		0.49762684 0.50230837 1.9234163e-05;
	setAttr -s 5 ".wl[495].w[3:7]"  0.0015761253 0.015732668 
		0.43441844 0.5440973 0.0041754781;
	setAttr -s 5 ".wl[496].w[3:7]"  0.00074022228 0.0060986271 
		0.20828982 0.78159434 0.0032769968;
	setAttr ".wl[497].w[6]"  1;
	setAttr ".wl[498].w[6]"  1;
	setAttr ".wl[499].w[6]"  1;
	setAttr ".wl[500].w[6]"  1;
	setAttr ".wl[501].w[6]"  1;
	setAttr ".wl[502].w[6]"  1;
	setAttr ".wl[503].w[6]"  1;
	setAttr ".wl[504].w[6]"  1;
	setAttr -s 5 ".wl[505].w[3:7]"  1.2095146e-06 1.8378538e-05 
		0.82407963 4.5480097e-06 0.17589614;
	setAttr -s 5 ".wl[506].w[3:7]"  0.00098638737 0.011986516 
		0.54520416 5.1775887e-06 0.44181779;
	setAttr -s 5 ".wl[507].w[3:7]"  1.809217e-07 2.1416108e-06 
		0.44219968 1.2775747e-06 0.55779672;
	setAttr -s 5 ".wl[508].w[3:7]"  0.00071529392 0.0085637737 
		0.72941256 0.00085134967 0.26045707;
	setAttr -s 5 ".wl[509].w[3:7]"  0.003079558 0.030796671 0.70746505 
		8.3263971e-05 0.25857544;
	setAttr -s 5 ".wl[510].w[3:7]"  0.0027737448 0.024341954 
		0.45741636 0.0024834441 0.51298451;
	setAttr -s 5 ".wl[511].w[3:7]"  0.0025423539 0.021398909 
		0.59337419 1.8794266e-05 0.38266572;
	setAttr -s 5 ".wl[512].w[3:7]"  0.0025951343 0.022942543 
		0.68059343 0.00041892636 0.29344997;
	setAttr -s 5 ".wl[513].w[3:7]"  0.0035414088 0.028460359 
		0.52442205 0.0015435801 0.44203261;
	setAttr -s 4 ".wl[514].w";
	setAttr ".wl[514].w[3:5]" 0.0016716539394110441 0.012696439400315285 
		0.53034240007400513;
	setAttr ".wl[514].w[7]" 0.45528948307037354;
	setAttr -s 5 ".wl[515].w[3:7]"  0.0062391618 0.049849492 
		0.6813851 0.00018890465 0.26233733;
	setAttr -s 5 ".wl[516].w[3:7]"  0.0038240189 0.027618045 
		0.60571325 0.00012985662 0.36271492;
	setAttr ".wl[517].w[7]"  1;
	setAttr -s 5 ".wl[518].w[3:7]"  0.00018372636 0.0012267119 
		0.20970204 4.6510318e-05 0.78884101;
	setAttr -s 5 ".wl[519].w[3:7]"  0.00023605517 0.0014688646 
		0.24978456 8.0136451e-05 0.74843037;
	setAttr -s 5 ".wl[520].w[3:7]"  0.00086724909 0.0050054118 
		0.27174753 9.5450223e-06 0.72237027;
	setAttr -s 5 ".wl[521].w[3:7]"  0.0012598531 0.0068718856 
		0.37100419 0.0027526792 0.61811137;
	setAttr -s 5 ".wl[522].w[3:7]"  0.00098569365 0.0050298604 
		0.34135446 6.6813755e-06 0.6526233;
	setAttr -s 5 ".wl[523].w[3:7]"  0.0026308757 0.01267588 0.42700908 
		9.7792486e-05 0.55758637;
	setAttr -s 5 ".wl[524].w[3:7]"  0.001447149 0.0072861449 
		0.29257336 0.0019099229 0.69678342;
	setAttr -s 4 ".wl[525].w";
	setAttr ".wl[525].w[0:2]" 0.23545204102993011 0.49065178632736206 
		0.27388995885848999;
	setAttr ".wl[525].w[8]" 6.1915288824820891e-06;
	setAttr -s 5 ".wl[526].w";
	setAttr ".wl[526].w[0:3]" 0.13840562105178833 0.49581959843635559 
		0.36570742726325989 5.6138906074920669e-05;
	setAttr ".wl[526].w[8]" 1.1192025340278633e-05;
	setAttr -s 5 ".wl[527].w";
	setAttr ".wl[527].w[0:3]" 0.1381707638502121 0.51784378290176392 
		0.34397277235984802 1.1340580385876819e-05;
	setAttr ".wl[527].w[8]" 1.3816766113450285e-06;
	setAttr -s 5 ".wl[528].w";
	setAttr ".wl[528].w[0:3]" 0.26520764827728271 0.49823826551437378 
		0.23646239936351776 8.2667793321888894e-05;
	setAttr ".wl[528].w[8]" 8.9774421212496236e-06;
	setAttr -s 5 ".wl[529].w";
	setAttr ".wl[529].w[0:3]" 0.33002093434333801 0.47820195555686951 
		0.18777720630168915 0.00026300433091819286;
	setAttr ".wl[529].w[8]" 0.0037369746714830399;
	setAttr -s 5 ".wl[530].w";
	setAttr ".wl[530].w[0:3]" 0.23274724185466766 0.43947166204452515 
		0.32755181193351746 7.2448827268090099e-05;
	setAttr ".wl[530].w[8]" 0.00015687849372625351;
	setAttr -s 5 ".wl[531].w";
	setAttr ".wl[531].w[1:3]" 0.36087223887443542 0.49580928683280945 
		3.0171064281603321e-05;
	setAttr ".wl[531].w[8]" 0.038324669003486633;
	setAttr ".wl[531].w[13]" 0.10496360063552856;
	setAttr -s 5 ".wl[532].w";
	setAttr ".wl[532].w[1:3]" 0.28700160980224609 0.60175818204879761 
		1.876444548543077e-05;
	setAttr ".wl[532].w[8]" 0.0076086968183517456;
	setAttr ".wl[532].w[13]" 0.10361270606517792;
	setAttr -s 5 ".wl[533].w";
	setAttr ".wl[533].w[0:3]" 0.28431123495101929 0.36745655536651611 
		0.28982484340667725 6.3571897044312209e-06;
	setAttr ".wl[533].w[8]" 0.058401018381118774;
	setAttr -s 5 ".wl[534].w";
	setAttr ".wl[534].w[1:3]" 0.29145404696464539 0.56750774383544922 
		3.3996915590250865e-05;
	setAttr ".wl[534].w[8]" 0.050890833139419556;
	setAttr ".wl[534].w[13]" 0.090113408863544464;
	setAttr -s 5 ".wl[535].w";
	setAttr ".wl[535].w[2:5]" 0.82224690914154053 0.0035536896903067827 
		0.13439176976680756 0.015274056233465672;
	setAttr ".wl[535].w[8]" 0.024533575400710106;
	setAttr -s 5 ".wl[536].w";
	setAttr ".wl[536].w[1:3]" 0.23565663397312164 0.67653453350067139 
		0.0063539869152009487;
	setAttr ".wl[536].w[8]" 0.026634441688656807;
	setAttr ".wl[536].w[13]" 0.054820355027914047;
	setAttr -s 5 ".wl[537].w";
	setAttr ".wl[537].w[0:3]" 0.31809037923812866 0.37406337261199951 
		0.27959543466567993 0.0023477289360016584;
	setAttr ".wl[537].w[8]" 0.025903070345520973;
	setAttr -s 5 ".wl[538].w";
	setAttr ".wl[538].w[1:3]" 0.21245549619197845 0.43795061111450195 
		0.022157803177833557;
	setAttr ".wl[538].w[8]" 0.00010496433242224157;
	setAttr ".wl[538].w[13]" 0.32733112573623657;
	setAttr -s 4 ".wl[539].w";
	setAttr ".wl[539].w[1:3]" 0.22105245292186737 0.39073643088340759 
		0.0086997998878359795;
	setAttr ".wl[539].w[13]" 0.37951135635375977;
	setAttr -s 5 ".wl[540].w";
	setAttr ".wl[540].w[1:3]" 0.18726490437984467 0.51359236240386963 
		0.032335873693227768;
	setAttr ".wl[540].w[8]" 0.00055991462431848049;
	setAttr ".wl[540].w[13]" 0.26624691486358643;
	setAttr -s 4 ".wl[541].w";
	setAttr ".wl[541].w[1:2]" 0.25654599070549011 0.64642030000686646;
	setAttr ".wl[541].w[8]" 0.004203110933303833;
	setAttr ".wl[541].w[13]" 0.092830643057823181;
	setAttr -s 5 ".wl[542].w";
	setAttr ".wl[542].w[1:3]" 0.22513116896152496 0.69867002964019775 
		0.0015499371802434325;
	setAttr ".wl[542].w[8]" 0.003279996570199728;
	setAttr ".wl[542].w[13]" 0.071368835866451263;
	setAttr -s 5 ".wl[543].w";
	setAttr ".wl[543].w[1:3]" 0.11326421797275543 0.81017428636550903 
		0.0012880373978987336;
	setAttr ".wl[543].w[8]" 0.016710923984646797;
	setAttr ".wl[543].w[13]" 0.058562461286783218;
	setAttr -s 5 ".wl[544].w";
	setAttr ".wl[544].w[1:3]" 0.40241613984107971 0.47395461797714233 
		4.9828086048364639e-05;
	setAttr ".wl[544].w[8]" 0.0001102052119676955;
	setAttr ".wl[544].w[13]" 0.12346924841403961;
	setAttr -s 5 ".wl[545].w";
	setAttr ".wl[545].w[2:5]" 0.90973567962646484 0.014958790503442287 
		0.059880010783672333 0.0054273223504424095;
	setAttr ".wl[545].w[8]" 0.0099981976673007011;
	setAttr -s 5 ".wl[546].w";
	setAttr ".wl[546].w[1:3]" 0.079172894358634949 0.81256592273712158 
		0.024148097261786461;
	setAttr ".wl[546].w[8]" 0.0093883667141199112;
	setAttr ".wl[546].w[13]" 0.074724704027175903;
	setAttr -s 5 ".wl[547].w";
	setAttr ".wl[547].w[1:3]" 0.1368815153837204 0.69688016176223755 
		0.0014482004335150123;
	setAttr ".wl[547].w[8]" 0.0041212630458176136;
	setAttr ".wl[547].w[13]" 0.16066889464855194;
	setAttr -s 5 ".wl[548].w";
	setAttr ".wl[548].w[1:3]" 0.26135006546974182 0.37276455760002136 
		2.6390371203888208e-05;
	setAttr ".wl[548].w[8]" 3.0786337447352707e-05;
	setAttr ".wl[548].w[13]" 0.36582821607589722;
	setAttr -s 5 ".wl[549].w";
	setAttr ".wl[549].w[1:3]" 0.24283310770988464 0.38020986318588257 
		0.00038202843279577792;
	setAttr ".wl[549].w[8]" 2.4235871023847722e-05;
	setAttr ".wl[549].w[13]" 0.37655073404312134;
	setAttr -s 5 ".wl[550].w";
	setAttr ".wl[550].w[1:3]" 0.2771439254283905 0.36651667952537537 
		0.00052328594028949738;
	setAttr ".wl[550].w[8]" 0.00020434102043509483;
	setAttr ".wl[550].w[13]" 0.35561183094978333;
	setAttr -s 5 ".wl[551].w";
	setAttr ".wl[551].w[0:3]" 0.090255521237850189 0.48673164844512939 
		0.42233589291572571 0.00016909923579078168;
	setAttr ".wl[551].w[8]" 0.00050786754582077265;
	setAttr -s 5 ".wl[552].w";
	setAttr ".wl[552].w[0:3]" 0.072782933712005615 0.52980095148086548 
		0.39738920331001282 2.3090700778993778e-05;
	setAttr ".wl[552].w[8]" 3.8522462091350462e-06;
	setAttr -s 5 ".wl[553].w";
	setAttr ".wl[553].w[0:3]" 0.071285977959632874 0.51223188638687134 
		0.41645127534866333 1.9981975128757767e-05;
	setAttr ".wl[553].w[8]" 1.0996181117661763e-05;
	setAttr -s 5 ".wl[554].w";
	setAttr ".wl[554].w[0:2]" 0.43142089247703552 0.42140239477157593 
		0.078894764184951782;
	setAttr ".wl[554].w[20:21]" 0.064902693033218384 0.0033793160691857338;
	setAttr -s 6 ".wl[555].w";
	setAttr ".wl[555].w[0:4]" 0.38210061192512512 0.45371407270431519 
		0.10123928636312485 1.8748314687400125e-06 0.038839217275381088;
	setAttr ".wl[555].w[8]" 0.024104958400130272;
	setAttr -s 5 ".wl[556].w";
	setAttr ".wl[556].w[0:2]" 0.43608951568603516 0.43009474873542786 
		0.06996869295835495;
	setAttr ".wl[556].w[20:21]" 0.060697570443153381 0.0031494556460529566;
	setAttr -s 5 ".wl[557].w";
	setAttr ".wl[557].w[0:2]" 0.45900991559028625 0.36812496185302734 
		0.053869154304265976;
	setAttr ".wl[557].w[20:21]" 0.11392625421285629 0.0050697773694992065;
	setAttr -s 6 ".wl[558].w";
	setAttr ".wl[558].w[0:2]" 0.41793638467788696 0.40722101926803589 
		0.089904114603996277;
	setAttr ".wl[558].w[4]" 0.016263922676444054;
	setAttr ".wl[558].w[20:21]" 0.065246127545833588 0.0034284149296581745;
	setAttr -s 5 ".wl[559].w";
	setAttr ".wl[559].w[0:2]" 0.40628713369369507 0.39663964509963989 
		0.12001653015613556;
	setAttr ".wl[559].w[20:21]" 0.072942145168781281 0.0041145840659737587;
	setAttr -s 5 ".wl[560].w";
	setAttr ".wl[560].w[0:2]" 0.35728612542152405 0.3960145115852356 
		0.17941878736019135;
	setAttr ".wl[560].w[4]" 0.02476000040769577;
	setAttr ".wl[560].w[8]" 0.042520537972450256;
	setAttr -s 5 ".wl[561].w";
	setAttr ".wl[561].w[0:2]" 0.43847450613975525 0.34941411018371582 
		0.075568757951259613;
	setAttr ".wl[561].w[20:21]" 0.13021732866764069 0.0063252542167901993;
	setAttr -s 5 ".wl[562].w";
	setAttr ".wl[562].w[0:2]" 0.39409121870994568 0.37987133860588074 
		0.13814288377761841;
	setAttr ".wl[562].w[20:21]" 0.08303774893283844 0.0048568351194262505;
	setAttr -s 4 ".wl[563].w";
	setAttr ".wl[563].w[0:2]" 0.089241765439510345 0.51489347219467163 
		0.39585393667221069;
	setAttr ".wl[563].w[8]" 1.0803229997691233e-05;
	setAttr -s 4 ".wl[564].w[0:3]"  0.078435712 0.53768593 0.38382798 
		5.0414281e-05;
	setAttr -s 5 ".wl[565].w";
	setAttr ".wl[565].w[1:3]" 0.42512300610542297 0.46665370464324951 
		2.794276770146098e-05;
	setAttr ".wl[565].w[8]" 1.1328230357321445e-05;
	setAttr ".wl[565].w[13]" 0.1081840842962265;
	setAttr -s 5 ".wl[566].w";
	setAttr ".wl[566].w[0:3]" 0.089721910655498505 0.54966181516647339 
		0.36057817935943604 3.6086057662032545e-05;
	setAttr ".wl[566].w[8]" 2.1141531760804355e-06;
	setAttr -s 5 ".wl[567].w";
	setAttr ".wl[567].w[0:3]" 0.056708808988332748 0.60566359758377075 
		0.33758211135864258 4.4020031054969877e-05;
	setAttr ".wl[567].w[8]" 1.5741430843263515e-06;
	setAttr -s 5 ".wl[568].w";
	setAttr ".wl[568].w[0:3]" 0.13628263771533966 0.51861238479614258 
		0.34509891271591187 2.8912068046338391e-06;
	setAttr ".wl[568].w[8]" 3.1170238798949867e-06;
	setAttr -s 5 ".wl[569].w";
	setAttr ".wl[569].w[0:3]" 0.35600584745407104 0.49427810311317444 
		0.13506665825843811 2.2768848793930374e-05;
	setAttr ".wl[569].w[8]" 0.014626593329012394;
	setAttr -s 6 ".wl[570].w";
	setAttr ".wl[570].w[0:4]" 0.34423732757568359 0.50950700044631958 
		0.10658805072307587 6.1105411077733152e-06 0.01650666818022728;
	setAttr ".wl[570].w[8]" 0.023154838010668755;
	setAttr -s 5 ".wl[571].w";
	setAttr ".wl[571].w[0:3]" 0.33912619948387146 0.45193251967430115 
		0.17627695202827454 4.9860509534482844e-06;
	setAttr ".wl[571].w[8]" 0.032659370452165604;
	setAttr -s 5 ".wl[572].w";
	setAttr ".wl[572].w[0:3]" 0.37032559514045715 0.51463335752487183 
		0.11465723067522049 0.00015034159878268838;
	setAttr ".wl[572].w[8]" 0.00023348897229880095;
	setAttr -s 5 ".wl[573].w";
	setAttr ".wl[573].w[1:3]" 0.24288873374462128 0.66902601718902588 
		0.00061623263172805309;
	setAttr ".wl[573].w[8]" 0.0038470563013106585;
	setAttr ".wl[573].w[13]" 0.083622030913829803;
	setAttr -s 4 ".wl[574].w";
	setAttr ".wl[574].w[1:2]" 0.15810862183570862 0.75508248805999756;
	setAttr ".wl[574].w[8]" 0.023961946368217468;
	setAttr ".wl[574].w[13]" 0.062846899032592773;
	setAttr -s 6 ".wl[575].w";
	setAttr ".wl[575].w[0:4]" 0.32041680812835693 0.39073827862739563 
		0.23365706205368042 5.0542092822070117e-07 0.0097098043188452721;
	setAttr ".wl[575].w[8]" 0.045477546751499176;
	setAttr -s 5 ".wl[576].w";
	setAttr ".wl[576].w[0:3]" 0.33253252506256104 0.41681501269340515 
		0.21289888024330139 1.2547429832920898e-06;
	setAttr ".wl[576].w[8]" 0.037752319127321243;
	setAttr -s 5 ".wl[577].w";
	setAttr ".wl[577].w[0:3]" 0.27606439590454102 0.34588059782981873 
		0.33568820357322693 5.8648511185310781e-05;
	setAttr ".wl[577].w[8]" 0.042308047413825989;
	setAttr -s 4 ".wl[578].w";
	setAttr ".wl[578].w[1:2]" 0.26953428983688354 0.61923378705978394;
	setAttr ".wl[578].w[8]" 0.038488388061523438;
	setAttr ".wl[578].w[13]" 0.072743579745292664;
	setAttr -s 5 ".wl[579].w";
	setAttr ".wl[579].w[0:2]" 0.53662949800491333 0.17900943756103516 
		0.019408987835049629;
	setAttr ".wl[579].w[20:21]" 0.25801092386245728 0.0069411597214639187;
	setAttr -s 5 ".wl[580].w";
	setAttr ".wl[580].w[0:2]" 0.5467979907989502 0.27080678939819336 
		0.024742815643548965;
	setAttr ".wl[580].w[20:21]" 0.15330225229263306 0.0043501830659806728;
	setAttr -s 5 ".wl[581].w";
	setAttr ".wl[581].w[0:2]" 0.5312502384185791 0.18415325880050659 
		0.019075045362114906;
	setAttr ".wl[581].w[20:21]" 0.25827035307884216 0.0072511481121182442;
	setAttr -s 5 ".wl[582].w";
	setAttr ".wl[582].w[0:2]" 0.52727264165878296 0.10666634142398834 
		0.012279060669243336;
	setAttr ".wl[582].w[20:21]" 0.34573164582252502 0.0080503150820732117;
	setAttr -s 5 ".wl[583].w";
	setAttr ".wl[583].w[0:2]" 0.52694308757781982 0.18073192238807678 
		0.022576527670025826;
	setAttr ".wl[583].w[20:21]" 0.26234212517738342 0.0074063786305487156;
	setAttr -s 5 ".wl[584].w";
	setAttr ".wl[584].w[0:2]" 0.50512337684631348 0.1851809173822403 
		0.027846744284033775;
	setAttr ".wl[584].w[20:21]" 0.27308875322341919 0.0087602166458964348;
	setAttr -s 5 ".wl[585].w";
	setAttr ".wl[585].w[0:2]" 0.51203840970993042 0.26601964235305786 
		0.036975234746932983;
	setAttr ".wl[585].w[20:21]" 0.17909304797649384 0.0058736479841172695;
	setAttr -s 5 ".wl[586].w";
	setAttr ".wl[586].w[0:2]" 0.50383687019348145 0.11256228387355804 
		0.016521118581295013;
	setAttr ".wl[586].w[20:21]" 0.35708889365196228 0.0099909072741866112;
	setAttr -s 5 ".wl[587].w";
	setAttr ".wl[587].w[0:2]" 0.50187820196151733 0.17900486290454865 
		0.028432028368115425;
	setAttr ".wl[587].w[20:21]" 0.28159242868423462 0.0090924575924873352;
	setAttr -s 6 ".wl[588].w";
	setAttr ".wl[588].w[0:4]" 0.3555908203125 0.50882130861282349 
		0.10486747324466705 0.00027276136097498238 0.01335098035633564;
	setAttr ".wl[588].w[8]" 0.017096629366278648;
	setAttr -s 5 ".wl[589].w";
	setAttr ".wl[589].w[0:3]" 0.37599670886993408 0.52831882238388062 
		0.094863042235374451 0.00015070245717652142;
	setAttr ".wl[589].w[8]" 0.00067085155751556158;
	setAttr -s 5 ".wl[590].w";
	setAttr ".wl[590].w[0:2]" 0.51417124271392822 0.34675413370132446 
		0.032549250870943069;
	setAttr ".wl[590].w[20:21]" 0.10309308767318726 0.0034322873689234257;
	setAttr -s 5 ".wl[591].w";
	setAttr ".wl[591].w[0:2]" 0.57080858945846558 0.33637732267379761 
		0.019356140866875648;
	setAttr ".wl[591].w[20:21]" 0.071579247713088989 0.0018787049921229482;
	setAttr -s 5 ".wl[592].w";
	setAttr ".wl[592].w[0:2]" 0.51158535480499268 0.32996273040771484 
		0.036940734833478928;
	setAttr ".wl[592].w[20:21]" 0.11757797002792358 0.0039330851286649704;
	setAttr -s 5 ".wl[593].w";
	setAttr ".wl[593].w[0:2]" 0.50153744220733643 0.37372365593910217 
		0.032640911638736725;
	setAttr ".wl[593].w[20:21]" 0.0889449343085289 0.0031530328560620546;
	setAttr -s 5 ".wl[594].w";
	setAttr ".wl[594].w[0:3]" 0.33468976616859436 0.4063485860824585 
		0.22035413980484009 8.894494385458529e-07;
	setAttr ".wl[594].w[8]" 0.038606703281402588;
	setAttr -s 5 ".wl[595].w";
	setAttr ".wl[595].w[0:3]" 0.36174994707107544 0.3875286877155304 
		0.21437877416610718 1.3098715498927049e-06;
	setAttr ".wl[595].w[8]" 0.036341350525617599;
	setAttr -s 5 ".wl[596].w";
	setAttr ".wl[596].w[0:2]" 0.49050566554069519 0.3305186927318573 
		0.04809405654668808;
	setAttr ".wl[596].w[20:21]" 0.12625429034233093 0.0046273358166217804;
	setAttr -s 5 ".wl[597].w";
	setAttr ".wl[597].w[0:2]" 0.53619229793548584 0.32720315456390381 
		0.033396895974874496;
	setAttr ".wl[597].w[20:21]" 0.10023760050535202 0.0029700275044888258;
	setAttr -s 5 ".wl[598].w";
	setAttr ".wl[598].w[0:2]" 0.45422711968421936 0.35679817199707031 
		0.071564793586730957;
	setAttr ".wl[598].w[20:21]" 0.1125461533665657 0.0048637241125106812;
	setAttr -s 5 ".wl[599].w";
	setAttr ".wl[599].w[0:2]" 0.40851402282714844 0.39096951484680176 
		0.12398076057434082;
	setAttr ".wl[599].w[20:21]" 0.072703324258327484 0.0038324007764458656;
	setAttr -s 5 ".wl[600].w";
	setAttr ".wl[600].w[0:2]" 0.42478722333908081 0.4122721254825592 
		0.10772888362407684;
	setAttr ".wl[600].w[20:21]" 0.05270250141620636 0.0025093532167375088;
	setAttr -s 5 ".wl[601].w";
	setAttr ".wl[601].w[0:2]" 0.53114628791809082 0.012200847268104553 
		0.0011216335697099566;
	setAttr ".wl[601].w[20:21]" 0.45356911420822144 0.0019621273968368769;
	setAttr -s 5 ".wl[602].w";
	setAttr ".wl[602].w[0:2]" 0.59575754404067993 0.033631756901741028 
		0.0028404602780938148;
	setAttr ".wl[602].w[20:21]" 0.36497032642364502 0.0027998758014291525;
	setAttr -s 5 ".wl[603].w";
	setAttr ".wl[603].w[0:2]" 0.53521913290023804 0.01263889204710722 
		0.0010800558375194669;
	setAttr ".wl[603].w[20:21]" 0.44909065961837769 0.0019713297951966524;
	setAttr -s 5 ".wl[604].w";
	setAttr ".wl[604].w[0:1]" 0.45597079396247864 0.002546908101066947;
	setAttr ".wl[604].w[20:22]" 0.53997677564620972 0.0012578848982229829 
		0.00024757286882959306;
	setAttr -s 5 ".wl[605].w";
	setAttr ".wl[605].w[0:2]" 0.52023440599441528 0.014174300245940685 
		0.0014243844198063016;
	setAttr ".wl[605].w[20:21]" 0.46171784400939941 0.0024491094518452883;
	setAttr -s 5 ".wl[606].w";
	setAttr ".wl[606].w[0:2]" 0.51065748929977417 0.01782594621181488 
		0.0019579909276217222;
	setAttr ".wl[606].w[20:21]" 0.46627292037010193 0.0032857097685337067;
	setAttr -s 5 ".wl[607].w";
	setAttr ".wl[607].w[0:2]" 0.55413520336151123 0.043131634593009949 
		0.0046428828500211239;
	setAttr ".wl[607].w[20:21]" 0.39376658201217651 0.004323665052652359;
	setAttr -s 5 ".wl[608].w";
	setAttr ".wl[608].w[0:1]" 0.4507347047328949 0.0053662452846765518;
	setAttr ".wl[608].w[20:22]" 0.54010558128356934 0.0031631418969482183 
		0.0006303071859292686;
	setAttr -s 5 ".wl[609].w";
	setAttr ".wl[609].w[0:2]" 0.50317597389221191 0.016049271449446678 
		0.0018355414504185319;
	setAttr ".wl[609].w[20:21]" 0.47567790746688843 0.0032613819930702448;
	setAttr -s 5 ".wl[610].w";
	setAttr ".wl[610].w[0:2]" 0.56766033172607422 0.31774380803108215 
		0.021091746166348457;
	setAttr ".wl[610].w[20:21]" 0.091088771820068359 0.0024152053520083427;
	setAttr -s 5 ".wl[611].w";
	setAttr ".wl[611].w[0:2]" 0.55006694793701172 0.34769132733345032 
		0.021192431449890137;
	setAttr ".wl[611].w[20:21]" 0.078800089657306671 0.0022492206189781427;
	setAttr -s 5 ".wl[612].w";
	setAttr ".wl[612].w[0:2]" 0.56136995553970337 0.30328398942947388 
		0.025060176849365234;
	setAttr ".wl[612].w[20:21]" 0.10739630460739136 0.0028895770665258169;
	setAttr -s 5 ".wl[613].w";
	setAttr ".wl[613].w[0:2]" 0.55700129270553589 0.06737227737903595 
		0.0067022684961557388;
	setAttr ".wl[613].w[20:21]" 0.36347490549087524 0.005449256394058466;
	setAttr -s 5 ".wl[614].w";
	setAttr ".wl[614].w[0:2]" 0.55398774147033691 0.074577376246452332 
		0.0080939522013068199;
	setAttr ".wl[614].w[20:21]" 0.35760641098022461 0.0057345014065504074;
	setAttr -s 5 ".wl[615].w";
	setAttr ".wl[615].w[0:2]" 0.5411490797996521 0.061826460063457489 
		0.0061093969270586967;
	setAttr ".wl[615].w[20:21]" 0.38477373123168945 0.0061413510702550411;
	setAttr -s 5 ".wl[616].w";
	setAttr ".wl[616].w[0:2]" 0.53177535533905029 0.30989676713943481 
		0.0346849225461483;
	setAttr ".wl[616].w[20:21]" 0.12002110481262207 0.0036218327004462481;
	setAttr -s 5 ".wl[617].w";
	setAttr ".wl[617].w[0:2]" 0.52107363939285278 0.27946820855140686 
		0.038175538182258606;
	setAttr ".wl[617].w[20:21]" 0.15639165043830872 0.0048910262994468212;
	setAttr -s 5 ".wl[618].w";
	setAttr ".wl[618].w[0:2]" 0.52903187274932861 0.07423950731754303 
		0.0093690771609544754;
	setAttr ".wl[618].w[20:21]" 0.38021171092987061 0.007147766649723053;
	setAttr -s 5 ".wl[619].w";
	setAttr ".wl[619].w[0:2]" 0.51934367418289185 0.090199843049049377 
		0.012442145496606827;
	setAttr ".wl[619].w[20:21]" 0.36981099843978882 0.0082033053040504456;
	setAttr -s 5 ".wl[620].w";
	setAttr ".wl[620].w[0:2]" 0.53621160984039307 0.16726115345954895 
		0.022744717076420784;
	setAttr ".wl[620].w[20:21]" 0.26691767573356628 0.0068648951128125191;
	setAttr -s 5 ".wl[621].w";
	setAttr ".wl[621].w[0:2]" 0.57998597621917725 0.16050197184085846 
		0.018014853820204735;
	setAttr ".wl[621].w[20:21]" 0.23663005232810974 0.0048671704716980457;
	setAttr -s 5 ".wl[622].w";
	setAttr ".wl[622].w[0:2]" 0.43147966265678406 0.42023935914039612 
		0.10048056393861771;
	setAttr ".wl[622].w[20:21]" 0.045711297541856766 0.0020890969317406416;
	setAttr -s 5 ".wl[623].w";
	setAttr ".wl[623].w[0:2]" 0.52390396595001221 0.33832326531410217 
		0.040725823491811752;
	setAttr ".wl[623].w[20:21]" 0.094146117568016052 0.0029008185956627131;
	setAttr -s 5 ".wl[624].w";
	setAttr ".wl[624].w[0:2]" 0.44128340482711792 0.43055146932601929 
		0.087998174130916595;
	setAttr ".wl[624].w[20:21]" 0.038494843989610672 0.0016721729189157486;
	setAttr -s 5 ".wl[625].w";
	setAttr ".wl[625].w[0:2]" 0.45510417222976685 0.44927844405174255 
		0.066588342189788818;
	setAttr ".wl[625].w[20:21]" 0.027872582897543907 0.0011564112501218915;
	setAttr -s 5 ".wl[626].w";
	setAttr ".wl[626].w[0:2]" 0.5631909966468811 0.35086172819137573 
		0.025333143770694733;
	setAttr ".wl[626].w[20:21]" 0.05904625728726387 0.0015678877243772149;
	setAttr -s 5 ".wl[627].w";
	setAttr ".wl[627].w[0:2]" 0.45838558673858643 0.45664474368095398 
		0.058397404849529266;
	setAttr ".wl[627].w[20:21]" 0.025486867874860764 0.0010853566927835345;
	setAttr -s 5 ".wl[628].w";
	setAttr ".wl[628].w[0:2]" 0.46418416500091553 0.46260857582092285 
		0.04827200248837471;
	setAttr ".wl[628].w[20:21]" 0.023929078131914139 0.0010061031207442284;
	setAttr -s 5 ".wl[629].w";
	setAttr ".wl[629].w[0:2]" 0.52099549770355225 0.38830500841140747 
		0.026718160137534142;
	setAttr ".wl[629].w[20:21]" 0.062006000429391861 0.001975376158952713;
	setAttr -s 5 ".wl[630].w";
	setAttr ".wl[630].w[0:2]" 0.6031000018119812 0.15604373812675476 
		0.016007153317332268;
	setAttr ".wl[630].w[20:21]" 0.22075363993644714 0.0040955953299999237;
	setAttr -s 5 ".wl[631].w";
	setAttr ".wl[631].w[0:2]" 0.55628335475921631 0.050615537911653519 
		0.0057039572857320309;
	setAttr ".wl[631].w[20:21]" 0.3828912079334259 0.0045059644617140293;
	setAttr -s 5 ".wl[632].w";
	setAttr ".wl[632].w[0:2]" 0.63779592514038086 0.14677534997463226 
		0.013073391281068325;
	setAttr ".wl[632].w[20:21]" 0.19915571808815002 0.0031996320467442274;
	setAttr -s 5 ".wl[633].w";
	setAttr ".wl[633].w[0:2]" 0.68383127450942993 0.14112898707389832 
		0.009815623052418232;
	setAttr ".wl[633].w[20:21]" 0.1629471629858017 0.0022770026698708534;
	setAttr -s 5 ".wl[634].w";
	setAttr ".wl[634].w[0:2]" 0.60773736238479614 0.03793654590845108 
		0.0032969275489449501;
	setAttr ".wl[634].w[20:21]" 0.34857842326164246 0.0024507159832865;
	setAttr -s 5 ".wl[635].w";
	setAttr ".wl[635].w[0:2]" 0.67388337850570679 0.15976527333259583 
		0.010103374719619751;
	setAttr ".wl[635].w[20:21]" 0.15392079949378967 0.0023271522950381041;
	setAttr -s 5 ".wl[636].w";
	setAttr ".wl[636].w[0:2]" 0.50013101100921631 0.017041247338056564 
		0.0020081852562725544;
	setAttr ".wl[636].w[20:21]" 0.47726073861122131 0.0035588538739830256;
	setAttr -s 5 ".wl[637].w";
	setAttr ".wl[637].w[0:1]" 0.46177452802658081 0.0077653257176280022;
	setAttr ".wl[637].w[20:22]" 0.52518206834793091 0.0043648402206599712 
		0.00091314967721700668;
	setAttr -s 5 ".wl[638].w";
	setAttr ".wl[638].w[0:2]" 0.50345069169998169 0.01443915069103241 
		0.0016265662852674723;
	setAttr ".wl[638].w[20:21]" 0.47761809825897217 0.0028654360212385654;
	setAttr -s 5 ".wl[639].w";
	setAttr ".wl[639].w[0:2]" 0.50951451063156128 0.012547198683023453 
		0.0012910162331536412;
	setAttr ".wl[639].w[20:21]" 0.47443965077400208 0.002207581652328372;
	setAttr -s 5 ".wl[640].w";
	setAttr ".wl[640].w[0:1]" 0.45477917790412903 0.005263160914182663;
	setAttr ".wl[640].w[20:22]" 0.53653144836425781 0.0027878752443939447 
		0.00063830800354480743;
	setAttr -s 5 ".wl[641].w";
	setAttr ".wl[641].w[0:2]" 0.50483149290084839 0.014991985633969307 
		0.0014870493905618787;
	setAttr ".wl[641].w[20:21]" 0.47608616948127747 0.0026033648755401373;
	setAttr -s 5 ".wl[642].w";
	setAttr ".wl[642].w[0:2]" 0.61367464065551758 0.19800469279289246 
		0.013293406926095486;
	setAttr ".wl[642].w[20:21]" 0.17168425023555756 0.0033430431503802538;
	setAttr -s 5 ".wl[643].w";
	setAttr ".wl[643].w[0:2]" 0.57333821058273315 0.059518583118915558 
		0.0048210364766418934;
	setAttr ".wl[643].w[20:21]" 0.35859942436218262 0.0037227941211313009;
	setAttr -s 5 ".wl[644].w";
	setAttr ".wl[644].w[0:2]" 0.50925832986831665 0.012039177119731903 
		0.0011276935692876577;
	setAttr ".wl[644].w[20:21]" 0.47555252909660339 0.0020223301835358143;
	setAttr -s 5 ".wl[645].w";
	setAttr ".wl[645].w[0:1]" 0.45418193936347961 0.006543121300637722;
	setAttr ".wl[645].w[20:22]" 0.53493553400039673 0.00345456856302917 
		0.00088485423475503922;
	setAttr -s 5 ".wl[646].w";
	setAttr ".wl[646].w[0:1]" 0.14687621593475342 0.0014782286016270518;
	setAttr ".wl[646].w[20:22]" 0.84789079427719116 0.0032781108748167753 
		0.00047662714496254921;
	setAttr -s 5 ".wl[647].w";
	setAttr ".wl[647].w[0:1]" 0.18053114414215088 0.0015953569673001766;
	setAttr ".wl[647].w[20:22]" 0.81455129384994507 0.0028854261618107557 
		0.0004367238434497267;
	setAttr -s 5 ".wl[648].w";
	setAttr ".wl[648].w[0:1]" 0.028559193015098572 0.00073034781962633133;
	setAttr ".wl[648].w[20:22]" 0.96129608154296875 0.0086199631914496422 
		0.00079452100908383727;
	setAttr -s 5 ".wl[649].w";
	setAttr ".wl[649].w[0:1]" 0.15643420815467834 0.0020758979953825474;
	setAttr ".wl[649].w[20:22]" 0.83533930778503418 0.0053780605085194111 
		0.0007724844035692513;
	setAttr -s 5 ".wl[650].w";
	setAttr ".wl[650].w[0:1]" 0.19590854644775391 0.0032991552725434303;
	setAttr ".wl[650].w[20:22]" 0.79099231958389282 0.0085342712700366974 
		0.0012657045153900981;
	setAttr -s 5 ".wl[651].w";
	setAttr ".wl[651].w[0:1]" 0.053525190800428391 0.0017178184352815151;
	setAttr ".wl[651].w[20:22]" 0.92143595218658447 0.021250270307064056 
		0.0020706895738840103;
	setAttr -s 5 ".wl[652].w";
	setAttr ".wl[652].w[0:1]" 0.22838982939720154 0.0043975040316581726;
	setAttr ".wl[652].w[20:22]" 0.7548639178276062 0.010695690289139748 
		0.0016530741704627872;
	setAttr -s 5 ".wl[653].w";
	setAttr ".wl[653].w[0:1]" 0.23613664507865906 0.0047244192101061344;
	setAttr ".wl[653].w[20:22]" 0.74607133865356445 0.011277991347014904 
		0.0017895713681355119;
	setAttr -s 5 ".wl[654].w";
	setAttr ".wl[654].w[0:1]" 0.06888888031244278 0.0024629454128444195;
	setAttr ".wl[654].w[20:22]" 0.8955000638961792 0.030010588467121124 
		0.0031375093385577202;
	setAttr -s 5 ".wl[655].w";
	setAttr ".wl[655].w[0:1]" 0.21823267638683319 0.0039895204827189445;
	setAttr ".wl[655].w[20:22]" 0.76662325859069824 0.0095899607986211777 
		0.0015646301908418536;
	setAttr -s 5 ".wl[656].w";
	setAttr ".wl[656].w[0:1]" 0.19650506973266602 0.0032492894679307938;
	setAttr ".wl[656].w[20:22]" 0.79111605882644653 0.0077654174529016018 
		0.00136417499743402;
	setAttr -s 5 ".wl[657].w";
	setAttr ".wl[657].w[0:1]" 0.047741405665874481 0.0015867517795413733;
	setAttr ".wl[657].w[20:22]" 0.92758750915527344 0.020665543153882027 
		0.0024188344832509756;
	setAttr -s 5 ".wl[658].w";
	setAttr ".wl[658].w[0:1]" 0.20422525703907013 0.0037840418517589569;
	setAttr ".wl[658].w[20:22]" 0.78105843067169189 0.0091606704518198967 
		0.0017716005677357316;
	setAttr -s 5 ".wl[659].w";
	setAttr ".wl[659].w[0:1]" 0.20065653324127197 0.0038182013668119907;
	setAttr ".wl[659].w[20:22]" 0.78418058156967163 0.0094491373747587204 
		0.0018955607665702701;
	setAttr -s 5 ".wl[660].w";
	setAttr ".wl[660].w[0:1]" 0.053367283195257187 0.0019188049482181668;
	setAttr ".wl[660].w[20:22]" 0.91601681709289551 0.025145234540104866 
		0.0035519669763743877;
	setAttr -s 5 ".wl[661].w";
	setAttr ".wl[661].w[0:1]" 0.18224994838237762 0.0031833876855671406;
	setAttr ".wl[661].w[20:22]" 0.8049466609954834 0.0080135548487305641 
		0.0016064606606960297;
	setAttr -s 5 ".wl[662].w";
	setAttr ".wl[662].w[0:1]" 0.16698265075683594 0.0027329088188707829;
	setAttr ".wl[662].w[20:22]" 0.82189732789993286 0.0069830934517085552 
		0.0014039460802450776;
	setAttr -s 5 ".wl[663].w";
	setAttr ".wl[663].w[0:1]" 0.039384227246046066 0.0013371264794841409;
	setAttr ".wl[663].w[20:22]" 0.93790531158447266 0.018740596249699593 
		0.0026328458916395903;
	setAttr -s 5 ".wl[664].w";
	setAttr ".wl[664].w[0:1]" 0.15465426445007324 0.0023662971798330545;
	setAttr ".wl[664].w[20:22]" 0.83572882413864136 0.0060264840722084045 
		0.0012241970980539918;
	setAttr -s 5 ".wl[665].w";
	setAttr ".wl[665].w[0:1]" 0.14999786019325256 0.0022810047958046198;
	setAttr ".wl[665].w[20:22]" 0.84065407514572144 0.0058532780967652798 
		0.0012138298479840159;
	setAttr -s 5 ".wl[666].w";
	setAttr ".wl[666].w[0:1]" 0.03284154087305069 0.0010927369585260749;
	setAttr ".wl[666].w[20:22]" 0.94783324003219604 0.015919730067253113 
		0.0023128122556954622;
	setAttr -s 5 ".wl[667].w";
	setAttr ".wl[667].w[0:1]" 0.15554468333721161 0.0023745906073600054;
	setAttr ".wl[667].w[20:22]" 0.83488857746124268 0.0059415651485323906 
		0.0012505936902016401;
	setAttr -s 5 ".wl[668].w";
	setAttr ".wl[668].w[0:1]" 0.0079704076051712036 0.00037227565189823508;
	setAttr ".wl[668].w[20:22]" 0.96773642301559448 0.022762779146432877 
		0.0011581162689253688;
	setAttr -s 5 ".wl[669].w";
	setAttr ".wl[669].w[0:1]" 0.0079681826755404472 0.00037643942050635815;
	setAttr ".wl[669].w[20:22]" 0.96667349338531494 0.023798754438757896 
		0.0011831127339974046;
	setAttr -s 5 ".wl[670].w";
	setAttr ".wl[670].w[0:1]" 0.0025394621770828962 0.00018468894995748997;
	setAttr ".wl[670].w[20:22]" 0.91579389572143555 0.079834073781967163 
		0.0016479232581332326;
	setAttr -s 5 ".wl[671].w";
	setAttr ".wl[671].w[0:1]" 0.010557203553617001 0.00052190443966537714;
	setAttr ".wl[671].w[20:22]" 0.95424133539199829 0.032959781587123871 
		0.0017197069246321917;
	setAttr -s 5 ".wl[672].w";
	setAttr ".wl[672].w[0:1]" 0.015891941264271736 0.0008103785221464932;
	setAttr ".wl[672].w[20:22]" 0.93536406755447388 0.045335598289966583 
		0.0025979860220104456;
	setAttr -s 5 ".wl[673].w";
	setAttr ".wl[673].w[0:1]" 0.0046904422342777252 0.00035657448461279273;
	setAttr ".wl[673].w[20:22]" 0.86396867036819458 0.12772881984710693 
		0.0032555516809225082;
	setAttr -s 5 ".wl[674].w";
	setAttr ".wl[674].w[0:1]" 0.017986664548516273 0.00096958241192623973;
	setAttr ".wl[674].w[20:22]" 0.92023032903671265 0.057468481361865997 
		0.0033449758775532246;
	setAttr -s 5 ".wl[675].w";
	setAttr ".wl[675].w[0:1]" 0.017843259498476982 0.00097191386157646775;
	setAttr ".wl[675].w[20:22]" 0.91883218288421631 0.058850381523370743 
		0.0035022182855755091;
	setAttr -s 5 ".wl[676].w";
	setAttr ".wl[676].w[0:1]" 0.005262449849396944 0.00040447604260407388;
	setAttr ".wl[676].w[20:22]" 0.8527829647064209 0.13767364621162415 
		0.0038765254430472851;
	setAttr -s 5 ".wl[677].w";
	setAttr ".wl[677].w[0:1]" 0.013732285238802433 0.00073290278669446707;
	setAttr ".wl[677].w[20:22]" 0.93468379974365234 0.047965005040168762 
		0.0028860021848231554;
	setAttr -s 5 ".wl[678].w";
	setAttr ".wl[678].w[0:1]" 0.010424381121993065 0.00054639787413179874;
	setAttr ".wl[678].w[20:22]" 0.94891434907913208 0.03761112317442894 
		0.0025037932209670544;
	setAttr -s 5 ".wl[679].w";
	setAttr ".wl[679].w[0:1]" 0.0027844945434480906 0.0002092474460368976;
	setAttr ".wl[679].w[20:22]" 0.90330386161804199 0.090956799685955048 
		0.0027455831877887249;
	setAttr -s 5 ".wl[680].w";
	setAttr ".wl[680].w[0:1]" 0.012976435013115406 0.00070909404894337058;
	setAttr ".wl[680].w[20:22]" 0.93536883592605591 0.047125443816184998 
		0.0038201895076781511;
	setAttr -s 5 ".wl[681].w";
	setAttr ".wl[681].w[0:1]" 0.014884325675666332 0.0008222401374951005;
	setAttr ".wl[681].w[20:22]" 0.92826294898986816 0.051397610455751419 
		0.0046328720636665821;
	setAttr -s 5 ".wl[682].w";
	setAttr ".wl[682].w[0:1]" 0.0045645316131412983 0.00035891676088795066;
	setAttr ".wl[682].w[20:22]" 0.85809558629989624 0.13066872954368591 
		0.0063122296705842018;
	setAttr -s 5 ".wl[683].w";
	setAttr ".wl[683].w[0:1]" 0.012829548679292202 0.00070977350696921349;
	setAttr ".wl[683].w[20:22]" 0.9342464804649353 0.047945141792297363 
		0.0042690555565059185;
	setAttr -s 5 ".wl[684].w";
	setAttr ".wl[684].w[0:1]" 0.012099473737180233 0.00065883406205102801;
	setAttr ".wl[684].w[20:22]" 0.93950700759887695 0.043753542006015778 
		0.003981112502515316;
	setAttr -s 5 ".wl[685].w";
	setAttr ".wl[685].w[0:1]" 0.004126399289816618 0.00032438791822642088;
	setAttr ".wl[685].w[20:22]" 0.86468017101287842 0.1246495321393013 
		0.0062195141799747944;
	setAttr -s 5 ".wl[686].w";
	setAttr ".wl[686].w[0:1]" 0.010622504167258739 0.00058057496789842844;
	setAttr ".wl[686].w[20:22]" 0.94382977485656738 0.041216626763343811 
		0.0037505060900002718;
	setAttr -s 5 ".wl[687].w";
	setAttr ".wl[687].w[0:1]" 0.010673516429960728 0.00058046076446771622;
	setAttr ".wl[687].w[20:22]" 0.94470107555389404 0.040201820433139801 
		0.0038430239073932171;
	setAttr -s 5 ".wl[688].w";
	setAttr ".wl[688].w[0:1]" 0.0038540542591363192 0.00030206824885681272;
	setAttr ".wl[688].w[20:22]" 0.87145555019378662 0.11800194531679153 
		0.0063864067196846008;
	setAttr -s 5 ".wl[689].w";
	setAttr ".wl[689].w[0:1]" 0.0092868143692612648 0.00051396142225712538;
	setAttr ".wl[689].w[20:22]" 0.94670259952545166 0.039835337549448013 
		0.0036613247357308865;
	setAttr -s 5 ".wl[690].w";
	setAttr ".wl[690].w[0:1]" 0.00079294177703559399 7.8568984463345259e-05;
	setAttr ".wl[690].w[20:22]" 0.70400387048721313 0.29326534271240234 
		0.0018592990236356854;
	setAttr -s 5 ".wl[691].w";
	setAttr ".wl[691].w[0:1]" 0.00076256104512140155 7.5202595326118171e-05;
	setAttr ".wl[691].w[20:22]" 0.71201014518737793 0.285419762134552 
		0.001732415403239429;
	setAttr -s 5 ".wl[692].w";
	setAttr ".wl[692].w[0:1]" 0.00025695611839182675 3.2536463550059125e-05;
	setAttr ".wl[692].w[20:22]" 0.49884253740310669 0.49884253740310669 
		0.0020254505798220634;
	setAttr -s 5 ".wl[693].w";
	setAttr ".wl[693].w[0:1]" 0.0011383640812709928 0.00011459828965598717;
	setAttr ".wl[693].w[20:22]" 0.6673969030380249 0.32860776782035828 
		0.0027423566207289696;
	setAttr -s 5 ".wl[694].w";
	setAttr ".wl[694].w[0:1]" 0.0016537141054868698 0.00017213824321515858;
	setAttr ".wl[694].w[20:22]" 0.6172446608543396 0.3766343891620636 
		0.0042950306087732315;
	setAttr -s 5 ".wl[695].w";
	setAttr ".wl[695].w[0:1]" 0.000786096032243222 0.00010190888860961422;
	setAttr ".wl[695].w[20:22]" 0.49653264880180359 0.49653264880180359 
		0.0060466872528195381;
	setAttr -s 5 ".wl[696].w";
	setAttr ".wl[696].w[0:1]" 0.0022932775318622589 0.00023762779892422259;
	setAttr ".wl[696].w[20:22]" 0.61699908971786499 0.37489286065101624 
		0.0055770939216017723;
	setAttr -s 5 ".wl[697].w";
	setAttr ".wl[697].w[0:1]" 0.0024244948290288448 0.00025079073384404182;
	setAttr ".wl[697].w[20:22]" 0.61906075477600098 0.37222793698310852 
		0.006036064587533474;
	setAttr -s 5 ".wl[698].w";
	setAttr ".wl[698].w[0:1]" 0.0013085589744150639 0.00017271225806325674;
	setAttr ".wl[698].w[20:22]" 0.49397987127304077 0.49397987127304077 
		0.010558918118476868;
	setAttr -s 5 ".wl[699].w";
	setAttr ".wl[699].w[0:1]" 0.0019570228178054094 0.00020074019266758114;
	setAttr ".wl[699].w[20:22]" 0.63517343997955322 0.35716941952705383 
		0.0054993974044919014;
	setAttr -s 5 ".wl[700].w";
	setAttr ".wl[700].w[0:1]" 0.0015433409716933966 0.00015712305321358144;
	setAttr ".wl[700].w[20:22]" 0.65687251091003418 0.33587417006492615 
		0.005552828311920166;
	setAttr -s 5 ".wl[701].w";
	setAttr ".wl[701].w[0]" 0.00089765351731330156;
	setAttr ".wl[701].w[20:23]" 0.48668983578681946 0.49974325299263 
		0.012122184038162231 0.00054703425848856568;
	setAttr -s 5 ".wl[702].w";
	setAttr ".wl[702].w[0:1]" 0.0018501784652471542 0.00019273812358733267;
	setAttr ".wl[702].w[20:22]" 0.6307297945022583 0.35815897583961487 
		0.0090683689340949059;
	setAttr -s 5 ".wl[703].w";
	setAttr ".wl[703].w[0:1]" 0.0019751654472202063 0.00020891797612421215;
	setAttr ".wl[703].w[20:22]" 0.61447751522064209 0.37182942032814026 
		0.011508981697261333;
	setAttr -s 5 ".wl[704].w";
	setAttr ".wl[704].w[0]" 0.0008269171230494976;
	setAttr ".wl[704].w[20:23]" 0.38892450928688049 0.58965325355529785 
		0.019867520779371262 0.00072761857882142067;
	setAttr -s 5 ".wl[705].w";
	setAttr ".wl[705].w[0:1]" 0.0017608752241358161 0.00018496184202376753;
	setAttr ".wl[705].w[20:22]" 0.62537497282028198 0.36191681027412415 
		0.010762364603579044;
	setAttr -s 5 ".wl[706].w";
	setAttr ".wl[706].w[0:1]" 0.0014991568168625236 0.00015816326776985079;
	setAttr ".wl[706].w[20:22]" 0.62339413166046143 0.36471894383430481 
		0.01022961363196373;
	setAttr -s 5 ".wl[707].w";
	setAttr ".wl[707].w[0]" 0.00043890048982575536;
	setAttr ".wl[707].w[20:23]" 0.31643015146255493 0.66947054862976074 
		0.013240543194115162 0.00041982479160651565;
	setAttr -s 5 ".wl[708].w";
	setAttr ".wl[708].w[0:1]" 0.0013389452360570431 0.00013927355757914484;
	setAttr ".wl[708].w[20:22]" 0.64344549179077148 0.34576910734176636 
		0.0093071749433875084;
	setAttr -s 5 ".wl[709].w";
	setAttr ".wl[709].w[0:1]" 0.0012484908802434802 0.00012955762213096023;
	setAttr ".wl[709].w[20:22]" 0.64480799436569214 0.34439095854759216 
		0.0094230407848954201;
	setAttr -s 5 ".wl[710].w";
	setAttr ".wl[710].w[0]" 0.00016496769967488945;
	setAttr ".wl[710].w[20:23]" 0.17836558818817139 0.81460809707641602 
		0.0066839898936450481 0.00017738109454512596;
	setAttr -s 5 ".wl[711].w";
	setAttr ".wl[711].w[0:1]" 0.0011573953088372946 0.00011951115448027849;
	setAttr ".wl[711].w[20:22]" 0.65326637029647827 0.33662006258964539 
		0.0088366167619824409;
	setAttr -s 5 ".wl[712].w";
	setAttr ".wl[712].w[0]" 0.00019125214021187276;
	setAttr ".wl[712].w[20:23]" 0.25082752108573914 0.73714077472686768 
		0.011607971042394638 0.00023243528266903013;
	setAttr -s 5 ".wl[713].w";
	setAttr ".wl[713].w[0]" 0.00018072128295898438;
	setAttr ".wl[713].w[20:23]" 0.24997764825820923 0.73857355117797852 
		0.011048932559788227 0.00021917546109762043;
	setAttr -s 5 ".wl[714].w";
	setAttr ".wl[714].w[0]" 5.3961735829943791e-05;
	setAttr ".wl[714].w[20:23]" 0.003742248984053731 0.52689582109451294 
		0.4687977135181427 0.00051031011389568448;
	setAttr -s 5 ".wl[715].w";
	setAttr ".wl[715].w[0]" 0.00029379207990132272;
	setAttr ".wl[715].w[20:23]" 0.27782180905342102 0.7042003870010376 
		0.017321124672889709 0.00036283014924265444;
	setAttr -s 5 ".wl[716].w";
	setAttr ".wl[716].w[0]" 0.0004434073343873024;
	setAttr ".wl[716].w[20:23]" 0.32036158442497253 0.65607684850692749 
		0.022590097039937973 0.00052800530102103949;
	setAttr -s 5 ".wl[717].w";
	setAttr ".wl[717].w[0]" 0.00010509234562050551;
	setAttr ".wl[717].w[20:23]" 0.0068413740955293179 0.51842314004898071 
		0.47364914417266846 0.00098131853155791759;
	setAttr -s 5 ".wl[718].w";
	setAttr ".wl[718].w[0]" 0.00062498095212504268;
	setAttr ".wl[718].w[20:23]" 0.31578171253204346 0.64850896596908569 
		0.034282732754945755 0.00080161087680608034;
	setAttr -s 5 ".wl[719].w";
	setAttr ".wl[719].w[0]" 0.00068809161894023418;
	setAttr ".wl[719].w[20:23]" 0.29664269089698792 0.66029453277587891 
		0.04143315926194191 0.00094156485283747315;
	setAttr -s 5 ".wl[720].w";
	setAttr ".wl[720].w[0]" 0.00010944600217044353;
	setAttr ".wl[720].w[20:23]" 0.0066848229616880417 0.51108449697494507 
		0.48103001713752747 0.0010912377620115876;
	setAttr -s 5 ".wl[721].w";
	setAttr ".wl[721].w[0]" 0.00061021768487989902;
	setAttr ".wl[721].w[20:23]" 0.23612113296985626 0.7142525315284729 
		0.04805954173207283 0.00095653539756312966;
	setAttr -s 5 ".wl[722].w";
	setAttr ".wl[722].w[0]" 0.0004668673500418663;
	setAttr ".wl[722].w[20:23]" 0.1373172402381897 0.79905533790588379 
		0.062206871807575226 0.00095366424648091197;
	setAttr -s 5 ".wl[723].w";
	setAttr ".wl[723].w[0]" 4.9104903155239299e-05;
	setAttr ".wl[723].w[20:23]" 0.002640219172462821 0.50514692068099976 
		0.49151825904846191 0.00064545602072030306;
	setAttr -s 5 ".wl[724].w";
	setAttr ".wl[724].w[0]" 0.00038030993891879916;
	setAttr ".wl[724].w[20:23]" 0.075890257954597473 0.83272469043731689 
		0.089952953159809113 0.0010517712216824293;
	setAttr -s 5 ".wl[725].w";
	setAttr ".wl[725].w[0]" 0.0003318510134704411;
	setAttr ".wl[725].w[20:23]" 0.057517681270837784 0.84120911359786987 
		0.099901407957077026 0.001039951341226697;
	setAttr -s 5 ".wl[726].w[20:24]"  0.0031632851 0.44359073 0.55190808 
		0.0012657082 7.2216222e-05;
	setAttr -s 5 ".wl[727].w";
	setAttr ".wl[727].w[0]" 0.00023702337057329714;
	setAttr ".wl[727].w[20:23]" 0.040969785302877426 0.86779236793518066 
		0.090204313397407532 0.00079653144348412752;
	setAttr -s 5 ".wl[728].w";
	setAttr ".wl[728].w[0]" 0.00017277154256589711;
	setAttr ".wl[728].w[20:23]" 0.030652744695544243 0.89400863647460938 
		0.074568934738636017 0.0005968825425952673;
	setAttr -s 5 ".wl[729].w[20:24]"  0.0026324487 0.4029133 0.59322488 
		0.0011658904 6.348428e-05;
	setAttr -s 5 ".wl[730].w";
	setAttr ".wl[730].w[0]" 8.3400474977679551e-05;
	setAttr ".wl[730].w[20:23]" 0.014759054407477379 0.93200778961181641 
		0.052832625806331635 0.00031707866583019495;
	setAttr -s 5 ".wl[731].w";
	setAttr ".wl[731].w[0]" 3.4510092518758029e-05;
	setAttr ".wl[731].w[20:23]" 0.0059833880513906479 0.96306627988815308 
		0.030773233622312546 0.00014269079838413745;
	setAttr -s 5 ".wl[732].w[20:24]"  0.0013478639 0.29544023 0.70247912 
		0.00069771695 3.5086945e-05;
	setAttr -s 5 ".wl[733].w";
	setAttr ".wl[733].w[0]" 1.4291173101810273e-05;
	setAttr ".wl[733].w[20:23]" 0.0025429986417293549 0.98173815011978149 
		0.015643810853362083 6.0788719565607607e-05;
	setAttr -s 5 ".wl[734].w[20:24]"  0.00086122891 0.030675942 
		0.9524554 0.015717505 0.00028990005;
	setAttr -s 5 ".wl[735].w[20:24]"  0.00080176757 0.028947745 
		0.95496649 0.015010699 0.00027329606;
	setAttr -s 5 ".wl[736].w[20:24]"  0.00014455014 0.0020626448 
		0.94618231 0.051421076 0.00018945441;
	setAttr -s 5 ".wl[737].w[20:24]"  0.0010988995 0.037401933 
		0.9418444 0.019287039 0.00036772463;
	setAttr -s 5 ".wl[738].w[20:24]"  0.0013368875 0.043795537 
		0.93175256 0.022669584 0.00044535738;
	setAttr -s 5 ".wl[739].w[20:24]"  0.00027624072 0.0038132835 
		0.91425437 0.081298158 0.00035795951;
	setAttr -s 5 ".wl[740].w[20:24]"  0.0014085515 0.045447279 
		0.92930359 0.023376714 0.00046402024;
	setAttr -s 5 ".wl[741].w[20:24]"  0.0012687069 0.041442577 
		0.93632561 0.020558124 0.00040493617;
	setAttr -s 5 ".wl[742].w[20:24]"  0.00027788777 0.0037889404 
		0.91705281 0.078529194 0.0003512257;
	setAttr -s 5 ".wl[743].w[20:24]"  0.00087325799 0.029776294 
		0.95557839 0.013513496 0.00025867127;
	setAttr -s 5 ".wl[744].w[20:24]"  0.0004910549 0.017330566 
		0.97543335 0.0066197389 0.00012532969;
	setAttr -s 5 ".wl[745].w[20:24]"  0.00014229232 0.0018845195 
		0.95901 0.038803797 0.00015942118;
	setAttr -s 5 ".wl[746].w[20:24]"  0.00050605729 0.016732384 
		0.97689104 0.005757493 0.00011300969;
	setAttr -s 5 ".wl[747].w[20:24]"  0.0006178667 0.019400608 
		0.97344625 0.0064057354 0.00012960593;
	setAttr -s 5 ".wl[748].w[20:24]"  0.0002224638 0.0027259118 
		0.9507212 0.046107825 0.00022262498;
	setAttr -s 5 ".wl[749].w[20:24]"  0.00061856641 0.019203177 
		0.97382545 0.0062260721 0.00012667508;
	setAttr -s 5 ".wl[750].w[20:24]"  0.00059304922 0.018344112 
		0.9751333 0.0058109774 0.00011858091;
	setAttr -s 5 ".wl[751].w[20:24]"  0.00022263173 0.0026910629 
		0.95259053 0.044278804 0.00021704411;
	setAttr -s 5 ".wl[752].w[20:24]"  0.00047697878 0.014940104 
		0.979904 0.0045860847 9.2787166e-05;
	setAttr -s 5 ".wl[753].w[20:24]"  0.00033210174 0.010617119 
		0.98588568 0.0031030304 6.210366e-05;
	setAttr -s 5 ".wl[754].w[20:24]"  0.00013870606 0.0016761775 
		0.96944708 0.028607171 0.00013085965;
	setAttr -s 5 ".wl[755].w[20:24]"  0.00035959293 0.011196052 
		0.98518246 0.0031970444 6.481204e-05;
	setAttr -s 5 ".wl[756].w[20:24]"  1.4648793e-05 8.7305038e-05 
		0.13779885 0.86184305 0.00025612413;
	setAttr -s 5 ".wl[757].w[20:24]"  7.5735938e-06 4.5366491e-05 
		0.091298789 0.90851378 0.00013445847;
	setAttr -s 5 ".wl[758].w[20:24]"  1.2220187e-05 5.7826826e-05 
		0.012008564 0.98710322 0.00081813312;
	setAttr -s 5 ".wl[759].w[20:24]"  2.6298525e-05 0.00015563624 
		0.18524797 0.81411493 0.00045513545;
	setAttr -s 5 ".wl[760].w[20:24]"  3.7320006e-05 0.00021983421 
		0.21638411 0.78271949 0.00063918956;
	setAttr -s 5 ".wl[761].w[20:24]"  3.2014726e-05 0.00015024467 
		0.027407669 0.970339 0.0020711736;
	setAttr -s 5 ".wl[762].w[20:24]"  4.251031e-05 0.00024932617 
		0.22677335 0.77221066 0.00072431075;
	setAttr -s 5 ".wl[763].w[20:24]"  4.1189916e-05 0.00024034501 
		0.22231515 0.77670664 0.00069666532;
	setAttr -s 5 ".wl[764].w[20:24]"  3.4716471e-05 0.00016163875 
		0.028876094 0.96870548 0.0022220861;
	setAttr -s 5 ".wl[765].w[20:24]"  3.4111221e-05 0.00019691148 
		0.20143981 0.79776007 0.00056915754;
	setAttr -s 5 ".wl[766].w[20:24]"  3.2454136e-05 0.00018302172 
		0.19111517 0.80814785 0.00052141707;
	setAttr -s 5 ".wl[767].w[20:24]"  2.4488711e-05 0.00011056832 
		0.020190217 0.9781456 0.0015291261;
	setAttr -s 5 ".wl[768].w[20:24]"  4.8536815e-05 0.00026555918 
		0.2177375 0.78119719 0.0007513311;
	setAttr -s 5 ".wl[769].w[20:24]"  6.2106417e-05 0.00033482962 
		0.23624553 0.7624163 0.00094117527;
	setAttr -s 5 ".wl[770].w[20:24]"  4.5946123e-05 0.00020001932 
		0.032033343 0.96500683 0.0027138297;
	setAttr -s 5 ".wl[771].w[20:24]"  6.4931657e-05 0.00034829954 
		0.23873837 0.75987077 0.00097773049;
	setAttr -s 5 ".wl[772].w[20:24]"  6.5292748e-05 0.00034896092 
		0.23847319 0.76013553 0.00097702362;
	setAttr -s 5 ".wl[773].w[20:24]"  4.7967584e-05 0.00020727918 
		0.032745767 0.96419299 0.0028059727;
	setAttr -s 5 ".wl[774].w[20:24]"  5.9043257e-05 0.00031462681 
		0.22798839 0.77075636 0.00088160759;
	setAttr -s 5 ".wl[775].w[20:24]"  4.8610676e-05 0.00025831448 
		0.20960099 0.78936982 0.00072236912;
	setAttr -s 5 ".wl[776].w[20:24]"  3.2900305e-05 0.00014136243 
		0.023568369 0.97431934 0.0019380505;
	setAttr -s 5 ".wl[777].w[20:24]"  4.3884018e-05 0.00023180115 
		0.1972508 0.8018226 0.00065088097;
	setAttr -s 5 ".wl[778].w[20:24]"  9.2663813e-06 3.6735564e-05 
		0.0024496985 0.99451321 0.002991111;
	setAttr -s 5 ".wl[779].w[20:24]"  4.9059031e-06 1.951002e-05 
		0.001332425 0.99700511 0.001638056;
	setAttr -s 5 ".wl[780].w[20:24]"  6.9901307e-06 2.3971766e-05 
		0.00076410256 0.98077989 0.018425081;
	setAttr -s 5 ".wl[781].w[20:24]"  1.6486123e-05 6.5109773e-05 
		0.0042062444 0.99056643 0.0051457416;
	setAttr -s 5 ".wl[782].w[20:24]"  2.3414492e-05 9.2242895e-05 
		0.0058269012 0.98695207 0.0071053542;
	setAttr -s 5 ".wl[783].w[20:24]"  1.675432e-05 5.7240701e-05 
		0.001783334 0.96069026 0.037452359;
	setAttr -s 5 ".wl[784].w[20:24]"  2.6401183e-05 0.00010372659 
		0.0064805485 0.98545641 0.0079328865;
	setAttr -s 5 ".wl[785].w[20:24]"  2.4887693e-05 9.738683e-05 
		0.0060884883 0.98630345 0.0074857585;
	setAttr -s 5 ".wl[786].w[20:24]"  1.7483058e-05 5.9412378e-05 
		0.0018431487 0.95962 0.038459938;
	setAttr -s 5 ".wl[787].w[20:24]"  1.9314932e-05 7.4920841e-05 
		0.0047212043 0.98930484 0.0058796993;
	setAttr -s 5 ".wl[788].w[20:24]"  1.6263222e-05 6.1980063e-05 
		0.0038914448 0.99112183 0.0049084779;
	setAttr -s 5 ".wl[789].w[20:24]"  1.0771966e-05 3.5783552e-05 
		0.0011087311 0.97332919 0.025515487;
	setAttr -s 5 ".wl[790].w[20:24]"  2.2554541e-05 8.4189902e-05 
		0.0050792112 0.98820472 0.0066092368;
	setAttr -s 5 ".wl[791].w[20:24]"  2.8708471e-05 0.00010610188 
		0.0062475395 0.98541075 0.0082068341;
	setAttr -s 5 ".wl[792].w[20:24]"  1.7648184e-05 5.7197773e-05 
		0.0017164703 0.9604606 0.037748057;
	setAttr -s 5 ".wl[793].w[20:24]"  2.9949575e-05 0.0001102929 
		0.0064541553 0.98488897 0.0085165985;
	setAttr -s 5 ".wl[794].w[20:24]"  2.9694802e-05 0.00010906185 
		0.0063746031 0.98506337 0.008423279;
	setAttr -s 5 ".wl[795].w[20:24]"  1.8079862e-05 5.8301077e-05 
		0.0017436077 0.95994973 0.038230285;
	setAttr -s 5 ".wl[796].w[20:24]"  2.5558256e-05 9.3640854e-05 
		0.0055130273 0.98703396 0.0073337988;
	setAttr -s 5 ".wl[797].w[20:24]"  1.9082101e-05 6.9727124e-05 
		0.0041690171 0.99016994 0.0055721984;
	setAttr -s 5 ".wl[798].w[20:24]"  1.0929094e-05 3.5068755e-05 
		0.0010587316 0.9734121 0.025483189;
	setAttr -s 5 ".wl[799].w[20:24]"  1.5487083e-05 5.6356712e-05 
		0.0033883248 0.99195153 0.0045882892;
	setAttr -s 5 ".wl[800].w[20:24]"  1.4828355e-05 3.8505998e-05 
		0.00042526188 0.49976072 0.49976072;
	setAttr -s 5 ".wl[801].w[20:24]"  1.1802532e-05 3.0667554e-05 
		0.00033953696 0.49980897 0.49980897;
	setAttr -s 5 ".wl[802].w[20:24]"  1.6384638e-05 4.2537027e-05 
		0.0004696059 0.49973574 0.49973574;
	setAttr -s 5 ".wl[803].w[20:24]"  1.7333654e-05 4.5003453e-05 
		0.00049708341 0.49972031 0.49972031;
	setAttr -s 5 ".wl[804].w[20:24]"  1.7586603e-05 4.5652894e-05 
		0.00050483324 0.49971598 0.49971598;
	setAttr -s 5 ".wl[805].w[20:24]"  1.7792032e-05 4.610727e-05 
		0.00050909881 0.49971351 0.49971351;
	setAttr -s 5 ".wl[806].w[20:24]"  1.7643093e-05 4.5564044e-05 
		0.000502109 0.4997173 0.4997173;
	setAttr -s 5 ".wl[807].w[20:24]"  1.7520289e-05 4.4989963e-05 
		0.0004950533 0.49972126 0.49972126;
	setAttr -s 5 ".wl[808].w[20:24]"  1.8543973e-05 4.7329482e-05 
		0.00051907724 0.49970752 0.49970752;
	setAttr -s 5 ".wl[809].w[20:24]"  1.9246978e-05 4.8987033e-05 
		0.00053641282 0.49969766 0.49969766;
	setAttr -s 5 ".wl[810].w[20:24]"  1.9274703e-05 4.9010589e-05 
		0.00053661776 0.49969754 0.49969754;
	setAttr -s 5 ".wl[811].w[20:24]"  1.9011266e-05 4.8307222e-05 
		0.00052914792 0.4997018 0.4997018;
	setAttr -s 5 ".wl[812].w[20:24]"  1.82122e-05 4.6234683e-05 
		0.00050656992 0.49971446 0.49971446;
	setAttr -s 5 ".wl[813].w[20:24]"  1.6914244e-05 4.2874173e-05 
		0.00046947945 0.49973536 0.49973536;
	setAttr -s 5 ".wl[814].w[20:24]"  1.4078289e-05 3.5630685e-05 
		0.00039043761 0.49977994 0.49977994;
	setAttr -s 5 ".wl[815].w[14:18]"  0.0011199869 0.0034421941 
		0.49750021 0.49750021 0.00043739652;
	setAttr -s 5 ".wl[816].w[14:18]"  0.002444311 0.0070798518 
		0.49476883 0.49476883 0.00093820278;
	setAttr -s 5 ".wl[817].w[14:18]"  0.00066968973 0.0021250285 
		0.49847645 0.49847645 0.00025235745;
	setAttr -s 5 ".wl[818].w[14:18]"  0.0013434353 0.0043133157 
		0.4969033 0.4969033 0.00053668569;
	setAttr -s 5 ".wl[819].w[14:18]"  0.0012740536 0.0039544399 
		0.49713254 0.49713254 0.00050639053;
	setAttr -s 5 ".wl[820].w[14:18]"  0.0022874589 0.8969059 0.10051614 
		0.00023614193 5.4314074e-05;
	setAttr -s 5 ".wl[821].w[14:18]"  0.0044125454 0.92142946 0.073512085 
		0.00054677902 9.9216355e-05;
	setAttr -s 5 ".wl[822].w[14:18]"  0.0035962758 0.94567281 0.050301239 
		0.0003787246 5.0977465e-05;
	setAttr -s 5 ".wl[823].w[14:18]"  0.00064083096 0.79731601 
		0.20195936 6.4346357e-05 1.9460069e-05;
	setAttr -s 5 ".wl[824].w[14:18]"  0.0038589917 0.7966733 0.19893907 
		0.00037925586 0.00014943116;
	setAttr -s 5 ".wl[825].w[14:18]"  0.00013434263 0.53514582 
		0.46469653 1.2112506e-05 1.1189673e-05;
	setAttr -s 5 ".wl[826].w[14:18]"  0.00012821562 0.94351065 
		0.056348205 5.0463468e-06 7.8383655e-06;
	setAttr -s 5 ".wl[827].w[14:18]"  5.711005e-05 0.14842631 0.85150373 
		7.6120241e-06 5.2340606e-06;
	setAttr -s 5 ".wl[828].w[14:18]"  0.00033417033 0.11296831 
		0.88657409 8.5979853e-05 3.7448306e-05;
	setAttr -s 5 ".wl[829].w[14:18]"  0.00037958915 0.62146407 
		0.37809733 2.7709852e-05 3.1326679e-05;
	setAttr -s 5 ".wl[830].w[14:18]"  0.00017768571 0.39585885 
		0.60391891 2.6948272e-05 1.7552786e-05;
	setAttr -s 5 ".wl[831].w[14:18]"  0.00011102456 0.39389473 
		0.60596639 1.6146554e-05 1.1724474e-05;
	setAttr -s 5 ".wl[832].w[14:18]"  0.00027830267 0.1172822 0.88231421 
		9.14376e-05 3.3851164e-05;
	setAttr -s 5 ".wl[833].w[14:18]"  5.312901e-05 0.43018106 0.56975454 
		5.6987242e-06 5.5921259e-06;
	setAttr -s 5 ".wl[834].w[14:18]"  0.00026863604 0.73876566 
		0.26094562 1.2861898e-05 7.2532662e-06;
	setAttr -s 5 ".wl[835].w[14:18]"  0.0001867174 0.49988931 0.49988931 
		1.5950136e-05 1.8742609e-05;
	setAttr -s 5 ".wl[836].w[14:18]"  0.00031746773 0.12668541 
		0.87287033 9.6082462e-05 3.0752872e-05;
	setAttr -s 5 ".wl[837].w[14:18]"  0.00034189818 0.57230061 
		0.4273029 2.4160443e-05 3.0453099e-05;
	setAttr -s 5 ".wl[838].w[14:18]"  0.00026716822 0.98865747 
		0.011063814 6.0425659e-06 5.5457772e-06;
	setAttr -s 5 ".wl[839].w[14:18]"  0.0012389 0.29712135 0.70117915 
		0.00030662975 0.00015404668;
	setAttr -s 5 ".wl[840].w[14:18]"  0.0005902329 0.040062837 
		0.9587785 0.00048456586 8.3931445e-05;
	setAttr -s 5 ".wl[841].w[14:18]"  3.2889217e-05 0.0030968052 
		0.99684078 2.4992767e-05 4.5521028e-06;
	setAttr -s 5 ".wl[842].w[14:18]"  0.00048902183 0.0053415583 
		0.98301703 0.011046267 0.00010619243;
	setAttr -s 5 ".wl[843].w[14:18]"  0.0016595281 0.038868375 
		0.95406693 0.0051006451 0.00030452677;
	setAttr -s 5 ".wl[844].w[14:18]"  9.9469389e-07 9.832767e-05 
		0.99989963 8.37046e-07 1.4589268e-07;
	setAttr -s 5 ".wl[845].w[14:18]"  0.00011322274 0.011374086 
		0.98839724 9.7558972e-05 1.7891451e-05;
	setAttr -s 5 ".wl[846].w[14:18]"  2.6096004e-06 3.6749207e-05 
		0.99992025 3.9748298e-05 5.4558365e-07;
	setAttr -s 5 ".wl[847].w[14:18]"  0.00065660634 0.018929217 
		0.97790003 0.0023774232 0.00013674796;
	setAttr -s 5 ".wl[848].w[14:18]"  0.001614989 0.04143694 0.95090884 
		0.0057018884 0.00033736354;
	setAttr -s 5 ".wl[849].w[14:18]"  0.00057708396 0.0074034785 
		0.97777307 0.014097727 0.00014860545;
	setAttr -s 5 ".wl[850].w[14:18]"  0.001924396 0.043480735 0.94706732 
		0.0071421405 0.00038552977;
	setAttr -s 5 ".wl[851].w[14:18]"  0.0010649713 0.010737059 
		0.94739151 0.040536635 0.00026981303;
	setAttr -s 5 ".wl[852].w[14:18]"  0.00064588769 0.0033147496 
		0.67820954 0.31765082 0.00017903707;
	setAttr -s 5 ".wl[853].w[14:18]"  0.00024252787 0.0014736805 
		0.93844312 0.059781414 5.9304191e-05;
	setAttr -s 5 ".wl[854].w[14:18]"  0.00070970313 0.0028250497 
		0.5156461 0.48061702 0.00020208592;
	setAttr -s 5 ".wl[855].w[14:18]"  0.00068666105 0.0026181869 
		0.49823996 0.49823996 0.00021515328;
	setAttr -s 5 ".wl[856].w[14:18]"  0.0012342171 0.0044053504 
		0.49697381 0.49697381 0.00041280329;
	setAttr -s 5 ".wl[857].w[14:18]"  0.00060080149 0.0030219986 
		0.58813101 0.40806749 0.00017866916;
	setAttr -s 5 ".wl[858].w[14:18]"  0.00023214129 0.0014285145 
		0.94832724 0.049955178 5.6893296e-05;
	setAttr -s 5 ".wl[859].w[14:18]"  0.00083720346 0.0055600693 
		0.87567562 0.1176994 0.000227627;
	setAttr -s 5 ".wl[860].w[14:18]"  0.00050924445 0.0022426068 
		0.66672009 0.33039519 0.00013295223;
	setAttr -s 5 ".wl[861].w[14:18]"  0.00071754813 0.0044376622 
		0.72327721 0.27134001 0.00022758226;
	setAttr -s 5 ".wl[862].w[14:18]"  0.00032183339 0.0019169917 
		0.65723562 0.34041926 0.00010623864;
	setAttr -s 5 ".wl[863].w[14:18]"  0.00051666755 0.002258304 
		0.4985171 0.4985171 0.00019093964;
	setAttr -s 5 ".wl[864].w[14:18]"  0.00074796635 0.0033556148 
		0.50023842 0.49540123 0.00025685172;
	setAttr -s 5 ".wl[865].w[14:18]"  0.0019498072 0.0085662417 
		0.53560132 0.45327222 0.000610438;
	setAttr -s 5 ".wl[866].w[14:18]"  0.00017305394 0.00088998378 
		0.54444206 0.45443892 5.5993176e-05;
	setAttr -s 5 ".wl[867].w[14:18]"  0.000192847 0.0007720507 
		0.49948275 0.49948275 6.9509428e-05;
	setAttr -s 5 ".wl[868].w[14:18]"  0.00081627927 0.0023828489 
		0.49826124 0.49826124 0.00027842954;
	setAttr -s 5 ".wl[869].w[14:18]"  0.0017106222 0.0048538679 
		0.49642316 0.49642316 0.00058918045;
	setAttr -s 5 ".wl[870].w[14:18]"  0.00076182553 0.0022323744 
		0.49838147 0.49838147 0.00024295204;
	setAttr -s 5 ".wl[871].w[14:18]"  0.0018029264 0.0053399112 
		0.49611625 0.49611625 0.00062469277;
	setAttr -s 5 ".wl[872].w[14:18]"  0.00065595249 0.0020078321 
		0.49855012 0.49855012 0.00023603067;
	setAttr -s 5 ".wl[873].w[14:18]"  0.0035454747 0.0086130258 
		0.49344999 0.49344999 0.00094151933;
	setAttr -s 5 ".wl[874].w[14:18]"  0.0038461362 0.0096230684 
		0.49273479 0.49273479 0.0010611559;
	setAttr -s 5 ".wl[875].w[14:18]"  0.0052939239 0.012444117 
		0.49047646 0.49047646 0.0013091376;
	setAttr -s 5 ".wl[876].w[14:18]"  0.0077004703 0.018553592 
		0.48581398 0.48581398 0.0021179747;
	setAttr -s 5 ".wl[877].w[14:18]"  0.0015350023 0.004202635 
		0.49691021 0.49691021 0.00044199688;
	setAttr -s 5 ".wl[878].w[14:18]"  0.0016435832 0.0054551233 
		0.49616116 0.49616116 0.00057903735;
	setAttr -s 5 ".wl[879].w[14:18]"  0.00058811886 0.0021024237 
		0.49855319 0.49855319 0.00020308689;
	setAttr -s 5 ".wl[880].w[14:18]"  0.0015066259 0.0049390122 
		0.49650794 0.49650794 0.00053852092;
	setAttr -s 5 ".wl[881].w[14:18]"  0.0012132119 0.0041204924 
		0.49711472 0.49711472 0.00043681572;
	setAttr -s 5 ".wl[882].w[14:18]"  3.2191932e-05 0.00012901814 
		0.49991378 0.49991378 1.1227889e-05;
	setAttr -s 5 ".wl[883].w[14:18]"  2.6751322e-05 0.00010750543 
		0.49992824 0.49992824 9.2834034e-06;
	setAttr -s 5 ".wl[884].w[14:18]"  0.00021397509 0.00087805791 
		0.49941477 0.49941477 7.844068e-05;
	setAttr -s 5 ".wl[885].w[14:18]"  6.3491127e-05 0.00024400154 
		0.49983501 0.49983501 2.2473869e-05;
	setAttr -s 5 ".wl[886].w[14:18]"  0.00057233125 0.0022981646 
		0.49845517 0.49845517 0.00021913493;
	setAttr -s 5 ".wl[887].w[14:18]"  0.00038510191 0.001521148 
		0.4989728 0.4989728 0.00014811796;
	setAttr -s 5 ".wl[888].w[14:18]"  0.00055074273 0.0021342323 
		0.49855161 0.49855161 0.00021179889;
	setAttr -s 5 ".wl[889].w[14:18]"  0.0003183801 0.0011922067 
		0.49918568 0.49918568 0.00011810511;
	setAttr -s 5 ".wl[890].w[14:18]"  0.00037531016 0.0013645421 
		0.49905968 0.49905968 0.00014081808;
	setAttr -s 5 ".wl[891].w[14:18]"  0.0024332635 0.0072958153 
		0.49468267 0.49468267 0.00090566947;
	setAttr -s 5 ".wl[892].w[14:18]"  0.0011157052 0.0035464854 
		0.49746603 0.49746603 0.00040572931;
	setAttr -s 5 ".wl[893].w[14:18]"  0.0019386199 0.0059505911 
		0.4956874 0.4956874 0.00073596172;
	setAttr -s 5 ".wl[894].w[14:18]"  0.00026086491 0.00089787104 
		0.49937299 0.49937299 9.5290336e-05;
	setAttr -s 5 ".wl[895].w[14:18]"  0.00056181924 0.0019856973 
		0.49861965 0.49861965 0.00021323413;
	setAttr -s 5 ".wl[896].w[14:18]"  0.0011066577 0.0038489138 
		0.49730295 0.49730295 0.00043850855;
	setAttr -s 5 ".wl[897].w[14:18]"  0.00085735036 0.0029709006 
		0.49791467 0.49791467 0.0003424318;
	setAttr -s 5 ".wl[898].w[14:18]"  0.00081949565 0.0027085806 
		0.49807623 0.49807623 0.00031942702;
	setAttr -s 5 ".wl[899].w[14:18]"  0.0006438925 0.0023135885 
		0.49841666 0.49841666 0.00020912908;
	setAttr -s 5 ".wl[900].w[14:18]"  0.00016979077 0.00065228093 
		0.49956247 0.49956247 5.2972919e-05;
	setAttr -s 5 ".wl[901].w[14:18]"  0.00055496412 0.0019430348 
		0.49865994 0.49865994 0.00018213001;
	setAttr -s 5 ".wl[902].w[14:18]"  0.0003488225 0.0012848255 
		0.49912465 0.49912465 0.00011702592;
	setAttr -s 5 ".wl[903].w[14:18]"  6.8200952e-06 2.8671537e-05 
		0.49998119 0.49998119 2.1214364e-06;
	setAttr -s 5 ".wl[904].w[14:18]"  9.5657833e-06 4.0198836e-05 
		0.49997368 0.49997368 2.9483376e-06;
	setAttr -s 5 ".wl[905].w[14:18]"  0.00032868274 0.0013792489 
		0.4990921 0.4990921 0.00010787891;
	setAttr -s 5 ".wl[906].w[14:18]"  2.0611904e-05 8.1369762e-05 
		0.49994579 0.49994579 6.4674205e-06;
	setAttr -s 5 ".wl[907].w[14:18]"  0.00061557919 0.0025453994 
		0.49831247 0.49831247 0.00021404112;
	setAttr -s 5 ".wl[908].w[14:18]"  0.00016668568 0.00069466769 
		0.49953979 0.49953979 5.9033406e-05;
	setAttr -s 5 ".wl[909].w[14:18]"  0.00053315557 0.0020960879 
		0.498593 0.498593 0.000184738;
	setAttr -s 5 ".wl[910].w[14:18]"  2.1038511e-05 8.4824191e-05 
		0.49994344 0.49994344 7.2544367e-06;
	setAttr -s 5 ".wl[911].w[14:18]"  3.7233709e-05 0.00014358987 
		0.49990311 0.49990311 1.2924438e-05;
	setAttr -s 5 ".wl[912].w[14:18]"  0.0014790978 0.0044893511 
		0.49676457 0.49676457 0.00050242891;
	setAttr -s 5 ".wl[913].w[14:18]"  0.00065146713 0.0020674723 
		0.49853593 0.49853593 0.00020915356;
	setAttr -s 5 ".wl[914].w[14:18]"  0.00091314735 0.0028814734 
		0.49794227 0.49794227 0.00032087596;
	setAttr -s 5 ".wl[915].w[14:18]"  0.00028730344 0.00094338763 
		0.49933967 0.49933967 9.0004964e-05;
	setAttr -s 5 ".wl[916].w[14:18]"  0.0010461401 0.0034640129 
		0.49757382 0.49757382 0.00034227417;
	setAttr -s 5 ".wl[917].w[14:18]"  0.0015366877 0.0050676637 
		0.49642912 0.49642912 0.00053732982;
	setAttr -s 5 ".wl[918].w[14:18]"  0.00059334683 0.0020420263 
		0.49857506 0.49857506 0.00021447439;
	setAttr -s 5 ".wl[919].w[14:18]"  0.00027395433 0.00091907789 
		0.49935439 0.49935439 9.8251076e-05;
	setAttr -s 5 ".wl[920].w[14:18]"  0.00069902767 0.0025890868 
		0.50010669 0.49640551 0.00019976366;
	setAttr -s 5 ".wl[921].w[14:18]"  0.00055549789 0.0021241971 
		0.52832472 0.46884549 0.00015000015;
	setAttr -s 5 ".wl[922].w[14:18]"  0.00075381051 0.0026610033 
		0.49818552 0.49818552 0.00021420227;
	setAttr -s 5 ".wl[923].w[14:18]"  0.00019873548 0.00076989306 
		0.49948606 0.49948606 5.9176436e-05;
	setAttr -s 5 ".wl[924].w[14:18]"  0.00051681045 0.0020796678 
		0.56984073 0.42742422 0.00013845525;
	setAttr -s 5 ".wl[925].w[14:18]"  0.0019925188 0.0078209313 
		0.53321654 0.45640042 0.0005696452;
	setAttr -s 5 ".wl[926].w[14:18]"  0.00076319376 0.0028161115 
		0.52838802 0.4678295 0.00020313784;
	setAttr -s 5 ".wl[927].w[14:18]"  0.0022897623 0.0090086022 
		0.51193911 0.47606197 0.00070063409;
	setAttr -s 5 ".wl[928].w[14:18]"  0.00061091274 0.0025330898 
		0.50434035 0.49232441 0.00019124907;
	setAttr -s 5 ".wl[929].w[14:18]"  0.0023149385 0.0085237296 
		0.50247866 0.4859876 0.00069510919;
	setAttr -s 5 ".wl[930].w[14:18]"  1.3299481e-05 5.5849174e-05 
		0.4999634 0.4999634 4.0625964e-06;
	setAttr -s 5 ".wl[931].w[14:18]"  5.2199015e-05 0.00020486338 
		0.49986359 0.49986359 1.5780719e-05;
	setAttr -s 5 ".wl[932].w[14:18]"  0.0025001382 0.0071693617 
		0.49481246 0.49481246 0.00070559321;
	setAttr -s 5 ".wl[933].w[14:18]"  0.0024940968 0.0071091112 
		0.49487168 0.49487168 0.00065348961;
	setAttr -s 5 ".wl[934].w[14:18]"  0.0010107185 0.0031127029 
		0.49778897 0.49778897 0.00029866869;
	setAttr -s 5 ".wl[935].w[14:18]"  0.0030921237 0.0085858256 
		0.49411881 0.4934251 0.00077828567;
	setAttr -s 5 ".wl[936].w[14:18]"  0.0059272279 0.016528439 
		0.48920816 0.48674408 0.0015920061;
	setAttr -s 5 ".wl[937].w[14:18]"  0.006030763 0.017228821 0.48749533 
		0.48749533 0.0017496948;
	setAttr -s 5 ".wl[938].w[14:18]"  0.0021289745 0.0066780671 
		0.49527559 0.49527559 0.00064178032;
	setAttr -s 5 ".wl[939].w[14:18]"  0.00047063793 0.0015062519 
		0.49894142 0.49894142 0.00014030102;
	setAttr -s 5 ".wl[940].w";
	setAttr ".wl[940].w[13:16]" 0.19977015256881714 0.50955861806869507 
		0.27003401517868042 0.020633872598409653;
	setAttr ".wl[940].w[18]" 3.3479964258731343e-06;
	setAttr -s 5 ".wl[941].w";
	setAttr ".wl[941].w[13:16]" 0.23921635746955872 0.52223211526870728 
		0.23212516307830811 0.0064009553752839565;
	setAttr ".wl[941].w[18]" 2.5446564904996194e-05;
	setAttr -s 5 ".wl[942].w";
	setAttr ".wl[942].w[13:16]" 0.26918706297874451 0.5138353705406189 
		0.2140924334526062 0.0028198524378240108;
	setAttr ".wl[942].w[18]" 6.5186228312086314e-05;
	setAttr -s 5 ".wl[943].w";
	setAttr ".wl[943].w[13:16]" 0.42273017764091492 0.48590853810310364 
		0.085935443639755249 0.0014203699538484216;
	setAttr ".wl[943].w[18]" 0.0040054670535027981;
	setAttr -s 5 ".wl[944].w";
	setAttr ".wl[944].w[13:16]" 0.47480860352516174 0.48212826251983643 
		0.040533918887376785 0.0013678569812327623;
	setAttr ".wl[944].w[18]" 0.0011614025570452213;
	setAttr -s 5 ".wl[945].w";
	setAttr ".wl[945].w[13:16]" 0.08713676780462265 0.63516467809677124 
		0.26975643634796143 0.0077102761715650558;
	setAttr ".wl[945].w[18]" 0.00023182456789072603;
	setAttr -s 4 ".wl[946].w[13:16]"  0.052367792 0.66682583 0.27660167 
		0.0042047095;
	setAttr -s 5 ".wl[947].w";
	setAttr ".wl[947].w[13:16]" 0.066333703696727753 0.62607860565185547 
		0.30718153715133667 0.00010234498040517792;
	setAttr ".wl[947].w[18]" 0.00030374896596185863;
	setAttr -s 5 ".wl[948].w[14:18]"  0.4213776 0.57723522 3.6131947e-05 
		0.0013473484 3.7854441e-06;
	setAttr -s 5 ".wl[949].w[14:18]"  0.14911889 0.85014677 0.00050161761 
		0.00020071567 3.202317e-05;
	setAttr -s 5 ".wl[950].w";
	setAttr ".wl[950].w[14:16]" 0.0012168720131739974 0.0038309223018586636 
		0.00048793238238431513;
	setAttr ".wl[950].w[18:19]" 0.49723213911056519 0.49723213911056519;
	setAttr -s 5 ".wl[951].w";
	setAttr ".wl[951].w[14:16]" 0.0018158316379413009 0.0055251987650990486 
		0.00071010686224326491;
	setAttr ".wl[951].w[18:19]" 0.49597445130348206 0.49597445130348206;
	setAttr -s 5 ".wl[952].w";
	setAttr ".wl[952].w[14:16]" 0.0023957663215696812 0.0070252716541290283 
		0.00092810526257380843;
	setAttr ".wl[952].w[18:19]" 0.49482542276382446 0.49482542276382446;
	setAttr -s 5 ".wl[953].w";
	setAttr ".wl[953].w[14:16]" 0.0010670112678781152 0.0033265836536884308 
		0.00042039089021272957;
	setAttr ".wl[953].w[18:19]" 0.49759304523468018 0.49759304523468018;
	setAttr -s 5 ".wl[954].w[14:18]"  0.1436764 0.85511833 8.4266925e-05 
		0.0010919146 2.9100353e-05;
	setAttr -s 5 ".wl[955].w";
	setAttr ".wl[955].w[13:16]" 0.14210906624794006 0.53930360078811646 
		0.31858387589454651 3.9060844869709399e-07;
	setAttr ".wl[955].w[18]" 3.0593432711611968e-06;
	setAttr -s 4 ".wl[956].w";
	setAttr ".wl[956].w[13:15]" 0.26007193326950073 0.59449511766433716 
		0.14542871713638306;
	setAttr ".wl[956].w[18]" 4.1503112697682809e-06;
	setAttr -s 5 ".wl[957].w";
	setAttr ".wl[957].w[13:16]" 0.29466146230697632 0.54207789897918701 
		0.1607307642698288 0.001347103388980031;
	setAttr ".wl[957].w[18]" 0.0011828176211565733;
	setAttr -s 5 ".wl[958].w";
	setAttr ".wl[958].w[13:16]" 0.47633495926856995 0.49840843677520752 
		0.019380677491426468 0.00096504698740318418;
	setAttr ".wl[958].w[18]" 0.0049108364619314671;
	setAttr -s 5 ".wl[959].w";
	setAttr ".wl[959].w[13:16]" 0.48048484325408936 0.50381046533584595 
		0.015357231721282005 5.8429061027709395e-05;
	setAttr ".wl[959].w[18]" 0.00028911419212818146;
	setAttr -s 5 ".wl[960].w[20:24]"  6.9785376e-05 0.00017005918 
		0.0015888283 0.49908563 0.49908563;
	setAttr -s 5 ".wl[961].w[20:24]"  6.7919194e-05 0.00016527298 
		0.001551949 0.49910739 0.49910739;
	setAttr -s 5 ".wl[962].w[20:24]"  7.1218201e-05 0.0001761727 
		0.001655057 0.49904874 0.49904874;
	setAttr -s 5 ".wl[963].w[20:24]"  7.1842253e-05 0.0001770469 
		0.0016581279 0.49904653 0.49904653;
	setAttr -s 5 ".wl[964].w[20:24]"  7.1122442e-05 0.00017551745 
		0.0016509673 0.49905124 0.49905124;
	setAttr -s 5 ".wl[965].w[20:24]"  7.0688373e-05 0.00017506865 
		0.0016511609 0.49905154 0.49905154;
	setAttr -s 5 ".wl[966].w";
	setAttr ".wl[966].w[13:16]" 0.48541021347045898 0.49155884981155396 
		0.017403196543455124 0.0054892702028155327;
	setAttr ".wl[966].w[18]" 0.00013849714014213532;
	setAttr -s 5 ".wl[967].w";
	setAttr ".wl[967].w[1:3]" 0.15407846868038177 0.44093546271324158 
		0.0048942430876195431;
	setAttr ".wl[967].w[8]" 0.0043260329402983189;
	setAttr ".wl[967].w[13]" 0.39576578140258789;
	setAttr -s 5 ".wl[968].w";
	setAttr ".wl[968].w[2:3]" 0.37173375487327576 0.0033225868828594685;
	setAttr ".wl[968].w[13:15]" 0.37175086140632629 0.25158977508544922 
		0.0016030706465244293;
	setAttr -s 5 ".wl[969].w";
	setAttr ".wl[969].w[2:3]" 0.34530293941497803 0.0034967728424817324;
	setAttr ".wl[969].w[13:15]" 0.35715475678443909 0.29225420951843262 
		0.0017914250493049622;
	setAttr -s 5 ".wl[970].w";
	setAttr ".wl[970].w[13:16]" 0.48649746179580688 0.48945868015289307 
		0.01961488276720047 0.0021952579263597727;
	setAttr ".wl[970].w[18]" 0.0022337348200380802;
	setAttr -s 5 ".wl[971].w";
	setAttr ".wl[971].w[13:16]" 0.30662333965301514 0.50771963596343994 
		0.17097705602645874 0.014409228228032589;
	setAttr ".wl[971].w[18]" 0.00027071282966062427;
	setAttr -s 5 ".wl[972].w";
	setAttr ".wl[972].w[14:16]" 0.36523211002349854 0.60957455635070801 
		5.5088557928684168e-06;
	setAttr ".wl[972].w[18:19]" 3.3364331102347933e-06 0.025184560567140579;
	setAttr -s 5 ".wl[973].w";
	setAttr ".wl[973].w[14:16]" 0.24759206175804138 0.74633532762527466 
		6.0403097450034693e-05;
	setAttr ".wl[973].w[18:19]" 0.0023820882197469473 0.0036301040090620518;
	setAttr -s 5 ".wl[974].w";
	setAttr ".wl[974].w[14:16]" 0.2573678195476532 0.7386205792427063 
		0.0038385172374546528;
	setAttr ".wl[974].w[18:19]" 0.00015855429228395224 1.4523345271300059e-05;
	setAttr -s 5 ".wl[975].w";
	setAttr ".wl[975].w[14:16]" 0.0098375622183084488 0.95827853679656982 
		9.4573251772089861e-06;
	setAttr ".wl[975].w[18:19]" 0.03185378760099411 2.0667579519795254e-05;
	setAttr -s 4 ".wl[976].w[14:17]"  0.16368715 0.83531797 0.00017020636 
		0.00082471402;
	setAttr -s 5 ".wl[977].w";
	setAttr ".wl[977].w[13:16]" 0.045936062932014465 0.60661840438842773 
		0.34308281540870667 0.0043563768267631531;
	setAttr ".wl[977].w[18]" 6.4144314819714054e-06;
	setAttr -s 5 ".wl[978].w";
	setAttr ".wl[978].w[13:16]" 0.42672410607337952 0.4874269962310791 
		0.081107348203659058 0.00033520700526423752;
	setAttr ".wl[978].w[18]" 0.0044063306413590908;
	setAttr -s 4 ".wl[979].w";
	setAttr ".wl[979].w[13:15]" 0.45801404118537903 0.48278987407684326 
		0.058781646192073822;
	setAttr ".wl[979].w[18]" 0.00041445923852734268;
	setAttr -s 5 ".wl[980].w";
	setAttr ".wl[980].w[1:3]" 0.20582698285579681 0.38906872272491455 
		0.010493684560060501;
	setAttr ".wl[980].w[8]" 0.0055417874827980995;
	setAttr ".wl[980].w[13]" 0.38906872272491455;
	setAttr -s 5 ".wl[981].w";
	setAttr ".wl[981].w[13:16]" 0.44799122214317322 0.48320803046226501 
		0.064259238541126251 0.0007115495391190052;
	setAttr ".wl[981].w[18]" 0.0038299954030662775;
	setAttr -s 5 ".wl[982].w";
	setAttr ".wl[982].w[1:3]" 0.18286037445068359 0.39497193694114685 
		0.0088776601478457451;
	setAttr ".wl[982].w[8]" 0.018337918445467949;
	setAttr ".wl[982].w[13]" 0.3949522078037262;
	setAttr -s 5 ".wl[983].w";
	setAttr ".wl[983].w[1:3]" 0.16569723188877106 0.41444578766822815 
		0.0063261957839131355;
	setAttr ".wl[983].w[8]" 0.015569110400974751;
	setAttr ".wl[983].w[13]" 0.39796164631843567;
	setAttr -s 5 ".wl[984].w";
	setAttr ".wl[984].w[13:16]" 0.46366950869560242 0.49817073345184326 
		0.036169108003377914 0.0016477575991302729;
	setAttr ".wl[984].w[18]" 0.00034283762215636671;
	setAttr -s 5 ".wl[985].w";
	setAttr ".wl[985].w[13:16]" 0.44085642695426941 0.54778480529785156 
		0.011311030946671963 1.4473840792561532e-06;
	setAttr ".wl[985].w[18]" 4.6358822146430612e-05;
	setAttr -s 5 ".wl[986].w";
	setAttr ".wl[986].w[13:16]" 0.3765091598033905 0.59570717811584473 
		0.021104224026203156 2.4622163437015843e-06;
	setAttr ".wl[986].w[18]" 0.0066769602708518505;
	setAttr -s 5 ".wl[987].w";
	setAttr ".wl[987].w[13:16]" 0.35938403010368347 0.58085626363754272 
		0.046372752636671066 0.0001784373598638922;
	setAttr ".wl[987].w[18]" 0.013208595104515553;
	setAttr -s 5 ".wl[988].w";
	setAttr ".wl[988].w[13:16]" 0.27668136358261108 0.64241617918014526 
		0.073531992733478546 0.00017007217684295028;
	setAttr ".wl[988].w[18]" 0.0072005251422524452;
	setAttr -s 5 ".wl[989].w";
	setAttr ".wl[989].w[13:16]" 0.17885351181030273 0.54806238412857056 
		0.2689860463142395 0.00033136771526187658;
	setAttr ".wl[989].w[18]" 0.0037667574360966682;
	setAttr -s 5 ".wl[990].w";
	setAttr ".wl[990].w[13:16]" 0.35858830809593201 0.51745778322219849 
		0.12166124582290649 6.4160223701037467e-05;
	setAttr ".wl[990].w[18]" 0.0022285664454102516;
	setAttr -s 4 ".wl[991].w[13:16]"  0.30754775 0.52842641 0.16402529 
		5.5301058e-07;
	setAttr -s 4 ".wl[992].w[13:16]"  0.33824757 0.52528602 0.13646561 
		7.5396531e-07;
	setAttr -s 5 ".wl[993].w[14:18]"  0.49371406 0.49598083 0.0057118582 
		0.0045858137 7.3424039e-06;
	setAttr -s 5 ".wl[994].w[14:18]"  0.40906444 0.58660781 0.0021221887 
		0.0021961869 9.3487388e-06;
	setAttr -s 4 ".wl[995].w[13:16]"  0.043950595 0.4985272 0.4574987 
		2.3540999e-05;
	setAttr -s 5 ".wl[996].w";
	setAttr ".wl[996].w[13:16]" 0.083357423543930054 0.50708955526351929 
		0.40808823704719543 0.00023498650989495218;
	setAttr ".wl[996].w[18]" 0.0012299007503315806;
	setAttr -s 5 ".wl[997].w";
	setAttr ".wl[997].w[13:16]" 0.11953133344650269 0.6348997950553894 
		0.24484525620937347 0.00013335056428331882;
	setAttr ".wl[997].w[18]" 0.0005902978009544313;
	setAttr -s 5 ".wl[998].w[14:18]"  0.35450575 0.64419734 0.00020314721 
		0.0010825071 1.1295686e-05;
	setAttr -s 5 ".wl[999].w[14:18]"  0.0084090261 0.98718202 1.2140028e-05 
		1.5320689e-05 0.00438153;
	setAttr -s 5 ".wl[1000].w";
	setAttr ".wl[1000].w[14:16]" 0.0053596179932355881 0.71311205625534058 
		8.2894448496517725e-06;
	setAttr ".wl[1000].w[18:19]" 0.28140184283256531 0.00011823120439657941;
	setAttr -s 5 ".wl[1001].w";
	setAttr ".wl[1001].w[14:16]" 0.042875401675701141 0.94418549537658691 
		1.2558223716041539e-05;
	setAttr ".wl[1001].w[18:19]" 0.0092112226411700249 0.0037153069861233234;
	setAttr -s 5 ".wl[1002].w[14:18]"  0.015752865 0.97804022 9.7965094e-06 
		5.8331854e-05 0.0061388165;
	setAttr -s 5 ".wl[1003].w";
	setAttr ".wl[1003].w[2:3]" 0.30903688073158264 0.0016026046359911561;
	setAttr ".wl[1003].w[13:15]" 0.34240126609802246 0.33931359648704529 
		0.0076455892994999886;
	setAttr -s 5 ".wl[1004].w";
	setAttr ".wl[1004].w[2:3]" 0.31547874212265015 0.00093256781110540032;
	setAttr ".wl[1004].w[13:15]" 0.34003728628158569 0.33546340465545654 
		0.0080879814922809601;
	setAttr -s 5 ".wl[1005].w";
	setAttr ".wl[1005].w[2:3]" 0.32221639156341553 0.00024287248379550874;
	setAttr ".wl[1005].w[13:15]" 0.33748120069503784 0.3313697874546051 
		0.0086896810680627823;
	setAttr -s 5 ".wl[1006].w";
	setAttr ".wl[1006].w[2:3]" 0.314170241355896 0.0054496354423463345;
	setAttr ".wl[1006].w[13:15]" 0.33688715100288391 0.33459359407424927 
		0.0088994400575757027;
	setAttr -s 5 ".wl[1007].w[20:24]"  6.9411726e-05 0.00016913973 
		0.0015906531 0.49908537 0.49908537;
	setAttr -s 5 ".wl[1008].w[20:24]"  5.0184964e-05 0.00012355279 
		0.0012095433 0.49930835 0.49930835;
	setAttr -s 5 ".wl[1009].w[20:24]"  5.1202402e-05 0.00012617395 
		0.0012355308 0.49929351 0.49929351;
	setAttr -s 5 ".wl[1010].w[20:24]"  6.9892456e-05 0.00017050192 
		0.0016059006 0.49907681 0.49907681;
	setAttr -s 5 ".wl[1011].w[20:24]"  7.0531234e-05 0.00017234759 
		0.0016200548 0.49906853 0.49906853;
	setAttr -s 5 ".wl[1012].w[20:24]"  5.1495754e-05 0.00012729543 
		0.001245126 0.49928802 0.49928802;
	setAttr -s 5 ".wl[1013].w[20:24]"  5.0960985e-05 0.0001265982 
		0.0012390307 0.49929169 0.49929169;
	setAttr -s 5 ".wl[1014].w[20:24]"  7.0432361e-05 0.00017289812 
		0.0016249933 0.49906585 0.49906585;
	setAttr -s 5 ".wl[1015].w[20:24]"  7.1349044e-05 0.0001748841 
		0.0016358646 0.49905896 0.49905896;
	setAttr -s 5 ".wl[1016].w[20:24]"  7.1040733e-05 0.00017486693 
		0.0016323727 0.49906084 0.49906084;
	setAttr -s 5 ".wl[1017].w[20:24]"  7.0230439e-05 0.00017195701 
		0.0016041623 0.49907684 0.49907684;
	setAttr -s 5 ".wl[1018].w";
	setAttr ".wl[1018].w[13:16]" 0.47045427560806274 0.47469621896743774 
		0.054690852761268616 7.976571396284271e-06;
	setAttr ".wl[1018].w[18]" 0.0001507302513346076;
	setAttr -s 5 ".wl[1019].w";
	setAttr ".wl[1019].w[1:3]" 0.21313133835792542 0.39014333486557007 
		0.0054171592928469181;
	setAttr ".wl[1019].w[8]" 0.00116483133751899;
	setAttr ".wl[1019].w[13]" 0.39014333486557007;
	setAttr -s 5 ".wl[1020].w";
	setAttr ".wl[1020].w[1:3]" 0.21658873558044434 0.38153555989265442 
		0.010208806954324245;
	setAttr ".wl[1020].w[8]" 0.010131312534213066;
	setAttr ".wl[1020].w[13]" 0.38153555989265442;
	setAttr -s 5 ".wl[1021].w[20:24]"  4.9774957e-05 0.00012470162 
		0.0012174186 0.49930409 0.49930409;
	setAttr -s 5 ".wl[1022].w[20:24]"  7.0422357e-05 0.00017403049 
		0.0016297073 0.49906293 0.49906293;
	setAttr -s 5 ".wl[1023].w";
	setAttr ".wl[1023].w[2:3]" 0.32778570055961609 0.0044169938191771507;
	setAttr ".wl[1023].w[13:15]" 0.351186603307724 0.31437030434608459 
		0.0022403872571885586;
	setAttr -s 5 ".wl[1024].w";
	setAttr ".wl[1024].w[14:16]" 0.0036996628623455763 0.80508202314376831 
		9.3196058514877222e-06;
	setAttr ".wl[1024].w[18:19]" 0.19117337465286255 3.5721448512049392e-05;
	setAttr -s 5 ".wl[1025].w";
	setAttr ".wl[1025].w[13:16]" 0.22061730921268463 0.53538870811462402 
		0.22577376663684845 0.018218649551272392;
	setAttr ".wl[1025].w[18]" 1.4660245142295025e-06;
	setAttr -s 5 ".wl[1026].w";
	setAttr ".wl[1026].w[14:16]" 0.17440116405487061 0.82508790493011475 
		0.00035784597275778651;
	setAttr ".wl[1026].w[18:19]" 7.0519170549232513e-05 8.2529797509778291e-05;
	setAttr -s 5 ".wl[1027].w";
	setAttr ".wl[1027].w[13:16]" 0.044909771531820297 0.47842273116111755 
		0.47511193156242371 0.0015454660169780254;
	setAttr ".wl[1027].w[18]" 1.0060630302177742e-05;
	setAttr -s 5 ".wl[1028].w[14:18]"  0.49512306 0.50174242 0.0013776687 
		0.0017546905 2.0616444e-06;
	setAttr -s 5 ".wl[1029].w";
	setAttr ".wl[1029].w[13:16]" 0.17607294023036957 0.53751468658447266 
		0.2657732367515564 0.020635068416595459;
	setAttr ".wl[1029].w[18]" 4.0614022509544156e-06;
	setAttr -s 5 ".wl[1030].w";
	setAttr ".wl[1030].w[13:16]" 0.41309946775436401 0.51713317632675171 
		0.054813846945762634 1.2864554264524486e-05;
	setAttr ".wl[1030].w[18]" 0.014940559864044189;
	setAttr -s 5 ".wl[1031].w";
	setAttr ".wl[1031].w[13:16]" 0.45053523778915405 0.50829935073852539 
		0.040158115327358246 0.00077480787876993418;
	setAttr ".wl[1031].w[18]" 0.00023247700300998986;
	setAttr -s 5 ".wl[1032].w";
	setAttr ".wl[1032].w[13:16]" 0.16555407643318176 0.64513009786605835 
		0.15827034413814545 0.030784573405981064;
	setAttr ".wl[1032].w[18]" 0.00026097509544342756;
	setAttr -s 5 ".wl[1033].w";
	setAttr ".wl[1033].w[13:16]" 0.3398088812828064 0.54740446805953979 
		0.079381853342056274 2.8735255909850821e-05;
	setAttr ".wl[1033].w[18]" 0.033376071602106094;
	setAttr -s 5 ".wl[1034].w";
	setAttr ".wl[1034].w[13:16]" 0.36724349856376648 0.51353555917739868 
		0.07883085310459137 0.00012959832383785397;
	setAttr ".wl[1034].w[18]" 0.040260504931211472;
	setAttr -s 5 ".wl[1035].w";
	setAttr ".wl[1035].w[13:16]" 0.3729911744594574 0.51009064912796021 
		0.076976798474788666 0.00015440056449733675;
	setAttr ".wl[1035].w[18]" 0.039787054061889648;
	setAttr -s 5 ".wl[1036].w";
	setAttr ".wl[1036].w[13:16]" 0.39165422320365906 0.52454441785812378 
		0.083449706435203552 5.1333936426090077e-06;
	setAttr ".wl[1036].w[18]" 0.00034661946119740605;
	setAttr -s 5 ".wl[1037].w";
	setAttr ".wl[1037].w[13:16]" 0.38568401336669922 0.52743655443191528 
		0.086634986102581024 3.9793503674445674e-06;
	setAttr ".wl[1037].w[18]" 0.00024055686662904918;
	setAttr -s 5 ".wl[1038].w";
	setAttr ".wl[1038].w[13:16]" 0.14474159479141235 0.60227584838867188 
		0.2502484917640686 0.0013612571638077497;
	setAttr ".wl[1038].w[18]" 0.0013727436307817698;
	setAttr -s 5 ".wl[1039].w";
	setAttr ".wl[1039].w[13:16]" 0.15494498610496521 0.60678178071975708 
		0.23504933714866638 0.0019833198748528957;
	setAttr ".wl[1039].w[18]" 0.0012405693996697664;
	setAttr -s 5 ".wl[1040].w";
	setAttr ".wl[1040].w[13:16]" 0.13765576481819153 0.60190069675445557 
		0.25636652112007141 0.0028383999597281218;
	setAttr ".wl[1040].w[18]" 0.0012386353919282556;
	setAttr -s 5 ".wl[1041].w";
	setAttr ".wl[1041].w[13:16]" 0.046127468347549438 0.64415144920349121 
		0.3095889687538147 0.00013167166616767645;
	setAttr ".wl[1041].w[18]" 4.7623518639738904e-07;
	setAttr -s 5 ".wl[1042].w";
	setAttr ".wl[1042].w[13:16]" 0.16700741648674011 0.63954257965087891 
		0.1873335987329483 0.0061057670973241329;
	setAttr ".wl[1042].w[18]" 1.0609591299726162e-05;
	setAttr -s 5 ".wl[1043].w";
	setAttr ".wl[1043].w[1:3]" 0.15267780423164368 0.41418600082397461 
		0.017886744812130928;
	setAttr ".wl[1043].w[8]" 0.0010634968057274818;
	setAttr ".wl[1043].w[13]" 0.41418600082397461;
	setAttr -s 4 ".wl[1044].w";
	setAttr ".wl[1044].w[1:2]" 0.24268893897533417 0.37998399138450623;
	setAttr ".wl[1044].w[8]" 0.00099994579795747995;
	setAttr ".wl[1044].w[13]" 0.37632715702056885;
	setAttr -s 5 ".wl[1045].w";
	setAttr ".wl[1045].w[1:3]" 0.2429431676864624 0.38931503891944885 
		0.00026413958403281868;
	setAttr ".wl[1045].w[8]" 0.00054827029816806316;
	setAttr ".wl[1045].w[13]" 0.36692941188812256;
	setAttr -s 5 ".wl[1046].w";
	setAttr ".wl[1046].w[2:3]" 0.33094578981399536 0.012167999520897865;
	setAttr ".wl[1046].w[13:15]" 0.3354317843914032 0.31107792258262634 
		0.010376458056271076;
	setAttr -s 5 ".wl[1047].w";
	setAttr ".wl[1047].w[1:3]" 0.22235114872455597 0.39303234219551086 
		0.00032254063989967108;
	setAttr ".wl[1047].w[8]" 0.002552936552092433;
	setAttr ".wl[1047].w[13]" 0.38174101710319519;
	setAttr -s 5 ".wl[1048].w";
	setAttr ".wl[1048].w[13:16]" 0.44348713755607605 0.52549153566360474 
		0.029043229296803474 7.2611123869137373e-06;
	setAttr ".wl[1048].w[18]" 0.0019708839245140553;
	setAttr -s 5 ".wl[1049].w";
	setAttr ".wl[1049].w[13:16]" 0.46425849199295044 0.50965201854705811 
		0.02584247849881649 2.9282691116350179e-07;
	setAttr ".wl[1049].w[18]" 0.00024673930602148175;
	setAttr -s 5 ".wl[1050].w";
	setAttr ".wl[1050].w[2:3]" 0.3274739682674408 0.00025800688308663666;
	setAttr ".wl[1050].w[13:15]" 0.33042913675308228 0.325736403465271 
		0.016102490946650505;
	setAttr -s 5 ".wl[1051].w";
	setAttr ".wl[1051].w[13:16]" 0.31771945953369141 0.57835781574249268 
		0.083989277482032776 1.0290170394000597e-05;
	setAttr ".wl[1051].w[18]" 0.019923200830817223;
	setAttr -s 5 ".wl[1052].w";
	setAttr ".wl[1052].w[13:16]" 0.29768148064613342 0.60090136528015137 
		0.089309379458427429 1.1617896234383807e-05;
	setAttr ".wl[1052].w[18]" 0.012096232734620571;
	setAttr -s 5 ".wl[1053].w";
	setAttr ".wl[1053].w[13:16]" 0.36931949853897095 0.53924787044525146 
		0.086606405675411224 7.840408943593502e-05;
	setAttr ".wl[1053].w[18]" 0.0047478764317929745;
	setAttr -s 5 ".wl[1054].w";
	setAttr ".wl[1054].w[13:16]" 0.37127885222434998 0.53982460498809814 
		0.08784031867980957 6.8065132836636622e-06;
	setAttr ".wl[1054].w[18]" 0.0010493644513189793;
	setAttr -s 5 ".wl[1055].w";
	setAttr ".wl[1055].w[13:16]" 0.36520907282829285 0.51672273874282837 
		0.11804193258285522 8.0588955597704626e-07;
	setAttr ".wl[1055].w[18]" 2.540901186875999e-05;
	setAttr -s 4 ".wl[1056].w[13:16]"  0.36244035 0.51332134 0.12423018 
		8.1200969e-06;
	setAttr -s 5 ".wl[1057].w";
	setAttr ".wl[1057].w[13:16]" 0.35317233204841614 0.5267719030380249 
		0.073718816041946411 0.0029476021882146597;
	setAttr ".wl[1057].w[18]" 0.043389298021793365;
	setAttr -s 5 ".wl[1058].w";
	setAttr ".wl[1058].w[13:16]" 0.32431131601333618 0.56422322988510132 
		0.090076468884944916 1.6159357983269729e-05;
	setAttr ".wl[1058].w[18]" 0.02137281745672226;
	setAttr -s 5 ".wl[1059].w";
	setAttr ".wl[1059].w[13:16]" 0.35515078902244568 0.52624726295471191 
		0.11723096668720245 2.6954858185490593e-05;
	setAttr ".wl[1059].w[18]" 0.0013441067421808839;
	setAttr -s 3 ".wl[1060].w[13:15]"  0.34039614 0.53209132 0.12751256;
	setAttr -s 5 ".wl[1061].w";
	setAttr ".wl[1061].w[13:16]" 0.36703294515609741 0.49429357051849365 
		0.068716831505298615 0.029690498486161232;
	setAttr ".wl[1061].w[18]" 0.040266130119562149;
	setAttr -s 5 ".wl[1062].w";
	setAttr ".wl[1062].w[13:16]" 0.36282655596733093 0.5205579400062561 
		0.074921734631061554 4.0212493331637233e-05;
	setAttr ".wl[1062].w[18]" 0.041653487831354141;
	setAttr -s 5 ".wl[1063].w";
	setAttr ".wl[1063].w[13:16]" 0.39970758557319641 0.51032203435897827 
		0.087313026189804077 7.4431454777368344e-06;
	setAttr ".wl[1063].w[18]" 0.0026499100495129824;
	setAttr -s 5 ".wl[1064].w";
	setAttr ".wl[1064].w[13:16]" 0.38457852602005005 0.51784932613372803 
		0.096218585968017578 1.6091286170194508e-06;
	setAttr ".wl[1064].w[18]" 0.0013519390486180782;
	setAttr -s 5 ".wl[1065].w";
	setAttr ".wl[1065].w[13:16]" 0.37924078106880188 0.50701510906219482 
		0.071466244757175446 0.0029735546559095383;
	setAttr ".wl[1065].w[18]" 0.039304278790950775;
	setAttr -s 5 ".wl[1066].w";
	setAttr ".wl[1066].w[13:16]" 0.36606070399284363 0.51730531454086304 
		0.075955532491207123 6.8543886300176382e-05;
	setAttr ".wl[1066].w[18]" 0.040609832853078842;
	setAttr -s 4 ".wl[1067].w";
	setAttr ".wl[1067].w[13:15]" 0.40307295322418213 0.51313990354537964 
		0.082649350166320801;
	setAttr ".wl[1067].w[18]" 0.0011378148337826133;
	setAttr -s 4 ".wl[1068].w";
	setAttr ".wl[1068].w[13:15]" 0.38859796524047852 0.52027744054794312 
		0.09041905403137207;
	setAttr ".wl[1068].w[18]" 0.00070555374259129167;
	setAttr -s 5 ".wl[1069].w";
	setAttr ".wl[1069].w[13:16]" 0.29622066020965576 0.59175890684127808 
		0.10553683340549469 6.1895960243418813e-05;
	setAttr ".wl[1069].w[18]" 0.0064217098988592625;
	setAttr -s 5 ".wl[1070].w";
	setAttr ".wl[1070].w[13:16]" 0.27502748370170593 0.60824477672576904 
		0.11471288651227951 4.9660652621241752e-06;
	setAttr ".wl[1070].w[18]" 0.0020099130924791098;
	setAttr -s 4 ".wl[1071].w[13:16]"  0.30265129 0.54063165 0.15671505 
		2.0629741e-06;
	setAttr -s 5 ".wl[1072].w";
	setAttr ".wl[1072].w[13:16]" 0.28348696231842041 0.53730767965316772 
		0.17918495833873749 9.6849844339885749e-06;
	setAttr ".wl[1072].w[18]" 1.0837238733074628e-05;
	setAttr -s 5 ".wl[1073].w";
	setAttr ".wl[1073].w[13:16]" 0.40801575779914856 0.55196070671081543 
		0.039715699851512909 8.974355409918644e-07;
	setAttr ".wl[1073].w[18]" 0.00030697847250849009;
	setAttr -s 5 ".wl[1074].w";
	setAttr ".wl[1074].w[13:16]" 0.42215418815612793 0.53339308500289917 
		0.038534414023160934 6.2639450959522947e-08;
	setAttr ".wl[1074].w[18]" 0.0059182718396186829;
	setAttr -s 5 ".wl[1075].w";
	setAttr ".wl[1075].w[13:16]" 0.43258583545684814 0.5062287449836731 
		0.060792546719312668 1.9767026060435455e-07;
	setAttr ".wl[1075].w[18]" 0.00039275357266888022;
	setAttr -s 5 ".wl[1076].w";
	setAttr ".wl[1076].w[13:16]" 0.41876986622810364 0.51711112260818481 
		0.063835151493549347 3.6813394217460882e-06;
	setAttr ".wl[1076].w[18]" 0.00028014471172355115;
	setAttr -s 5 ".wl[1077].w";
	setAttr ".wl[1077].w[2:3]" 0.32597810029983521 0.0016266965540125966;
	setAttr ".wl[1077].w[13:15]" 0.32818460464477539 0.32523772120475769 
		0.01897294819355011;
	setAttr -s 5 ".wl[1078].w";
	setAttr ".wl[1078].w[13:16]" 0.46752524375915527 0.49606451392173767 
		0.029397759586572647 4.0170664306060644e-07;
	setAttr ".wl[1078].w[18]" 0.0070120757445693016;
	setAttr -s 5 ".wl[1079].w";
	setAttr ".wl[1079].w[1:3]" 0.20221184194087982 0.3927319347858429 
		0.010807095095515251;
	setAttr ".wl[1079].w[8]" 0.0015171730192378163;
	setAttr ".wl[1079].w[13]" 0.3927319347858429;
	setAttr -s 5 ".wl[1080].w";
	setAttr ".wl[1080].w[13:16]" 0.47414365410804749 0.47742024064064026 
		0.048354566097259521 2.4589871827629395e-06;
	setAttr ".wl[1080].w[18]" 7.9090983490459621e-05;
	setAttr -s 5 ".wl[1081].w";
	setAttr ".wl[1081].w[14:16]" 0.0046352231875061989 0.94808602333068848 
		3.5579425912146689e-06;
	setAttr ".wl[1081].w[18:19]" 0.047255191951990128 1.9988183339592069e-05;
	setAttr -s 5 ".wl[1082].w";
	setAttr ".wl[1082].w[14:16]" 0.0017349935369566083 0.9335363507270813 
		5.5900713959999848e-06;
	setAttr ".wl[1082].w[18:19]" 0.064713224768638611 9.8262080427957699e-06;
	setAttr -s 5 ".wl[1083].w[14:18]"  0.0001414453 0.98870724 
		8.8507149e-06 4.7964232e-07 0.011142029;
	setAttr -s 5 ".wl[1084].w[14:18]"  0.0004770224 0.99679732 
		3.6379058e-06 1.1485773e-06 0.002720874;
	setAttr -s 5 ".wl[1085].w";
	setAttr ".wl[1085].w[14:16]" 0.0020256680436432362 0.82357287406921387 
		1.0445175576023757e-05;
	setAttr ".wl[1085].w[18:19]" 0.17437410354614258 1.695667378953658e-05;
	setAttr -s 5 ".wl[1086].w[14:18]"  0.0017174286 0.97730321 
		4.6906302e-07 6.1327783e-06 0.020972833;
	setAttr -s 5 ".wl[1087].w[14:18]"  0.00032119395 0.91518331 
		7.1566701e-06 1.4282959e-06 0.084486924;
	setAttr -s 5 ".wl[1088].w";
	setAttr ".wl[1088].w[14:16]" 0.0011593003291636705 0.82312774658203125 
		2.0796123862965032e-06;
	setAttr ".wl[1088].w[18:19]" 0.17569471895694733 1.6212039554375224e-05;
	setAttr -s 5 ".wl[1089].w";
	setAttr ".wl[1089].w[14:16]" 0.0025829107034951448 0.72148376703262329 
		4.0779677874525078e-06;
	setAttr ".wl[1089].w[18:19]" 0.2758905291557312 3.8761372707085684e-05;
	setAttr -s 5 ".wl[1090].w[14:18]"  0.00026175927 0.99525756 
		6.1832916e-06 7.4897065e-07 0.0044736983;
	setAttr -s 5 ".wl[1091].w[14:18]"  0.00044876931 0.72566336 
		4.303854e-06 2.2419974e-06 0.27388135;
	setAttr -s 5 ".wl[1092].w";
	setAttr ".wl[1092].w[14:16]" 0.00018123976769857109 0.73051291704177856 
		2.358713800276746e-06;
	setAttr ".wl[1092].w[18:19]" 0.26929798722267151 5.5228297242138069e-06;
	setAttr -s 5 ".wl[1093].w";
	setAttr ".wl[1093].w[14:16]" 0.0001711309450911358 0.51026028394699097 
		3.2021885090216529e-06;
	setAttr ".wl[1093].w[18:19]" 0.48955509066581726 1.0323476999474224e-05;
	setAttr -s 5 ".wl[1094].w";
	setAttr ".wl[1094].w[14:16]" 0.00058045843616127968 0.76845371723175049 
		9.6913427114486694e-06;
	setAttr ".wl[1094].w[18:19]" 0.23094978928565979 6.4070118241943419e-06;
	setAttr -s 5 ".wl[1095].w";
	setAttr ".wl[1095].w[14:16]" 1.0911468962149229e-05 0.029714692384004593 
		1.0998353445756948e-06;
	setAttr ".wl[1095].w[18:19]" 0.97027164697647095 1.6188602103284211e-06;
	setAttr -s 5 ".wl[1096].w";
	setAttr ".wl[1096].w[14:16]" 2.8599173674592748e-05 0.13629080355167389 
		3.0810047064733226e-06;
	setAttr ".wl[1096].w[18:19]" 0.86367344856262207 4.0724562495597638e-06;
	setAttr -s 5 ".wl[1097].w";
	setAttr ".wl[1097].w[14:16]" 6.1698716308455914e-05 0.69575166702270508 
		6.6278898884775117e-06;
	setAttr ".wl[1097].w[18:19]" 0.30417352914810181 6.4880587160587311e-06;
	setAttr -s 5 ".wl[1098].w[14:18]"  0.00026252339 0.77976596 
		6.5417648e-06 1.5758155e-06 0.21996346;
	setAttr -s 5 ".wl[1099].w[14:18]"  0.000458036 0.77106833 2.124809e-06 
		2.39934e-06 0.22846912;
	setAttr -s 5 ".wl[1100].w";
	setAttr ".wl[1100].w[14:16]" 0.001645575393922627 0.040379799902439117 
		0.00030670739943161607;
	setAttr ".wl[1100].w[18:19]" 0.95275253057479858 0.0049153589643537998;
	setAttr -s 5 ".wl[1101].w";
	setAttr ".wl[1101].w[14:16]" 0.001038194983266294 0.2812197208404541 
		7.731081495876424e-06;
	setAttr ".wl[1101].w[18:19]" 0.7174949049949646 0.00023949306341819465;
	setAttr -s 5 ".wl[1102].w";
	setAttr ".wl[1102].w[14:16]" 0.0003358193498570472 0.12586618959903717 
		5.8448540585231967e-06;
	setAttr ".wl[1102].w[18:19]" 0.87372320890426636 6.9003683165647089e-05;
	setAttr -s 5 ".wl[1103].w";
	setAttr ".wl[1103].w[14:16]" 0.00059505738317966461 0.043221548199653625 
		6.8889756221324205e-05;
	setAttr ".wl[1103].w[18:19]" 0.95563846826553345 0.00047607708256691694;
	setAttr -s 5 ".wl[1104].w";
	setAttr ".wl[1104].w[14:16]" 3.5625667806016281e-05 0.0036352893803268671 
		5.018984211346833e-06;
	setAttr ".wl[1104].w[18:19]" 0.99629771709442139 2.6370114937890321e-05;
	setAttr -s 5 ".wl[1105].w";
	setAttr ".wl[1105].w[14:16]" 1.9106395484413952e-05 0.0087262634187936783 
		2.2326778434944572e-06;
	setAttr ".wl[1105].w[18:19]" 0.99124675989151001 5.5531431826238986e-06;
	setAttr -s 4 ".wl[1106].w";
	setAttr ".wl[1106].w[14:15]" 4.034825451526558e-08 1.9721472199307755e-05;
	setAttr ".wl[1106].w[18:19]" 0.99998021125793457 1.2950773786712944e-08;
	setAttr -s 5 ".wl[1107].w";
	setAttr ".wl[1107].w[14:16]" 6.4751776562843588e-07 7.0106143539305776e-05 
		9.663012434657503e-08;
	setAttr ".wl[1107].w[18:19]" 0.99992853403091431 5.309960897648125e-07;
	setAttr -s 5 ".wl[1108].w";
	setAttr ".wl[1108].w[14:16]" 6.2821156461723149e-05 0.0069612544029951096 
		1.0096329788211733e-05;
	setAttr ".wl[1108].w[18:19]" 0.99291300773620605 5.2825023885816336e-05;
	setAttr -s 5 ".wl[1109].w";
	setAttr ".wl[1109].w[14:16]" 2.3691638489253819e-05 0.012527640908956528 
		3.1351585221273126e-06;
	setAttr ".wl[1109].w[18:19]" 0.987437903881073 7.6151341090735514e-06;
	setAttr -s 5 ".wl[1110].w";
	setAttr ".wl[1110].w[14:16]" 0.00035971228498965502 0.16788072884082794 
		8.7273128883680329e-06;
	setAttr ".wl[1110].w[18:19]" 0.83164429664611816 0.00010657327948138118;
	setAttr -s 5 ".wl[1111].w";
	setAttr ".wl[1111].w[14:16]" 0.00060753565048798919 0.018583949655294418 
		0.00010020816989708692;
	setAttr ".wl[1111].w[18:19]" 0.978565514087677 0.0021428125910460949;
	setAttr -s 5 ".wl[1112].w";
	setAttr ".wl[1112].w[14:16]" 0.0015380753902718425 0.041687790304422379 
		0.00030560221057385206;
	setAttr ".wl[1112].w[18:19]" 0.95117408037185669 0.0052945050410926342;
	setAttr -s 5 ".wl[1113].w";
	setAttr ".wl[1113].w[14:16]" 0.00090259156422689557 0.29119136929512024 
		5.6510948525101412e-06;
	setAttr ".wl[1113].w[18:19]" 0.70766252279281616 0.00023791773128323257;
	setAttr -s 5 ".wl[1114].w";
	setAttr ".wl[1114].w[14:16]" 0.0011684534838423133 0.30962413549423218 
		1.0039581866294611e-05;
	setAttr ".wl[1114].w[18:19]" 0.68891423940658569 0.00028318839031271636;
	setAttr -s 5 ".wl[1115].w";
	setAttr ".wl[1115].w[14:16]" 0.0018699110951274633 0.044372528791427612 
		0.00038026613765396178;
	setAttr ".wl[1115].w[18:19]" 0.94662117958068848 0.0067562437616288662;
	setAttr -s 5 ".wl[1116].w";
	setAttr ".wl[1116].w[14:16]" 0.0006210297578945756 0.0031852198299020529 
		0.00018684005772229284;
	setAttr ".wl[1116].w[18:19]" 0.59448724985122681 0.40151971578598022;
	setAttr -s 5 ".wl[1117].w";
	setAttr ".wl[1117].w[14:16]" 0.0011989824706688523 0.012365374714136124 
		0.00028282232233323157;
	setAttr ".wl[1117].w[18:19]" 0.95391809940338135 0.032234702259302139;
	setAttr -s 5 ".wl[1118].w";
	setAttr ".wl[1118].w[14:16]" 0.0005086950259283185 0.0057321302592754364 
		0.00011204057227587327;
	setAttr ".wl[1118].w[18:19]" 0.98265200853347778 0.010995142161846161;
	setAttr -s 5 ".wl[1119].w";
	setAttr ".wl[1119].w[14:16]" 0.00068040535552427173 0.0035595183726400137 
		0.00019090356363449246;
	setAttr ".wl[1119].w[18:19]" 0.68370270729064941 0.31186643242835999;
	setAttr -s 5 ".wl[1120].w";
	setAttr ".wl[1120].w[14:16]" 0.00026347220409661531 0.0016379100270569324 
		6.524787750095129e-05;
	setAttr ".wl[1120].w[18:19]" 0.93800652027130127 0.060026872903108597;
	setAttr -s 5 ".wl[1121].w";
	setAttr ".wl[1121].w[14:16]" 4.3094121792819351e-05 0.00058715243358165026 
		8.8535516624688171e-06;
	setAttr ".wl[1121].w[18:19]" 0.99873185157775879 0.00062914902810007334;
	setAttr -s 5 ".wl[1122].w";
	setAttr ".wl[1122].w[14:16]" 2.4801674953778274e-06 3.6360350350150838e-05 
		5.2587790833058534e-07;
	setAttr ".wl[1122].w[18:19]" 0.99992430210113525 3.6295128666097298e-05;
	setAttr -s 5 ".wl[1123].w";
	setAttr ".wl[1123].w[14:16]" 0.00023483243421651423 0.0014835348119959235 
		9.3653416115557775e-06;
	setAttr ".wl[1123].w[18:19]" 0.95065909624099731 0.04761325940489769;
	setAttr -s 5 ".wl[1124].w";
	setAttr ".wl[1124].w[14:16]" 0.00081063434481620789 0.0055425460450351238 
		1.5834958730920334e-06;
	setAttr ".wl[1124].w[18:19]" 0.88318389654159546 0.11046129465103149;
	setAttr -s 5 ".wl[1125].w";
	setAttr ".wl[1125].w[14:16]" 0.00013929902343079448 0.0021051866933703423 
		1.0824473974935245e-05;
	setAttr ".wl[1125].w[18:19]" 0.99561691284179688 0.0021277887281030416;
	setAttr -s 5 ".wl[1126].w";
	setAttr ".wl[1126].w[14:16]" 0.00053616450168192387 0.0071629034355282784 
		3.6729436487803468e-06;
	setAttr ".wl[1126].w[18:19]" 0.9795878529548645 0.012709387578070164;
	setAttr -s 5 ".wl[1127].w";
	setAttr ".wl[1127].w[14:16]" 0.00069270958192646503 0.0044015706516802311 
		1.3191893231123686e-05;
	setAttr ".wl[1127].w[18:19]" 0.73568445444107056 0.259208083152771;
	setAttr -s 5 ".wl[1128].w";
	setAttr ".wl[1128].w[14:16]" 0.00031019849120639265 0.0018946245545521379 
		2.962475446111057e-05;
	setAttr ".wl[1128].w[18:19]" 0.67088228464126587 0.32688328623771667;
	setAttr -s 5 ".wl[1129].w";
	setAttr ".wl[1129].w[14:16]" 0.00097865227144211531 0.011590744368731976 
		2.6636686015990563e-05;
	setAttr ".wl[1129].w[18:19]" 0.95771843194961548 0.029685607179999352;
	setAttr -s 5 ".wl[1130].w";
	setAttr ".wl[1130].w[14:16]" 0.0010431508999317884 0.010867740027606487 
		0.00012282759416848421;
	setAttr ".wl[1130].w[18:19]" 0.94962221384048462 0.038344033062458038;
	setAttr -s 5 ".wl[1131].w";
	setAttr ".wl[1131].w[14:16]" 0.00017318251775577664 0.00090971990721300244 
		4.5761469664284959e-05;
	setAttr ".wl[1131].w[18:19]" 0.55229067802429199 0.4465806782245636;
	setAttr -s 5 ".wl[1132].w";
	setAttr ".wl[1132].w[14:16]" 0.00062261882703751326 0.0019343954045325518 
		0.00022608040308114141;
	setAttr ".wl[1132].w[18:19]" 0.49860844016075134 0.49860844016075134;
	setAttr -s 5 ".wl[1133].w";
	setAttr ".wl[1133].w[14:16]" 0.00096629804465919733 0.0029456587508320808 
		0.00034456443972885609;
	setAttr ".wl[1133].w[18:19]" 0.49787172675132751 0.49787172675132751;
	setAttr -s 5 ".wl[1134].w";
	setAttr ".wl[1134].w[14:16]" 0.0016905561788007617 0.0048581464216113091 
		0.00058791099581867456;
	setAttr ".wl[1134].w[18:19]" 0.49643170833587646 0.49643170833587646;
	setAttr -s 5 ".wl[1135].w";
	setAttr ".wl[1135].w[14:16]" 0.00078269297955557704 0.0023190733045339584 
		0.00026942012482322752;
	setAttr ".wl[1135].w[18:19]" 0.49831441044807434 0.49831441044807434;
	setAttr -s 5 ".wl[1136].w";
	setAttr ".wl[1136].w[14:16]" 0.0015182055067270994 0.0042216582223773003 
		0.00044135804637335241;
	setAttr ".wl[1136].w[18:19]" 0.49690937995910645 0.49690937995910645;
	setAttr -s 5 ".wl[1137].w";
	setAttr ".wl[1137].w[14:16]" 0.0016932133585214615 0.0047580734826624393 
		0.00049149466212838888;
	setAttr ".wl[1137].w[18:19]" 0.49652862548828125 0.49652862548828125;
	setAttr -s 5 ".wl[1138].w";
	setAttr ".wl[1138].w[14:16]" 0.0038893620949238539 0.0098548810929059982 
		0.0010841024341061711;
	setAttr ".wl[1138].w[18:19]" 0.49258583784103394 0.49258583784103394;
	setAttr -s 5 ".wl[1139].w";
	setAttr ".wl[1139].w[14:16]" 0.0035343577619642019 0.0087152058258652687 
		0.00094753899611532688;
	setAttr ".wl[1139].w[18:19]" 0.49340143799781799 0.49340143799781799;
	setAttr -s 5 ".wl[1140].w";
	setAttr ".wl[1140].w[14:16]" 0.0011960251722484827 0.0041199377737939358 
		0.00043493547127582133;
	setAttr ".wl[1140].w[18:19]" 0.49712452292442322 0.49712452292442322;
	setAttr -s 5 ".wl[1141].w";
	setAttr ".wl[1141].w[14:16]" 0.00091453536879271269 0.0033762569073587656 
		0.00031906619551591575;
	setAttr ".wl[1141].w[18:19]" 0.49769505858421326 0.49769505858421326;
	setAttr -s 5 ".wl[1142].w";
	setAttr ".wl[1142].w[14:16]" 0.0012441135477274656 0.0045045921579003334 
		0.00042054700315929949;
	setAttr ".wl[1142].w[18:19]" 0.49691537022590637 0.49691537022590637;
	setAttr -s 5 ".wl[1143].w";
	setAttr ".wl[1143].w[14:16]" 0.0016361064044758677 0.0055040465667843819 
		0.0005822859238833189;
	setAttr ".wl[1143].w[18:19]" 0.49613878130912781 0.49613878130912781;
	setAttr -s 5 ".wl[1144].w";
	setAttr ".wl[1144].w[14:16]" 0.000582943728659302 0.0021152286790311337 
		0.00020337215391919017;
	setAttr ".wl[1144].w[18:19]" 0.4985491931438446 0.4985491931438446;
	setAttr -s 5 ".wl[1145].w";
	setAttr ".wl[1145].w[14:16]" 0.00075093936175107956 0.0027112159878015518 
		0.00025649403687566519;
	setAttr ".wl[1145].w[18:19]" 0.49814063310623169 0.49814063310623169;
	setAttr -s 5 ".wl[1146].w";
	setAttr ".wl[1146].w[14:16]" 2.3311131371883675e-05 9.5378578407689929e-05 
		8.1706375567591749e-06;
	setAttr ".wl[1146].w[18:19]" 0.4999365508556366 0.4999365508556366;
	setAttr -s 5 ".wl[1147].w";
	setAttr ".wl[1147].w[14:16]" 2.8222784749232233e-05 0.00011515484948176891 
		9.9418857644195668e-06;
	setAttr ".wl[1147].w[18:19]" 0.49992337822914124 0.49992337822914124;
	setAttr -s 5 ".wl[1148].w";
	setAttr ".wl[1148].w[14:16]" 0.00019523051741998643 0.00081690814113244414 
		7.2239592554979026e-05;
	setAttr ".wl[1148].w[18:19]" 0.49945777654647827 0.49945777654647827;
	setAttr -s 5 ".wl[1149].w";
	setAttr ".wl[1149].w[14:16]" 0.00032238996936939657 0.0013716986868530512 
		0.0001182238120236434;
	setAttr ".wl[1149].w[18:19]" 0.49909380078315735 0.49909380078315735;
	setAttr -s 5 ".wl[1150].w";
	setAttr ".wl[1150].w[14:16]" 0.00048753968439996243 0.0021758307702839375 
		0.00018185394583269954;
	setAttr ".wl[1150].w[18:19]" 0.49857741594314575 0.49857741594314575;
	setAttr -s 5 ".wl[1151].w";
	setAttr ".wl[1151].w[14:16]" 0.00053485250100493431 0.0021894793026149273 
		0.00020663328177761286;
	setAttr ".wl[1151].w[18:19]" 0.49853450059890747 0.49853450059890747;
	setAttr -s 5 ".wl[1152].w";
	setAttr ".wl[1152].w[14:16]" 0.00035550101893022656 0.0014303476782515645 
		0.00013798463623970747;
	setAttr ".wl[1152].w[18:19]" 0.49903804063796997 0.49903804063796997;
	setAttr -s 5 ".wl[1153].w";
	setAttr ".wl[1153].w[14:16]" 0.00025372041272930801 0.0011121364077553153 
		9.5762581622693688e-05;
	setAttr ".wl[1153].w[18:19]" 0.49926918745040894 0.49926918745040894;
	setAttr -s 5 ".wl[1154].w";
	setAttr ".wl[1154].w[14:16]" 0.00018153290147893131 0.00073955836705863476 
		6.6080807300750166e-05;
	setAttr ".wl[1154].w[18:19]" 0.4995063841342926 0.4995063841342926;
	setAttr -s 5 ".wl[1155].w";
	setAttr ".wl[1155].w[14:16]" 0.00029966194415464997 0.0011408051941543818 
		0.00011223366891499609;
	setAttr ".wl[1155].w[18:19]" 0.49922364950180054 0.49922364950180054;
	setAttr -s 5 ".wl[1156].w";
	setAttr ".wl[1156].w[14:16]" 0.0018993115518242121 0.0059059364721179008 
		0.00072787509998306632;
	setAttr ".wl[1156].w[18:19]" 0.49573343992233276 0.49573343992233276;
	setAttr -s 5 ".wl[1157].w";
	setAttr ".wl[1157].w[14:16]" 0.0011497114319354296 0.0038991873152554035 
		0.00042366835987195373;
	setAttr ".wl[1157].w[18:19]" 0.49726372957229614 0.49726372957229614;
	setAttr -s 5 ".wl[1158].w";
	setAttr ".wl[1158].w[14:16]" 0.0014929439639672637 0.0049605667591094971 
		0.00053899583872407675;
	setAttr ".wl[1158].w[18:19]" 0.49650377035140991 0.49650377035140991;
	setAttr -s 5 ".wl[1159].w";
	setAttr ".wl[1159].w[14:16]" 0.0024025470484048128 0.0072933929041028023 
		0.00090287713101133704;
	setAttr ".wl[1159].w[18:19]" 0.49470058083534241 0.49470058083534241;
	setAttr -s 5 ".wl[1160].w";
	setAttr ".wl[1160].w[14:16]" 0.0010932369623333216 0.0035225288011133671 
		0.00040143149089999497;
	setAttr ".wl[1160].w[18:19]" 0.49749135971069336 0.49749135971069336;
	setAttr -s 5 ".wl[1161].w";
	setAttr ".wl[1161].w[14:16]" 0.00058636203175410628 0.0020781953353434801 
		0.00020776607561856508;
	setAttr ".wl[1161].w[18:19]" 0.49856385588645935 0.49856385588645935;
	setAttr -s 5 ".wl[1162].w";
	setAttr ".wl[1162].w[14:16]" 5.6775777920847759e-05 0.00022200835519470274 
		2.0294417481636629e-05;
	setAttr ".wl[1162].w[18:19]" 0.49985054135322571 0.49985054135322571;
	setAttr -s 5 ".wl[1163].w";
	setAttr ".wl[1163].w[14:16]" 0.00024189284886233509 0.00084595620865002275 
		8.9191373263020068e-05;
	setAttr ".wl[1163].w[18:19]" 0.49941149353981018 0.49941149353981018;
	setAttr -s 5 ".wl[1164].w";
	setAttr ".wl[1164].w[14:16]" 0.00052193290321156383 0.0018771982286125422 
		0.00019984794198535383;
	setAttr ".wl[1164].w[18:19]" 0.49870052933692932 0.49870052933692932;
	setAttr -s 5 ".wl[1165].w";
	setAttr ".wl[1165].w[14:16]" 0.00020805947133339942 0.00083640549564734101 
		7.7582692028954625e-05;
	setAttr ".wl[1165].w[18:19]" 0.49943900108337402 0.49943900108337402;
	setAttr -s 5 ".wl[1166].w";
	setAttr ".wl[1166].w[14:16]" 0.0005125931347720325 0.0020238400902599096 
		0.00019889378745574504;
	setAttr ".wl[1166].w[18:19]" 0.49863234162330627 0.49863234162330627;
	setAttr -s 5 ".wl[1167].w";
	setAttr ".wl[1167].w[14:16]" 0.0010424504289403558 0.0036888157483190298 
		0.00041658437112346292;
	setAttr ".wl[1167].w[18:19]" 0.49742609262466431 0.49742609262466431;
	setAttr -s 5 ".wl[1168].w";
	setAttr ".wl[1168].w[14:16]" 0.00080309482291340828 0.0028295728843659163 
		0.00032353925053030252;
	setAttr ".wl[1168].w[18:19]" 0.49802190065383911 0.49802190065383911;
	setAttr -s 5 ".wl[1169].w";
	setAttr ".wl[1169].w[14:16]" 0.00038286720518954098 0.0014891552273184061 
		0.000149407351273112;
	setAttr ".wl[1169].w[18:19]" 0.49898931384086609 0.49898931384086609;
	setAttr -s 5 ".wl[1170].w";
	setAttr ".wl[1170].w[14:16]" 0.0003530136018525809 0.0013043746585026383 
		0.00013371239765547216;
	setAttr ".wl[1170].w[18:19]" 0.49910447001457214 0.49910447001457214;
	setAttr -s 5 ".wl[1171].w";
	setAttr ".wl[1171].w[14:16]" 0.00077829422662034631 0.0026110357139259577 
		0.00030612782575190067;
	setAttr ".wl[1171].w[18:19]" 0.49815231561660767 0.49815231561660767;
	setAttr -s 5 ".wl[1172].w";
	setAttr ".wl[1172].w[14:16]" 0.00034830777440220118 0.0013028960675001144 
		0.00011807607370428741;
	setAttr ".wl[1172].w[18:19]" 0.49911537766456604 0.49911537766456604;
	setAttr -s 5 ".wl[1173].w";
	setAttr ".wl[1173].w[14:16]" 0.00070833915378898382 0.0027423978317528963 
		0.00022440442990045995;
	setAttr ".wl[1173].w[18:19]" 0.49816241860389709 0.49816241860389709;
	setAttr -s 5 ".wl[1174].w";
	setAttr ".wl[1174].w[14:16]" 0.00065383437322452664 0.0023841958027333021 
		0.00021463407028932124;
	setAttr ".wl[1174].w[18:19]" 0.49837362766265869 0.49837362766265869;
	setAttr -s 5 ".wl[1175].w";
	setAttr ".wl[1175].w[14:16]" 0.00017604242020752281 0.00068746320903301239 
		5.5517990404041484e-05;
	setAttr ".wl[1175].w[18:19]" 0.49954047799110413 0.49954047799110413;
	setAttr -s 5 ".wl[1176].w";
	setAttr ".wl[1176].w[14:16]" 0.00039044185541570187 0.0015029386850073934 
		0.00012012034130748361;
	setAttr ".wl[1176].w[18:19]" 0.49899324774742126 0.49899324774742126;
	setAttr -s 5 ".wl[1177].w";
	setAttr ".wl[1177].w[14:16]" 9.6379853857797571e-06 4.130542220082134e-05 
		3.0017429253348382e-06;
	setAttr ".wl[1177].w[18:19]" 0.49997302889823914 0.49997302889823914;
	setAttr -s 5 ".wl[1178].w";
	setAttr ".wl[1178].w[14:16]" 6.7102596403856296e-06 2.8767990443157032e-05 
		2.1090802420076216e-06;
	setAttr ".wl[1178].w[18:19]" 0.49998122453689575 0.49998122453689575;
	setAttr -s 5 ".wl[1179].w";
	setAttr ".wl[1179].w[14:16]" 0.00031545932870358229 0.0013518986525014043 
		0.00010454640141688287;
	setAttr ".wl[1179].w[18:19]" 0.49911406636238098 0.49911406636238098;
	setAttr -s 5 ".wl[1180].w";
	setAttr ".wl[1180].w[14:16]" 0.00081786891678348184 0.0034921001642942429 
		0.00026835600147023797;
	setAttr ".wl[1180].w[18:19]" 0.50199270248413086 0.49342891573905945;
	setAttr -s 5 ".wl[1181].w";
	setAttr ".wl[1181].w[14:16]" 0.00072178925620391965 0.0033105837646871805 
		0.00022275021183304489;
	setAttr ".wl[1181].w[18:19]" 0.50170290470123291 0.49404206871986389;
	setAttr -s 5 ".wl[1182].w";
	setAttr ".wl[1182].w[14:16]" 0.00058791268384084105 0.0024820901453495026 
		0.00020633448730222881;
	setAttr ".wl[1182].w[18:19]" 0.49836182594299316 0.49836182594299316;
	setAttr -s 5 ".wl[1183].w";
	setAttr ".wl[1183].w[14:16]" 0.00015244277892634273 0.000648158835247159 
		5.450302705867216e-05;
	setAttr ".wl[1183].w[18:19]" 0.49957242608070374 0.49957242608070374;
	setAttr -s 5 ".wl[1184].w";
	setAttr ".wl[1184].w[14:16]" 1.8188020476372913e-05 7.4665775173343718e-05 
		6.3346187744173221e-06;
	setAttr ".wl[1184].w[18:19]" 0.49995043873786926 0.49995043873786926;
	setAttr -s 5 ".wl[1185].w";
	setAttr ".wl[1185].w[14:16]" 0.00089792755898088217 0.0028724544681608677 
		0.00031864066841080785;
	setAttr ".wl[1185].w[18:19]" 0.49795550107955933 0.49795550107955933;
	setAttr -s 5 ".wl[1186].w";
	setAttr ".wl[1186].w[14:16]" 0.00031953791039995849 0.0011634191032499075 
		0.00010934911551885307;
	setAttr ".wl[1186].w[18:19]" 0.49920386075973511 0.49920386075973511;
	setAttr -s 5 ".wl[1187].w";
	setAttr ".wl[1187].w[14:16]" 0.00055943260667845607 0.001987621420994401 
		0.00018553133122622967;
	setAttr ".wl[1187].w[18:19]" 0.49863371253013611 0.49863371253013611;
	setAttr -s 5 ".wl[1188].w";
	setAttr ".wl[1188].w[14:16]" 0.0014747523237019777 0.0045343227684497833 
		0.00050600769463926554;
	setAttr ".wl[1188].w[18:19]" 0.49674248695373535 0.49674248695373535;
	setAttr -s 5 ".wl[1189].w";
	setAttr ".wl[1189].w[14:16]" 0.00065083184745162725 0.0020952299237251282 
		0.00021108447981532663;
	setAttr ".wl[1189].w[18:19]" 0.49852141737937927 0.49852141737937927;
	setAttr -s 5 ".wl[1190].w";
	setAttr ".wl[1190].w[14:16]" 0.0001774078409653157 0.00066563143627718091 
		5.6574532209197059e-05;
	setAttr ".wl[1190].w[18:19]" 0.49955019354820251 0.49955019354820251;
	setAttr -s 5 ".wl[1191].w";
	setAttr ".wl[1191].w[14:16]" 1.9638022422441281e-05 7.8994758951012045e-05 
		6.2251142480818089e-06;
	setAttr ".wl[1191].w[18:19]" 0.49994757771492004 0.49994757771492004;
	setAttr -s 5 ".wl[1192].w";
	setAttr ".wl[1192].w[14:16]" 0.00027752137975767255 0.00092672585742548108 
		8.7790438556112349e-05;
	setAttr ".wl[1192].w[18:19]" 0.4993540346622467 0.4993540346622467;
	setAttr -s 5 ".wl[1193].w";
	setAttr ".wl[1193].w[14:16]" 0.0010069683194160461 0.0033959350548684597 
		0.00033245602389797568;
	setAttr ".wl[1193].w[18:19]" 0.49763235449790955 0.49763235449790955;
	setAttr -s 5 ".wl[1194].w";
	setAttr ".wl[1194].w[14:16]" 0.0002910420298576355 0.0011794029269367456 
		9.6452073194086552e-05;
	setAttr ".wl[1194].w[18:19]" 0.49921652674674988 0.49921652674674988;
	setAttr -s 5 ".wl[1195].w";
	setAttr ".wl[1195].w[14:16]" 0.00050582666881382465 0.0020288743544369936 
		0.00017689735977910459;
	setAttr ".wl[1195].w[18:19]" 0.49864420294761658 0.49864420294761658;
	setAttr -s 5 ".wl[1196].w";
	setAttr ".wl[1196].w[14:16]" 0.0014741613995283842 0.0049504227936267853 
		0.0005199545412324369;
	setAttr ".wl[1196].w[18:19]" 0.49652773141860962 0.49652773141860962;
	setAttr -s 5 ".wl[1197].w";
	setAttr ".wl[1197].w[14:16]" 0.00055537204025313258 0.0019454146968200803 
		0.00020253767434041947;
	setAttr ".wl[1197].w[18:19]" 0.49864834547042847 0.49864834547042847;
	setAttr -s 5 ".wl[1198].w";
	setAttr ".wl[1198].w[14:16]" 0.00015520755550824106 0.00062919984338805079 
		5.543330917134881e-05;
	setAttr ".wl[1198].w[18:19]" 0.49958008527755737 0.49958008527755737;
	setAttr -s 5 ".wl[1199].w";
	setAttr ".wl[1199].w[14:16]" 3.270312663516961e-05 0.00012834767403546721 
		1.1464274393802043e-05;
	setAttr ".wl[1199].w[18:19]" 0.49991375207901001 0.49991375207901001;
	setAttr -s 5 ".wl[1200].w";
	setAttr ".wl[1200].w[14:16]" 0.00025524286320433021 0.00086994166485965252 
		9.2401896836236119e-05;
	setAttr ".wl[1200].w[18:19]" 0.49939119815826416 0.49939119815826416;
	setAttr -s 5 ".wl[1201].w";
	setAttr ".wl[1201].w[14:16]" 0.00021041974832769483 0.00082891940837725997 
		6.3346080423798412e-05;
	setAttr ".wl[1201].w[18:19]" 0.49944865703582764 0.49944865703582764;
	setAttr -s 5 ".wl[1202].w";
	setAttr ".wl[1202].w[14:16]" 0.00074830593075603247 0.0030272442381829023 
		0.00021553965052589774;
	setAttr ".wl[1202].w[18:19]" 0.51860672235488892 0.47740218043327332;
	setAttr -s 5 ".wl[1203].w";
	setAttr ".wl[1203].w[14:16]" 0.00073347182478755713 0.0027597041334956884 
		0.00021197189926169813;
	setAttr ".wl[1203].w[18:19]" 0.50121003389358521 0.49508491158485413;
	setAttr -s 5 ".wl[1204].w";
	setAttr ".wl[1204].w[14:16]" 0.00058564316714182496 0.0022784376051276922 
		0.00015993179113138467;
	setAttr ".wl[1204].w[18:19]" 0.53244233131408691 0.46453371644020081;
	setAttr -s 5 ".wl[1205].w";
	setAttr ".wl[1205].w[14:16]" 0.00061785179423168302 0.0026342165656387806 
		0.00016444694483652711;
	setAttr ".wl[1205].w[18:19]" 0.60725075006484985 0.38933277130126953;
	setAttr -s 5 ".wl[1206].w";
	setAttr ".wl[1206].w[14:16]" 0.00052030448568984866 0.0023414581082761288 
		3.8765225326642394e-05;
	setAttr ".wl[1206].w[18:19]" 0.67568325996398926 0.3214162290096283;
	setAttr -s 5 ".wl[1207].w";
	setAttr ".wl[1207].w[14:16]" 0.00052714452613145113 0.0021650760900229216 
		0.00014275018475018442;
	setAttr ".wl[1207].w[18:19]" 0.57693040370941162 0.42023450136184692;
	setAttr -s 5 ".wl[1208].w";
	setAttr ".wl[1208].w[14:16]" 0.0019747118931263685 0.0079212738201022148 
		0.00050688255578279495;
	setAttr ".wl[1208].w[18:19]" 0.53752607107162476 0.45207110047340393;
	setAttr -s 5 ".wl[1209].w";
	setAttr ".wl[1209].w[14:16]" 0.0020148383919149637 0.0090147946029901505 
		0.00024906409089453518;
	setAttr ".wl[1209].w[18:19]" 0.5926852822303772 0.39603599905967712;
	setAttr -s 5 ".wl[1210].w";
	setAttr ".wl[1210].w[14:16]" 0.0019157706992700696 0.0086124790832400322 
		0.00038260265137068927;
	setAttr ".wl[1210].w[18:19]" 0.5402991771697998 0.44878995418548584;
	setAttr -s 5 ".wl[1211].w";
	setAttr ".wl[1211].w[14:16]" 0.0022541566286236048 0.0090629067271947861 
		0.00069635128602385521;
	setAttr ".wl[1211].w[18:19]" 0.51476967334747314 0.47321692109107971;
	setAttr -s 5 ".wl[1212].w";
	setAttr ".wl[1212].w[14:16]" 0.00059637293452396989 0.0025263053830713034 
		0.00018853440997190773;
	setAttr ".wl[1212].w[18:19]" 0.50668203830718994 0.49000665545463562;
	setAttr -s 5 ".wl[1213].w";
	setAttr ".wl[1213].w[14:16]" 1.3618297089124098e-05 5.8324196288594976e-05 
		4.2037631828861777e-06;
	setAttr ".wl[1213].w[18:19]" 0.50007784366607666 0.49984598159790039;
	setAttr -s 5 ".wl[1214].w";
	setAttr ".wl[1214].w[14:16]" 0.0010267844190821052 0.0032079827506095171 
		0.00030660082120448351;
	setAttr ".wl[1214].w[18:19]" 0.49772933125495911 0.49772933125495911;
	setAttr -s 5 ".wl[1215].w";
	setAttr ".wl[1215].w[14:16]" 0.00025499958428554237 0.00095786742167547345 
		7.6312469900585711e-05;
	setAttr ".wl[1215].w[18:19]" 0.49935543537139893 0.49935543537139893;
	setAttr -s 5 ".wl[1216].w";
	setAttr ".wl[1216].w[14:16]" 0.00078722625039517879 0.0028224077541381121 
		0.00022618479852098972;
	setAttr ".wl[1216].w[18:19]" 0.49821919202804565 0.49794495105743408;
	setAttr -s 5 ".wl[1217].w";
	setAttr ".wl[1217].w[14:16]" 0.0025531796272844076 0.0074186981655657291 
		0.00072829041164368391;
	setAttr ".wl[1217].w[18:19]" 0.49464988708496094 0.49464988708496094;
	setAttr -s 5 ".wl[1218].w";
	setAttr ".wl[1218].w[14:16]" 0.0025538622867316008 0.00738496333360672 
		0.00067633000435307622;
	setAttr ".wl[1218].w[18:19]" 0.49469241499900818 0.49469241499900818;
	setAttr -s 5 ".wl[1219].w";
	setAttr ".wl[1219].w[14:16]" 0.00074050243711099029 0.0027039502747356892 
		0.00020163095905445516;
	setAttr ".wl[1219].w[18:19]" 0.51221048831939697 0.48414358496665955;
	setAttr -s 5 ".wl[1220].w";
	setAttr ".wl[1220].w[14:16]" 0.00077608629362657666 0.0029199300333857536 
		0.00020876529742963612;
	setAttr ".wl[1220].w[18:19]" 0.53283423185348511 0.4632609486579895;
	setAttr -s 5 ".wl[1221].w";
	setAttr ".wl[1221].w[14:16]" 0.0031157210469245911 0.008797941729426384 
		0.00079213257413357496;
	setAttr ".wl[1221].w[18:19]" 0.49441766738891602 0.49287649989128113;
	setAttr -s 5 ".wl[1222].w";
	setAttr ".wl[1222].w[14:16]" 0.005887630395591259 0.01672171987593174 
		0.001596005167812109;
	setAttr ".wl[1222].w[18:19]" 0.48972651362419128 0.48606806993484497;
	setAttr -s 5 ".wl[1223].w";
	setAttr ".wl[1223].w[14:16]" 0.0021361801773309708 0.0079591209068894386 
		0.00060805631801486015;
	setAttr ".wl[1223].w[18:19]" 0.5187227725982666 0.47057387232780457;
	setAttr -s 5 ".wl[1224].w";
	setAttr ".wl[1224].w[14:16]" 0.0022818678990006447 0.008578956127166748 
		0.00069171085488051176;
	setAttr ".wl[1224].w[18:19]" 0.50437438488006592 0.48407313227653503;
	setAttr -s 5 ".wl[1225].w";
	setAttr ".wl[1225].w[14:16]" 0.0059602507390081882 0.017344767227768898 
		0.0017445872072130442;
	setAttr ".wl[1225].w[18:19]" 0.48747518658638 0.48747518658638;
	setAttr -s 5 ".wl[1226].w";
	setAttr ".wl[1226].w[14:16]" 0.0020881872624158859 0.0066725993528962135 
		0.00063528132159262896;
	setAttr ".wl[1226].w[18:19]" 0.4953019917011261 0.4953019917011261;
	setAttr -s 5 ".wl[1227].w";
	setAttr ".wl[1227].w[14:16]" 0.00069453567266464233 0.0027529119979590178 
		0.00021598610328510404;
	setAttr ".wl[1227].w[18:19]" 0.49973848462104797 0.49659791588783264;
	setAttr -s 5 ".wl[1228].w";
	setAttr ".wl[1228].w[14:16]" 5.2274630434112623e-05 0.00020909495651721954 
		1.5967692888807505e-05;
	setAttr ".wl[1228].w[18:19]" 0.49986135959625244 0.49986135959625244;
	setAttr -s 5 ".wl[1229].w";
	setAttr ".wl[1229].w[14:16]" 0.00046371744247153401 0.0015093489782884717 
		0.00013960714568383992;
	setAttr ".wl[1229].w[18:19]" 0.49894368648529053 0.49894368648529053;
	setAttr -s 5 ".wl[1230].w";
	setAttr ".wl[1230].w[0:3]" 0.4846419095993042 0.49755674600601196 
		0.015218573622405529 0.001810825546272099;
	setAttr ".wl[1230].w[8]" 0.00077193696051836014;
	setAttr -s 5 ".wl[1231].w";
	setAttr ".wl[1231].w[1:3]" 0.064416155219078064 0.84293478727340698 
		0.0038896335754543543;
	setAttr ".wl[1231].w[8]" 0.013541662134230137;
	setAttr ".wl[1231].w[13]" 0.075217761099338531;
	setAttr -s 5 ".wl[1232].w";
	setAttr ".wl[1232].w[1:3]" 0.10244529694318771 0.76230782270431519 
		0.0074876495636999607;
	setAttr ".wl[1232].w[8]" 0.0043862732127308846;
	setAttr ".wl[1232].w[13]" 0.12337297946214676;
	setAttr -s 5 ".wl[1233].w";
	setAttr ".wl[1233].w[1:3]" 0.14639794826507568 0.683860182762146 
		0.015288839116692543;
	setAttr ".wl[1233].w[8]" 0.010128269903361797;
	setAttr ".wl[1233].w[13]" 0.14432476460933685;
	setAttr -s 5 ".wl[1234].w";
	setAttr ".wl[1234].w[1:3]" 0.18150608241558075 0.55611610412597656 
		0.015862591564655304;
	setAttr ".wl[1234].w[8]" 0.031148774549365044;
	setAttr ".wl[1234].w[13]" 0.21536637842655182;
	setAttr -s 5 ".wl[1235].w";
	setAttr ".wl[1235].w[1:3]" 0.21271853148937225 0.52004760503768921 
		0.01944228820502758;
	setAttr ".wl[1235].w[8]" 0.013455977663397789;
	setAttr ".wl[1235].w[13]" 0.23433557152748108;
	setAttr -s 5 ".wl[1236].w";
	setAttr ".wl[1236].w[1:3]" 0.19957040250301361 0.62354731559753418 
		0.030806213617324829;
	setAttr ".wl[1236].w[8]" 0.0055342954583466053;
	setAttr ".wl[1236].w[13]" 0.14054182171821594;
	setAttr -s 5 ".wl[1237].w";
	setAttr ".wl[1237].w[0:3]" 0.47938665747642517 0.4975469708442688 
		0.018729863688349724 0.00046208783169277012;
	setAttr ".wl[1237].w[8]" 0.0038744229823350906;
	setAttr -s 5 ".wl[1238].w";
	setAttr ".wl[1238].w[0:3]" 0.45258846879005432 0.46873030066490173 
		0.07704538106918335 0.00069967826129868627;
	setAttr ".wl[1238].w[8]" 0.00093621329870074987;
	setAttr -s 4 ".wl[1239].w";
	setAttr ".wl[1239].w[1:3]" 0.20272079110145569 0.69938814640045166 
		6.2219238316174597e-05;
	setAttr ".wl[1239].w[13]" 0.097828879952430725;
	setAttr -s 5 ".wl[1240].w";
	setAttr ".wl[1240].w[1:3]" 0.1500512957572937 0.66022372245788574 
		0.0078022768720984459;
	setAttr ".wl[1240].w[8]" 0.0034110448323190212;
	setAttr ".wl[1240].w[13]" 0.17851157486438751;
	setAttr -s 5 ".wl[1241].w";
	setAttr ".wl[1241].w[1:3]" 0.096586897969245911 0.74948126077651978 
		0.0048164366744458675;
	setAttr ".wl[1241].w[8]" 0.036887522786855698;
	setAttr ".wl[1241].w[13]" 0.11222785711288452;
	setAttr -s 5 ".wl[1242].w";
	setAttr ".wl[1242].w[1:3]" 0.041624344885349274 0.77457022666931152 
		0.0021764950361102819;
	setAttr ".wl[1242].w[8]" 0.13530087471008301;
	setAttr ".wl[1242].w[13]" 0.046328023076057434;
	setAttr -s 5 ".wl[1243].w";
	setAttr ".wl[1243].w[1:3]" 0.27927950024604797 0.4974219799041748 
		0.030217668041586876;
	setAttr ".wl[1243].w[8]" 0.0017569992924109101;
	setAttr ".wl[1243].w[13]" 0.19132383167743683;
	setAttr -s 4 ".wl[1244].w";
	setAttr ".wl[1244].w[1:3]" 0.29958313703536987 0.35235655307769775 
		0.029996968805789948;
	setAttr ".wl[1244].w[13]" 0.31806337833404541;
	setAttr -s 5 ".wl[1245].w";
	setAttr ".wl[1245].w[1:3]" 0.33760601282119751 0.42586910724639893 
		0.0023080452810972929;
	setAttr ".wl[1245].w[8]" 4.1812595554802101e-06;
	setAttr ".wl[1245].w[13]" 0.23421268165111542;
	setAttr -s 5 ".wl[1246].w";
	setAttr ".wl[1246].w[2:3]" 0.37553724646568298 0.00096616038354113698;
	setAttr ".wl[1246].w[8:10]" 0.6024278998374939 0.020066110417246819 
		0.0010025871451944113;
	setAttr -s 5 ".wl[1247].w";
	setAttr ".wl[1247].w[2:3]" 0.56326079368591309 0.0013497923500835896;
	setAttr ".wl[1247].w[8:10]" 0.41479545831680298 0.019538391381502151 
		0.0010555930202826858;
	setAttr -s 5 ".wl[1248].w";
	setAttr ".wl[1248].w[2:3]" 0.82602608203887939 0.0040541193448007107;
	setAttr ".wl[1248].w[8:10]" 0.13427230715751648 0.033274732530117035 
		0.0023727430962026119;
	setAttr -s 5 ".wl[1249].w";
	setAttr ".wl[1249].w[2:3]" 0.45273005962371826 0.0016069837147369981;
	setAttr ".wl[1249].w[8:10]" 0.52451390027999878 0.019903393462300301 
		0.0012455799151211977;
	setAttr ".wl[1250].w[11]"  1;
	setAttr ".wl[1251].w[11]"  1;
	setAttr -s 5 ".wl[1252].w[8:12]"  7.2835121e-08 2.7246293e-07 
		0.00057616702 0.99941486 8.7243998e-06;
	setAttr -s 5 ".wl[1253].w[8:12]"  5.2586529e-05 0.00017428833 
		0.21021311 0.78912723 0.00043270478;
	setAttr -s 5 ".wl[1254].w";
	setAttr ".wl[1254].w[1:3]" 0.3762681782245636 0.56003564596176147 
		0.00063780770869925618;
	setAttr ".wl[1254].w[8]" 4.7630297217438056e-07;
	setAttr ".wl[1254].w[13]" 0.063057951629161835;
	setAttr -s 5 ".wl[1255].w";
	setAttr ".wl[1255].w[1:3]" 0.14299410581588745 0.78379607200622559 
		0.0031459871679544449;
	setAttr ".wl[1255].w[8]" 4.8051206249510869e-05;
	setAttr ".wl[1255].w[13]" 0.070015855133533478;
	setAttr -s 5 ".wl[1256].w";
	setAttr ".wl[1256].w[2:3]" 0.86597377061843872 0.0030659455806016922;
	setAttr ".wl[1256].w[8:10]" 0.10110979527235031 0.028300849720835686 
		0.0015496244886890054;
	setAttr -s 5 ".wl[1257].w";
	setAttr ".wl[1257].w[2:3]" 0.88465422391891479 6.7053442762698978e-05;
	setAttr ".wl[1257].w[8:10]" 0.035865388810634613 0.074684537947177887 
		0.0047287512570619583;
	setAttr -s 5 ".wl[1258].w";
	setAttr ".wl[1258].w[2:3]" 0.85091096162796021 0.011515515856444836;
	setAttr ".wl[1258].w[8:10]" 0.0067147351801395416 0.12150699645280838 
		0.0093517396599054337;
	setAttr -s 5 ".wl[1259].w";
	setAttr ".wl[1259].w[2:3]" 0.37332189083099365 5.2341416449053213e-05;
	setAttr ".wl[1259].w[8:10]" 0.59099501371383667 0.034129418432712555 
		0.0015013845404610038;
	setAttr -s 5 ".wl[1260].w";
	setAttr ".wl[1260].w[2:3]" 0.37246426939964294 5.3634255891665816e-05;
	setAttr ".wl[1260].w[8:10]" 0.60007774829864502 0.026213914155960083 
		0.0011903517879545689;
	setAttr -s 5 ".wl[1261].w";
	setAttr ".wl[1261].w[2:3]" 0.85259020328521729 0.01518205925822258;
	setAttr ".wl[1261].w[8:10]" 0.0018288457067683339 0.12041035294532776 
		0.0099886097013950348;
	setAttr -s 5 ".wl[1262].w";
	setAttr ".wl[1262].w[2:3]" 0.067062437534332275 0.00033830464235506952;
	setAttr ".wl[1262].w[8:10]" 0.88007074594497681 0.051652483642101288 
		0.0008761018980294466;
	setAttr -s 5 ".wl[1263].w";
	setAttr ".wl[1263].w[2:3]" 0.42243975400924683 0.0013429282698780298;
	setAttr ".wl[1263].w[8:10]" 0.55494695901870728 0.020347312092781067 
		0.00092306191800162196;
	setAttr -s 5 ".wl[1264].w";
	setAttr ".wl[1264].w[2:3]" 0.37278935313224792 0.00053870026022195816;
	setAttr ".wl[1264].w[8:10]" 0.61706703901290894 0.009203638881444931 
		0.00040133020957000554;
	setAttr -s 5 ".wl[1265].w";
	setAttr ".wl[1265].w[2:3]" 0.073056302964687347 0.00035500744706951082;
	setAttr ".wl[1265].w[8:10]" 0.87411463260650635 0.051499772816896439 
		0.00097426905995234847;
	setAttr -s 5 ".wl[1266].w";
	setAttr ".wl[1266].w[2:3]" 0.075800471007823944 0.00034718020469881594;
	setAttr ".wl[1266].w[8:10]" 0.87309175729751587 0.049730699509382248 
		0.0010299331042915583;
	setAttr -s 5 ".wl[1267].w";
	setAttr ".wl[1267].w[2:3]" 0.11459252238273621 0.00061372667551040649;
	setAttr ".wl[1267].w[8:10]" 0.80910468101501465 0.07378707081079483 
		0.0019019698956981301;
	setAttr -s 5 ".wl[1268].w";
	setAttr ".wl[1268].w[2:3]" 0.11555555462837219 0.00066882173996418715;
	setAttr ".wl[1268].w[8:10]" 0.79836130142211914 0.083351969718933105 
		0.002062374958768487;
	setAttr -s 5 ".wl[1269].w";
	setAttr ".wl[1269].w[2:3]" 0.57862627506256104 0.0023334051948040724;
	setAttr ".wl[1269].w[8:10]" 0.37823247909545898 0.038619250059127808 
		0.0021885174792259932;
	setAttr -s 5 ".wl[1270].w";
	setAttr ".wl[1270].w[2:3]" 0.11335204541683197 0.00034570420393720269;
	setAttr ".wl[1270].w[8:10]" 0.79514563083648682 0.089125700294971466 
		0.0020308722741901875;
	setAttr -s 5 ".wl[1271].w";
	setAttr ".wl[1271].w[2:3]" 0.094252601265907288 0.00024333738838322461;
	setAttr ".wl[1271].w[8:10]" 0.82542163133621216 0.078570172190666199 
		0.001512187416665256;
	setAttr -s 5 ".wl[1272].w";
	setAttr ".wl[1272].w[2:3]" 0.35089951753616333 0.00039732651202939451;
	setAttr ".wl[1272].w[8:10]" 0.62349814176559448 0.024247229099273682 
		0.00095781951677054167;
	setAttr -s 5 ".wl[1273].w";
	setAttr ".wl[1273].w[2:3]" 0.046871110796928406 0.00019361327576916665;
	setAttr ".wl[1273].w[8:10]" 0.91453653573989868 0.037840224802494049 
		0.00055857334518805146;
	setAttr -s 5 ".wl[1274].w";
	setAttr ".wl[1274].w[2:3]" 0.0049026068300008774 0.00011439144145697355;
	setAttr ".wl[1274].w[8:10]" 0.50311774015426636 0.48942789435386658 
		0.0024372120387852192;
	setAttr -s 5 ".wl[1275].w";
	setAttr ".wl[1275].w[2:3]" 0.015724902972579002 0.00019248639000579715;
	setAttr ".wl[1275].w[8:10]" 0.76219391822814941 0.22045481204986572 
		0.0014338886830955744;
	setAttr -s 5 ".wl[1276].w";
	setAttr ".wl[1276].w[2:3]" 0.019330238923430443 0.00023512859479524195;
	setAttr ".wl[1276].w[8:10]" 0.74818205833435059 0.23035426437854767 
		0.0018982982728630304;
	setAttr -s 5 ".wl[1277].w";
	setAttr ".wl[1277].w[2:3]" 0.0072746616788208485 0.00017301614570897073;
	setAttr ".wl[1277].w[8:10]" 0.50041759014129639 0.48795947432518005 
		0.0041753174737095833;
	setAttr -s 5 ".wl[1278].w";
	setAttr ".wl[1278].w[2:3]" 0.0089978091418743134 0.0002072321658488363;
	setAttr ".wl[1278].w[8:10]" 0.50221782922744751 0.48305597901344299 
		0.0055212047882378101;
	setAttr -s 5 ".wl[1279].w";
	setAttr ".wl[1279].w[2:3]" 0.02190648578107357 0.00025732305948622525;
	setAttr ".wl[1279].w[8:10]" 0.74583834409713745 0.22972927987575531 
		0.0022686491720378399;
	setAttr -s 5 ".wl[1280].w";
	setAttr ".wl[1280].w[2:3]" 0.021004956215620041 0.00024058969574980438;
	setAttr ".wl[1280].w[8:10]" 0.74871277809143066 0.22777868807315826 
		0.0022630426101386547;
	setAttr -s 5 ".wl[1281].w";
	setAttr ".wl[1281].w[2:3]" 0.0080495849251747131 0.00018233837909065187;
	setAttr ".wl[1281].w[8:10]" 0.49778670072555542 0.48854550719261169 
		0.0054358388297259808;
	setAttr -s 5 ".wl[1282].w";
	setAttr ".wl[1282].w[2:3]" 0.012673093937337399 0.00030339142540469766;
	setAttr ".wl[1282].w[8:10]" 0.49547544121742249 0.48341131210327148 
		0.0081368694081902504;
	setAttr -s 5 ".wl[1283].w";
	setAttr ".wl[1283].w[2:3]" 0.033732187002897263 0.00043866896885447204;
	setAttr ".wl[1283].w[8:10]" 0.68017596006393433 0.28171223402023315 
		0.003940933384001255;
	setAttr -s 5 ".wl[1284].w";
	setAttr ".wl[1284].w[2:3]" 0.030639328062534332 0.0004115866613574326;
	setAttr ".wl[1284].w[8:10]" 0.67710292339324951 0.288409024477005 
		0.0034372191876173019;
	setAttr -s 5 ".wl[1285].w";
	setAttr ".wl[1285].w[2:3]" 0.010087527334690094 0.0002465478319209069;
	setAttr ".wl[1285].w[8:10]" 0.49513432383537292 0.4884224534034729 
		0.0061091561801731586;
	setAttr -s 5 ".wl[1286].w";
	setAttr ".wl[1286].w[2:3]" 0.006213359534740448 0.00014685028872918338;
	setAttr ".wl[1286].w[8:10]" 0.49943450093269348 0.49100017547607422 
		0.0032050958834588528;
	setAttr -s 5 ".wl[1287].w";
	setAttr ".wl[1287].w[2:3]" 0.02261737734079361 0.00029537896625697613;
	setAttr ".wl[1287].w[8:10]" 0.70760291814804077 0.26722198724746704 
		0.0022623410914093256;
	setAttr -s 5 ".wl[1288].w";
	setAttr ".wl[1288].w[2:3]" 0.0090615162625908852 0.00010453016147948802;
	setAttr ".wl[1288].w[8:10]" 0.81258976459503174 0.1774526983499527 
		0.00079146033385768533;
	setAttr -s 5 ".wl[1289].w";
	setAttr ".wl[1289].w[2:3]" 0.0018736101919785142 4.1801467887125909e-05;
	setAttr ".wl[1289].w[8:10]" 0.50372272729873657 0.49342453479766846 
		0.00093735195696353912;
	setAttr -s 5 ".wl[1290].w[8:12]"  0.1035575 0.86579537 0.030495562 
		7.7499149e-05 7.404296e-05;
	setAttr -s 5 ".wl[1291].w[8:12]"  0.39401636 0.59752578 0.0083556436 
		5.2138581e-05 5.0090446e-05;
	setAttr -s 5 ".wl[1292].w[8:12]"  0.36815855 0.61750746 0.014176768 
		8.0730642e-05 7.6514334e-05;
	setAttr -s 5 ".wl[1293].w[8:12]"  0.11218975 0.83891529 0.048668291 
		0.0001167803 0.00010992849;
	setAttr -s 5 ".wl[1294].w[8:12]"  0.09486632 0.83674186 0.068126433 
		0.00013540548 0.00012992132;
	setAttr -s 5 ".wl[1295].w[8:12]"  0.32777816 0.65296757 0.019069469 
		9.4051458e-05 9.0694783e-05;
	setAttr -s 5 ".wl[1296].w[8:12]"  0.29702795 0.68503302 0.017780067 
		7.9098943e-05 7.9865793e-05;
	setAttr -s 5 ".wl[1297].w[8:12]"  0.084432706 0.85051173 0.064819582 
		0.00011741395 0.00011855188;
	setAttr -s 5 ".wl[1298].w[8:12]"  0.11490418 0.79723668 0.087471657 
		0.00018786562 0.00019960667;
	setAttr -s 5 ".wl[1299].w[8:12]"  0.34221366 0.63283032 0.024700085 
		0.0001244342 0.0001315376;
	setAttr -s 5 ".wl[1300].w[8:12]"  0.37592211 0.606327 0.017544676 
		9.9458812e-05 0.00010678963;
	setAttr -s 5 ".wl[1301].w[8:12]"  0.13223764 0.80523831 0.062200177 
		0.00015566131 0.00016827736;
	setAttr -s 5 ".wl[1302].w[8:12]"  0.11772595 0.84527767 0.036800571 
		9.498671e-05 0.00010089089;
	setAttr -s 5 ".wl[1303].w[8:12]"  0.39775911 0.5926581 0.0094627962 
		5.8331108e-05 6.1630533e-05;
	setAttr -s 5 ".wl[1304].w[8:12]"  0.36011925 0.63658828 0.0032537444 
		1.926502e-05 1.9395467e-05;
	setAttr -s 5 ".wl[1305].w[8:12]"  0.061056767 0.92688495 0.012001065 
		2.8553186e-05 2.8739496e-05;
	setAttr -s 5 ".wl[1306].w[8:12]"  0.001392138 0.57592088 0.42262965 
		2.936238e-05 2.793756e-05;
	setAttr -s 5 ".wl[1307].w[8:12]"  0.012269617 0.87965214 0.10796461 
		5.8183599e-05 5.5428871e-05;
	setAttr -s 5 ".wl[1308].w[8:12]"  0.015524179 0.81828272 0.16601966 
		8.9493224e-05 8.3922438e-05;
	setAttr -s 5 ".wl[1309].w[8:12]"  0.0016947122 0.54688627 
		0.45134607 3.7682446e-05 3.5279041e-05;
	setAttr -s 5 ".wl[1310].w[8:12]"  0.0014012714 0.50880122 
		0.48972481 3.7167014e-05 3.5537068e-05;
	setAttr -s 5 ".wl[1311].w[8:12]"  0.014684715 0.76010263 0.22500692 
		0.00010507351 0.00010057595;
	setAttr -s 5 ".wl[1312].w[8:12]"  0.013878699 0.75333983 0.23257922 
		0.00010060296 0.00010165841;
	setAttr -s 5 ".wl[1313].w[8:12]"  0.0015344076 0.50999284 
		0.48839438 3.9022681e-05 3.9415179e-05;
	setAttr -s 5 ".wl[1314].w[8:12]"  0.0028566716 0.50395751 
		0.49302506 7.7767472e-05 8.2932762e-05;
	setAttr -s 5 ".wl[1315].w[8:12]"  0.021708494 0.70728987 0.27065697 
		0.00016680162 0.00017789047;
	setAttr -s 5 ".wl[1316].w[8:12]"  0.024041845 0.75979531 0.21585225 
		0.0001488397 0.00016172582;
	setAttr -s 5 ".wl[1317].w[8:12]"  0.0035997743 0.52797288 
		0.46825641 8.1929924e-05 8.9074674e-05;
	setAttr -s 5 ".wl[1318].w[8:12]"  0.0025507144 0.55290031 
		0.44443628 5.4496391e-05 5.8117075e-05;
	setAttr -s 5 ".wl[1319].w[8:12]"  0.018200044 0.83830315 0.1433101 
		9.0361456e-05 9.6363088e-05;
	setAttr -s 5 ".wl[1320].w[8:12]"  0.0059501827 0.94323504 
		0.050768279 2.3170638e-05 2.3336119e-05;
	setAttr -s 5 ".wl[1321].w[8:12]"  0.00097075285 0.65109909 
		0.34789509 1.7483295e-05 1.7598875e-05;
	setAttr -s 5 ".wl[1322].w[8:12]"  0.0022925613 0.054608051 
		0.94004506 0.0016744052 0.0013799024;
	setAttr -s 5 ".wl[1323].w[8:12]"  0.0011955348 0.23782054 
		0.76077801 0.00010703364 9.8981582e-05;
	setAttr -s 5 ".wl[1324].w[8:12]"  0.0015843154 0.25745752 
		0.74064636 0.00016420576 0.00014751428;
	setAttr -s 5 ".wl[1325].w[8:12]"  0.0037609192 0.07362473 
		0.91605985 0.0037349658 0.0028195267;
	setAttr -s 5 ".wl[1326].w[8:12]"  0.004152738 0.096486345 
		0.89303172 0.0034539953 0.0028751933;
	setAttr -s 5 ".wl[1327].w[8:12]"  0.0016495471 0.2880201 0.70998961 
		0.00017653807 0.00016419284;
	setAttr -s 5 ".wl[1328].w[8:12]"  0.0018009356 0.29518342 
		0.70260507 0.00020440985 0.00020620383;
	setAttr -s 5 ".wl[1329].w[8:12]"  0.0048242765 0.10184715 
		0.88352507 0.0049030767 0.0049004056;
	setAttr -s 5 ".wl[1330].w[8:12]"  0.0040733456 0.084037147 
		0.90775311 0.00033079326 0.0038055815;
	setAttr -s 5 ".wl[1331].w[8:12]"  0.0025386978 0.28629953 
		0.71059442 0.0002707704 0.0002965717;
	setAttr -s 5 ".wl[1332].w[8:12]"  0.002660343 0.25420582 0.74255174 
		0.00027281552 0.00030923699;
	setAttr -s 5 ".wl[1333].w[8:12]"  0.0031694099 0.05201073 
		0.79297996 0.0016910975 0.15014881;
	setAttr -s 5 ".wl[1334].w[8:12]"  0.0025418289 0.049531203 
		0.81627959 0.0017116913 0.12993568;
	setAttr -s 5 ".wl[1335].w[8:12]"  0.0019781289 0.24254397 
		0.75510883 0.00017588827 0.00019310598;
	setAttr -s 5 ".wl[1336].w[8:12]"  0.00094503473 0.20876087 
		0.79012656 8.3459599e-05 8.4045947e-05;
	setAttr -s 5 ".wl[1337].w[8:12]"  0.0021880711 0.046496853 
		0.94751632 0.0018920817 0.0019065888;
	setAttr ".wl[1338].w[12]"  1;
	setAttr ".wl[1339].w[12]"  1;
	setAttr -s 5 ".wl[1340].w[8:12]"  1.2811935e-07 5.6134888e-07 
		0.2522029 0.00014313871 0.74765325;
	setAttr -s 5 ".wl[1341].w[8:12]"  8.1106104e-05 0.00026426095 
		0.28473032 0.0072159609 0.70770836;
	setAttr -s 5 ".wl[1342].w[8:12]"  0.0039793099 0.037103195 
		0.68577456 0.26326182 0.0098811612;
	setAttr -s 5 ".wl[1343].w[8:12]"  0.004022019 0.044012696 
		0.73967069 0.20520157 0.0070930375;
	setAttr -s 5 ".wl[1344].w[8:12]"  0.0041738334 0.046728168 
		0.73198861 0.20934175 0.0077676862;
	setAttr -s 5 ".wl[1345].w[8:12]"  0.0039480682 0.038852278 
		0.68399775 0.26338384 0.0098180734;
	setAttr -s 5 ".wl[1346].w[8:12]"  0.0051900633 0.05164839 
		0.72189331 0.20709103 0.014177239;
	setAttr -s 5 ".wl[1347].w[8:12]"  0.0058995918 0.067718111 
		0.81005746 0.10467414 0.011650647;
	setAttr -s 5 ".wl[1348].w[8:12]"  0.0051804264 0.064420134 
		0.90236086 0.015250508 0.012788049;
	setAttr -s 5 ".wl[1349].w[8:12]"  0.0051140217 0.055381496 
		0.89093757 0.032108091 0.016458891;
	setAttr -s 5 ".wl[1350].w[8:12]"  0.0017317333 0.021950766 
		0.72898775 0.24067087 0.0066588665;
	setAttr -s 5 ".wl[1351].w[8:12]"  0.002085468 0.026103245 
		0.6768977 0.13082094 0.16409269;
	setAttr -s 5 ".wl[1352].w[8:12]"  2.610288e-06 4.0001829e-05 
		0.40396142 0.35049218 0.24550377;
	setAttr -s 5 ".wl[1353].w[8:12]"  7.3421652e-06 0.0001132859 
		0.51390439 0.48594359 3.1402858e-05;
	setAttr -s 5 ".wl[1354].w[8:12]"  0.00027031783 0.0034620517 
		0.52974761 0.46552649 0.00099351536;
	setAttr -s 5 ".wl[1355].w[8:12]"  0.0010373455 0.011829375 
		0.54167104 0.30497995 0.14048238;
	setAttr -s 5 ".wl[1356].w[8:12]"  0.0025781409 0.030330833 
		0.80394065 0.15756053 0.005589786;
	setAttr -s 5 ".wl[1357].w[8:12]"  0.0028061264 0.028009955 
		0.73589557 0.22522065 0.0080676489;
	setAttr ".wl[1358].w[11]"  1;
	setAttr -s 5 ".wl[1359].w[8:12]"  0.004399959 0.033379845 
		0.65847462 0.28658658 0.017159021;
	setAttr -s 5 ".wl[1360].w[8:12]"  0.0038115508 0.031061636 
		0.6883567 0.2613962 0.01537394;
	setAttr -s 5 ".wl[1361].w[8:12]"  0.00011026215 0.00060452521 
		0.025481785 0.97218591 0.001617517;
	setAttr -s 5 ".wl[1362].w[8:12]"  0.0015364174 0.0089422958 
		0.3151578 0.65169698 0.022666512;
	setAttr -s 5 ".wl[1363].w[8:12]"  0.0044609304 0.037966102 
		0.67300367 0.26538286 0.019186378;
	setAttr -s 5 ".wl[1364].w[8:12]"  0.0042359247 0.038459543 
		0.79572797 0.13933806 0.022238493;
	setAttr -s 5 ".wl[1365].w[8:12]"  0.0015315448 0.0094022742 
		0.47679368 0.504067 0.0082053905;
	setAttr -s 5 ".wl[1366].w[8:12]"  0.0004285402 0.0029437656 
		0.48528081 0.51121193 0.0001349704;
	setAttr -s 5 ".wl[1367].w[8:12]"  0.00077057001 0.0082788235 
		0.5269925 0.45878634 0.0051717227;
	setAttr -s 5 ".wl[1368].w[8:12]"  1.0682562e-06 1.2846493e-05 
		0.40037525 0.59960204 8.7873241e-06;
	setAttr -s 2 ".wl[1369].w[10:11]"  0.043783545 0.95621645;
	setAttr -s 5 ".wl[1370].w[8:12]"  5.6630593e-05 0.00035153123 
		0.06818562 0.92955631 0.0018499077;
	setAttr -s 5 ".wl[1371].w[8:12]"  0.00032659288 0.0032322619 
		0.39559829 0.59872639 0.0021164718;
	setAttr -s 5 ".wl[1372].w[8:12]"  0.0026639486 0.02194773 
		0.70899981 0.25331044 0.013078012;
	setAttr -s 5 ".wl[1373].w[8:12]"  0.0001616021 0.00087849295 
		0.044563916 0.95113206 0.0032639287;
	setAttr -s 5 ".wl[1374].w[8:12]"  0.00043392714 0.0051950458 
		0.65986353 0.054397121 0.28011036;
	setAttr -s 5 ".wl[1375].w[8:12]"  2.1422043e-06 3.2550011e-05 
		0.62761688 0.11557001 0.25677836;
	setAttr -s 5 ".wl[1376].w[8:12]"  0.0015916612 0.019341426 
		0.63050437 0.0058733542 0.34268922;
	setAttr -s 5 ".wl[1377].w[8:12]"  0.0037425789 0.043824695 
		0.66064644 0.0036501458 0.28813615;
	setAttr -s 5 ".wl[1378].w[8:12]"  0.0033472017 0.033472683 
		0.56768382 0.0026697733 0.39282653;
	setAttr -s 5 ".wl[1379].w[8:12]"  0.0040294211 0.035361055 
		0.50369209 0.0010891728 0.45582825;
	setAttr -s 5 ".wl[1380].w[8:12]"  0.0050621345 0.051080994 
		0.62971824 0.00062821509 0.31351045;
	setAttr -s 5 ".wl[1381].w[8:12]"  0.0024756591 0.02440702 
		0.50610834 0.00019668501 0.46681228;
	setAttr -s 5 ".wl[1382].w[8:12]"  0.0014642994 0.012945089 
		0.31766349 0.00094503735 0.66698211;
	setAttr -s 5 ".wl[1383].w[8:12]"  0.0026168011 0.021029511 
		0.40069309 0.0076278471 0.56803274;
	setAttr -s 5 ".wl[1384].w[8:12]"  0.0032634069 0.030105369 
		0.50368351 0.0067310696 0.45621663;
	setAttr -s 5 ".wl[1385].w[8:12]"  0.003898761 0.038854782 
		0.74722594 0.0089365803 0.20108397;
	setAttr -s 5 ".wl[1386].w[8:12]"  0.0041577504 0.033219039 
		0.53204417 0.012601624 0.41797739;
	setAttr -s 5 ".wl[1387].w[8:12]"  4.2778691e-05 0.00026618931 
		0.073599227 6.6239067e-05 0.92602557;
	setAttr -s 5 ".wl[1388].w[8:12]"  0.00061642885 0.0057710498 
		0.62390441 0.0012914415 0.36841664;
	setAttr -s 5 ".wl[1389].w[8:12]"  7.9660288e-07 9.4293873e-06 
		0.52971095 0.078179285 0.39209956;
	setAttr ".wl[1390].w[12]"  1;
	setAttr ".wl[1391].w[12]"  1;
	setAttr -s 5 ".wl[1392].w[8:12]"  0.0005607467 0.005747559 
		0.30756807 0.015298284 0.67082536;
	setAttr -s 5 ".wl[1393].w[8:12]"  0.0026912556 0.022651888 
		0.45576569 0.0048133894 0.51407778;
	setAttr ".wl[1394].w[12]"  1;
	setAttr ".wl[1395].w[12]"  1;
	setAttr -s 5 ".wl[1396].w[8:12]"  0.0011018068 0.0085688531 
		0.1770342 0.00015069003 0.81314445;
	setAttr -s 5 ".wl[1397].w[8:12]"  9.6000054e-05 0.00072912331 
		0.024840424 0.00022068866 0.97411376;
	setAttr ".wl[1398].w[12]"  1;
	setAttr -s 5 ".wl[1399].w[8:12]"  0.00018711858 0.00090155116 
		0.031697687 0.0018100854 0.96540356;
	setAttr -s 5 ".wl[1400].w[8:12]"  0.0020370088 0.013769225 
		0.29726952 0.0059714294 0.68095279;
	setAttr -s 5 ".wl[1401].w[8:12]"  0.0017784528 0.01284427 
		0.33466208 0.0092828646 0.64143234;
	setAttr ".wl[1402].w[12]"  1;
	setAttr -s 5 ".wl[1403].w";
	setAttr ".wl[1403].w[0:3]" 0.23238809406757355 0.43879371881484985 
		0.32704684138298035 1.0987550012941938e-05;
	setAttr ".wl[1403].w[8]" 0.0017603212036192417;
	setAttr -s 5 ".wl[1404].w";
	setAttr ".wl[1404].w[0:3]" 0.14462672173976898 0.4278545081615448 
		0.42745622992515564 1.1007588000211399e-05;
	setAttr ".wl[1404].w[8]" 5.1489270845195279e-05;
	setAttr -s 5 ".wl[1405].w";
	setAttr ".wl[1405].w[0:3]" 0.13832493126392365 0.49553036689758301 
		0.36549428105354309 1.4508814274449833e-05;
	setAttr ".wl[1405].w[8]" 0.00063593097729608417;
	setAttr -s 5 ".wl[1406].w";
	setAttr ".wl[1406].w[0:3]" 0.23541097342967987 0.49056610465049744 
		0.27384233474731445 7.5097450462635607e-06;
	setAttr ".wl[1406].w[8]" 0.00017305091023445129;
	setAttr -s 6 ".wl[1407].w";
	setAttr ".wl[1407].w[1:4]" 0.28769165277481079 0.56018227338790894 
		0.0012548161903396249 0.060200784355401993;
	setAttr ".wl[1407].w[8]" 0.0017203046008944511;
	setAttr ".wl[1407].w[13]" 0.088950149714946747;
	setAttr -s 6 ".wl[1408].w";
	setAttr ".wl[1408].w[1:4]" 0.22159543633460999 0.63499653339385986 
		0.0056983297690749168 0.053889412432909012;
	setAttr ".wl[1408].w[8]" 0.0018351954640820622;
	setAttr ".wl[1408].w[13]" 0.081985056400299072;
	setAttr -s 6 ".wl[1409].w";
	setAttr ".wl[1409].w[1:4]" 0.27530345320701599 0.57723140716552734 
		0.00014531869965139776 0.046121571213006973;
	setAttr ".wl[1409].w[8]" 0.0018087325152009726;
	setAttr ".wl[1409].w[13]" 0.099389463663101196;
	setAttr -s 6 ".wl[1410].w";
	setAttr ".wl[1410].w[1:4]" 0.35494789481163025 0.48767030239105225 
		0.00011331951827742159 0.053889412432909012;
	setAttr ".wl[1410].w[8]" 0.00013858141028322279;
	setAttr ".wl[1410].w[13]" 0.1032404899597168;
	setAttr -s 4 ".wl[1411].w";
	setAttr ".wl[1411].w[2:3]" 0.84595447778701782 0.013246254064142704;
	setAttr ".wl[1411].w[9:10]" 0.12823112308979034 0.012568105943500996;
	setAttr -s 5 ".wl[1412].w";
	setAttr ".wl[1412].w[2:3]" 0.77915847301483154 0.0019942899234592915;
	setAttr ".wl[1412].w[8:10]" 0.1594747006893158 0.055232148617506027 
		0.0041403411887586117;
	setAttr -s 4 ".wl[1413].w";
	setAttr ".wl[1413].w[2:3]" 0.8341062068939209 0.014068808406591415;
	setAttr ".wl[1413].w[9:10]" 0.13633048534393311 0.015494531951844692;
	setAttr -s 5 ".wl[1414].w";
	setAttr ".wl[1414].w[1:3]" 0.18370123207569122 0.5038190484046936 
		0.0061837956309318542;
	setAttr ".wl[1414].w[8]" 0.045115821063518524;
	setAttr ".wl[1414].w[13]" 0.26118013262748718;
	setAttr -s 5 ".wl[1415].w";
	setAttr ".wl[1415].w[1:3]" 0.21507678925991058 0.44335445761680603 
		0.00044936808990314603;
	setAttr ".wl[1415].w[8]" 0.0097496993839740753;
	setAttr ".wl[1415].w[13]" 0.33136963844299316;
	setAttr -s 4 ".wl[1416].w";
	setAttr ".wl[1416].w[1:2]" 0.40233072638511658 0.47385478019714355;
	setAttr ".wl[1416].w[8]" 0.0003713261685334146;
	setAttr ".wl[1416].w[13]" 0.12344314903020859;
	setAttr -s 5 ".wl[1417].w";
	setAttr ".wl[1417].w[1:3]" 0.42745953798294067 0.47526735067367554 
		4.1690350371936802e-06;
	setAttr ".wl[1417].w[8]" 0.00085595459677278996;
	setAttr ".wl[1417].w[13]" 0.096413016319274902;
	setAttr -s 6 ".wl[1418].w";
	setAttr ".wl[1418].w[1:4]" 0.22579526901245117 0.70073246955871582 
		6.0208972172404174e-06 0.00072823528898879886;
	setAttr ".wl[1418].w[8]" 0.0011585914762690663;
	setAttr ".wl[1418].w[13]" 0.071579411625862122;
	setAttr -s 6 ".wl[1419].w";
	setAttr ".wl[1419].w[1:4]" 0.25665190815925598 0.64668875932693481 
		5.0893508159788325e-05 0.0026701961178332567;
	setAttr ".wl[1419].w[8]" 0.0010692551732063293;
	setAttr ".wl[1419].w[13]" 0.092869028449058533;
	setAttr -s 5 ".wl[1420].w";
	setAttr ".wl[1420].w[1:3]" 0.11375206708908081 0.81366473436355591 
		0.0010395681019872427;
	setAttr ".wl[1420].w[8]" 0.01272894348949194;
	setAttr ".wl[1420].w[13]" 0.058814723044633865;
	setAttr -s 5 ".wl[1421].w";
	setAttr ".wl[1421].w[2:3]" 0.79071527719497681 0.00048907723976299167;
	setAttr ".wl[1421].w[8:10]" 0.14321747422218323 0.060082141309976578 
		0.0054961545392870903;
	setAttr -s 5 ".wl[1422].w";
	setAttr ".wl[1422].w[2:3]" 0.65539509057998657 0.0040913233533501625;
	setAttr ".wl[1422].w[8:10]" 0.30098283290863037 0.036773514002561569 
		0.0027571914251893759;
	setAttr -s 5 ".wl[1423].w";
	setAttr ".wl[1423].w[2:3]" 0.79548579454421997 0.0058867763727903366;
	setAttr ".wl[1423].w[8:10]" 0.14152130484580994 0.052360221743583679 
		0.0047457907348871231;
	setAttr -s 5 ".wl[1424].w";
	setAttr ".wl[1424].w[1:3]" 0.079397395253181458 0.81486994028091431 
		0.0094149764627218246;
	setAttr ".wl[1424].w[8]" 0.021381132304668427;
	setAttr ".wl[1424].w[13]" 0.074936583638191223;
	setAttr -s 5 ".wl[1425].w";
	setAttr ".wl[1425].w[2:3]" 0.86651980876922607 0.007068974431604147;
	setAttr ".wl[1425].w[8:10]" 0.07615150511264801 0.046460144221782684 
		0.0037996615283191204;
	setAttr -s 5 ".wl[1426].w";
	setAttr ".wl[1426].w[1:3]" 0.123431496322155 0.70802032947540283 
		0.010515362024307251;
	setAttr ".wl[1426].w[8]" 0.010154791176319122;
	setAttr ".wl[1426].w[13]" 0.14787805080413818;
	setAttr -s 4 ".wl[1427].w";
	setAttr ".wl[1427].w[1:3]" 0.13592435419559479 0.69200736284255981 
		0.012522951699793339;
	setAttr ".wl[1427].w[13]" 0.15954531729221344;
	setAttr -s 5 ".wl[1428].w";
	setAttr ".wl[1428].w[1:3]" 0.26111599802970886 0.37243059277534485 
		0.00024628115352243185;
	setAttr ".wl[1428].w[8]" 0.00070659688208252192;
	setAttr ".wl[1428].w[13]" 0.36550053954124451;
	setAttr -s 5 ".wl[1429].w";
	setAttr ".wl[1429].w[0:3]" 0.072766765952110291 0.52968299388885498 
		0.39730137586593628 4.6289119381981436e-06;
	setAttr ".wl[1429].w[8]" 0.00024418023531325161;
	setAttr -s 4 ".wl[1430].w";
	setAttr ".wl[1430].w[0:2]" 0.09029630571603775 0.48695147037506104 
		0.42252695560455322;
	setAttr ".wl[1430].w[8]" 0.00022522860672324896;
	setAttr -s 5 ".wl[1431].w";
	setAttr ".wl[1431].w[0:2]" 0.42484596371650696 0.4139535129070282 
		0.091390550136566162;
	setAttr ".wl[1431].w[20:21]" 0.06632484495639801 0.0034850970841944218;
	setAttr -s 5 ".wl[1432].w";
	setAttr ".wl[1432].w[0:3]" 0.36987277865409851 0.47610998153686523 
		0.14531157910823822 2.845374183380045e-06;
	setAttr ".wl[1432].w[8]" 0.0087028210982680321;
	setAttr -s 4 ".wl[1433].w";
	setAttr ".wl[1433].w[0:2]" 0.40491119027137756 0.48079979419708252 
		0.10728321969509125;
	setAttr ".wl[1433].w[8]" 0.0070058330893516541;
	setAttr -s 5 ".wl[1434].w";
	setAttr ".wl[1434].w[0:2]" 0.43142086267471313 0.42140233516693115 
		0.078894823789596558;
	setAttr ".wl[1434].w[20:21]" 0.064902685582637787 0.0033793156035244465;
	setAttr -s 6 ".wl[1435].w";
	setAttr ".wl[1435].w[0:2]" 0.24953846633434296 0.24725630879402161 
		0.19200852513313293;
	setAttr ".wl[1435].w[4]" 0.058987058699131012;
	setAttr ".wl[1435].w[20:21]" 0.16906635463237762 0.083143197000026703;
	setAttr -s 6 ".wl[1436].w";
	setAttr ".wl[1436].w[0:4]" 0.36834818124771118 0.38223832845687866 
		0.18110679090023041 1.0787939572765026e-05 0.055588629096746445;
	setAttr ".wl[1436].w[8]" 0.012707305140793324;
	setAttr -s 6 ".wl[1437].w";
	setAttr ".wl[1437].w[0:4]" 0.36679339408874512 0.40655240416526794 
		0.18419329822063446 9.798210157896392e-06 0.041509412229061127;
	setAttr ".wl[1437].w[8]" 0.00094169093063101172;
	setAttr -s 6 ".wl[1438].w";
	setAttr ".wl[1438].w[0:2]" 0.38705536723136902 0.37786448001861572 
		0.11433561146259308;
	setAttr ".wl[1438].w[4]" 0.047335293143987656;
	setAttr ".wl[1438].w[20:21]" 0.069489412009716034 0.0039198207668960094;
	setAttr -s 5 ".wl[1439].w";
	setAttr ".wl[1439].w[1:3]" 0.42478534579277039 0.4662836492061615 
		1.6377285646740347e-05;
	setAttr ".wl[1439].w[8]" 0.00081638526171445847;
	setAttr ".wl[1439].w[13]" 0.10809817910194397;
	setAttr -s 5 ".wl[1440].w";
	setAttr ".wl[1440].w[0:3]" 0.089201860129833221 0.51466304063796997 
		0.39567723870277405 6.3436377786274534e-06;
	setAttr ".wl[1440].w[8]" 0.00045153626706451178;
	setAttr -s 4 ".wl[1441].w";
	setAttr ".wl[1441].w[0:2]" 0.078438952565193176 0.5377078652381897 
		0.3838440477848053;
	setAttr ".wl[1441].w[8]" 9.2453519755508751e-06;
	setAttr -s 5 ".wl[1442].w";
	setAttr ".wl[1442].w[0:3]" 0.089721992611885071 0.54966229200363159 
		0.3605787456035614 3.6086068575968966e-05;
	setAttr ".wl[1442].w[8]" 9.060661909643386e-07;
	setAttr -s 5 ".wl[1443].w";
	setAttr ".wl[1443].w[0:3]" 0.35602691769599915 0.52695709466934204 
		0.11023864150047302 4.8592564780847169e-06;
	setAttr ".wl[1443].w[8]" 0.0067724860273301601;
	setAttr -s 5 ".wl[1444].w";
	setAttr ".wl[1444].w[0:3]" 0.36118164658546448 0.50146424770355225 
		0.13703036308288574 1.1527469041539007e-06;
	setAttr ".wl[1444].w[8]" 0.00032263839966617525;
	setAttr -s 5 ".wl[1445].w";
	setAttr ".wl[1445].w[1:4]" 0.15884594619274139 0.75860434770584106 
		0.00047557742800563574 0.018934117630124092;
	setAttr ".wl[1445].w[13]" 0.06313999742269516;
	setAttr -s 6 ".wl[1446].w";
	setAttr ".wl[1446].w[1:4]" 0.239365354180336 0.65932190418243408 
		0.00011790583084803075 0.016263922676444054;
	setAttr ".wl[1446].w[8]" 0.0025218958035111427;
	setAttr ".wl[1446].w[13]" 0.082408994436264038;
	setAttr -s 5 ".wl[1447].w";
	setAttr ".wl[1447].w[0:3]" 0.33945563435554504 0.45237153768539429 
		0.17644844949245453 1.0711540198826697e-05;
	setAttr ".wl[1447].w[8]" 0.031713690608739853;
	setAttr -s 6 ".wl[1448].w";
	setAttr ".wl[1448].w[0:4]" 0.32722309231758118 0.41016009449958801 
		0.20950004458427429 3.7155707559577422e-06 0.04636431485414505;
	setAttr ".wl[1448].w[8]" 0.0067486469633877277;
	setAttr -s 6 ".wl[1449].w";
	setAttr ".wl[1449].w[0:4]" 0.32332661747932434 0.39428654313087463 
		0.2357792854309082 3.3217015698028263e-06 0.043936863541603088;
	setAttr ".wl[1449].w[8]" 0.0026673940010368824;
	setAttr -s 5 ".wl[1450].w";
	setAttr ".wl[1450].w[0:2]" 0.26857918500900269 0.33650234341621399 
		0.32658675312995911;
	setAttr ".wl[1450].w[4]" 0.06165725365281105;
	setAttr ".wl[1450].w[8]" 0.0066744992509484291;
	setAttr -s 6 ".wl[1451].w";
	setAttr ".wl[1451].w[0:4]" 0.30289930105209351 0.35710647702217102 
		0.25289681553840637 8.067111048148945e-05 0.059715293347835541;
	setAttr ".wl[1451].w[8]" 0.027301551774144173;
	setAttr -s 4 ".wl[1452].w";
	setAttr ".wl[1452].w[1:3]" 0.24062924087047577 0.69081062078475952 
		0.012582913972437382;
	setAttr ".wl[1452].w[13]" 0.055977150797843933;
	setAttr -s 5 ".wl[1453].w";
	setAttr ".wl[1453].w[1:4]" 0.26590588688850403 0.61089813709259033 
		0.0038536123465746641 0.047578040510416031;
	setAttr ".wl[1453].w[13]" 0.071764364838600159;
	setAttr -s 6 ".wl[1454].w";
	setAttr ".wl[1454].w[0:2]" 0.49649965763092041 0.17029048502445221 
		0.021272227168083191;
	setAttr ".wl[1454].w[4]" 0.057773333042860031;
	setAttr ".wl[1454].w[20:21]" 0.24718576669692993 0.0069784927181899548;
	setAttr -s 6 ".wl[1455].w";
	setAttr ".wl[1455].w[0:2]" 0.52473831176757812 0.25635093450546265 
		0.028211396187543869;
	setAttr ".wl[1455].w[4]" 0.021118823438882828;
	setAttr ".wl[1455].w[20:21]" 0.16473691165447235 0.0048436573706567287;
	setAttr -s 5 ".wl[1456].w";
	setAttr ".wl[1456].w[0:2]" 0.54679787158966064 0.27080675959587097 
		0.024742839857935905;
	setAttr ".wl[1456].w[20:21]" 0.15330229699611664 0.0043501853942871094;
	setAttr -s 6 ".wl[1457].w";
	setAttr ".wl[1457].w[0:2]" 0.5303768515586853 0.17692366242408752 
		0.019182857125997543;
	setAttr ".wl[1457].w[4]" 0.011651764623820782;
	setAttr ".wl[1457].w[20:21]" 0.2550046443939209 0.0068602850660681725;
	setAttr -s 6 ".wl[1458].w";
	setAttr ".wl[1458].w[0:2]" 0.48226377367973328 0.17200906574726105 
		0.027320880442857742;
	setAttr ".wl[1458].w[4]" 0.039081960916519165;
	setAttr ".wl[1458].w[20:21]" 0.2705872654914856 0.0087371114641427994;
	setAttr -s 6 ".wl[1459].w";
	setAttr ".wl[1459].w[0:2]" 0.49975070357322693 0.24026699364185333 
		0.035596068948507309;
	setAttr ".wl[1459].w[4]" 0.021847059950232506;
	setAttr ".wl[1459].w[20:21]" 0.19615846872329712 0.0063806339167058468;
	setAttr -s 6 ".wl[1460].w";
	setAttr ".wl[1460].w[0:2]" 0.50184619426727295 0.26072454452514648 
		0.036239273846149445;
	setAttr ".wl[1460].w[4]" 0.019905097782611847;
	setAttr ".wl[1460].w[20:21]" 0.17552819848060608 0.0057567358016967773;
	setAttr -s 6 ".wl[1461].w";
	setAttr ".wl[1461].w[0:2]" 0.47655373811721802 0.17470720410346985 
		0.026271764189004898;
	setAttr ".wl[1461].w[4]" 0.05655960738658905;
	setAttr ".wl[1461].w[20:21]" 0.2576429545879364 0.0082647474482655525;
	setAttr -s 5 ".wl[1462].w";
	setAttr ".wl[1462].w[0:3]" 0.36106285452842712 0.51665127277374268 
		0.10648126155138016 6.4386681515316013e-06;
	setAttr ".wl[1462].w[8]" 0.01579812727868557;
	setAttr -s 5 ".wl[1463].w";
	setAttr ".wl[1463].w[0:2]" 0.57080841064453125 0.33637741208076477 
		0.01935616135597229;
	setAttr ".wl[1463].w[20:21]" 0.07157927006483078 0.0018787061562761664;
	setAttr -s 5 ".wl[1464].w";
	setAttr ".wl[1464].w[0:2]" 0.51417118310928345 0.34675413370132446 
		0.03254927322268486;
	setAttr ".wl[1464].w[20:21]" 0.10309312492609024 0.0034322885330766439;
	setAttr -s 6 ".wl[1465].w";
	setAttr ".wl[1465].w[0:4]" 0.34569752216339111 0.370332270860672 
		0.20486605167388916 3.6670433473773301e-05 0.06165725365281105;
	setAttr ".wl[1465].w[8]" 0.017410209402441978;
	setAttr -s 6 ".wl[1466].w";
	setAttr ".wl[1466].w[0:4]" 0.33107864856719971 0.4019642174243927 
		0.21797695755958557 9.3395110525307246e-06 0.047578040510416031;
	setAttr ".wl[1466].w[8]" 0.0013928776606917381;
	setAttr -s 5 ".wl[1467].w";
	setAttr ".wl[1467].w[0:2]" 0.51158541440963745 0.32996276021003723 
		0.036940775811672211;
	setAttr ".wl[1467].w[20:21]" 0.11757798492908478 0.0039330869913101196;
	setAttr -s 5 ".wl[1468].w";
	setAttr ".wl[1468].w[0:2]" 0.56806766986846924 0.31977465748786926 
		0.023147936910390854;
	setAttr ".wl[1468].w[20:21]" 0.086725980043411255 0.0022837021388113499;
	setAttr -s 6 ".wl[1469].w";
	setAttr ".wl[1469].w[0:2]" 0.52942407131195068 0.32307282090187073 
		0.032975360751152039;
	setAttr ".wl[1469].w[4]" 0.012622745707631111;
	setAttr ".wl[1469].w[20:21]" 0.098972417414188385 0.0029325413051992655;
	setAttr -s 6 ".wl[1470].w";
	setAttr ".wl[1470].w[0:2]" 0.47157374024391174 0.31776183843612671 
		0.046237852424383163;
	setAttr ".wl[1470].w[4]" 0.038596473634243011;
	setAttr ".wl[1470].w[20:21]" 0.12138134986162186 0.0044487388804554939;
	setAttr -s 6 ".wl[1471].w";
	setAttr ".wl[1471].w[0:2]" 0.42930802702903748 0.33722406625747681 
		0.067638769745826721;
	setAttr ".wl[1471].w[4]" 0.054860390722751617;
	setAttr ".wl[1471].w[20:21]" 0.10637180507183075 0.0045969020575284958;
	setAttr -s 5 ".wl[1472].w";
	setAttr ".wl[1472].w[0:2]" 0.51191741228103638 0.33896973729133606 
		0.044080551713705063;
	setAttr ".wl[1472].w[20:21]" 0.10171953588724136 0.0033127591013908386;
	setAttr -s 6 ".wl[1473].w";
	setAttr ".wl[1473].w[0:2]" 0.41169151663780212 0.39956223964691162 
		0.10440779477357864;
	setAttr ".wl[1473].w[4]" 0.030828626826405525;
	setAttr ".wl[1473].w[20:21]" 0.051077805459499359 0.0024319954682141542;
	setAttr -s 6 ".wl[1474].w";
	setAttr ".wl[1474].w[0:2]" 0.38511097431182861 0.36857166886329651 
		0.11687831580638885;
	setAttr ".wl[1474].w[4]" 0.057287842035293579;
	setAttr ".wl[1474].w[20:21]" 0.068538330495357513 0.0036128538195043802;
	setAttr -s 5 ".wl[1475].w";
	setAttr ".wl[1475].w[0:2]" 0.52023446559906006 0.01417431328445673 
		0.0014243863988667727;
	setAttr ".wl[1475].w[20:21]" 0.46171784400939941 0.0024491122458130121;
	setAttr -s 5 ".wl[1476].w";
	setAttr ".wl[1476].w[0:2]" 0.58711141347885132 0.039891775697469711 
		0.0036979496944695711;
	setAttr ".wl[1476].w[20:21]" 0.36604529619216919 0.003253650851547718;
	setAttr -s 5 ".wl[1477].w";
	setAttr ".wl[1477].w[0:2]" 0.59575748443603516 0.03363177552819252 
		0.0028404647018760443;
	setAttr ".wl[1477].w[20:21]" 0.36497041583061218 0.0027998776640743017;
	setAttr -s 5 ".wl[1478].w";
	setAttr ".wl[1478].w[0:2]" 0.53114616870880127 0.012200856581330299 
		0.0011216347338631749;
	setAttr ".wl[1478].w[20:21]" 0.45356914401054382 0.0019621287938207388;
	setAttr -s 5 ".wl[1479].w";
	setAttr ".wl[1479].w[0:2]" 0.50317597389221191 0.016049293801188469 
		0.001835545408539474;
	setAttr ".wl[1479].w[20:21]" 0.47567790746688843 0.0032613871153444052;
	setAttr -s 5 ".wl[1480].w";
	setAttr ".wl[1480].w[0:2]" 0.54459220170974731 0.053649522364139557 
		0.0063093947246670723;
	setAttr ".wl[1480].w[20:21]" 0.39021328091621399 0.0052355891093611717;
	setAttr -s 5 ".wl[1481].w";
	setAttr ".wl[1481].w[0:2]" 0.55413508415222168 0.043131664395332336 
		0.0046428889036178589;
	setAttr ".wl[1481].w[20:21]" 0.3937666118144989 0.0043236692436039448;
	setAttr -s 5 ".wl[1482].w";
	setAttr ".wl[1482].w[0:2]" 0.51065748929977417 0.017825959250330925 
		0.0019579939544200897;
	setAttr ".wl[1482].w[20:21]" 0.46627292037010193 0.0032857139594852924;
	setAttr -s 5 ".wl[1483].w";
	setAttr ".wl[1483].w[0:2]" 0.56136983633041382 0.30328404903411865 
		0.025060208514332771;
	setAttr ".wl[1483].w[20:21]" 0.10739634186029434 0.0028895786963403225;
	setAttr -s 5 ".wl[1484].w";
	setAttr ".wl[1484].w[0:2]" 0.56766033172607422 0.3177439272403717 
		0.021091772243380547;
	setAttr ".wl[1484].w[20:21]" 0.091088816523551941 0.0024152074474841356;
	setAttr -s 5 ".wl[1485].w";
	setAttr ".wl[1485].w[0:2]" 0.55700141191482544 0.067372269928455353 
		0.0067022736184298992;
	setAttr ".wl[1485].w[20:21]" 0.36347481608390808 0.0054492573253810406;
	setAttr -s 5 ".wl[1486].w";
	setAttr ".wl[1486].w[0:2]" 0.52107357978820801 0.27946820855140686 
		0.038175586611032486;
	setAttr ".wl[1486].w[20:21]" 0.15639171004295349 0.0048910286277532578;
	setAttr -s 6 ".wl[1487].w";
	setAttr ".wl[1487].w[0:2]" 0.52545011043548584 0.3062107264995575 
		0.034272398799657822;
	setAttr ".wl[1487].w[4]" 0.011894510127604008;
	setAttr ".wl[1487].w[20:21]" 0.11859353631734848 0.0035787555389106274;
	setAttr -s 6 ".wl[1488].w";
	setAttr ".wl[1488].w[0:2]" 0.54753273725509644 0.073708437383174896 
		0.0079996492713689804;
	setAttr ".wl[1488].w[4]" 0.011651764623820782;
	setAttr ".wl[1488].w[20:21]" 0.35343974828720093 0.0056676859967410564;
	setAttr -s 6 ".wl[1489].w";
	setAttr ".wl[1489].w[0:2]" 0.52877521514892578 0.074203595519065857 
		0.0093645462766289711;
	setAttr ".wl[1489].w[4]" 0.00048549022176302969;
	setAttr ".wl[1489].w[20:21]" 0.38002684712409973 0.0071442960761487484;
	setAttr -s 5 ".wl[1490].w";
	setAttr ".wl[1490].w[0:2]" 0.51934367418289185 0.090199895203113556 
		0.012442154809832573;
	setAttr ".wl[1490].w[20:21]" 0.36981090903282166 0.0082033099606633186;
	setAttr -s 5 ".wl[1491].w";
	setAttr ".wl[1491].w[0:2]" 0.5799858570098877 0.16050198674201965 
		0.018014872446656227;
	setAttr ".wl[1491].w[20:21]" 0.23663006722927094 0.0048671746626496315;
	setAttr -s 5 ".wl[1492].w";
	setAttr ".wl[1492].w[0:2]" 0.53621137142181396 0.16726118326187134 
		0.022744746878743172;
	setAttr ".wl[1492].w[20:21]" 0.26691776514053345 0.0068649007007479668;
	setAttr -s 5 ".wl[1493].w";
	setAttr ".wl[1493].w[0:2]" 0.44128322601318359 0.43055149912834167 
		0.087998285889625549;
	setAttr ".wl[1493].w[20:21]" 0.038494877517223358 0.0016721750143915415;
	setAttr -s 5 ".wl[1494].w";
	setAttr ".wl[1494].w[0:3]" 0.31883656978607178 0.37501496076583862 
		0.2620185911655426 0.00054518895922228694;
	setAttr ".wl[1494].w[8]" 0.043584704399108887;
	setAttr -s 6 ".wl[1495].w";
	setAttr ".wl[1495].w[0:4]" 0.30577969551086426 0.35958638787269592 
		0.26877480745315552 0.00014858644863124937 0.037625491619110107;
	setAttr ".wl[1495].w[8]" 0.028085088357329369;
	setAttr -s 5 ".wl[1496].w";
	setAttr ".wl[1496].w[0:2]" 0.43147969245910645 0.42023923993110657 
		0.10048063099384308;
	setAttr ".wl[1496].w[20:21]" 0.045711372047662735 0.0020890994928777218;
	setAttr -s 5 ".wl[1497].w";
	setAttr ".wl[1497].w[0:2]" 0.45838549733161926 0.45664465427398682 
		0.058397561311721802;
	setAttr ".wl[1497].w[20:21]" 0.025486884638667107 0.0010853580897673965;
	setAttr -s 5 ".wl[1498].w";
	setAttr ".wl[1498].w[0:3]" 0.353475421667099 0.42934936285018921 
		0.21629361808300018 0.00060308777028694749;
	setAttr ".wl[1498].w[8]" 0.00027839408721774817;
	setAttr -s 4 ".wl[1499].w[0:3]"  0.34944904 0.41687801 0.23365211 
		2.0828295e-05;
	setAttr -s 5 ".wl[1500].w";
	setAttr ".wl[1500].w[0:2]" 0.45510411262512207 0.44927838444709778 
		0.066588528454303741;
	setAttr ".wl[1500].w[20:21]" 0.027872603386640549 0.0011564126471057534;
	setAttr -s 5 ".wl[1501].w";
	setAttr ".wl[1501].w[0:2]" 0.46403783559799194 0.46403783559799194 
		0.04886423796415329;
	setAttr ".wl[1501].w[20:21]" 0.022034941241145134 0.001025179517455399;
	setAttr -s 5 ".wl[1502].w";
	setAttr ".wl[1502].w[0:3]" 0.34332746267318726 0.44797435402870178 
		0.2002793550491333 0.0083440216258168221;
	setAttr ".wl[1502].w[8]" 7.4872245022561401e-05;
	setAttr -s 5 ".wl[1503].w";
	setAttr ".wl[1503].w[0:3]" 0.33346539735794067 0.43619054555892944 
		0.22524961829185486 0.0050850254483520985;
	setAttr ".wl[1503].w[8]" 9.2717064035241492e-06;
	setAttr -s 5 ".wl[1504].w";
	setAttr ".wl[1504].w[0:2]" 0.46418413519859314 0.46260854601860046 
		0.048272110521793365;
	setAttr ".wl[1504].w[20:21]" 0.023929109796881676 0.0010061045177280903;
	setAttr -s 5 ".wl[1505].w";
	setAttr ".wl[1505].w[0:2]" 0.63779580593109131 0.14677539467811584 
		0.013073410838842392;
	setAttr ".wl[1505].w[20:21]" 0.19915574789047241 0.0031996350735425949;
	setAttr -s 5 ".wl[1506].w";
	setAttr ".wl[1506].w[0:2]" 0.54313361644744873 0.34012413024902344 
		0.034251134842634201;
	setAttr ".wl[1506].w[20:21]" 0.080206491053104401 0.0022845871280878782;
	setAttr -s 5 ".wl[1507].w";
	setAttr ".wl[1507].w[0:2]" 0.52390378713607788 0.33832335472106934 
		0.040725875645875931;
	setAttr ".wl[1507].w[20:21]" 0.094146192073822021 0.0029008211567997932;
	setAttr -s 5 ".wl[1508].w";
	setAttr ".wl[1508].w[0:2]" 0.60309988260269165 0.15604376792907715 
		0.016007177531719208;
	setAttr ".wl[1508].w[20:21]" 0.22075365483760834 0.0040955990552902222;
	setAttr -s 5 ".wl[1509].w";
	setAttr ".wl[1509].w[0:2]" 0.67388319969177246 0.15976534783840179 
		0.010103389620780945;
	setAttr ".wl[1509].w[20:21]" 0.15392093360424042 0.0023271553218364716;
	setAttr -s 5 ".wl[1510].w";
	setAttr ".wl[1510].w[0:2]" 0.55192774534225464 0.3696897029876709 
		0.023547086864709854;
	setAttr ".wl[1510].w[20:21]" 0.053353242576122284 0.001482292078435421;
	setAttr -s 5 ".wl[1511].w";
	setAttr ".wl[1511].w[0:2]" 0.56319087743759155 0.35086172819137573 
		0.02533319778740406;
	setAttr ".wl[1511].w[20:21]" 0.059046324342489243 0.0015678902855142951;
	setAttr -s 5 ".wl[1512].w";
	setAttr ".wl[1512].w[0:2]" 0.68383115530014038 0.14112906157970428 
		0.0098156388849020004;
	setAttr ".wl[1512].w[20:21]" 0.16294725239276886 0.0022770052310079336;
	setAttr -s 5 ".wl[1513].w";
	setAttr ".wl[1513].w[0:2]" 0.50345069169998169 0.014439176768064499 
		0.001626570476219058;
	setAttr ".wl[1513].w[20:21]" 0.47761812806129456 0.0028654425404965878;
	setAttr -s 5 ".wl[1514].w";
	setAttr ".wl[1514].w[0:2]" 0.57755458354949951 0.043146803975105286 
		0.0044133523479104042;
	setAttr ".wl[1514].w[20:21]" 0.37148314714431763 0.0034021737519651651;
	setAttr -s 5 ".wl[1515].w";
	setAttr ".wl[1515].w[0:2]" 0.55628329515457153 0.050615571439266205 
		0.0057039656676352024;
	setAttr ".wl[1515].w[20:21]" 0.38289117813110352 0.0045059695839881897;
	setAttr -s 5 ".wl[1516].w";
	setAttr ".wl[1516].w[0:2]" 0.50013101100921631 0.017041271552443504 
		0.0020081896800547838;
	setAttr ".wl[1516].w[20:21]" 0.47726061940193176 0.0035588606260716915;
	setAttr -s 5 ".wl[1517].w";
	setAttr ".wl[1517].w[0:2]" 0.50483155250549316 0.014992001466453075 
		0.0014870521845296025;
	setAttr ".wl[1517].w[20:21]" 0.47608613967895508 0.0026033681351691484;
	setAttr -s 5 ".wl[1518].w";
	setAttr ".wl[1518].w[0:2]" 0.60020816326141357 0.045664161443710327 
		0.0037283005658537149;
	setAttr ".wl[1518].w[20:21]" 0.34763675928115845 0.0027626010123640299;
	setAttr -s 5 ".wl[1519].w";
	setAttr ".wl[1519].w[0:2]" 0.60773730278015137 0.037936590611934662 
		0.0032969333697110415;
	setAttr ".wl[1519].w[20:21]" 0.34857851266860962 0.0024507197085767984;
	setAttr -s 5 ".wl[1520].w";
	setAttr ".wl[1520].w[0:2]" 0.50951457023620605 0.012547223828732967 
		0.0012910194927826524;
	setAttr ".wl[1520].w[20:21]" 0.47443953156471252 0.0022075858432799578;
	setAttr -s 5 ".wl[1521].w";
	setAttr ".wl[1521].w[0:2]" 0.59648394584655762 0.30553999543190002 
		0.014921166934072971;
	setAttr ".wl[1521].w[20:21]" 0.081122525036334991 0.0019324235618114471;
	setAttr -s 5 ".wl[1522].w";
	setAttr ".wl[1522].w[0:2]" 0.51565510034561157 0.40839511156082153 
		0.024679075926542282;
	setAttr ".wl[1522].w[20:21]" 0.049660347402095795 0.00161043053958565;
	setAttr -s 5 ".wl[1523].w";
	setAttr ".wl[1523].w[0:2]" 0.52099543809890747 0.38830497860908508 
		0.026718214154243469;
	setAttr ".wl[1523].w[20:21]" 0.062006067484617233 0.0019753782544285059;
	setAttr -s 5 ".wl[1524].w";
	setAttr ".wl[1524].w[0:2]" 0.61367446184158325 0.19800476729869843 
		0.013293425552546978;
	setAttr ".wl[1524].w[20:21]" 0.17168432474136353 0.0033430468756705523;
	setAttr -s 5 ".wl[1525].w";
	setAttr ".wl[1525].w[0:2]" 0.57922112941741943 0.10741704702377319 
		0.0076898699626326561;
	setAttr ".wl[1525].w[20:21]" 0.30106496810913086 0.0046069282107055187;
	setAttr -s 5 ".wl[1526].w";
	setAttr ".wl[1526].w[0:2]" 0.5768972635269165 0.12844753265380859 
		0.0094952909275889397;
	setAttr ".wl[1526].w[20:21]" 0.28029495477676392 0.0048649171367287636;
	setAttr -s 5 ".wl[1527].w";
	setAttr ".wl[1527].w[0:2]" 0.57333815097808838 0.059518624097108841 
		0.0048210443928837776;
	setAttr ".wl[1527].w[20:21]" 0.35859939455986023 0.0037227978464215994;
	setAttr -s 5 ".wl[1528].w";
	setAttr ".wl[1528].w[0:2]" 0.50925832986831665 0.012039195746183395 
		0.0011276958975940943;
	setAttr ".wl[1528].w[20:21]" 0.47555249929428101 0.0020223339088261127;
	setAttr -s 5 ".wl[1529].w";
	setAttr ".wl[1529].w[0:1]" 0.15643450617790222 0.0020759019535034895;
	setAttr ".wl[1529].w[20:22]" 0.8353390097618103 0.0053780670277774334 
		0.00077248521847650409;
	setAttr -s 5 ".wl[1530].w";
	setAttr ".wl[1530].w[0:1]" 0.44026187062263489 0.0035252263769507408;
	setAttr ".wl[1530].w[20:22]" 0.5537458062171936 0.0020647628698498011 
		0.00040232614264823496;
	setAttr -s 5 ".wl[1531].w";
	setAttr ".wl[1531].w[0:1]" 0.45597082376480103 0.0025469101965427399;
	setAttr ".wl[1531].w[20:22]" 0.53997683525085449 0.0012578855967149138 
		0.00024757307255640626;
	setAttr -s 5 ".wl[1532].w";
	setAttr ".wl[1532].w[0:1]" 0.14687629044055939 0.0014782293001189828;
	setAttr ".wl[1532].w[20:22]" 0.84789073467254639 0.0032781134359538555 
		0.00047662752331234515;
	setAttr -s 5 ".wl[1533].w";
	setAttr ".wl[1533].w[0:1]" 0.22839002311229706 0.0043975105509161949;
	setAttr ".wl[1533].w[20:22]" 0.75486361980438232 0.010695709846913815 
		0.0016530771972611547;
	setAttr -s 5 ".wl[1534].w";
	setAttr ".wl[1534].w[0:1]" 0.45977196097373962 0.0072185639292001724;
	setAttr ".wl[1534].w[20:22]" 0.52804118394851685 0.0041232351213693619 
		0.00084509048610925674;
	setAttr -s 5 ".wl[1535].w";
	setAttr ".wl[1535].w[0:1]" 0.4507347047328949 0.0053662536665797234;
	setAttr ".wl[1535].w[20:22]" 0.54010558128356934 0.0031631460878998041 
		0.00063030817545950413;
	setAttr -s 5 ".wl[1536].w";
	setAttr ".wl[1536].w[0:1]" 0.19590854644775391 0.0032991596963256598;
	setAttr ".wl[1536].w[20:22]" 0.79099225997924805 0.0085342917591333389 
		0.0012657073093578219;
	setAttr -s 5 ".wl[1537].w";
	setAttr ".wl[1537].w[0:1]" 0.21823284029960632 0.0039895293302834034;
	setAttr ".wl[1537].w[20:22]" 0.76662296056747437 0.0095899775624275208 
		0.0015646332176402211;
	setAttr -s 5 ".wl[1538].w";
	setAttr ".wl[1538].w[0:1]" 0.45847156643867493 0.0064622513018548489;
	setAttr ".wl[1538].w[20:22]" 0.53072822093963623 0.0035715391859412193 
		0.000766402343288064;
	setAttr -s 5 ".wl[1539].w";
	setAttr ".wl[1539].w[0:1]" 0.46177464723587036 0.0077653410844504833;
	setAttr ".wl[1539].w[20:22]" 0.52518200874328613 0.0043648472055792809 
		0.00091315130703151226;
	setAttr -s 5 ".wl[1540].w";
	setAttr ".wl[1540].w[0:1]" 0.23613676428794861 0.0047244266606867313;
	setAttr ".wl[1540].w[20:22]" 0.7460712194442749 0.011278008110821247 
		0.0017895741621032357;
	setAttr -s 5 ".wl[1541].w";
	setAttr ".wl[1541].w[0:1]" 0.20422524213790894 0.0037840476725250483;
	setAttr ".wl[1541].w[20:22]" 0.78105837106704712 0.0091606946662068367 
		0.001771604991517961;
	setAttr -s 5 ".wl[1542].w";
	setAttr ".wl[1542].w[0:1]" 0.45521438121795654 0.0063275047577917576;
	setAttr ".wl[1542].w[20:22]" 0.53429239988327026 0.003338127862662077 
		0.00082767143612727523;
	setAttr -s 5 ".wl[1543].w";
	setAttr ".wl[1543].w[0:1]" 0.45477929711341858 0.0052631720900535583;
	setAttr ".wl[1543].w[20:22]" 0.53653138875961304 0.0027878803666681051 
		0.00063830922590568662;
	setAttr -s 5 ".wl[1544].w";
	setAttr ".wl[1544].w[0:1]" 0.19650526344776154 0.0032492962200194597;
	setAttr ".wl[1544].w[20:22]" 0.79111582040786743 0.0077654332853853703 
		0.0013641779078170657;
	setAttr -s 5 ".wl[1545].w";
	setAttr ".wl[1545].w[0:1]" 0.18225009739398956 0.0031833911780267954;
	setAttr ".wl[1545].w[20:22]" 0.80494654178619385 0.0080135669559240341 
		0.0016064628725871444;
	setAttr -s 5 ".wl[1546].w";
	setAttr ".wl[1546].w[0:1]" 0.48617467284202576 0.0065636718645691872;
	setAttr ".wl[1546].w[20:22]" 0.50429916381835938 0.0023332617711275816 
		0.00062920519849285483;
	setAttr -s 5 ".wl[1547].w";
	setAttr ".wl[1547].w[0:1]" 0.45418193936347961 0.006543133407831192;
	setAttr ".wl[1547].w[20:22]" 0.53493553400039673 0.0034545750822871923 
		0.00088485586456954479;
	setAttr -s 5 ".wl[1548].w";
	setAttr ".wl[1548].w[0:1]" 0.20065674185752869 0.0038182088173925877;
	setAttr ".wl[1548].w[20:22]" 0.78418028354644775 0.0094491513445973396 
		0.0018955644918605685;
	setAttr -s 5 ".wl[1549].w";
	setAttr ".wl[1549].w[0:1]" 0.15465439856052399 0.0023662992753088474;
	setAttr ".wl[1549].w[20:22]" 0.83572864532470703 0.0060264924541115761 
		0.0012241987278684974;
	setAttr -s 5 ".wl[1550].w";
	setAttr ".wl[1550].w[0:2]" 0.53680253028869629 0.019409643486142159 
		0.001411719829775393;
	setAttr ".wl[1550].w[20:21]" 0.44023609161376953 0.0021400477271527052;
	setAttr -s 5 ".wl[1551].w";
	setAttr ".wl[1551].w[0:2]" 0.53642582893371582 0.022742796689271927 
		0.0017675381386652589;
	setAttr ".wl[1551].w[20:21]" 0.43660837411880493 0.0024554366245865822;
	setAttr -s 5 ".wl[1552].w";
	setAttr ".wl[1552].w[0:1]" 0.1669827401638031 0.0027329132426530123;
	setAttr ".wl[1552].w[20:22]" 0.82189720869064331 0.0069831046275794506 
		0.001403947826474905;
	setAttr -s 5 ".wl[1553].w";
	setAttr ".wl[1553].w[0:2]" 0.53543412685394287 0.019860850647091866 
		0.0013611685717478395;
	setAttr ".wl[1553].w[20:21]" 0.44116553664207458 0.0021782468538731337;
	setAttr -s 5 ".wl[1554].w";
	setAttr ".wl[1554].w[0:1]" 0.14999775588512421 0.0022810057271271944;
	setAttr ".wl[1554].w[20:22]" 0.84065413475036621 0.0058532850816845894 
		0.0012138312449678779;
	setAttr -s 5 ".wl[1555].w";
	setAttr ".wl[1555].w[0:1]" 0.010557218454778194 0.00052190519636496902;
	setAttr ".wl[1555].w[20:22]" 0.95424127578735352 0.032959826290607452 
		0.0017197098350152373;
	setAttr -s 5 ".wl[1556].w";
	setAttr ".wl[1556].w[0:1]" 0.036682579666376114 0.0010554547188803554;
	setAttr ".wl[1556].w[20:22]" 0.94757980108261108 0.013435573317110538 
		0.001246556406840682;
	setAttr -s 5 ".wl[1557].w";
	setAttr ".wl[1557].w[0:1]" 0.028559207916259766 0.00073034851811826229;
	setAttr ".wl[1557].w[20:22]" 0.96129602193832397 0.0086199715733528137 
		0.00079452176578342915;
	setAttr -s 5 ".wl[1558].w";
	setAttr ".wl[1558].w[0:1]" 0.0079704141244292259 0.00037227600114420056;
	setAttr ".wl[1558].w[20:22]" 0.96773642301559448 0.022762799635529518 
		0.0011581173166632652;
	setAttr -s 5 ".wl[1559].w";
	setAttr ".wl[1559].w[0:1]" 0.017986694350838661 0.00096958398353308439;
	setAttr ".wl[1559].w[20:22]" 0.9202302098274231 0.05746854841709137 
		0.0033449821639806032;
	setAttr -s 5 ".wl[1560].w";
	setAttr ".wl[1560].w[0:1]" 0.065962731838226318 0.0023003970272839069;
	setAttr ".wl[1560].w[20:22]" 0.90080720186233521 0.028080018237233162 
		0.002849652199074626;
	setAttr -s 5 ".wl[1561].w";
	setAttr ".wl[1561].w[0:1]" 0.053525250405073166 0.0017178213456645608;
	setAttr ".wl[1561].w[20:22]" 0.9214358925819397 0.021250301972031593 
		0.0020706930663436651;
	setAttr -s 5 ".wl[1562].w";
	setAttr ".wl[1562].w[0:1]" 0.015891971066594124 0.00081037997733801603;
	setAttr ".wl[1562].w[20:22]" 0.93536394834518433 0.045335661619901657 
		0.0025979909114539623;
	setAttr -s 5 ".wl[1563].w";
	setAttr ".wl[1563].w[0:1]" 0.013732297345995903 0.00073290406726300716;
	setAttr ".wl[1563].w[20:22]" 0.93468350172042847 0.047965213656425476 
		0.0028860124293714762;
	setAttr -s 5 ".wl[1564].w";
	setAttr ".wl[1564].w[0:1]" 0.058643396943807602 0.0020200409926474094;
	setAttr ".wl[1564].w[20:22]" 0.91110599040985107 0.025492575019598007 
		0.0027380150277167559;
	setAttr -s 5 ".wl[1565].w";
	setAttr ".wl[1565].w[0:1]" 0.06888899952173233 0.0024629512336105108;
	setAttr ".wl[1565].w[20:22]" 0.89549994468688965 0.030010644346475601 
		0.0031375158578157425;
	setAttr -s 5 ".wl[1566].w";
	setAttr ".wl[1566].w[0:1]" 0.017843283712863922 0.00097191572422161698;
	setAttr ".wl[1566].w[20:22]" 0.91883206367492676 0.058850474655628204 
		0.003502225037664175;
	setAttr -s 5 ".wl[1567].w";
	setAttr ".wl[1567].w[0:1]" 0.012976469472050667 0.00070909614441916347;
	setAttr ".wl[1567].w[20:22]" 0.93536865711212158 0.047125548124313354 
		0.0038201992865651846;
	setAttr -s 5 ".wl[1568].w";
	setAttr ".wl[1568].w[0:1]" 0.053037330508232117 0.0018728966824710369;
	setAttr ".wl[1568].w[20:22]" 0.91750544309616089 0.024328798055648804 
		0.0032555239740759134;
	setAttr -s 5 ".wl[1569].w";
	setAttr ".wl[1569].w[0:1]" 0.047741502523422241 0.0015867557376623154;
	setAttr ".wl[1569].w[20:22]" 0.92758738994598389 0.020665589720010757 
		0.0024188405368477106;
	setAttr -s 5 ".wl[1570].w";
	setAttr ".wl[1570].w[0:1]" 0.010424411855638027 0.00054639962036162615;
	setAttr ".wl[1570].w[20:22]" 0.9489142894744873 0.0376112200319767 
		0.0025038013700395823;
	setAttr -s 5 ".wl[1571].w";
	setAttr ".wl[1571].w[0:1]" 0.012829575687646866 0.00070977519499137998;
	setAttr ".wl[1571].w[20:22]" 0.93424642086029053 0.047945220023393631 
		0.00426906393840909;
	setAttr -s 5 ".wl[1572].w";
	setAttr ".wl[1572].w[0:1]" 0.044877871870994568 0.0015676930779591203;
	setAttr ".wl[1572].w[20:22]" 0.92894244194030762 0.02158871665596962 
		0.003023266326636076;
	setAttr -s 5 ".wl[1573].w";
	setAttr ".wl[1573].w[0:1]" 0.053367298096418381 0.0019188078586012125;
	setAttr ".wl[1573].w[20:22]" 0.91601669788360596 0.02514532208442688 
		0.0035519774537533522;
	setAttr -s 5 ".wl[1574].w";
	setAttr ".wl[1574].w[0:1]" 0.014884353615343571 0.0008222418837249279;
	setAttr ".wl[1574].w[20:22]" 0.92826282978057861 0.05139768123626709 
		0.0046328818425536156;
	setAttr -s 5 ".wl[1575].w";
	setAttr ".wl[1575].w[0:1]" 0.010622518137097359 0.00058057572459802032;
	setAttr ".wl[1575].w[20:22]" 0.94382965564727783 0.041216675192117691 
		0.0037505119107663631;
	setAttr -s 5 ".wl[1576].w";
	setAttr ".wl[1576].w[0:1]" 0.034039583057165146 0.0011312466813251376;
	setAttr ".wl[1576].w[20:22]" 0.94620227813720703 0.016320982947945595 
		0.0023059179075062275;
	setAttr -s 5 ".wl[1577].w";
	setAttr ".wl[1577].w[0:1]" 0.039384298026561737 0.0013371293898671865;
	setAttr ".wl[1577].w[20:22]" 0.93790513277053833 0.018740635365247726 
		0.0026328526437282562;
	setAttr -s 5 ".wl[1578].w";
	setAttr ".wl[1578].w[0:1]" 0.012099492363631725 0.0006588352844119072;
	setAttr ".wl[1578].w[20:22]" 0.9395068883895874 0.043753605335950851 
		0.0039811199530959129;
	setAttr -s 5 ".wl[1579].w";
	setAttr ".wl[1579].w[0:1]" 0.032841566950082779 0.0010927377734333277;
	setAttr ".wl[1579].w[20:22]" 0.94783318042755127 0.015919739380478859 
		0.0023128141183406115;
	setAttr -s 5 ".wl[1580].w";
	setAttr ".wl[1580].w[0:1]" 0.010673548094928265 0.00058046216145157814;
	setAttr ".wl[1580].w[20:22]" 0.94470107555389404 0.040201794356107712 
		0.003843025304377079;
	setAttr -s 5 ".wl[1581].w";
	setAttr ".wl[1581].w[0:1]" 0.0011383664095774293 0.00011459852248663083;
	setAttr ".wl[1581].w[20:22]" 0.66739672422409058 0.32860791683197021 
		0.0027423622086644173;
	setAttr -s 5 ".wl[1582].w";
	setAttr ".wl[1582].w[0:1]" 0.0034190814476460218 0.00025417222059331834;
	setAttr ".wl[1582].w[20:22]" 0.89198833703994751 0.10202629119157791 
		0.0023120495025068521;
	setAttr -s 5 ".wl[1583].w";
	setAttr ".wl[1583].w[0:1]" 0.0025394645053893328 0.00018468912458047271;
	setAttr ".wl[1583].w[20:22]" 0.91579383611679077 0.079834125936031342 
		0.0016479248879477382;
	setAttr -s 5 ".wl[1584].w";
	setAttr ".wl[1584].w[0:1]" 0.00079294265015050769 7.8569079050794244e-05;
	setAttr ".wl[1584].w[20:22]" 0.70400375127792358 0.29326540231704712 
		0.0018593011191114783;
	setAttr -s 5 ".wl[1585].w";
	setAttr ".wl[1585].w[0:1]" 0.002293282188475132 0.00023762836644891649;
	setAttr ".wl[1585].w[20:22]" 0.61699897050857544 0.37489300966262817 
		0.0055771046318113804;
	setAttr -s 5 ".wl[1586].w";
	setAttr ".wl[1586].w[0:1]" 0.0054533355869352818 0.00041941984090954065;
	setAttr ".wl[1586].w[20:22]" 0.84960085153579712 0.14065739512443542 
		0.0038689870852977037;
	setAttr -s 5 ".wl[1587].w";
	setAttr ".wl[1587].w[0:1]" 0.0046904515475034714 0.00035657515400089324;
	setAttr ".wl[1587].w[20:22]" 0.86396849155426025 0.12772898375988007 
		0.0032555579673498869;
	setAttr -s 5 ".wl[1588].w";
	setAttr ".wl[1588].w[0:1]" 0.0016537170158699155 0.00017213862156495452;
	setAttr ".wl[1588].w[20:22]" 0.61724448204040527 0.37663450837135315 
		0.0042950399219989777;
	setAttr -s 5 ".wl[1589].w";
	setAttr ".wl[1589].w[0:1]" 0.001957024447619915 0.00020074049825780094;
	setAttr ".wl[1589].w[20:22]" 0.63517266511917114 0.35717016458511353 
		0.0054994146339595318;
	setAttr -s 5 ".wl[1590].w";
	setAttr ".wl[1590].w[0:1]" 0.003850600216537714 0.00029185612220317125;
	setAttr ".wl[1590].w[20:22]" 0.87919396162033081 0.11354438215494156 
		0.003119252622127533;
	setAttr -s 5 ".wl[1591].w";
	setAttr ".wl[1591].w[0:1]" 0.0052624591626226902 0.0004044767701998353;
	setAttr ".wl[1591].w[20:22]" 0.85278284549713135 0.1376737505197525 
		0.003876532195135951;
	setAttr -s 5 ".wl[1592].w";
	setAttr ".wl[1592].w[0:1]" 0.0024244943633675575 0.00025079093757085502;
	setAttr ".wl[1592].w[20:22]" 0.61906015872955322 0.37222841382026672 
		0.0060360780917108059;
	setAttr -s 5 ".wl[1593].w";
	setAttr ".wl[1593].w[0:1]" 0.0018501825397834182 0.00019273854559287429;
	setAttr ".wl[1593].w[20:22]" 0.63072961568832397 0.35815912485122681 
		0.0090683856979012489;
	setAttr -s 5 ".wl[1594].w";
	setAttr ".wl[1594].w[0:1]" 0.003798582823947072 0.00029392508440651;
	setAttr ".wl[1594].w[20:22]" 0.8758394718170166 0.11533503979444504 
		0.0047330046072602272;
	setAttr -s 5 ".wl[1595].w";
	setAttr ".wl[1595].w[0:1]" 0.0027845005970448256 0.00020924808632116765;
	setAttr ".wl[1595].w[20:22]" 0.90330344438552856 0.090957239270210266 
		0.0027455952949821949;
	setAttr -s 5 ".wl[1596].w";
	setAttr ".wl[1596].w[0:1]" 0.0015433452790603042 0.00015712348977103829;
	setAttr ".wl[1596].w[20:22]" 0.65687233209609985 0.33587434887886047 
		0.0055528408847749233;
	setAttr -s 5 ".wl[1597].w";
	setAttr ".wl[1597].w[0:1]" 0.0017608820926398039 0.00018496249685995281;
	setAttr ".wl[1597].w[20:22]" 0.62537533044815063 0.36191642284393311 
		0.01076237577944994;
	setAttr -s 5 ".wl[1598].w";
	setAttr ".wl[1598].w[0:1]" 0.0042959055863320827 0.00033772640745155513;
	setAttr ".wl[1598].w[20:22]" 0.86199814081192017 0.12715137004852295 
		0.0062169060111045837;
	setAttr -s 5 ".wl[1599].w";
	setAttr ".wl[1599].w[0:1]" 0.004564549308270216 0.00035891783772967756;
	setAttr ".wl[1599].w[20:22]" 0.85809570550918579 0.13066862523555756 
		0.0063122347928583622;
	setAttr -s 5 ".wl[1600].w";
	setAttr ".wl[1600].w[0:1]" 0.0019751689396798611 0.00020891833992209285;
	setAttr ".wl[1600].w[20:22]" 0.61447733640670776 0.37182953953742981 
		0.011508997529745102;
	setAttr -s 5 ".wl[1601].w";
	setAttr ".wl[1601].w[0:1]" 0.0013389477971941233 0.00013927381951361895;
	setAttr ".wl[1601].w[20:22]" 0.64344537258148193 0.3457692563533783 
		0.0093071935698390007;
	setAttr -s 5 ".wl[1602].w";
	setAttr ".wl[1602].w[0:1]" 0.0038636927492916584 0.00030283161322586238;
	setAttr ".wl[1602].w[20:22]" 0.87056177854537964 0.11919678002595901 
		0.0060749598778784275;
	setAttr -s 5 ".wl[1603].w";
	setAttr ".wl[1603].w[0:1]" 0.0041264086030423641 0.00032438867492601275;
	setAttr ".wl[1603].w[20:22]" 0.86467993259429932 0.12464972585439682 
		0.006219527218490839;
	setAttr -s 5 ".wl[1604].w";
	setAttr ".wl[1604].w[0:1]" 0.0014991626376286149 0.00015816386439837515;
	setAttr ".wl[1604].w[20:22]" 0.62339460849761963 0.36471846699714661 
		0.010229620151221752;
	setAttr -s 5 ".wl[1605].w";
	setAttr ".wl[1605].w[0:1]" 0.0038540603127330542 0.00030206874362193048;
	setAttr ".wl[1605].w[20:22]" 0.87145537137985229 0.11800204217433929 
		0.0063864169642329216;
	setAttr -s 5 ".wl[1606].w";
	setAttr ".wl[1606].w[0:1]" 0.0012484919279813766 0.00012955772399436682;
	setAttr ".wl[1606].w[20:22]" 0.64480793476104736 0.34439098834991455 
		0.0094230491667985916;
	setAttr -s 5 ".wl[1607].w";
	setAttr ".wl[1607].w[0]" 0.00029379266197793186;
	setAttr ".wl[1607].w[20:23]" 0.27782189846038818 0.70420032739639282 
		0.017321150749921799 0.00036283081863075495;
	setAttr -s 5 ".wl[1608].w";
	setAttr ".wl[1608].w[0:1]" 0.00042637099977582693 5.4516989621333778e-05;
	setAttr ".wl[1608].w[20:22]" 0.49807623028755188 0.49807623028755188 
		0.0033666137605905533;
	setAttr -s 5 ".wl[1609].w";
	setAttr ".wl[1609].w[0:1]" 0.00025695646763779223 3.253650720580481e-05;
	setAttr ".wl[1609].w[20:22]" 0.49884253740310669 0.49884253740310669 
		0.0020254531409591436;
	setAttr -s 5 ".wl[1610].w";
	setAttr ".wl[1610].w[0]" 0.00019125234393868595;
	setAttr ".wl[1610].w[20:23]" 0.25082758069038391 0.7371407151222229 
		0.011607983149588108 0.00023243553005158901;
	setAttr -s 5 ".wl[1611].w";
	setAttr ".wl[1611].w[0]" 0.00062498252373188734;
	setAttr ".wl[1611].w[20:23]" 0.31578195095062256 0.64850872755050659 
		0.034282781183719635 0.00080161291407421231;
	setAttr -s 5 ".wl[1612].w";
	setAttr ".wl[1612].w[0:1]" 0.0011685153003782034 0.00015346867439802736;
	setAttr ".wl[1612].w[20:22]" 0.49485218524932861 0.49485218524932861 
		0.0089735500514507294;
	setAttr -s 5 ".wl[1613].w";
	setAttr ".wl[1613].w[0:1]" 0.00078609830234199762 0.0001019091869238764;
	setAttr ".wl[1613].w[20:22]" 0.4965326189994812 0.4965326189994812 
		0.0060467012226581573;
	setAttr -s 5 ".wl[1614].w";
	setAttr ".wl[1614].w[0]" 0.00044340878957882524;
	setAttr ".wl[1614].w[20:23]" 0.32036206126213074 0.65607637166976929 
		0.022590145468711853 0.00052800681442022324;
	setAttr -s 5 ".wl[1615].w";
	setAttr ".wl[1615].w[0]" 0.00061021908186376095;
	setAttr ".wl[1615].w[20:23]" 0.23612123727798462 0.71425241231918335 
		0.048059612512588501 0.00095653760945424438;
	setAttr -s 5 ".wl[1616].w";
	setAttr ".wl[1616].w[0:1]" 0.0011144261807203293 0.00014674018893856555;
	setAttr ".wl[1616].w[20:22]" 0.49404972791671753 0.49404972791671753 
		0.010639388114213943;
	setAttr -s 5 ".wl[1617].w";
	setAttr ".wl[1617].w[0:1]" 0.0013085614191368222 0.00017271260730922222;
	setAttr ".wl[1617].w[20:22]" 0.49397987127304077 0.49397987127304077 
		0.010558954440057278;
	setAttr -s 5 ".wl[1618].w";
	setAttr ".wl[1618].w[0]" 0.00068809278309345245;
	setAttr ".wl[1618].w[20:23]" 0.29664281010627747 0.6602942943572998 
		0.041433211416006088 0.00094156607519835234;
	setAttr -s 5 ".wl[1619].w";
	setAttr ".wl[1619].w[0]" 0.00038031116127967834;
	setAttr ".wl[1619].w[20:23]" 0.075890421867370605 0.83272433280944824 
		0.089953117072582245 0.001051774132065475;
	setAttr -s 5 ".wl[1620].w";
	setAttr ".wl[1620].w[0]" 0.00090242753503844142;
	setAttr ".wl[1620].w[20:23]" 0.43131828308105469 0.54922115802764893 
		0.017851751297712326 0.00070639955811202526;
	setAttr -s 5 ".wl[1621].w";
	setAttr ".wl[1621].w[0]" 0.00089765537995845079;
	setAttr ".wl[1621].w[20:23]" 0.48668983578681946 0.49974325299263 
		0.012122209183871746 0.00054703559726476669;
	setAttr -s 5 ".wl[1622].w";
	setAttr ".wl[1622].w[0]" 0.00046686851419508457;
	setAttr ".wl[1622].w[20:23]" 0.1373172253370285 0.79905503988265991 
		0.062207140028476715 0.00095366762252524495;
	setAttr -s 5 ".wl[1623].w";
	setAttr ".wl[1623].w[0]" 0.00023702421458438039;
	setAttr ".wl[1623].w[20:23]" 0.040969900786876678 0.86779206991195679 
		0.090204522013664246 0.00079653423745185137;
	setAttr -s 5 ".wl[1624].w";
	setAttr ".wl[1624].w[0]" 0.00061961350729689002;
	setAttr ".wl[1624].w[20:23]" 0.35705378651618958 0.62504571676254272 
		0.016711167991161346 0.00056970177683979273;
	setAttr -s 5 ".wl[1625].w";
	setAttr ".wl[1625].w[0]" 0.0008269192767329514;
	setAttr ".wl[1625].w[20:23]" 0.38892465829849243 0.58965307474136353 
		0.019867559894919395 0.00072762020863592625;
	setAttr -s 5 ".wl[1626].w";
	setAttr ".wl[1626].w[0]" 0.00033185185748152435;
	setAttr ".wl[1626].w[20:23]" 0.057517800480127335 0.841208815574646 
		0.099901527166366577 0.0010399535531178117;
	setAttr -s 5 ".wl[1627].w";
	setAttr ".wl[1627].w[0]" 8.3400795119814575e-05;
	setAttr ".wl[1627].w[20:23]" 0.014759107492864132 0.93200773000717163 
		0.052832752466201782 0.00031707977177575231;
	setAttr -s 5 ".wl[1628].w";
	setAttr ".wl[1628].w[0]" 0.00027048905030824244;
	setAttr ".wl[1628].w[20:23]" 0.25283679366111755 0.73723149299621582 
		0.009389018639922142 0.00027220521587878466;
	setAttr -s 5 ".wl[1629].w";
	setAttr ".wl[1629].w[0]" 0.000438901741290465;
	setAttr ".wl[1629].w[20:23]" 0.31643033027648926 0.66947036981582642 
		0.013240579515695572 0.00041982613038271666;
	setAttr -s 5 ".wl[1630].w";
	setAttr ".wl[1630].w[0]" 0.00017277221195399761;
	setAttr ".wl[1630].w[20:23]" 0.030652837827801704 0.8940083384513855 
		0.074569150805473328 0.00059688463807106018;
	setAttr -s 5 ".wl[1631].w";
	setAttr ".wl[1631].w[0]" 0.00016496804892085493;
	setAttr ".wl[1631].w[20:23]" 0.17836581170558929 0.81460785865783691 
		0.0066840043291449547 0.0001773814728949219;
	setAttr -s 5 ".wl[1632].w";
	setAttr ".wl[1632].w[0]" 3.4510183468228206e-05;
	setAttr ".wl[1632].w[20:23]" 0.005983404815196991 0.96306616067886353 
		0.030773265287280083 0.0001426911330781877;
	setAttr -s 5 ".wl[1633].w[20:24]"  0.001098902 0.037402004 
		0.94184428 0.019287074 0.00036772547;
	setAttr -s 5 ".wl[1634].w";
	setAttr ".wl[1634].w[0]" 7.5684933108277619e-05;
	setAttr ".wl[1634].w[20:23]" 0.0050510140135884285 0.52062851190567017 
		0.47352689504623413 0.00071799871511757374;
	setAttr -s 5 ".wl[1635].w";
	setAttr ".wl[1635].w[0]" 5.3961761295795441e-05;
	setAttr ".wl[1635].w[20:23]" 0.0037422496825456619 0.52689576148986816 
		0.46879777312278748 0.00051031052134931087;
	setAttr -s 5 ".wl[1636].w[20:24]"  0.00086123007 0.030675953 
		0.95245534 0.015717532 0.00028990052;
	setAttr -s 5 ".wl[1637].w[20:24]"  0.0014085505 0.045447256 
		0.92930359 0.023376681 0.00046401942;
	setAttr -s 5 ".wl[1638].w";
	setAttr ".wl[1638].w[0]" 0.00011834589531645179;
	setAttr ".wl[1638].w[20:23]" 0.0073978723958134651 0.51269453763961792 
		0.47865456342697144 0.0011346576502546668;
	setAttr -s 5 ".wl[1639].w";
	setAttr ".wl[1639].w[0]" 0.00010509275307413191;
	setAttr ".wl[1639].w[20:23]" 0.0068414006382226944 0.51842308044433594 
		0.47364917397499084 0.0009813215583562851;
	setAttr -s 5 ".wl[1640].w[20:24]"  0.0013368817 0.043795381 
		0.93175292 0.022669431 0.00044535441;
	setAttr -s 5 ".wl[1641].w[20:24]"  0.00087326078 0.029776379 
		0.95557821 0.01351354 0.0002586722;
	setAttr -s 5 ".wl[1642].w";
	setAttr ".wl[1642].w[0]" 7.5400515925139189e-05;
	setAttr ".wl[1642].w[20:23]" 0.0044558150693774223 0.51000350713729858 
		0.48463907837867737 0.00082616496365517378;
	setAttr -s 5 ".wl[1643].w";
	setAttr ".wl[1643].w[0]" 0.00010944627138087526;
	setAttr ".wl[1643].w[20:23]" 0.0066848369315266609 0.51108437776565552 
		0.48103007674217224 0.0010912404395639896;
	setAttr -s 5 ".wl[1644].w[20:24]"  0.0012687102 0.041442666 
		0.93632543 0.020558171 0.00040493725;
	setAttr -s 5 ".wl[1645].w[20:24]"  0.00050605991 0.016732456 
		0.97689092 0.0057575209 0.00011301028;
	setAttr -s 5 ".wl[1646].w[20:24]"  0.0028400784 0.47778276 
		0.51834321 0.00097548414 5.8522724e-05;
	setAttr -s 5 ".wl[1647].w";
	setAttr ".wl[1647].w[0]" 4.9105157813755795e-05;
	setAttr ".wl[1647].w[20:23]" 0.0026402315124869347 0.50514686107635498 
		0.49151831865310669 0.00064545968780294061;
	setAttr -s 5 ".wl[1648].w[20:24]"  0.00049105758 0.017330643 
		0.97543323 0.006619778 0.00012533047;
	setAttr -s 5 ".wl[1649].w[20:24]"  0.00061856955 0.019203264 
		0.97382534 0.0062261038 0.00012667576;
	setAttr -s 5 ".wl[1650].w[20:24]"  0.0028888439 0.42242506 
		0.57338357 0.0012339209 6.8576512e-05;
	setAttr -s 5 ".wl[1651].w[20:24]"  0.0031632697 0.44359052 
		0.55190831 0.0012657058 7.2216048e-05;
	setAttr -s 5 ".wl[1652].w[20:24]"  0.00061786984 0.019400699 
		0.97344619 0.006405768 0.0001296066;
	setAttr -s 5 ".wl[1653].w[20:24]"  0.00047698087 0.014940169 
		0.97990388 0.0045861071 9.2787617e-05;
	setAttr -s 5 ".wl[1654].w[20:24]"  0.0019594471 0.36009577 
		0.63695908 0.00093659619 4.9151164e-05;
	setAttr -s 5 ".wl[1655].w[20:24]"  0.0026324575 0.40291333 
		0.5932247 0.0011658947 6.3484513e-05;
	setAttr -s 5 ".wl[1656].w[20:24]"  0.00059305225 0.018344197 
		0.97513318 0.0058110049 0.00011858152;
	setAttr -s 5 ".wl[1657].w[20:24]"  0.0013478771 0.29544145 
		0.70247787 0.00069772179 3.5087214e-05;
	setAttr -s 5 ".wl[1658].w[20:24]"  0.0003321027 0.010617143 
		0.98588562 0.0031030381 6.2103842e-05;
	setAttr -s 5 ".wl[1659].w[20:24]"  2.6298638e-05 0.00015563691 
		0.18524797 0.81411499 0.00045513798;
	setAttr -s 5 ".wl[1660].w[20:24]"  0.00021181177 0.0029663225 
		0.9287343 0.067811646 0.00027589177;
	setAttr -s 5 ".wl[1661].w[20:24]"  0.00014455039 0.0020626478 
		0.94618213 0.051421221 0.0001894548;
	setAttr -s 5 ".wl[1662].w[20:24]"  1.4648851e-05 8.7305387e-05 
		0.13779916 0.86184275 0.00025612517;
	setAttr -s 5 ".wl[1663].w[20:24]"  4.2510543e-05 0.00024932754 
		0.22677383 0.77221012 0.00072431448;
	setAttr -s 5 ".wl[1664].w[20:24]"  0.00030091382 0.0041188942 
		0.9098857 0.085307501 0.00038702964;
	setAttr -s 5 ".wl[1665].w[20:24]"  0.00027624163 0.0038132947 
		0.91425413 0.081298336 0.00035796067;
	setAttr -s 5 ".wl[1666].w[20:24]"  3.7320202e-05 0.00021983538 
		0.21638459 0.78271896 0.00063919282;
	setAttr -s 5 ".wl[1667].w[20:24]"  3.4111414e-05 0.00019691265 
		0.2014403 0.79775959 0.00056916068;
	setAttr -s 5 ".wl[1668].w[20:24]"  0.00020342256 0.0027602536 
		0.93811148 0.058677748 0.00024704213;
	setAttr -s 5 ".wl[1669].w[20:24]"  0.00027788867 0.0037889525 
		0.91705257 0.078529388 0.00035122695;
	setAttr -s 5 ".wl[1670].w[20:24]"  4.1190149e-05 0.00024034629 
		0.22231565 0.77670622 0.00069666922;
	setAttr -s 5 ".wl[1671].w[20:24]"  4.8537077e-05 0.00026556058 
		0.21773759 0.78119707 0.00075133576;
	setAttr -s 5 ".wl[1672].w[20:24]"  0.00017736905 0.0022351393 
		0.95655769 0.040845647 0.00018407467;
	setAttr -s 5 ".wl[1673].w[20:24]"  0.00014229317 0.0018845302 
		0.95900977 0.038803991 0.00015942208;
	setAttr -s 5 ".wl[1674].w[20:24]"  3.2454329e-05 0.00018302277 
		0.1911153 0.80814773 0.00052142073;
	setAttr -s 5 ".wl[1675].w[20:24]"  6.4931868e-05 0.00034830064 
		0.23873861 0.75987053 0.00097773364;
	setAttr -s 5 ".wl[1676].w[20:24]"  0.00022741946 0.0027636585 
		0.95084405 0.045940414 0.00022454477;
	setAttr -s 5 ".wl[1677].w[20:24]"  0.0002224647 0.002725922 
		0.95072097 0.04610803 0.00022262604;
	setAttr -s 5 ".wl[1678].w[20:24]"  6.2106636e-05 0.00033483058 
		0.23624539 0.76241648 0.00094117952;
	setAttr -s 5 ".wl[1679].w[20:24]"  5.9043407e-05 0.00031462751 
		0.22798823 0.77075648 0.00088161073;
	setAttr -s 5 ".wl[1680].w[20:24]"  0.000188076 0.0022711356 
		0.95945984 0.03789999 0.00018090173;
	setAttr -s 5 ".wl[1681].w[20:24]"  0.00022263282 0.002691075 
		0.95259035 0.044278931 0.00021704502;
	setAttr -s 5 ".wl[1682].w[20:24]"  6.5292996e-05 0.00034896226 
		0.23847353 0.76013523 0.00097702735;
	setAttr -s 5 ".wl[1683].w[20:24]"  0.00013870645 0.0016761823 
		0.96944702 0.028607242 0.00013086002;
	setAttr -s 5 ".wl[1684].w[20:24]"  4.8610793e-05 0.00025831501 
		0.20960121 0.78936958 0.00072237087;
	setAttr -s 5 ".wl[1685].w[20:24]"  1.6486209e-05 6.5110085e-05 
		0.0042062639 0.99056643 0.0051457658;
	setAttr -s 5 ".wl[1686].w[20:24]"  2.2274455e-05 0.00010488907 
		0.020206572 0.9782027 0.0014636003;
	setAttr -s 5 ".wl[1687].w[20:24]"  1.2220245e-05 5.7827077e-05 
		0.012008612 0.98710316 0.00081813673;
	setAttr -s 5 ".wl[1688].w[20:24]"  9.2662522e-06 3.6735033e-05 
		0.0024496645 0.99451327 0.0029910682;
	setAttr -s 5 ".wl[1689].w[20:24]"  2.6401332e-05 0.00010372718 
		0.0064805825 0.98545641 0.0079329284;
	setAttr -s 5 ".wl[1690].w[20:24]"  3.6419104e-05 0.00017035429 
		0.030331338 0.96712261 0.002339266;
	setAttr -s 5 ".wl[1691].w[20:24]"  3.2014952e-05 0.00015024575 
		0.027407872 0.9703387 0.0020711857;
	setAttr -s 5 ".wl[1692].w[20:24]"  2.3414656e-05 9.2243543e-05 
		0.0058269394 0.98695195 0.0071054008;
	setAttr -s 5 ".wl[1693].w[20:24]"  1.9315059e-05 7.4921321e-05 
		0.0047212332 0.98930478 0.0058797351;
	setAttr -s 5 ".wl[1694].w[20:24]"  2.7549086e-05 0.00012700351 
		0.023257444 0.97482991 0.0017580481;
	setAttr -s 5 ".wl[1695].w[20:24]"  3.4716679e-05 0.00016163965 
		0.028876241 0.9687053 0.0022220986;
	setAttr -s 5 ".wl[1696].w[20:24]"  2.4887819e-05 9.7387296e-05 
		0.0060885162 0.98630345 0.0074857934;
	setAttr -s 5 ".wl[1697].w[20:24]"  2.2554674e-05 8.4190426e-05 
		0.0050792433 0.98820466 0.0066092638;
	setAttr -s 5 ".wl[1698].w[20:24]"  3.5719415e-05 0.00015736732 
		0.02653241 0.9711194 0.0021551731;
	setAttr -s 5 ".wl[1699].w[20:24]"  2.4488874e-05 0.00011056906 
		0.020190332 0.97814548 0.0015291357;
	setAttr -s 5 ".wl[1700].w[20:24]"  1.6263337e-05 6.1980485e-05 
		0.0038914736 0.99112177 0.0049085007;
	setAttr -s 5 ".wl[1701].w[20:24]"  2.9949731e-05 0.00011029348 
		0.006454187 0.98488891 0.0085166395;
	setAttr -s 5 ".wl[1702].w[20:24]"  4.8038673e-05 0.00020825354 
		0.032970063 0.96395242 0.0028211537;
	setAttr -s 5 ".wl[1703].w[20:24]"  4.5946308e-05 0.00020002012 
		0.032033451 0.96500677 0.0027138395;
	setAttr -s 5 ".wl[1704].w[20:24]"  2.870863e-05 0.00010610248 
		0.0062475814 0.98541075 0.0082068453;
	setAttr -s 5 ".wl[1705].w[20:24]"  2.5558365e-05 9.3641247e-05 
		0.0055130483 0.9870339 0.0073338263;
	setAttr -s 5 ".wl[1706].w[20:24]"  4.2190761e-05 0.00018182398 
		0.029257061 0.96804446 0.0024743916;
	setAttr -s 5 ".wl[1707].w[20:24]"  4.796782e-05 0.0002072802 
		0.032745898 0.96419281 0.0028059864;
	setAttr -s 5 ".wl[1708].w[20:24]"  2.9694957e-05 0.00010906242 
		0.0063746367 0.98506331 0.0084233191;
	setAttr -s 5 ".wl[1709].w[20:24]"  3.2900392e-05 0.00014136281 
		0.023568455 0.97431928 0.0019380532;
	setAttr -s 5 ".wl[1710].w[20:24]"  1.9082167e-05 6.9727357e-05 
		0.004169031 0.99016994 0.0055722147;
	setAttr -s 5 ".wl[1711].w[20:24]"  1.6384693e-05 4.2537169e-05 
		0.00046960748 0.49973574 0.49973574;
	setAttr -s 5 ".wl[1712].w[20:24]"  1.2041074e-05 4.1198156e-05 
		0.0012956378 0.96974725 0.028903844;
	setAttr -s 5 ".wl[1713].w[20:24]"  6.9901571e-06 2.3971857e-05 
		0.00076410547 0.98077983 0.018425139;
	setAttr -s 5 ".wl[1714].w[20:24]"  1.4828408e-05 3.8506136e-05 
		0.00042526337 0.49976072 0.49976072;
	setAttr -s 5 ".wl[1715].w[20:24]"  1.7586568e-05 4.5652789e-05 
		0.00050483248 0.49971598 0.49971598;
	setAttr -s 5 ".wl[1716].w[20:24]"  1.8704797e-05 6.3797765e-05 
		0.0019808644 0.95738852 0.040548142;
	setAttr -s 5 ".wl[1717].w[20:24]"  1.6754417e-05 5.7241028e-05 
		0.0017833435 0.96069014 0.037452534;
	setAttr -s 5 ".wl[1718].w[20:24]"  1.7333698e-05 4.5003566e-05 
		0.00049708463 0.49972031 0.49972031;
	setAttr -s 5 ".wl[1719].w[20:24]"  1.7643115e-05 4.5564084e-05 
		0.00050210947 0.4997173 0.4997173;
	setAttr -s 5 ".wl[1720].w[20:24]"  1.3416189e-05 4.5239409e-05 
		0.0014063994 0.96749663 0.031038232;
	setAttr -s 5 ".wl[1721].w[20:24]"  1.7483157e-05 5.9412712e-05 
		0.0018431591 0.95961976 0.038460117;
	setAttr -s 5 ".wl[1722].w[20:24]"  1.7792043e-05 4.6107285e-05 
		0.00050909893 0.49971351 0.49971351;
	setAttr -s 5 ".wl[1723].w[20:24]"  1.8544015e-05 4.7329588e-05 
		0.0005190784 0.49970752 0.49970752;
	setAttr -s 5 ".wl[1724].w[20:24]"  1.4106255e-05 4.6085825e-05 
		0.0014002288 0.96688211 0.031657364;
	setAttr -s 5 ".wl[1725].w[20:24]"  1.0772046e-05 3.5783833e-05 
		0.0011087407 0.97332913 0.025515536;
	setAttr -s 5 ".wl[1726].w[20:24]"  1.752034e-05 4.4990098e-05 
		0.00049505476 0.49972126 0.49972126;
	setAttr -s 5 ".wl[1727].w[20:24]"  1.9274745e-05 4.901069e-05 
		0.00053661893 0.49969754 0.49969754;
	setAttr -s 5 ".wl[1728].w[20:24]"  1.8359313e-05 5.9331902e-05 
		0.0017751704 0.95930064 0.038846586;
	setAttr -s 5 ".wl[1729].w[20:24]"  1.7648274e-05 5.7198078e-05 
		0.0017164801 0.96046054 0.037748128;
	setAttr -s 5 ".wl[1730].w[20:24]"  1.9247022e-05 4.8987142e-05 
		0.00053641398 0.49969766 0.49969766;
	setAttr -s 5 ".wl[1731].w[20:24]"  1.8212277e-05 4.6234854e-05 
		0.00050657184 0.49971446 0.49971446;
	setAttr -s 5 ".wl[1732].w[20:24]"  1.5276464e-05 4.9156966e-05 
		0.0014753612 0.96505833 0.033401892;
	setAttr -s 5 ".wl[1733].w[20:24]"  1.8079929e-05 5.8301295e-05 
		0.0017436137 0.95994961 0.038230404;
	setAttr -s 5 ".wl[1734].w[20:24]"  1.9011295e-05 4.8307298e-05 
		0.00052914856 0.4997018 0.4997018;
	setAttr -s 5 ".wl[1735].w[20:24]"  1.0929128e-05 3.5068879e-05 
		0.001058735 0.97341204 0.025483262;
	setAttr -s 5 ".wl[1736].w[20:24]"  1.6914259e-05 4.287421e-05 
		0.00046947965 0.49973536 0.49973536;
	setAttr -s 5 ".wl[1737].w[20:24]"  4.8840695e-05 0.0001200447 
		0.0011732168 0.49932894 0.49932894;
	setAttr -s 5 ".wl[1738].w[20:24]"  7.1207367e-05 0.00017372461 
		0.0016262116 0.49906445 0.49906445;
	setAttr -s 5 ".wl[1739].w[20:24]"  5.1624596e-05 0.00012891169 
		0.0012623221 0.49927858 0.49927858;
	setAttr -s 5 ".wl[1740].w[20:24]"  5.1491283e-05 0.00012902109 
		0.0012663675 0.49927658 0.49927658;
	setAttr -s 5 ".wl[1741].w[20:24]"  3.973383e-05 0.00010052908 
		0.0010170351 0.49942136 0.49942136;
	setAttr -s 5 ".wl[1742].w[20:24]"  5.1245454e-05 0.00012855843 
		0.0012615949 0.49927932 0.49927932;
	setAttr -s 5 ".wl[1743].w[20:24]"  5.1082607e-05 0.00012804427 
		0.001252719 0.49928412 0.49928412;
	setAttr -s 5 ".wl[1744].w[20:24]"  4.0620063e-05 0.00010093657 
		0.0010163968 0.49942103 0.49942103;
	setAttr -s 5 ".wl[1745].w[20:24]"  5.1847004e-05 0.00012788714 
		0.0012511873 0.49928457 0.49928457;
	setAttr -s 3 ".wl[1746].w";
	setAttr ".wl[1746].w[1:2]" 0.35259398818016052 0.48557135462760925;
	setAttr ".wl[1746].w[13]" 0.16183461248874664;
	setAttr -s 5 ".wl[1747].w";
	setAttr ".wl[1747].w[1:3]" 0.25128856301307678 0.62410616874694824 
		0.00046542598283849657;
	setAttr ".wl[1747].w[8]" 0.00019571013399399817;
	setAttr ".wl[1747].w[13]" 0.12394416332244873;
	setAttr -s 5 ".wl[1748].w";
	setAttr ".wl[1748].w[1:3]" 0.14984352886676788 0.75733792781829834 
		0.0061626611277461052;
	setAttr ".wl[1748].w[8]" 0.0013132392195984721;
	setAttr ".wl[1748].w[13]" 0.085342772305011749;
	setAttr -s 5 ".wl[1749].w";
	setAttr ".wl[1749].w[1:3]" 0.11117066442966461 0.78942757844924927 
		0.016245631501078606;
	setAttr ".wl[1749].w[8]" 0.001901680720038712;
	setAttr ".wl[1749].w[13]" 0.081254340708255768;
	setAttr -s 5 ".wl[1750].w";
	setAttr ".wl[1750].w[1:3]" 0.1036221906542778 0.78681212663650513 
		0.012543447315692902;
	setAttr ".wl[1750].w[8]" 0.0051640556193888187;
	setAttr ".wl[1750].w[13]" 0.091858290135860443;
	setAttr -s 5 ".wl[1751].w";
	setAttr ".wl[1751].w[1:3]" 0.39667835831642151 0.41132184863090515 
		1.2435119060683064e-05;
	setAttr ".wl[1751].w[8]" 5.1281867854413576e-06;
	setAttr ".wl[1751].w[13]" 0.19198223948478699;
	setAttr ".wl[1752].w[11]"  1;
	setAttr -s 5 ".wl[1753].w[8:12]"  2.2853501e-05 9.1220711e-05 
		0.040132765 0.95964283 0.00011040511;
	setAttr -s 5 ".wl[1754].w[8:12]"  2.9823661e-05 0.00013357642 
		0.18896379 0.8108682 4.698421e-06;
	setAttr -s 5 ".wl[1755].w[8:12]"  1.1657184e-07 4.9420419e-07 
		0.15713018 0.84285975 9.4307943e-06;
	setAttr ".wl[1756].w[11]"  1;
	setAttr ".wl[1757].w[12]"  1;
	setAttr ".wl[1758].w[12]"  1;
	setAttr ".wl[1759].w[12]"  1;
	setAttr -s 5 ".wl[1760].w[8:12]"  7.3293932e-06 2.9216775e-05 
		0.028761828 1.6417025e-05 0.97118521;
	setAttr -s 5 ".wl[1761].w[8:12]"  1.0078529e-05 4.1022977e-05 
		0.032137811 0.0018406305 0.96597046;
	setAttr -s 4 ".wl[1762].w[0:3]"  0.11200439 0.51688224 0.37111089 
		2.5620441e-06;
	setAttr -s 4 ".wl[1763].w[0:3]"  0.1381713 0.51784581 0.34397429 
		8.6037953e-06;
	setAttr -s 5 ".wl[1764].w";
	setAttr ".wl[1764].w[0:3]" 0.33122316002845764 0.47994387149810791 
		0.18846137821674347 8.1912503446801566e-08;
	setAttr ".wl[1764].w[8]" 0.00037143958616070449;
	setAttr -s 4 ".wl[1765].w";
	setAttr ".wl[1765].w[0:2]" 0.3135281503200531 0.43868157267570496 
		0.22747795283794403;
	setAttr ".wl[1765].w[8]" 0.02031238004565239;
	setAttr -s 5 ".wl[1766].w[0:4]"  0.29036435 0.37528005 0.2959958 
		6.0817542e-06 0.038353726;
	setAttr -s 6 ".wl[1767].w";
	setAttr ".wl[1767].w[1:4]" 0.39910343289375305 0.44599342346191406 
		1.2646140930883121e-05 0.059715293347835541;
	setAttr ".wl[1767].w[8]" 0.0080265216529369354;
	setAttr ".wl[1767].w[13]" 0.087148740887641907;
	setAttr -s 5 ".wl[1768].w";
	setAttr ".wl[1768].w[0:2]" 0.45900973677635193 0.36812505125999451 
		0.053869213908910751;
	setAttr ".wl[1768].w[20:21]" 0.11392618715763092 0.0050697769038379192;
	setAttr -s 5 ".wl[1769].w";
	setAttr ".wl[1769].w[0:2]" 0.45457413792610168 0.35508710145950317 
		0.060641385614871979;
	setAttr ".wl[1769].w[20:21]" 0.12410550564527512 0.0055918260477483273;
	setAttr -s 6 ".wl[1770].w";
	setAttr ".wl[1770].w[0:2]" 0.41963502764701843 0.33440124988555908 
		0.072322003543376923;
	setAttr ".wl[1770].w[4]" 0.042965885251760483;
	setAttr ".wl[1770].w[20:21]" 0.12462238222360611 0.0060534877702593803;
	setAttr -s 6 ".wl[1771].w";
	setAttr ".wl[1771].w[0:2]" 0.4012247622013092 0.34100055694580078 
		0.085216403007507324;
	setAttr ".wl[1771].w[4]" 0.060686275362968445;
	setAttr ".wl[1771].w[20:21]" 0.106509730219841 0.0053623239509761333;
	setAttr -s 5 ".wl[1772].w";
	setAttr ".wl[1772].w[0:2]" 0.52727264165878296 0.10666634142398834 
		0.012279067188501358;
	setAttr ".wl[1772].w[20:21]" 0.34573164582252502 0.0080503150820732117;
	setAttr -s 6 ".wl[1773].w";
	setAttr ".wl[1773].w[0:2]" 0.50419694185256958 0.10817468166351318 
		0.013716400600969791;
	setAttr ".wl[1773].w[4]" 0.03616902232170105;
	setAttr ".wl[1773].w[20:21]" 0.32973521947860718 0.0080076875165104866;
	setAttr -s 6 ".wl[1774].w";
	setAttr ".wl[1774].w[0:2]" 0.48989415168762207 0.10944735258817673 
		0.016063939779996872;
	setAttr ".wl[1774].w[4]" 0.027672940865159035;
	setAttr ".wl[1774].w[20:21]" 0.34720715880393982 0.0097144320607185364;
	setAttr -s 6 ".wl[1775].w";
	setAttr ".wl[1775].w[0:2]" 0.49326005578041077 0.11758770793676376 
		0.017586473375558853;
	setAttr ".wl[1775].w[4]" 0.025488235056400299;
	setAttr ".wl[1775].w[20:21]" 0.33667534589767456 0.0094021875411272049;
	setAttr -s 5 ".wl[1776].w";
	setAttr ".wl[1776].w[14:16]" 0.0011997086694464087 0.0037310000043362379 
		0.00045310048153623939;
	setAttr ".wl[1776].w[18:19]" 0.49730804562568665 0.49730804562568665;
	setAttr -s 5 ".wl[1777].w";
	setAttr ".wl[1777].w[14:16]" 0.00063282216433435678 0.0020381910726428032 
		0.00024062450393103063;
	setAttr ".wl[1777].w[18:19]" 0.49854421615600586 0.49854421615600586;
	setAttr -s 5 ".wl[1778].w";
	setAttr ".wl[1778].w[14:16]" 0.000691732217092067 0.002322186715900898 
		0.00026854244060814381;
	setAttr ".wl[1778].w[18:19]" 0.49835878610610962 0.49835878610610962;
	setAttr -s 5 ".wl[1779].w";
	setAttr ".wl[1779].w[14:16]" 0.0012698547216132283 0.0041427984833717346 
		0.00051154103130102158;
	setAttr ".wl[1779].w[18:19]" 0.49703791737556458 0.49703791737556458;
	setAttr -s 5 ".wl[1780].w";
	setAttr ".wl[1780].w[14:16]" 0.00097851024474948645 0.0032457234337925911 
		0.0003951500984840095;
	setAttr ".wl[1780].w[18:19]" 0.497690349817276 0.497690349817276;
	setAttr -s 5 ".wl[1781].w";
	setAttr ".wl[1781].w[14:16]" 0.00084152841009199619 0.0025360907893627882 
		0.00027789562591351569;
	setAttr ".wl[1781].w[18:19]" 0.49817228317260742 0.49817228317260742;
	setAttr -s 5 ".wl[1782].w";
	setAttr ".wl[1782].w[14:16]" 0.00073760974919423461 0.0021951633971184492 
		0.00023744115605950356;
	setAttr ".wl[1782].w[18:19]" 0.49841490387916565 0.49841490387916565;
	setAttr -s 5 ".wl[1783].w";
	setAttr ".wl[1783].w[14:16]" 0.0010942771332338452 0.0033814678899943829 
		0.00036262645153328776;
	setAttr ".wl[1783].w[18:19]" 0.49758079648017883 0.49758079648017883;
	setAttr -s 5 ".wl[1784].w";
	setAttr ".wl[1784].w[14:16]" 0.0017307160887867212 0.0052121696062386036 
		0.00060480140382423997;
	setAttr ".wl[1784].w[18:19]" 0.49622616171836853 0.49622616171836853;
	setAttr -s 5 ".wl[1785].w";
	setAttr ".wl[1785].w[14:16]" 0.00073819031240418553 0.0023753289133310318 
		0.00026616689865477383;
	setAttr ".wl[1785].w[18:19]" 0.49831017851829529 0.49831017851829529;
	setAttr -s 5 ".wl[1786].w";
	setAttr ".wl[1786].w[14:16]" 0.0035348571836948395 0.0091269174590706825 
		0.00092733744531869888;
	setAttr ".wl[1786].w[18:19]" 0.49320545792579651 0.49320545792579651;
	setAttr -s 5 ".wl[1787].w";
	setAttr ".wl[1787].w[14:16]" 0.0053075770847499371 0.012667448259890079 
		0.0013252450153231621;
	setAttr ".wl[1787].w[18:19]" 0.49034985899925232 0.49034985899925232;
	setAttr -s 5 ".wl[1788].w";
	setAttr ".wl[1788].w[14:16]" 0.0065967687405645847 0.016510756686329842 
		0.001733695506118238;
	setAttr ".wl[1788].w[18:19]" 0.48757940530776978 0.48757940530776978;
	setAttr -s 5 ".wl[1789].w";
	setAttr ".wl[1789].w[14:16]" 0.0076149711385369301 0.018656224012374878 
		0.0021126929204910994;
	setAttr ".wl[1789].w[18:19]" 0.48580804467201233 0.48580804467201233;
	setAttr -s 5 ".wl[1790].w";
	setAttr ".wl[1790].w[14:16]" 0.0029252681415528059 0.0081889703869819641 
		0.0008509973413310945;
	setAttr ".wl[1790].w[18:19]" 0.49401736259460449 0.49401736259460449;
	setAttr -s 25 ".pm";
	setAttr ".pm[0]" -type "matrix" -1.3521195363553116e-16 4.2663150588105381e-16 1.0000000000000002 -0
		 0.98338218038722658 0.181547479456104 -1.0077909587741464e-16 0 -0.18154747945610411 0.98338218038722669 -5.4588676933599405e-16 0
		 2.2696601595008112 0.52184496170241679 -2.8968214588332815e-16 1;
	setAttr ".pm[1]" -type "matrix" -3.0792046652343965e-17 1.4901160869827661e-08 -1 -0
		 0.99846035320541249 0.055470019622523709 8.2656781139333222e-10 0 0.055470019622523681 -0.99846035320541249 -1.4878218245169274e-08 -0
		 1.5601605336588842 -0.078632865704998181 -1.1717207699834306e-09 1;
	setAttr ".pm[2]" -type "matrix" 1 1.91459929205363e-16 1.5758042969848821e-18 -0
		 -3.420515296461152e-16 0.99999999999999967 1.9447283060821214e-08 0 -2.0594900027919349e-16 -1.9447283142223042e-08 0.99999999999999967 -0
		 -2.3475840464007095e-16 0.61559781902094579 0.1174670956096435 1;
	setAttr ".pm[3]" -type "matrix" 0.99869275951126368 -0.051115282448374426 1.5758046019260134e-18 -0
		 0.051115282448374266 0.99869275951126346 1.9447283060821214e-08 -0 -9.9405357634802067e-10 -1.942186085577647e-08 0.99999999999999978 -0
		 -0.48176870560733032 0.7509203133523854 0.068320431508008497 1;
	setAttr ".pm[4]" -type "matrix" 0.99779740802009709 -0.051115282448374426 -0.042279551187289766 -0
		 0.05106945722164332 0.99869275951126346 -0.0021639405870307691 -0 0.042334892080439501 -1.9421860855798403e-08 0.99910347657914644 -0
		 -1.1090682896521966 0.7509203133523854 0.17270001447804958 1;
	setAttr ".pm[5]" -type "matrix" 0.99869275951126391 -0.05111528244837444 1.4172605623889826e-17 -0
		 0.05111528244837428 0.99869275951126357 1.9447283061465948e-08 -0 -9.940535917533805e-10 -1.9421860855551533e-08 0.99999999999999989 -0
		 -1.8069626089147619 0.75092031335238563 0.040909386886624842 1;
	setAttr ".pm[6]" -type "matrix" 1 -1.2057357744119533e-09 1.4172605585078791e-17 -0
		 1.2057356363678847e-09 0.99999999999999956 1.9447283061465941e-08 -0 -2.447940080691303e-16 -1.9447283142785846e-08 0.99999999999999967 -0
		 -3.5199098276679099 0.4317203549826184 0.13094911414585378 1;
	setAttr ".pm[7]" -type "matrix" 1 -1.2057357744119533e-09 1.4172605585078791e-17 -0
		 1.2057356363678847e-09 0.99999999999999956 1.9447283061465941e-08 -0 -2.447940080691303e-16 -1.9447283142785846e-08 0.99999999999999967 -0
		 -3.4995598976466487 0.83967015203513307 0.091581295290536588 1;
	setAttr ".pm[8]" -type "matrix" 0.99869275963451831 -0.051115280040223601 -1.5758007280452448e-18 -0
		 -0.051115280040223747 -0.99869275963451842 4.0089018775443151e-16 0 -2.2201051248351674e-16 -3.0854357024035061e-16 -1.0000000000000002 -0
		 0.48176828275902944 -0.75092035408584812 -0.068320438369638734 1;
	setAttr ".pm[9]" -type "matrix" 0.99779740814324114 -0.051115280040223594 -0.042279551192505087 -0
		 -0.051069453992353103 -0.9986927596345182 0.002163959914930355 0 -0.042334893073599486 -3.0848042543041963e-16 -0.99910347653706388 -0
		 1.1090676790536769 -0.75091982881289732 -0.17269972933315095 1;
	setAttr ".pm[10]" -type "matrix" 0.99869275963451831 -0.051115280040223594 -8.7057178373761178e-19 -0
		 -0.051115280040223747 -0.99869275963451842 4.0085409259440057e-16 0 -2.2346094193329442e-16 -3.0853556130176189e-16 -1.0000000000000002 -0
		 1.8069586518787746 -0.75091983022519737 -0.040909338369638719 1;
	setAttr ".pm[11]" -type "matrix" 1 1.2748185726283815e-15 8.7057178373833574e-19 -0
		 -1.4296900930922917e-15 1 1.6569979717039749e-16 0 -2.073979431515839e-16 -2.469993899779843e-16 1.0000000000000002 -0
		 3.5027342143172491 0.48437682295132395 0.14360463179833141 1;
	setAttr ".pm[12]" -type "matrix" 1 1.2748185726283815e-15 8.7057178373833574e-19 -0
		 -1.4296900930922917e-15 1 1.6569979717039749e-16 0 -2.073979431515839e-16 -2.469993899779843e-16 1.0000000000000002 -0
		 3.5051146796887571 0.8048780969820577 0.15083145336098902 1;
	setAttr ".pm[13]" -type "matrix" -3.3043323851805324e-16 3.9147507348005905e-16 0.99999999999999978 -0
		 0.98287218693432166 0.18428853505018497 6.3741197015077373e-17 0 -0.18428853505018494 0.98287218693432166 -4.5147065002378041e-16 0
		 0.36397139905651277 0.16332056511287263 -1.74676995560543e-17 1;
	setAttr ".pm[14]" -type "matrix" -1.3136601781792798e-16 -3.7269370649955755e-16 -1 0
		 0.9673173966417784 0.2535686379546413 -3.2687994931546815e-17 -0 0.25356863795464135 -0.96731739664177852 3.3300843466808998e-16 -0
		 0.28768513125657302 -0.044620429063122892 1.2003272993180813e-17 1;
	setAttr ".pm[15]" -type "matrix" 1 -4.5043956607763277e-16 3.2459615796190196e-16 -0
		 1.9922144862532023e-16 0.99999999999999978 -4.6969955188429929e-16 0 -3.3300843466808988e-16 4.872316031615173e-16 1 -0
		 -5.2895147743122437e-17 -0.63554128455479653 -0.087852987723358353 1;
	setAttr ".pm[16]" -type "matrix" 0.97854978498674905 0.20601048104984171 3.2459615796190201e-16 -0
		 -0.2060104810498419 0.97854978498674872 -4.6969955188429929e-16 0 -4.2624014909322315e-16 4.0817715269282352e-16 1 -0
		 -0.2775405282954192 -0.70257749694035976 0.090099208683109999 1;
	setAttr ".pm[17]" -type "matrix" 1.0000000000000002 -5.280597148979334e-17 3.2459615796190206e-16 -0
		 -2.144556075055018e-16 0.99999999999999989 -4.6969955188429939e-16 0 -3.3300843466809012e-16 4.872316031615172e-16 1 -0
		 -1.2721594084606362 -0.45015525217990515 0.090099208683109999 1;
	setAttr ".pm[18]" -type "matrix" 0.97854978498674894 0.20601048104984226 -2.0788011859079664e-16 -0
		 0.20601048104984196 -0.97854978498674905 -8.4701635128450088e-17 0 -2.2549051519324341e-16 2.1170281432718095e-17 -1 -0
		 0.28195313718040826 0.70352569473543114 -0.09272521012597558 1;
	setAttr ".pm[19]" -type "matrix" 1 5.4710015688815044e-16 -2.0788011859079664e-16 -0
		 2.1874406211879516e-16 -1 -8.4701635128450088e-17 0 -2.1629239529698485e-16 6.7169583851231972e-17 -1 -0
		 1.2766748485675985 0.45017361589196209 -0.092725210125975566 1;
	setAttr ".pm[20]" -type "matrix" 5.1713628118224406e-17 -4.4454742703464451e-16 1.0000000000000002 -0
		 -0.99996347632351446 0.0085466963788334693 -1.0077909587741463e-16 0 -0.0085466963788333964 -0.99996347632351457 -5.4588676933599405e-16 0
		 -2.5297347443397031 -0.083686141018680563 -3.1234702571904246e-16 1;
	setAttr ".pm[21]" -type "matrix" -2.5404405947559193e-16 -3.6845397278552231e-16 1 -0
		 -0.74651327167572246 0.66537052475444725 -1.0077909587741458e-16 0 -0.66537052475444725 -0.74651327167572268 -5.4588676933599405e-16 0
		 -3.0049428278329144 2.5213211682818768 -1.5780773090754792e-16 1;
	setAttr ".pm[22]" -type "matrix" -4.2555345756655866e-16 -1.385675610286177e-16 1.0000000000000002 -0
		 -0.18928616226399916 0.98192196674448962 -1.0077909587741461e-16 0 -0.98192196674448973 -0.1892861622639993 -5.4588676933599415e-16 0
		 -1.4397771472127678 4.2728052983889224 -6.9774517570262717e-17 1;
	setAttr ".pm[23]" -type "matrix" -4.4011859920580427e-16 -8.1193182283940391e-17 1.0000000000000002 -0
		 -0.058041521504599548 0.99831416987911714 -1.0077909587741462e-16 0 -0.99831416987911725 -0.05804152150459968 -5.4588676933599415e-16 -0
		 -1.8600914062914902 4.5581604241768376 7.0153694242726756e-18 1;
	setAttr ".pm[24]" -type "matrix" 1.0000000000000002 -4.906724787538961e-17 5.5492434757099734e-16 -0
		 -1.1118743673327547e-16 1 -1.9460510451357639e-17 0 -6.5690907179851e-16 -1.0946726866422164e-16 0.99999999999999978 -0
		 -2.6813165913627282e-16 4.7179222387014486 2.615510330731007 1;
	setAttr ".gm" -type "matrix" 1.5 0 0 0 0 1.5 0 0 0 0 1.5 0 0 0 0 1;
	setAttr -s 25 ".ma";
	setAttr -s 25 ".dpf[0:24]"  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4 4 4;
	setAttr -s 25 ".lw";
	setAttr -s 25 ".lw";
	setAttr ".mi" 5;
	setAttr ".ptw" -type "doubleArray" 1791 9.5686569693498313e-05 0 0.00084532552864402533
		 0 1.6175540906715469e-09 0 3.1280862458515912e-05 0.00011532031930983067
		 0.00368277239613235 0.16636377573013306 0.00066777988104149699 0.00012633641017600894
		 0 0 0 0.030897773802280426 0.022838354110717773 0.00076158426236361265 0
		 0.017849957570433617 0.005163850262761116 7.4306553869973868e-05 0 1.1208283723362911e-07
		 1.4265665413404349e-05 0 0 0 0 5.6678512919461355e-05 0.019553063437342644
		 0.0049968985840678215 9.5252389655797742e-06 0.014492579735815525 0.020739970728754997
		 1.9734168745344505e-05 2.1460793675487366e-07 0 1.4998117592313065e-07 1.3274938481799836e-08
		 3.4736302723104018e-09 0.00011558784899534658 0.0040620975196361542 0 0 0
		 0 0 0.0018516788259148598 1.7199994317707024e-06 0.00082757748896256089 4.8757483455119655e-05
		 5.285912993713282e-05 0.0076218261383473873 0.00014169653877615929 0.01033406425267458
		 0.011225859634578228 0 3.8158732422743924e-06 3.4205749344096148e-09 1.8175295990463525e-10
		 3.0484805392916314e-05 4.9221878725802526e-05 4.988585544651869e-08 0 2.9915361210441915e-07
		 0 0.052674494683742523 5.6805016356520355e-05 1.2049841302541608e-07 8.3947770690429024e-06
		 0 0 0.00024979756562970579 1.5524027219271375e-07 0 0 0 0 0 0.014174480922520161
		 0.00026426909607835114 0.0020656643901020288 0 0.012973609380424023 0 0 0
		 0 0 1.5227947187668178e-06 2.7443273211247288e-05 0.0017132832435891032 0.00010043429938377813
		 1.2205052968283781e-08 2.8188316719024442e-05 2.6835159094851235e-10 1.5519291991950013e-05
		 6.6146603785455227e-05 0.0029287596698850393 2.2963909032114316e-06 1.2194093734763101e-08
		 0 0.040708795189857483 2.2206009816727601e-05 1.7364902760164114e-07 6.9380553213704843e-06
		 0.0020801657810807228 2.2495987650472671e-06 3.8044834838046881e-08 2.2510697817779146e-05
		 6.1296086641959846e-06 3.9173492893951334e-08 1.2677015881479292e-08 0 2.1971500245854259e-05
		 0 0 8.1266480265185237e-05 6.8044414547330234e-06 2.4389535724367306e-08
		 8.0936688462429629e-09 0 0 0 0.00010992072930093855 0 0 0.00027688461705110967
		 0 0.00034698221134021878 0.0002769232087302953 0.22234316170215607 0.0067066806368529797
		 0.10844211280345917 0.053013507276773453 0.99325412511825562 0.73493856191635132
		 0.93586397171020508 0.73210030794143677 0.99890094995498657 0.95329838991165161
		 0.99512237310409546 0.95493799448013306 0.60156536102294922 0.49771115183830261
		 0.58595865964889526 0.4992210865020752 0.49816533923149109 0.4990425705909729
		 0.49904718995094299 0.50048965215682983 0.49855723977088928 0.49724212288856506
		 0.4993923008441925 0.49892008304595947 0.49725699424743652 0.49590429663658142
		 0.49826633930206299 0.49757599830627441 0.49956461787223816 0.49920490384101868
		 0.4991905689239502 0.49954572319984436 0.49816516041755676 0.49784111976623535
		 0.49751284718513489 0.49823009967803955 0.50960254669189453 0.4993915855884552
		 0.5156635046005249 0.49887287616729736 0.49336090683937073 0.49658748507499695
		 0.48765110969543457 0.49399638175964355 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.4975002110004425
		 0.49476882815361023 0.49847644567489624 0.49690330028533936 0.49713253974914551
		 0.10051614046096802 0.073512084782123566 0.050301238894462585 0.20195935666561127
		 0.19893907010555267 0.46469652652740479 0.056348204612731934 0.85150372982025146
		 0.88657408952713013 0.37809732556343079 0.60391891002655029 0.60596638917922974
		 0.88231420516967773 0.56975454092025757 0.26094561815261841 0.4998893141746521
		 0.87287032604217529 0.42730289697647095 0.011063814163208008 0.7011791467666626
		 0.9587785005569458 0.99684077501296997 0.98301702737808228 0.9540669322013855
		 0.99989962577819824 0.98839724063873291 0.99992024898529053 0.97790002822875977
		 0.9509088397026062 0.97777307033538818 0.94706732034683228 0.94739151000976562
		 0.67820954322814941 0.93844312429428101 0.51564610004425049 0.49823996424674988
		 0.49697381258010864 0.58813101053237915 0.94832724332809448 0.87567561864852905
		 0.66672009229660034 0.72327721118927002 0.65723562240600586 0.49851709604263306
		 0.50023841857910156 0.53560131788253784 0.54444205760955811 0.49948275089263916
		 0.49826124310493469 0.4964231550693512 0.49838146567344666 0.49611625075340271
		 0.49855011701583862 0.49344998598098755 0.49273478984832764 0.49047645926475525
		 0.48581397533416748 0.4969102144241333 0.49616116285324097 0.49855318665504456
		 0.49650794267654419 0.49711471796035767 0.4999137818813324 0.49992823600769043
		 0.49941477179527283 0.49983501434326172 0.49845516681671143 0.49897280335426331
		 0.49855160713195801 0.49918568134307861 0.49905967712402344 0.4946826696395874
		 0.49746602773666382 0.49568739533424377 0.49937298893928528 0.49861964583396912
		 0.49730294942855835 0.49791467189788818 0.49807623028755188 0.49841666221618652
		 0.49956247210502625 0.49865993857383728 0.49912464618682861 0.49998119473457336
		 0.49997368454933167 0.49909210205078125 0.49994578957557678 0.49831247329711914
		 0.49953979253768921 0.49859300255775452 0.49994343519210815 0.4999031126499176
		 0.49676457047462463 0.49853593111038208 0.49794226884841919 0.49933966994285583
		 0.49757382273674011 0.49642911553382874 0.49857506155967712 0.49935439229011536
		 0.50010669231414795 0.52832472324371338 0.49818551540374756 0.49948605895042419
		 0.56984072923660278 0.53321653604507446 0.52838802337646484 0.51193910837173462
		 0.50434035062789917 0.50247865915298462 0.49996340274810791 0.49986359477043152
		 0.49481245875358582 0.49487167596817017 0.49778896570205688 0.49411880970001221
		 0.4892081618309021 0.48749533295631409 0.4952755868434906 0.49894142150878906
		 0.020633872598409653 0.0064009553752839565 0.0028198524378240108 0.0014203699538484216
		 0.0013678569812327623 0.0077102761715650558 0.0042047095485031605 0.00010004509385908023
		 3.0322496968437918e-05 0.00050161761464551091 0.00048793238238431513 0.00071010686224326491
		 0.00092810526257380843 0.00042039089021272957 8.426692511420697e-05 2.1904709512909903e-07
		 0 0.001347103388980031 0.00096504698740318418 5.8429061027709395e-05 0 0
		 0 0 0 0 0.0054892702028155327 0 0 0 0.0021952579263597727 0.014409228228032589
		 7.2844375154090812e-07 6.0403097450034693e-05 0.0038385172374546528 9.4573251772089861e-06
		 0.00017020636005327106 0.0043563768267631531 0.00033520700526423752 0 0 0.0007115495391190052
		 0 0 0.0016477575991302729 1.792426118640833e-08 1.2938704685439006e-06 0.0001784373598638922
		 0.00017007217684295028 0.00033136771526187658 5.4396710766013712e-05 6.024080123623321e-10
		 1.6261995483546343e-07 0.0057118581607937813 0.0021221886854618788 2.289477561134845e-05
		 0.00023498650989495218 0.00013335056428331882 0.00020314721041359007 6.0512211348395795e-06
		 1.6578890154050896e-06 4.9007703637471423e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 5.3177143399807392e-07 0 0 0 0 0 9.2934999429417076e-07 0.018218649551272392
		 0.00035784597275778651 0.0015454660169780254 0.0013776686973869801 0.020635068416595459
		 7.8700795711483806e-06 0.00077480787876993418 0.030784573405981064 2.8735255909850821e-05
		 0.00012959832383785397 0.00015440056449733675 4.67511767965334e-07 1.1749868633614824e-07
		 0.0013612571638077497 0.0019833198748528957 0.0028383999597281218 0.00013167166616767645
		 0.0061057670973241329 0 0 0 0 0 2.5342703793285182e-06 2.2392644183355515e-08
		 0 1.0249817023577634e-05 1.1025611456716433e-05 7.840408943593502e-05 6.8065132836636622e-06
		 2.5282808735482831e-08 4.1209254675322882e-08 0.0029476021882146597 1.6159357983269729e-05
		 2.5285087758675218e-05 0 0.029690498486161232 4.0212493331637233e-05 2.0724050955323037e-06
		 7.7307454660058283e-08 0.0029735546559095383 6.8543886300176382e-05 0 0 5.8638277550926432e-05
		 2.9212145591372973e-08 2.9742989321457358e-11 1.5276148401799361e-11 0 2.2108039843260485e-09
		 1.9767026060435455e-07 3.2395787457062397e-06 0 2.3629800338653695e-08 0
		 1.6958533421984612e-07 3.5579425912146689e-06 1.6575054928580357e-07 1.3143661270476059e-08
		 4.1120504334912766e-08 5.3363697816166678e-07 2.3819238137434695e-08 3.3018083822611288e-09
		 8.1234855997536215e-07 2.9724316163992626e-07 5.920119949820446e-09 3.5344218218824608e-08
		 3.3081839490023413e-08 1.2359652146187727e-07 8.671404998494836e-07 1.263478566215781e-07
		 9.106789633506196e-08 1.7107968375285054e-09 5.1924557986637865e-09 0 0.00030670739943161607
		 7.731081495876424e-06 5.8448540585231967e-06 6.8889756221324205e-05 3.6412238841876388e-06
		 2.2702751323322445e-07 0 9.663012434657503e-08 9.7795818874146789e-06 8.1000632690120256e-07
		 1.6085634797491366e-06 9.0776811703108251e-05 0.00030560221057385206 5.6510948525101412e-06
		 1.0039581866294611e-05 0.00038026613765396178 0.00018684005772229284 0.00028282232233323157
		 0.00011204057227587327 0.00019090356363449246 6.524787750095129e-05 8.8535516624688171e-06
		 4.5030184026018105e-08 1.0650779813659028e-06 1.5834958730920334e-06 1.244002874045691e-06
		 3.6729436487803468e-06 1.3191893231123686e-05 2.0214536561979912e-05 2.6636686015990563e-05
		 0.00012282759416848421 4.5761469664284959e-05 0.00022608040308114141 0.00034456443972885609
		 0.00058791099581867456 0.00026942012482322752 0.00044135804637335241 0.00049149466212838888
		 0.0010841024341061711 0.00094753899611532688 0.00043493547127582133 0.00031906619551591575
		 0.00042054700315929949 0.0005822859238833189 0.00020337215391919017 0.00025649403687566519
		 8.1706375567591749e-06 9.9418857644195668e-06 7.2239592554979026e-05 0.0001182238120236434
		 0.00018185394583269954 0.00020663328177761286 0.00013798463623970747 9.5762581622693688e-05
		 6.6080807300750166e-05 0.00011223366891499609 0.00072787509998306632 0.00042366835987195373
		 0.00053899583872407675 0.00090287713101133704 0.00040143149089999497 0.00020776607561856508
		 2.0294417481636629e-05 8.9191373263020068e-05 0.00019984794198535383 7.7582692028954625e-05
		 0.00019889378745574504 0.00041658437112346292 0.00032353925053030252 0.000149407351273112
		 0.00013371239765547216 0.00030612782575190067 0.00011807607370428741 0.00022440442990045995
		 0.00021463407028932124 5.5517990404041484e-05 0.00012012034130748361 3.0017429253348382e-06
		 2.1090802420076216e-06 0.00010454640141688287 0.00026835600147023797 0.00022275021183304489
		 0.00020633448730222881 5.450302705867216e-05 6.3346187744173221e-06 0.00031864066841080785
		 0.00010934911551885307 0.00018553133122622967 0.00050600769463926554 0.00021108447981532663
		 5.6574532209197059e-05 6.2251142480818089e-06 8.7790438556112349e-05 0.00033245602389797568
		 9.6452073194086552e-05 0.00017689735977910459 0.0005199545412324369 0.00020253767434041947
		 5.543330917134881e-05 1.1464274393802043e-05 9.2401896836236119e-05 6.3346080423798412e-05
		 0.00021553965052589774 0.00021197189926169813 0.00015993179113138467 0.00016444694483652711
		 3.8765225326642394e-05 0.00014275018475018442 0.00050688255578279495 0.00024906409089453518
		 0.00038260265137068927 0.00069635128602385521 0.0001804015482775867 4.2037631828861777e-06
		 0.00030660082120448351 7.6312469900585711e-05 0.00022618479852098972 0.00072829041164368391
		 0.00067633000435307622 0.00020163095905445516 0.00020876529742963612 0.00079213257413357496
		 0.001596005167812109 0.00060805631801486015 0.00069171085488051176 0.0017445872072130442
		 0.00063528132159262896 0.00021598610328510404 1.5967692888807505e-05 0.00013960714568383992
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00045310048153623939
		 0.00024062450393103063 0.00026854244060814381 0.00051154103130102158 0.0003951500984840095
		 0.00027789562591351569 0.00023744115605950356 0.00036262645153328776 0.00060480140382423997
		 0.00026616689865477383 0.00092733744531869888 0.0013252450153231621 0.001733695506118238
		 0.0021126929204910994 0.0008509973413310945 ;
	setAttr ".ucm" yes;
createNode objectSet -n "skinCluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose1";
	setAttr -s 25 ".wm";
	setAttr -s 25 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -2.3266829938518687
		 -0.10112195508370005 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.45234182885951868 0.54349505045034785 0.45234182885951846 0.54349505045034752 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.77204268001734933
		 0.077518613731292527 -4.3031474900752398e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 0.9929243870802773 0.1187483117406542 8.8474387464361707e-10 7.3978632333918814e-09 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.93899461413145313
		 0.0045061368867563064 6.7146793150493724e-11 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 0.48593466017520126 0.51368036119703941 -0.48593465252076773 0.51368035395604883 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 1.9430569976901106e-08 -6.1289233009862508e-18
		 0.051137567423808768 0 0.5195224219623833 -0.10971511743210438 0.049146664101635026 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 2.246157234247213e-31 2.3718012338928169e-15
		 1.9381383634664652e-30 0 0.63361651494793214 0 -0.05727246590126378 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.021172192410523413 0 0.99977584401131225 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.69454244036747226
		 -1.1102230246251565e-16 0.055329734980219758 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 0 0.02117219241052342 0 0.99977584401131225 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.6862783429628685
		 0.13984313987548336 -0.09003972725922893 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 -0.025565997214119375 0.99967313647334133 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.6451025465829607
		 -0.26653317631375828 -0.050671908403911732 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 -0.025565997214119375 0.99967313647334133 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 -1.3074246034809228e-16 4.1329785540664256e-18
		 0.051137565012505402 0 -0.51952200000000004 -0.10971517965040667 0.049146643134637305 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 9.7236417308557012e-09 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 -1.4545113412523269e-21 4.743629196404848e-15
		 1.8374177494829477e-20 0 -0.63361631567355015 -5.2527295069104696e-07
		 0.057272199999999995 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.021172192410522091 0 0.99977584401131225 1
		 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.69453909953154169
		 1.4122999436594341e-09 -0.055329665829510863 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 0 0.021172192410522091 0 0.99977584401131225 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.6664375899338155
		 -0.088132963937644582 0.10269529342869244 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0.99967313648875211 -0.025565996611532155 -7.2422574129885932e-18 2.8318435198553914e-16 1
		 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.6524324310895724
		 0.23207101604457858 0.10992211499134985 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.99967313648875211 -0.025565996611532155 -7.2422574129885932e-18 2.8318435198553914e-16 1
		 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.2853271836453577e-17
		 0.22776234817780644 0.024019602995749859 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.45158373643877181 0.54412510416631032 0.45158373643877192 0.54412510416630999 1
		 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.12297324460901343
		 -2.7755575615628914e-17 9.2444637330587321e-33 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0.97570988830532723 0.21906668816414299 1.3413965923001454e-17 5.9744999580477026e-17 1
		 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.92473203452774855
		 0.03155118545361859 6.4947010331945886e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0.43198129648323874 0.55981439735742788 -0.43198129648323863 0.559814397357428 1
		 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.41632555240806862
		 -0.0052104837322459116 -0.17795219640646834 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 -0.10356209493161826 0.99462299012911137 1 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.87459408727391097
		 0 -0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.10356209493161808 0.99462299012911148 1
		 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.42083884856759818
		 -0.0051916686628352996 -0.18057819784933432 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0.99462299012911148 0.10356209493161811 2.9336753857849752e-17 2.8175376195357119e-16 1
		 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.87459627821755581
		 -4.4408920985006262e-16 4.9303806576313238e-32 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0 0 0.10356209493161807 0.99462299012911148 1 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 8.8416841424516584e-16 9.9658579761025342e-16
		 2.8709080414949099e-31 0 -0.19812402669183823 -0.040829417753008156
		 2.266487983571438e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.99543825335109426 0.095407985857174055 1
		 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 3.6008522234007014e-28 -7.9563086429479338e-27
		 -6.208994033720171e-16 0 1.3919662210542887 2.4980018054066022e-16 -1.5453929481149426e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.35201368856835863 0.93599485204807542 1
		 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 -5.0717666396935106e-29 -6.0262752748391201e-27
		 -5.629877885133937e-16 0 0.73307307876115724 4.4408920985006262e-16
		 -8.8033213337285414e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.32043207817309738 0.94727149396446531 1
		 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 -7.1682157087539564e-33 -3.1115104155789767e-27
		 -1.1418183495539399e-16 0 1.0056065393180338 8.8817841970012523e-16
		 -7.6789886994535434e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.066132178346986953 0.9978108713514211 1
		 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.0248450034171095
		 8.8817841970012523e-16 -6.4338693263558108e-17 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0.020529430830412015 -0.70680870288203101 0.020529430830412011 0.70680870288203113 1
		 1 1 yes;
	setAttr -s 25 ".m";
	setAttr -s 25 ".p";
	setAttr ".bp" yes;
createNode animCurveTL -n "ikHandle3_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 7.5656424112686973e-06 4 7.5656424112686973e-06 
		8 7.5656424112686973e-06 12 7.5656424112686973e-06 16 7.5656424112686973e-06;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTL -n "ikHandle3_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.036756393475478703 4 -0.050129121825667387 
		8 -0.057243283247262661 12 -0.050941933199314601 16 -0.036756393475478703;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  0.093068122863769531;
	setAttr -s 5 ".kiy[4]"  -0.99565976858139038;
	setAttr -s 5 ".kox[4]"  0.093068115413188934;
	setAttr -s 5 ".koy[4]"  -0.99565970897674561;
createNode animCurveTL -n "ikHandle3_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.028067704067888374 4 -0.028067704067888374 
		8 -0.028067704067888374 12 -0.028067704067888374 16 -0.028067704067888374;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_visibility";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 8 1 12 1 16 1;
	setAttr -s 5 ".kit[0:4]"  9 9 9 9 1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
createNode animCurveTA -n "ikHandle3_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 89.201376053897292 4 89.201376053897292 
		8 89.201376053897292 12 89.201376053897292 16 89.201376053897292;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTA -n "ikHandle3_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 65.124517208349218 4 65.124517208349218 
		8 65.124517208349218 12 65.124517208349218 16 65.124517208349218;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTA -n "ikHandle3_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 88.531246713958538 4 88.531246713958538 
		8 88.531246713958538 12 88.531246713958538 16 88.531246713958538;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_scaleX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 8 1 12 1 16 1;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_scaleY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 8 1 12 1 16 1;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_scaleZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 8 1 12 1 16 1;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_poleVectorX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 0 8 0 12 0 16 0;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_poleVectorY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 0 8 0 12 0 16 0;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_poleVectorZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 8 1 12 1 16 1;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_offset";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 0 8 0 12 0 16 0;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTA -n "ikHandle3_roll";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 0 8 0 12 0 16 0;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTA -n "ikHandle3_twist";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 0 8 0 12 0 16 0;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTU -n "ikHandle3_ikBlend";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 8 1 12 1 16 1;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[4]"  1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[4]"  1;
	setAttr -s 5 ".koy[4]"  0;
createNode animCurveTL -n "ikHandle1_translateX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0.014906001794801189 9 0.012573442042962521 
		16 0.014906001794801189 19 0.018145833386146278 22 0.018145833386146278;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  0.46373191475868225 1 0.46373191475868225 
		0.57872563600540161 0.57872563600540161;
	setAttr -s 5 ".kiy[0:4]"  -0.88597559928894043 0 -0.88597559928894043 
		-0.81552237272262573 -0.81552237272262573;
	setAttr -s 5 ".kox[0:4]"  0.46373191475868225 1 0.46373191475868225 
		0.57872557640075684 0.57872557640075684;
	setAttr -s 5 ".koy[0:4]"  -0.88597559928894043 0 -0.88597559928894043 
		-0.81552231311798096 -0.81552231311798096;
createNode animCurveTL -n "ikHandle1_translateY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.012731764143142475 9 -0.012533881985079327 
		16 -0.012731764143142475 19 -0.018977563632415439 22 -0.0071201336574551726;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 0.19624295830726624 0.21742288768291473;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0.98055535554885864 -0.97607755661010742;
	setAttr -s 5 ".kox[0:4]"  1 1 1 0.19624294340610504 0.21742288768291473;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0.98055529594421387 -0.97607755661010742;
createNode animCurveTL -n "ikHandle1_translateZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0.0031261158670398159 9 -0.0037385597930541681 
		16 0.0031261158670398159 19 0.0031261158670398159 22 0.0031261158670398159;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_visibility";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 9 1 16 1 19 1 22 1;
	setAttr -s 5 ".kit[0:4]"  1 9 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
createNode animCurveTA -n "ikHandle1_rotateX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 35.90240974628832 9 35.90240974628832 
		16 35.90240974628832 19 35.90240974628832 22 35.90240974628832;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTA -n "ikHandle1_rotateY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -12.596115666551384 9 -12.596115666551384 
		16 -12.596115666551384 19 -12.596115666551384 22 -12.596115666551384;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTA -n "ikHandle1_rotateZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -2.3696686282547281 9 -2.3696686282547281 
		16 -2.3696686282547281 19 -2.3696686282547281 22 -2.3696686282547281;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_scaleX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 9 1 16 1 19 1 22 1;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_scaleY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 9 1 16 1 19 1 22 1;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_scaleZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 9 1 16 1 19 1 22 1;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_poleVectorX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 9 0 16 0 19 0 22 0;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_poleVectorY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 9 0 16 0 19 0 22 0;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_poleVectorZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 9 1 16 1 19 1 22 1;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_offset";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 9 0 16 0 19 0 22 0;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTA -n "ikHandle1_roll";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 9 0 16 0 19 0 22 0;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTA -n "ikHandle1_twist";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 9 0 16 0 19 0 22 0;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "ikHandle1_ikBlend";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 9 1 16 1 19 1 22 1;
	setAttr -s 5 ".kit[1:4]"  10 1 1 1;
	setAttr -s 5 ".kot[1:4]"  10 1 1 1;
	setAttr -s 5 ".kix[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".kiy[0:4]"  0 0 0 0 0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTL -n "ikHandle2_translateX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 -0.012089525519475976 9 -0.012546818937225908 
		13 -0.012089525519475976 16 -0.012089525519475976 18 -0.012089525519475976 
		21 -0.012089525519475976;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTL -n "ikHandle2_translateY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 -0.013892990019820629 9 -0.01249154040125585 
		13 -0.013892990019820629 16 -0.013892990019820629 18 -0.015012470994019525 
		21 -0.0030511330913351709;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  0.75656741857528687 1 0.75656741857528687 
		0.75656741857528687 0.74492740631103516 0.24873270094394684;
	setAttr -s 6 ".kiy[0:5]"  0.6539156436920166 0 0.6539156436920166 
		0.6539156436920166 0.66714560985565186 -0.96857219934463501;
	setAttr -s 6 ".kox[0:5]"  0.75656741857528687 1 0.75656741857528687 
		0.75656741857528687 0.74492734670639038 0.24873270094394684;
	setAttr -s 6 ".koy[0:5]"  0.6539156436920166 0 0.6539156436920166 
		0.6539156436920166 0.66714555025100708 -0.96857219934463501;
createNode animCurveTL -n "ikHandle2_translateZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 -0.0027784003544315474 9 0.0073990712738791547 
		13 -0.0027784003544315474 16 -0.0027784003544315474 18 0.0051407269431827983 
		21 0.0051407269431827983;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  0.79068702459335327 1 0.79068702459335327 
		0.79068702459335327 0.15591529011726379 1;
	setAttr -s 6 ".kiy[0:5]"  0.61222058534622192 0 0.61222058534622192 
		0.61222058534622192 -0.9877704381942749 0;
	setAttr -s 6 ".kox[0:5]"  0.79068702459335327 1 0.79068702459335327 
		0.79068702459335327 0.15591529011726379 1;
	setAttr -s 6 ".koy[0:5]"  0.61222058534622192 0 0.61222058534622192 
		0.61222058534622192 -0.9877704381942749 0;
createNode animCurveTU -n "ikHandle2_visibility";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 1 9 1 13 1 16 1 18 1 21 1;
	setAttr -s 6 ".kit[0:5]"  1 9 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
createNode animCurveTA -n "ikHandle2_rotateX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 145.99343307912454 9 145.99343307912454 
		13 145.99343307912454 16 145.99343307912454 18 145.99343307912454 21 145.99343307912454;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTA -n "ikHandle2_rotateY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 61.385129039875352 9 61.385129039875352 
		13 61.385129039875352 16 61.385129039875352 18 61.385129039875352 21 61.385129039875352;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTA -n "ikHandle2_rotateZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 -55.896864168893451 9 -55.896864168893451 
		13 -55.896864168893451 16 -55.896864168893451 18 -55.896864168893451 21 -55.896864168893451;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_scaleX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 1 9 1 13 1 16 1 18 1 21 1;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_scaleY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 1 9 1 13 1 16 1 18 1 21 1;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_scaleZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 1 9 1 13 1 16 1 18 1 21 1;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_poleVectorX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 0 9 0 13 0 16 0 18 0 21 0;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_poleVectorY";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 0 9 0 13 0 16 0 18 0 21 0;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_poleVectorZ";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 1 9 1 13 1 16 1 18 1 21 1;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_offset";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 0 9 0 13 0 16 0 18 0 21 0;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTA -n "ikHandle2_roll";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 0 9 0 13 0 16 0 18 0 21 0;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTA -n "ikHandle2_twist";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 0 9 0 13 0 16 0 18 0 21 0;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "ikHandle2_ikBlend";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  1 1 9 1 13 1 16 1 18 1 21 1;
	setAttr -s 6 ".kit[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kot[1:5]"  10 1 1 1 1;
	setAttr -s 6 ".kix[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".kiy[0:5]"  0 0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTL -n "joint28_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0.0041632555240806862 4 0.0041632555240806862 
		9 0.0041632555240806862 12 0.0041632555240806862 16 0.0041632555240806862;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTL -n "joint28_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -5.2104837322459118e-05 4 -5.2104837322459118e-05 
		9 -5.2104837322459118e-05 12 -5.2104837322459118e-05 16 -5.2104837322459118e-05;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTL -n "joint28_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.0017795219640646834 4 -0.0017795219640646834 
		9 -0.0017795219640646834 12 -0.0017795219640646834 16 -0.0017795219640646834;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint28_visibility";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[0:4]"  9 9 9 1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
createNode animCurveTA -n "joint28_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 0 9 -9.2896684802061422 12 
		0 16 0;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTA -n "joint28_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 20.436154115163305 9 18.283677417764714 
		12 20.436154115163305 16 0;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 0.3307337760925293;
	setAttr -s 5 ".kiy[3:4]"  0 0.94372409582138062;
	setAttr -s 5 ".kox[3:4]"  1 0.33073374629020691;
	setAttr -s 5 ".koy[3:4]"  0 0.94372403621673584;
createNode animCurveTA -n "joint28_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 4 0 9 -27.537033212635368 12 
		0 16 0;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint28_scaleX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint28_scaleY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint28_scaleZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTL -n "joint30_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.0042083884856759816 4 -0.0042083884856759816 
		9 -0.0042083884856759816 12 -0.0042083884856759816 16 -0.0042083884856759816;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTL -n "joint30_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -5.1916686628353e-05 4 -5.1916686628353e-05 
		9 -5.1916686628353e-05 12 -5.1916686628353e-05 16 -5.1916686628353e-05;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTL -n "joint30_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.0018057819784933432 4 -0.0018057819784933432 
		9 -0.0018057819784933432 12 -0.0018057819784933432 16 -0.0018057819784933432;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint30_visibility";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[0:4]"  9 9 9 1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
createNode animCurveTA -n "joint30_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -0.1235494800564559 4 -0.14828869645452467 
		9 -20.077865192730091 12 -0.14828869645452467 16 -0.1235494800564559;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTA -n "joint30_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 21.852864295316149 4 39.348873189057556 
		9 34.580098226773373 12 39.348873189057556 16 21.852864295316149;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  0.8321540355682373 0.37883737683296204;
	setAttr -s 5 ".kiy[3:4]"  0.55454444885253906 0.92546325922012329;
	setAttr -s 5 ".kox[3:4]"  0.8321540355682373 0.37883737683296204;
	setAttr -s 5 ".koy[3:4]"  0.55454444885253906 0.92546325922012329;
createNode animCurveTA -n "joint30_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 -2.1453404100666642 4 -2.1933734220512586 
		9 -34.741231499424472 12 -2.1933734220512586 16 -2.1453404100666642;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint30_scaleX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint30_scaleY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "joint30_scaleZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 1 4 1 9 1 12 1 16 1;
	setAttr -s 5 ".kit[3:4]"  1 1;
	setAttr -s 5 ".kot[3:4]"  1 1;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTA -n "joint1_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 8 0 16 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTA -n "joint1_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 8 0 16 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTA -n "joint1_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -4.8032908021855585 8 8.6126261674070275 
		16 -4.8032908021855585;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  0.77980011701583862;
	setAttr -s 3 ".kiy[2]"  0.62602865695953369;
	setAttr -s 3 ".kox[2]"  0.77980005741119385;
	setAttr -s 3 ".koy[2]"  0.62602859735488892;
createNode animCurveTU -n "joint1_visibility";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 8 1 16 1;
	setAttr -s 3 ".kit[0:2]"  9 9 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
createNode animCurveTL -n "joint1_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 8 0 16 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTL -n "joint1_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -0.023266829938518689 8 -0.023266829938518689 
		16 -0.023266829938518689;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTL -n "joint1_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -0.0010112195508370004 8 -0.0010112195508370004 
		16 -0.0010112195508370004;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTU -n "joint1_scaleX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 8 1 16 1;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTU -n "joint1_scaleY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 8 1 16 1;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTU -n "joint1_scaleZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 8 1 16 1;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[2]"  1;
	setAttr -s 3 ".koy[2]"  0;
createNode animCurveTA -n "joint9_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 7.2842460300008431;
createNode animCurveTA -n "joint9_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -21.925268098943345;
createNode animCurveTA -n "joint9_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -8.3060833076453129;
createNode animCurveTU -n "joint9_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "joint9_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.006945390995315417;
createNode animCurveTL -n "joint9_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1.4122999436594341e-11;
createNode animCurveTL -n "joint9_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.00055329665829510863;
createNode animCurveTU -n "joint9_scaleX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "joint9_scaleY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "joint9_scaleZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode polyReduce -n "polyReduce1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".p" 50;
	setAttr ".t" no;
createNode polyReduce -n "polyReduce2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".p" 50;
	setAttr ".t" no;
createNode polyReduce -n "polyReduce3";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".p" 50;
	setAttr ".t" no;
createNode polyReduce -n "polyReduce4";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".p" 50;
	setAttr ".t" no;
createNode polyReduce -n "polyReduce5";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".p" 50;
	setAttr ".t" no;
createNode polyReduce -n "polyReduce6";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".p" 50;
	setAttr ".t" no;
select -ne :time1;
	setAttr ".o" 13;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :lightList1;
select -ne :initialShadingGroup;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 12;
	setAttr ".top" 479;
	setAttr ".rght" 639;
select -ne :hardwareRenderGlobals;
	addAttr -ci true -sn "ani" -ln "animation" -bt "ANIM" -min 0 -max 1 -at "bool";
	setAttr ".fn" -type "string" "%s.%e";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr ".hwfr" 12;
	setAttr -k on ".ani";
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
connectAttr "skinCluster1.og[0]" "pCubeShape1.i";
connectAttr "groupId2.id" "pCubeShape1.iog.og[1].gid";
connectAttr "tweakSet1.mwc" "pCubeShape1.iog.og[1].gco";
connectAttr "skinCluster1GroupId.id" "pCubeShape1.iog.og[5].gid";
connectAttr "skinCluster1Set.mwc" "pCubeShape1.iog.og[5].gco";
connectAttr "polySmoothFace4.out" "pCubeShape1Orig.i";
connectAttr "joint1_scaleX.o" "joint1.sx";
connectAttr "joint1_scaleY.o" "joint1.sy";
connectAttr "joint1_scaleZ.o" "joint1.sz";
connectAttr "joint1_rotateX.o" "joint1.rx";
connectAttr "joint1_rotateY.o" "joint1.ry";
connectAttr "joint1_rotateZ.o" "joint1.rz";
connectAttr "joint1_visibility.o" "joint1.v";
connectAttr "joint1_translateX.o" "joint1.tx";
connectAttr "joint1_translateY.o" "joint1.ty";
connectAttr "joint1_translateZ.o" "joint1.tz";
connectAttr "joint1.s" "joint2.is";
connectAttr "joint2.s" "joint3.is";
connectAttr "joint3.s" "rightArm.is";
connectAttr "rightArm.s" "joint5.is";
connectAttr "joint5.s" "joint6.is";
connectAttr "joint6.s" "joint24.is";
connectAttr "joint6.s" "joint25.is";
connectAttr "joint6.tx" "effector1.tx";
connectAttr "joint6.ty" "effector1.ty";
connectAttr "joint6.tz" "effector1.tz";
connectAttr "joint3.s" "leftArm.is";
connectAttr "leftArm.s" "joint8.is";
connectAttr "joint8.s" "joint9.is";
connectAttr "joint9_scaleX.o" "joint9.sx";
connectAttr "joint9_scaleY.o" "joint9.sy";
connectAttr "joint9_scaleZ.o" "joint9.sz";
connectAttr "joint9_translateX.o" "joint9.tx";
connectAttr "joint9_translateY.o" "joint9.ty";
connectAttr "joint9_translateZ.o" "joint9.tz";
connectAttr "joint9_rotateX.o" "joint9.rx";
connectAttr "joint9_rotateY.o" "joint9.ry";
connectAttr "joint9_rotateZ.o" "joint9.rz";
connectAttr "joint9_visibility.o" "joint9.v";
connectAttr "joint9.s" "joint26.is";
connectAttr "joint9.s" "joint27.is";
connectAttr "joint9.tx" "effector2.tx";
connectAttr "joint9.ty" "effector2.ty";
connectAttr "joint9.tz" "effector2.tz";
connectAttr "joint3.s" "head.is";
connectAttr "head.s" "joint16.is";
connectAttr "joint16.s" "joint17.is";
connectAttr "joint17.s" "joint28.is";
connectAttr "joint28_scaleX.o" "joint28.sx";
connectAttr "joint28_scaleY.o" "joint28.sy";
connectAttr "joint28_scaleZ.o" "joint28.sz";
connectAttr "joint28_translateX.o" "joint28.tx";
connectAttr "joint28_translateY.o" "joint28.ty";
connectAttr "joint28_translateZ.o" "joint28.tz";
connectAttr "joint28_visibility.o" "joint28.v";
connectAttr "joint28_rotateX.o" "joint28.rx";
connectAttr "joint28_rotateY.o" "joint28.ry";
connectAttr "joint28_rotateZ.o" "joint28.rz";
connectAttr "joint28.s" "joint29.is";
connectAttr "joint17.s" "joint30.is";
connectAttr "joint30_scaleX.o" "joint30.sx";
connectAttr "joint30_scaleY.o" "joint30.sy";
connectAttr "joint30_scaleZ.o" "joint30.sz";
connectAttr "joint30_translateX.o" "joint30.tx";
connectAttr "joint30_translateY.o" "joint30.ty";
connectAttr "joint30_translateZ.o" "joint30.tz";
connectAttr "joint30_visibility.o" "joint30.v";
connectAttr "joint30_rotateX.o" "joint30.rx";
connectAttr "joint30_rotateY.o" "joint30.ry";
connectAttr "joint30_rotateZ.o" "joint30.rz";
connectAttr "joint30.s" "joint31.is";
connectAttr "pasted__layer2.di" "pasted__pSphere1.do";
connectAttr "polyReduce6.out" "pasted__pSphereShape1.i";
connectAttr "pasted__layer2.di" "pasted__pSphereShape1.do";
connectAttr "layer1.di" "pSphere1.do";
connectAttr "polyReduce5.out" "pSphereShape1.i";
connectAttr "layer1.di" "pSphereShape1.do";
connectAttr "joint1.s" "tale.is";
connectAttr "tale.s" "joint11.is";
connectAttr "joint11.s" "joint12.is";
connectAttr "joint12.s" "joint13.is";
connectAttr "joint13.s" "joint14.is";
connectAttr "joint14.tx" "effector3.tx";
connectAttr "joint14.ty" "effector3.ty";
connectAttr "joint14.tz" "effector3.tz";
connectAttr "rightArm.msg" "ikHandle1.hsj";
connectAttr "effector1.hp" "ikHandle1.hee";
connectAttr "ikSCsolver.msg" "ikHandle1.hsv";
connectAttr "ikHandle1_translateX.o" "ikHandle1.tx";
connectAttr "ikHandle1_translateY.o" "ikHandle1.ty";
connectAttr "ikHandle1_translateZ.o" "ikHandle1.tz";
connectAttr "ikHandle1_visibility.o" "ikHandle1.v";
connectAttr "ikHandle1_rotateX.o" "ikHandle1.rx";
connectAttr "ikHandle1_rotateY.o" "ikHandle1.ry";
connectAttr "ikHandle1_rotateZ.o" "ikHandle1.rz";
connectAttr "ikHandle1_scaleX.o" "ikHandle1.sx";
connectAttr "ikHandle1_scaleY.o" "ikHandle1.sy";
connectAttr "ikHandle1_scaleZ.o" "ikHandle1.sz";
connectAttr "ikHandle1_poleVectorX.o" "ikHandle1.pvx";
connectAttr "ikHandle1_poleVectorY.o" "ikHandle1.pvy";
connectAttr "ikHandle1_poleVectorZ.o" "ikHandle1.pvz";
connectAttr "ikHandle1_offset.o" "ikHandle1.off";
connectAttr "ikHandle1_roll.o" "ikHandle1.rol";
connectAttr "ikHandle1_twist.o" "ikHandle1.twi";
connectAttr "ikHandle1_ikBlend.o" "ikHandle1.ikb";
connectAttr "leftArm.msg" "ikHandle2.hsj";
connectAttr "effector2.hp" "ikHandle2.hee";
connectAttr "ikSCsolver.msg" "ikHandle2.hsv";
connectAttr "ikHandle2_translateX.o" "ikHandle2.tx";
connectAttr "ikHandle2_translateY.o" "ikHandle2.ty";
connectAttr "ikHandle2_translateZ.o" "ikHandle2.tz";
connectAttr "ikHandle2_visibility.o" "ikHandle2.v";
connectAttr "ikHandle2_rotateX.o" "ikHandle2.rx";
connectAttr "ikHandle2_rotateY.o" "ikHandle2.ry";
connectAttr "ikHandle2_rotateZ.o" "ikHandle2.rz";
connectAttr "ikHandle2_scaleX.o" "ikHandle2.sx";
connectAttr "ikHandle2_scaleY.o" "ikHandle2.sy";
connectAttr "ikHandle2_scaleZ.o" "ikHandle2.sz";
connectAttr "ikHandle2_poleVectorX.o" "ikHandle2.pvx";
connectAttr "ikHandle2_poleVectorY.o" "ikHandle2.pvy";
connectAttr "ikHandle2_poleVectorZ.o" "ikHandle2.pvz";
connectAttr "ikHandle2_offset.o" "ikHandle2.off";
connectAttr "ikHandle2_roll.o" "ikHandle2.rol";
connectAttr "ikHandle2_twist.o" "ikHandle2.twi";
connectAttr "ikHandle2_ikBlend.o" "ikHandle2.ikb";
connectAttr "tale.msg" "ikHandle3.hsj";
connectAttr "effector3.hp" "ikHandle3.hee";
connectAttr "ikSCsolver.msg" "ikHandle3.hsv";
connectAttr "ikHandle3_translateX.o" "ikHandle3.tx";
connectAttr "ikHandle3_translateY.o" "ikHandle3.ty";
connectAttr "ikHandle3_translateZ.o" "ikHandle3.tz";
connectAttr "ikHandle3_visibility.o" "ikHandle3.v";
connectAttr "ikHandle3_rotateX.o" "ikHandle3.rx";
connectAttr "ikHandle3_rotateY.o" "ikHandle3.ry";
connectAttr "ikHandle3_rotateZ.o" "ikHandle3.rz";
connectAttr "ikHandle3_scaleX.o" "ikHandle3.sx";
connectAttr "ikHandle3_scaleY.o" "ikHandle3.sy";
connectAttr "ikHandle3_scaleZ.o" "ikHandle3.sz";
connectAttr "ikHandle3_poleVectorX.o" "ikHandle3.pvx";
connectAttr "ikHandle3_poleVectorY.o" "ikHandle3.pvy";
connectAttr "ikHandle3_poleVectorZ.o" "ikHandle3.pvz";
connectAttr "ikHandle3_offset.o" "ikHandle3.off";
connectAttr "ikHandle3_roll.o" "ikHandle3.rol";
connectAttr "ikHandle3_twist.o" "ikHandle3.twi";
connectAttr "ikHandle3_ikBlend.o" "ikHandle3.ikb";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyCube1.out" "polySmoothFace1.ip";
connectAttr "polySmoothFace1.out" "polyTweak1.ip";
connectAttr "polyTweak1.out" "deleteComponent1.ig";
connectAttr "polyTweak2.out" "polySmoothFace2.ip";
connectAttr "deleteComponent1.og" "polyTweak2.ip";
connectAttr "polyTweak3.out" "polyExtrudeFace1.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace1.mp";
connectAttr "polySmoothFace2.out" "polyTweak3.ip";
connectAttr "polyExtrudeFace1.out" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "deleteComponent6.ig";
connectAttr "polyTweak4.out" "polyMergeVert1.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert1.mp";
connectAttr "deleteComponent6.og" "polyTweak4.ip";
connectAttr "polyMergeVert1.out" "polyMergeVert2.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert2.mp";
connectAttr "polyMergeVert2.out" "polyMergeVert3.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert3.mp";
connectAttr "polyMergeVert3.out" "polyMergeVert4.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert4.mp";
connectAttr "polyMergeVert4.out" "polyMergeVert5.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert5.mp";
connectAttr "polyMergeVert5.out" "polyMergeVert6.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert6.mp";
connectAttr "polyMergeVert6.out" "deleteComponent7.ig";
connectAttr "polyTweak5.out" "polyMergeEdge1.ip";
connectAttr "deleteComponent7.og" "polyTweak5.ip";
connectAttr "polyMergeEdge1.out" "polyMergeEdge2.ip";
connectAttr "polyTweak6.out" "polyExtrudeFace2.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace2.mp";
connectAttr "polyMergeEdge2.out" "polyTweak6.ip";
connectAttr "polyExtrudeFace2.out" "deleteComponent8.ig";
connectAttr "deleteComponent8.og" "deleteComponent9.ig";
connectAttr "deleteComponent9.og" "deleteComponent10.ig";
connectAttr "deleteComponent10.og" "deleteComponent11.ig";
connectAttr "polyTweak7.out" "polyMergeVert7.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert7.mp";
connectAttr "deleteComponent11.og" "polyTweak7.ip";
connectAttr "polyMergeVert7.out" "polyMergeVert8.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert8.mp";
connectAttr "polyMergeVert8.out" "polyMergeVert9.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert9.mp";
connectAttr "polyMergeVert9.out" "polyMergeVert10.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert10.mp";
connectAttr "polyTweak8.out" "polySplit1.ip";
connectAttr "polyMergeVert10.out" "polyTweak8.ip";
connectAttr "polyTweak9.out" "polyMergeVert11.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert11.mp";
connectAttr "polySplit1.out" "polyTweak9.ip";
connectAttr "polyTweak10.out" "polySplit2.ip";
connectAttr "polyMergeVert11.out" "polyTweak10.ip";
connectAttr "polySplit2.out" "deleteComponent12.ig";
connectAttr "deleteComponent12.og" "deleteComponent13.ig";
connectAttr "deleteComponent13.og" "polyExtrudeFace3.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace3.mp";
connectAttr "polyExtrudeFace3.out" "deleteComponent14.ig";
connectAttr "deleteComponent14.og" "polyTweak11.ip";
connectAttr "polyTweak11.out" "deleteComponent15.ig";
connectAttr "polyTweak12.out" "polyMergeVert12.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert12.mp";
connectAttr "deleteComponent15.og" "polyTweak12.ip";
connectAttr "polyMergeVert12.out" "polyMergeVert13.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert13.mp";
connectAttr "polyMergeVert13.out" "polyMergeVert14.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert14.mp";
connectAttr "polyMergeVert14.out" "polyMergeVert15.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert15.mp";
connectAttr "polyTweak13.out" "polyExtrudeFace4.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace4.mp";
connectAttr "polyMergeVert15.out" "polyTweak13.ip";
connectAttr "layerManager.dli[1]" "layer1.id";
connectAttr "layerManager.dli[2]" "pasted__layer1.id";
connectAttr "layerManager.dli[3]" "pasted__layer2.id";
connectAttr "layerManager.dli[4]" "pasted__pasted__layer1.id";
connectAttr "polyTweak14.out" "polySplit3.ip";
connectAttr "polyExtrudeFace4.out" "polyTweak14.ip";
connectAttr "polySplit3.out" "polyExtrudeFace5.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace5.mp";
connectAttr "polyExtrudeFace5.out" "deleteComponent16.ig";
connectAttr "deleteComponent16.og" "polyTweak15.ip";
connectAttr "polyTweak15.out" "deleteComponent17.ig";
connectAttr "polyTweak16.out" "polyMergeVert16.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert16.mp";
connectAttr "deleteComponent17.og" "polyTweak16.ip";
connectAttr "polyMergeVert16.out" "polyMergeVert17.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert17.mp";
connectAttr "polyMergeVert17.out" "deleteComponent18.ig";
connectAttr "deleteComponent18.og" "polyMergeVert18.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert18.mp";
connectAttr "polyMergeVert18.out" "polyMergeVert19.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert19.mp";
connectAttr "polyTweak17.out" "polyExtrudeFace6.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace6.mp";
connectAttr "polyMergeVert19.out" "polyTweak17.ip";
connectAttr "polyExtrudeFace6.out" "deleteComponent19.ig";
connectAttr "deleteComponent19.og" "deleteComponent20.ig";
connectAttr "deleteComponent20.og" "deleteComponent21.ig";
connectAttr "deleteComponent21.og" "deleteComponent22.ig";
connectAttr "deleteComponent22.og" "deleteComponent23.ig";
connectAttr "polyTweak18.out" "polyMergeVert20.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert20.mp";
connectAttr "deleteComponent23.og" "polyTweak18.ip";
connectAttr "polyMergeVert20.out" "polyMergeVert21.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert21.mp";
connectAttr "polyMergeVert21.out" "polyMergeVert22.ip";
connectAttr "polyMergeVert22.out" "polyMergeVert23.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert23.mp";
connectAttr "polyMergeVert23.out" "polyMergeVert24.ip";
connectAttr "polyTweak19.out" "polyMergeVert25.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert25.mp";
connectAttr "polyMergeVert24.out" "polyTweak19.ip";
connectAttr "polyMergeVert25.out" "polyMergeVert26.ip";
connectAttr "polyTweak20.out" "polyAppend1.ip";
connectAttr "polyMergeVert26.out" "polyTweak20.ip";
connectAttr "polyTweak21.out" "polyAppend2.ip";
connectAttr "polyAppend1.out" "polyTweak21.ip";
connectAttr "polyAppend2.out" "polyAppend3.ip";
connectAttr "polyTweak22.out" "polySplit4.ip";
connectAttr "polyAppend3.out" "polyTweak22.ip";
connectAttr "polySplit4.out" "polySplit5.ip";
connectAttr "polySplit5.out" "polyExtrudeFace7.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace7.mp";
connectAttr "polyExtrudeFace7.out" "polyExtrudeFace8.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace8.mp";
connectAttr "polyExtrudeFace8.out" "polyExtrudeFace9.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace9.mp";
connectAttr "polyExtrudeFace9.out" "polyExtrudeFace10.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace10.mp";
connectAttr "polyExtrudeFace10.out" "polyExtrudeFace11.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace11.mp";
connectAttr "polyExtrudeFace11.out" "polyExtrudeFace12.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace12.mp";
connectAttr "polyTweak23.out" "polySplit6.ip";
connectAttr "polyExtrudeFace12.out" "polyTweak23.ip";
connectAttr "polySplit6.out" "polyExtrudeFace13.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace13.mp";
connectAttr "polyExtrudeFace13.out" "polyExtrudeFace14.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace14.mp";
connectAttr "polyExtrudeFace14.out" "polyExtrudeFace15.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace15.mp";
connectAttr "polyExtrudeFace15.out" "polyExtrudeFace16.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace16.mp";
connectAttr "polyExtrudeFace16.out" "polyExtrudeFace17.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace17.mp";
connectAttr "polyExtrudeFace17.out" "polyExtrudeFace18.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace18.mp";
connectAttr "polyExtrudeFace18.out" "polySplit7.ip";
connectAttr "polySplit7.out" "polySplit8.ip";
connectAttr "polyTweak24.out" "polyExtrudeFace19.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace19.mp";
connectAttr "polySplit8.out" "polyTweak24.ip";
connectAttr "polyExtrudeFace19.out" "polyExtrudeFace20.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace20.mp";
connectAttr "polyExtrudeFace20.out" "polyExtrudeFace21.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace21.mp";
connectAttr "polyExtrudeFace21.out" "polyExtrudeFace22.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace22.mp";
connectAttr "polyExtrudeFace22.out" "polyExtrudeFace23.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace23.mp";
connectAttr "polyExtrudeFace23.out" "polyExtrudeFace24.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace24.mp";
connectAttr "polyTweak25.out" "polyExtrudeFace25.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace25.mp";
connectAttr "polyExtrudeFace24.out" "polyTweak25.ip";
connectAttr "polyExtrudeFace25.out" "deleteComponent24.ig";
connectAttr "deleteComponent24.og" "deleteComponent25.ig";
connectAttr "deleteComponent25.og" "deleteComponent26.ig";
connectAttr "deleteComponent26.og" "deleteComponent27.ig";
connectAttr "deleteComponent27.og" "deleteComponent28.ig";
connectAttr "deleteComponent28.og" "deleteComponent29.ig";
connectAttr "deleteComponent29.og" "deleteComponent30.ig";
connectAttr "deleteComponent30.og" "deleteComponent31.ig";
connectAttr "deleteComponent31.og" "deleteComponent32.ig";
connectAttr "deleteComponent32.og" "deleteComponent33.ig";
connectAttr "deleteComponent33.og" "deleteComponent34.ig";
connectAttr "polyTweak26.out" "polyMergeVert27.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert27.mp";
connectAttr "deleteComponent34.og" "polyTweak26.ip";
connectAttr "polyMergeVert27.out" "polyMergeVert28.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert28.mp";
connectAttr "polyMergeVert28.out" "polyMergeVert29.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert29.mp";
connectAttr "polyMergeVert29.out" "polyMergeVert30.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert30.mp";
connectAttr "polyMergeVert30.out" "polyMergeVert31.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert31.mp";
connectAttr "polyMergeVert31.out" "polyMergeVert32.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert32.mp";
connectAttr "polyMergeVert32.out" "polyMergeVert33.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert33.mp";
connectAttr "polyMergeVert33.out" "polyMergeVert34.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert34.mp";
connectAttr "polyMergeVert34.out" "polyMergeVert35.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert35.mp";
connectAttr "polyMergeVert35.out" "polyMergeVert36.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert36.mp";
connectAttr "polyMergeVert36.out" "polyMergeVert37.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert37.mp";
connectAttr "polyMergeVert37.out" "polyMergeVert38.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert38.mp";
connectAttr "polyTweak27.out" "polySplit9.ip";
connectAttr "polyMergeVert38.out" "polyTweak27.ip";
connectAttr "polyTweak28.out" "polySplit10.ip";
connectAttr "polySplit9.out" "polyTweak28.ip";
connectAttr "polySplit10.out" "polyExtrudeFace26.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace26.mp";
connectAttr "polyExtrudeFace26.out" "polyExtrudeFace27.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace27.mp";
connectAttr "polyExtrudeFace27.out" "polyExtrudeFace28.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace28.mp";
connectAttr "polyExtrudeFace28.out" "polyExtrudeFace29.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace29.mp";
connectAttr "polyExtrudeFace29.out" "polyExtrudeFace30.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace30.mp";
connectAttr "polyExtrudeFace30.out" "polySplit11.ip";
connectAttr "polySplit11.out" "polyExtrudeFace31.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace31.mp";
connectAttr "polyExtrudeFace31.out" "polyExtrudeFace32.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace32.mp";
connectAttr "polyExtrudeFace32.out" "polyExtrudeFace33.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace33.mp";
connectAttr "polyExtrudeFace33.out" "polyExtrudeFace34.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace34.mp";
connectAttr "polyTweak29.out" "polySplit12.ip";
connectAttr "polyExtrudeFace34.out" "polyTweak29.ip";
connectAttr "polySplit12.out" "polySplit13.ip";
connectAttr "polySplit13.out" "polyExtrudeFace35.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace35.mp";
connectAttr "polyExtrudeFace35.out" "deleteComponent35.ig";
connectAttr "deleteComponent35.og" "deleteComponent36.ig";
connectAttr "deleteComponent36.og" "deleteComponent37.ig";
connectAttr "deleteComponent37.og" "polyMergeVert39.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert39.mp";
connectAttr "polyMergeVert39.out" "polyMergeVert40.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert40.mp";
connectAttr "polyTweak30.out" "polyMergeVert41.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert41.mp";
connectAttr "polyMergeVert40.out" "polyTweak30.ip";
connectAttr "polyTweak31.out" "polySplit14.ip";
connectAttr "polyMergeVert41.out" "polyTweak31.ip";
connectAttr "polySplit14.out" "polyExtrudeFace36.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace36.mp";
connectAttr "polyExtrudeFace36.out" "deleteComponent38.ig";
connectAttr "deleteComponent38.og" "polySplit15.ip";
connectAttr "polySplit15.out" "polyExtrudeFace37.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace37.mp";
connectAttr "polyExtrudeFace37.out" "polySplit16.ip";
connectAttr "polySplit16.out" "polyExtrudeFace38.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace38.mp";
connectAttr "polyExtrudeFace38.out" "polySplit17.ip";
connectAttr "polySplit17.out" "polyMergeVert42.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert42.mp";
connectAttr "polyMergeVert42.out" "polySplit18.ip";
connectAttr "polySplit18.out" "polySplit19.ip";
connectAttr "polySplit19.out" "polyMergeVert43.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert43.mp";
connectAttr "polyMergeVert43.out" "polySplit20.ip";
connectAttr "polyTweak32.out" "polySplit21.ip";
connectAttr "polySplit20.out" "polyTweak32.ip";
connectAttr "polySplit21.out" "polyMergeVert44.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert44.mp";
connectAttr "polyMergeVert44.out" "polySplit22.ip";
connectAttr "polySplit22.out" "polyMergeVert45.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert45.mp";
connectAttr "polyTweak33.out" "polySplit23.ip";
connectAttr "polyMergeVert45.out" "polyTweak33.ip";
connectAttr "polyTweak34.out" "polySplit24.ip";
connectAttr "polySplit23.out" "polyTweak34.ip";
connectAttr "polySplit24.out" "polyCut1.ip";
connectAttr "pCubeShape1.wm" "polyCut1.mp";
connectAttr "polyCut1.out" "polyCut2.ip";
connectAttr "pCubeShape1.wm" "polyCut2.mp";
connectAttr "polyCut2.out" "polyCut3.ip";
connectAttr "pCubeShape1.wm" "polyCut3.mp";
connectAttr "polyTweak35.out" "polyCut4.ip";
connectAttr "pCubeShape1.wm" "polyCut4.mp";
connectAttr "polyCut3.out" "polyTweak35.ip";
connectAttr "polyCut4.out" "polyCut5.ip";
connectAttr "pCubeShape1.wm" "polyCut5.mp";
connectAttr "polyCut5.out" "polyCut6.ip";
connectAttr "pCubeShape1.wm" "polyCut6.mp";
connectAttr "polyCut6.out" "polyTweak36.ip";
connectAttr "polyTweak36.out" "deleteComponent39.ig";
connectAttr "deleteComponent39.og" "deleteComponent40.ig";
connectAttr "deleteComponent40.og" "polyMergeVert46.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert46.mp";
connectAttr "polyMergeVert46.out" "polyMergeVert47.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert47.mp";
connectAttr "polyMergeVert47.out" "polyMergeVert48.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert48.mp";
connectAttr "polyMergeVert48.out" "polyMergeVert49.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert49.mp";
connectAttr "polyMergeVert49.out" "polyMergeVert50.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert50.mp";
connectAttr "polyMergeVert50.out" "polyMergeVert51.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert51.mp";
connectAttr "polyMergeVert51.out" "deleteComponent41.ig";
connectAttr "polyTweak37.out" "polySmoothFace3.ip";
connectAttr "deleteComponent41.og" "polyTweak37.ip";
connectAttr "polySmoothFace3.out" "polySmoothFace4.ip";
connectAttr "groupParts2.og" "tweak1.ip[0].ig";
connectAttr "groupId2.id" "tweak1.ip[0].gi";
connectAttr "groupId2.msg" "tweakSet1.gn" -na;
connectAttr "pCubeShape1.iog.og[1]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "pCubeShape1Orig.w" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "polyTweak38.out" "polyChipOff1.ip";
connectAttr "pCubeShape1.wm" "polyChipOff1.mp";
connectAttr "tweak1.og[0]" "polyTweak38.ip";
connectAttr "polyChipOff1.out" "polyMergeVert52.ip";
connectAttr "pCubeShape1.wm" "polyMergeVert52.mp";
connectAttr "polyMergeVert52.out" "polyNormal1.ip";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "joint1.wm" "skinCluster1.ma[0]";
connectAttr "joint2.wm" "skinCluster1.ma[1]";
connectAttr "joint3.wm" "skinCluster1.ma[2]";
connectAttr "rightArm.wm" "skinCluster1.ma[3]";
connectAttr "joint5.wm" "skinCluster1.ma[4]";
connectAttr "joint6.wm" "skinCluster1.ma[5]";
connectAttr "joint24.wm" "skinCluster1.ma[6]";
connectAttr "joint25.wm" "skinCluster1.ma[7]";
connectAttr "leftArm.wm" "skinCluster1.ma[8]";
connectAttr "joint8.wm" "skinCluster1.ma[9]";
connectAttr "joint9.wm" "skinCluster1.ma[10]";
connectAttr "joint26.wm" "skinCluster1.ma[11]";
connectAttr "joint27.wm" "skinCluster1.ma[12]";
connectAttr "head.wm" "skinCluster1.ma[13]";
connectAttr "joint16.wm" "skinCluster1.ma[14]";
connectAttr "joint17.wm" "skinCluster1.ma[15]";
connectAttr "joint28.wm" "skinCluster1.ma[16]";
connectAttr "joint29.wm" "skinCluster1.ma[17]";
connectAttr "joint30.wm" "skinCluster1.ma[18]";
connectAttr "joint31.wm" "skinCluster1.ma[19]";
connectAttr "tale.wm" "skinCluster1.ma[20]";
connectAttr "joint11.wm" "skinCluster1.ma[21]";
connectAttr "joint12.wm" "skinCluster1.ma[22]";
connectAttr "joint13.wm" "skinCluster1.ma[23]";
connectAttr "joint14.wm" "skinCluster1.ma[24]";
connectAttr "joint1.liw" "skinCluster1.lw[0]";
connectAttr "joint2.liw" "skinCluster1.lw[1]";
connectAttr "joint3.liw" "skinCluster1.lw[2]";
connectAttr "rightArm.liw" "skinCluster1.lw[3]";
connectAttr "joint5.liw" "skinCluster1.lw[4]";
connectAttr "joint6.liw" "skinCluster1.lw[5]";
connectAttr "joint24.liw" "skinCluster1.lw[6]";
connectAttr "joint25.liw" "skinCluster1.lw[7]";
connectAttr "leftArm.liw" "skinCluster1.lw[8]";
connectAttr "joint8.liw" "skinCluster1.lw[9]";
connectAttr "joint9.liw" "skinCluster1.lw[10]";
connectAttr "joint26.liw" "skinCluster1.lw[11]";
connectAttr "joint27.liw" "skinCluster1.lw[12]";
connectAttr "head.liw" "skinCluster1.lw[13]";
connectAttr "joint16.liw" "skinCluster1.lw[14]";
connectAttr "joint17.liw" "skinCluster1.lw[15]";
connectAttr "joint28.liw" "skinCluster1.lw[16]";
connectAttr "joint29.liw" "skinCluster1.lw[17]";
connectAttr "joint30.liw" "skinCluster1.lw[18]";
connectAttr "joint31.liw" "skinCluster1.lw[19]";
connectAttr "tale.liw" "skinCluster1.lw[20]";
connectAttr "joint11.liw" "skinCluster1.lw[21]";
connectAttr "joint12.liw" "skinCluster1.lw[22]";
connectAttr "joint13.liw" "skinCluster1.lw[23]";
connectAttr "joint14.liw" "skinCluster1.lw[24]";
connectAttr "joint28.msg" "skinCluster1.ptt";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "pCubeShape1.iog.og[5]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "polyNormal1.out" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "joint1.msg" "bindPose1.m[0]";
connectAttr "joint2.msg" "bindPose1.m[1]";
connectAttr "joint3.msg" "bindPose1.m[2]";
connectAttr "rightArm.msg" "bindPose1.m[3]";
connectAttr "joint5.msg" "bindPose1.m[4]";
connectAttr "joint6.msg" "bindPose1.m[5]";
connectAttr "joint24.msg" "bindPose1.m[6]";
connectAttr "joint25.msg" "bindPose1.m[7]";
connectAttr "leftArm.msg" "bindPose1.m[8]";
connectAttr "joint8.msg" "bindPose1.m[9]";
connectAttr "joint9.msg" "bindPose1.m[10]";
connectAttr "joint26.msg" "bindPose1.m[11]";
connectAttr "joint27.msg" "bindPose1.m[12]";
connectAttr "head.msg" "bindPose1.m[13]";
connectAttr "joint16.msg" "bindPose1.m[14]";
connectAttr "joint17.msg" "bindPose1.m[15]";
connectAttr "joint28.msg" "bindPose1.m[16]";
connectAttr "joint29.msg" "bindPose1.m[17]";
connectAttr "joint30.msg" "bindPose1.m[18]";
connectAttr "joint31.msg" "bindPose1.m[19]";
connectAttr "tale.msg" "bindPose1.m[20]";
connectAttr "joint11.msg" "bindPose1.m[21]";
connectAttr "joint12.msg" "bindPose1.m[22]";
connectAttr "joint13.msg" "bindPose1.m[23]";
connectAttr "joint14.msg" "bindPose1.m[24]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[5]" "bindPose1.p[6]";
connectAttr "bindPose1.m[5]" "bindPose1.p[7]";
connectAttr "bindPose1.m[2]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[9]" "bindPose1.p[10]";
connectAttr "bindPose1.m[10]" "bindPose1.p[11]";
connectAttr "bindPose1.m[10]" "bindPose1.p[12]";
connectAttr "bindPose1.m[2]" "bindPose1.p[13]";
connectAttr "bindPose1.m[13]" "bindPose1.p[14]";
connectAttr "bindPose1.m[14]" "bindPose1.p[15]";
connectAttr "bindPose1.m[15]" "bindPose1.p[16]";
connectAttr "bindPose1.m[16]" "bindPose1.p[17]";
connectAttr "bindPose1.m[15]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "bindPose1.m[0]" "bindPose1.p[20]";
connectAttr "bindPose1.m[20]" "bindPose1.p[21]";
connectAttr "bindPose1.m[21]" "bindPose1.p[22]";
connectAttr "bindPose1.m[22]" "bindPose1.p[23]";
connectAttr "bindPose1.m[23]" "bindPose1.p[24]";
connectAttr "joint1.bps" "bindPose1.wm[0]";
connectAttr "joint2.bps" "bindPose1.wm[1]";
connectAttr "joint3.bps" "bindPose1.wm[2]";
connectAttr "rightArm.bps" "bindPose1.wm[3]";
connectAttr "joint5.bps" "bindPose1.wm[4]";
connectAttr "joint6.bps" "bindPose1.wm[5]";
connectAttr "joint24.bps" "bindPose1.wm[6]";
connectAttr "joint25.bps" "bindPose1.wm[7]";
connectAttr "leftArm.bps" "bindPose1.wm[8]";
connectAttr "joint8.bps" "bindPose1.wm[9]";
connectAttr "joint9.bps" "bindPose1.wm[10]";
connectAttr "joint26.bps" "bindPose1.wm[11]";
connectAttr "joint27.bps" "bindPose1.wm[12]";
connectAttr "head.bps" "bindPose1.wm[13]";
connectAttr "joint16.bps" "bindPose1.wm[14]";
connectAttr "joint17.bps" "bindPose1.wm[15]";
connectAttr "joint28.bps" "bindPose1.wm[16]";
connectAttr "joint29.bps" "bindPose1.wm[17]";
connectAttr "joint30.bps" "bindPose1.wm[18]";
connectAttr "joint31.bps" "bindPose1.wm[19]";
connectAttr "tale.bps" "bindPose1.wm[20]";
connectAttr "joint11.bps" "bindPose1.wm[21]";
connectAttr "joint12.bps" "bindPose1.wm[22]";
connectAttr "joint13.bps" "bindPose1.wm[23]";
connectAttr "joint14.bps" "bindPose1.wm[24]";
connectAttr "polySphere1.out" "polyReduce1.ip";
connectAttr "pasted__polySphere2.out" "polyReduce2.ip";
connectAttr "polyReduce1.out" "polyReduce3.ip";
connectAttr "polyReduce2.out" "polyReduce4.ip";
connectAttr "polyReduce3.out" "polyReduce5.ip";
connectAttr "polyReduce4.out" "polyReduce6.ip";
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pasted__pSphereShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1Orig.iog" ":initialShadingGroup.dsm" -na;
connectAttr "ikSCsolver.msg" ":ikSystem.sol" -na;
// End of fish-walk.ma
