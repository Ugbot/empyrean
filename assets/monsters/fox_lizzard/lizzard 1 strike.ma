//Maya ASCII 5.0 scene
//Name: lizzard 1 strike.ma
//Last modified: Tue, Nov 09, 2004 11:18:24 PM
requires maya "5.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya Unlimited 5.0";
fileInfo "version" "5.0";
fileInfo "cutIdentifier" "200304010010";
fileInfo "osv" "Microsoft Windows XP Professional Service Pack 2 (Build 2600)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -4.7228827447146885e-014 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.821869662029947;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "group2";
	setAttr ".rp" -type "double3" 0 3.0186443081089012 0 ;
	setAttr ".sp" -type "double3" 0 3.0186443081089012 0 ;
createNode ikHandle -n "LL_IK";
	setAttr -l on ".v";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 13.295666779024989 9.1172123378399164 -27.79479940764886 ;
	setAttr ".sp" -type "double3" 13.295666779024989 9.1172123378399164 -27.79479940764886 ;
	setAttr ".pv" -type "double3" 0.59337110218669553 -0.033684444157057791 
		1.1092099230134826 ;
	setAttr -l on ".pvx";
	setAttr -l on ".pvy";
	setAttr -l on ".pvz";
	setAttr -l on ".off";
	setAttr -l on ".rol";
	setAttr ".roc" yes;
	setAttr -l on ".ikb";
createNode ikHandle -n "RL_IK";
	setAttr -l on ".v";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -13.295699999999989 9.1172119103681908 -27.794800000000002 ;
	setAttr ".sp" -type "double3" -13.295699999999989 9.1172119103681908 -27.794800000000002 ;
	setAttr ".pv" -type "double3" -0.59337109614312877 -0.03368304362474539 
		1.1092099687769101 ;
	setAttr -l on ".pvx";
	setAttr -l on ".pvy";
	setAttr -l on ".pvz";
	setAttr -l on ".off";
	setAttr -l on ".rol";
	setAttr ".roc" yes;
	setAttr -l on ".ikb";
createNode transform -n "Lizzard";
	setAttr ".t" -type "double3" -0.0012466999999999999 -0.031956 0.020985 ;
createNode joint -n "Master" -p "Lizzard";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000057 -8.4431909291766143 90 ;
	setAttr ".bps" -type "matrix" 1.1102230246251565e-016 0.98916193101477901 0.14682872413500592 0
		 8.3266726846886741e-016 -0.14682872413500592 0.98916193101477901 0 1 0 -8.8817841970012523e-016 0
		 0 73.550347192516043 -27.628789241941231 1;
createNode joint -n "Tail1" -p "Master";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -3.5916627334603399 -8.3638648434063469 4.7106299555526237e-015 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -5.8553717739113722 4.5492689160975521 -49.806793319125489 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -101.496073443969 ;
	setAttr ".bps" -type "matrix" -8.3808943317795187e-016 -0.053257642916150011 -0.99858080467782662 0
		 -5.7156221174449204e-017 0.99858080467782662 -0.053257642916150011 0 1 0 -8.8817841970012523e-016 0
		 -2.6524412037869102e-015 71.22566675132758 -36.429365197868904 1;
createNode joint -n "Tail2" -p "Tail1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 24.942688988840082 -1.7763568394002505e-015 
		3.944304526105059e-030 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -2.65285286847348e-028 -4.9124629262704518e-027 
		20.758245585777924 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 3.052882514792373 ;
	setAttr ".bps" -type "matrix" -8.3994402619256813e-016 -2.5673907444456745e-016 -1 0
		 -1.2440437568735608e-017 1 -2.5673907444456745e-016 0 1 0 -8.8817841970012523e-016 0
		 -2.3556645280377834e-014 69.89727792779135 -61.3366556391736 1;
createNode joint -n "Tail3" -p "Tail2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 16.770908897145148 1.7763568394002505e-015 
		1.2621774483536189e-029 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -2.628275192862798e-028 -8.0280673452533186e-027 
		17.492540283342411 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -8.3994402619256813e-016 -2.5673907444456745e-016 -1 0
		 -1.2440437568735608e-017 1 -2.5673907444456745e-016 0 1 0 -8.8817841970012523e-016 0
		 -3.764327002235468e-014 69.89727792779135 -78.107564536318748 1;
createNode joint -n "Tail4" -p "Tail3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 16.770908897145134 5.3290705182007514e-015 
		-1.5777218104420236e-030 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -3.6240282711550506e-028 -1.141468594920715e-026 
		14.226834980906826 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 0.49821161261371566 ;
	setAttr ".bps" -type "matrix" -8.4002044570386904e-016 0.0086953234344408093 -0.9999621949605747 0
		 -5.1363822829318363e-018 0.9999621949605747 0.0086953234344408093 0 1 0 -8.8817841970012523e-016 0
		 -5.1729894764331526e-014 69.89727792779135 -94.878473433463881 1;
createNode joint -n "Tail5" -p "Tail4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 19.096311275134205 -7.1054273576010019e-015 
		2.0194839173657902e-028 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -2.7990589095656248e-028 7.471221604723969e-012 
		-7.3074197856471121 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999994142 0 -0.047073065826527712 ;
	setAttr ".bps" -type "matrix" -8.4001594225122259e-016 0.0078737716644030845 -0.99996900137943123 0
		 1.0224216482346858e-012 -0.99996900137943134 -0.0078737716644030863 0 -1 -1.0223841282301056e-012 -7.162090306519251e-015 0
		 -6.7771186672969374e-014 70.063326530733406 -113.97406277179745 1;
createNode joint -n "Tail6E" -p "Tail5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 21.088826298162637 2.7295980809764163e-024 
		-8.0779356694631609e-028 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.0195835743237771e-015 179.99999999994199 
		82.007947617610483 ;
	setAttr ".bps" -type "matrix" 2.71412191019994e-016 0.98916193101477889 0.14682872413500703 0
		 1.429850050339618e-013 -0.14682872413500714 0.98916193101477878 0 1 2.0713394815034602e-014 -1.4152340918478121e-013 0
		 -8.5486136966792015e-014 70.229375133675404 -135.06223534543543 1;
createNode ikEffector -n "effector6" -p "Tail5";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "LLHip" -p "Master";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -1.0329719544250071 4.3500309633549117 8.8637778526833024 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -10.280679284940637 -9.5257679609448758 21.039084148922093 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 148.12811626207801 ;
	setAttr ".bps" -type "matrix" 0.020791374890708609 -0.9162788975028423 0.40000087590045297 0
		 -0.040159256484371082 -0.40052985967518095 -0.91540322570286048 0 0.9989769531119207 0.002968753872492731 -0.045124645723463065 0
		 8.863777852683306 71.88986116309573 -23.477574168390483 1;
createNode joint -n "LLKnee" -p "LLHip";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 30.702328837307075 3.2210250272565379 7.3702689416519389 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 0.95386367014796047 3.619954296548733 7.7127865294305149 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 50.215819538516847 ;
	setAttr ".bps" -type "matrix" -0.017556508113839589 -0.89411583151735963 -0.44749150701758494 0
		 -0.041675152277326544 0.44782593343266741 -0.89314898814689436 0 0.99897695203919012 0.0029686992404996089 -0.045124673065952872 0
		 16.735496322292271 42.489728957562818 -14.477733216182884 1;
createNode joint -n "LLAnkleUpper" -p "LLKnee";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 37.040681973710264 -3.4996748058453737 -2.9383800414811576 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999909 0 -1.7702332516713264 ;
	setAttr ".bps" -type "matrix" -0.016260721892251997 -0.90752311699740829 -0.41968724193004853 0
		 0.04219760915065153 -0.41999164151221818 0.9065464041304454 0 -0.99897695203919079 -0.0029686992404928431 0.045124673065938266 0
		 13.295666831361768 7.7951004914328621 -27.794799363158251 1;
createNode joint -n "LLAnkleLower" -p "LLAnkleUpper";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 2.3272092599796776 0.90296612392917253 -0.2110423298257996 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 97.463348651760242 ;
	setAttr ".bps" -type "matrix" 0.043952254419547171 -0.29855358850163999 0.95338027781375501 0
		 0.0106418337671526 0.9543882551758549 0.29837863488604455 0 -0.99897695203919079 -0.0029686992404928431 0.045124673065938266 0
		 13.506754163774634 5.3044925864962007 -27.962441922310056 1;
createNode joint -n "LLOutsidetwoRoot" -p "LLAnkleLower";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 15.628881150352722 -0.45507411964633021 -0.7386481543902379 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -0.0060582093670962624 0.39283217740505283 
		50.835542098406847 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 6.6096833206157273 1.5708414566279951 20.525521275680024 ;
	setAttr ".bps" -type "matrix" 0.07226128753652776 0.055092426500867209 0.99586300808183925 0
		 -0.12021071299833867 0.9916756824310009 -0.046138111745493426 0 -0.99011498867757486 -0.11637940289095465 0.078282461501606782 0
		 14.926728383156926 0.20630946398273675 -13.231290520338277 1;
createNode joint -n "LLMidToe2E" -p "LLOutsidetwoRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 21.567988283159739 -0.25360652830568958 0.68196872171433354 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -73.718105602894028 83.207025680334795 -76.599369057875535 ;
	setAttr ".bps" -type "matrix" 0.99897695203919412 0.0029686992405732159 -0.045124673065853903 0
		 -0.0031095635587035653 0.99999050853507887 -0.0030517952468342019 0 0.045115184904370734 0.0031889911528942549 0.99897670164347208 0
		 15.840517754480807 1.0636797335943564 8.3125582861483025 1;
createNode joint -n "LLFootHeel" -p "LLAnkleLower";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -3.1810229249661037 -5.3601966805626402 3.5958393806610861e-014 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.043952254419547171 -0.29855358850163999 0.95338027781375501 0
		 0.0106418337671526 0.9543882551758549 0.29837863488604455 0 -0.99897695203919079 -0.0029686992404928431 0.045124673065938266 0
		 13.309898712828284 1.1384896384892267 -32.594534610513151 1;
createNode ikEffector -n "effector1" -p "LLKnee";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "RLHip" -p "Master";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -1.0329373312600592 4.3499997093370437 -8.8637800000000038 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -0.41228372698463833 -0.76417310455482024 -11.386836671911183 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -31.871883737921991 ;
	setAttr ".pa" -type "double3" -1.7941145188045404 -0.9063043135930019 -8.4499264943115886 ;
	setAttr ".bps" -type "matrix" 0.017072284080783255 0.91651219745520418 -0.399642251309966 0
		 -0.032998379218678701 0.39999924092730671 0.91592123800385739 0 0.99930958370527256 -0.0024493210102918069 0.037072317723379947 0
		 -8.8637800000000002 71.889899999999983 -23.477599999999999 1;
createNode joint -n "RLKnee" -p "RLHip";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -30.702381912256723 -3.2210387021269171 -7.4825798596874353 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -1.648602491734527 -5.7618688493046708 -13.275932451839525 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 50.215819538516847 ;
	setAttr ".pa" -type "double3" -2.9041424239644202 -10.820966977278228 -23.110346004789573 ;
	setAttr ".bps" -type "matrix" -0.014433429351028692 0.89385741829878684 0.44811894834898119 0
		 -0.034234953365873823 -0.44834464040380428 0.89320493247027022 0 0.99930958370527256 -0.0024493210102918069 0.037072317723379947 0
		 -16.759064494017633 42.480706690701936 -14.435245305666665 1;
createNode joint -n "RLAnkleUpper" -p "RLKnee";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -37.040644675454566 3.4997175884039446 3.0506598596874497 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 -2.2069531490250793e-032 -1.7702332516716224 ;
	setAttr ".pa" -type "double3" -7.9313161698309788e-007 -5.8977292780891943 
		-12.568659752441896 ;
	setAttr ".bps" -type "matrix" -0.013368972418327504 0.90728085073585063 0.42031265560830988 0
		 0.034664484581090803 0.42051808369512522 -0.90662170434757827 0 -0.99930958370527256 0.0024493210102917553 -0.037072317723379836 0
		 -13.295699999999989 7.7950999999999908 -27.794800000000002 1;
createNode joint -n "RLAnkleLower" -p "RLAnkleUpper";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -2.3272142309788348 -0.90295773213896824 0.21100000000000385 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 97.463348651759972 ;
	setAttr ".pa" -type "double3" 0 0 -25.905122428841722 ;
	setAttr ".bps" -type "matrix" 0.036107334335999518 0.29910703918514225 -0.95353617630221388 0
		 0.0087530749992807688 -0.95421642195913137 -0.2989889692640359 0 -0.99930958370527256 0.0024493210102917553 -0.037072317723379836 0
		 -13.506742423679418 5.3044698442293319 -27.962138774566146 1;
createNode joint -n "RLOutsidetwoRoot" -p "RLAnkleLower";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -15.628898395600284 0.4550668907179915 0.73869999999999969 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".ry";
	setAttr -l on ".rx";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 6.6096833206152175 1.5708414566271685 20.525521275679996 ;
	setAttr ".bps" -type "matrix" 0.064264276598413245 -0.054499841828732132 -0.99644361104576618 0
		 -0.1192990147256146 -0.99176652606745419 0.046550003840941878 0 -0.99077638639542687 0.11588323870490203 -0.070236935785115792 0
		 -14.805267038211664 0.1973333326132245 -13.222864060313867 1;
createNode joint -n "RLMidToe2E" -p "RLOutsidetwoRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -21.255923633275529 0.11129493052373218 -0.25212401671571716 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -73.718105602899598 83.20702568033488 -76.599369057875762 ;
	setAttr ".bps" -type "matrix" 0.99930958370527623 -0.0024493210103651453 0.037072317723281255 0
		 -0.002544369288064357 -0.99999359568095392 0.0025168992835217369 0 0.037065915606034776 -0.0026094872418966075 -0.99930941578503163 0
		 -15.93474244728557 1.2161822743236033 7.9803544387555476 1;
createNode joint -n "RLFootHeel" -p "RLAnkleLower";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 3.1810061568172747 5.3601860550162375 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.036107334335999518 0.29910703918514225 -0.95353617630221388 0
		 0.0087530749992807688 -0.95421642195913137 -0.2989889692640359 0 -0.99930958370527256 0.0024493210102917553 -0.037072317723379836 0
		 -13.344966660300688 1.1411536189718299 -32.597979725784256 1;
createNode ikEffector -n "effector2" -p "RLKnee";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "Spine1" -p "Master";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 13.360095262274513 -2.8748072533964435 3.2960366641813119e-015 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".jo" -type "double3" 0 0 3.1615714272021749 ;
	setAttr ".bps" -type "matrix" 1.5677645049117429e-016 0.97955853286024686 0.2011593415695147 0
		 8.2527684821208428e-016 -0.2011593415695147 0.97955853286024686 0 1 0 -8.8817841970012523e-016 0
		 2.3855472982574713e-015 87.187749101839159 -28.510793394324246 1;
createNode joint -n "Spine2" -p "Spine1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 8.876355447912502 -0.51936043817175204 -3.3485346531787591e-015 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".bps" -type "matrix" 1.5677645049117431e-016 0.97955853286024708 0.20115934156951476 0
		 8.2527684821208447e-016 -0.20115934156951476 0.97955853286024708 0 1 0 -8.8817841970012523e-016 0
		 1.1832913578315177e-030 95.987133025322279 -27.233975525726368 1;
createNode joint -n "Spine3" -p "Spine2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 12.249551270380863 0.76155902241770468 -1.2374974768992751e-015 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.5677645049117431e-016 0.97955853286024708 0.20115934156951476 0
		 8.2527684821208447e-016 -0.20115934156951476 0.97955853286024708 0 1 0 -8.8817841970012523e-016 0
		 1.3114407211290524e-015 107.83309078441707 -24.02387221896857 1;
createNode joint -n "Spine4base" -p "Spine3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 11.179013614173885 4.2133339051900673 2.1514128444428646e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 55.644261300833456 ;
	setAttr ".bps" -type "matrix" 7.6978061293316091e-016 0.38672667625067619 0.92219438182852997 0
		 3.363012631194392e-016 -0.92219438182852997 0.38672667625067619 0 1 0 -8.8817841970012523e-016 0
		 6.7563550057364065e-015 117.93603748496142 -17.647902022326392 1;
createNode joint -n "Neck" -p "Spine4base";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 9.2290725587366111 -0.60186388446098615 2.579751214090665e-015 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 3.5311250384401269e-031 -54.606871329322445 ;
	setAttr ".bps" -type "matrix" 1.7169229321939866e-016 0.97575601053736394 0.2188611612420247 0
		 -9.4476379606724154e-016 0.2188611612420247 -0.97575601053736394 0 -1 -2.6801876866192738e-017 1.0076701207285683e-015 0
		 1.6238059766325754e-014 122.06020153335336 -9.3696599787645507 1;
createNode joint -n "Head" -p "Neck";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 13.756277391863158 0.016011103983546354 -7.7956492140276794e-016 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 -24.592681653684849 ;
	setAttr ".bps" -type "matrix" 5.4929525765234328e-016 0.79616219412310274 0.60508326753355757 0
		 9.1007195693047877e-016 -0.60508326753355757 0.79616219412310296 0 1 1.0090075826751272e-016 -1.1051686488882e-015 0
		 1.9364344787920952e-014 135.4864760898937 -6.3745680653612533 1;
createNode joint -n "Head_Top" -p "Head";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 20.131574060907599 -3.0327304022979495 3.1579967034619463e-015 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 -25.346175941946779 ;
	setAttr ".bps" -type "matrix" 1.0682953157331867e-016 0.97854978498674949 0.20601048104983988 0
		 -1.180072898007086e-015 0.20601048104983999 -0.97854978498674972 0 -1 -1.2612893267227656e-016 1.2250024773108295e-015 0
		 3.0820516760054517e-014 153.34952868674844 3.3921652567291511 1;
createNode joint -n "Chin" -p "Head";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 9.8410885964775758 22.55359638042821 4.2855336505983882e-015 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.0164775638926677e-015 1.5416355969284956e-030 
		-7.3199890119589272e-015 ;
	setAttr ".bps" -type "matrix" 5.4929525765234328e-016 0.79616219412310274 0.60508326753355757 0
		 9.1007195693047877e-016 -0.60508326753355757 0.79616219412310296 0 1 1.0090075826751272e-016 -1.1051686488882e-015 0
		 4.9580937328457488e-014 129.67477498692261 17.536430758291228 1;
createNode joint -n "LARoot" -p "Spine4base";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 0.69862059332111826 5.0565446355781667 10.551134833547628 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999999999999929 -51.75357403553086 112.75097634278771 ;
	setAttr ".bps" -type "matrix" 0.7853555476209032 -0.61904496106589146 2.7755575615628914e-017 0
		 -0.61904496106589157 -0.7853555476209032 3.3306690738754696e-016 0 -1.738102114174742e-016 -3.3306690738754696e-016 -0.99999999999999989 0
		 10.551134833547637 113.54309565058139 -15.04813733590562 1;
createNode joint -n "LAShoulder" -p "LARoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 1.5973946998228157 -1.8993723750615625 -2.1538273881156389 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 40.404029250292467 -31.82955940015324 -51.674321769339677 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000000000000014 -12.902412527267943 -38.246425964469132 ;
	setAttr ".bps" -type "matrix" 0.97730208053655243 0.065313455501674 -0.20153112888424188 0
		 0.20872663614034287 -0.13409688776139625 0.96873691787721417 0 0.036246858408184424 -0.98881351994354238 -0.14468582526425536 0
		 12.981454520763329 114.0459191425752 -12.894309947789981 1;
createNode joint -n "LAElbow" -p "LAShoulder";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 26.221798814101643 5.8358108346939144 3.438849138997329 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 1.2395610403736004 16.294927401572266 34.942615992347704 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 32.782764891910546 ;
	setAttr ".pa" -type "double3" -3.3182962618866099e-015 3.2113491636479229e-014 
		1.0368686589533268e-013 ;
	setAttr ".bps" -type "matrix" 0.93092977809384392 -0.014589547174636792 0.3649066913217483 0
		 -0.36292515846416873 -0.14826872306983727 0.91994658274978003 0 0.04068264509474092 -0.98883948691002366 -0.14332268318593658 0
		 39.950809699701139 111.57561084041042 -13.023005988490628 1;
createNode joint -n "LAWrist" -p "LAElbow";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 27.007814616176734 -4.3434990405600917 1.0674405934303377 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999999999999972 0 -19.880352364642604 ;
	setAttr ".bps" -type "matrix" 0.99886609896977085 0.036699750474144685 0.030325643341032826 0
		 -0.040682645094740941 0.98883948691002344 0.14332268318593702 0 -0.024727286891354505 -0.14439389683313048 0.98921128372069012 0
		 66.712979951544696 110.7700567026682 -7.3164492666026506 1;
createNode joint -n "LAFThumbRoot" -p "LAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -0.25371880935075253 -0.7163200692326378 2.7349445890513699 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999645 -87.954591511112653 0 ;
	setAttr ".bps" -type "matrix" 0.01093952784118132 -0.14299202662567692 0.98966338067652759 0
		 -0.99911223049200415 -0.041830006562306885 0.0050001432269219156 0 0.040682645094737666 -0.98883948691002355 -0.14332268318593691 0
		 66.421062869878654 109.65751040911526 -4.7213703192258301 1;
createNode joint -n "LAFThumb1" -p "LAFThumbRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 2.8487190563099958 -0.36311438533430751 1.0625587214271122 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999997 -2.8249000307521015e-030 
		-56.690859816735241 ;
	setAttr ".bps" -type "matrix" 0.84098534956185633 -0.043566786657306948 0.53930100771524547 0
		 0.53952624052071652 0.14247246831538293 -0.8298271094400953 0 -0.040682645094737971 0.98883948691002344 0.14332268318593738 0
		 66.858246234118084 108.21465535417995 -2.0562017782924116 1;
createNode joint -n "LAThumb2" -p "LAFThumb1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 2.9006418355554477 -0.92648841112504332 -2.1970166392512112 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.6986805172993806 ;
	setAttr ".bps" -type "matrix" 0.88235462020893429 -0.031749659044010198 0.46951281489064461 0
		 0.46882325729857216 0.14556245490548103 -0.87121542980932465 0 -0.040682645094737971 0.98883948691002344 0.14332268318593738 0
		 68.887159161008015 105.78378781307251 -0.037939832964352327 1;
createNode joint -n "LAFThumb3" -p "LAThumb2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 4.0973041279071936 -0.076687671613656264 -2.1803207136343121 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 22.988716802080702 ;
	setAttr ".bps" -type "matrix" 0.99537843985837404 0.027621236774677094 0.091971891054532462 0
		 0.086986687793047468 0.14640196858839816 -0.98539321072363606 0 -0.040682645094737971 0.98883948691002344 0.14332268318593738 0
		 72.555182638453005 103.48654974250132 1.6401190294944323 1;
createNode joint -n "LAThumb4E" -p "LAFThumb3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 4.4771061789194393 -0.85568884986789051 -0.74751087746536438 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999858 0 3.5763343749973813 ;
	setAttr ".bps" -type "matrix" 0.99886609896977108 0.036699750474141785 0.030325643341031848 0
		 -0.040682645094737908 0.98883948691002377 0.14332268318593494 0 -0.02472728689135379 -0.14439389683312839 0.98921128372069023 0
		 76.967574782807048 102.74577014768232 2.7879416697043107 1;
createNode joint -n "LAFPinkyRoot" -p "LAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 11.499129580025796 -0.72496335183797211 -0.28972725851825315 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90 -19.573125830410184 0 ;
	setAttr ".bps" -type "matrix" 0.93286243190765838 -0.013794307363131315 0.35996861004773872 0
		 -0.35792821280729592 -0.1483448219921836 0.92189001961442363 0 0.040682645094740885 -0.98883948691002344 -0.14332268318593691 0
		 78.235728252484108 110.51703434794121 -7.358235930351074 1;
createNode joint -n "LAFPinky1" -p "LAFPinkyRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 4.7584644233757576 -0.26405447382178243 0.29763648032620638 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 6.9919253466678457 ;
	setAttr ".bps" -type "matrix" 0.88235462020893407 -0.031749659044007297 0.46951281489064478 0
		 -0.46882325729857199 -0.14556245490548192 0.87121542980932476 0 0.040682645094740885 -0.98883948691002344 -0.14332268318593691 0
		 82.781342131815649 110.1962510365325 -5.9314253489320974 1;
createNode joint -n "LAFPinky2" -p "LAFPinky1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 2.7349183606647154 -0.3942897237934565 0.67803992102476274 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.1038754726368802 ;
	setAttr ".bps" -type "matrix" 0.84654091946234578 -0.042085415262953438 0.53065741255351451 0
		 -0.53076679819289907 -0.14291706318584196 0.83538094243667815 0 0.040682645094740885 -0.98883948691002344 -0.14332268318593691 0
		 85.406946633337725 109.49633944359694 -5.0880359228928649 1;
createNode joint -n "LAFPinky3E" -p "LAFPinky2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 11.983957829182339 0.27559944802634045 4.787561689462966 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999999999999986 0 -30.668926649714916 ;
	setAttr ".bps" -type "matrix" 0.99886609896977085 0.036699750474144664 0.030325643341032715 0
		 -0.040682645094740955 0.98883948691002344 0.14332268318593713 0 -0.024727286891354561 -0.14439389683313059 0.98921128372069023 0
		 95.600348949320647 104.21847169357586 0.81540447026671004 1;
createNode joint -n "LAFPointerRoot" -p "LAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 8.6278332794854578 2.1277015622055031 7.4388608721006726 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999986 -30.256437163529302 0 ;
	setAttr ".bps" -type "matrix" 0.85034009770843899 -0.04105543074892519 0.52462955486249763 0
		 -0.52465859434235684 -0.14321634241084832 0.83917962239866195 0 0.040682645094740878 -0.98883948691002344 -0.1433226831859368 0
		 75.060526747533856 112.11652524290467 0.60874833786144045 1;
createNode joint -n "LAFPointer1" -p "LAFPointerRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 4.0998433283697482 -0.3930167861604365 -0.019386792489674152 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999994 0 -8.4550276771774797 ;
	setAttr ".bps" -type "matrix" 0.91824040640593851 -0.01955168412971248 0.39554050069638719 0
		 0.39392826559102373 0.1476963126662707 -0.90719695810404621 0 -0.040682645094740476 0.98883948691002355 0.14332268318593588 0
		 78.752198852550578 112.02366126161364 2.4326142071415804 1;
createNode joint -n "LAFPointer2" -p "LAFPointer1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 3.0407718301403075 0.010934614030565094 -0.25281771117634327 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.91824040640593851 -0.01955168412971248 0.39554050069638719 0
		 0.39392826559102373 0.1476963126662707 -0.90719695810404621 0 -0.040682645094740476 0.98883948691002355 0.14332268318593588 0
		 81.558951160403765 111.71582791765157 3.5892082580294558 1;
createNode joint -n "LAFPointer3E" -p "LAFPointer2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 11.035402548885356 -0.22519332867254407 -4.9803711460852336 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000014 0 21.801409486351819 ;
	setAttr ".bps" -type "matrix" 0.99886609896977074 0.036699750474144185 0.030325643341032882 0
		 -0.040682645094740517 0.98883948691002355 0.14332268318593611 0 -0.024727286891354616 -0.14439389683312956 0.98921128372069012 0
		 91.806008336135008 106.54201933977316 7.4446514544400628 1;
createNode joint -n "LAFMiddleroot" -p "LAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 10.476439270204082 3.1636834095791557 3.2486783948780555 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90 -27.51200262385148 0 ;
	setAttr ".bps" -type "matrix" 0.87448602647364493 -0.034150985236284667 0.48384697964307544 0
		 -0.48334160993073116 -0.14501785867579292 0.86333696131618065 0 0.040682645094740857 -0.98883948691002344 -0.14332268318593691 0
		 76.968501964435234 113.81382515622218 -3.3316875854057404 1;
createNode joint -n "LAFMiddle1" -p "LAFMiddleroot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 5.1342427523126366 -0.62859535269035938 -0.59131956257657903 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.6837313108617842 ;
	setAttr ".bps" -type "matrix" 0.8320982692215092 -0.045878450220062719 0.5527274537816752 0
		 -0.55313415438450753 -0.14174497145552081 0.82094516888791613 0 0.040682645094740857 -0.98883948691002344 -0.14332268318593691 0
		 81.738095353718677 114.31436339266723 -1.3054398323052783 1;
createNode joint -n "LAFMiddle2" -p "LAFMiddle1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 3.4431888483874631 -0.64434020390341629 0.92682699495975629 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999997 0 -7.178840456613222 ;
	setAttr ".bps" -type "matrix" 0.89469880777582178 -0.027805385131549568 0.44580366073217625 0
		 0.44481340554508769 0.14636710588519278 -0.88358231340502413 0 -0.040682645094740601 0.98883948691002355 0.14332268318593641 0
		 84.997279182586922 113.33124407814778 -0.064098136528172978 1;
createNode joint -n "LAFMiddle3E" -p "LAFMiddle2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 11.416164210839183 -0.50073440204134878 -5.7270237533735751 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000028 1.5902773407317584e-015 
		25.016893478100037 ;
	setAttr ".bps" -type "matrix" 0.99886609896977097 0.036699750474144387 0.03032564334103266 0
		 -0.040682645094740622 0.98883948691002344 0.14332268318593688 0 -0.024727286891354561 -0.14439389683313036 0.98921128372069023 0
		 95.2215647915598 107.277414960489 4.6468973105376739 1;
createNode ikEffector -n "effector4" -p "LAElbow";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector5" -p "LAElbow";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "RARoot" -p "Spine4base";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 0.6986180336520873 5.0566472827976234 -10.551100000000009 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000000000000071 -51.75357403553086 -67.249023657212177 ;
	setAttr ".bps" -type "matrix" 0.78535554762090332 0.61904496106589146 -1.3877787807814457e-016 0
		 -0.61904496106589169 0.7853555476209032 1.6653345369377348e-016 0 1.738102114174742e-016 -1.6653345369377348e-016 0.99999999999999989 0
		 -10.5511 113.54300000000001 -15.048099999999994 1;
createNode joint -n "RAShoulder" -p "RARoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -1.5973485075217013 1.899560713827869 2.1538000000000022 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 63.45783108171549 -43.271973312042796 -33.105264993853631 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000000000000028 -12.902412527267929 -38.246425964469132 ;
	setAttr ".pa" -type "double3" 63.291762793679702 -43.361266788359714 -33.330811185136454 ;
	setAttr ".bps" -type "matrix" 0.97606395676921842 -0.019309564376735644 0.21662477471332459 0
		 0.21653326771668291 -0.0067351629370450139 -0.97625200719493865 0 0.020310004134742876 0.99979086728364952 -0.0023927867131374324 0
		 -12.981500000000008 114.04600000000002 -12.894299999999992 1;
createNode joint -n "RAElbow" -p "RAShoulder";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -26.221765821812703 -5.8357541394996701 -3.4385428584398205 ;
	setAttr ".r" -type "double3" 0.85874775845172169 11.29827926152061 24.235395375992226 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 32.782764891910531 ;
	setAttr ".pa" -type "double3" 0.85874776254326413 11.29827931458524 24.235395490448525 ;
	setAttr ".bps" -type "matrix" 0.93426094160778261 -0.024457232410080576 -0.35575038547973392 0
		 -0.35572963086369447 0.0053413605455885993 -0.9345736458905215 0 0.024757275934960122 0.99968660771781936 -0.0037099377243973919 0
		 -39.909092234603797 111.15381188356652 -12.86918972188877 1;
createNode joint -n "RAWrist" -p "RAElbow";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -27.007846361687925 4.3434499132648483 -1.0678836532692562 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999999999999972 1.5902773407317587e-014 
		-19.880352364642615 ;
	setAttr ".bps" -type "matrix" 0.99955185092558174 -0.024816066115183357 -0.016740972905151863 0
		 -0.024757275934960125 -0.99968660771781936 0.0037099377243969174 0 -0.016827792473299019 -0.0032938142336069618 -0.99985297728629574 0
		 -66.712999931863749 110.77000000415445 -7.3164500070731284 1;
createNode joint -n "RAFThumbRoot" -p "RAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" 0.2536816662950514 0.71578041665863879 -2.7348663264799198 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90 -87.954591511112682 -4.4556154300489622e-013 ;
	setAttr ".bps" -type "matrix" 0.018858464667566001 -0.0041774389751361345 -0.99981343625397978 0
		 -0.9995156004778829 0.024682693395326135 -0.018955976579694334 0 0.02475727593496007 0.99968660771781936 -0.0037099377243969165 0
		 -66.431130963072491 110.05715666818432 -4.5835771451939795 1;
createNode joint -n "RAFThumb1" -p "RAFThumbRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -1.9877135441037614 0.37327354138930524 -1.3048127536012495 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999986 -2.9738186271683886e-013 
		-56.690859816735248 ;
	setAttr ".bps" -type "matrix" 0.84567118664675767 -0.022921881057672001 -0.53321180730010365 0
		 0.53312974158617865 -0.0100634844073341 0.84597364315789303 0 -0.024757275934961555 -0.99968660771781936 0.0037099377243945586 0
		 -66.874012525961817 108.77026978123499 -2.5984694268255568 1;
createNode joint -n "RAThumb2" -p "RAFThumb1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -2.8417084498453309 0.82144031984888377 1.9513962393026798 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.309770494394678e-014 3.1924817615190104e-013 
		4.6986805172993602 ;
	setAttr ".bps" -type "matrix" 0.88650073670582286 -0.023669202813392142 -0.4621214263137039 0
		 0.46206441229369122 -0.0081520051408980714 0.88680889920200334 0 -0.024757275934961555 -0.99968660771781936 0.0037099377243945586 0
		 -68.88754047255199 106.87635584569077 -0.38108050992077613 1;
createNode joint -n "RAFThumb3" -p "RAThumb2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -4.0749566656818041 0.066320633019173611 2.7862363811458537 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 8.2139159470679259e-014 4.0393044454586642e-013 
		22.988716802080702 ;
	setAttr ".bps" -type "matrix" 0.99655561328936126 -0.024973201260867821 -0.079077486304572897 0
		 0.079145353052127831 0.001739416115513745 0.99686156888598687 0 -0.024757275934961555 -0.99968660771781936 0.0037099377243945586 0
		 -72.538327777312318 104.18690297915759 1.5711947676122413 1;
createNode joint -n "RAThumb4E" -p "RAFThumb3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -4.4520195964125753 0.82971021420836888 1.6744581341324101 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.99999999999973 4.297724513327579e-013 3.5763343749973902 ;
	setAttr ".bps" -type "matrix" 0.99955185092558185 -0.0248160661151848 -0.016740972905151294 0
		 -0.024757275934961478 -0.99968660771781936 0.0037099377243992298 0 -0.016827792473298936 -0.0032938142336091897 -0.99985297728629574 0
		 -76.950800210825292 102.62559399999759 2.7565676475314671 1;
createNode joint -n "RAFPinkyRoot" -p "RAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -11.514045465502349 0.12215594538176203 0.28774651198115514 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000043 -19.573125830410206 5.0634235184572089e-015 ;
	setAttr ".bps" -type "matrix" 0.93615496447394464 -0.024485521660381499 -0.35073400422514911 0
		 -0.35071492665563614 0.0052101419037929187 -0.93646777554931071 0 0.024757275934960309 0.99968660771781959 -0.0037099377243962552 0
		 -78.229751775583367 110.93266787147148 -7.4109446996645403 1;
createNode joint -n "RAFPinky1" -p "RAFPinkyRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -4.7410274529477467 0.26030974217033537 -1.0093458834138287 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.8576525944454279e-016 7.9513867036587556e-015 
		6.9919253466678155 ;
	setAttr ".bps" -type "matrix" 0.8865007367058233 -0.023669202813391868 -0.46212142631370334 0
		 -0.46206441229369022 0.0081520051408958804 -0.88680889920200379 0 0.024757275934960309 0.99968660771781959 -0.0037099377243962552 0
		 -82.784371329050174 110.04108109035482 -5.9881322317850447 1;
createNode joint -n "RAFPinky2" -p "RAFPinky1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -2.7934631031519408 0.28144951042637972 -0.68747960812214304 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 8.5377364662194484e-007 1.0336803390120334e-014 
		4.1038754726368669 ;
	setAttr ".bps" -type "matrix" 0.85116010122678987 -0.023025116144690241 -0.52440092115300929 0
		 -0.52432199969854543 0.0098249873364903255 -0.85146339337399379 0 0.024757275934960309 0.99968660771781959 -0.0037099377243962552 0
		 -85.40784635293835 109.42223035563215 -4.9442545021910016 1;
createNode joint -n "RAFPinky3E" -p "RAFPinky2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -11.427804615839266 0.22665574716998624 -5.802467733541274 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000000000000014 6.3611093629270351e-015 
		-30.668926649714876 ;
	setAttr ".bps" -type "matrix" 0.99955185092558163 -0.024816066115183583 -0.01674097290515203 0
		 -0.024757275934960351 -0.99968660771781936 0.0037099377243962834 0 -0.016827792473299075 -0.003293814233606333 -0.99985297728629574 0
		 -95.397231575938392 103.88693448910038 0.87703448743790346 1;
createNode joint -n "RAFPointerRoot" -p "RAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -8.5979424215326823 -0.80165440510340602 -7.6165942949548651 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000014 -30.256437163529323 7.3642796279357158e-015 ;
	setAttr ".bps" -type "matrix" 0.85491276213266565 -0.023095251869369296 -0.51825744421454023 0
		 -0.5181807082775054 0.0096589694444625691 -0.85521661459439258 0 0.024757275934960184 0.99968660771781936 -0.0037099377243966962 0
		 -75.15907194599788 111.80985793124194 0.43998830871881989 1;
createNode joint -n "RAFPointer1" -p "RAFPointerRoot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -4.032592496728947 -0.024856200756021143 0.339642705146048 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 1.1927080055488212e-015 -8.4550276771774922 ;
	setAttr ".bps" -type "matrix" 0.92181090968741508 -0.024264430843419345 -0.38687967661419731 0
		 0.3868484510367608 -0.0061582258389562923 0.92212274247248405 0 -0.024757275934960233 -0.99968660771781936 0.003709937724396583 0
		 -78.585298104048448 112.24228784910036 2.5499067722099014 1;
createNode joint -n "RAFPointer2" -p "RAFPointer1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -3.0995995945253938 0.20338432230168432 0.3151395495189756 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 8.5377364625159377e-007 -7.5163855389057294e-023 
		1.7772733687861133e-023 ;
	setAttr ".bps" -type "matrix" 0.92181090968741508 -0.024264430843419345 -0.38687967661419731 0
		 0.3868484510367608 -0.0061582258389562923 0.92212274247248405 0 -0.024757275934960233 -0.99968660771781936 0.003709937724396583 0
		 -81.371665912682531 112.00120459529883 3.9377933181333296 1;
createNode joint -n "RAFPointer3E" -p "RAFPointer2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -10.928676422059159 -0.73804957784074887 5.7519107581834872 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999901 2.7034714792439897e-014 
		21.801409486351812 ;
	setAttr ".bps" -type "matrix" 0.99955185092558174 -0.024816066115183485 -0.016740972905152307 0
		 -0.024757275934960177 -0.99968660771781936 0.0037099377243983655 0 -0.016827792473299297 -0.0032938142336084233 -0.99985297728629585 0
		 -91.87375404474993 106.52081963078859 7.5066430480307567 1;
createNode joint -n "RAFMiddleroot" -p "RAWrist";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -10.981036313793004 -2.9136077063787318 -3.690813647035796 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000043 -27.512002623851501 1.7930455374664646e-014 ;
	setAttr ".bps" -type "matrix" 0.87874327790460871 -0.02353124471493322 -0.47671430863739545 0
		 -0.47665220950473353 0.008542064844321795 -0.87905045606179577 0 0.024757275934960354 0.99968660771781936 -0.0037099377243964772 0
		 -77.554873868333587 113.96735758606521 -3.4531550652197871 1;
createNode joint -n "RAFMiddle1" -p "RAFMiddleroot";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -4.9574273623796712 0.41037142142210953 -0.027424574635879606 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.6259012560473068e-016 3.9756933518293928e-015 
		4.6837313108617815 ;
	setAttr ".bps" -type "matrix" 0.8368875304964235 -0.022755158040053462 -0.54690169508072517 0
		 -0.54681472052961289 0.010434995553945444 -0.83718861212985374 0 0.024757275934960354 0.99968660771781936 -0.0037099377243964772 0
		 -82.107463241225204 114.06010146179206 -1.4505139492346708 1;
createNode joint -n "RAFMiddle2" -p "RAFMiddle1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -3.3524045002078369 0.30816690325442347 -0.95715046468775988 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 2.9817700138720547e-015 -7.178840456613246 ;
	setAttr ".bps" -type "matrix" 0.89866080600925646 -0.023880806879480136 -0.43799367895619123 0
		 0.43794501142389392 -0.0075095547420367696 0.8989703963738197 0 -0.024757275934960406 -0.99968660771781936 0.0037099377243963671 0
		 -85.105255401874331 113.18275117515456 0.12847890110218918 1;
createNode joint -n "RAFMiddle3E" -p "RAFMiddle2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr -l on ".v";
	setAttr ".t" -type "double3" -11.059188523269842 -0.20924928110024052 6.1260241172007577 ;
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999929 2.3854160110976374e-014 
		25.016893478100027 ;
	setAttr ".bps" -type "matrix" 0.99955185092558185 -0.024816066115183638 -0.016740972905151807 0
		 -0.024757275934960465 -0.99968660771781936 0.0037099377243972604 0 -0.016827792473299297 -0.0032938142336073357 -0.99985297728629619 0
		 -95.287018022259971 107.32432062093172 4.8069518274805798 1;
createNode ikEffector -n "effector7" -p "RAElbow";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -27.007846361687925 4.3434499132648483 -1.0678836532692562 ;
	setAttr ".hd" yes;
createNode ikEffector -n "effector8" -p "RAElbow";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -27.007846361687925 4.3434499132648483 -1.0678836532692562 ;
	setAttr ".hd" yes;
createNode ikEffector -n "effector9" -p "RAElbow";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikHandle -n "LAIK";
	setAttr -l on ".v";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 66.712980019656413 112.09216860888399 -7.316449259531888 ;
	setAttr ".sp" -type "double3" 66.712980019656413 112.09216860888399 -7.316449259531888 ;
	setAttr ".pv" -type "double3" 0.046066692975169528 -0.34527641156440525 
		-1.2092281089255332 ;
	setAttr -l on ".pvx";
	setAttr -l on ".pvy";
	setAttr -l on ".pvz";
	setAttr -l on ".off";
	setAttr -l on ".rol";
	setAttr ".roc" yes;
	setAttr -l on ".ikb";
createNode ikHandle -n "Tail_IK";
	setAttr -l on ".v";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -8.5486136966792015e-014 71.551487044043611 
		-135.06223534543543 ;
	setAttr ".sp" -type "double3" -8.5486136966792015e-014 71.551487044043611 
		-135.06223534543543 ;
	setAttr ".pv" -type "double3" -4.3081296261573252e-008 -1.2583358073246995 
		0.012710468303516589 ;
	setAttr -l on ".pvx";
	setAttr -l on ".pvy";
	setAttr -l on ".pvz";
	setAttr -l on ".off";
	setAttr -l on ".rol";
	setAttr ".roc" yes;
	setAttr -l on ".ikb";
createNode transform -n "Body";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "BodyShape" -p "Body";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "BodyShapeOrig" -p "Body";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 1861 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.74824405 3 0.74824405 
		3 0.74297619 3.2570238 0.74297619 3.2570238 0.74561012 2.8714881 0.74297625 
		2.7429764 0.74527162 2.85497 0.74824405 3 0.74297625 2.7429764 0.74297625 
		2.7429764 0.74824405 3 0.74824405 3 0.74824405 3 0.74824405 3 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74297625 2.7429764 0.74297625 2.7429764 0.74297625 2.7429764 0.74297619 
		2.7429764 0.74297619 3.2570238 0.74731886 3.0451422 0.74824405 3 0.74824405 
		3 0.74297619 2.7429764 0.74297619 2.7429764 0.74824405 3 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74297625 2.7429764 0.74297625 2.7429764 0.74448192 
		3.1835558 0.74824405 3 0.74297625 2.7429764 0.74725783 3.0481176 0.74713182 
		3.0542653 0.74824405 3 0.74824405 3 0.74824405 3 0.74824405 3 0.74297625 
		2.7429764 0.74561012 2.8714881 0.74297625 2.7429764 0.74824405 3 0.74527162 
		2.85497 0.74532861 2.8577507 0.74297619 3.2570238 0.7446239 3.1766295 0.74452561 
		3.1814237 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74824405 3 0.74824405 3 0.74297625 2.7429764 0.74297625 2.7429764 0.74297625 
		2.7429764 0.74540603 2.8615294 0.74297619 3.2570238 0.74297625 2.7429764 
		0.74824405 3 0.74297619 3.2570238 0.74410224 3.202085 0.74561012 3.1285119 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74648392 
		3.0858788 0.74297619 3.2570238 0.74297625 2.7429764 0.74561012 2.8714881 
		0.74824405 3 0.74824405 3 0.74824405 3 0.74527162 2.85497 0.74297625 2.7429764 
		0.74297625 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74297625 2.7429764 0.74532861 
		2.8577507 0.74824405 3 0.74824405 3 0.74824405 3 0.74540603 2.8615294 0.74297625 
		2.7429764 0.74561012 3.1285119 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74448192 3.1835558 0.74713182 3.0542653 0.74561012 3.1285119 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74448192 3.1835558 0.74713182 3.0542653 
		0.74561012 3.1285119 0.74297619 3.2570238 0.74448192 3.1835558 0.74713182 
		3.0542653 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74824405 3 0.74824405 3 0.74297625 2.7429764 0.74561012 2.8714881 
		0.74824405 3 0.74824405 3 0.74824405 3 0.74527162 2.85497 0.74297625 2.7429764 
		0.74297625 2.7429764 0.74297625 2.7429764 0.74532861 2.8577507 0.74824405 
		3 0.74824405 3 0.74540603 2.8615294 0.74297625 2.7429764 0.74824405 3 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74824405 
		3 0.74297625 2.7429764 0.74561012 2.8714881 0.74824405 3 0.74824405 3 0.74824405 
		3 0.74527162 2.85497 0.74297625 2.7429764 0.74297625 2.7429764 0.74297625 
		2.7429764 0.74532861 2.8577507 0.74824405 3 0.74824405 3 0.74540603 2.8615294 
		0.74297625 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74824405 3 0.74561012 2.8714881 0.74824405 3 0.74527162 2.85497 0.74297625 
		2.7429764 0.74297625 2.7429764 0.74824405 3 0.74824405 3 0.74297625 2.7429764 
		0.74297619 3.2570238 0.74824405 3 0.74297619 3.2570238 0.74824405 3 0.74824405 
		3 0.74561012 2.8714881 0.74527162 2.85497 0.74297631 2.7429764 0.74824405 
		3 0.74297625 2.7429764 0.74824405 3 0.74297631 2.7429764 0.74297619 3.2570238 
		0.74824405 3 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74561012 2.8714881 
		0.74527162 2.85497 0.74297631 2.7429764 0.74297619 2.7429764 0.74824405 3 
		0.74824405 3 0.74297631 2.7429764 0.74685979 3.0675387 0.74561012 3.1285119 
		0.74780178 3.0215769 0.74725783 3.0481176 0.74725783 3.0481176 0.7446239 
		3.1766295 0.74297619 3.2570238 0.74561012 3.1285119 0.74621189 3.0991502 
		0.74893373 0.4990595 0.74110025 0.75268608 1.0297713 0.77800304 1.00439 0.50301862 
		1.504746 0.75153041 1.4666886 0.75783014 1.4611382 0.90943593 1.502373 0.8757652 
		0.77400279 1.0291167 1.0625 1.0625 1.006057 1.4576008 0.75414503 1.4486049 
		0.75083047 1.5042896 1 1.5 1.5497947 0.66254443 1.6020851 0.74146563 1.7283975 
		0.72840494 1.7445784 0.50002193 1.2620037 0.78284627 1.30957 0.78383827 1.2608137 
		0.50520259 1.375124 0.77298701 1.5025697 0.59126836 1.501348 0.50130612 1.2917826 
		0.93923348 1.2859821 0.98990858 0.76342225 1.292748 1.0405465 1.2161741 1.2161741 
		1.0405465 1.2064443 0.91969395 0.75809634 1.3822235 1.03125 1.28125 0.98820102 
		1.1934795 0.85619724 1.2820327 0.76022792 1.3464127 1.0097256 1.2373648 1.1421001 
		1.0589143 1.2064443 0.91969395 0.98820102 1.1934795 1.6598015 0.97717118 
		1.6464056 0.90458155 1.5962431 0.9161045 1.609375 0.984375 1.4576008 1.006057 
		1.5 1 1.28125 1.03125 1.1347618 1.0962542 1.03125 1.28125 0.85619724 1.2820327 
		0.98820102 1.1934795 1.2064443 0.91969395 1.1347618 1.0962542 1.077756 1.1981347 
		1.077756 1.1981347 1.03125 1.28125 0.85619724 1.2820327 1.1347618 1.0962542 
		1.077756 1.1981347 0.74824405 3;
	setAttr ".uvst[0].uvsp[250:499]" 0.74824405 3 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74297625 
		2.7429764 0.74297619 2.7429764 0.74297625 2.7429764 0.74297625 2.7429764 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74297625 
		2.7429764 0.74297625 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74297619 2.7429764 0.74297625 2.7429764 0.74297619 3.2570238 
		0.74824405 3 0.74297625 2.7429764 0.74824405 3 0.74824405 3 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 
		2.7429764 0.74297619 2.7429764 0.74297625 2.7429764 0.74297625 2.7429764 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74297625 
		2.7429764 0.74297625 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74297619 2.7429764 0.74297625 2.7429764 0.74297619 3.2570238 
		0.74824405 3 0.74297625 2.7429764 0.25175595 2.5 0 2.5 0 2.25 0.25702375 
		2.2570236 0.25298193 3.4965014 0 3.5 0 3.25 0.25702375 3.2570238 0.5 2.748244 
		0.5 3 0.25175595 3 0.25702375 2.7429762 0.5 3.251756 0.74824405 3 0.74297619 
		3.2570238 -0.50064611 0.25369418 -0.5 0 -0.25 0 -0.27693993 0.25778252 -0.0034136903 
		0.24969655 0 0 0.25 0 0.24963041 0.23978987 0 2 0.25172529 1.999824 0.5 1.999912 
		0.5 2.251756 0.5 2.5 0 3 0.25175595 3 0.25702375 3.2570238 0.37851188 3.2543898 
		-0.96875 0.28125 -0.9375 0.0625 -0.71875 0.03125 -0.72822917 0.27177078 0.74297625 
		2.7429764 0 2.75 0.25702375 2.7429762 0.5 2.748244 0.28125 3.96875 0.0625 
		3.9375 0.03125 3.71875 0.26683167 3.7149878 0.25702375 2.7429762 0.25175595 
		3 0.5 2.748244 0.62148809 3.2543898 0.64705318 3.2549441 0.37851188 3.2543898 
		0.25702375 3.2570238 0.25702375 2.7429762 0.25175595 3 0.5 2.748244 0.74824405 
		3 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.62148809 3.2543898 
		0.37851188 3.2543898 0.25702375 3.2570238 0.74297625 2.7429764 0.74297625 
		2.7429764 0.5 2.748244 0.25702375 2.7429762 0.68223214 3.2557068 0.62148809 
		3.2543898 0.74297619 3.2570238 0.74297625 2.7429764 0.5 2.748244 0.25702375 
		2.7429762 0.62148809 3.2543898 0.74297619 3.2570238 0.74297625 2.7429764 
		0.25702375 2.7429762 0.25175595 3 0.74297619 3.2570238 0.74824405 3 0.25702375 
		3.2570238 0.25702375 3.2570238 0.25702375 3.2570238 0.74297625 2.7429764 
		0.5 2.748244 0.25702375 2.7429762 0.62148809 3.2543898 0.74297619 3.2570238 
		0.74297625 2.7429764 0.25702375 2.7429762 0.25702375 2.7429762 0.25175595 
		3 0.25175595 3 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74824405 
		3 0.25702375 3.2570238 0.25702375 3.2570238 0.25702375 3.2570238 0.74297625 
		2.7429764 0.74297625 2.7429764 0.25702375 2.7429762 0.25175595 3 0.5 2.748244 
		0.74297619 3.2570238 0.74824405 3 0.62148809 3.2543898 0.25702375 3.2570238 
		0.74297625 2.7429764 0.25702375 2.7429762 0.25175595 3 0.5 2.748244 0.74297619 
		3.2570238 0.74824405 3 0.62148809 3.2543898 0.25702375 3.2570238 0.74297625 
		2.7429764 0.25702375 2.7429762 0.25175595 3 0.5 2.748244 0.74297619 3.2570238 
		0.74824405 3 0.62148809 3.2543898 0.25702375 3.2570238 0.74297625 2.7429764 
		0.25702375 2.7429762 0.25175595 3 0.5 2.748244 0.74297619 3.2570238 0.74824405 
		3 0.62148809 3.2543898 0.25702375 3.2570238 0.74297625 2.7429764 0.25702375 
		2.7429762 0.25175595 3 0.5 2.748244 0.74297619 3.2570238 0.74824405 3 0.62148809 
		3.2543898 0.25702375 3.2570238 0.74297625 2.7429764 0.25702375 2.7429762 
		0.25175595 3 0.25702375 2.7429762 0.5 2.748244 0.5 2.748244 0.25702375 2.7429762 
		0.56674176 3.1840701 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74297625 2.7429764 
		0.74297625 2.7429764 0.74824405 3 0.74297625 2.7429764 0.25702375 2.7429762 
		0.25175595 3 0.5 2.748244 0.25702375 2.7429762 0.74297625 2.7429764 0.74824405 
		3 0.74297625 2.7429764 0.5 2.748244 0.74297619 3.2570238 0.5 3.251756 0.25702375 
		3.2570238 0.5 2.748244 0.25702375 2.7429762 0.25702375 2.7429762 0.74297625 
		2.7429764 0.74297625 2.7429764 0.25702375 2.7429762 0.5 2.748244 0.74297625 
		2.7429764 0.5 2.748244 0.25702375 2.7429762 0.25702375 2.7429762 0.74297625 
		2.7429764 0.74297625 2.7429764 0.25702375 2.7429762 0.5 2.748244 0.74297625 
		2.7429764 0.5 2.748244 0.25702375 2.7429762 0.25702375 2.7429762 0.74297625 
		2.7429764 0.74297625 2.7429764 0.25702375 2.7429762 0.5 2.748244 0.74297625 
		2.7429764 0.5 2.748244 0.25702375 2.7429762 0.25702375 2.7429762 0.74297625 
		2.7429764 0.74297625 2.7429764 0.25702375 2.7429762 0.5 2.748244 0.74297625 
		2.7429764 0.5 2.748244 0.25702375 2.7429762 0.25702375 2.7429762 0.74297625 
		2.7429764 0.74297625 2.7429764 0.25702375 2.7429762;
	setAttr ".uvst[0].uvsp[500:749]" 0.5 2.748244 0.74297625 2.7429764 
		0.5 2.748244 0.25702375 2.7429762 0.25702375 2.7429762 0.74297625 2.7429764 
		0.74297625 2.7429764 0.25702375 2.7429762 0.5 2.748244 0.74297625 2.7429764 
		0.37851188 3.2543898 0.37851188 3.2543898 0.37851188 3.2543898 0.37851188 
		3.2543898 0.37851188 3.2543898 0.37220442 3.2545266 0.37851188 3.2543898 
		0.3177678 3.2557068 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74824405 3 0.74297619 3.2570238 
		0.5 3.251756 0.5 3.251756 0.37851188 3.2543898 0.25175595 3 0.25702375 3.2570238 
		0.25175595 3 0.25702375 3.2570238 0.25175595 3 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3 0.5 3.251756 0.5 3.251756 0.25702375 3.2570238 0.5 3.251756 
		0.5 3.251756 0.25175595 3 0.25175595 3 0.74297619 3.2570238 0.74824405 3 
		0.74824405 3 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74824405 3 
		0.74824405 3 0.74297619 3.2570238 0.5 3.251756 0.5 3.251756 0.74824405 3 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74824405 
		3 0.74824405 3 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74297619 
		3.2570238 0.74824405 3 0.74824405 3 0.74297619 3.2570238 0.74824405 3 0.5 
		3.251756 0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74824405 
		3 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 0.5 3.251756 0.5 
		3.251756 0.5 3.251756 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74824405 
		3 0.74297619 3.2570238 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3 0.74297619 3.2570238 0.74824405 3 0.5 3.251756 0.74297619 
		3.2570238 0.74824405 3 0.74824405 3 0.74824405 3 0.74297619 3.2570238 0.5 
		3.251756 0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 0.5 3.251756 0.74824405 
		3 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74429715 3.1925743 0.68223214 
		3.2557068 0.62148809 3.2543898 0.74824405 3 0.74824405 3 0.74824405 3 0.74824405 
		3 0.74824405 3 0.74824405 3 0.5 3.251756 0.74824405 3 0.74824405 3 0.74297619 
		3.2570238 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 0.5 
		3.251756 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 
		0.62148809 3.2543898 0.74536568 3.1404393 0.74561012 3.1285119 0.74824405 
		3 0.74824405 3 0.74824405 3 0.74824405 3 0.74429315 3.1927679 0.74561012 
		3.1285119 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74429715 3.1925743 
		0.74824405 3 0.74536568 3.1404393 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74561012 3.1285119 0.74429315 3.1927679 0.65749288 3.0920351 0.74297619 
		3.2570238 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.74297619 3.2570238 0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74561012 3.1285119 0.74429315 3.1927679 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 0.74297619 3.2570238 
		0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 
		0.74297619 3.2570238 0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 0.74297619 
		3.2570238 0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 0.74297619 3.2570238 
		0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74561012 3.1285119 0.74429315 3.1927679 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74561012 3.1285119 0.74429315 3.1927679 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74561012 3.1285119 0.74429315 3.1927679 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74561012 3.1285119 0.74429315 3.1927679 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74561012 3.1285119 0.74429315 
		3.1927679 0.56674176 3.1840701 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74824405 
		3 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3;
	setAttr ".uvst[0].uvsp[750:999]" 0.74824405 3 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3 0.5 3.251756 0.5 3.251756 0.74824405 3 0.74824405 3 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74824405 3 0.5 
		3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74824405 3 0.74824405 3 0.74824405 3 0.5 3.251756 0.5 3.251756 
		0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74824405 3 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74824405 3 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 
		0.5 3.251756 0.74824405 3 0.74824405 3 0.74824405 3 0.74297619 3.2570238 
		0.5 3.251756 0.5 3.251756 0.74824405 3 0.74297619 3.2570238 0.74824405 3 
		0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3 0.74824405 3 0.5 3.251756 0.74297619 3.2570238 0.74824405 
		3 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74297619 3.2570238 0.5 
		3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3 0.74824405 3 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.74297619 3.2570238 0.62148809 3.2543898 0.68223214 3.2557068 0.74429715 
		3.1925743 0.74824405 3 0.74824405 3 0.74824405 3 0.74824405 3 0.74824405 
		3 0.74824405 3 0.5 3.251756 0.74824405 3 0.74824405 3 0.74297619 3.2570238 
		0.74297619 3.2570238 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.62148809 3.2543898 0.74297619 
		3.2570238 0.74561012 3.1285119 0.74536568 3.1404393 0.74824405 3 0.74824405 
		3 0.74824405 3 0.74824405 3 0.74429315 3.1927679 0.74561012 3.1285119 0.74297619 
		3.2570238 0.74429715 3.1925743 0.74824405 3 0.74824405 3 0.74536568 3.1404393 
		0.74824405 3 0.74297619 3.2570238 0.74429315 3.1927679 0.74561012 3.1285119 
		0.74297619 3.2570238 0.65749288 3.0920351 0.74297619 3.2570238 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.5 3.251756 
		0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74561012 3.1285119 0.74429315 3.1927679 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 
		0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.74297619 
		3.2570238 0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 
		0.5 3.251756 0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 0.5 3.251756 
		0.5 3.251756 0.74297619 3.2570238 0.74297619 3.2570238 0.5 3.251756 0.5 3.251756 
		0.74297619 3.2570238 0.74297619 3.2570238 0.5 3.251756 0.5 3.251756 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74561012 3.1285119 
		0.74429315 3.1927679 0.74297619 3.2570238 0.74297619 3.2570238 0.74561012 
		3.1285119 0.74429315 3.1927679 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74561012 3.1285119 0.74429315 3.1927679 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74561012 3.1285119 0.74429315 3.1927679 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74561012 3.1285119 0.74429315 3.1927679 0.13436636 
		2.233232e-016 0.58277857 0 0.32238182 1 0 0.76107544 0.15715949 1.047967e-016 
		0.4885377 0 0.31307328 0.97202027 0 1 0 0 0.27178642 1.2276698e-016 0.71267122 
		0.71767157 0.53739035 1 0 8.3671714e-017 0.46614817 0 1 0.5989449 0.76659405 
		0.91797101 0 7.9591702e-017 0.8103649 0 0.9163875 0.75268954 0.25141463 1 
		0.33544555 1.6182919e-016 0.77050048 0 0.26681954 1 0 0.61938041 0.22558425 
		9.5731939e-016 0.60282004 0 0.41681498 1 0 0.80104285 0 0 0.8423965 1.6636456e-016 
		0.72607493 1 0.038622901 0.92447764 0.74824405 3 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74824405 3 0.74297619 3.2570238 0.74297625 2.7429764 0.74297619 
		2.7429764 0.74297625 2.7429764 0.74297619 3.2570238 0.74824405 3 0.74297625 
		2.7429764 0.74297619 3.2570238 0.74824405 3 0.74297619 3.2570238 0.74297619 
		2.7429764 0.74297625 2.7429764 0.74297619 3.2570238 0.74824405 3 0.74297625 
		2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238;
	setAttr ".uvst[0].uvsp[1000:1249]" 0.74824405 3 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74297619 2.7429764 0.74297619 2.7429764 0.74297625 
		2.7429764 0.74297625 2.7429764 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74824405 3 0.74824405 3 0.74297625 2.7429764 0.74297625 2.7429764 0.74824405 
		3 0.74297619 3.2570238 0.74297619 3.2570238 0.74297625 2.7429764 0.74297625 
		2.7429764 0.74297619 3.2570238 0.74824405 3 0.74297619 2.7429764 0.74824405 
		3 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 2.7429764 0.74297625 
		2.7429764 0.74297619 3.2570238 0.74824405 3 0.74297625 2.7429764 0 0 0.66123182 
		4.3884319e-016 1 0.59265137 0.032422137 0.79232848 0 0 0.89782268 0 1 0.96095747 
		0.13180251 0.86082703 0 2.1586195e-016 1 0 0.86046278 0.76656914 0.085802749 
		0.82464826 0.068813488 0 1 2.2684874e-016 0.82135975 0.73240423 0 0.77057487 
		0.098253503 0 1 0 0.61198151 0.91302657 0 0.7096743 0 5.8426967e-016 0.86474782 
		0 0.99999994 0.24130601 0.54096246 0.43504742 0 0 1 0 0.57799095 0.57613087 
		0.018354781 0.31114995 0.18053778 0 1 1.347156e-015 0.61769468 0.67525119 
		0 0.4396759 0.03163211 0 1 7.1440792e-016 0.84240222 0.60686082 0 0.65131998 
		0.2388849 1.6926918e-015 1 0 0.79117149 0.58494073 0 0.3770003 0 0 1 1.4876647e-015 
		0.90194625 0.30998003 0.22950543 0.23650829 0 0 0.87040371 8.5400472e-016 
		1 0.56593627 0.30396625 0.64240474 0 0 0.27303222 0.69103163 0.37351298 0.81146455 
		0 0 0.47010309 8.3338137e-016 0.73505151 0.8125 0.072509795 0.40811691 0.16428682 
		0.71243882 0.2340091 0.94362974 0 0.91468656 0.048691344 0 0.7501629 0 0.65165347 
		0.96681517 0 0.99999994 0 0 0.70683169 8.7827748e-017 0.83659422 0.97333437 
		0.11466651 0.99999994 0 0 0.11229642 0 0.37251386 0.89159334 0.20518848 1 
		0 0 0.14776972 0 0.28430262 0.97723186 0.0095973192 1 0.15521026 8.8693312e-016 
		0.2856093 0 0.24772348 1 0 0.95332485 0.35061362 0 0.53580523 4.0866838e-016 
		0.32081425 1 0 0.84915274 0.26072583 0 0.43672761 4.3539984e-016 0.32300708 
		1 0 0.97093558 0.049068648 0 0.18963541 0 0.26615822 0.99478155 0 1 0 3.773562e-016 
		0.13201581 0 0.37475517 0.94144249 0.13279247 1 0 3.9675299e-016 0.14130522 
		0 0.41939396 0.91978562 0.22074722 1 0.74702597 1.6229291 1 1.625 0.74702597 
		1.6229291 0.74322152 1.7415687 0.74322152 1.7415687 0.74702597 1.6229291 
		1 1.6607641 1 1.6740887 1 1.625 1 1.625 0 0 0.47010309 8.3338137e-016 0.47010309 
		8.3338137e-016 0 0 0.67097414 0.22236779 0.63541466 0.18300281 0.48040327 
		0.78291887 0.48040327 0.78291887 0.053362288 0.68496644 0.96332639 0 0.4816632 
		1.0765848e-016 0.092416197 0 0 0.3248148 0 0 0.44123566 5.3282836e-017 0 
		0 0.28531471 0 0 0 0.43917164 0 0 1.1484521e-016 0.9076544 0 0 0 0.63349724 
		2.0875609e-016 0.74702597 1.6229291 1 1.625 0.83095586 0.39947036 0.67097414 
		0.22236779 0.99999994 0.58660507 0.99999994 0.58660507 0.63541466 0.18300281 
		0.91547793 1.0512863 0.83095586 0.39947036 1 1.75 1 1.75 1 1.6740887 1 1.6607641 
		1 1.7031024 0.91547793 1.0512863 0.13092718 0 0.8070299 1.2106356e-016 1.722023 
		0.88721114 0.68976861 0.99999994 1.71875 0.96875 0.74322152 1.7415687 0.48040327 
		0.78291887 0 0 0.47010309 8.3338137e-016 0.70653367 0.26173276 0.70653367 
		0.26173276 0.99999994 0.58660507 1 1.75 1 1.6826303 1 1.6826303 0.4796463 
		1.8351477e-016 1 0.45508727 0 2.1531695e-016 1 1.7031024 0.99999994 0.58660507 
		1 1.75 0 1.2896863e-016 0.19981711 0 0.8289153 1.9238743e-016 0.052571904 
		5.5434118e-017 0.88412327 0 0.12132867 1.3162962e-016 0.83711427 0 0 0 0 
		6.8536766e-016 0.56990856 0 0.57306898 0.9343555 0.15563092 1 0.18131892 
		0 1 3.1853476e-016 0.7747038 0.89996111 0 0.75510961 0.34862489 0 0.83483624 
		9.6736838e-016 0.11475272 0.11825415 0.15198313 0.32120237 0.93520188 0.28296813 
		0.46668583 6.4484314e-017 0.17916366 0.094250076 0.97548658 0.077495009 0.067265302 
		0.2708444 0.92955625 0.22269574 0.13694178 0.14112025 0.12259504 0.25909334 
		0.92610955 0.2432628 0.38030329 0.27901727 0.26781708 0.11877877 0.75051033 
		0.088148519 0.7280035 0.20195203 0.49648196 0.17812395 0.50537843 0.099756479 
		0.65715933 9.7763272e-016 1.1729012 0.50445384 1.2174524 0.64365005 1.279982 
		0.61474663 0.434304 1.2580869e-015 1.3225718 0.50420219 0.4870683 0.50501448 
		-0.41465998 0.25526562 -0.19882077 0.25547317 0.70989698 0.28899649 -0.14755803 
		0.25395775 0.58387196 0.27522683 0.45552245 6.7766463e-016 1.1211966 0.50401348 
		1.1693245 0.5738318 1.1710256 0.78094894 0.82019109 0.75962251 0.96669906 
		0.77247149 1.0273572 0.95610857;
	setAttr ".uvst[0].uvsp[1250:1499]" 0.79005492 0.93545777 0.96669906 
		0.77247149 0.82019109 0.75962251 0.79005492 0.93545777 1.0273572 0.95610857 
		1 0.41323131 0.83786482 0 0.97548658 0.077495009 0.17916366 0.094250076 0.26781708 
		0.11877877 0.38030329 0.27901727 0.067265302 0.2708444 0.92955625 0.22269574 
		0.7280035 0.20195203 0.49648196 0.17812395 0.13694178 0.14112025 0.12259504 
		0.25909334 0.62457836 0.24920344 0.75051033 0.088148519 0.50537843 0.099756479 
		0.15198313 0.32120237 0.11475271 0.11825415 0.12259504 0.25909334 0.62457836 
		0.24920344 0.17916366 0.094250076 0.26781708 0.11877877 0.38030329 0.27901727 
		0.067265302 0.2708444 0.7280035 0.20195203 0.49648196 0.17812395 0.92955625 
		0.22269574 0.13694178 0.14112025 0.75051033 0.088148519 0.97548658 0.077495009 
		0.50537843 0.099756479 0.11475271 0.11825415 0.15198313 0.32120237 0.51877499 
		0.30329677 0.50262994 0.30408493 0 1.9530589e-015 0.4205828 0 0.82243186 
		0.41612065 0.67382699 1 0.068300553 0 0.76536214 2.4067245e-015 0.42580587 
		0.99999994 0 0.77523518 0.44517356 0 0.99999994 3.0241821e-015 0.36137739 
		0.78603983 0 0.43133283 0 0.44527388 0.99999994 0.44527388 0.99128634 0 0.020046975 
		0.0010502259 0.16843034 3.1212148e-015 1 0 0.99770808 0.41933629 0 0.35092124 
		1 4.3700238e-015 0.81357569 0.34418222 0.74893373 0.4990595 0.74110025 0.75268608 
		0.82019109 0.75962251 0.96669906 0.77247149 1.0297713 0.77800304 1.00439 
		0.50301862 1.504746 0.75153041 1.4666886 0.75783014 1.4611382 0.90943593 
		1.502373 0.8757652 1.0273572 0.95610857 1.0625 1.0625 1.006057 1.4576008 
		0.75414503 1.4486049 0.75083047 1.5042896 1 1.5 1.5497947 0.66254443 1.6020851 
		0.74146563 1.7283975 0.72840494 1.7445784 0.50002193 1.1729012 0.50445384 
		1.2174524 0.64365005 1.279982 0.61474663 1.2608137 0.50520259 1.3225718 0.50420219 
		1.2917826 0.93923348 1.2859821 0.98990858 0.77400279 1.0291167 0.76342225 
		1.292748 1.0405465 1.2161741 1.2620037 0.78284627 1.1710256 0.78094894 1.2161741 
		1.0405465 1.30957 0.78383827 1.2064443 0.91969395 1.375124 0.77298701 0.75809634 
		1.3822235 1.03125 1.28125 0.98820102 1.1934795 0.85619724 1.2820327 0.76022792 
		1.3464127 1.0097256 1.2373648 1.1421001 1.0589143 1.2064443 0.91969395 0.98820102 
		1.1934795 1.6598015 0.97717118 1.6464056 0.90458155 1.5962431 0.9161045 1.609375 
		0.984375 1.4576008 1.006057 1.5 1 1.28125 1.03125 1.5025697 0.59126836 1.501348 
		0.50130612 1.1347618 1.0962542 1.03125 1.28125 0.85619724 1.2820327 0.98820102 
		1.1934795 1.2064443 0.91969395 1.1347618 1.0962542 1.077756 1.1981347 1.077756 
		1.1981347 1.03125 1.28125 0.85619724 1.2820327 1.1347618 1.0962542 1.077756 
		1.1981347 0.25175595 2.5 0 2.5 0 2.25 0.25702375 2.2570236 0.25298193 3.4965014 
		0 3.5 0 3.25 0.25702375 3.2570238 -0.50064611 0.25369418 -0.5 0 -0.25 0 -0.27693993 
		0.25778252 -0.41465998 0.25526562 -0.0034136903 0.24969655 0 0 0.25 0 0.24963041 
		0.23978987 0 2 0.25172529 1.999824 0.5 1.999912 0.5 2.251756 0.5 2.5 0 3 
		0.25175595 3 0.37851188 3.2543898 -0.96875 0.28125 -0.9375 0.0625 -0.71875 
		0.03125 -0.72822917 0.27177078 0 2.75 0.25702375 2.7429762 0.5 2.748244 0.28125 
		3.96875 0.0625 3.9375 0.03125 3.71875 0.26683167 3.7149878 -0.14755803 0.25395775 
		-0.19882077 0.25547317 0.03163211 0 1 7.1440792e-016 0.84240222 0.60686082 
		0 0.65131998 0.434304 1.2580869e-015 0.26781708 0.11877877 0.17916366 0.094250076 
		0.2388849 1.6926918e-015 0.97548658 0.077495009 0.75051033 0.088148519 0.65715933 
		9.7763272e-016 1 1.4876647e-015 0.15198313 0.32120237 0.93520188 0.28296813 
		1 0.56593627 0.30396625 0.64240474 0 0 0.27303222 0.69103163 0.37351298 0.81146455 
		0 0 0.47010309 8.3338137e-016 0.73505151 0.8125 0.072509795 0.40811691 0.16428682 
		0.71243882 0.2340091 0.94362974 0 0.91468656 0.048691344 0 0.7501629 0 0.65165347 
		0.96681517 0 0.99999994 0 0 0.70683169 8.7827748e-017 0.83659422 0.97333437 
		0.11466651 0.99999994 0.74702597 1.6229291 1 1.625 0.74702597 1.6229291 0.74322152 
		1.7415687 0.74322152 1.7415687 0.74702597 1.6229291 1 1.6607641 1 1.6740887 
		1 1.625 1 1.625 0 0 0.47010309 8.3338137e-016 0.47010309 8.3338137e-016 0 
		0 0.67097414 0.22236779 0.63541466 0.18300281 0.48040327 0.78291887 0.48040327 
		0.78291887 0.053362288 0.68496644 0.96332639 0 0.4816632 1.0765848e-016 0.092416197 
		0 0 0.3248148 0 0 0.44123566 5.3282836e-017 0 0 0.28531471 0 0 0 0.43917164 
		0 0 1.1484521e-016 0.9076544 0 0 0 0.63349724 2.0875609e-016 0.74702597 1.6229291 
		1 1.625 0.83095586 0.39947036 0.67097414 0.22236779 0.99999994 0.58660507 
		0.99999994 0.58660507 0.63541466 0.18300281 0.91547793 1.0512863 0.83095586 
		0.39947036 1 1.75 1 1.75 1 1.6740887 1 1.6607641 1 1.7031024 0.91547793 1.0512863 
		0.13092718 0 0.8070299 1.2106356e-016 1.722023 0.88721114;
	setAttr ".uvst[0].uvsp[1500:1749]" 0.68976861 0.99999994 1.71875 0.96875 
		0.74322152 1.7415687 0.48040327 0.78291887 0 0 0.47010309 8.3338137e-016 
		0.70653367 0.26173276 0.70653367 0.26173276 0.99999994 0.58660507 1 1.75 
		1 1.6826303 1 1.6826303 0.4796463 1.8351477e-016 1 0.45508727 0 2.1531695e-016 
		1 1.7031024 0.99999994 0.58660507 1 1.75 0.13694178 0.14112025 0.49648196 
		0.17812395 0.58387196 0.27522683 0.22950543 0.23650829 0 0 0.87040371 8.5400472e-016 
		0.92610955 0.2432628 0.12259504 0.25909334 0.51877499 0.30329677 0.50537843 
		0.099756479 0.75051033 0.088148519 0.50537843 0.099756479 0.97548658 0.077495009 
		0.11475272 0.11825415 0.11475271 0.11825415 0.45552245 6.7766463e-016 1.1211966 
		0.50401348 1.1693245 0.5738318 0.38030329 0.27901727 0.4870683 0.50501448 
		1 0 0.79117149 0.58494073 0 0.3770003 0.067265302 0.2708444 0.70989698 0.28899649 
		0.7280035 0.20195203 0.92955625 0.22269574 0.90194625 0.30998003 0 0 0.79005492 
		0.93545777 0.96669906 0.77247149 0.82019109 0.75962251 0.79005492 0.93545777 
		1.0273572 0.95610857 0.34862489 0 0.83483624 9.6736838e-016 0 1.2896863e-016 
		0.46668583 6.4484314e-017 0.19981711 0 0.8289153 1.9238743e-016 0.052571904 
		5.5434118e-017 0.88412327 0 0.12132867 1.3162962e-016 0.83711427 0 0 0 1 
		0.41323131 0.83786482 0 0.26781708 0.11877877 0.17916366 0.094250076 0.38030329 
		0.27901727 0.067265302 0.2708444 0.7280035 0.20195203 0.92955625 0.22269574 
		0.49648196 0.17812395 0.13694178 0.14112025 0.62457836 0.24920344 0.12259504 
		0.25909334 0.62457836 0.24920344 0.12259504 0.25909334 0.26781708 0.11877877 
		0.17916366 0.094250076 0.38030329 0.27901727 0.067265302 0.2708444 0.49648196 
		0.17812395 0.7280035 0.20195203 0.92955625 0.22269574 0.13694178 0.14112025 
		0.97548658 0.077495009 0.75051033 0.088148519 0.50537843 0.099756479 0.11475271 
		0.11825415 0.50262994 0.30408493 0.15198313 0.32120237 0.15198313 0.32120237 
		0 1.9530589e-015 0.4205828 0 0.82243186 0.41612065 0.67382699 1 0.068300553 
		0 0.76536214 2.4067245e-015 0.42580587 0.99999994 0 0.77523518 0.44517356 
		0 0.99999994 3.0241821e-015 0.36137739 0.78603983 0 0.43133283 0 0.44527388 
		0.99999994 0.44527388 0.99128634 0 0.020046975 0.0010502259 0.16843034 3.1212148e-015 
		1 0 0.99770808 0.41933629 0 0.35092124 1 4.3700238e-015 0.81357569 0.34418222 
		0.095387898 7.0835687e-016 1 0 0.81297863 0.81138009 0 0.84899801 0 0 0.996346 
		1.0795782e-015 1 0.66100937 0.081743866 0.64895439 0.56634259 0 0.66158545 
		0.91712159 0 0 0.74777281 3.0229914 0.74798059 3.0128536 0.74372905 3.2202897 
		0.74335265 3.2386568 0.74420112 3.1972594 0.74526715 3.1452453 0.74824405 
		3 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 0.74561012 2.8714881 
		0.74297625 2.7429764 0.74527162 2.85497 0.74824405 3 0.74297625 2.7429764 
		0.74297625 2.7429764 0.74824405 3 0.74824405 3 0.74824405 3 0.74824405 3 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74297625 2.7429764 0.74297625 2.7429764 0.74297625 2.7429764 
		0.74297619 2.7429764 0.74824405 3 0.74297619 2.7429764 0.74824405 3 0.74798059 
		3.0128536 0.74297619 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74297625 2.7429764 0.74297625 2.7429764 0.74297619 3.2570238 
		0.74372905 3.2202897 0.74335265 3.2386568 0.74297619 3.2570238 0.74824405 
		3 0.74297625 2.7429764 0.74725783 3.0481176 0.74731886 3.0451422 0.74648392 
		3.0858788 0.74526715 3.1452453 0.74824405 3 0.74824405 3 0.74824405 3 0.74824405 
		3 0.74297625 2.7429764 0.74561012 2.8714881 0.74824405 3 0.74527162 2.85497 
		0.74532861 2.8577507 0.74297619 3.2570238 0.7446239 3.1766295 0.74452561 
		3.1814237 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74297619 
		3.2570238 0.74824405 3 0.74297625 2.7429764 0.74297625 2.7429764 0.74297625 
		2.7429764 0.74540603 2.8615294 0.74297625 2.7429764 0.74297619 3.2570238 
		0.74297625 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74410224 3.202085 
		0.74561012 3.1285119 0.74297619 3.2570238 0.74621189 3.0991502 0.74297619 
		3.2570238 0.74420112 3.1972594 0.74297625 2.7429764 0.74561012 2.8714881 
		0.74824405 3 0.74824405 3 0.74824405 3 0.74527162 2.85497 0.74297625 2.7429764 
		0.74297625 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74297625 2.7429764 0.74532861 
		2.8577507 0.74824405 3 0.74824405 3 0.74824405 3 0.74540603 2.8615294 0.74297625 
		2.7429764 0.74561012 3.1285119 0.74713182 3.0542653 0.74713182 3.0542653 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74448192 3.1835558 0.74448192 
		3.1835558 0.74561012 3.1285119 0.74713182 3.0542653 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74448192 3.1835558 0.74561012 3.1285119 0.74713182 
		3.0542653 0.74297619 3.2570238 0.74448192 3.1835558 0.74824405 3 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74824405 
		3 0.74297625 2.7429764 0.74561012 2.8714881;
	setAttr ".uvst[0].uvsp[1750:1860]" 0.74824405 3 0.74824405 3 0.74824405 
		3 0.74527162 2.85497 0.74297625 2.7429764 0.74297625 2.7429764 0.74297625 
		2.7429764 0.74532861 2.8577507 0.74824405 3 0.74824405 3 0.74540603 2.8615294 
		0.74297625 2.7429764 0.74824405 3 0.74297619 3.2570238 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74297625 2.7429764 0.74561012 
		2.8714881 0.74824405 3 0.74824405 3 0.74824405 3 0.74527162 2.85497 0.74297625 
		2.7429764 0.74297625 2.7429764 0.74297625 2.7429764 0.74532861 2.8577507 
		0.74824405 3 0.74824405 3 0.74540603 2.8615294 0.74297625 2.7429764 0.74824405 
		3 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 3 0.74561012 2.8714881 
		0.74824405 3 0.74527162 2.85497 0.74297625 2.7429764 0.74297625 2.7429764 
		0.74824405 3 0.74824405 3 0.74297625 2.7429764 0.74297619 3.2570238 0.74824405 
		3 0.74297619 3.2570238 0.74824405 3 0.74824405 3 0.74561012 2.8714881 0.74527162 
		2.85497 0.74297631 2.7429764 0.74824405 3 0.74297625 2.7429764 0.74824405 
		3 0.74297631 2.7429764 0.74297619 3.2570238 0.74824405 3 0.74297619 3.2570238 
		0.74824405 3 0.74824405 3 0.74561012 2.8714881 0.74527162 2.85497 0.74297631 
		2.7429764 0.74297619 2.7429764 0.74824405 3 0.74824405 3 0.74297631 2.7429764 
		0.74780178 3.0215769 0.74725783 3.0481176 0.74561012 3.1285119 0.74685979 
		3.0675387 0.74725783 3.0481176 0.7446239 3.1766295 0.74297619 3.2570238 0.74561012 
		3.1285119 0.74777281 3.0229914 0.74297619 3.2570238 0.25702375 2.7429762 
		0.25702375 2.7429762 0.25702375 2.7429762 0.74297619 3.2570238 0.74297619 
		3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.25702375 3.2570238 
		0.74824405 3 0.74824405 3 0.25175595 3 0.74824405 3 0.25702375 3.2570238 
		0.25175595 3 0.74824405 3 0.25702375 3.2570238 0.25702375 3.2570238 0.5 3.251756 
		0.25702375 3.2570238 0.5 3.251756 0.5 3.251756 0.5 3.251756 0.25702375 3.2570238 
		0.25175595 3 0.25702375 3.2570238 0.25175595 3 0.25175595 3 0.74297619 3.2570238 
		0.74297619 3.2570238 0.74297619 3.2570238 0.74297619 3.2570238 0.74824405 
		3 0.74824405 3;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 1435 ".vt";
	setAttr ".vt[0:165]"  0 152.97498 -3.8876569 0 141.35088 -10.504704 
		0 147.71324 -7.7440381 4.8541083 129.08458 2.6096082 6.1773281 130.49411 
		-2.4014754 0 133.71526 -13.228438 2.5547371 128.03235 4.2714605 0 154.67982 
		3.5520692 -74.791733 114.79222 -1.2438504 -73.089767 113.24188 2.4331846 
		-72.029083 110.01485 2.231683 -76.874222 116.36679 -4.4622083 -77.899162 
		113.62554 -7.5359354 -76.624275 108.36551 -9.6687393 -77.416786 111.20892 
		-10.356801 -65.236755 112.75995 -5.6186304 -64.539253 111.67153 -4.2328243 
		-64.300545 109.39577 -3.8553479 -66.318192 113.22448 -7.8588943 -67.135414 
		111.69843 -9.6428404 -64.739586 107.61963 -4.8641996 -66.126015 108.11353 
		-7.7280326 -67.316277 109.0766 -10.158152 -72.48954 114.58453 -2.0787642 
		-71.206352 112.78785 1.6478045 -69.219948 110.13458 0.77127373 -74.101524 
		115.69585 -5.7386532 -75.877724 113.81649 -8.1917343 -73.812805 108.03961 
		-10.217193 -75.489021 111.19322 -10.498861 -76.18 113.44901 -0.51414287 -74.651459 
		112.87199 2.534858 -74.533638 109.80623 1.6523628 -76.283813 111.01376 -1.2955828 
		-76.987038 114.14278 -1.5728889 -78.473137 115.77116 -3.6664112 -77.408844 
		111.58258 -3.345439 -78.553505 113.18238 -5.5832777 -77.435448 110.58165 
		-5.558938 -78.73568 112.30346 -6.9454603 -77.906914 108.58212 -7.7578559 
		-79.073639 110.7987 -9.0454597 -67.377388 105.99253 -3.0953557 -69.727882 
		108.33578 1.9455574 -77.642685 115.19176 -2.2522616 -78.747261 114.45476 
		-5.0066133 -78.455666 109.44858 -8.9364996 -78.01947 111.88145 -5.8079786 
		-77.909874 112.00335 -4.7490153 -76.703979 112.81616 -1.7256558 -76.184814 
		112.40579 -1.31433 -74.592545 111.14679 2.8543794 -72.822144 109.00316 0.96236241 
		-71.368851 107.87057 0.84059918 -70.524918 106.37771 -2.0292196 -68.432396 
		106.57087 1.8528085 -68.819511 104.82169 -0.70730704 -70.59494 106.89516 
		-3.4245362 -70.729195 107.21579 -5.5191393 -67.359596 107.40562 0.55151725 
		-67.106331 108.48857 -0.099304974 -76.546364 113.96211 -0.96697748 -78.653023 
		112.76717 -6.6546726 -81.337555 115.515 -0.36337751 -81.884262 116.03521 
		-1.7767893 -80.868195 114.4856 0.11720586 -80.627502 113.35755 -0.012694865 
		-81.226868 112.30862 -1.3900273 -81.652901 112.6664 -2.5835142 -82.200195 
		113.66895 -3.2929032 -82.369995 114.82613 -2.9378588 -79.422981 113.52298 
		1.2439271 -77.997025 112.98469 4.0882912 -78.052917 111.5359 4.2503858 -78.002876 
		110.39693 3.2291374 -79.489845 111.42287 0.72452652 -79.405731 112.60556 
		0.70859873 -82.143051 111.41535 -4.9915857 -82.755463 111.7762 -5.9642262 
		-81.495674 110.2344 -4.4082222 -81.898819 108.52463 -6.2884774 -82.516029 
		109.26553 -7.4962568 -83.044449 110.48951 -7.7598987 -71.626648 107.2961 
		1.3178601 -69.507278 105.52549 2.0207782 -69.385445 104.56842 1.1098042 -69.498566 
		104.65129 -0.25228637 -70.747284 106.15295 -1.1833253 -72.310837 106.34975 
		1.5002787 -70.828598 105.24045 2.5044539 -70.38517 103.79287 1.766018 -70.780144 
		103.82206 0.31063908 -72.059341 105.23846 -0.39978313 -73.587936 106.02371 
		2.1290674 -71.800003 104.73813 3.1898091 -71.583115 103.38763 1.863431 -71.634315 
		103.01146 0.30209714 -73.518112 104.88998 -0.1118819 -80.370827 113.36465 
		1.6376616 -78.94487 112.82636 4.4820256 -78.916153 111.3917 4.608974 -78.866112 
		110.25274 3.5877261 -80.353081 111.27868 1.0831151 -80.268967 112.46136 1.0671873 
		-82.258057 115.2817 0.059834361 -83.216843 115.69747 -1.1641141 -81.705597 
		114.27336 0.50221342 -81.464905 113.14532 0.37231266 -82.06427 112.09638 
		-1.0050199 -82.490303 112.45417 -2.1985068 -83.037598 113.45672 -2.9078958 
		-83.290497 114.59283 -2.5146472 -82.994125 111.1032 -4.4874597 -83.606537 
		111.53355 -5.6305709 -82.346748 109.99175 -4.0745668 -82.749893 108.28198 
		-5.954823 -83.367104 109.02288 -7.1626024 -83.895523 110.24686 -7.4262433 
		-82.134506 112.90723 2.5776014 -80.899071 112.42097 5.0174575 -80.865402 
		111.08871 5.3031459 -80.805382 110.07829 4.3576255 -82.225044 111.04649 1.9918332 
		-82.132584 112.11832 1.9514308 -84.119568 114.55154 0.67873824 -84.65139 
		114.96364 -0.45278001 -83.393265 113.7296 1.2361379 -83.360703 112.70724 
		1.1378065 -83.700851 111.78005 -0.12381232 -84.332008 112.13226 -1.2513132 
		-84.848633 113.05848 -1.9360635 -85.00943 114.03036 -1.4977844 -84.881134 
		110.43858 -3.8640504 -85.466324 110.78965 -4.7743673 -84.261086 109.41474 
		-3.4571781 -84.649307 107.89339 -5.1623435 -85.230568 108.59988 -6.303421 
		-85.737762 109.65567 -6.414216 -83.432533 112.56936 3.3690643 -82.346924 
		112.16939 5.4829535 -81.651611 110.37346 4.1546655 -82.69046 111.06097 2.476397 
		-85.590225 114.232 1.0734659 -84.264633 112.48415 0.67206615 -84.808296 112.12207 
		-0.68391865 -86.363098 113.7227 -0.84205282 -86.994713 110.36491 -4.497314 
		-84.933319 109.2306 -3.583559 -85.303429 107.8298 -4.8627071 -87.031601 109.14122 
		-5.8584113 -92.046921 106.9205 7.1558137 -91.673607 106.78153 7.7947512 -91.225159 
		106.60927 7.3666439 -91.478622 106.66109 6.9388819 -95.239052 107.60455 5.0327225 
		-94.796066 107.36474 4.8104801 -94.915024 107.30877 4.4144678 -95.402916 
		107.51373 4.4177809 -95.362778 104.18887 0.92097199 -94.884377 104.17788 
		0.81639111 -94.900032 104.10009 0.47226635 -95.451759 103.97181 0.50700396 
		-84.956604 111.82178 4.1357546 -84.174858 111.43006 5.8904471 -84.006592 
		109.98055 5.0582743 -84.611893 110.48114 3.8744705;
	setAttr ".vt[166:331]" -88.263367 109.72414 5.54424 -87.551117 109.51335 
		6.7478456 -87.252731 108.63821 6.0948558 -87.797211 108.91013 5.337657 -87.417519 
		113.44227 1.839148 -86.895912 112.06947 1.6393723 -87.3853 111.77023 0.72611898 
		-88.214333 112.92938 0.33506644 -91.379501 110.81389 3.3991683 -90.700607 
		109.98173 3.1242235 -91.168411 109.72086 2.4615526 -91.871765 110.39171 2.2880211 
		-92.468781 106.94492 -1.4667045 -91.845673 106.40867 -1.151695 -92.02282 
		105.94123 -1.7677941 -92.685951 106.37772 -2.2170198 -89.395584 109.08601 
		-3.3726203 -88.669846 107.99197 -2.6088872 -88.843933 107.17157 -3.6190031 
		-89.619522 108.20543 -4.538527 -73.323822 103.16782 3.1452703 -74.486115 
		104.12564 2.4939113 -74.327591 103.4171 1.1335825 -73.461433 102.21737 1.3600544 
		-76.644539 103.00781 2.8688695 -76.582947 102.72359 2.3127031 -76.487534 
		102.78728 2.9461508 -76.481941 102.4658 2.4522893 -74.255074 103.78468 0.33840647 
		-74.39402 105.00141 2.5325592 -72.496643 103.85099 3.2405789 -72.397003 102.56375 
		0.87731755 -74.654861 108.6069 -4.000638 -4.4872122 139.0843 26.853399 -6.291894 
		135.46892 27.677851 -7.8925605 151.41632 12.889518 -12.550837 139.66951 9.4838963 
		-10.415229 138.15262 17.155539 -2.9658928 135.49576 30.533983 -1.6776959 
		137.81291 29.151377 -5.6108928 136.74796 28.104263 -2.8296988 140.22482 28.173389 
		-3.0124376 142.63345 22.077658 -4.9663591 148.63199 17.371124 -5.1193738 
		152.05272 13.125995 -6.6064858 153.63789 3.8742871 -9.9609594 150.62767 5.1296201 
		-12.341394 141.03937 4.4244967 -11.55336 145.48163 5.7986917 -11.338303 146.83171 
		12.76306 -10.584285 141.59605 16.228022 -4.1606698 150.90337 16.528099 -6.7253666 
		150.54233 16.437717 -11.212621 146.08432 15.447701 -3.3600156 148.58517 18.133774 
		-5.6893053 141.56265 22.155062 -8.6693907 141.67804 18.551785 -10.200638 
		145.47572 16.712418 -2.8471432 145.20879 20.319328 -4.1877661 143.32423 19.255644 
		-9.2979221 143.60098 17.835163 -3.5435176 146.04855 18.246441 -10.286018 
		150.15126 12.351683 -10.845079 149.84689 10.235594 -11.363921 146.26697 10.59413 
		-9.8147554 149.47757 16.118959 -8.6243172 148.16399 17.481581 -11.549643 
		142.14328 13.034965 -12.010179 143.03456 8.8629026 -11.125247 143.25365 15.335634 
		-4.0332274 146.44164 16.369473 -5.1161451 147.90225 16.753397 -4.3615751 
		143.6799 18.357939 -8.5269718 143.88893 17.182051 -9.879159 145.40669 16.22611 
		-8.5198507 147.63655 16.881001 -4.3208566 146.26721 18.187122 -5.4300246 
		147.58038 17.898224 -4.9099298 144.60765 18.655184 -8.2983313 144.57817 17.960726 
		-9.3763056 145.52809 17.330851 -8.4317179 147.26385 17.711504 -8.4077854 
		146.11414 18.117722 -5.148056 146.19745 18.458458 -19.833273 118.41793 -6.7779355 
		-19.210724 114.16377 -1.9746397 -18.457743 108.89755 -2.5708957 -19.481306 
		118.0881 -13.275379 -18.504606 113.12959 -17.509403 -18.433363 104.93954 
		-4.9032059 -17.718273 105.52504 -11.632336 -18.691711 107.56798 -17.353037 
		-26.368208 115.29864 -7.7343173 -24.457968 112.82092 -4.1145339 -21.66573 
		107.59972 -3.2726126 -25.500978 115.36056 -11.842219 -22.156872 112.87254 
		-15.60348 -21.74753 105.04171 -5.3834906 -23.060862 106.62009 -11.473749 
		-22.195648 107.83894 -16.651321 -39.903553 114.13838 -9.2036896 -40.085148 
		112.25018 -6.9436016 -40.146931 108.92051 -6.3019934 -39.621658 114.52229 
		-12.832686 -39.408287 111.98733 -15.699054 -40.032108 106.32182 -7.9106421 
		-39.670738 106.6751 -12.551885 -39.360615 108.45352 -16.497591 -35.598396 
		114.87371 -8.2633858 -36.096317 113.18597 -4.1145349 -36.469776 107.89398 
		-3.2726128 -30.279343 116.22464 -13.216799 -30.531387 113.61578 -17.34906 
		-34.492546 104.45379 -5.3834901 -29.288721 104.81583 -12.384996 -31.286842 
		107.83894 -19.184978 -48.263382 114.90456 -7.7416658 -48.92255 113.02478 
		-5.0245309 -48.834328 108.75835 -4.313632 -48.474758 115.42865 -11.549608 
		-49.145699 113.12075 -15.616472 -48.926365 105.12452 -6.0960073 -49.03981 
		104.85596 -12.358818 -49.529671 108.24094 -17.007658 -40.96315 114.24016 
		-9.0174217 -41.180126 112.25018 -6.3019934 -41.180126 108.89458 -6.3019934 
		-40.626633 114.52229 -12.719256 -40.914745 112.48215 -16.143179 -41.180126 
		106.32182 -7.9106421 -42.064663 105.86542 -13.564102 -40.914745 108.80009 
		-17.615707 -6.5864534 129.74812 22.739908 -11.391079 149.05122 -0.18220139 
		-8.5627174 131.45444 -1.0226058 -9.8552418 141.03897 -3.0971129 -9.7219887 
		128.88597 11.613918 -3.1509542 130.34383 29.011917 -6.5076084 130.85048 26.258787 
		-3.6253927 128.09979 25.123009 -4.8541088 146.90007 -6.8117518 -10.63252 
		145.99933 -0.94042575 -9.0013046 152.30225 -1.1476619 -5.1729574 141.21046 
		-9.6312647 -4.8541083 129.08458 2.6096082 -9.42068 131.77853 5.1322637 -6.1773281 
		130.49411 -2.4014754 -5.1209846 127.45899 11.43322 -10.679947 135.60555 4.9376583 
		-9.42068 135.74109 -2.4014754 -10.96707 134.02147 12.100928 -4.8541088 134.0562 
		-10.008867 -4.0123329 126.94302 18.573978 -8.3224049 129.20407 17.107294 
		-8.7520933 131.77829 16.924994 -7.2245024e-007 128.24008 -15.526352 -6.8778811 
		124.77726 -4.2721047 -5.7361546 128.58102 -12.59476 6.8778811 124.77726 -4.2721014 
		5.6308389 124.24567 1.0386823 -5.6308384 124.24567 1.0386753 5.7361536 128.58104 
		-12.594758 9.9698127e-006 120.85573 -19.184309 -8.8156185 120.05966 -6.6576991 
		-6.8197422 121.22643 -15.581453 8.8156319 120.05966 -6.6576991;
	setAttr ".vt[332:497]" 6.6008062 116.23803 -0.33235368 -6.6007986 
		116.23803 -0.3323583 6.8197618 121.22647 -15.581457 1.6471866e-005 117.3954 
		-22.567644 -9.4945803 118.14954 -18.823105 9.143157 111.68625 1.5875853 -9.1431465 
		111.68627 1.5875853 9.4946127 118.14957 -18.823111 2.4635552e-005 113.36194 
		-25.884378 -13.245844 114.04137 -20.122692 13.906409 107.61803 -0.49301362 
		-13.906401 107.61803 -0.493016 13.245883 114.04141 -20.122696 -12.963057 
		117.60811 -6.403903 -13.231444 118.7438 -14.549872 12.963071 117.60815 -6.4038959 
		12.936855 114.64839 -0.68837714 -12.936846 114.64839 -0.6883899 13.231462 
		118.74384 -14.54987 3.1209849e-005 105.84656 -28.274883 -15.054815 104.00079 
		-13.139938 -12.20968 107.14314 -22.764135 15.054852 104.00079 -13.139938 
		12.212651 100.51901 -3.1334989 -12.212637 100.51901 -3.1334968 12.209736 
		107.1432 -22.764135 19.833273 118.41793 -6.7779355 19.210724 114.16377 -1.9746397 
		18.457743 108.89755 -2.5708957 19.481306 118.0881 -13.275379 18.504606 113.12959 
		-17.509403 18.433363 104.93954 -4.9032059 17.718273 105.52504 -11.632336 
		18.691711 107.56798 -17.353037 3.9888149e-005 98.46608 -30.254021 -12.049837 
		92.28907 -17.52228 -10.071976 96.655807 -26.231339 12.049887 92.289146 -17.522289 
		10.55855 90.766975 -9.3325071 -10.558526 90.767044 -9.3324909 10.072053 96.655876 
		-26.231342 4.2191092e-005 92.646271 -31.877539 -10.677096 90.863937 -19.106499 
		-9.1171198 92.518608 -27.242935 10.677151 90.863937 -19.10651 9.2569723 88.999847 
		-12.335395 -9.2569437 88.999847 -12.335377 9.1172028 92.518608 -27.242939 
		5.1844836e-005 86.788315 -32.952732 -8.8803854 85.088074 -23.501398 -7.4228964 
		85.686752 -29.177092 8.8804522 84.366508 -21.285526 6.9343085 83.102119 -16.622923 
		-6.9342761 83.102135 -16.622908 7.422998 85.686752 -29.177107 6.0405873e-005 
		82.707756 -33.861492 -8.6773176 79.914978 -24.613573 -7.1434064 79.935745 
		-29.861624 8.6773882 79.914978 -24.613605 6.8076515 79.529823 -18.192547 
		-6.8076315 79.529854 -18.192524 7.1435266 79.935814 -29.861643 7.3978903e-005 
		79.191162 -36.502556 -12.531934 73.864952 -24.481646 -9.8157282 76.683479 
		-30.574642 11.362503 75.51548 -25.215845 9.5117292 75.418221 -17.332382 -9.5117359 
		75.418282 -17.332354 9.8158741 76.68351 -30.574665 -12.909636 69.694115 -28.167763 
		-9.8808889 71.096619 -33.419464 12.056067 69.694214 -29.064228 9.8810568 
		71.096725 -33.419495 7.521177e-005 62.43972 -36.939457 -11.049785 63.33247 
		-29.514973 -7.542582 65.633125 -33.857376 -1.4900535e-005 60.529354 -18.798197 
		11.049865 63.477615 -31.297392 3.8675056 60.2463 -25.269373 -3.867532 60.246334 
		-25.269321 7.5427704 65.633179 -33.857418 4.3731667e-005 59.516327 -31.310911 
		6.5592969e-005 61.276463 -35.0326 -4.514164 60.395714 -30.426592 -3.9808302 
		61.976452 -33.563671 1.896478e-005 59.478386 -24.089895 4.5142488 60.395733 
		-30.426624 2.7839346 59.978653 -25.513147 -2.7838931 59.978687 -25.513109 
		3.9809625 61.976486 -33.563698 -0.10660693 76.631012 -40.089252 -5.0281644 
		74.330223 -37.281841 -5.3942432 69.883202 -38.10463 4.8696451 74.640518 -37.298428 
		5.3945022 70.192146 -38.074215 0.14865792 64.254448 -39.08334 -4.098105 65.671692 
		-38.067547 4.1701069 65.870201 -38.035038 -0.092621513 74.975349 -44.066006 
		-3.8768275 72.983406 -42.861759 -4.4355001 69.472885 -43.30674 3.7230144 
		73.166374 -42.902824 4.434093 69.67524 -43.312752 0.10502129 65.632454 -43.453098 
		-3.4633827 66.335304 -42.942719 3.5653508 66.505745 -42.92318 -0.10233162 
		73.412941 -61.212524 -3.51947 72.263466 -60.656296 -3.8028057 69.514603 -61.091812 
		3.3323693 72.376976 -60.691391 3.7794847 69.641991 -61.097664 0.087501943 
		66.058746 -61.158817 -3.0621321 66.951981 -60.724346 3.1827903 67.068718 
		-60.707287 -0.11554536 72.7342 -76.826935 -3.1599638 71.798767 -76.349434 
		-3.3027136 69.522255 -76.76017 2.9393721 71.860298 -76.379547 3.2544973 69.593033 
		-76.765747 0.074351005 66.61335 -76.790482 -2.701839 67.340973 -76.405518 
		2.8223345 67.409637 -76.390877 -0.12540905 72.187462 -95.282928 -2.4954205 
		71.429977 -94.892487 -2.5386207 69.718178 -95.262245 2.2492316 71.438217 
		-94.915497 2.456665 69.72908 -95.26738 0.050446641 67.424797 -95.271606 -2.1181898 
		68.027641 -94.940704 2.2113318 68.040062 -94.930237 -0.12319439 71.958496 
		-114.00082 -1.6580572 71.254478 -113.67902 -1.6833377 69.986366 -114.006 
		1.413884 71.23304 -113.69431 1.5662169 69.962219 -114.01012 0.014923221 68.137421 
		-114.01003 -1.4342982 68.718491 -113.72274 1.4633595 68.693008 -113.71677 
		-0.1069001 71.013298 -134.5546 -0.81639665 71.018417 -134.2813 -0.062584706 
		70.04245 -135.13048 -0.78613883 70.203217 -134.56721 0.60419858 70.991806 
		-134.28897 0.65182799 70.171631 -134.56955 -0.027417419 69.361267 -134.57057 
		-0.74613345 69.383095 -134.31468 0.69126219 69.347939 -134.31239 4.5715814 
		110.47544 3.5278893 5.4137068 103.70332 1.9160125 5.1257763 97.302048 -1.5117311 
		4.4972696 92.67012 -5.2268925 4.6284924 89.51619 -9.992795 3.4671614 82.766472 
		-15.46876 3.4038298 77.093613 -16.761776 -4.5715704 110.47544 3.5278893 -5.4136992 
		103.70332 1.9160113 -5.1257634 97.302048 -1.5117311 -4.4972477 92.67012 -5.2268834 
		-4.6284657 89.51619 -9.9927855 -3.6471388 82.783913 -15.528673 -3.4038117 
		77.093613 -16.761768 -3.4812307 113.67749 2.4014766 3.48124 113.67749 2.4014788 
		3.3004048 116.51357 0.95656627 2.8154194 123.42029 2.1542709 -3.3003976 116.51357 
		0.95656395;
	setAttr ".vt[498:663]" -2.8154192 123.42029 2.1542673 -2.4270542 128.01839 
		4.3192186 12.483191 72.853043 -23.980135 10.407001 73.22905 -17.507069 12.793194 
		67.732895 -27.576517 3.5190613 68.380547 -13.840405 1.2291275 62.895607 -15.419675 
		4.495234 60.812271 -24.385679 11.173357 62.2915 -28.342922 1.0401073 60.90192 
		-18.513416 -3.5190723 68.380547 -13.840404 -10.407006 73.22905 -17.507042 
		-1.2291491 62.895615 -15.41967 -12.483128 72.853043 -23.980093 -12.793128 
		69.115273 -26.92168 -4.4952588 60.812294 -24.385632 -1.0401357 60.90192 -18.513416 
		-11.173285 63.51823 -28.342867 5.1649847 73.088448 -14.28822 -5.1649928 73.088524 
		-14.288204 20.915415 55.634155 -16.483746 19.598183 55.634136 -10.141005 
		18.30916 55.634151 -21.739594 11.480576 55.634151 -8.8422279 6.1763825 54.70359 
		-12.607394 7.1957188 53.888706 -22.328545 14.141793 54.284866 -24.348961 
		5.3031631 54.063923 -16.992516 15.516279 7.2527828 -27.101234 14.908537 6.8875833 
		-25.019112 14.991663 7.9389758 -29.680079 13.116598 6.8899145 -24.159342 
		11.572998 7.3748298 -25.080753 11.669372 8.4074421 -29.905714 14.259545 8.3592672 
		-30.32057 10.859639 7.9441152 -27.238512 21.451315 41.78651 -12.473291 20.725088 
		41.417252 -8.974514 19.964323 42.287548 -15.368532 17.180189 41.231651 -7.4261618 
		14.00083 41.292068 -8.7199564 13.733088 42.299614 -16.304539 17.93104 42.430443 
		-17.356527 12.07975 41.962212 -11.556684 20.564293 31.273201 -16.868486 19.348749 
		29.285416 -13.717628 19.91683 34.313416 -21.144148 16.118145 28.924494 -11.912108 
		13.841589 30.411158 -13.907557 10.239452 35.667286 -21.548744 16.467072 35.284355 
		-23.198385 9.1611557 33.839989 -17.059116 19.85969 41.063503 -15.465664 17.588236 
		41.146648 -17.293001 20.92795 40.030983 -12.580082 20.084951 36.40538 -10.084351 
		17.991522 36.188557 -9.2913799 15.098252 38.895378 -9.2051544 14.163417 41.133366 
		-15.999577 13.321167 40.379322 -12.223106 14.843917 15.937554 -19.301798 
		16.650249 16.004639 -20.154039 17.883286 16.856943 -22.377642 17.267935 18.298977 
		-25.558027 15.228215 18.916437 -26.831261 11.369332 19.016727 -25.766127 
		10.481419 18.126411 -22.037167 13.402877 16.595062 -20.077316 15.841829 5.6256127 
		-26.601946 15.036523 5.7777882 -23.310923 15.572044 5.1699886 -30.113817 
		13.023297 5.8592596 -22.134523 10.411973 5.7749157 -23.735506 10.695901 6.5591578 
		-30.663139 14.82308 6.5342336 -31.006636 10.037806 5.5519729 -26.499786 9.9389601 
		3.5156269 -24.41114 9.5447407 3.420733 -26.81983 13.828915 7.2249084 -31.640322 
		11.512646 7.2893262 -31.257942 14.092319 5.8214417 -33.039955 11.040421 5.7498107 
		-32.454308 14.077427 3.1806326 -34.206806 11.063823 2.7908299 -33.420216 
		15.567488 4.7450209 -31.325777 15.238036 3.0692124 -32.563927 9.3050432 4.9457707 
		-29.425028 9.0777216 3.523845 -29.898451 12.32132 4.0496058 -11.909279 16.965914 
		3.0711577 -12.52646 9.1015291 3.1067731 -15.86447 9.6342974 1.4754682 -25.554501 
		10.708077 -0.26461625 -28.667631 15.129141 -0.84193939 -28.064787 16.081099 
		-0.55420524 -25.930164 17.968607 2.1288147 -18.084312 16.950586 4.6966791 
		-22.262224 16.050465 4.2816558 -18.227938 16.681505 4.2233176 -28.708738 
		12.683332 4.3647761 -15.766751 10.164526 4.8573298 -20.279808 11.049692 1.3292825 
		-34.117989 14.293377 1.4912217 -34.854706 15.876226 1.4912217 -32.500702 
		16.39204 4.0243845 -29.975481 12.325714 -1.1754652 -5.9398875 17.18132 -1.1754652 
		-7.9749432 9.8244877 -1.1754652 -15.08447 9.8407059 -1.1754652 -18.885296 
		10.784952 -0.68404496 -22.069378 15.002629 -0.7292828 -23.051912 17.504023 
		-0.46642175 -22.096279 18.770151 -1.1754652 -17.818903 10.074771 1.1741961 
		-30.226618 11.992266 -0.98996705 -28.360397 12.88028 -0.90876567 -22.239946 
		17.886513 1.7451304 -21.979269 16.911739 1.8989416 -26.599058 16.423361 0.56517309 
		-30.982805 15.599192 0.46985424 -31.512411 10.420453 -0.16404197 -30.995901 
		10.030514 -0.00063452125 -29.898947 9.9082146 -0.10173692 -26.485996 20.334515 
		-1.1754652 -13.332276 20.676046 1.7692435 -13.917635 13.049121 -1.1754652 
		-18.78517 15.505791 -1.1754652 -18.578146 14.110805 0.64663213 -35.412811 
		11.037272 0.47015047 -34.676121 14.341365 -1.1754781 -33.886368 11.506392 
		-1.1754781 -33.369884 14.28367 -1.1754781 -30.570587 12.204002 -1.1754781 
		-30.493908 11.377405 3.544261 -8.5754232 7.4607205 3.545768 -13.033425 6.5267448 
		-0.7364704 -9.050333 11.381799 -0.7364704 -2.6060374 12.669602 3.4562972 
		-7.3515034 17.314192 3.4584999 -8.1699066 12.673993 -0.78812289 -2.8028815 
		17.529608 -0.78812289 -4.5504837 18.054735 2.0294125 -8.0999765 18.270153 
		-0.90968019 -6.6370926 20.856438 -0.90968019 -10.218763 21.114145 2.0350285 
		-10.948415 10.654385 2.6557863 -8.321414 8.0330849 2.6401618 -11.147474 7.4396939 
		0.047153715 -8.9323483 10.631725 0.096629359 -4.6188021 9.4068336 2.6219609 
		-4.5390635 7.2720938 2.5785136 -6.7244802 6.8066196 0.82164526 -5.4349999 
		9.374011 0.92053211 -1.9618696 8.4111471 2.9704545 -0.8308478 6.2219529 2.8925505 
		-2.7439687 6.6253901 1.1004786 -3.8136113 8.6199598 1.1447246 -0.6722486 
		7.2753377 2.475801 2.4434514 5.8341746 2.3866005 1.0523314 6.3528266 1.39057 
		-1.5646677 8.0791979 1.4104968 0.7445491 6.7192211 1.8206127 3.8820615 5.5288768 
		1.7679554 2.8721385 5.9642496 1.082162 1.0121053 7.3661561 1.173565 2.8426301 
		6.0774589 1.0007932 4.9290385;
	setAttr ".vt[664:829]" 5.4522152 0.95750034 4.3002596 5.8117642 0.75988114 
		2.9141145 6.5023499 0.77119064 4.0193892 13.282582 2.7146006 -6.7982545 16.724287 
		2.7193792 -7.2945361 13.292009 -0.054025967 -3.6810827 16.877447 -0.074158855 
		-5.0662799 13.862858 2.6574092 -2.6867023 16.834002 2.6092863 -3.1685882 
		14.113261 0.52367073 -1.3390505 16.597052 0.39439777 -2.3872471 14.388065 
		3.0645883 1.8210161 16.759087 3.0029531 1.6851376 14.462232 0.85226321 1.1946669 
		16.421495 0.8837055 0.22448204 14.783805 2.3103712 4.8647232 16.64465 2.2694614 
		4.8203382 14.866919 1.1705509 3.8454742 16.472237 1.2211729 3.2563848 15.132295 
		1.7956238 6.6097493 16.500834 1.7375306 6.6440244 15.107005 1.1061463 5.4610486 
		16.313902 1.0709943 4.981864 15.525613 0.99265242 8.2650089 16.276056 0.99140298 
		8.0584822 15.422005 0.83015954 6.8507032 16.05757 0.83809417 6.4063787 18.450583 
		1.4255804 -8.3305721 18.64094 -0.27001336 -7.2924023 20.490202 -0.29082894 
		-10.027292 20.711386 1.4198354 -10.265634 19.011181 1.4204797 -6.0986533 
		19.201538 -0.10869262 -5.8804188 21.016363 -0.01463609 -8.4122162 21.183558 
		1.4284528 -8.0336704 19.837912 1.6235217 -3.8902986 19.765099 0.035973076 
		-4.4981093 21.231848 0.148269 -6.3947687 21.761805 1.6142731 -5.3937292 20.453436 
		1.2010529 -1.8808674 20.158279 0.20813955 -3.2309189 21.445402 0.23985238 
		-4.8865666 21.90303 1.1936593 -2.8834388 20.915272 0.8001985 -0.69798404 
		20.695396 0.19184518 -2.1109025 21.568142 0.23193061 -3.1643448 22.073797 
		0.78604233 -1.4623734 21.315544 0.19903272 -0.21856374 21.164461 0.10334033 
		-1.2980917 21.500923 0.10057092 -1.6131771 21.822271 0.15074214 -0.62307346 
		21.270893 43.22554 -8.6412973 22.488686 43.500687 -12.097661 21.395226 43.882088 
		-16.191797 18.014601 43.713654 -18.036089 13.111824 43.566837 -17.408018 
		10.835929 43.494652 -12.845695 12.28778 43.022022 -9.8201857 16.554186 42.923729 
		-6.8578997 -20.915415 55.634155 -16.483746 -19.598183 55.634136 -10.141005 
		-18.30916 55.634151 -21.739594 -11.480576 55.634151 -8.8422279 -6.1763825 
		54.70359 -12.607394 -7.1957188 53.888706 -22.328545 -14.141793 54.284866 
		-24.348961 -5.3031631 54.063923 -16.992516 -15.516279 7.2527828 -27.101234 
		-14.908537 6.8875833 -25.019112 -14.991663 7.9389758 -29.680079 -13.116598 
		6.8899145 -24.159342 -11.572998 7.3748298 -25.080753 -11.669372 8.4074421 
		-29.905714 -14.259545 8.3592672 -30.32057 -10.859639 7.9441152 -27.238512 
		-21.451315 41.78651 -12.473291 -20.725088 41.417252 -8.974514 -19.964323 
		42.287548 -15.368532 -17.180189 41.231651 -7.4261618 -14.00083 41.292068 
		-8.7199564 -13.733088 42.299614 -16.304539 -17.93104 42.430443 -17.356527 
		-12.07975 41.962212 -11.556684 -20.564293 31.273201 -16.868486 -19.348749 
		29.285416 -13.717628 -19.91683 34.313416 -21.144148 -16.118145 28.924494 
		-11.912108 -13.841589 30.411158 -13.907557 -10.239452 35.667286 -21.548744 
		-16.467072 35.284355 -23.198385 -9.1611557 33.839989 -17.059116 -19.85969 
		41.063503 -15.465664 -17.588236 41.146648 -17.293001 -20.92795 40.030983 
		-12.580082 -20.084951 36.40538 -10.084351 -17.991522 36.188557 -9.2913799 
		-15.098252 38.895378 -9.2051544 -14.163417 41.133366 -15.999577 -13.321167 
		40.379322 -12.223106 -14.843917 15.937554 -19.301798 -16.650249 16.004639 
		-20.154039 -17.883286 16.856943 -22.377642 -17.267935 18.298977 -25.558027 
		-15.228215 18.916437 -26.831261 -11.369332 19.016727 -25.766127 -10.481419 
		18.126411 -22.037167 -13.402877 16.595062 -20.077316 -15.841829 5.6256127 
		-26.601946 -15.036523 5.7777882 -23.310923 -15.572044 5.1699886 -30.113817 
		-13.023297 5.8592596 -22.134523 -10.411973 5.7749157 -23.735506 -10.695901 
		6.5591578 -30.663139 -14.82308 6.5342336 -31.006636 -10.037806 5.5519729 
		-26.499786 -9.9389601 3.5156269 -24.41114 -9.5447407 3.420733 -26.81983 -13.828915 
		7.2249084 -31.640322 -11.512646 7.2893262 -31.257942 -14.092319 5.8214417 
		-33.039955 -11.040421 5.7498107 -32.454308 -14.077427 3.1806326 -34.206806 
		-11.063823 2.7908299 -33.420216 -15.567488 4.7450209 -31.325777 -15.238036 
		3.0692124 -32.563927 -9.3050432 4.9457707 -29.425028 -9.0777216 3.523845 
		-29.898451 -12.32132 4.0496058 -11.909279 -16.965914 3.0711577 -12.52646 
		-9.1015291 3.1067731 -15.86447 -9.6342974 1.4754682 -25.554501 -10.708077 
		-0.26461625 -28.667631 -15.129141 -0.84193939 -28.064787 -16.081099 -0.55420524 
		-25.930164 -17.968607 2.1288147 -18.084312 -16.950586 4.6966791 -22.262224 
		-16.050465 4.2816558 -18.227938 -16.681505 4.2233176 -28.708738 -12.683332 
		4.3647761 -15.766751 -10.164526 4.8573298 -20.279808 -11.049692 1.3292825 
		-34.117989 -14.293377 1.4912217 -34.854706 -15.876226 1.4912217 -32.500702 
		-16.39204 4.0243845 -29.975481 -12.325714 -1.1754652 -5.9398875 -17.18132 
		-1.1754652 -7.9749432 -9.8244877 -1.1754652 -15.08447 -9.8407059 -1.1754652 
		-18.885296 -10.784952 -0.68404496 -22.069378 -15.002629 -0.7292828 -23.051912 
		-17.504023 -0.46642175 -22.096279 -18.770151 -1.1754652 -17.818903 -10.074771 
		1.1741961 -30.226618 -11.992266 -0.98996705 -28.360397 -12.88028 -0.90876567 
		-22.239946 -17.886513 1.7451304 -21.979269 -16.911739 1.8989416 -26.599058 
		-16.423361 0.56517309 -30.982805 -15.599192 0.46985424 -31.512411 -10.420453 
		-0.16404197 -30.995901 -10.030514 -0.00063452125 -29.898947 -9.9082146 -0.10173692 
		-26.485996 -20.334515 -1.1754652 -13.332276 -20.676046 1.7692435 -13.917635 
		-13.049121 -1.1754652 -18.78517 -15.505791 -1.1754652 -18.578146;
	setAttr ".vt[830:995]" -14.110805 0.64663213 -35.412811 -11.037272 
		0.47015047 -34.676121 -14.341365 -1.1754781 -33.886368 -11.506392 -1.1754781 
		-33.369884 -14.28367 -1.1754781 -30.570587 -12.204002 -1.1754781 -30.493908 
		-11.377405 3.544261 -8.5754232 -7.4607205 3.545768 -13.033425 -6.5267448 
		-0.7364704 -9.050333 -11.381799 -0.7364704 -2.6060374 -12.669602 3.4562972 
		-7.3515034 -17.314192 3.4584999 -8.1699066 -12.673993 -0.78812289 -2.8028815 
		-17.529608 -0.78812289 -4.5504837 -18.054735 2.0294125 -8.0999765 -18.270153 
		-0.90968019 -6.6370926 -20.856438 -0.90968019 -10.218763 -21.114145 2.0350285 
		-10.948415 -10.654385 2.6557863 -8.321414 -8.0330849 2.6401618 -11.147474 
		-7.4396939 0.047153715 -8.9323483 -10.631725 0.096629359 -4.6188021 -9.4068336 
		2.6219609 -4.5390635 -7.2720938 2.5785136 -6.7244802 -6.8066196 0.82164526 
		-5.4349999 -9.374011 0.92053211 -1.9618696 -8.4111471 2.9704545 -0.8308478 
		-6.2219529 2.8925505 -2.7439687 -6.6253901 1.1004786 -3.8136113 -8.6199598 
		1.1447246 -0.6722486 -7.2753377 2.475801 2.4434514 -5.8341746 2.3866005 1.0523314 
		-6.3528266 1.39057 -1.5646677 -8.0791979 1.4104968 0.7445491 -6.7192211 1.8206127 
		3.8820615 -5.5288768 1.7679554 2.8721385 -5.9642496 1.082162 1.0121053 -7.3661561 
		1.173565 2.8426301 -6.0774589 1.0007932 4.9290385 -5.4522152 0.95750034 4.3002596 
		-5.8117642 0.75988114 2.9141145 -6.5023499 0.77119064 4.0193892 -13.282582 
		2.7146006 -6.7982545 -16.724287 2.7193792 -7.2945361 -13.292009 -0.054025967 
		-3.6810827 -16.877447 -0.074158855 -5.0662799 -13.862858 2.6574092 -2.6867023 
		-16.834002 2.6092863 -3.1685882 -14.113261 0.52367073 -1.3390505 -16.597052 
		0.39439777 -2.3872471 -14.388065 3.0645883 1.8210161 -16.759087 3.0029531 
		1.6851376 -14.462232 0.85226321 1.1946669 -16.421495 0.8837055 0.22448204 
		-14.783805 2.3103712 4.8647232 -16.64465 2.2694614 4.8203382 -14.866919 1.1705509 
		3.8454742 -16.472237 1.2211729 3.2563848 -15.132295 1.7956238 6.6097493 -16.500834 
		1.7375306 6.6440244 -15.107005 1.1061463 5.4610486 -16.313902 1.0709943 4.981864 
		-15.525613 0.99265242 8.2650089 -16.276056 0.99140298 8.0584822 -15.422005 
		0.83015954 6.8507032 -16.05757 0.83809417 6.4063787 -18.450583 1.4255804 
		-8.3305721 -18.64094 -0.27001336 -7.2924023 -20.490202 -0.29082894 -10.027292 
		-20.711386 1.4198354 -10.265634 -19.011181 1.4204797 -6.0986533 -19.201538 
		-0.10869262 -5.8804188 -21.016363 -0.01463609 -8.4122162 -21.183558 1.4284528 
		-8.0336704 -19.837912 1.6235217 -3.8902986 -19.765099 0.035973076 -4.4981093 
		-21.231848 0.148269 -6.3947687 -21.761805 1.6142731 -5.3937292 -20.453436 
		1.2010529 -1.8808674 -20.158279 0.20813955 -3.2309189 -21.445402 0.23985238 
		-4.8865666 -21.90303 1.1936593 -2.8834388 -20.915272 0.8001985 -0.69798404 
		-20.695396 0.19184518 -2.1109025 -21.568142 0.23193061 -3.1643448 -22.073797 
		0.78604233 -1.4623734 -21.315544 0.19903272 -0.21856374 -21.164461 0.10334033 
		-1.2980917 -21.500923 0.10057092 -1.6131771 -21.822271 0.15074214 -0.62307346 
		-21.270893 43.22554 -8.6412973 -22.488686 43.500687 -12.097661 -21.395226 
		43.882088 -16.191797 -18.014601 43.713654 -18.036089 -13.111824 43.566837 
		-17.408018 -10.835929 43.494652 -12.845695 -12.28778 43.022022 -9.8201857 
		-16.554186 42.923729 -6.8578997 26.368208 115.29864 -7.7343173 24.457968 
		112.82092 -4.1145339 21.66573 107.59972 -3.2726126 25.500978 115.36056 -11.842219 
		22.156872 112.87254 -15.60348 21.74753 105.04171 -5.3834906 23.060862 106.62009 
		-11.473749 22.195648 107.83894 -16.651321 39.903553 114.13838 -9.2036896 
		40.085148 112.25018 -6.9436016 40.146931 108.92051 -6.3019934 39.621658 114.52229 
		-12.832686 39.408287 111.98733 -15.699054 40.032108 106.32182 -7.9106421 
		39.670738 106.6751 -12.551885 39.360615 108.45352 -16.497591 65.236755 112.75995 
		-5.6186304 64.539253 111.67153 -4.2328243 64.300545 109.39577 -3.8553479 
		66.318192 113.22448 -7.8588943 67.135414 111.69843 -9.6428404 64.739586 107.61963 
		-4.8641996 66.126015 108.11353 -7.7280326 67.316277 109.0766 -10.158152 35.598396 
		114.87371 -8.2633858 36.096317 113.18597 -4.1145349 36.469776 107.89398 -3.2726128 
		30.279343 116.22464 -13.216799 30.531387 113.61578 -17.34906 34.492546 104.45379 
		-5.3834901 29.288721 104.81583 -12.384996 31.286842 107.83894 -19.184978 
		48.263382 114.90456 -7.7416658 48.92255 113.02478 -5.0245309 48.834328 108.75835 
		-4.313632 48.474758 115.42865 -11.549608 49.145699 113.12075 -15.616472 48.926365 
		105.12452 -6.0960073 49.03981 104.85596 -12.358818 49.529671 108.24094 -17.007658 
		40.96315 114.24016 -9.0174217 41.180126 112.25018 -6.3019934 41.180126 108.89458 
		-6.3019934 40.626633 114.52229 -12.719256 40.914745 112.48215 -16.143179 
		41.180126 106.32182 -7.9106421 42.064663 105.86542 -13.564102 40.914745 108.80009 
		-17.615707 -8.8150854 151.71846 10.0462 -6.1351399 152.78883 9.6063805 -8.1499214 
		157.32353 8.5001278 -9.2702789 156.91895 4.2439976 -9.1930132 156.30421 8.6828079 
		-12.965293 155.21529 1.2153752 -11.725145 156.52214 0.78893036 -9.6456423 
		151.73012 8.3956413 -9.8975048 158.43671 7.3010001 -11.126806 157.57054 7.6387939 
		-13.504034 156.62729 2.658026 -12.269527 157.77304 2.4023793 -11.078257 150.21169 
		1.7097274 -12.004179 154.9568 2.4971604 -10.012646 155.77917 7.2753396 -10.688787 
		156.67229 6.751545 -12.423162 156.07469 3.2325487 -11.133701 149.07675 5.2405524 
		-10.903252 149.04478 2.8643494 -10.948277 149.4962 8.0652246;
	setAttr ".vt[996:1161]" -8.8767748 153.77745 9.4460449 -7.1004925 155.2865 
		9.0852795 -7.836587 155.5136 3.9149618 -10.677696 154.49617 -0.10110605 -12.158477 
		152.49898 0.61873436 -11.221246 152.22276 2.0305622 -9.7690725 153.45192 
		7.9534798 -11.539198 156.54672 5.0116715 -12.371605 157.49141 5.1465549 -11.269011 
		158.66342 4.849834 -10.407027 152.52037 2.348304 -9.4043274 152.95819 4.7909322 
		-10.37441 155.32693 4.5788941 -11.328859 155.0611 2.745255 -11.694815 156.09578 
		3.3089819 -11.031666 156.49989 4.7604723 -9.3292818 153.47545 7.2839479 -9.7550354 
		155.6777 6.6590424 -10.32708 150.79332 2.1925743 -9.5194464 151.16534 4.8940296 
		-9.1689377 152.02136 7.6490369 -10.336073 156.62968 6.1594195 -6.3997512 
		133.1597 26.968319 -3.0361853 132.67175 29.826477 -9.999445 136.75154 17.702387 
		-9.2203999 132.89874 16.98991 -6.4206066 132.71318 26.83112 -3.0055709 132.23776 
		29.712181 -10.179768 134.18024 15.893711 -10.217175 136.23361 16.181742 -9.058567 
		135.81271 19.677803 -8.5084448 133.56026 18.990526 -7.690629 133.38783 21.202133 
		-8.0333958 134.02585 20.990932 -9.0015821 137.23254 20.763016 -8.8354864 
		139.45529 19.6574 -10.481692 139.50638 16.79089 -10.963554 138.54208 15.185816 
		-10.115698 133.15926 13.955158 -8.1110678 131.51331 19.590727 -7.6904192 
		131.33942 21.340014 -8.170166 136.69141 22.884701 -8.0777063 138.34018 22.37649 
		-7.471211 139.74666 22.29401 -2.2787123 137.52113 28.864487 -4.7515211 136.98064 
		28.33305 -4.3015332 138.67717 27.408628 -3.0864861 139.34094 28.102983 -4.0334992 
		137.26541 27.708471 -2.774574 137.61186 28.219143 -3.0239751 138.75201 27.861223 
		-4.0673318 138.27107 27.260366 -8.8071899 136.75154 17.702387 -8.9007101 
		136.23361 16.181742 -8.8829918 134.18024 15.893711 -7.8147197 132.89874 16.98991 
		-7.1857128 133.56026 18.990526 -6.2465448 133.38783 21.202133 -4.6588492 
		132.71318 26.83112 -2.7456317 132.41617 29.081541 -7.8531299 135.81271 19.677803 
		-6.7426443 134.02585 20.990932 -4.7441654 133.1597 26.968319 -4.3104 131.61983 
		26.577814 -2.6453485 131.32574 28.503239 -8.4565964 137.75087 16.913893 -8.5501165 
		136.79086 15.262261 -8.5323982 133.89809 14.826407 -7.4641261 132.01578 16.642609 
		-6.8351192 132.48578 19.019819 -5.8959508 132.28934 20.99242 -7.5025368 136.65839 
		20.21032 -6.3920507 134.89909 21.413836 -4.3935719 134.25021 27.039276 -2.5443814 
		132.93118 28.755602 -2.8920317 134.03079 28.533545 4.4872122 139.0843 26.853399 
		6.291894 135.46892 27.677851 7.8925605 151.41632 12.889518 12.550837 139.66951 
		9.4838963 10.415229 138.15262 17.155539 2.9658928 135.49576 30.533983 1.6776959 
		137.81291 29.151377 5.6108928 136.74796 28.104263 2.8296988 140.22482 28.173389 
		3.0124376 142.63345 22.077658 4.9663591 148.63199 17.371124 5.1193738 152.05272 
		13.125995 6.6064858 153.63789 3.8742871 9.9609594 150.62767 5.1296201 12.341394 
		141.03937 4.4244967 11.55336 145.48163 5.7986917 11.338303 146.83171 12.76306 
		10.584285 141.59605 16.228022 4.1606698 150.90337 16.528099 6.7253666 150.54233 
		16.437717 11.212621 146.08432 15.447701 3.3600156 148.58517 18.133774 5.6893053 
		141.56265 22.155062 8.6693907 141.67804 18.551785 10.200638 145.47572 16.712418 
		2.8471432 145.20879 20.319328 4.1877661 143.32423 19.255644 9.2979221 143.60098 
		17.835163 3.5435176 146.04855 18.246441 10.286018 150.15126 12.351683 10.845079 
		149.84689 10.235594 11.363921 146.26697 10.59413 9.8147554 149.47757 16.118959 
		8.6243172 148.16399 17.481581 11.549643 142.14328 13.034965 12.010179 143.03456 
		8.8629026 11.125247 143.25365 15.335634 4.0332274 146.44164 16.369473 5.1161451 
		147.90225 16.753397 4.3615751 143.6799 18.357939 8.5269718 143.88893 17.182051 
		9.879159 145.40669 16.22611 8.5198507 147.63655 16.881001 4.3208566 146.26721 
		18.187122 5.4300246 147.58038 17.898224 4.9099298 144.60765 18.655184 8.2983313 
		144.57817 17.960726 9.3763056 145.52809 17.330851 8.4317179 147.26385 17.711504 
		8.4077854 146.11414 18.117722 5.148056 146.19745 18.458458 6.5864534 129.74812 
		22.739908 11.391079 149.05122 -0.18220139 8.5627174 131.45444 -1.0226058 
		9.8552418 141.03897 -3.0971129 9.7219887 128.88597 11.613918 3.1509542 130.34383 
		29.011917 6.5076084 130.85048 26.258787 3.6253927 128.09979 25.123009 4.8541088 
		146.90007 -6.8117518 10.63252 145.99933 -0.94042575 9.0013046 152.30225 -1.1476619 
		5.1729574 141.21046 -9.6312647 9.42068 131.77853 5.1322637 5.1209846 127.45899 
		11.43322 10.679947 135.60555 4.9376583 9.42068 135.74109 -2.4014754 10.96707 
		134.02147 12.100928 4.8541088 134.0562 -10.008867 4.0123329 126.94302 18.573978 
		8.3224049 129.20407 17.107294 8.7520933 131.77829 16.924994 8.8150854 151.71846 
		10.0462 6.1351399 152.78883 9.6063805 8.1499214 157.32353 8.5001278 9.2702789 
		156.91895 4.2439976 9.1930132 156.30421 8.6828079 12.965293 155.21529 1.2153752 
		11.725145 156.52214 0.78893036 9.6456423 151.73012 8.3956413 9.8975048 158.43671 
		7.3010001 11.126806 157.57054 7.6387939 13.504034 156.62729 2.658026 12.269527 
		157.77304 2.4023793 11.078257 150.21169 1.7097274 12.004179 154.9568 2.4971604 
		10.012646 155.77917 7.2753396 10.688787 156.67229 6.751545 12.423162 156.07469 
		3.2325487 11.133701 149.07675 5.2405524;
	setAttr ".vt[1162:1327]" 10.903252 149.04478 2.8643494 10.948277 149.4962 
		8.0652246 8.8767748 153.77745 9.4460449 7.1004925 155.2865 9.0852795 7.836587 
		155.5136 3.9149618 10.677696 154.49617 -0.10110605 12.158477 152.49898 0.61873436 
		11.221246 152.22276 2.0305622 9.7690725 153.45192 7.9534798 11.539198 156.54672 
		5.0116715 12.371605 157.49141 5.1465549 11.269011 158.66342 4.849834 10.407027 
		152.52037 2.348304 9.4043274 152.95819 4.7909322 10.37441 155.32693 4.5788941 
		11.328859 155.0611 2.745255 11.694815 156.09578 3.3089819 11.031666 156.49989 
		4.7604723 9.3292818 153.47545 7.2839479 9.7550354 155.6777 6.6590424 10.32708 
		150.79332 2.1925743 9.5194464 151.16534 4.8940296 9.1689377 152.02136 7.6490369 
		10.336073 156.62968 6.1594195 6.3997512 133.1597 26.968319 3.0361853 132.67175 
		29.826477 9.999445 136.75154 17.702387 9.2203999 132.89874 16.98991 6.4206066 
		132.71318 26.83112 3.0055709 132.23776 29.712181 10.179768 134.18024 15.893711 
		10.217175 136.23361 16.181742 9.058567 135.81271 19.677803 8.5084448 133.56026 
		18.990526 7.690629 133.38783 21.202133 8.0333958 134.02585 20.990932 9.0015821 
		137.23254 20.763016 8.8354864 139.45529 19.6574 10.481692 139.50638 16.79089 
		10.963554 138.54208 15.185816 10.115698 133.15926 13.955158 8.1110678 131.51331 
		19.590727 7.6904192 131.33942 21.340014 8.170166 136.69141 22.884701 8.0777063 
		138.34018 22.37649 7.471211 139.74666 22.29401 2.2787123 137.52113 28.864487 
		4.7515211 136.98064 28.33305 4.3015332 138.67717 27.408628 3.0864861 139.34094 
		28.102983 4.0334992 137.26541 27.708471 2.774574 137.61186 28.219143 3.0239751 
		138.75201 27.861223 4.0673318 138.27107 27.260366 8.8071899 136.75154 17.702387 
		8.9007101 136.23361 16.181742 8.8829918 134.18024 15.893711 7.8147197 132.89874 
		16.98991 7.1857128 133.56026 18.990526 6.2465448 133.38783 21.202133 4.6588492 
		132.71318 26.83112 2.7456317 132.41617 29.081541 7.8531299 135.81271 19.677803 
		6.7426443 134.02585 20.990932 4.7441654 133.1597 26.968319 4.3104 131.61983 
		26.577814 2.6453485 131.32574 28.503239 8.4565964 137.75087 16.913893 8.5501165 
		136.79086 15.262261 8.5323982 133.89809 14.826407 7.4641261 132.01578 16.642609 
		6.8351192 132.48578 19.019819 5.8959508 132.28934 20.99242 7.5025368 136.65839 
		20.21032 6.3920507 134.89909 21.413836 4.3935719 134.25021 27.039276 2.5443814 
		132.93118 28.755602 2.8920317 134.03079 28.533545 -76.167603 107.62491 -8.354394 
		-72.3069 107.14959 -9.0521078 -67.679192 105.07435 0.57275069 -66.999054 
		105.85541 -0.35287821 -65.954414 106.58559 -1.8307878 -67.963432 105.20026 
		-1.7051048 74.791733 114.79222 -1.2438504 73.089767 113.24188 2.4331846 72.029083 
		110.01485 2.231683 76.874222 116.36679 -4.4622083 77.899162 113.62554 -7.5359354 
		76.624275 108.36551 -9.6687393 77.416786 111.20892 -10.356801 72.48954 114.58453 
		-2.0787642 71.206352 112.78785 1.6478045 69.219948 110.13458 0.77127373 74.101524 
		115.69585 -5.7386532 75.877724 113.81649 -8.1917343 73.812805 108.03961 -10.217193 
		75.489021 111.19322 -10.498861 76.18 113.44901 -0.51414287 74.651459 112.87199 
		2.534858 74.533638 109.80623 1.6523628 76.283813 111.01376 -1.2955828 76.987038 
		114.14278 -1.5728889 78.473137 115.77116 -3.6664112 77.408844 111.58258 -3.345439 
		78.553505 113.18238 -5.5832777 77.435448 110.58165 -5.558938 78.73568 112.30346 
		-6.9454603 77.906914 108.58212 -7.7578559 79.073639 110.7987 -9.0454597 67.377388 
		105.99253 -3.0953557 69.727882 108.33578 1.9455574 77.642685 115.19176 -2.2522616 
		78.747261 114.45476 -5.0066133 78.455666 109.44858 -8.9364996 78.01947 111.88145 
		-5.8079786 77.909874 112.00335 -4.7490153 76.703979 112.81616 -1.7256558 
		76.184814 112.40579 -1.31433 74.592545 111.14679 2.8543794 72.822144 109.00316 
		0.96236241 71.368851 107.87057 0.84059918 70.524918 106.37771 -2.0292196 
		68.432396 106.57087 1.8528085 68.819511 104.82169 -0.70730704 70.59494 106.89516 
		-3.4245362 70.729195 107.21579 -5.5191393 67.359596 107.40562 0.55151725 
		67.106331 108.48857 -0.099304974 76.546364 113.96211 -0.96697748 78.653023 
		112.76717 -6.6546726 81.337555 115.515 -0.36337751 81.884262 116.03521 -1.7767893 
		80.868195 114.4856 0.11720586 80.627502 113.35755 -0.012694865 81.226868 
		112.30862 -1.3900273 81.652901 112.6664 -2.5835142 82.200195 113.66895 -3.2929032 
		82.369995 114.82613 -2.9378588 79.422981 113.52298 1.2439271 77.997025 112.98469 
		4.0882912 78.052917 111.5359 4.2503858 78.002876 110.39693 3.2291374 79.489845 
		111.42287 0.72452652 79.405731 112.60556 0.70859873 82.143051 111.41535 -4.9915857 
		82.755463 111.7762 -5.9642262 81.495674 110.2344 -4.4082222 81.898819 108.52463 
		-6.2884774 82.516029 109.26553 -7.4962568 83.044449 110.48951 -7.7598987 
		71.626648 107.2961 1.3178601 69.507278 105.52549 2.0207782 69.385445 104.56842 
		1.1098042 69.498566 104.65129 -0.25228637 70.747284 106.15295 -1.1833253 
		72.310837 106.34975 1.5002787 70.828598 105.24045 2.5044539 70.38517 103.79287 
		1.766018 70.780144 103.82206 0.31063908 72.059341 105.23846 -0.39978313 73.587936 
		106.02371 2.1290674 71.800003 104.73813 3.1898091 71.583115 103.38763 1.863431 
		71.634315 103.01146 0.30209714 73.518112 104.88998 -0.1118819;
	setAttr ".vt[1328:1434]" 80.370827 113.36465 1.6376616 78.94487 112.82636 
		4.4820256 78.916153 111.3917 4.608974 78.866112 110.25274 3.5877261 80.353081 
		111.27868 1.0831151 80.268967 112.46136 1.0671873 82.258057 115.2817 0.059834361 
		83.216843 115.69747 -1.1641141 81.705597 114.27336 0.50221342 81.464905 113.14532 
		0.37231266 82.06427 112.09638 -1.0050199 82.490303 112.45417 -2.1985068 83.037598 
		113.45672 -2.9078958 83.290497 114.59283 -2.5146472 82.994125 111.1032 -4.4874597 
		83.606537 111.53355 -5.6305709 82.346748 109.99175 -4.0745668 82.749893 108.28198 
		-5.954823 83.367104 109.02288 -7.1626024 83.895523 110.24686 -7.4262433 82.134506 
		112.90723 2.5776014 80.899071 112.42097 5.0174575 80.865402 111.08871 5.3031459 
		80.805382 110.07829 4.3576255 82.225044 111.04649 1.9918332 82.132584 112.11832 
		1.9514308 84.119568 114.55154 0.67873824 84.65139 114.96364 -0.45278001 83.393265 
		113.7296 1.2361379 83.360703 112.70724 1.1378065 83.700851 111.78005 -0.12381232 
		84.332008 112.13226 -1.2513132 84.848633 113.05848 -1.9360635 85.00943 114.03036 
		-1.4977844 84.881134 110.43858 -3.8640504 85.466324 110.78965 -4.7743673 
		84.261086 109.41474 -3.4571781 84.649307 107.89339 -5.1623435 85.230568 108.59988 
		-6.303421 85.737762 109.65567 -6.414216 83.432533 112.56936 3.3690643 82.346924 
		112.16939 5.4829535 81.651611 110.37346 4.1546655 82.69046 111.06097 2.476397 
		85.590225 114.232 1.0734659 84.264633 112.48415 0.67206615 84.808296 112.12207 
		-0.68391865 86.363098 113.7227 -0.84205282 86.994713 110.36491 -4.497314 
		84.933319 109.2306 -3.583559 85.303429 107.8298 -4.8627071 87.031601 109.14122 
		-5.8584113 92.046921 106.9205 7.1558137 91.673607 106.78153 7.7947512 91.225159 
		106.60927 7.3666439 91.478622 106.66109 6.9388819 95.239052 107.60455 5.0327225 
		94.796066 107.36474 4.8104801 94.915024 107.30877 4.4144678 95.402916 107.51373 
		4.4177809 95.362778 104.18887 0.92097199 94.884377 104.17788 0.81639111 94.900032 
		104.10009 0.47226635 95.451759 103.97181 0.50700396 84.956604 111.82178 4.1357546 
		84.174858 111.43006 5.8904471 84.006592 109.98055 5.0582743 84.611893 110.48114 
		3.8744705 88.263367 109.72414 5.54424 87.551117 109.51335 6.7478456 87.252731 
		108.63821 6.0948558 87.797211 108.91013 5.337657 87.417519 113.44227 1.839148 
		86.895912 112.06947 1.6393723 87.3853 111.77023 0.72611898 88.214333 112.92938 
		0.33506644 91.379501 110.81389 3.3991683 90.700607 109.98173 3.1242235 91.168411 
		109.72086 2.4615526 91.871765 110.39171 2.2880211 92.468781 106.94492 -1.4667045 
		91.845673 106.40867 -1.151695 92.02282 105.94123 -1.7677941 92.685951 106.37772 
		-2.2170198 89.395584 109.08601 -3.3726203 88.669846 107.99197 -2.6088872 
		88.843933 107.17157 -3.6190031 89.619522 108.20543 -4.538527 73.323822 103.16782 
		3.1452703 74.486115 104.12564 2.4939113 74.327591 103.4171 1.1335825 73.461433 
		102.21737 1.3600544 76.644539 103.00781 2.8688695 76.582947 102.72359 2.3127031 
		76.487534 102.78728 2.9461508 76.481941 102.4658 2.4522893 74.255074 103.78468 
		0.33840647 74.39402 105.00141 2.5325592 72.496643 103.85099 3.2405789 72.397003 
		102.56375 0.87731755 74.654861 108.6069 -4.000638 76.167603 107.62491 -8.354394 
		72.3069 107.14959 -9.0521078 67.679192 105.07435 0.57275069 66.999054 105.85541 
		-0.35287821 65.954414 106.58559 -1.8307878 67.963432 105.20026 -1.7051048;
	setAttr -s 2850 ".ed";
	setAttr ".ed[0:165]"  0 2 0 2 1 0 
		4 3 0 5 1 0 6 3 0 0 7 
		0 8 9 0 9 10 0 8 11 0 11 
		12 0 10 43 0 13 14 0 12 14 0 
		15 23 0 16 24 0 18 26 0 19 27 
		0 22 29 0 16 15 0 17 16 0 15 
		18 0 18 19 0 20 17 0 21 20 0 
		22 21 0 19 22 0 23 8 0 24 9 
		0 25 10 0 26 11 0 27 12 0 28 
		13 0 29 14 0 24 23 0 25 24 0 
		23 26 0 26 27 0 28 1241 0 29 28 
		0 27 29 0 9 31 0 31 51 0 30 
		50 0 11 35 0 34 44 0 34 49 0 
		36 48 0 35 45 0 30 61 0 38 47 
		0 14 41 0 40 46 0 56 54 0 39 
		62 0 33 36 0 38 36 0 43 55 0 
		43 53 0 30 31 0 44 35 0 8 44 
		0 45 37 0 12 45 0 39 41 0 46 
		41 0 13 46 0 47 39 0 48 37 0 
		47 48 0 49 36 0 50 33 0 49 50 
		0 51 32 0 10 51 0 52 10 0 32 
		52 0 52 53 0 33 32 0 38 40 0 
		54 53 0 56 1242 0 59 1243 0 58 42 
		0 57 58 0 59 55 0 60 25 0 59 
		60 0 43 60 0 42 1244 0 17 25 0 
		61 34 0 61 8 0 62 37 0 62 12 
		0 44 63 0 35 64 0 63 64 0 34 
		65 0 65 63 0 49 66 0 65 66 0 
		36 67 0 66 67 0 48 68 0 67 68 
		0 37 69 0 68 69 0 45 70 0 70 
		69 0 64 70 0 30 71 0 31 72 0 
		71 72 0 51 73 0 72 73 0 32 74 
		0 73 74 0 33 75 0 75 74 0 50 
		76 0 76 75 0 71 76 0 47 77 0 
		39 78 0 77 78 0 38 79 0 79 77 
		0 40 80 0 79 80 0 46 81 0 80 
		81 0 41 82 0 81 82 0 78 82 0 
		53 83 0 55 84 0 83 84 0 84 85 
		0 56 86 0 86 85 0 54 87 0 86 
		87 0 87 83 0 83 88 0 84 89 0 
		88 89 0 85 90 0 89 90 0 86 91 
		0 91 90 0 87 92 0 91 92 0 92 
		88 0 88 93 0 89 94 0 93 94 0 
		90 95 0 94 95 0 91 96 0 96 95 
		0 92 97 0 96 97 0 97 93 0 57 
		54 0 71 98 0 72 99 0;
	setAttr ".ed[166:331]" 98 99 0 73 100 0 99 
		100 0 74 101 0 100 101 0 75 102 0 
		102 101 0 76 103 0 103 102 0 98 103 
		0 63 104 0 64 105 0 104 105 0 65 
		106 0 106 104 0 66 107 0 106 107 0 
		67 108 0 107 108 0 68 109 0 108 109 
		0 69 110 0 109 110 0 70 111 0 111 
		110 0 105 111 0 77 112 0 78 113 0 
		112 113 0 79 114 0 114 112 0 80 115 
		0 114 115 0 81 116 0 115 116 0 82 
		117 0 116 117 0 113 117 0 98 118 0 
		99 119 0 118 119 0 100 120 0 119 120 
		0 101 121 0 120 121 0 102 122 0 122 
		121 0 103 123 0 123 122 0 118 123 0 
		104 124 0 105 125 0 124 125 0 106 126 
		0 126 124 0 107 127 0 126 127 0 108 
		128 0 127 128 0 109 129 0 128 129 0 
		110 130 0 129 130 0 111 131 0 131 130 
		0 125 131 0 112 132 0 113 133 0 132 
		133 0 114 134 0 134 132 0 115 135 0 
		134 135 0 116 136 0 135 136 0 117 137 
		0 136 137 0 133 137 0 118 138 0 119 
		139 0 138 139 0 121 140 0 139 140 0 
		122 141 0 141 140 0 138 141 0 124 142 
		0 127 143 0 142 143 0 129 144 0 143 
		144 0 131 145 0 145 144 0 142 145 0 
		133 146 0 134 147 0 147 146 0 135 148 
		0 147 148 0 137 149 0 148 149 0 146 
		149 0 138 162 0 139 163 0 150 151 0 
		140 164 0 151 152 0 141 165 0 153 152 
		0 150 153 0 142 170 0 143 171 0 154 
		155 0 144 172 0 155 156 0 145 173 0 
		157 156 0 154 157 0 159 158 0 159 160 
		0 160 161 0 158 161 0 162 166 0 163 
		167 0 164 168 0 165 169 0 162 163 0 
		163 164 0 164 165 0 165 162 0 166 150 
		0 167 151 0 168 152 0 169 153 0 166 
		167 0 167 168 0 168 169 0 169 166 0 
		170 174 0 171 175 0 172 176 0 173 177 
		0 170 171 0 171 172 0 172 173 0 173 
		170 0 174 154 0 175 155 0 176 156 0 
		177 157 0 174 175 0 175 176 0 176 177 
		0 177 174 0 146 182 0 147 183 0 148 
		184 0 149 185 0 178 158 0 179 159 0 
		180 160 0 181 161 0 178 179 0 179 180 
		0 180 181 0 181 178 0;
	setAttr ".ed[332:497]" 182 178 0 183 179 0 184 
		180 0 185 181 0 183 182 0 184 183 0 
		185 184 0 182 185 0 187 195 0 186 187 
		0 187 188 0 188 189 0 189 186 0 187 
		190 0 188 191 0 190 191 0 186 192 0 
		192 190 0 189 193 0 193 192 0 191 193 
		0 194 195 0 186 196 0 96 197 0 195 
		93 0 196 94 0 195 196 0 196 95 0 
		197 189 0 95 197 0 197 194 0 13 1240 
		0 36 198 0 198 52 0 199 221 0 200 
		206 0 200 204 0 201 976 0 201 210 0 
		201 228 0 200 1037 0 203 1033 0 206 199 
		0 207 199 0 206 1041 0 207 205 0 204 
		205 0 209 218 0 207 208 0 210 217 0 
		210 977 0 213 202 0 215 233 0 212 993 
		0 215 230 0 213 214 0 209 232 0 206 
		1039 0 203 1032 0 215 219 0 217 220 0 
		218 201 0 217 218 0 219 235 0 218 231 
		0 208 221 0 222 216 0 221 222 0 223 
		219 0 223 226 0 209 220 0 208 224 0 
		224 220 0 221 225 0 225 227 0 226 222 
		0 225 226 0 225 208 0 227 224 0 227 
		209 0 228 215 0 228 229 0 230 214 0 
		229 230 0 231 219 0 228 231 0 232 223 
		0 231 232 0 233 202 0 230 234 0 234 
		233 0 234 213 0 235 216 0 233 235 0 
		235 226 0 227 236 0 209 237 0 236 237 
		0 225 238 0 238 236 0 226 239 0 238 
		239 0 223 240 0 240 239 0 232 241 0 
		241 240 0 237 241 0 236 242 0 237 243 
		0 242 243 0 238 244 0 244 242 0 239 
		245 0 244 245 0 240 246 0 246 245 0 
		241 247 0 247 246 0 243 247 0 243 249 
		0 245 248 0 248 247 0 249 244 0 248 
		249 0 250 251 0 251 252 0 250 253 0 
		253 254 0 252 255 0 256 255 0 256 257 
		0 254 257 0 250 258 0 251 259 0 252 
		260 0 253 261 0 254 262 0 255 263 0 
		256 264 0 257 265 0 258 274 0 259 275 
		0 260 276 0 261 277 0 262 278 0 263 
		279 0 264 280 0 265 281 0 259 258 0 
		260 259 0 258 261 0 261 262 0 263 260 
		0 264 263 0 265 264 0 262 265 0 266 
		290 0 267 291 0 268 292 0 269 293 0 
		270 294 0 271 295 0 272 296 0 273 297 
		0 267 266 0 268 267 0;
	setAttr ".ed[498:663]" 266 269 0 269 270 0 271 
		268 0 272 271 0 273 272 0 270 273 0 
		274 266 0 275 267 0 276 268 0 277 269 
		0 278 270 0 279 271 0 280 272 0 281 
		273 0 275 274 0 276 275 0 274 277 0 
		277 278 0 279 276 0 280 279 0 281 280 
		0 278 281 0 283 282 0 284 283 0 282 
		285 0 285 286 0 287 284 0 288 287 0 
		289 288 0 286 289 0 290 282 0 291 283 
		0 292 284 0 293 285 0 294 286 0 295 
		287 0 296 288 0 297 289 0 291 290 0 
		292 291 0 290 293 0 293 294 0 295 292 
		0 296 295 0 297 296 0 294 297 0 298 
		305 0 299 308 0 300 312 0 298 304 0 
		299 307 0 300 311 0 301 315 0 301 309 
		0 302 319 0 302 313 0 302 316 0 304 
		303 0 305 303 0 307 301 0 309 1 0 
		307 306 0 308 306 0 2 306 0 309 306 
		0 311 302 0 311 310 0 312 310 0 313 
		310 0 315 300 0 315 314 0 311 314 0 
		316 314 0 312 317 0 315 317 0 309 317 
		0 5 317 0 499 6 0 319 298 0 305 
		318 0 319 318 0 313 318 0 319 320 0 
		304 1036 0 316 1034 0 5 321 0 312 322 
		0 317 323 0 322 323 0 321 323 0 324 
		325 0 310 326 0 496 498 0 322 326 0 
		321 327 0 324 327 0 321 328 0 322 329 
		0 323 330 0 329 330 0 328 330 0 324 
		331 0 325 332 0 331 332 0 326 333 0 
		495 497 0 329 333 0 327 334 0 328 334 
		0 331 334 0 328 335 0 330 336 0 335 
		336 0 332 337 0 333 338 0 479 486 0 
		334 339 0 335 339 0 335 340 0 336 341 
		0 340 341 0 337 342 0 338 343 0 480 
		487 0 339 344 0 340 344 0 329 345 0 
		330 346 0 345 346 0 346 341 0 331 347 
		0 332 348 0 347 348 0 348 342 0 333 
		349 0 345 349 0 349 343 0 334 350 0 
		347 350 0 350 344 0 340 351 0 341 353 
		0 352 353 0 351 353 0 342 355 0 354 
		355 0 343 356 0 481 488 0 352 356 0 
		344 357 0 351 357 0 354 357 0 347 358 
		0 348 359 0 358 359 0 342 360 0 359 
		360 0 350 361 0 358 361 0 344 362 0 
		361 362 0 355 363 0 360 363 0 354 364 
		0 364 363 0 357 365 0;
	setAttr ".ed[664:829]" 364 365 0 362 365 0 351 
		366 0 352 367 0 353 368 0 367 368 0 
		366 368 0 354 369 0 355 370 0 369 370 
		0 356 371 0 482 489 0 367 371 0 357 
		372 0 366 372 0 369 372 0 366 373 0 
		367 374 0 368 375 0 374 375 0 373 375 
		0 369 376 0 370 377 0 376 377 0 371 
		378 0 483 490 0 374 378 0 372 379 0 
		373 379 0 376 379 0 373 380 0 374 381 
		0 375 382 0 381 382 0 380 382 0 376 
		383 0 377 384 0 383 384 0 378 385 0 
		484 491 0 381 385 0 379 386 0 380 386 
		0 383 386 0 380 387 0 381 388 0 382 
		389 0 388 389 0 387 389 0 383 390 0 
		384 391 0 390 391 0 385 392 0 485 492 
		0 388 392 0 386 393 0 387 393 0 390 
		393 0 387 394 0 388 395 0 389 396 0 
		395 396 0 394 396 0 390 397 0 391 398 
		0 397 398 0 392 399 0 395 399 0 393 
		400 0 394 400 0 397 400 0 395 401 0 
		396 402 0 401 402 0 397 403 0 400 404 
		0 403 404 0 401 406 0 402 407 0 406 
		407 0 405 407 0 403 409 0 409 410 0 
		408 410 0 408 411 0 406 411 0 404 412 
		0 405 412 0 409 412 0 405 414 0 413 
		414 0 406 415 0 415 413 0 407 416 0 
		415 416 0 414 416 0 408 417 0 413 417 
		0 409 418 0 413 418 0 410 419 0 418 
		419 0 417 419 0 411 420 0 417 420 0 
		415 420 0 412 421 0 414 421 0 418 421 
		0 394 422 0 396 423 0 422 423 0 402 
		424 0 423 424 0 400 425 0 422 425 0 
		404 426 0 425 426 0 405 427 0 407 428 
		0 427 428 0 424 428 0 412 429 0 426 
		429 0 427 429 0 422 430 0 423 431 0 
		430 431 0 424 432 0 431 432 0 425 433 
		0 430 433 0 426 434 0 433 434 0 427 
		435 0 428 436 0 435 436 0 432 436 0 
		429 437 0 434 437 0 435 437 0 430 438 
		0 431 439 0 438 439 0 432 440 0 439 
		440 0 433 441 0 438 441 0 434 442 0 
		441 442 0 435 443 0 436 444 0 443 444 
		0 440 444 0 437 445 0 442 445 0 443 
		445 0 438 446 0 439 447 0 446 447 0 
		440 448 0 447 448 0 441 449 0 446 449 
		0 442 450 0 449 450 0;
	setAttr ".ed[830:995]" 443 451 0 444 452 0 451 
		452 0 448 452 0 445 453 0 450 453 0 
		451 453 0 446 454 0 447 455 0 454 455 
		0 448 456 0 455 456 0 449 457 0 454 
		457 0 450 458 0 457 458 0 451 459 0 
		452 460 0 459 460 0 456 460 0 453 461 
		0 458 461 0 459 461 0 454 462 0 455 
		463 0 462 463 0 456 464 0 463 464 0 
		457 465 0 462 465 0 458 466 0 465 466 
		0 459 467 0 460 468 0 467 468 0 464 
		468 0 461 469 0 466 469 0 467 469 0 
		462 470 0 463 471 0 470 471 0 470 472 
		0 464 473 0 472 473 0 471 473 0 465 
		474 0 470 474 0 466 475 0 474 475 0 
		472 475 0 467 476 0 472 476 0 468 477 
		0 476 477 0 473 477 0 469 478 0 475 
		478 0 476 478 0 479 337 0 480 342 0 
		479 480 0 481 355 0 480 481 0 482 370 
		0 481 482 0 483 377 0 482 483 0 484 
		384 0 483 484 0 485 391 0 484 485 0 
		486 338 0 487 343 0 486 487 0 488 356 
		0 487 488 0 489 371 0 488 489 0 490 
		378 0 489 490 0 491 385 0 490 491 0 
		492 392 0 491 492 0 333 493 0 332 494 
		0 493 486 0 494 479 0 493 494 0 495 
		332 0 494 495 0 496 325 0 495 496 0 
		496 6 0 497 333 0 493 497 0 498 326 
		0 497 498 0 499 310 0 498 499 0 397 
		500 0 398 501 0 500 501 0 403 502 0 
		500 502 0 503 501 0 503 504 0 410 505 
		0 409 506 0 506 505 0 502 506 0 408 
		507 0 504 507 0 507 505 0 503 508 0 
		399 509 0 508 509 0 504 510 0 508 510 
		0 395 511 0 511 509 0 401 512 0 511 
		512 0 411 513 0 408 514 0 514 513 0 
		510 514 0 406 515 0 512 515 0 515 513 
		0 516 398 0 485 516 0 516 503 0 517 
		399 0 492 517 0 517 508 0 516 517 0 
		500 518 0 501 519 0 518 519 0 502 520 
		0 518 520 0 503 521 0 521 519 0 504 
		522 0 521 522 0 505 523 0 506 524 0 
		524 523 0 520 524 0 507 525 0 522 525 
		0 525 523 0 518 716 0 519 715 0 526 
		527 0 520 717 0 526 528 0 521 722 0 
		529 527 0 522 721 0 529 530 0 523 719 
		0 524 718 0 532 531 0;
	setAttr ".ed[996:1161]" 528 532 0 525 720 0 530 
		533 0 533 531 0 536 550 0 540 551 0 
		535 534 0 534 536 0 537 535 0 538 537 
		0 540 539 0 536 540 0 541 538 0 539 
		541 0 542 560 0 543 559 0 545 558 0 
		546 565 0 547 563 0 549 564 0 543 542 
		0 545 543 0 546 545 0 544 548 0 549 
		546 0 547 549 0 534 552 0 535 553 0 
		537 554 0 538 555 0 539 556 0 541 557 
		0 544 561 0 548 562 0 542 544 0 548 
		547 0 550 544 0 551 548 0 552 542 0 
		553 543 0 554 545 0 555 546 0 556 547 
		0 557 549 0 553 552 0 550 552 0 554 
		553 0 555 554 0 551 556 0 550 551 0 
		557 555 0 556 557 0 558 529 0 559 527 
		0 558 559 0 560 526 0 559 560 0 561 
		528 0 560 561 0 562 532 0 561 562 0 
		563 531 0 562 563 0 564 533 0 563 564 
		0 565 530 0 564 565 0 565 558 0 526 
		566 0 527 567 0 566 567 0 528 568 0 
		566 568 0 529 569 0 569 567 0 530 570 
		0 569 570 0 531 571 0 532 572 0 568 
		572 0 533 573 0 570 573 0 573 571 0 
		570 574 0 573 575 0 574 575 0 532 576 
		0 531 577 0 576 577 0 572 578 0 576 
		578 0 571 579 0 578 579 0 577 579 0 
		578 580 0 580 581 0 579 581 0 568 582 
		0 582 578 0 582 583 0 583 580 0 573 
		584 0 584 579 0 575 585 0 585 581 0 
		584 585 0 586 587 0 574 588 0 586 588 
		0 575 589 0 588 589 0 589 620 0 591 
		612 0 592 591 0 593 614 0 566 594 0 
		567 595 0 594 595 0 595 587 0 568 596 
		0 594 596 0 596 615 0 569 597 0 597 
		595 0 597 586 0 570 598 0 597 598 0 
		598 588 0 581 599 0 580 600 0 600 599 
		0 591 617 0 583 601 0 592 616 0 582 
		602 0 602 601 0 596 602 0 601 600 0 
		585 611 0 586 603 0 587 604 0 603 604 
		0 588 605 0 603 605 0 589 606 0 605 
		606 0 590 607 0 606 607 0 591 608 0 
		608 613 0 592 609 0 609 608 0 593 610 
		0 610 609 0 610 621 0 611 619 0 599 
		611 0 589 611 0 612 590 0 599 618 0 
		613 607 0 612 613 0 609 614 0 614 594 
		0 615 592 0 601 615 0;
	setAttr ".ed[1162:1327]" 615 614 0 595 593 0 616 
		601 0 617 600 0 616 617 0 618 612 0 
		619 590 0 618 619 0 607 620 0 620 619 
		0 621 604 0 587 622 0 622 621 0 593 
		622 0 606 623 0 623 624 0 613 623 0 
		623 603 0 624 610 0 608 624 0 624 604 
		0 600 625 0 599 626 0 625 626 0 617 
		627 0 627 625 0 618 628 0 627 628 0 
		626 628 0 591 629 0 629 627 0 612 630 
		0 629 630 0 628 630 0 586 631 0 588 
		632 0 631 632 0 605 633 0 632 633 0 
		603 634 0 634 633 0 631 634 0 586 635 
		0 587 636 0 635 636 0 603 637 0 635 
		637 0 604 638 0 637 638 0 636 638 0 
		587 639 0 604 640 0 639 640 0 621 641 
		0 641 640 0 622 642 0 642 641 0 639 
		642 0 631 643 0 632 644 0 643 644 0 
		633 645 0 644 645 0 634 646 0 646 645 
		0 643 646 0 643 647 0 644 648 0 647 
		648 0 645 649 0 648 649 0 646 650 0 
		650 649 0 647 650 0 647 651 0 648 652 
		0 651 652 0 649 653 0 652 653 0 650 
		654 0 654 653 0 651 654 0 651 655 0 
		652 656 0 655 656 0 653 657 0 656 657 
		0 654 658 0 658 657 0 655 658 0 655 
		659 0 656 660 0 659 660 0 657 661 0 
		660 661 0 658 662 0 662 661 0 659 662 
		0 659 663 0 660 664 0 663 664 0 661 
		665 0 664 665 0 662 666 0 666 665 0 
		663 666 0 635 667 0 636 668 0 667 668 
		0 637 669 0 667 669 0 638 670 0 669 
		670 0 668 670 0 667 671 0 668 672 0 
		671 672 0 669 673 0 671 673 0 670 674 
		0 673 674 0 672 674 0 671 675 0 672 
		676 0 675 676 0 673 677 0 675 677 0 
		674 678 0 677 678 0 676 678 0 675 679 
		0 676 680 0 679 680 0 677 681 0 679 
		681 0 678 682 0 681 682 0 680 682 0 
		679 683 0 680 684 0 683 684 0 681 685 
		0 683 685 0 682 686 0 685 686 0 684 
		686 0 683 687 0 684 688 0 687 688 0 
		685 689 0 687 689 0 686 690 0 689 690 
		0 688 690 0 639 691 0 640 692 0 691 
		692 0 641 693 0 693 692 0 642 694 0 
		694 693 0 691 694 0 691 695 0 692 696 
		0 695 696 0 693 697 0;
	setAttr ".ed[1328:1493]" 697 696 0 694 698 0 698 
		697 0 695 698 0 695 699 0 696 700 0 
		699 700 0 697 701 0 701 700 0 698 702 
		0 702 701 0 699 702 0 699 703 0 700 
		704 0 703 704 0 701 705 0 705 704 0 
		702 706 0 706 705 0 703 706 0 703 707 
		0 704 708 0 707 708 0 705 709 0 709 
		708 0 706 710 0 710 709 0 707 710 0 
		707 711 0 708 712 0 711 712 0 709 713 
		0 713 712 0 710 714 0 714 713 0 711 
		714 0 715 535 0 716 534 0 715 716 0 
		717 536 0 716 717 0 718 540 0 717 718 
		0 719 539 0 718 719 0 720 541 0 719 
		720 0 721 538 0 720 721 0 722 537 0 
		721 722 0 722 715 0 723 724 0 723 725 
		0 726 724 0 726 727 0 729 728 0 725 
		729 0 727 730 0 730 728 0 723 921 0 
		724 920 0 731 732 0 725 922 0 731 733 
		0 726 927 0 734 732 0 727 926 0 734 
		735 0 728 924 0 729 923 0 737 736 0 
		733 737 0 730 925 0 735 738 0 738 736 
		0 741 755 0 745 756 0 740 739 0 739 
		741 0 742 740 0 743 742 0 745 744 0 
		741 745 0 746 743 0 744 746 0 747 765 
		0 748 764 0 750 763 0 751 770 0 752 
		768 0 754 769 0 748 747 0 750 748 0 
		751 750 0 749 753 0 754 751 0 752 754 
		0 739 757 0 740 758 0 742 759 0 743 
		760 0 744 761 0 746 762 0 749 766 0 
		753 767 0 747 749 0 753 752 0 755 749 
		0 756 753 0 757 747 0 758 748 0 759 
		750 0 760 751 0 761 752 0 762 754 0 
		758 757 0 755 757 0 759 758 0 760 759 
		0 756 761 0 755 756 0 762 760 0 761 
		762 0 763 734 0 764 732 0 763 764 0 
		765 731 0 764 765 0 766 733 0 765 766 
		0 767 737 0 766 767 0 768 736 0 767 
		768 0 769 738 0 768 769 0 770 735 0 
		769 770 0 770 763 0 731 771 0 732 772 
		0 771 772 0 733 773 0 771 773 0 734 
		774 0 774 772 0 735 775 0 774 775 0 
		736 776 0 737 777 0 773 777 0 738 778 
		0 775 778 0 778 776 0 775 779 0 778 
		780 0 779 780 0 737 781 0 736 782 0 
		781 782 0 777 783 0 781 783 0 776 784 
		0 783 784 0 782 784 0;
	setAttr ".ed[1494:1659]" 783 785 0 785 786 0 784 
		786 0 773 787 0 787 783 0 787 788 0 
		788 785 0 778 789 0 789 784 0 780 790 
		0 790 786 0 789 790 0 791 792 0 779 
		793 0 791 793 0 780 794 0 793 794 0 
		794 825 0 796 817 0 797 796 0 798 819 
		0 771 799 0 772 800 0 799 800 0 800 
		792 0 773 801 0 799 801 0 801 820 0 
		774 802 0 802 800 0 802 791 0 775 803 
		0 802 803 0 803 793 0 786 804 0 785 
		805 0 805 804 0 796 822 0 788 806 0 
		797 821 0 787 807 0 807 806 0 801 807 
		0 806 805 0 790 816 0 791 808 0 792 
		809 0 808 809 0 793 810 0 808 810 0 
		794 811 0 810 811 0 795 812 0 811 812 
		0 796 813 0 813 818 0 797 814 0 814 
		813 0 798 815 0 815 814 0 815 826 0 
		816 824 0 804 816 0 794 816 0 817 795 
		0 804 823 0 818 812 0 817 818 0 814 
		819 0 819 799 0 820 797 0 806 820 0 
		820 819 0 800 798 0 821 806 0 822 805 
		0 821 822 0 823 817 0 824 795 0 823 
		824 0 812 825 0 825 824 0 826 809 0 
		792 827 0 827 826 0 798 827 0 811 828 
		0 828 829 0 818 828 0 828 808 0 829 
		815 0 813 829 0 829 809 0 805 830 0 
		804 831 0 830 831 0 822 832 0 832 830 
		0 823 833 0 832 833 0 831 833 0 796 
		834 0 834 832 0 817 835 0 834 835 0 
		833 835 0 791 836 0 793 837 0 836 837 
		0 810 838 0 837 838 0 808 839 0 839 
		838 0 836 839 0 791 840 0 792 841 0 
		840 841 0 808 842 0 840 842 0 809 843 
		0 842 843 0 841 843 0 792 844 0 809 
		845 0 844 845 0 826 846 0 846 845 0 
		827 847 0 847 846 0 844 847 0 836 848 
		0 837 849 0 848 849 0 838 850 0 849 
		850 0 839 851 0 851 850 0 848 851 0 
		848 852 0 849 853 0 852 853 0 850 854 
		0 853 854 0 851 855 0 855 854 0 852 
		855 0 852 856 0 853 857 0 856 857 0 
		854 858 0 857 858 0 855 859 0 859 858 
		0 856 859 0 856 860 0 857 861 0 860 
		861 0 858 862 0 861 862 0 859 863 0 
		863 862 0 860 863 0 860 864 0 861 865 
		0 864 865 0 862 866 0;
	setAttr ".ed[1660:1825]" 865 866 0 863 867 0 867 
		866 0 864 867 0 864 868 0 865 869 0 
		868 869 0 866 870 0 869 870 0 867 871 
		0 871 870 0 868 871 0 840 872 0 841 
		873 0 872 873 0 842 874 0 872 874 0 
		843 875 0 874 875 0 873 875 0 872 876 
		0 873 877 0 876 877 0 874 878 0 876 
		878 0 875 879 0 878 879 0 877 879 0 
		876 880 0 877 881 0 880 881 0 878 882 
		0 880 882 0 879 883 0 882 883 0 881 
		883 0 880 884 0 881 885 0 884 885 0 
		882 886 0 884 886 0 883 887 0 886 887 
		0 885 887 0 884 888 0 885 889 0 888 
		889 0 886 890 0 888 890 0 887 891 0 
		890 891 0 889 891 0 888 892 0 889 893 
		0 892 893 0 890 894 0 892 894 0 891 
		895 0 894 895 0 893 895 0 844 896 0 
		845 897 0 896 897 0 846 898 0 898 897 
		0 847 899 0 899 898 0 896 899 0 896 
		900 0 897 901 0 900 901 0 898 902 0 
		902 901 0 899 903 0 903 902 0 900 903 
		0 900 904 0 901 905 0 904 905 0 902 
		906 0 906 905 0 903 907 0 907 906 0 
		904 907 0 904 908 0 905 909 0 908 909 
		0 906 910 0 910 909 0 907 911 0 911 
		910 0 908 911 0 908 912 0 909 913 0 
		912 913 0 910 914 0 914 913 0 911 915 
		0 915 914 0 912 915 0 912 916 0 913 
		917 0 916 917 0 914 918 0 918 917 0 
		915 919 0 919 918 0 916 919 0 920 740 
		0 921 739 0 920 921 0 922 741 0 921 
		922 0 923 745 0 922 923 0 924 744 0 
		923 924 0 925 746 0 924 925 0 926 743 
		0 925 926 0 927 742 0 926 927 0 927 
		920 0 509 724 0 726 508 0 511 723 0 
		512 725 0 515 729 0 513 728 0 727 510 
		0 730 514 0 358 928 0 359 929 0 360 
		930 0 361 931 0 362 932 0 363 933 0 
		364 934 0 365 935 0 928 952 0 929 953 
		0 930 954 0 931 955 0 932 956 0 933 
		957 0 934 958 0 935 959 0 929 928 0 
		930 929 0 928 931 0 931 932 0 933 930 
		0 934 933 0 935 934 0 932 935 0 936 
		968 0 937 969 0 938 970 0 939 971 0 
		940 972 0 941 973 0 942 974 0 943 975 
		0 937 936 0 938 937 0;
	setAttr ".ed[1826:1991]" 936 939 0 939 940 0 941 
		938 0 942 941 0 943 942 0 940 943 0 
		945 944 0 946 945 0 944 947 0 947 948 
		0 949 946 0 950 949 0 951 950 0 948 
		951 0 952 936 0 953 937 0 954 938 0 
		955 939 0 956 940 0 957 941 0 958 942 
		0 959 943 0 953 952 0 954 953 0 952 
		955 0 955 956 0 957 954 0 958 957 0 
		959 958 0 956 959 0 960 944 0 961 945 
		0 962 946 0 963 947 0 964 948 0 965 
		949 0 966 950 0 967 951 0 961 960 0 
		962 961 0 960 963 0 963 964 0 965 962 
		0 966 965 0 967 966 0 964 967 0 968 
		960 0 969 961 0 970 962 0 971 963 0 
		972 964 0 973 965 0 974 966 0 975 967 
		0 969 968 0 970 969 0 968 971 0 971 
		972 0 973 970 0 974 973 0 975 974 0 
		972 975 0 252 343 0 349 251 0 345 250 
		0 346 253 0 341 254 0 353 257 0 352 
		256 0 356 255 0 213 314 0 320 1021 0 
		304 1022 0 303 1023 0 308 211 0 299 988 
		0 307 214 0 301 213 0 16 283 0 282 
		15 0 17 284 0 20 287 0 21 288 0 
		22 289 0 19 286 0 18 285 0 976 983 
		0 229 976 0 977 211 0 976 977 0 977 
		997 0 211 998 0 978 979 0 976 996 0 
		980 990 0 980 978 0 299 1000 0 308 999 
		0 981 982 0 981 989 0 982 979 0 983 
		212 0 978 984 0 980 985 0 985 984 0 
		981 986 0 982 987 0 986 987 0 986 1004 
		0 987 1005 0 988 212 0 988 1001 0 989 
		992 0 990 1002 0 991 990 0 991 985 0 
		992 1003 0 992 986 0 993 214 0 988 994 
		0 993 995 0 994 993 0 307 994 0 995 
		229 0 983 995 0 996 980 0 997 978 0 
		996 997 0 998 979 0 997 998 0 999 982 
		0 998 999 0 1000 981 0 999 1000 0 1001 
		989 0 1000 1001 0 1002 983 0 1002 996 0 
		308 0 0 7 211 0 7 977 0 1003 991 
		0 1004 985 0 1003 1004 0 1005 984 0 1004 
		1005 0 1005 979 0 1001 1006 0 1006 1007 0 
		1007 1008 0 989 1009 0 1009 1008 0 1006 1009 
		0 992 1010 0 1003 1011 0 1010 1011 0 1009 
		1010 0 1008 1011 0 1002 1012 0 1007 1012 0 
		990 1013 0 1013 1012 0 1013 1008 0 988 1014 
		0 212 1015 0 1014 1015 0;
	setAttr ".ed[1992:2157]" 1015 1007 0 1014 1006 0 983 
		1016 0 1016 1015 0 1012 1016 0 991 1017 0 
		1011 1017 0 1017 1013 0 325 3 0 6 496 
		0 324 4 0 1018 200 0 1019 204 0 1018 
		1019 0 1020 203 0 316 202 0 1020 1025 0 
		1021 1027 0 1022 1023 0 1024 1021 0 1024 1025 
		0 1020 1026 0 1026 1029 0 1027 1028 0 1028 
		1022 0 1029 1018 0 1022 1054 0 1018 1058 0 
		1020 1048 0 1025 1049 0 1024 1050 0 1021 1051 
		0 1026 1056 0 1027 1052 0 1028 1053 0 1029 
		1057 0 1030 203 0 1026 1030 0 1030 1031 0 
		1031 222 0 1032 216 0 1031 1032 0 1033 202 
		0 1032 1033 0 1033 1025 0 1034 320 0 1033 
		1034 0 1034 1024 0 1035 320 0 1027 1035 0 
		1036 1035 0 1028 1036 0 1037 1030 0 1029 1037 
		0 1037 1038 0 1038 1031 0 1039 222 0 1038 
		1039 0 1040 205 0 1040 1043 0 1041 1040 0 
		1041 1042 0 1042 199 0 1043 207 0 1042 1043 
		0 1041 1044 0 1040 1045 0 1044 1045 0 1043 
		1046 0 1045 1046 0 1042 1047 0 1047 1046 0 
		1044 1047 0 499 313 0 1048 1049 0 1049 1050 
		0 1050 1051 0 1051 1052 0 1052 1053 0 1053 
		1054 0 1054 1055 0 1055 1023 0 1048 1056 0 
		1056 1057 0 1057 1058 0 1058 1070 0 1054 1059 
		0 1055 1060 0 1059 1060 0 1048 1061 0 1049 
		1062 0 1061 1062 0 1050 1063 0 1062 1063 0 
		1051 1064 0 1063 1064 0 1052 1065 0 1053 1066 
		0 1065 1066 0 1064 1065 0 1066 1059 0 1056 
		1067 0 1061 1067 0 1057 1068 0 1067 1068 0 
		1058 1069 0 1068 1069 0 1069 1071 0 1019 1070 
		0 1070 1071 0 1064 1061 0 1065 1067 0 1066 
		1068 0 1059 1069 0 1060 1071 0 1072 1094 0 
		1073 1079 0 1073 1077 0 1074 1144 0 1074 1083 
		0 1074 1101 0 1073 1205 0 1076 1201 0 1079 
		1072 0 1080 1072 0 1079 1209 0 1080 1078 0 
		1077 1078 0 1082 1091 0 1080 1081 0 1083 1090 
		0 1083 1145 0 1086 1075 0 1088 1106 0 1085 
		1161 0 1088 1103 0 1086 1087 0 1082 1105 0 
		1079 1207 0 1076 1200 0 1088 1092 0 1090 1093 
		0 1091 1074 0 1090 1091 0 1092 1108 0 1091 
		1104 0 1081 1094 0 1095 1089 0 1094 1095 0 
		1096 1092 0 1096 1099 0 1082 1093 0 1081 1097 
		0 1097 1093 0 1094 1098 0 1098 1100 0 1099 
		1095 0 1098 1099 0 1098 1081 0 1100 1097 0 
		1100 1082 0 1101 1088 0 1101 1102 0 1103 1087 
		0 1102 1103 0 1104 1092 0;
	setAttr ".ed[2158:2323]" 1101 1104 0 1105 1096 0 1104 
		1105 0 1106 1075 0 1103 1107 0 1107 1106 0 
		1107 1086 0 1108 1089 0 1106 1108 0 1108 1099 
		0 1100 1109 0 1082 1110 0 1109 1110 0 1098 
		1111 0 1111 1109 0 1099 1112 0 1111 1112 0 
		1096 1113 0 1113 1112 0 1105 1114 0 1114 1113 
		0 1110 1114 0 1109 1115 0 1110 1116 0 1115 
		1116 0 1111 1117 0 1117 1115 0 1112 1118 0 
		1117 1118 0 1113 1119 0 1119 1118 0 1114 1120 
		0 1120 1119 0 1116 1120 0 1116 1122 0 1118 
		1121 0 1121 1120 0 1122 1117 0 1121 1122 0 
		1123 1130 0 1124 1133 0 1125 4 0 1123 1129 
		0 1124 1132 0 1125 1135 0 1126 1138 0 1126 
		1134 0 1127 1142 0 1127 1136 0 1127 1139 0 
		1129 1128 0 1130 1128 0 1132 1126 0 1134 1 
		0 1132 1131 0 1133 1131 0 2 1131 0 1134 
		1131 0 1135 1127 0 1135 3 0 1136 3 0 
		1138 1125 0 1138 1137 0 1135 1137 0 1139 1137 
		0 4 1140 0 1138 1140 0 1134 1140 0 5 
		1140 0 1142 1123 0 1130 1141 0 1142 1141 0 
		1136 1141 0 1142 1143 0 1129 1204 0 1139 1202 
		0 1086 1137 0 1143 1189 0 1129 1190 0 1128 
		1191 0 1133 1084 0 1124 1156 0 1132 1087 0 
		1126 1086 0 1144 1151 0 1102 1144 0 1145 1084 
		0 1144 1145 0 1145 1165 0 1084 1166 0 1146 
		1147 0 1144 1164 0 1148 1158 0 1148 1146 0 
		1124 1168 0 1133 1167 0 1149 1150 0 1149 1157 
		0 1150 1147 0 1151 1085 0 1146 1152 0 1148 
		1153 0 1153 1152 0 1149 1154 0 1150 1155 0 
		1154 1155 0 1154 1172 0 1155 1173 0 1156 1085 
		0 1156 1169 0 1157 1160 0 1158 1170 0 1159 
		1158 0 1159 1153 0 1160 1171 0 1160 1154 0 
		1161 1087 0 1156 1162 0 1161 1163 0 1162 1161 
		0 1132 1162 0 1163 1102 0 1151 1163 0 1164 
		1148 0 1165 1146 0 1164 1165 0 1166 1147 0 
		1165 1166 0 1167 1150 0 1166 1167 0 1168 1149 
		0 1167 1168 0 1169 1157 0 1168 1169 0 1170 
		1151 0 1170 1164 0 1133 0 0 7 1084 0 
		7 1145 0 1171 1159 0 1172 1153 0 1171 1172 
		0 1173 1152 0 1172 1173 0 1173 1147 0 1169 
		1174 0 1174 1175 0 1175 1176 0 1157 1177 0 
		1177 1176 0 1174 1177 0 1160 1178 0 1171 1179 
		0 1178 1179 0 1177 1178 0 1176 1179 0 1170 
		1180 0 1175 1180 0 1158 1181 0 1181 1180 0 
		1181 1176 0 1156 1182 0 1085 1183 0 1182 1183 
		0 1183 1175 0 1182 1174 0;
	setAttr ".ed[2324:2489]" 1151 1184 0 1184 1183 0 1180 
		1184 0 1159 1185 0 1179 1185 0 1185 1181 0 
		1186 1073 0 1187 1077 0 1186 1187 0 1188 1076 
		0 1139 1075 0 1188 1193 0 1189 1195 0 1190 
		1191 0 1192 1189 0 1192 1193 0 1188 1194 0 
		1194 1197 0 1195 1196 0 1196 1190 0 1197 1186 
		0 1190 1222 0 1186 1226 0 1188 1216 0 1193 
		1217 0 1192 1218 0 1189 1219 0 1194 1224 0 
		1195 1220 0 1196 1221 0 1197 1225 0 1198 1076 
		0 1194 1198 0 1198 1199 0 1199 1095 0 1200 
		1089 0 1199 1200 0 1201 1075 0 1200 1201 0 
		1201 1193 0 1202 1143 0 1201 1202 0 1202 1192 
		0 1203 1143 0 1195 1203 0 1204 1203 0 1196 
		1204 0 1205 1198 0 1197 1205 0 1205 1206 0 
		1206 1199 0 1207 1095 0 1206 1207 0 1208 1078 
		0 1208 1211 0 1209 1208 0 1209 1210 0 1210 
		1072 0 1211 1080 0 1210 1211 0 1209 1212 0 
		1208 1213 0 1212 1213 0 1211 1214 0 1213 1214 
		0 1210 1215 0 1215 1214 0 1212 1215 0 6 
		1136 0 1216 1217 0 1217 1218 0 1218 1219 0 
		1219 1220 0 1220 1221 0 1221 1222 0 1222 1223 
		0 1223 1191 0 1216 1224 0 1224 1225 0 1225 
		1226 0 1226 1238 0 1222 1227 0 1223 1228 0 
		1227 1228 0 1216 1229 0 1217 1230 0 1229 1230 
		0 1218 1231 0 1230 1231 0 1219 1232 0 1231 
		1232 0 1220 1233 0 1221 1234 0 1233 1234 0 
		1232 1233 0 1234 1227 0 1224 1235 0 1229 1235 
		0 1225 1236 0 1235 1236 0 1226 1237 0 1236 
		1237 0 1237 1239 0 1187 1238 0 1238 1239 0 
		1232 1229 0 1233 1235 0 1234 1236 0 1227 1237 
		0 1228 1239 0 1140 327 0 1136 313 0 1141 
		318 0 1130 305 0 1128 303 0 977 1145 0 
		210 1083 0 217 1090 0 220 1093 0 224 1097 
		0 208 1081 0 207 1080 0 205 1078 0 204 
		1077 0 1019 1187 0 1191 1023 0 1070 1238 0 
		1071 1239 0 1055 1223 0 1228 1060 0 1240 198 
		0 40 1240 0 1241 58 0 1240 1241 0 1241 
		21 0 28 22 0 97 194 0 194 188 0 
		198 58 0 57 52 0 1242 55 0 85 1242 
		0 1242 1243 0 1244 60 0 1243 1244 0 1244 
		20 0 21 42 0 42 1245 0 1245 56 0 
		1243 1245 0 1245 57 0 60 17 0 1246 1247 
		0 1247 1248 0 1246 1249 0 1249 1250 0 1248 
		1273 0 1251 1252 0 1250 1252 0 944 1253 0 
		945 1254 0 947 1256 0 948 1257 0 951 1259 
		0 1253 1246 0 1254 1247 0;
	setAttr ".ed[2490:2655]" 1255 1248 0 1256 1249 0 1257 
		1250 0 1258 1251 0 1259 1252 0 1254 1253 0 
		1255 1254 0 1253 1256 0 1256 1257 0 1258 1430 
		0 1259 1258 0 1257 1259 0 1247 1261 0 1261 
		1281 0 1260 1280 0 1249 1265 0 1264 1274 0 
		1264 1279 0 1266 1278 0 1265 1275 0 1260 1291 
		0 1268 1277 0 1252 1271 0 1270 1276 0 1286 
		1284 0 1269 1292 0 1263 1266 0 1268 1266 0 
		1273 1285 0 1273 1283 0 1260 1261 0 1274 1265 
		0 1246 1274 0 1275 1267 0 1250 1275 0 1269 
		1271 0 1276 1271 0 1251 1276 0 1277 1269 0 
		1278 1267 0 1277 1278 0 1279 1266 0 1280 1263 
		0 1279 1280 0 1281 1262 0 1248 1281 0 1282 
		1248 0 1262 1282 0 1282 1283 0 1263 1262 0 
		1268 1270 0 1284 1283 0 1286 1431 0 1289 1432 
		0 1288 1272 0 1287 1288 0 1289 1285 0 1290 
		1255 0 1289 1290 0 1273 1290 0 1272 1433 0 
		946 1255 0 1291 1264 0 1291 1246 0 1292 1267 
		0 1292 1250 0 1274 1293 0 1265 1294 0 1293 
		1294 0 1264 1295 0 1295 1293 0 1279 1296 0 
		1295 1296 0 1266 1297 0 1296 1297 0 1278 1298 
		0 1297 1298 0 1267 1299 0 1298 1299 0 1275 
		1300 0 1300 1299 0 1294 1300 0 1260 1301 0 
		1261 1302 0 1301 1302 0 1281 1303 0 1302 1303 
		0 1262 1304 0 1303 1304 0 1263 1305 0 1305 
		1304 0 1280 1306 0 1306 1305 0 1301 1306 0 
		1277 1307 0 1269 1308 0 1307 1308 0 1268 1309 
		0 1309 1307 0 1270 1310 0 1309 1310 0 1276 
		1311 0 1310 1311 0 1271 1312 0 1311 1312 0 
		1308 1312 0 1283 1313 0 1285 1314 0 1313 1314 
		0 1314 1315 0 1286 1316 0 1316 1315 0 1284 
		1317 0 1316 1317 0 1317 1313 0 1313 1318 0 
		1314 1319 0 1318 1319 0 1315 1320 0 1319 1320 
		0 1316 1321 0 1321 1320 0 1317 1322 0 1321 
		1322 0 1322 1318 0 1318 1323 0 1319 1324 0 
		1323 1324 0 1320 1325 0 1324 1325 0 1321 1326 
		0 1326 1325 0 1322 1327 0 1326 1327 0 1327 
		1323 0 1287 1284 0 1301 1328 0 1302 1329 0 
		1328 1329 0 1303 1330 0 1329 1330 0 1304 1331 
		0 1330 1331 0 1305 1332 0 1332 1331 0 1306 
		1333 0 1333 1332 0 1328 1333 0 1293 1334 0 
		1294 1335 0 1334 1335 0 1295 1336 0 1336 1334 
		0 1296 1337 0 1336 1337 0 1297 1338 0 1337 
		1338 0 1298 1339 0 1338 1339 0 1299 1340 0 
		1339 1340 0 1300 1341 0 1341 1340 0 1335 1341 
		0 1307 1342 0 1308 1343 0;
	setAttr ".ed[2656:2821]" 1342 1343 0 1309 1344 0 1344 
		1342 0 1310 1345 0 1344 1345 0 1311 1346 0 
		1345 1346 0 1312 1347 0 1346 1347 0 1343 1347 
		0 1328 1348 0 1329 1349 0 1348 1349 0 1330 
		1350 0 1349 1350 0 1331 1351 0 1350 1351 0 
		1332 1352 0 1352 1351 0 1333 1353 0 1353 1352 
		0 1348 1353 0 1334 1354 0 1335 1355 0 1354 
		1355 0 1336 1356 0 1356 1354 0 1337 1357 0 
		1356 1357 0 1338 1358 0 1357 1358 0 1339 1359 
		0 1358 1359 0 1340 1360 0 1359 1360 0 1341 
		1361 0 1361 1360 0 1355 1361 0 1342 1362 0 
		1343 1363 0 1362 1363 0 1344 1364 0 1364 1362 
		0 1345 1365 0 1364 1365 0 1346 1366 0 1365 
		1366 0 1347 1367 0 1366 1367 0 1363 1367 0 
		1348 1368 0 1349 1369 0 1368 1369 0 1351 1370 
		0 1369 1370 0 1352 1371 0 1371 1370 0 1368 
		1371 0 1354 1372 0 1357 1373 0 1372 1373 0 
		1359 1374 0 1373 1374 0 1361 1375 0 1375 1374 
		0 1372 1375 0 1363 1376 0 1364 1377 0 1377 
		1376 0 1365 1378 0 1377 1378 0 1367 1379 0 
		1378 1379 0 1376 1379 0 1368 1392 0 1369 1393 
		0 1380 1381 0 1370 1394 0 1381 1382 0 1371 
		1395 0 1383 1382 0 1380 1383 0 1372 1400 0 
		1373 1401 0 1384 1385 0 1374 1402 0 1385 1386 
		0 1375 1403 0 1387 1386 0 1384 1387 0 1389 
		1388 0 1389 1390 0 1390 1391 0 1388 1391 0 
		1392 1396 0 1393 1397 0 1394 1398 0 1395 1399 
		0 1392 1393 0 1393 1394 0 1394 1395 0 1395 
		1392 0 1396 1380 0 1397 1381 0 1398 1382 0 
		1399 1383 0 1396 1397 0 1397 1398 0 1398 1399 
		0 1399 1396 0 1400 1404 0 1401 1405 0 1402 
		1406 0 1403 1407 0 1400 1401 0 1401 1402 0 
		1402 1403 0 1403 1400 0 1404 1384 0 1405 1385 
		0 1406 1386 0 1407 1387 0 1404 1405 0 1405 
		1406 0 1406 1407 0 1407 1404 0 1376 1412 0 
		1377 1413 0 1378 1414 0 1379 1415 0 1408 1388 
		0 1409 1389 0 1410 1390 0 1411 1391 0 1408 
		1409 0 1409 1410 0 1410 1411 0 1411 1408 0 
		1412 1408 0 1413 1409 0 1414 1410 0 1415 1411 
		0 1413 1412 0 1414 1413 0 1415 1414 0 1412 
		1415 0 1417 1425 0 1416 1417 0 1417 1418 0 
		1418 1419 0 1419 1416 0 1417 1420 0 1418 1421 
		0 1420 1421 0 1416 1422 0 1422 1420 0 1419 
		1423 0 1423 1422 0 1421 1423 0 1424 1425 0 
		1416 1426 0 1326 1427 0 1425 1323 0 1426 1324 
		0 1425 1426 0 1426 1325 0;
	setAttr ".ed[2822:2849]" 1427 1419 0 1325 1427 0 1427 
		1424 0 1251 1429 0 1266 1428 0 1428 1282 0 
		1429 1428 0 1270 1429 0 1430 1288 0 1429 1430 
		0 1430 950 0 1258 951 0 1327 1424 0 1424 
		1418 0 1428 1288 0 1287 1282 0 1431 1285 0 
		1315 1431 0 1431 1432 0 1433 1290 0 1432 1433 
		0 1433 949 0 950 1272 0 1272 1434 0 1434 
		1286 0 1432 1434 0 1434 1287 0 1290 946 0;
	setAttr -s 5698 ".n";
	setAttr ".n[0:165]" -type "float3"  -0.36449081 -0.92997783 0.047828916 
		-0.36449081 -0.92997783 0.047828916 -0.36449081 -0.92997783 0.047828916 -0.36449081 
		-0.92997783 0.047828916 -0.37223634 -0.89801908 0.23452456 -0.37223634 -0.89801908 
		0.23452456 -0.37223634 -0.89801908 0.23452456 -0.37223634 -0.89801908 0.23452456 
		0.15165809 -0.92809576 0.34005615 0.15165809 -0.92809576 0.34005615 0.15165809 
		-0.92809576 0.34005615 0.15165809 -0.92809576 0.34005615 0.40196416 0.85529792 
		0.32694077 0.40196416 0.85529792 0.32694077 0.40196416 0.85529792 0.32694077 
		0.40196416 0.85529792 0.32694077 0.67348182 0.23300366 0.70152086 0.67348182 
		0.23300366 0.70152086 0.67348182 0.23300366 0.70152086 0.67348182 0.23300366 
		0.70152086 0.31113914 0.9439671 0.11008441 0.31113914 0.9439671 0.11008441 
		0.31113914 0.9439671 0.11008441 0.31113914 0.9439671 0.11008441 0.069488019 
		0.75636786 -0.65044522 0.069488019 0.75636786 -0.65044522 0.069488019 0.75636786 
		-0.65044522 0.069488019 0.75636786 -0.65044522 0.18843386 -0.80822915 -0.55790526 
		0.18843386 -0.80822915 -0.55790526 0.18843386 -0.80822915 -0.55790526 0.18843386 
		-0.80822915 -0.55790526 0.061246671 0.47485095 -0.87793249 0.061246671 0.47485095 
		-0.87793249 0.061246671 0.47485095 -0.87793249 0.061246671 0.47485095 -0.87793249 
		0.26348063 0.91445309 0.30717012 0.26348063 0.91445309 0.30717012 0.26348063 
		0.91445309 0.30717012 0.26348063 0.91445309 0.30717012 0.43440288 0.060343549 
		0.89869505 0.43440288 0.060343549 0.89869505 0.43440288 0.060343549 0.89869505 
		0.43440288 0.060343549 0.89869505 0.25754076 0.93890941 0.22830215 0.25754076 
		0.93890941 0.22830215 0.25754076 0.93890941 0.22830215 0.25754076 0.93890941 
		0.22830215 -0.15641235 0.79533029 -0.58564913 -0.15641235 0.79533029 -0.58564913 
		-0.15641235 0.79533029 -0.58564913 -0.15641235 0.79533029 -0.58564913 0.81749612 
		-0.10691499 0.56592339 0.81749612 -0.10691499 0.56592339 0.81749612 -0.10691499 
		0.56592339 0.81749612 -0.10691499 0.56592339 -0.15615578 -0.21998881 -0.96292281 
		-0.15615578 -0.21998881 -0.96292281 -0.15615578 -0.21998881 -0.96292281 -0.15615578 
		-0.21998881 -0.96292281 -0.17297979 0.6876061 -0.7051779 -0.17297979 0.6876061 
		-0.7051779 -0.17297979 0.6876061 -0.7051779 -0.17297979 0.6876061 -0.7051779 
		-0.22489496 -0.91937393 -0.3227596 -0.22489496 -0.91937393 -0.3227596 -0.22489496 
		-0.91937393 -0.3227596 -0.22489496 -0.91937393 -0.3227596 -0.84194845 -0.068567872 
		0.53518337 -0.84194845 -0.068567872 0.53518337 -0.84194845 -0.068567872 0.53518337 
		-0.84194845 -0.068567872 0.53518337 -0.060813919 0.88992703 0.45203051 -0.060813919 
		0.88992703 0.45203051 -0.060813919 0.88992703 0.45203051 -0.060813919 0.88992703 
		0.45203051 -0.89983642 -0.39975652 0.17461142 -0.89983642 -0.39975652 0.17461142 
		-0.89983642 -0.39975652 0.17461142 -0.89983642 -0.39975652 0.17461142 0.43236855 
		-0.79272896 0.42969546 0.43236855 -0.79272896 0.42969546 0.43236855 -0.79272896 
		0.42969546 0.43236855 -0.79272896 0.42969546 0.43236855 -0.79272896 0.42969546 
		-0.34107822 0.81151211 0.4744615 -0.34107822 0.81151211 0.4744615 -0.34107822 
		0.81151211 0.4744615 -0.34107822 0.81151211 0.4744615 -0.34107822 0.81151211 
		0.4744615 -0.56373447 0.6840418 -0.46291494 -0.56373447 0.6840418 -0.46291494 
		-0.56373447 0.6840418 -0.46291494 -0.56373447 0.6840418 -0.46291494 -0.94055247 
		0.20896503 -0.26775858 -0.94055247 0.20896503 -0.26775858 -0.94055247 0.20896503 
		-0.26775858 -0.94055247 0.20896503 -0.26775858 -0.52390897 -0.32579377 -0.7870056 
		-0.52390897 -0.32579377 -0.7870056 -0.52390897 -0.32579377 -0.7870056 -0.52390897 
		-0.32579377 -0.7870056 0.18422648 0.0650222 0.98073071 0.18422648 0.0650222 
		0.98073071 0.18422648 0.0650222 0.98073071 0.18422648 0.0650222 0.98073071 
		-0.90038431 -0.35430032 0.25254565 -0.90038431 -0.35430032 0.25254565 -0.90038431 
		-0.35430032 0.25254565 -0.90038431 -0.35430032 0.25254565 -0.90038431 -0.35430032 
		0.25254565 -0.81177223 -0.27920213 0.51290548 -0.81177223 -0.27920213 0.51290548 
		-0.81177223 -0.27920213 0.51290548 -0.81177223 -0.27920213 0.51290548 -0.81177223 
		-0.27920213 0.51290548 -0.1035922 -0.70489669 0.7017045 -0.1035922 -0.70489669 
		0.7017045 -0.1035922 -0.70489669 0.7017045 -0.1035922 -0.70489669 0.7017045 
		-0.35755074 -0.58325702 0.72936189 -0.35755074 -0.58325702 0.72936189 -0.35755074 
		-0.58325702 0.72936189 -0.35755074 -0.58325702 0.72936189 -0.61403906 -0.76738644 
		0.18459167 -0.61403906 -0.76738644 0.18459167 -0.61403906 -0.76738644 0.18459167 
		-0.61403906 -0.76738644 0.18459167 -0.61403906 -0.76738644 0.18459167 0.57382143 
		0.35465655 0.73820573 0.57382143 0.35465655 0.73820573 0.57382143 0.35465655 
		0.73820573 0.57382143 0.35465655 0.73820573 0.85908401 -0.014271523 0.51163566 
		0.85908401 -0.014271523 0.51163566 0.85908401 -0.014271523 0.51163566 0.85908401 
		-0.014271523 0.51163566 0.48919153 0.37570259 0.78710818 0.48919153 0.37570259 
		0.78710818 0.48919153 0.37570259 0.78710818 0.48919153 0.37570259 0.78710818 
		0.070449032 -0.96668798 -0.24607167 0.070449032 -0.96668798 -0.24607167 0.070449032 
		-0.96668798 -0.24607167 0.070449032 -0.96668798 -0.24607167 0.63243884 0.49854562 
		0.59285194 0.63243884 0.49854562 0.59285194 0.63243884 0.49854562 0.59285194 
		-0.28261602 0.56117612 0.77795219 -0.28261602 0.56117612 0.77795219 -0.28261602 
		0.56117612 0.77795219 -0.28261602 0.56117612 0.77795219 -0.72487104 0.52709949 
		-0.44354048 -0.72487104 0.52709949 -0.44354048 -0.72487104 0.52709949 -0.44354048 
		-0.72487104 0.52709949 -0.44354048 -0.72487104 0.52709949 -0.44354048 0.21631056 
		0.94091475 0.2605556 0.21631056 0.94091475 0.2605556 0.21631056 0.94091475 
		0.2605556 0.21631056 0.94091475 0.2605556 0.38429871 0.59973735 0.70187575 
		0.38429871 0.59973735 0.70187575 0.38429871 0.59973735 0.70187575 0.38429871 
		0.59973735 0.70187575 0.39761773 -0.020795066 0.91731548;
	setAttr ".n[166:331]" -type "float3"  0.39761773 -0.020795066 0.91731548 
		0.39761773 -0.020795066 0.91731548 0.39761773 -0.020795066 0.91731548 0.13330616 
		-0.81556475 0.56310183 0.13330616 -0.81556475 0.56310183 0.13330616 -0.81556475 
		0.56310183 0.13330616 -0.81556475 0.56310183 -0.27421406 -0.94370246 -0.18501958 
		-0.27421406 -0.94370246 -0.18501958 -0.27421406 -0.94370246 -0.18501958 -0.27421406 
		-0.94370246 -0.18501958 -0.45831001 -0.66635728 -0.58814955 -0.45831001 -0.66635728 
		-0.58814955 -0.45831001 -0.66635728 -0.58814955 -0.45831001 -0.66635728 -0.58814955 
		-0.47562635 0.25202349 -0.84277147 -0.47562635 0.25202349 -0.84277147 -0.47562635 
		0.25202349 -0.84277147 -0.47562635 0.25202349 -0.84277147 -0.29217106 0.71592814 
		-0.63410014 -0.29217106 0.71592814 -0.63410014 -0.29217106 0.71592814 -0.63410014 
		-0.29217106 0.71592814 -0.63410014 0.097192317 0.9856782 0.13781215 0.097192317 
		0.9856782 0.13781215 0.097192317 0.9856782 0.13781215 0.097192317 0.9856782 
		0.13781215 0.40237123 0.13771474 0.90505916 0.40237123 0.13771474 0.90505916 
		0.40237123 0.13771474 0.90505916 0.40237123 0.13771474 0.90505916 0.22222407 
		-0.64546216 0.73074961 0.22222407 -0.64546216 0.73074961 0.22222407 -0.64546216 
		0.73074961 0.22222407 -0.64546216 0.73074961 -0.26315093 -0.93747962 -0.22777955 
		-0.26315093 -0.93747962 -0.22777955 -0.26315093 -0.93747962 -0.22777955 -0.26315093 
		-0.93747962 -0.22777955 -0.53050518 0.026318319 -0.84727305 -0.53050518 0.026318319 
		-0.84727305 -0.53050518 0.026318319 -0.84727305 -0.53050518 0.026318319 -0.84727305 
		-0.41826645 0.50954628 -0.75194132 -0.41826645 0.50954628 -0.75194132 -0.41826645 
		0.50954628 -0.75194132 -0.41826645 0.50954628 -0.75194132 -0.032737173 0.93015748 
		0.36569846 -0.032737173 0.93015748 0.36569846 -0.032737173 0.93015748 0.36569846 
		-0.032737173 0.93015748 0.36569846 0.17811625 0.39135459 0.90283781 0.17811625 
		0.39135459 0.90283781 0.17811625 0.39135459 0.90283781 0.17811625 0.39135459 
		0.90283781 0.2404988 -0.74324989 0.62429154 0.2404988 -0.74324989 0.62429154 
		0.2404988 -0.74324989 0.62429154 0.2404988 -0.74324989 0.62429154 -0.15475714 
		-0.85279858 -0.49878329 -0.15475714 -0.85279858 -0.49878329 -0.15475714 -0.85279858 
		-0.49878329 -0.15475714 -0.85279858 -0.49878329 -0.2953831 -0.26443928 -0.91805267 
		-0.2953831 -0.26443928 -0.91805267 -0.2953831 -0.26443928 -0.91805267 -0.2953831 
		-0.26443928 -0.91805267 -0.23774554 0.8072651 -0.54018521 -0.23774554 0.8072651 
		-0.54018521 -0.23774554 0.8072651 -0.54018521 -0.23774554 0.8072651 -0.54018521 
		-0.94623387 0.036333676 -0.32143638 -0.94623387 0.036333676 -0.32143638 -0.94623387 
		0.036333676 -0.32143638 -0.94623387 0.036333676 -0.32143638 -0.23095991 0.11923476 
		0.96562964 -0.23095991 0.11923476 0.96562964 -0.23095991 0.11923476 0.96562964 
		-0.23095991 0.11923476 0.96562964 -0.23095991 0.11923476 0.96562964 0.46201593 
		-0.49334973 0.73698527 0.46201593 -0.49334973 0.73698527 0.46201593 -0.49334973 
		0.73698527 0.46201593 -0.49334973 0.73698527 -0.40050244 -0.76194674 -0.50895482 
		-0.40050244 -0.76194674 -0.50895482 -0.40050244 -0.76194674 -0.50895482 -0.40050244 
		-0.76194674 -0.50895482 -0.71492404 0.53052539 -0.45544091 -0.71492404 0.53052539 
		-0.45544091 -0.71492404 0.53052539 -0.45544091 -0.71492404 0.53052539 -0.45544091 
		-0.015636679 0.49530315 0.86857945 -0.015636679 0.49530315 0.86857945 -0.015636679 
		0.49530315 0.86857945 -0.015636679 0.49530315 0.86857945 0.54253238 -0.38469651 
		0.74677116 0.54253238 -0.38469651 0.74677116 0.54253238 -0.38469651 0.74677116 
		0.54253238 -0.38469651 0.74677116 0.52396023 -0.84207296 -0.12797968 0.52396023 
		-0.84207296 -0.12797968 0.52396023 -0.84207296 -0.12797968 0.52396023 -0.84207296 
		-0.12797968 -0.074826963 -0.53735524 -0.8400299 -0.074826963 -0.53735524 
		-0.8400299 -0.074826963 -0.53735524 -0.8400299 -0.074826963 -0.53735524 -0.8400299 
		-0.35595712 0.8096866 -0.46658555 -0.35595712 0.8096866 -0.46658555 -0.35595712 
		0.8096866 -0.46658555 -0.35595712 0.8096866 -0.46658555 0.11829707 0.73613197 
		0.66641998 0.11829707 0.73613197 0.66641998 0.11829707 0.73613197 0.66641998 
		0.11829707 0.73613197 0.66641998 0.46406835 -0.45245153 0.7615301 0.46406835 
		-0.45245153 0.7615301 0.46406835 -0.45245153 0.7615301 0.46406835 -0.45245153 
		0.7615301 0.5103398 -0.85965431 0.02340387 0.5103398 -0.85965431 0.02340387 
		0.5103398 -0.85965431 0.02340387 0.5103398 -0.85965431 0.02340387 0.032388508 
		-0.29480684 -0.95500779 0.032388508 -0.29480684 -0.95500779 0.032388508 -0.29480684 
		-0.95500779 0.032388508 -0.29480684 -0.95500779 -0.07120239 0.97293764 0.21982388 
		-0.07120239 0.97293764 0.21982388 -0.07120239 0.97293764 0.21982388 -0.07120239 
		0.97293764 0.21982388 0.36933687 0.089241333 0.92500067 0.36933687 0.089241333 
		0.92500067 0.36933687 0.089241333 0.92500067 0.36933687 0.089241333 0.92500067 
		0.38947791 -0.60532439 0.69418246 0.38947791 -0.60532439 0.69418246 0.38947791 
		-0.60532439 0.69418246 0.38947791 -0.60532439 0.69418246 -0.0023141303 -0.92585319 
		-0.37787628 -0.0023141303 -0.92585319 -0.37787628 -0.0023141303 -0.92585319 
		-0.37787628 -0.0023141303 -0.92585319 -0.37787628 -0.38571289 0.015009589 
		-0.92249674 -0.38571289 0.015009589 -0.92249674 -0.38571289 0.015009589 -0.92249674 
		-0.38571289 0.015009589 -0.92249674 -0.40536314 0.45502588 -0.79286331 -0.40536314 
		0.45502588 -0.79286331 -0.40536314 0.45502588 -0.79286331 -0.40536314 0.45502588 
		-0.79286331 -0.066348426 0.92779583 0.36714137 -0.066348426 0.92779583 0.36714137 
		-0.066348426 0.92779583 0.36714137 -0.066348426 0.92779583 0.36714137 0.25318301 
		0.50162321 0.82720762 0.25318301 0.50162321 0.82720762 0.25318301 0.50162321 
		0.82720762 0.25318301 0.50162321 0.82720762 0.42075032 -0.014676383 0.90705776 
		0.42075032 -0.014676383 0.90705776 0.42075032 -0.014676383 0.90705776 0.42075032 
		-0.014676383 0.90705776 0.40431511 -0.8038705 0.43625849 0.40431511 -0.8038705 
		0.43625849;
	setAttr ".n[332:497]" -type "float3"  0.40431511 -0.8038705 0.43625849 
		0.40431511 -0.8038705 0.43625849 0.093749426 -0.94396538 -0.31644973 0.093749426 
		-0.94396538 -0.31644973 0.093749426 -0.94396538 -0.31644973 0.093749426 -0.94396538 
		-0.31644973 -0.185178 -0.63297868 -0.75169617 -0.185178 -0.63297868 -0.75169617 
		-0.185178 -0.63297868 -0.75169617 -0.185178 -0.63297868 -0.75169617 -0.45076543 
		0.20072669 -0.8697812 -0.45076543 0.20072669 -0.8697812 -0.45076543 0.20072669 
		-0.8697812 -0.45076543 0.20072669 -0.8697812 -0.43505734 0.70844257 -0.55572855 
		-0.43505734 0.70844257 -0.55572855 -0.43505734 0.70844257 -0.55572855 -0.43505734 
		0.70844257 -0.55572855 -0.10063478 0.91137654 0.39908078 -0.10063478 0.91137654 
		0.39908078 -0.10063478 0.91137654 0.39908078 -0.10063478 0.91137654 0.39908078 
		0.24586552 0.49980307 0.83051014 0.24586552 0.49980307 0.83051014 0.24586552 
		0.49980307 0.83051014 0.24586552 0.49980307 0.83051014 0.42248204 -0.71383286 
		0.55852628 0.42248204 -0.71383286 0.55852628 0.42248204 -0.71383286 0.55852628 
		0.42248204 -0.71383286 0.55852628 0.031396534 -0.84474564 -0.53424633 0.031396534 
		-0.84474564 -0.53424633 0.031396534 -0.84474564 -0.53424633 0.031396534 -0.84474564 
		-0.53424633 -0.26829842 -0.3121343 -0.91136611 -0.26829842 -0.3121343 -0.91136611 
		-0.26829842 -0.3121343 -0.91136611 -0.26829842 -0.3121343 -0.91136611 -0.41059676 
		0.77118075 -0.48650852 -0.41059676 0.77118075 -0.48650852 -0.41059676 0.77118075 
		-0.48650852 -0.41059676 0.77118075 -0.48650852 -0.12418975 0.960563 0.24878831 
		-0.12418975 0.960563 0.24878831 -0.12418975 0.960563 0.24878831 -0.12418975 
		0.960563 0.24878831 0.27262357 0.14792338 0.95068139 0.27262357 0.14792338 
		0.95068139 0.27262357 0.14792338 0.95068139 0.27262357 0.14792338 0.95068139 
		0.34110528 -0.62501794 0.70213944 0.34110528 -0.62501794 0.70213944 0.34110528 
		-0.62501794 0.70213944 0.34110528 -0.62501794 0.70213944 -0.054522473 -0.93504709 
		-0.35030594 -0.054522473 -0.93504709 -0.35030594 -0.054522473 -0.93504709 
		-0.35030594 -0.054522473 -0.93504709 -0.35030594 -0.43411705 0.01149432 -0.90078312 
		-0.43411705 0.01149432 -0.90078312 -0.43411705 0.01149432 -0.90078312 -0.43411705 
		0.01149432 -0.90078312 -0.47570243 0.48822474 -0.73167187 -0.47570243 0.48822474 
		-0.73167187 -0.47570243 0.48822474 -0.73167187 -0.47570243 0.48822474 -0.73167187 
		-0.21025124 0.87308204 0.43991151 -0.21025124 0.87308204 0.43991151 -0.21025124 
		0.87308204 0.43991151 -0.21025124 0.87308204 0.43991151 0.12315509 0.54062957 
		0.83219743 0.12315509 0.54062957 0.83219743 0.12315509 0.54062957 0.83219743 
		0.12315509 0.54062957 0.83219743 0.39648694 -0.046926662 0.9168402 0.39648694 
		-0.046926662 0.9168402 0.39648694 -0.046926662 0.9168402 0.39648694 -0.046926662 
		0.9168402 0.38564128 -0.79915118 0.46112707 0.38564128 -0.79915118 0.46112707 
		0.38564128 -0.79915118 0.46112707 0.38564128 -0.79915118 0.46112707 0.017465014 
		-0.95385903 -0.29974651 0.017465014 -0.95385903 -0.29974651 0.017465014 -0.95385903 
		-0.29974651 0.017465014 -0.95385903 -0.29974651 -0.24706954 -0.65345961 -0.71550488 
		-0.24706954 -0.65345961 -0.71550488 -0.24706954 -0.65345961 -0.71550488 -0.24706954 
		-0.65345961 -0.71550488 -0.52372789 0.22167964 -0.82253706 -0.52372789 0.22167964 
		-0.82253706 -0.52372789 0.22167964 -0.82253706 -0.52372789 0.22167964 -0.82253706 
		-0.54616708 0.68404818 -0.4835076 -0.54616708 0.68404818 -0.4835076 -0.54616708 
		0.68404818 -0.4835076 -0.54616708 0.68404818 -0.4835076 -0.16266283 0.88689905 
		0.43237817 -0.16266283 0.88689905 0.43237817 -0.16266283 0.88689905 0.43237817 
		-0.16266283 0.88689905 0.43237817 0.14985016 0.43062863 0.89000219 0.14985016 
		0.43062863 0.89000219 0.14985016 0.43062863 0.89000219 0.14985016 0.43062863 
		0.89000219 0.39280429 -0.72458559 0.56628662 0.39280429 -0.72458559 0.56628662 
		0.39280429 -0.72458559 0.56628662 0.39280429 -0.72458559 0.56628662 -0.038469039 
		-0.85936159 -0.50991935 -0.038469039 -0.85936159 -0.50991935 -0.038469039 
		-0.85936159 -0.50991935 -0.038469039 -0.85936159 -0.50991935 -0.36023179 
		-0.30824831 -0.88046354 -0.36023179 -0.30824831 -0.88046354 -0.36023179 -0.30824831 
		-0.88046354 -0.36023179 -0.30824831 -0.88046354 -0.4940713 0.74662441 -0.4454723 
		-0.4940713 0.74662441 -0.4454723 -0.4940713 0.74662441 -0.4454723 -0.4940713 
		0.74662441 -0.4454723 -0.098386288 0.96622175 0.23819251 -0.098386288 0.96622175 
		0.23819251 -0.098386288 0.96622175 0.23819251 -0.098386288 0.96622175 0.23819251 
		-0.19815379 -0.42069682 0.88529611 -0.19815379 -0.42069682 0.88529611 -0.19815379 
		-0.42069682 0.88529611 -0.19815379 -0.42069682 0.88529611 -0.19815379 -0.42069682 
		0.88529611 -0.26870996 -0.93763649 -0.22052827 -0.26870996 -0.93763649 -0.22052827 
		-0.26870996 -0.93763649 -0.22052827 -0.26870996 -0.93763649 -0.22052827 -0.68481308 
		0.2094752 -0.69796216 -0.68481308 0.2094752 -0.69796216 -0.68481308 0.2094752 
		-0.69796216 -0.68481308 0.2094752 -0.69796216 -0.68481308 0.2094752 -0.69796216 
		-0.14167252 -0.01697286 0.98976809 -0.14167252 -0.01697286 0.98976809 -0.14167252 
		-0.01697286 0.98976809 -0.14167252 -0.01697286 0.98976809 -0.14167252 -0.01697286 
		0.98976809 -0.29212838 -0.89335626 0.34143177 -0.29212838 -0.89335626 0.34143177 
		-0.29212838 -0.89335626 0.34143177 -0.29212838 -0.89335626 0.34143177 -0.29212838 
		-0.89335626 0.34143177 -0.63636106 -0.41897991 -0.64768845 -0.63636106 -0.41897991 
		-0.64768845 -0.63636106 -0.41897991 -0.64768845 -0.63636106 -0.41897991 -0.64768845 
		-0.63636106 -0.41897991 -0.64768845 -0.45347601 0.89038396 -0.039698437 -0.45347601 
		0.89038396 -0.039698437 -0.45347601 0.89038396 -0.039698437 -0.45347601 0.89038396 
		-0.039698437 -0.45347601 0.89038396 -0.039698437 -0.25905409 0.48081177 0.83768189 
		-0.25905409 0.48081177 0.83768189 -0.25905409 0.48081177 0.83768189 -0.25905409 
		0.48081177 0.83768189 -0.25905409 0.48081177 0.83768189 0.22060984 -0.72434103 
		0.65319318;
	setAttr ".n[498:663]" -type "float3"  0.22060984 -0.72434103 0.65319318 
		0.22060984 -0.72434103 0.65319318 0.22060984 -0.72434103 0.65319318 -0.32124144 
		-0.70076275 -0.63697374 -0.32124144 -0.70076275 -0.63697374 -0.32124144 -0.70076275 
		-0.63697374 -0.32124144 -0.70076275 -0.63697374 -0.32124144 -0.70076275 -0.63697374 
		-0.40485576 0.73876572 -0.53881073 -0.40485576 0.73876572 -0.53881073 -0.40485576 
		0.73876572 -0.53881073 -0.40485576 0.73876572 -0.53881073 -0.42869934 0.80718255 
		0.40579948 -0.42869934 0.80718255 0.40579948 -0.42869934 0.80718255 0.40579948 
		-0.42869934 0.80718255 0.40579948 0.47769922 -0.44265392 0.75885504 0.47769922 
		-0.44265392 0.75885504 0.47769922 -0.44265392 0.75885504 0.47769922 -0.44265392 
		0.75885504 0.30771154 -0.84467971 -0.43798384 0.30771154 -0.84467971 -0.43798384 
		0.30771154 -0.84467971 -0.43798384 0.30771154 -0.84467971 -0.43798384 -0.38885584 
		-0.011269083 -0.92122972 -0.38885584 -0.011269083 -0.92122972 -0.38885584 
		-0.011269083 -0.92122972 -0.38885584 -0.011269083 -0.92122972 0.39385453 
		-0.01407306 0.919065 0.39385453 -0.01407306 0.919065 0.39385453 -0.01407306 
		0.919065 0.39385453 -0.01407306 0.919065 0.52690697 -0.84907687 -0.03791444 
		0.52690697 -0.84907687 -0.03791444 0.52690697 -0.84907687 -0.03791444 0.52690697 
		-0.84907687 -0.03791444 -0.18681204 -0.42613146 -0.88516283 -0.18681204 -0.42613146 
		-0.88516283 -0.18681204 -0.42613146 -0.88516283 -0.18681204 -0.42613146 -0.88516283 
		-0.6325953 0.77441394 0.010305647 -0.6325953 0.77441394 0.010305647 -0.6325953 
		0.77441394 0.010305647 -0.6325953 0.77441394 0.010305647 0.12457639 0.5645085 
		0.81597233 0.12457639 0.5645085 0.81597233 0.12457639 0.5645085 0.81597233 
		0.12457639 0.5645085 0.81597233 0.66672945 -0.69763482 0.26225469 0.66672945 
		-0.69763482 0.26225469 0.66672945 -0.69763482 0.26225469 0.66672945 -0.69763482 
		0.26225469 0.02123384 -0.77147788 -0.63590175 0.02123384 -0.77147788 -0.63590175 
		0.02123384 -0.77147788 -0.63590175 0.02123384 -0.77147788 -0.63590175 -0.75725883 
		0.6163469 -0.21604536 -0.75725883 0.6163469 -0.21604536 -0.75725883 0.6163469 
		-0.21604536 -0.75725883 0.6163469 -0.21604536 -0.28689072 0.90185314 0.32303971 
		-0.28689072 0.90185314 0.32303971 -0.28689072 0.90185314 0.32303971 -0.28689072 
		0.90185314 0.32303971 0.37508878 -0.44245443 0.81458116 0.37508878 -0.44245443 
		0.81458116 0.37508878 -0.44245443 0.81458116 0.37508878 -0.44245443 0.81458116 
		0.0028467781 -0.92299801 -0.38479421 0.0028467781 -0.92299801 -0.38479421 
		0.0028467781 -0.92299801 -0.38479421 0.0028467781 -0.92299801 -0.38479421 
		-0.56051546 0.11818032 -0.81966817 -0.56051546 0.11818032 -0.81966817 -0.56051546 
		0.11818032 -0.81966817 -0.56051546 0.11818032 -0.81966817 -0.38452286 0.84714514 
		0.36672503 -0.38452286 0.84714514 0.36672503 -0.38452286 0.84714514 0.36672503 
		-0.38452286 0.84714514 0.36672503 0.43490174 -0.42118284 0.79590547 0.43490174 
		-0.42118284 0.79590547 0.43490174 -0.42118284 0.79590547 0.43490174 -0.42118284 
		0.79590547 0.20851603 -0.8599785 -0.46578756 0.20851603 -0.8599785 -0.46578756 
		0.20851603 -0.8599785 -0.46578756 0.20851603 -0.8599785 -0.46578756 -0.42205 
		0.037853029 -0.90578192 -0.42205 0.037853029 -0.90578192 -0.42205 0.037853029 
		-0.90578192 -0.42205 0.037853029 -0.90578192 0.35503235 0.030152505 0.9343676 
		0.35503235 0.030152505 0.9343676 0.35503235 0.030152505 0.9343676 0.35503235 
		0.030152505 0.9343676 0.22237307 -0.95855492 0.17810844 0.22237307 -0.95855492 
		0.17810844 0.22237307 -0.95855492 0.17810844 0.22237307 -0.95855492 0.17810844 
		-0.35318077 -0.46645197 -0.81097835 -0.35318077 -0.46645197 -0.81097835 -0.35318077 
		-0.46645197 -0.81097835 -0.35318077 -0.46645197 -0.81097835 -0.42675132 0.90137357 
		-0.073546156 -0.42675132 0.90137357 -0.073546156 -0.42675132 0.90137357 -0.073546156 
		-0.42675132 0.90137357 -0.073546156 0.36567578 -0.0012903156 0.93074143 0.36567578 
		-0.0012903156 0.93074143 0.36567578 -0.0012903156 0.93074143 0.36567578 -0.0012903156 
		0.93074143 0.48414212 -0.87482679 0.016866464 0.48414212 -0.87482679 0.016866464 
		0.48414212 -0.87482679 0.016866464 0.48414212 -0.87482679 0.016866464 -0.17891555 
		-0.42375964 -0.88792849 -0.17891555 -0.42375964 -0.88792849 -0.17891555 -0.42375964 
		-0.88792849 -0.17891555 -0.42375964 -0.88792849 -0.56605798 0.82421631 -0.015678916 
		-0.56605798 0.82421631 -0.015678916 -0.56605798 0.82421631 -0.015678916 -0.56605798 
		0.82421631 -0.015678916 0.017333267 0.6150828 0.78827196 0.017333267 0.6150828 
		0.78827196 0.017333267 0.6150828 0.78827196 0.017333267 0.6150828 0.78827196 
		0.36812708 -0.70950848 0.60089946 0.36812708 -0.70950848 0.60089946 0.36812708 
		-0.70950848 0.60089946 0.36812708 -0.70950848 0.60089946 -0.11385411 -0.69849598 
		-0.7064988 -0.11385411 -0.69849598 -0.7064988 -0.11385411 -0.69849598 -0.7064988 
		-0.11385411 -0.69849598 -0.7064988 -0.54444402 0.67135787 -0.50285125 -0.54444402 
		0.67135787 -0.50285125 -0.54444402 0.67135787 -0.50285125 -0.54444402 0.67135787 
		-0.50285125 0.077147804 0.59378105 0.80091965 0.077147804 0.59378105 0.80091965 
		0.077147804 0.59378105 0.80091965 0.077147804 0.59378105 0.80091965 0.54588723 
		-0.7102105 0.44453138 0.54588723 -0.7102105 0.44453138 0.54588723 -0.7102105 
		0.44453138 0.54588723 -0.7102105 0.44453138 -0.097478651 -0.727548 -0.67909634 
		-0.097478651 -0.727548 -0.67909634 -0.097478651 -0.727548 -0.67909634 -0.097478651 
		-0.727548 -0.67909634 -0.66569817 0.6610477 -0.34621072 -0.66569817 0.6610477 
		-0.34621072 -0.66569817 0.6610477 -0.34621072 -0.66569817 0.6610477 -0.34621072 
		-0.99140435 0.060749322 -0.11587487 -0.99140435 0.060749322 -0.11587487 -0.99140435 
		0.060749322 -0.11587487 -0.99140435 0.060749322 -0.11587487 -0.89751232 -0.40441033 
		0.17585211 -0.89751232 -0.40441033 0.17585211 -0.89751232 -0.40441033 0.17585211 
		-0.89751232 -0.40441033 0.17585211 -0.46987405 0.76061434 -0.4479779 -0.46987405 
		0.76061434 -0.4479779;
	setAttr ".n[664:829]" -type "float3"  -0.46987405 0.76061434 -0.4479779 
		-0.46987405 0.76061434 -0.4479779 -0.095548451 0.44394171 0.89094681 -0.095548451 
		0.44394171 0.89094681 -0.095548451 0.44394171 0.89094681 -0.095548451 0.44394171 
		0.89094681 0.088169396 -0.87197942 0.48153722 0.088169396 -0.87197942 0.48153722 
		0.088169396 -0.87197942 0.48153722 0.088169396 -0.87197942 0.48153722 -0.32659727 
		-0.42832884 -0.84253705 -0.32659727 -0.42832884 -0.84253705 -0.32659727 -0.42832884 
		-0.84253705 -0.32659727 -0.42832884 -0.84253705 -0.82594913 0.48110464 -0.29384756 
		-0.82594913 0.48110464 -0.29384756 -0.82594913 0.48110464 -0.29384756 -0.82594913 
		0.48110464 -0.29384756 -0.3347559 0.11705439 0.93500632 -0.3347559 0.11705439 
		0.93500632 -0.3347559 0.11705439 0.93500632 -0.3347559 0.11705439 0.93500632 
		-0.19304942 0.36829132 0.90944678 -0.19304942 0.36829132 0.90944678 -0.19304942 
		0.36829132 0.90944678 -0.19304942 0.36829132 0.90944678 0.65015429 -0.47668779 
		0.59166551 0.65015429 -0.47668779 0.59166551 0.65015429 -0.47668779 0.59166551 
		0.59130013 -0.78821903 0.17051376 0.59130013 -0.78821903 0.17051376 0.59130013 
		-0.78821903 0.17051376 -0.58466154 -0.68792003 0.43004289 -0.58466154 -0.68792003 
		0.43004289 -0.58466154 -0.68792003 0.43004289 -0.58466154 -0.68792003 0.43004289 
		-0.58466154 -0.68792003 0.43004289 -0.40019464 -0.90837103 0.12126949 -0.40019464 
		-0.90837103 0.12126949 -0.40019464 -0.90837103 0.12126949 -0.40019464 -0.90837103 
		0.12126949 -0.47658592 0.4869107 0.73197258 -0.47658592 0.4869107 0.73197258 
		-0.47658592 0.4869107 0.73197258 -0.47658592 0.4869107 0.73197258 -0.47658592 
		0.4869107 0.73197258 -0.47658592 0.4869107 0.73197258 -0.92935151 0.33304131 
		0.15933995 -0.92935151 0.33304131 0.15933995 -0.92935151 0.33304131 0.15933995 
		-0.92935151 0.33304131 0.15933995 -0.43887076 0.5531798 0.70808512 -0.43887076 
		0.5531798 0.70808512 -0.43887076 0.5531798 0.70808512 -0.43887076 0.5531798 
		0.70808512 -0.19288737 0.92470664 0.32819512 -0.19288737 0.92470664 0.32819512 
		-0.19288737 0.92470664 0.32819512 -0.19288737 0.92470664 0.32819512 -0.98299015 
		0.18365812 0.00012244335 -0.98299015 0.18365812 0.00012244335 -0.98299015 
		0.18365812 0.00012244335 -0.98299015 0.18365812 0.00012244335 -0.87228358 
		0.20651683 0.44325182 -0.87228358 0.20651683 0.44325182 -0.87228358 0.20651683 
		0.44325182 -0.87228358 0.20651683 0.44325182 -0.96168095 0.026296543 0.27290702 
		-0.96168095 0.026296543 0.27290702 -0.96168095 0.026296543 0.27290702 -0.68997985 
		0.17084022 0.70337856 -0.68997985 0.17084022 0.70337856 -0.68997985 0.17084022 
		0.70337856 -0.68997985 0.17084022 0.70337856 -0.50501531 0.76009357 0.40892202 
		-0.50501531 0.76009357 0.40892202 -0.50501531 0.76009357 0.40892202 -0.50501531 
		0.76009357 0.40892202 -0.61607248 0.60830408 0.50042063 -0.61607248 0.60830408 
		0.50042063 -0.61607248 0.60830408 0.50042063 -0.61607248 0.60830408 0.50042063 
		-0.61607248 0.60830408 0.50042063 -0.79069376 0.016748961 0.61198276 -0.79069376 
		0.016748961 0.61198276 -0.79069376 0.016748961 0.61198276 -0.79069376 0.016748961 
		0.61198276 -0.21237934 0.40534353 0.88915217 -0.21237934 0.40534353 0.88915217 
		-0.21237934 0.40534353 0.88915217 -0.21237934 0.40534353 0.88915217 -0.33845773 
		0.87171566 0.35434186 -0.33845773 0.87171566 0.35434186 -0.33845773 0.87171566 
		0.35434186 -0.76059574 0.083618261 0.64381838 -0.76059574 0.083618261 0.64381838 
		-0.76059574 0.083618261 0.64381838 -0.76059574 0.083618261 0.64381838 -0.35387459 
		0.69648701 0.62424248 -0.35387459 0.69648701 0.62424248 -0.35387459 0.69648701 
		0.62424248 -0.35387459 0.69648701 0.62424248 -0.83284062 0.35080415 0.42815062 
		-0.83284062 0.35080415 0.42815062 -0.83284062 0.35080415 0.42815062 -0.83284062 
		0.35080415 0.42815062 -0.15378129 -0.0045410753 0.98809445 -0.15378129 -0.0045410753 
		0.98809445 -0.15378129 -0.0045410753 0.98809445 -0.15378129 -0.0045410753 
		0.98809445 -0.77169591 0.62184203 0.13340895 -0.77169591 0.62184203 0.13340895 
		-0.77169591 0.62184203 0.13340895 -0.77169591 0.62184203 0.13340895 -0.96935457 
		0.23028551 0.085558519 -0.96935457 0.23028551 0.085558519 -0.96935457 0.23028551 
		0.085558519 -0.96935457 0.23028551 0.085558519 -0.4120988 0.86832947 0.27600452 
		-0.4120988 0.86832947 0.27600452 -0.4120988 0.86832947 0.27600452 -0.4120988 
		0.86832947 0.27600452 -0.13747977 0.48806518 0.86191165 -0.13747977 0.48806518 
		0.86191165 -0.13747977 0.48806518 0.86191165 -0.13747977 0.48806518 0.86191165 
		-0.99241954 0.092553973 0.080853425 -0.99241954 0.092553973 0.080853425 -0.99241954 
		0.092553973 0.080853425 -0.99241954 0.092553973 0.080853425 -0.98295969 0.17057496 
		0.068516128 -0.98295969 0.17057496 0.068516128 -0.98295969 0.17057496 0.068516128 
		-0.98295969 0.17057496 0.068516128 -0.99394143 0.018689327 0.10831022 -0.99394143 
		0.018689327 0.10831022 -0.99394143 0.018689327 0.10831022 -0.99394143 0.018689327 
		0.10831022 -0.79904675 -0.039260559 0.59998578 -0.79904675 -0.039260559 0.59998578 
		-0.79904675 -0.039260559 0.59998578 -0.79904675 -0.039260559 0.59998578 -0.83129096 
		-0.48129591 0.27804592 -0.83129096 -0.48129591 0.27804592 -0.83129096 -0.48129591 
		0.27804592 -0.83129096 -0.48129591 0.27804592 -0.89666116 0.3238861 0.30182213 
		-0.89666116 0.3238861 0.30182213 -0.89666116 0.3238861 0.30182213 -0.89666116 
		0.3238861 0.30182213 -0.053526185 0.92942488 0.3651087 -0.053526185 0.92942488 
		0.3651087 -0.053526185 0.92942488 0.3651087 -0.053526185 0.92942488 0.3651087 
		0.4698112 0.66675997 0.57854003 0.4698112 0.66675997 0.57854003 0.4698112 
		0.66675997 0.57854003 0.4698112 0.66675997 0.57854003 0.63952988 -0.54013443 
		0.54704326 0.63952988 -0.54013443 0.54704326 0.63952988 -0.54013443 0.54704326 
		0.63952988 -0.54013443 0.54704326 0.096193016 -0.69446975 0.71306294 0.096193016 
		-0.69446975 0.71306294 0.096193016 -0.69446975 0.71306294 0.096193016 -0.69446975 
		0.71306294;
	setAttr ".n[830:995]" -type "float3"  0.76296747 0.59424478 0.25446761 
		0.76296747 0.59424478 0.25446761 0.76296747 0.59424478 0.25446761 0.76296747 
		0.59424478 0.25446761 0.93108261 0.0094236275 0.36468673 0.93108261 0.0094236275 
		0.36468673 0.93108261 0.0094236275 0.36468673 0.93108261 0.0094236275 0.36468673 
		-0.21020909 -0.5700466 0.79426634 -0.21020909 -0.5700466 0.79426634 -0.21020909 
		-0.5700466 0.79426634 -0.21020909 -0.5700466 0.79426634 -0.75886035 -0.43703592 
		0.48283598 -0.75886035 -0.43703592 0.48283598 -0.75886035 -0.43703592 0.48283598 
		-0.75886035 -0.43703592 0.48283598 -0.85414511 0.41407683 0.31460533 -0.85414511 
		0.41407683 0.31460533 -0.85414511 0.41407683 0.31460533 -0.85414511 0.41407683 
		0.31460533 -0.088662766 0.94279301 0.32137239 -0.088662766 0.94279301 0.32137239 
		-0.088662766 0.94279301 0.32137239 -0.088662766 0.94279301 0.32137239 0.27740988 
		0.28236932 0.91831982 0.27740988 0.28236932 0.91831982 0.27740988 0.28236932 
		0.91831982 0.27740988 0.28236932 0.91831982 -0.6441595 0.038894229 0.76390171 
		-0.6441595 0.038894229 0.76390171 -0.6441595 0.038894229 0.76390171 -0.6441595 
		0.038894229 0.76390171 -0.10061182 0.34407938 0.9335345 -0.10061182 0.34407938 
		0.9335345 -0.10061182 0.34407938 0.9335345 -0.10061182 0.34407938 0.9335345 
		-0.41336575 0.6466276 0.64109403 -0.41336575 0.6466276 0.64109403 -0.41336575 
		0.6466276 0.64109403 -0.41336575 0.6466276 0.64109403 -0.29572654 -0.077665918 
		0.95211017 -0.29572654 -0.077665918 0.95211017 -0.29572654 -0.077665918 0.95211017 
		-0.29572654 -0.077665918 0.95211017 -0.42332429 0.9031539 -0.071481459 -0.42332429 
		0.9031539 -0.071481459 -0.42332429 0.9031539 -0.071481459 -0.42332429 0.9031539 
		-0.071481459 -0.41872388 0.54053462 -0.72972095 -0.41872388 0.54053462 -0.72972095 
		-0.41872388 0.54053462 -0.72972095 -0.41872388 0.54053462 -0.72972095 -0.046487916 
		-0.56248659 0.82549852 -0.046487916 -0.56248659 0.82549852 -0.046487916 -0.56248659 
		0.82549852 -0.046487916 -0.56248659 0.82549852 -0.12944312 -0.97872883 -0.15916762 
		-0.12944312 -0.97872883 -0.15916762 -0.12944312 -0.97872883 -0.15916762 -0.12944312 
		-0.97872883 -0.15916762 -0.1730791 -0.94402474 -0.28082189 -0.1730791 -0.94402474 
		-0.28082189 -0.1730791 -0.94402474 -0.28082189 -0.1730791 -0.94402474 -0.28082189 
		-0.34094968 0.086034715 -0.93613636 -0.34094968 0.086034715 -0.93613636 -0.34094968 
		0.086034715 -0.93613636 -0.34094968 0.086034715 -0.93613636 -0.014556206 
		0.88010812 0.47455007 -0.014556206 0.88010812 0.47455007 -0.014556206 0.88010812 
		0.47455007 -0.014556206 0.88010812 0.47455007 0.0039653559 0.15903755 0.98726457 
		0.0039653559 0.15903755 0.98726457 0.0039653559 0.15903755 0.98726457 0.0039653559 
		0.15903755 0.98726457 0.0091776457 0.98704714 0.16016789 0.0091776457 0.98704714 
		0.16016789 0.0091776457 0.98704714 0.16016789 0.0091776457 0.98704714 0.16016789 
		0.21584357 0.8566435 -0.46858665 0.21584357 0.8566435 -0.46858665 0.21584357 
		0.8566435 -0.46858665 0.21584357 0.8566435 -0.46858665 0.0061214124 -0.57426023 
		0.81864989 0.0061214124 -0.57426023 0.81864989 0.0061214124 -0.57426023 0.81864989 
		0.0061214124 -0.57426023 0.81864989 0.12945409 -0.98572665 -0.10763201 0.12945409 
		-0.98572665 -0.10763201 0.12945409 -0.98572665 -0.10763201 0.12945409 -0.98572665 
		-0.10763201 0.18569092 -0.92057675 -0.3435947 0.18569092 -0.92057675 -0.3435947 
		0.18569092 -0.92057675 -0.3435947 0.18569092 -0.92057675 -0.3435947 0.24075152 
		0.23361163 -0.94205326 0.24075152 0.23361163 -0.94205326 0.24075152 0.23361163 
		-0.94205326 0.24075152 0.23361163 -0.94205326 0.2680659 0.74931657 0.60552895 
		0.2680659 0.74931657 0.60552895 0.2680659 0.74931657 0.60552895 0.2680659 
		0.74931657 0.60552895 0.28651455 0.088905379 0.95394194 0.28651455 0.088905379 
		0.95394194 0.28651455 0.088905379 0.95394194 0.28651455 0.088905379 0.95394194 
		0.06284444 0.99343812 0.095557556 0.06284444 0.99343812 0.095557556 0.06284444 
		0.99343812 0.095557556 0.06284444 0.99343812 0.095557556 0.23039858 0.78565431 
		-0.57416362 0.23039858 0.78565431 -0.57416362 0.23039858 0.78565431 -0.57416362 
		0.23039858 0.78565431 -0.57416362 0.0062772674 -0.52813303 0.84913844 0.0062772674 
		-0.52813303 0.84913844 0.0062772674 -0.52813303 0.84913844 0.0062772674 -0.52813303 
		0.84913844 0.22327983 -0.97475308 -0.0015820439 0.22327983 -0.97475308 -0.0015820439 
		0.22327983 -0.97475308 -0.0015820439 0.22327983 -0.97475308 -0.0015820439 
		0.33203605 -0.83791184 -0.43319258 0.33203605 -0.83791184 -0.43319258 0.33203605 
		-0.83791184 -0.43319258 0.33203605 -0.83791184 -0.43319258 0.49507993 0.26381448 
		-0.8278271 0.49507993 0.26381448 -0.8278271 0.49507993 0.26381448 -0.8278271 
		0.49507993 0.26381448 -0.8278271 -0.36046812 0.83029592 0.42505461 -0.36046812 
		0.83029592 0.42505461 -0.36046812 0.83029592 0.42505461 -0.36046812 0.83029592 
		0.42505461 -0.597628 0.16517204 0.78457564 -0.597628 0.16517204 0.78457564 
		-0.597628 0.16517204 0.78457564 -0.597628 0.16517204 0.78457564 -0.17847362 
		0.98054415 0.0817331 -0.17847362 0.98054415 0.0817331 -0.17847362 0.98054415 
		0.0817331 -0.17847362 0.98054415 0.0817331 -0.20874515 0.78857261 -0.57842785 
		-0.20874515 0.78857261 -0.57842785 -0.20874515 0.78857261 -0.57842785 -0.20874515 
		0.78857261 -0.57842785 -0.54838288 -0.56799108 0.61372823 -0.54838288 -0.56799108 
		0.61372823 -0.54838288 -0.56799108 0.61372823 -0.54838288 -0.56799108 0.61372823 
		-0.20021905 -0.9673903 -0.15513982 -0.20021905 -0.9673903 -0.15513982 -0.20021905 
		-0.9673903 -0.15513982 -0.20021905 -0.9673903 -0.15513982 -0.17359224 -0.90900898 
		-0.37890422 -0.17359224 -0.90900898 -0.37890422 -0.17359224 -0.90900898 -0.37890422 
		-0.17359224 -0.90900898 -0.37890422 -0.2536456 0.28116232 -0.92553318 -0.2536456 
		0.28116232 -0.92553318 -0.2536456 0.28116232 -0.92553318 -0.2536456 0.28116232 
		-0.92553318 0.17551225 0.78824848 0.58979636 0.17551225 0.78824848 0.58979636;
	setAttr ".n[996:1161]" -type "float3"  0.17551225 0.78824848 0.58979636 
		0.17551225 0.78824848 0.58979636 0.21028996 0.093202516 0.97318625 0.21028996 
		0.093202516 0.97318625 0.21028996 0.093202516 0.97318625 0.21028996 0.093202516 
		0.97318625 0.11976126 0.98691672 0.1079471 0.11976126 0.98691672 0.1079471 
		0.11976126 0.98691672 0.1079471 0.11976126 0.98691672 0.1079471 0.029666705 
		0.86282718 -0.50462776 0.029666705 0.86282718 -0.50462776 0.029666705 0.86282718 
		-0.50462776 0.029666705 0.86282718 -0.50462776 0.24989103 -0.46710262 0.84815663 
		0.24989103 -0.46710262 0.84815663 0.24989103 -0.46710262 0.84815663 0.24989103 
		-0.46710262 0.84815663 0.15746993 -0.98641312 0.046822883 0.15746993 -0.98641312 
		0.046822883 0.15746993 -0.98641312 0.046822883 0.15746993 -0.98641312 0.046822883 
		0.013173696 -0.80949265 -0.58698213 0.013173696 -0.80949265 -0.58698213 0.013173696 
		-0.80949265 -0.58698213 0.013173696 -0.80949265 -0.58698213 -0.062197067 
		0.31909382 -0.94568002 -0.062197067 0.31909382 -0.94568002 -0.062197067 0.31909382 
		-0.94568002 -0.062197067 0.31909382 -0.94568002 -0.75026721 0.25308901 -0.61077416 
		-0.75026721 0.25308901 -0.61077416 -0.75026721 0.25308901 -0.61077416 -0.75026721 
		0.25308901 -0.61077416 -0.45952395 -0.84704804 -0.26710922 -0.45952395 -0.84704804 
		-0.26710922 -0.45952395 -0.84704804 -0.26710922 -0.45952395 -0.84704804 -0.26710922 
		-0.2801249 -0.8542707 -0.43789446 -0.2801249 -0.8542707 -0.43789446 -0.2801249 
		-0.8542707 -0.43789446 -0.2801249 -0.8542707 -0.43789446 0.18499815 -0.98268312 
		-0.010469105 0.18499815 -0.98268312 -0.010469105 0.18499815 -0.98268312 -0.010469105 
		0.18499815 -0.98268312 -0.010469105 -0.93364424 -0.21416228 0.28712875 -0.93364424 
		-0.21416228 0.28712875 -0.93364424 -0.21416228 0.28712875 -0.93364424 -0.21416228 
		0.28712875 -0.93364424 -0.21416228 0.28712875 -0.55796272 -0.73985201 0.37589443 
		-0.55796272 -0.73985201 0.37589443 -0.55796272 -0.73985201 0.37589443 -0.55796272 
		-0.73985201 0.37589443 -0.67867917 0.1520195 -0.71852952 -0.67867917 0.1520195 
		-0.71852952 -0.67867917 0.1520195 -0.71852952 -0.67867917 0.1520195 -0.71852952 
		-0.26605204 0.5823409 -0.76817667 -0.26605204 0.5823409 -0.76817667 -0.26605204 
		0.5823409 -0.76817667 -0.26605204 0.5823409 -0.76817667 -0.19934238 0.4160634 
		-0.88721693 -0.19934238 0.4160634 -0.88721693 -0.19934238 0.4160634 -0.88721693 
		-0.19934238 0.4160634 -0.88721693 -0.49218836 -0.86814147 -0.063883163 -0.49218836 
		-0.86814147 -0.063883163 -0.49218836 -0.86814147 -0.063883163 -0.49218836 
		-0.86814147 -0.063883163 -0.18500055 -0.9826827 -0.010465969 -0.18500055 
		-0.9826827 -0.010465969 -0.18500055 -0.9826827 -0.010465969 -0.18500055 -0.9826827 
		-0.010465969 -0.28519493 -0.94103241 -0.18199408 -0.28519493 -0.94103241 
		-0.18199408 -0.28519493 -0.94103241 -0.18199408 -0.95009959 -0.27608603 -0.14521457 
		-0.95009959 -0.27608603 -0.14521457 -0.95009959 -0.27608603 -0.14521457 -0.95009959 
		-0.27608603 -0.14521457 -0.9563126 -0.26305628 -0.12754449 -0.9563126 -0.26305628 
		-0.12754449 -0.9563126 -0.26305628 -0.12754449 -0.9563126 -0.26305628 -0.12754449 
		0.28012678 -0.85427076 -0.43789318 0.28012678 -0.85427076 -0.43789318 0.28012678 
		-0.85427076 -0.43789318 0.28012678 -0.85427076 -0.43789318 -0.75981152 -0.46966764 
		-0.44955391 -0.75981152 -0.46966764 -0.44955391 -0.75981152 -0.46966764 -0.44955391 
		-0.75981152 -0.46966764 -0.44955391 -0.83830786 -0.06454809 -0.54136258 -0.83830786 
		-0.06454809 -0.54136258 -0.83830786 -0.06454809 -0.54136258 -0.83830786 -0.06454809 
		-0.54136258 -0.36838612 0.18318246 -0.91144711 -0.36838612 0.18318246 -0.91144711 
		-0.36838612 0.18318246 -0.91144711 -0.36838612 0.18318246 -0.91144711 -0.54648185 
		-0.81110573 0.20848285 -0.54648185 -0.81110573 0.20848285 -0.54648185 -0.81110573 
		0.20848285 -0.54648185 -0.81110573 0.20848285 -0.38939351 -0.91892034 0.062913403 
		-0.38939351 -0.91892034 0.062913403 -0.38939351 -0.91892034 0.062913403 -0.38939351 
		-0.91892034 0.062913403 -0.92267132 -0.30368027 0.23760457 -0.92267132 -0.30368027 
		0.23760457 -0.92267132 -0.30368027 0.23760457 -0.92267132 -0.30368027 0.23760457 
		-0.92267132 -0.30368027 0.23760457 -0.92267132 -0.30368027 0.23760457 -0.9829039 
		0.16851977 -0.074168891 -0.9829039 0.16851977 -0.074168891 -0.9829039 0.16851977 
		-0.074168891 -0.9829039 0.16851977 -0.074168891 -0.44232094 0.39478621 -0.80529255 
		-0.44232094 0.39478621 -0.80529255 -0.44232094 0.39478621 -0.80529255 -0.44232094 
		0.39478621 -0.80529255 0.0046348847 -0.42164457 0.90674931 0.0046348847 -0.42164457 
		0.90674931 0.0046348847 -0.42164457 0.90674931 0.0046348847 -0.42164457 0.90674931 
		-0.52845007 -0.25528741 0.80967206 -0.52845007 -0.25528741 0.80967206 -0.52845007 
		-0.25528741 0.80967206 -0.52845007 -0.25528741 0.80967206 -0.96657109 0.053517878 
		0.2507512 -0.96657109 0.053517878 0.2507512 -0.96657109 0.053517878 0.2507512 
		-0.96657109 0.053517878 0.2507512 -0.95534956 0.28047025 -0.092971303 -0.95534956 
		0.28047025 -0.092971303 -0.95534956 0.28047025 -0.092971303 -0.95534956 0.28047025 
		-0.092971303 -0.40508455 0.40034279 -0.82196844 -0.40508455 0.40034279 -0.82196844 
		-0.40508455 0.40034279 -0.82196844 -0.40508455 0.40034279 -0.82196844 0.93864393 
		0.11890817 0.32374123 0.93864393 0.11890817 0.32374123 0.93864393 0.11890817 
		0.32374123 0.93864393 0.11890817 0.32374123 -4.8032138e-007 -0.17086132 0.98529512 
		-4.8032138e-007 -0.17086132 0.98529512 -4.8032138e-007 -0.17086132 0.98529512 
		-4.8032138e-007 -0.17086132 0.98529512 -0.37264913 -0.12208463 0.9199065 
		-0.37264913 -0.12208463 0.9199065 -0.37264913 -0.12208463 0.9199065 -0.37264913 
		-0.12208463 0.9199065 -0.93864447 0.11890699 0.32374021 -0.93864447 0.11890699 
		0.32374021 -0.93864447 0.11890699 0.32374021 -0.93864447 0.11890699 0.32374021 
		0.40508282 0.400345 -0.82196826 0.40508282 0.400345 -0.82196826 0.40508282 
		0.400345 -0.82196826 0.40508282 0.400345 -0.82196826 0.95534909 0.28047252 
		-0.092969075 0.95534909 0.28047252 -0.092969075;
	setAttr ".n[1162:1327]" -type "float3"  0.95534909 0.28047252 -0.092969075 
		0.95534909 0.28047252 -0.092969075 -0.23433208 0.73762572 -0.63324308 -0.23433208 
		0.73762572 -0.63324308 -0.23433208 0.73762572 -0.63324308 -0.23433208 0.73762572 
		-0.63324308 0.28349909 0.46280453 0.8399049 0.28349909 0.46280453 0.8399049 
		0.28349909 0.46280453 0.8399049 0.28349909 0.46280453 0.8399049 0.23432888 
		0.7376253 -0.63324475 0.23432888 0.7376253 -0.63324475 0.23432888 0.7376253 
		-0.63324475 0.23432888 0.7376253 -0.63324475 -0.2863681 0.56901795 -0.77085143 
		-0.2863681 0.56901795 -0.77085143 -0.2863681 0.56901795 -0.77085143 -0.2863681 
		0.56901795 -0.77085143 0.35857531 -0.12948455 0.92447686 0.35857531 -0.12948455 
		0.92447686 0.35857531 -0.12948455 0.92447686 0.35857531 -0.12948455 0.92447686 
		0.28636661 0.56901902 -0.77085119 0.28636661 0.56901902 -0.77085119 0.28636661 
		0.56901902 -0.77085119 0.28636661 0.56901902 -0.77085119 -0.41392708 0.90675104 
		0.080417149 -0.41392708 0.90675104 0.080417149 -0.41392708 0.90675104 0.080417149 
		-0.41392708 0.90675104 0.080417149 -0.46046609 0.73054057 -0.50426328 -0.46046609 
		0.73054057 -0.50426328 -0.46046609 0.73054057 -0.50426328 -0.46046609 0.73054057 
		-0.50426328 0.31379318 0.80114633 0.50960612 0.31379318 0.80114633 0.50960612 
		0.31379318 0.80114633 0.50960612 0.31379318 0.80114633 0.50960612 0.33428973 
		0.26646727 0.90401638 0.33428973 0.26646727 0.90401638 0.33428973 0.26646727 
		0.90401638 0.33428973 0.26646727 0.90401638 -0.31379664 0.80114579 0.50960487 
		-0.31379664 0.80114579 0.50960487 -0.31379664 0.80114579 0.50960487 -0.31379664 
		0.80114579 0.50960487 -0.33429188 0.2664693 0.904015 -0.33429188 0.2664693 
		0.904015 -0.33429188 0.2664693 0.904015 -0.33429188 0.2664693 0.904015 0.41392404 
		0.90675229 0.080419116 0.41392404 0.90675229 0.080419116 0.41392404 0.90675229 
		0.080419116 0.41392404 0.90675229 0.080419116 0.46046624 0.73054165 -0.50426155 
		0.46046624 0.73054165 -0.50426155 0.46046624 0.73054165 -0.50426155 0.46046624 
		0.73054165 -0.50426155 -0.37001258 0.28238764 -0.88506943 -0.37001258 0.28238764 
		-0.88506943 -0.37001258 0.28238764 -0.88506943 -0.37001258 0.28238764 -0.88506943 
		0.40374389 -0.42372471 0.81083184 0.40374389 -0.42372471 0.81083184 0.40374389 
		-0.42372471 0.81083184 0.40374389 -0.42372471 0.81083184 0.37001136 0.28238863 
		-0.88506961 0.37001136 0.28238863 -0.88506961 0.37001136 0.28238863 -0.88506961 
		0.37001136 0.28238863 -0.88506961 0.051281169 0.82212919 0.56698662 0.051281169 
		0.82212919 0.56698662 0.051281169 0.82212919 0.56698662 0.051281169 0.82212919 
		0.56698662 0.29840025 -0.025849594 0.95409071 0.29840025 -0.025849594 0.95409071 
		0.29840025 -0.025849594 0.95409071 0.29840025 -0.025849594 0.95409071 -0.015498814 
		0.99836433 0.055030759 -0.015498814 0.99836433 0.055030759 -0.015498814 0.99836433 
		0.055030759 -0.015498814 0.99836433 0.055030759 0.31972495 0.65912205 -0.68068653 
		0.31972495 0.65912205 -0.68068653 0.31972495 0.65912205 -0.68068653 0.31972495 
		0.65912205 -0.68068653 0.49395004 -0.41932085 0.76169771 0.49395004 -0.41932085 
		0.76169771 0.49395004 -0.41932085 0.76169771 0.49395004 -0.41932085 0.76169771 
		0.54866582 -0.82572395 -0.13094221 0.54866582 -0.82572395 -0.13094221 0.54866582 
		-0.82572395 -0.13094221 0.54866582 -0.82572395 -0.13094221 0.43223682 -0.83700073 
		-0.33556083 0.43223682 -0.83700073 -0.33556083 0.43223682 -0.83700073 -0.33556083 
		0.43223682 -0.83700073 -0.33556083 0.56339079 0.1245084 -0.81675482 0.56339079 
		0.1245084 -0.81675482 0.56339079 0.1245084 -0.81675482 0.56339079 0.1245084 
		-0.81675482 -0.9481203 -0.11481822 -0.29645354 -0.9481203 -0.11481822 -0.29645354 
		-0.9481203 -0.11481822 -0.29645354 -0.9481203 -0.11481822 -0.29645354 -0.38758507 
		0.22603816 -0.89369154 -0.38758507 0.22603816 -0.89369154 -0.38758507 0.22603816 
		-0.89369154 -0.38758507 0.22603816 -0.89369154 0.94853681 -0.27938566 0.14906873 
		0.94853681 -0.27938566 0.14906873 0.94853681 -0.27938566 0.14906873 0.94853681 
		-0.27938566 0.14906873 0.37620571 -0.56554896 0.73390985 0.37620571 -0.56554896 
		0.73390985 0.37620571 -0.56554896 0.73390985 0.37620571 -0.56554896 0.73390985 
		-0.94853681 -0.2793861 0.14906815 -0.94853681 -0.2793861 0.14906815 -0.94853681 
		-0.2793861 0.14906815 -0.94853681 -0.2793861 0.14906815 0.38758367 0.22603926 
		-0.89369184 0.38758367 0.22603926 -0.89369184 0.38758367 0.22603926 -0.89369184 
		0.38758367 0.22603926 -0.89369184 0.94812095 -0.11481779 -0.2964516 0.94812095 
		-0.11481779 -0.2964516 0.94812095 -0.11481779 -0.2964516 0.94812095 -0.11481779 
		-0.2964516 -0.92434156 -0.25385574 -0.28486836 -0.92434156 -0.25385574 -0.28486836 
		-0.92434156 -0.25385574 -0.28486836 -0.92434156 -0.25385574 -0.28486836 -0.4196392 
		0.19440274 -0.88662875 -0.4196392 0.19440274 -0.88662875 -0.4196392 0.19440274 
		-0.88662875 -0.4196392 0.19440274 -0.88662875 0.76451582 -0.64459854 0.0028821072 
		0.76451582 -0.64459854 0.0028821072 0.76451582 -0.64459854 0.0028821072 0.76451582 
		-0.64459854 0.0028821072 0.12090006 -0.8467145 0.51812905 0.12090006 -0.8467145 
		0.51812905 0.12090006 -0.8467145 0.51812905 0.12090006 -0.8467145 0.51812905 
		-0.76451248 -0.64460248 0.0028843682 -0.76451248 -0.64460248 0.0028843682 
		-0.76451248 -0.64460248 0.0028843682 -0.76451248 -0.64460248 0.0028843682 
		0.41963875 0.19440229 -0.88662905 0.41963875 0.19440229 -0.88662905 0.41963875 
		0.19440229 -0.88662905 0.41963875 0.19440229 -0.88662905 0.92434448 -0.2538504 
		-0.28486368 0.92434448 -0.2538504 -0.28486368 0.92434448 -0.2538504 -0.28486368 
		0.92434448 -0.2538504 -0.28486368 -0.96079719 -0.14850222 -0.23412772 -0.96079719 
		-0.14850222 -0.23412772 -0.96079719 -0.14850222 -0.23412772 -0.96079719 -0.14850222 
		-0.23412772 -0.45698214 0.14702274 -0.87724096 -0.45698214 0.14702274 -0.87724096 
		-0.45698214 0.14702274 -0.87724096 -0.45698214 0.14702274 -0.87724096;
	setAttr ".n[1328:1493]" -type "float3"  0.90814096 -0.38617295 0.16171101 
		0.90814096 -0.38617295 0.16171101 0.90814096 -0.38617295 0.16171101 0.90814096 
		-0.38617295 0.16171101 0.29485607 -0.63347733 0.71537846 0.29485607 -0.63347733 
		0.71537846 0.29485607 -0.63347733 0.71537846 0.29485607 -0.63347733 0.71537846 
		-0.90860176 -0.40279004 0.11046752 -0.90860176 -0.40279004 0.11046752 -0.90860176 
		-0.40279004 0.11046752 -0.90860176 -0.40279004 0.11046752 0.45698124 0.14702493 
		-0.87724102 0.45698124 0.14702493 -0.87724102 0.45698124 0.14702493 -0.87724102 
		0.45698124 0.14702493 -0.87724102 0.95899272 -0.18485877 -0.21484932 0.95899272 
		-0.18485877 -0.21484932 0.95899272 -0.18485877 -0.21484932 0.95899272 -0.18485877 
		-0.21484932 -0.96450156 0.00082748674 -0.26407585 -0.96450156 0.00082748674 
		-0.26407585 -0.96450156 0.00082748674 -0.26407585 -0.96450156 0.00082748674 
		-0.26407585 -0.49295264 0.12551156 -0.8609556 -0.49295264 0.12551156 -0.8609556 
		-0.49295264 0.12551156 -0.8609556 -0.49295264 0.12551156 -0.8609556 0.93285066 
		-0.21485107 0.28918612 0.93285066 -0.21485107 0.28918612 0.93285066 -0.21485107 
		0.28918612 0.93285066 -0.21485107 0.28918612 0.43366003 -0.27464247 0.85820192 
		0.43366003 -0.27464247 0.85820192 0.43366003 -0.27464247 0.85820192 0.43366003 
		-0.27464247 0.85820192 -0.96012813 -0.11441723 0.25507373 -0.96012813 -0.11441723 
		0.25507373 -0.96012813 -0.11441723 0.25507373 -0.96012813 -0.11441723 0.25507373 
		0.49295098 0.12551467 -0.86095613 0.49295098 0.12551467 -0.86095613 0.49295098 
		0.12551467 -0.86095613 0.49295098 0.12551467 -0.86095613 0.97515434 0.039601751 
		-0.21795797 0.97515434 0.039601751 -0.21795797 0.97515434 0.039601751 -0.21795797 
		0.97515434 0.039601751 -0.21795797 -0.80371958 0.57377023 -0.1575518 -0.80371958 
		0.57377023 -0.1575518 -0.80371958 0.57377023 -0.1575518 -0.80371958 0.57377023 
		-0.1575518 -0.54463309 0.53504092 -0.64583749 -0.54463309 0.53504092 -0.64583749 
		-0.54463309 0.53504092 -0.64583749 -0.54463309 0.53504092 -0.64583749 0.81890309 
		0.52551764 0.23071398 0.81890309 0.52551764 0.23071398 0.81890309 0.52551764 
		0.23071398 0.81890309 0.52551764 0.23071398 0.20849368 0.46752343 0.85904151 
		0.20849368 0.46752343 0.85904151 0.20849368 0.46752343 0.85904151 0.20849368 
		0.46752343 0.85904151 -0.80402344 0.54267508 0.24300237 -0.80402344 0.54267508 
		0.24300237 -0.80402344 0.54267508 0.24300237 -0.80402344 0.54267508 0.24300237 
		0.54462993 0.53504223 -0.64583904 0.54462993 0.53504223 -0.64583904 0.54462993 
		0.53504223 -0.64583904 0.54462993 0.53504223 -0.64583904 0.79435462 0.58456546 
		-0.16517872 0.79435462 0.58456546 -0.16517872 0.79435462 0.58456546 -0.16517872 
		0.79435462 0.58456546 -0.16517872 -0.89504492 0.27540404 -0.3507809 -0.89504492 
		0.27540404 -0.3507809 -0.89504492 0.27540404 -0.3507809 -0.89504492 0.27540404 
		-0.3507809 -0.43409294 0.37672824 -0.81831485 -0.43409294 0.37672824 -0.81831485 
		-0.43409294 0.37672824 -0.81831485 -0.43409294 0.37672824 -0.81831485 0 -1 
		4.4954738e-009 0 -1 4.4954738e-009 0 -1 4.4954738e-009 0 -1 4.4954738e-009 
		0.43512282 0.4065105 -0.8033787 0.43512282 0.4065105 -0.8033787 0.43512282 
		0.4065105 -0.8033787 0.43512282 0.4065105 -0.8033787 0.9270066 0.23373742 
		-0.29330119 0.9270066 0.23373742 -0.29330119 0.9270066 0.23373742 -0.29330119 
		0.9270066 0.23373742 -0.29330119 -0.77740228 -0.18525022 -0.60110569 -0.77740228 
		-0.18525022 -0.60110569 -0.77740228 -0.18525022 -0.60110569 -0.77740228 -0.18525022 
		-0.60110569 -0.48574468 -0.43470255 -0.75834411 -0.48574468 -0.43470255 -0.75834411 
		-0.48574468 -0.43470255 -0.75834411 -0.48574468 -0.43470255 -0.75834411 0.47889423 
		-0.40042368 -0.78123057 0.47889423 -0.40042368 -0.78123057 0.47889423 -0.40042368 
		-0.78123057 0.47889423 -0.40042368 -0.78123057 0.75390172 -0.066397443 -0.6536234 
		0.75390172 -0.066397443 -0.6536234 0.75390172 -0.066397443 -0.6536234 0.75390172 
		-0.066397443 -0.6536234 -0.46550977 -0.65735829 -0.59260505 -0.46550977 -0.65735829 
		-0.59260505 -0.46550977 -0.65735829 -0.59260505 -0.46550977 -0.65735829 -0.59260505 
		-0.46010545 -0.627002 -0.6286267 -0.46010545 -0.627002 -0.6286267 -0.46010545 
		-0.627002 -0.6286267 -0.46010545 -0.627002 -0.6286267 0.40399393 -0.91444236 
		0.024165927 0.40399393 -0.91444236 0.024165927 0.40399393 -0.91444236 0.024165927 
		0.40399393 -0.91444236 0.024165927 0.24391806 -0.95307881 0.1792898 0.24391806 
		-0.95307881 0.1792898 0.24391806 -0.95307881 0.1792898 0.24391806 -0.95307881 
		0.1792898 -0.24391845 -0.95307994 0.17928299 -0.24391845 -0.95307994 0.17928299 
		-0.24391845 -0.95307994 0.17928299 -0.24391845 -0.95307994 0.17928299 -0.3848114 
		-0.92274427 0.021522203 -0.3848114 -0.92274427 0.021522203 -0.3848114 -0.92274427 
		0.021522203 -0.3848114 -0.92274427 0.021522203 0.46010509 -0.62700695 -0.62862194 
		0.46010509 -0.62700695 -0.62862194 0.46010509 -0.62700695 -0.62862194 0.46010509 
		-0.62700695 -0.62862194 0.35391852 -0.64703494 -0.6753425 0.35391852 -0.64703494 
		-0.6753425 0.35391852 -0.64703494 -0.6753425 0.35391852 -0.64703494 -0.6753425 
		-0.53508765 0.64160764 -0.54956424 -0.53508765 0.64160764 -0.54956424 -0.53508765 
		0.64160764 -0.54956424 -0.53508765 0.64160764 -0.54956424 -0.70340598 0.27049208 
		-0.65730822 -0.70340598 0.27049208 -0.65730822 -0.70340598 0.27049208 -0.65730822 
		-0.70340598 0.27049208 -0.65730822 0.52172703 0.65408087 -0.54770356 0.52172703 
		0.65408087 -0.54770356 0.52172703 0.65408087 -0.54770356 0.52172703 0.65408087 
		-0.54770356 0.7030527 0.27756101 -0.65473413 0.7030527 0.27756101 -0.65473413 
		0.7030527 0.27756101 -0.65473413 0.7030527 0.27756101 -0.65473413 -0.45902029 
		-0.74888206 -0.47799164 -0.45902029 -0.74888206 -0.47799164 -0.45902029 -0.74888206 
		-0.47799164 -0.45902029 -0.74888206 -0.47799164 -0.73866385 -0.25157273 -0.62536943 
		-0.73866385 -0.25157273 -0.62536943;
	setAttr ".n[1494:1659]" -type "float3"  -0.73866385 -0.25157273 -0.62536943 
		-0.73866385 -0.25157273 -0.62536943 0.73396558 -0.24135092 -0.63485765 0.73396558 
		-0.24135092 -0.63485765 0.73396558 -0.24135092 -0.63485765 0.73396558 -0.24135092 
		-0.63485765 0.47762939 -0.73453414 -0.48200592 0.47762939 -0.73453414 -0.48200592 
		0.47762939 -0.73453414 -0.48200592 0.47762939 -0.73453414 -0.48200592 -0.53196901 
		0.78712308 -0.31216371 -0.53196901 0.78712308 -0.31216371 -0.53196901 0.78712308 
		-0.31216371 -0.53196901 0.78712308 -0.31216371 -0.96607882 0.1461854 -0.21288864 
		-0.96607882 0.1461854 -0.21288864 -0.96607882 0.1461854 -0.21288864 -0.96607882 
		0.1461854 -0.21288864 0.49391842 0.80760688 -0.32220444 0.49391842 0.80760688 
		-0.32220444 0.49391842 0.80760688 -0.32220444 0.49391842 0.80760688 -0.32220444 
		0.95844597 0.18200667 -0.21966997 0.95844597 0.18200667 -0.21966997 0.95844597 
		0.18200667 -0.21966997 0.95844597 0.18200667 -0.21966997 -0.29566732 -0.92866087 
		-0.22398633 -0.29566732 -0.92866087 -0.22398633 -0.29566732 -0.92866087 -0.22398633 
		-0.29566732 -0.92866087 -0.22398633 -0.94133228 -0.29907122 -0.15636481 -0.94133228 
		-0.29907122 -0.15636481 -0.94133228 -0.29907122 -0.15636481 -0.94133228 -0.29907122 
		-0.15636481 0.9499526 -0.27400735 -0.15003335 0.9499526 -0.27400735 -0.15003335 
		0.9499526 -0.27400735 -0.15003335 0.9499526 -0.27400735 -0.15003335 0.34968576 
		-0.91007978 -0.22242907 0.34968576 -0.91007978 -0.22242907 0.34968576 -0.91007978 
		-0.22242907 0.34968576 -0.91007978 -0.22242907 -0.41202837 0.90895754 -0.063472852 
		-0.41202837 0.90895754 -0.063472852 -0.41202837 0.90895754 -0.063472852 -0.41202837 
		0.90895754 -0.063472852 -0.99005264 0.13742504 -0.030169131 -0.99005264 0.13742504 
		-0.030169131 -0.99005264 0.13742504 -0.030169131 -0.99005264 0.13742504 -0.030169131 
		0.37781405 0.92349035 -0.066498645 0.37781405 0.92349035 -0.066498645 0.37781405 
		0.92349035 -0.066498645 0.37781405 0.92349035 -0.066498645 0.98180246 0.18698528 
		-0.033172354 0.98180246 0.18698528 -0.033172354 0.98180246 0.18698528 -0.033172354 
		0.98180246 0.18698528 -0.033172354 -0.23517358 -0.97145587 -0.031093916 -0.23517358 
		-0.97145587 -0.031093916 -0.23517358 -0.97145587 -0.031093916 -0.23517358 
		-0.97145587 -0.031093916 -0.95599067 -0.29151395 -0.033187632 -0.95599067 
		-0.29151395 -0.033187632 -0.95599067 -0.29151395 -0.033187632 -0.95599067 
		-0.29151395 -0.033187632 0.96740729 -0.25120181 -0.03194996 0.96740729 -0.25120181 
		-0.03194996 0.96740729 -0.25120181 -0.03194996 0.96740729 -0.25120181 -0.03194996 
		0.28011695 -0.95950001 -0.029903645 0.28011695 -0.95950001 -0.029903645 0.28011695 
		-0.95950001 -0.029903645 0.28011695 -0.95950001 -0.029903645 -0.31236947 
		0.94919544 -0.038122479 -0.31236947 0.94919544 -0.038122479 -0.31236947 0.94919544 
		-0.038122479 -0.31236947 0.94919544 -0.038122479 -0.99560088 0.089228041 
		-0.028589156 -0.99560088 0.089228041 -0.028589156 -0.99560088 0.089228041 
		-0.028589156 -0.99560088 0.089228041 -0.028589156 0.28762135 0.95689696 -0.040275499 
		0.28762135 0.95689696 -0.040275499 0.28762135 0.95689696 -0.040275499 0.28762135 
		0.95689696 -0.040275499 0.98733115 0.1554725 -0.031709675 0.98733115 0.1554725 
		-0.031709675 0.98733115 0.1554725 -0.031709675 0.98733115 0.1554725 -0.031709675 
		-0.26781085 -0.96294039 -0.031986643 -0.26781085 -0.96294039 -0.031986643 
		-0.26781085 -0.96294039 -0.031986643 -0.26781085 -0.96294039 -0.031986643 
		-0.96063429 -0.27620673 -0.029859208 -0.96063429 -0.27620673 -0.029859208 
		-0.96063429 -0.27620673 -0.029859208 -0.96063429 -0.27620673 -0.029859208 
		0.97597647 -0.2158594 -0.02957399 0.97597647 -0.2158594 -0.02957399 0.97597647 
		-0.2158594 -0.02957399 0.97597647 -0.2158594 -0.02957399 0.29928717 -0.95366448 
		-0.030842585 0.29928717 -0.95366448 -0.030842585 0.29928717 -0.95366448 -0.030842585 
		0.29928717 -0.95366448 -0.030842585 -0.30251703 0.95270497 -0.028927039 -0.30251703 
		0.95270497 -0.028927039 -0.30251703 0.95270497 -0.028927039 -0.30251703 0.95270497 
		-0.028927039 -0.99778402 0.054100085 -0.03873181 -0.99778402 0.054100085 
		-0.03873181 -0.99778402 0.054100085 -0.03873181 -0.99778402 0.054100085 -0.03873181 
		0.29049289 0.95638955 -0.030544698 0.29049289 0.95638955 -0.030544698 0.29049289 
		0.95638955 -0.030544698 0.29049289 0.95638955 -0.030544698 0.98964202 0.13763085 
		-0.040821422 0.98964202 0.13763085 -0.040821422 0.98964202 0.13763085 -0.040821422 
		0.98964202 0.13763085 -0.040821422 -0.26538116 -0.96318448 -0.042994674 -0.26538116 
		-0.96318448 -0.042994674 -0.26538116 -0.96318448 -0.042994674 -0.26538116 
		-0.96318448 -0.042994674 -0.96429718 -0.26157853 -0.041322995 -0.96429718 
		-0.26157853 -0.041322995 -0.96429718 -0.26157853 -0.041322995 -0.96429718 
		-0.26157853 -0.041322995 0.98289567 -0.17951865 -0.041098766 0.98289567 -0.17951865 
		-0.041098766 0.98289567 -0.17951865 -0.041098766 0.98289567 -0.17951865 -0.041098766 
		0.28198093 -0.95849293 -0.042167179 0.28198093 -0.95849293 -0.042167179 0.28198093 
		-0.95849293 -0.042167179 0.28198093 -0.95849293 -0.042167179 -0.35335004 
		0.93531805 -0.017997151 -0.35335004 0.93531805 -0.017997151 -0.35335004 0.93531805 
		-0.017997151 -0.35335004 0.93531805 -0.017997151 -0.99842906 0.033453975 
		-0.044947378 -0.99842906 0.033453975 -0.044947378 -0.99842906 0.033453975 
		-0.044947378 -0.99842906 0.033453975 -0.044947378 0.35552031 0.93448108 -0.018718988 
		0.35552031 0.93448108 -0.018718988 0.35552031 0.93448108 -0.018718988 0.35552031 
		0.93448108 -0.018718988 0.99050164 0.12976798 -0.045461304 0.99050164 0.12976798 
		-0.045461304 0.99050164 0.12976798 -0.045461304 0.99050164 0.12976798 -0.045461304 
		-0.31706101 -0.94752187 -0.040921327 -0.31706101 -0.94752187 -0.040921327 
		-0.31706101 -0.94752187 -0.040921327 -0.31706101 -0.94752187 -0.040921327 
		-0.97226435 -0.22936833 -0.045740694 -0.97226435 -0.22936833 -0.045740694 
		-0.97226435 -0.22936833 -0.045740694 -0.97226435 -0.22936833 -0.045740694 
		0.99088973 -0.12648661 -0.046245892 0.99088973 -0.12648661 -0.046245892 0.99088973 
		-0.12648661 -0.046245892 0.99088973 -0.12648661 -0.046245892;
	setAttr ".n[1660:1825]" -type "float3"  0.31483516 -0.94825691 -0.041081566 
		0.31483516 -0.94825691 -0.041081566 0.31483516 -0.94825691 -0.041081566 0.31483516 
		-0.94825691 -0.041081566 -0.30528092 0.95166659 -0.033678658 -0.30528092 
		0.95166659 -0.033678658 -0.30528092 0.95166659 -0.033678658 -0.30528092 0.95166659 
		-0.033678658 -0.99905849 0.010030518 -0.042207658 -0.99905849 0.010030518 
		-0.042207658 -0.99905849 0.010030518 -0.042207658 -0.99905849 0.010030518 
		-0.042207658 0.32278869 0.94587815 -0.033496104 0.32278869 0.94587815 -0.033496104 
		0.32278869 0.94587815 -0.033496104 0.32278869 0.94587815 -0.033496104 0.99339586 
		0.10689189 -0.041699167 0.99339586 0.10689189 -0.041699167 0.99339586 0.10689189 
		-0.041699167 0.99339586 0.10689189 -0.041699167 -0.27885097 -0.95911449 -0.048388883 
		-0.27885097 -0.95911449 -0.048388883 -0.27885097 -0.95911449 -0.048388883 
		-0.27885097 -0.95911449 -0.048388883 -0.98822039 -0.14737999 -0.041226406 
		-0.98822039 -0.14737999 -0.041226406 -0.98822039 -0.14737999 -0.041226406 
		-0.98822039 -0.14737999 -0.041226406 0.99827564 -0.041239843 -0.041774388 
		0.99827564 -0.041239843 -0.041774388 0.99827564 -0.041239843 -0.041774388 
		0.99827564 -0.041239843 -0.041774388 0.25419044 -0.96590579 -0.049123805 
		0.25419044 -0.96590579 -0.049123805 0.25419044 -0.96590579 -0.049123805 0.25419044 
		-0.96590579 -0.049123805 -7.1567044e-008 -0.23154819 0.97282344 -7.1567044e-008 
		-0.23154819 0.97282344 -7.1567044e-008 -0.23154819 0.97282344 -7.1567044e-008 
		-0.23154819 0.97282344 -5.0374503e-008 -0.47206011 0.88156641 -5.0374503e-008 
		-0.47206011 0.88156641 -5.0374503e-008 -0.47206011 0.88156641 -5.0374503e-008 
		-0.47206011 0.88156641 3.6940969e-007 -0.62568176 0.78007841 3.6940969e-007 
		-0.62568176 0.78007841 3.6940969e-007 -0.62568176 0.78007841 3.6940969e-007 
		-0.62568176 0.78007841 5.5943741e-007 -0.83393008 0.55187011 5.5943741e-007 
		-0.83393008 0.55187011 5.5943741e-007 -0.83393008 0.55187011 5.5943741e-007 
		-0.83393008 0.55187011 -0.0035078712 -0.63255644 0.77450633 -0.0035078712 
		-0.63255644 0.77450633 -0.0035078712 -0.63255644 0.77450633 -0.0035078712 
		-0.63255644 0.77450633 -0.0044722375 -0.21707477 0.97614473 -0.0044722375 
		-0.21707477 0.97614473 -0.0044722375 -0.21707477 0.97614473 -0.0044722375 
		-0.21707477 0.97614473 -0.35857549 -0.12948431 0.9244768 -0.35857549 -0.12948431 
		0.9244768 -0.35857549 -0.12948431 0.9244768 -0.35857549 -0.12948431 0.9244768 
		-0.40374377 -0.42372462 0.8108319 -0.40374377 -0.42372462 0.8108319 -0.40374377 
		-0.42372462 0.8108319 -0.40374377 -0.42372462 0.8108319 -0.37620744 -0.56554985 
		0.73390824 -0.37620744 -0.56554985 0.73390824 -0.37620744 -0.56554985 0.73390824 
		-0.37620744 -0.56554985 0.73390824 -0.1209079 -0.84671032 0.51813406 -0.1209079 
		-0.84671032 0.51813406 -0.1209079 -0.84671032 0.51813406 -0.1209079 -0.84671032 
		0.51813406 -0.29475105 -0.63352108 0.71538299 -0.29475105 -0.63352108 0.71538299 
		-0.29475105 -0.63352108 0.71538299 -0.29475105 -0.63352108 0.71538299 -0.43684256 
		-0.27646092 0.85600114 -0.43684256 -0.27646092 0.85600114 -0.43684256 -0.27646092 
		0.85600114 -0.43684256 -0.27646092 0.85600114 -0.28349742 0.46280566 0.83990484 
		-0.28349742 0.46280566 0.83990484 -0.28349742 0.46280566 0.83990484 -0.28349742 
		0.46280566 0.83990484 -0.35810524 0.44187742 0.82249928 -0.35810524 0.44187742 
		0.82249928 -0.35810524 0.44187742 0.82249928 -1.1476128e-007 0.33184531 0.9433338 
		-1.1476128e-007 0.33184531 0.9433338 -1.1476128e-007 0.33184531 0.9433338 
		-1.1476128e-007 0.33184531 0.9433338 0.35810488 0.44187793 0.82249916 0.35810488 
		0.44187793 0.82249916 0.35810488 0.44187793 0.82249916 0.37264839 -0.12208463 
		0.9199068 0.37264839 -0.12208463 0.9199068 0.37264839 -0.12208463 0.9199068 
		0.37264839 -0.12208463 0.9199068 -3.010436e-007 0.45395488 0.89102471 -3.010436e-007 
		0.45395488 0.89102471 -3.010436e-007 0.45395488 0.89102471 -3.010436e-007 
		0.45395488 0.89102471 0.87911558 0.41611549 0.23238677 0.87911558 0.41611549 
		0.23238677 0.87911558 0.41611549 0.23238677 0.87911558 0.41611549 0.23238677 
		0.94231069 0.24304494 -0.23017307 0.94231069 0.24304494 -0.23017307 0.94231069 
		0.24304494 -0.23017307 0.94231069 0.24304494 -0.23017307 0.52358228 -0.023258619 
		0.85165757 0.52358228 -0.023258619 0.85165757 0.52358228 -0.023258619 0.85165757 
		0.52358228 -0.023258619 0.85165757 5.2693628e-007 -0.27668759 0.96095991 
		5.2693628e-007 -0.27668759 0.96095991 5.2693628e-007 -0.27668759 0.96095991 
		5.2693628e-007 -0.27668759 0.96095991 0.18859509 -0.96300215 -0.19250652 
		0.18859509 -0.96300215 -0.19250652 0.18859509 -0.96300215 -0.19250652 0.18859509 
		-0.96300215 -0.19250652 0.94859135 -0.14073437 -0.28349313 0.94859135 -0.14073437 
		-0.28349313 0.94859135 -0.14073437 -0.28349313 0.94859135 -0.14073437 -0.28349313 
		-5.4182055e-007 -0.83027023 0.55736107 -5.4182055e-007 -0.83027023 0.55736107 
		-5.4182055e-007 -0.83027023 0.55736107 -5.4182055e-007 -0.83027023 0.55736107 
		-5.4182055e-007 -0.83027023 0.55736107 0.34743217 -0.90815949 0.23353194 
		0.34743217 -0.90815949 0.23353194 0.34743217 -0.90815949 0.23353194 0.34743217 
		-0.90815949 0.23353194 1.4345527e-006 0.094690196 0.99550682 1.4345527e-006 
		0.094690196 0.99550682 1.4345527e-006 0.094690196 0.99550682 1.4345527e-006 
		0.094690196 0.99550682 -0.91320425 0.27241972 0.30306035 -0.91320425 0.27241972 
		0.30306035 -0.91320425 0.27241972 0.30306035 -0.91320425 0.27241972 0.30306035 
		-0.99516863 0.0043375748 0.098084711 -0.99516863 0.0043375748 0.098084711 
		-0.99516863 0.0043375748 0.098084711 -0.99516863 0.0043375748 0.098084711 
		-0.34743035 -0.90816116 0.23352823 -0.34743035 -0.90816116 0.23352823 -0.34743035 
		-0.90816116 0.23352823 -0.34743035 -0.90816116 0.23352823 -0.96197611 -0.26914099 
		-0.046530973 -0.96197611 -0.26914099 -0.046530973 -0.96197611 -0.26914099 
		-0.046530973 -0.96197611 -0.26914099 -0.046530973 -0.45693475 -0.87617171 
		0.1534072 -0.45693475 -0.87617171 0.1534072 -0.45693475 -0.87617171 0.1534072 
		-0.45693475 -0.87617171 0.1534072 -0.20848663 0.46752805 0.85904062 -0.20848663 
		0.46752805 0.85904062 -0.20848663 0.46752805 0.85904062;
	setAttr ".n[1826:1991]" -type "float3"  -0.20848663 0.46752805 0.85904062 
		-0.52358085 -0.023259781 0.8516584 -0.52358085 -0.023259781 0.8516584 -0.52358085 
		-0.023259781 0.8516584 -0.52358085 -0.023259781 0.8516584 3.562342e-006 0.5254631 
		0.85081643 3.562342e-006 0.5254631 0.85081643 3.562342e-006 0.5254631 0.85081643 
		3.562342e-006 0.5254631 0.85081643 0.83478868 0.51055557 0.20606017 0.83478868 
		0.51055557 0.20606017 0.83478868 0.51055557 0.20606017 0.83478868 0.51055557 
		0.20606017 0.89108998 0.25242308 -0.37714887 0.89108998 0.25242308 -0.37714887 
		0.89108998 0.25242308 -0.37714887 0.89108998 0.25242308 -0.37714887 0.14883721 
		0.44416958 0.8834936 0.14883721 0.44416958 0.8834936 0.14883721 0.44416958 
		0.8834936 0.14883721 0.44416958 0.8834936 -0.55628282 -0.033225078 0.83032858 
		-0.55628282 -0.033225078 0.83032858 -0.55628282 -0.033225078 0.83032858 -0.55628282 
		-0.033225078 0.83032858 -0.30457571 -0.45482662 -0.83687896 -0.30457571 -0.45482662 
		-0.83687896 -0.30457571 -0.45482662 -0.83687896 -0.30457571 -0.45482662 -0.83687896 
		0.60702825 -0.12738448 -0.78440416 0.60702825 -0.12738448 -0.78440416 0.60702825 
		-0.12738448 -0.78440416 0.60702825 -0.12738448 -0.78440416 -0.85279495 -0.44272536 
		0.2770108 -0.85279495 -0.44272536 0.2770108 -0.85279495 -0.44272536 0.2770108 
		-0.85279495 -0.44272536 0.2770108 -0.78911853 -0.49416021 -0.36482558 -0.78911853 
		-0.49416021 -0.36482558 -0.78911853 -0.49416021 -0.36482558 -0.78911853 -0.49416021 
		-0.36482558 0.9499861 0.18583804 0.25097945 0.9499861 0.18583804 0.25097945 
		0.9499861 0.18583804 0.25097945 0.9499861 0.18583804 0.25097945 0.92986655 
		0.02885305 -0.3667638 0.92986655 0.02885305 -0.3667638 0.92986655 0.02885305 
		-0.3667638 0.92986655 0.02885305 -0.3667638 0.22483775 0.19286168 0.95511901 
		0.22483775 0.19286168 0.95511901 0.22483775 0.19286168 0.95511901 0.22483775 
		0.19286168 0.95511901 -0.56638861 -0.099685438 0.81808722 -0.56638861 -0.099685438 
		0.81808722 -0.56638861 -0.099685438 0.81808722 -0.56638861 -0.099685438 0.81808722 
		-0.16262597 -0.52527452 -0.83524817 -0.16262597 -0.52527452 -0.83524817 -0.16262597 
		-0.52527452 -0.83524817 -0.16262597 -0.52527452 -0.83524817 0.52897197 -0.26367986 
		-0.80663598 0.52897197 -0.26367986 -0.80663598 0.52897197 -0.26367986 -0.80663598 
		0.52897197 -0.26367986 -0.80663598 -0.8828246 -0.37305686 0.28539327 -0.8828246 
		-0.37305686 0.28539327 -0.8828246 -0.37305686 0.28539327 -0.8828246 -0.37305686 
		0.28539327 -0.766895 -0.55793077 -0.31715199 -0.766895 -0.55793077 -0.31715199 
		-0.766895 -0.55793077 -0.31715199 -0.766895 -0.55793077 -0.31715199 0.97334343 
		-0.1903466 0.12794816 0.97334343 -0.1903466 0.12794816 0.97334343 -0.1903466 
		0.12794816 0.97334343 -0.1903466 0.12794816 0.9789812 0.096223257 -0.17982469 
		0.9789812 0.096223257 -0.17982469 0.9789812 0.096223257 -0.17982469 0.9789812 
		0.096223257 -0.17982469 0.38626406 -0.25564715 0.88625312 0.38626406 -0.25564715 
		0.88625312 0.38626406 -0.25564715 0.88625312 0.38626406 -0.25564715 0.88625312 
		-0.33745906 -0.3612068 0.86928189 -0.33745906 -0.3612068 0.86928189 -0.33745906 
		-0.3612068 0.86928189 -0.33745906 -0.3612068 0.86928189 -0.28800601 -0.15247887 
		-0.94541144 -0.28800601 -0.15247887 -0.94541144 -0.28800601 -0.15247887 -0.94541144 
		-0.28800601 -0.15247887 -0.94541144 0.65631515 -0.10708975 -0.74684823 0.65631515 
		-0.10708975 -0.74684823 0.65631515 -0.10708975 -0.74684823 0.65631515 -0.10708975 
		-0.74684823 -0.78425229 -0.5461213 0.29444826 -0.78425229 -0.5461213 0.29444826 
		-0.78425229 -0.5461213 0.29444826 -0.78425229 -0.5461213 0.29444826 -0.83141714 
		-0.46573922 -0.30303875 -0.83141714 -0.46573922 -0.30303875 -0.83141714 -0.46573922 
		-0.30303875 -0.83141714 -0.46573922 -0.30303875 0.91906637 -0.29244715 0.26418114 
		0.91906637 -0.29244715 0.26418114 0.91906637 -0.29244715 0.26418114 0.91906637 
		-0.29244715 0.26418114 0.97001058 -0.09725856 -0.22275601 0.97001058 -0.09725856 
		-0.22275601 0.97001058 -0.09725856 -0.22275601 0.97001058 -0.09725856 -0.22275601 
		0.44298685 -0.46912655 0.76399142 0.44298685 -0.46912655 0.76399142 0.44298685 
		-0.46912655 0.76399142 0.44298685 -0.46912655 0.76399142 -0.67501724 -0.29825267 
		0.67483109 -0.67501724 -0.29825267 0.67483109 -0.67501724 -0.29825267 0.67483109 
		-0.67501724 -0.29825267 0.67483109 -0.24315754 0.22512315 -0.94350094 -0.24315754 
		0.22512315 -0.94350094 -0.24315754 0.22512315 -0.94350094 -0.24315754 0.22512315 
		-0.94350094 0.54264992 0.14062768 -0.82810318 0.54264992 0.14062768 -0.82810318 
		0.54264992 0.14062768 -0.82810318 0.54264992 0.14062768 -0.82810318 -0.65563267 
		-0.2837342 0.69974333 -0.65563267 -0.2837342 0.69974333 -0.65563267 -0.2837342 
		0.69974333 -0.65563267 -0.2837342 0.69974333 -0.9720155 -0.0068699368 -0.23481612 
		-0.9720155 -0.0068699368 -0.23481612 -0.9720155 -0.0068699368 -0.23481612 
		-0.9720155 -0.0068699368 -0.23481612 0.967978 -0.16251196 0.19133338 0.967978 
		-0.16251196 0.19133338 0.967978 -0.16251196 0.19133338 0.967978 -0.16251196 
		0.19133338 0.88714361 -0.15728758 -0.43386263 0.88714361 -0.15728758 -0.43386263 
		0.88714361 -0.15728758 -0.43386263 0.88714361 -0.15728758 -0.43386263 0.43394729 
		-0.42428723 0.7947768 0.43394729 -0.42428723 0.7947768 0.43394729 -0.42428723 
		0.7947768 0.43394729 -0.42428723 0.7947768 -0.52022791 -0.27291206 0.80924773 
		-0.52022791 -0.27291206 0.80924773 -0.52022791 -0.27291206 0.80924773 -0.52022791 
		-0.27291206 0.80924773 -0.1710832 0.737167 -0.65369356 -0.1710832 0.737167 
		-0.65369356 -0.1710832 0.737167 -0.65369356 -0.1710832 0.737167 -0.65369356 
		0.53702039 0.54560161 -0.64337242 0.53702039 0.54560161 -0.64337242 0.53702039 
		0.54560161 -0.64337242 0.53702039 0.54560161 -0.64337242 -0.74011385 -0.14943695 
		0.65566766 -0.74011385 -0.14943695 0.65566766 -0.74011385 -0.14943695 0.65566766 
		-0.74011385 -0.14943695 0.65566766 -0.82361639 0.56696677 -0.014306446;
	setAttr ".n[1992:2157]" -type "float3"  -0.82361639 0.56696677 -0.014306446 
		-0.82361639 0.56696677 -0.014306446 -0.82361639 0.56696677 -0.014306446 0.3812885 
		-0.49180081 0.78278416 0.3812885 -0.49180081 0.78278416 0.3812885 -0.49180081 
		0.78278416 0.3812885 -0.49180081 0.78278416 0.89493775 -0.34273583 0.28568956 
		0.89493775 -0.34273583 0.28568956 0.89493775 -0.34273583 0.28568956 0.89493775 
		-0.34273583 0.28568956 0.96448243 -0.12007371 -0.23527838 0.96448243 -0.12007371 
		-0.23527838 0.96448243 -0.12007371 -0.23527838 0.96448243 -0.12007371 -0.23527838 
		0.60469884 0.18783139 -0.77398884 0.60469884 0.18783139 -0.77398884 0.60469884 
		0.18783139 -0.77398884 0.60469884 0.18783139 -0.77398884 -0.20314562 0.33767545 
		-0.91907948 -0.20314562 0.33767545 -0.91907948 -0.20314562 0.33767545 -0.91907948 
		-0.20314562 0.33767545 -0.91907948 -0.96759748 0.076536618 -0.24061844 -0.96759748 
		0.076536618 -0.24061844 -0.96759748 0.076536618 -0.24061844 -0.96759748 0.076536618 
		-0.24061844 -0.78530949 -0.24114645 0.57020825 -0.78530949 -0.24114645 0.57020825 
		-0.78530949 -0.24114645 0.57020825 -0.78530949 -0.24114645 0.57020825 -0.55659372 
		-0.30809638 0.77154398 -0.55659372 -0.30809638 0.77154398 -0.55659372 -0.30809638 
		0.77154398 -0.55659372 -0.30809638 0.77154398 0.90171772 0.35193622 0.25108966 
		0.90171772 0.35193622 0.25108966 0.90171772 0.35193622 0.25108966 0.90171772 
		0.35193622 0.25108966 0.97276908 0.19868229 -0.11935525 0.97276908 0.19868229 
		-0.11935525 0.97276908 0.19868229 -0.11935525 0.97276908 0.19868229 -0.11935525 
		0.27340788 0.8355515 0.47655204 0.27340788 0.8355515 0.47655204 0.27340788 
		0.8355515 0.47655204 0.27340788 0.8355515 0.47655204 -0.2482432 0.80626357 
		0.5369491 -0.2482432 0.80626357 0.5369491 -0.2482432 0.80626357 0.5369491 
		-0.2482432 0.80626357 0.5369491 -0.13404627 0.66087621 -0.73842686 -0.13404627 
		0.66087621 -0.73842686 -0.13404627 0.66087621 -0.73842686 -0.13404627 0.66087621 
		-0.73842686 0.83922559 0.31671453 -0.44203207 0.83922559 0.31671453 -0.44203207 
		0.83922559 0.31671453 -0.44203207 0.83922559 0.31671453 -0.44203207 -0.82358599 
		0.52329296 0.21879348 -0.82358599 0.52329296 0.21879348 -0.82358599 0.52329296 
		0.21879348 -0.82358599 0.52329296 0.21879348 -0.91478062 0.38779715 -0.11309187 
		-0.91478062 0.38779715 -0.11309187 -0.91478062 0.38779715 -0.11309187 -0.91478062 
		0.38779715 -0.11309187 0.86591381 0.49179462 0.091276519 0.86591381 0.49179462 
		0.091276519 0.86591381 0.49179462 0.091276519 0.86591381 0.49179462 0.091276519 
		0.18433551 0.97218406 0.14449415 0.18433551 0.97218406 0.14449415 0.18433551 
		0.97218406 0.14449415 0.18433551 0.97218406 0.14449415 -0.33052078 0.9274959 
		0.17466348 -0.33052078 0.9274959 0.17466348 -0.33052078 0.9274959 0.17466348 
		-0.33052078 0.9274959 0.17466348 -0.23199435 0.34590486 -0.90913612 -0.23199435 
		0.34590486 -0.90913612 -0.23199435 0.34590486 -0.90913612 -0.23199435 0.34590486 
		-0.90913612 0.80298889 0.239911 -0.54557455 0.80298889 0.239911 -0.54557455 
		0.80298889 0.239911 -0.54557455 0.80298889 0.239911 -0.54557455 -0.97383207 
		0.18403928 0.13334417 -0.97383207 0.18403928 0.13334417 -0.97383207 0.18403928 
		0.13334417 -0.97383207 0.18403928 0.13334417 -0.85316175 0.19823971 -0.48251009 
		-0.85316175 0.19823971 -0.48251009 -0.85316175 0.19823971 -0.48251009 -0.85316175 
		0.19823971 -0.48251009 -0.084876254 0.77093226 -0.63123649 -0.084876254 0.77093226 
		-0.63123649 -0.084876254 0.77093226 -0.63123649 -0.084876254 0.77093226 -0.63123649 
		0.68553305 0.51075941 -0.51881522 0.68553305 0.51075941 -0.51881522 0.68553305 
		0.51075941 -0.51881522 0.68553305 0.51075941 -0.51881522 -0.75456184 0.53838408 
		-0.37520525 -0.75456184 0.53838408 -0.37520525 -0.75456184 0.53838408 -0.37520525 
		-0.75456184 0.53838408 -0.37520525 -0.96003228 -0.097081423 -0.26251322 -0.96003228 
		-0.097081423 -0.26251322 -0.96003228 -0.097081423 -0.26251322 -0.96003228 
		-0.097081423 -0.26251322 0.84668946 0.41226834 -0.33638048 0.84668946 0.41226834 
		-0.33638048 0.84668946 0.41226834 -0.33638048 0.84668946 0.41226834 -0.33638048 
		0.98911303 -0.1289123 -0.070971735 0.98911303 -0.1289123 -0.070971735 0.98911303 
		-0.1289123 -0.070971735 0.98911303 -0.1289123 -0.070971735 0.60486025 -0.63237625 
		-0.48398796 0.60486025 -0.63237625 -0.48398796 0.60486025 -0.63237625 -0.48398796 
		0.60486025 -0.63237625 -0.48398796 -0.7940219 0.59713137 -0.11385697 -0.7940219 
		0.59713137 -0.11385697 -0.7940219 0.59713137 -0.11385697 -0.7940219 0.59713137 
		-0.11385697 -0.97097254 0.15645719 0.18092398 -0.97097254 0.15645719 0.18092398 
		-0.97097254 0.15645719 0.18092398 -0.97097254 0.15645719 0.18092398 -0.98536485 
		0.16680917 -0.035083622 -0.98536485 0.16680917 -0.035083622 -0.98536485 0.16680917 
		-0.035083622 -0.98536485 0.16680917 -0.035083622 0.43144897 0.8923589 0.13246673 
		0.43144897 0.8923589 0.13246673 0.43144897 0.8923589 0.13246673 0.43144897 
		0.8923589 0.13246673 0.78040808 0.61725277 -0.099810764 0.78040808 0.61725277 
		-0.099810764 0.78040808 0.61725277 -0.099810764 0.78040808 0.61725277 -0.099810764 
		0.18980011 0.95263225 0.23762932 0.18980011 0.95263225 0.23762932 0.18980011 
		0.95263225 0.23762932 0.18980011 0.95263225 0.23762932 -0.19013971 0.95600867 
		0.22337018 -0.19013971 0.95600867 0.22337018 -0.19013971 0.95600867 0.22337018 
		-0.19013971 0.95600867 0.22337018 -0.9475286 0.31561422 -0.050765797 -0.9475286 
		0.31561422 -0.050765797 -0.9475286 0.31561422 -0.050765797 -0.9475286 0.31561422 
		-0.050765797 -0.2504603 0.36662087 -0.89602387 -0.2504603 0.36662087 -0.89602387 
		-0.2504603 0.36662087 -0.89602387 -0.2504603 0.36662087 -0.89602387 0.84669447 
		0.24995001 -0.46971631 0.84669447 0.24995001 -0.46971631 0.84669447 0.24995001 
		-0.46971631 0.84669447 0.24995001 -0.46971631 0.80386275 0.54723942 -0.23309588 
		0.80386275 0.54723942 -0.23309588 0.80386275 0.54723942 -0.23309588;
	setAttr ".n[2158:2323]" -type "float3"  0.80386275 0.54723942 -0.23309588 
		0.78987765 0.30199465 -0.53375322 0.78987765 0.30199465 -0.53375322 0.78987765 
		0.30199465 -0.53375322 0.78987765 0.30199465 -0.53375322 -0.92303616 -0.14178166 
		-0.35763422 -0.92303616 -0.14178166 -0.35763422 -0.92303616 -0.14178166 -0.35763422 
		-0.92303616 -0.14178166 -0.35763422 0.050380737 -0.99400091 0.097077586 0.050380737 
		-0.99400091 0.097077586 0.050380737 -0.99400091 0.097077586 0.050380737 -0.99400091 
		0.097077586 -0.13783304 -0.98114526 0.13548465 -0.13783304 -0.98114526 0.13548465 
		-0.13783304 -0.98114526 0.13548465 -0.13783304 -0.98114526 0.13548465 -0.98762274 
		-0.15538117 -0.021400975 -0.98762274 -0.15538117 -0.021400975 -0.98762274 
		-0.15538117 -0.021400975 -0.98762274 -0.15538117 -0.021400975 -0.32974344 
		-0.94271827 -0.050512671 -0.32974344 -0.94271827 -0.050512671 -0.32974344 
		-0.94271827 -0.050512671 -0.32974344 -0.94271827 -0.050512671 -0.27044126 
		-0.96272302 -0.0050849076 -0.27044126 -0.96272302 -0.0050849076 -0.27044126 
		-0.96272302 -0.0050849076 -0.27044126 -0.96272302 -0.0050849076 0.15815069 
		-0.98741466 -0.0008037939 0.15815069 -0.98741466 -0.0008037939 0.15815069 
		-0.98741466 -0.0008037939 0.15815069 -0.98741466 -0.0008037939 0.98465449 
		0.070512734 -0.15963517 0.98465449 0.070512734 -0.15963517 0.98465449 0.070512734 
		-0.15963517 0.98465449 0.070512734 -0.15963517 0.8967694 0.005775915 -0.44246045 
		0.8967694 0.005775915 -0.44246045 0.8967694 0.005775915 -0.44246045 0.8967694 
		0.005775915 -0.44246045 -0.96990371 -0.24330185 0.0095422268 -0.96990371 
		-0.24330185 0.0095422268 -0.96990371 -0.24330185 0.0095422268 -0.96990371 
		-0.24330185 0.0095422268 -0.14043528 -0.64319915 -0.75271028 -0.14043528 
		-0.64319915 -0.75271028 -0.14043528 -0.64319915 -0.75271028 -0.14043528 -0.64319915 
		-0.75271028 0.06342297 -0.99790156 0.013037846 0.06342297 -0.99790156 0.013037846 
		0.06342297 -0.99790156 0.013037846 0.06342297 -0.99790156 0.013037846 0.92524165 
		-0.27192295 -0.26454827 0.92524165 -0.27192295 -0.26454827 0.92524165 -0.27192295 
		-0.26454827 0.92524165 -0.27192295 -0.26454827 0.98308998 -0.042560555 -0.17810871 
		0.98308998 -0.042560555 -0.17810871 0.98308998 -0.042560555 -0.17810871 0.98308998 
		-0.042560555 -0.17810871 0.97967446 0.16445084 -0.11486431 0.97967446 0.16445084 
		-0.11486431 0.97967446 0.16445084 -0.11486431 0.97967446 0.16445084 -0.11486431 
		0.48141938 -0.85378993 -0.19818713 0.48141938 -0.85378993 -0.19818713 0.48141938 
		-0.85378993 -0.19818713 0.48141938 -0.85378993 -0.19818713 0 -1 -2.3804777e-008 
		0 -1 -2.3804777e-008 0 -1 -2.3804777e-008 0 -1 -2.3804777e-008 -0.46189955 
		-0.88673389 0.018756868 -0.46189955 -0.88673389 0.018756868 -0.46189955 -0.88673389 
		0.018756868 -0.46189955 -0.88673389 0.018756868 -0.81265783 -0.57596898 -0.088583328 
		-0.81265783 -0.57596898 -0.088583328 -0.81265783 -0.57596898 -0.088583328 
		-0.81265783 -0.57596898 -0.088583328 -0.99537677 -0.068234429 -0.067595303 
		-0.99537677 -0.068234429 -0.067595303 -0.99537677 -0.068234429 -0.067595303 
		-0.99537677 -0.068234429 -0.067595303 -0.0003409312 -0.99752009 0.070381239 
		-0.0003409312 -0.99752009 0.070381239 -0.0003409312 -0.99752009 0.070381239 
		-0.0003409312 -0.99752009 0.070381239 0.51393992 0.85622102 -0.052453682 
		0.51393992 0.85622102 -0.052453682 0.51393992 0.85622102 -0.052453682 0.51393992 
		0.85622102 -0.052453682 -0.043603897 -0.99201113 -0.11837487 -0.043603897 
		-0.99201113 -0.11837487 -0.043603897 -0.99201113 -0.11837487 -0.043603897 
		-0.99201113 -0.11837487 0.026891856 -0.99541605 -0.091780461 0.026891856 
		-0.99541605 -0.091780461 0.026891856 -0.99541605 -0.091780461 0.026891856 
		-0.99541605 -0.091780461 0 -1 -8.4757295e-009 0 -1 -8.4757295e-009 0 -1 -8.4757295e-009 
		0 -1 -8.4757295e-009 0.088925496 -0.98498064 -0.14800465 0.088925496 -0.98498064 
		-0.14800465 0.088925496 -0.98498064 -0.14800465 0.088925496 -0.98498064 -0.14800465 
		0 -1 -5.3624136e-009 0 -1 -5.3624136e-009 0 -1 -5.3624136e-009 0 -1 -5.3624136e-009 
		-0.21731113 0.552212 -0.80488372 -0.21731113 0.552212 -0.80488372 -0.21731113 
		0.552212 -0.80488372 -0.21731113 0.552212 -0.80488372 0.9265151 -0.11358098 
		-0.35870469 0.9265151 -0.11358098 -0.35870469 0.9265151 -0.11358098 -0.35870469 
		0.9265151 -0.11358098 -0.35870469 -0.95171142 -0.23317088 -0.1996917 -0.95171142 
		-0.23317088 -0.1996917 -0.95171142 -0.23317088 -0.1996917 -0.95171142 -0.23317088 
		-0.1996917 0.76059765 -0.64586824 -0.065920025 0.76059765 -0.64586824 -0.065920025 
		0.76059765 -0.64586824 -0.065920025 0.76059765 -0.64586824 -0.065920025 0.023671819 
		-0.99387324 0.10796176 0.023671819 -0.99387324 0.10796176 0.023671819 -0.99387324 
		0.10796176 0.023671819 -0.99387324 0.10796176 -0.50884008 -0.85703337 0.08109045 
		-0.50884008 -0.85703337 0.08109045 -0.50884008 -0.85703337 0.08109045 -0.50884008 
		-0.85703337 0.08109045 -0.096271627 0.99491322 -0.029655457 -0.096271627 
		0.99491322 -0.029655457 -0.096271627 0.99491322 -0.029655457 -0.096271627 
		0.99491322 -0.029655457 -0.8593027 -0.23225863 -0.45569161 -0.8593027 -0.23225863 
		-0.45569161 -0.8593027 -0.23225863 -0.45569161 -0.8593027 -0.23225863 -0.45569161 
		-0.1007264 -0.99377811 0.047532067 -0.1007264 -0.99377811 0.047532067 -0.1007264 
		-0.99377811 0.047532067 -0.1007264 -0.99377811 0.047532067 0.90813255 0.32786617 
		0.26038244 0.90813255 0.32786617 0.26038244 0.90813255 0.32786617 0.26038244 
		0.90813255 0.32786617 0.26038244 0.10674404 0.99417889 0.014629629 0.10674404 
		0.99417889 0.014629629 0.10674404 0.99417889 0.014629629 0.10674404 0.99417889 
		0.014629629 -0.99051607 0.10169812 0.092387564 -0.99051607 0.10169812 0.092387564 
		-0.99051607 0.10169812 0.092387564 -0.99051607 0.10169812 0.092387564 0.043838847 
		-0.99267882 0.11254749 0.043838847 -0.99267882 0.11254749 0.043838847 -0.99267882 
		0.11254749 0.043838847 -0.99267882 0.11254749 0.99578077 -0.032167897 -0.085940793;
	setAttr ".n[2324:2489]" -type "float3"  0.99578077 -0.032167897 -0.085940793 
		0.99578077 -0.032167897 -0.085940793 0.99578077 -0.032167897 -0.085940793 
		-0.89193463 0.25757444 0.37162882 -0.89193463 0.25757444 0.37162882 -0.89193463 
		0.25757444 0.37162882 -0.89193463 0.25757444 0.37162882 0.11777921 -0.99015617 
		0.075622678 0.11777921 -0.99015617 0.075622678 0.11777921 -0.99015617 0.075622678 
		0.11777921 -0.99015617 0.075622678 0.9808659 -0.13179563 -0.14328988 0.9808659 
		-0.13179563 -0.14328988 0.9808659 -0.13179563 -0.14328988 0.9808659 -0.13179563 
		-0.14328988 0.22171111 0.97348207 0.056363564 0.22171111 0.97348207 0.056363564 
		0.22171111 0.97348207 0.056363564 0.22171111 0.97348207 0.056363564 -0.56536245 
		0.6512562 0.50619239 -0.56536245 0.6512562 0.50619239 -0.56536245 0.6512562 
		0.50619239 -0.56536245 0.6512562 0.50619239 -0.62929815 0.59283745 0.50252122 
		-0.62929815 0.59283745 0.50252122 -0.62929815 0.59283745 0.50252122 -0.62929815 
		0.59283745 0.50252122 -0.6327101 0.61510462 0.47045118 -0.6327101 0.61510462 
		0.47045118 -0.6327101 0.61510462 0.47045118 -0.6327101 0.61510462 0.47045118 
		-0.58376718 0.66342574 0.46806207 -0.58376718 0.66342574 0.46806207 -0.58376718 
		0.66342574 0.46806207 -0.58376718 0.66342574 0.46806207 -0.019615935 0.99978429 
		0.006831313 -0.019615935 0.99978429 0.006831313 -0.019615935 0.99978429 0.006831313 
		-0.019615935 0.99978429 0.006831313 -0.97915488 0.092770763 -0.18069124 -0.97915488 
		0.092770763 -0.18069124 -0.97915488 0.092770763 -0.18069124 -0.97915488 0.092770763 
		-0.18069124 -0.22033538 -0.95843989 0.18123278 -0.22033538 -0.95843989 0.18123278 
		-0.22033538 -0.95843989 0.18123278 -0.22033538 -0.95843989 0.18123278 0.86558568 
		0.41080317 0.28636032 0.86558568 0.41080317 0.28636032 0.86558568 0.41080317 
		0.28636032 0.86558568 0.41080317 0.28636032 0.042656016 0.99630821 -0.074501 
		0.042656016 0.99630821 -0.074501 0.042656016 0.99630821 -0.074501 0.042656016 
		0.99630821 -0.074501 -0.97659266 0.0037490013 -0.21506456 -0.97659266 0.0037490013 
		-0.21506456 -0.97659266 0.0037490013 -0.21506456 -0.97659266 0.0037490013 
		-0.21506456 -0.14676285 -0.98156196 0.12246139 -0.14676285 -0.98156196 0.12246139 
		-0.14676285 -0.98156196 0.12246139 -0.14676285 -0.98156196 0.12246139 0.91778827 
		0.27093828 0.29027081 0.91778827 0.27093828 0.29027081 0.91778827 0.27093828 
		0.29027081 0.91778827 0.27093828 0.29027081 -0.14378016 0.98367423 0.10822365 
		-0.14378016 0.98367423 0.10822365 -0.14378016 0.98367423 0.10822365 -0.14378016 
		0.98367423 0.10822365 -0.97823018 -0.17401485 -0.11306886 -0.97823018 -0.17401485 
		-0.11306886 -0.97823018 -0.17401485 -0.11306886 -0.97823018 -0.17401485 -0.11306886 
		-0.15179123 -0.98167855 0.115181 -0.15179123 -0.98167855 0.115181 -0.15179123 
		-0.98167855 0.115181 -0.15179123 -0.98167855 0.115181 0.92947847 0.1448269 
		0.3392565 0.92947847 0.1448269 0.3392565 0.92947847 0.1448269 0.3392565 0.92947847 
		0.1448269 0.3392565 -0.30179387 0.91228718 0.27686211 -0.30179387 0.91228718 
		0.27686211 -0.30179387 0.91228718 0.27686211 -0.30179387 0.91228718 0.27686211 
		-0.98036611 -0.092387304 -0.17420343 -0.98036611 -0.092387304 -0.17420343 
		-0.98036611 -0.092387304 -0.17420343 -0.98036611 -0.092387304 -0.17420343 
		0.14283372 -0.98639303 -0.081408128 0.14283372 -0.98639303 -0.081408128 0.14283372 
		-0.98639303 -0.081408128 0.14283372 -0.98639303 -0.081408128 0.91119915 0.17750511 
		0.37176335 0.91119915 0.17750511 0.37176335 0.91119915 0.17750511 0.37176335 
		0.91119915 0.17750511 0.37176335 -0.41565558 0.81030726 0.41307703 -0.41565558 
		0.81030726 0.41307703 -0.41565558 0.81030726 0.41307703 -0.41565558 0.81030726 
		0.41307703 -0.94896394 -0.27288413 -0.1581192 -0.94896394 -0.27288413 -0.1581192 
		-0.94896394 -0.27288413 -0.1581192 -0.94896394 -0.27288413 -0.1581192 0.24835648 
		-0.95798057 -0.14350004 0.24835648 -0.95798057 -0.14350004 0.24835648 -0.95798057 
		-0.14350004 0.24835648 -0.95798057 -0.14350004 0.84978366 -0.10810006 0.51592839 
		0.84978366 -0.10810006 0.51592839 0.84978366 -0.10810006 0.51592839 0.84978366 
		-0.10810006 0.51592839 0.11548101 0.69059521 0.71396244 0.11548101 0.69059521 
		0.71396244 0.11548101 0.69059521 0.71396244 0.11548101 0.69059521 0.71396244 
		0.17971608 0.72597003 0.66382957 0.17971608 0.72597003 0.66382957 0.17971608 
		0.72597003 0.66382957 0.17971608 0.72597003 0.66382957 0.25874439 0.67307216 
		0.69283849 0.25874439 0.67307216 0.69283849 0.25874439 0.67307216 0.69283849 
		0.25874439 0.67307216 0.69283849 0.20370296 0.63184243 0.74785042 0.20370296 
		0.63184243 0.74785042 0.20370296 0.63184243 0.74785042 0.20370296 0.63184243 
		0.74785042 0.0097298967 0.99976277 0.019487854 0.0097298967 0.99976277 0.019487854 
		0.0097298967 0.99976277 0.019487854 0.0097298967 0.99976277 0.019487854 -0.97094303 
		0.13095994 0.20029767 -0.97094303 0.13095994 0.20029767 -0.97094303 0.13095994 
		0.20029767 -0.97094303 0.13095994 0.20029767 0.055282183 -0.97864813 0.19796878 
		0.055282183 -0.97864813 0.19796878 0.055282183 -0.97864813 0.19796878 0.055282183 
		-0.97864813 0.19796878 0.99968219 -0.0016062071 0.025158433 0.99968219 -0.0016062071 
		0.025158433 0.99968219 -0.0016062071 0.025158433 0.99968219 -0.0016062071 
		0.025158433 0.010554474 0.99626201 -0.085735142 0.010554474 0.99626201 -0.085735142 
		0.010554474 0.99626201 -0.085735142 0.010554474 0.99626201 -0.085735142 -0.99031842 
		-0.05264065 0.12844622 -0.99031842 -0.05264065 0.12844622 -0.99031842 -0.05264065 
		0.12844622 -0.99031842 -0.05264065 0.12844622 0.048776086 -0.98667902 0.15519479 
		0.048776086 -0.98667902 0.15519479 0.048776086 -0.98667902 0.15519479 0.048776086 
		-0.98667902 0.15519479 0.98906463 -0.13888839 0.04961073 0.98906463 -0.13888839 
		0.04961073 0.98906463 -0.13888839 0.04961073 0.98906463 -0.13888839 0.04961073 
		0.033457797 0.97201794 0.23251165 0.033457797 0.97201794 0.23251165 0.033457797 
		0.97201794 0.23251165;
	setAttr ".n[2490:2655]" -type "float3"  0.033457797 0.97201794 0.23251165 
		-0.9853732 -0.11008883 0.13007741 -0.9853732 -0.11008883 0.13007741 -0.9853732 
		-0.11008883 0.13007741 -0.9853732 -0.11008883 0.13007741 0.070411779 -0.9915691 
		0.10877891 0.070411779 -0.9915691 0.10877891 0.070411779 -0.9915691 0.10877891 
		0.070411779 -0.9915691 0.10877891 0.98728627 -0.15895231 -1.0233403e-005 
		0.98728627 -0.15895231 -1.0233403e-005 0.98728627 -0.15895231 -1.0233403e-005 
		0.98728627 -0.15895231 -1.0233403e-005 0.03029429 0.95960689 0.27970868 0.03029429 
		0.95960689 0.27970868 0.03029429 0.95960689 0.27970868 0.03029429 0.95960689 
		0.27970868 -0.97160584 -0.19296969 0.13691163 -0.97160584 -0.19296969 0.13691163 
		-0.97160584 -0.19296969 0.13691163 -0.97160584 -0.19296969 0.13691163 -0.018681368 
		-0.99779886 -0.063627779 -0.018681368 -0.99779886 -0.063627779 -0.018681368 
		-0.99779886 -0.063627779 -0.018681368 -0.99779886 -0.063627779 0.96456772 
		-0.26191449 0.031779543 0.96456772 -0.26191449 0.031779543 0.96456772 -0.26191449 
		0.031779543 0.96456772 -0.26191449 0.031779543 0.06132872 0.89243424 0.44698983 
		0.06132872 0.89243424 0.44698983 0.06132872 0.89243424 0.44698983 0.06132872 
		0.89243424 0.44698983 -0.95796555 -0.25433642 0.13272159 -0.95796555 -0.25433642 
		0.13272159 -0.95796555 -0.25433642 0.13272159 -0.95796555 -0.25433642 0.13272159 
		-0.10215769 -0.97926301 -0.1749507 -0.10215769 -0.97926301 -0.1749507 -0.10215769 
		-0.97926301 -0.1749507 -0.10215769 -0.97926301 -0.1749507 0.89702851 -0.44197249 
		-0.00039930036 0.89702851 -0.44197249 -0.00039930036 0.89702851 -0.44197249 
		-0.00039930036 0.89702851 -0.44197249 -0.00039930036 0.68835223 0.3902356 
		0.61146325 0.68835223 0.3902356 0.61146325 0.68835223 0.3902356 0.61146325 
		0.68835223 0.3902356 0.61146325 0.80144197 0.20427133 0.56210679 0.80144197 
		0.20427133 0.56210679 0.80144197 0.20427133 0.56210679 0.80144197 0.20427133 
		0.56210679 0.74963534 0.059939638 0.65913135 0.74963534 0.059939638 0.65913135 
		0.74963534 0.059939638 0.65913135 0.74963534 0.059939638 0.65913135 0.64515811 
		0.26250669 0.71753836 0.64515811 0.26250669 0.71753836 0.64515811 0.26250669 
		0.71753836 0.64515811 0.26250669 0.71753836 -0.95579851 0.0017109135 0.29401746 
		-0.95579851 0.0017109135 0.29401746 -0.95579851 0.0017109135 0.29401746 -0.95579851 
		0.0017109135 0.29401746 0.14796045 -0.98495883 0.08924029 0.14796045 -0.98495883 
		0.08924029 0.14796045 -0.98495883 0.08924029 0.14796045 -0.98495883 0.08924029 
		0.9641946 -0.10796994 -0.24222162 0.9641946 -0.10796994 -0.24222162 0.9641946 
		-0.10796994 -0.24222162 0.9641946 -0.10796994 -0.24222162 -0.00099034642 
		0.99999934 -0.00055868051 -0.00099034642 0.99999934 -0.00055868051 -0.00099034642 
		0.99999934 -0.00055868051 -0.00099034642 0.99999934 -0.00055868051 -0.92682952 
		-0.080789246 0.36668807 -0.92682952 -0.080789246 0.36668807 -0.92682952 -0.080789246 
		0.36668807 -0.92682952 -0.080789246 0.36668807 0.13966003 -0.98853278 0.057428289 
		0.13966003 -0.98853278 0.057428289 0.13966003 -0.98853278 0.057428289 0.13966003 
		-0.98853278 0.057428289 0.97492051 -0.16054317 -0.15412931 0.97492051 -0.16054317 
		-0.15412931 0.97492051 -0.16054317 -0.15412931 0.97492051 -0.16054317 -0.15412931 
		-0.053712744 0.99648029 -0.064358339 -0.053712744 0.99648029 -0.064358339 
		-0.053712744 0.99648029 -0.064358339 -0.053712744 0.99648029 -0.064358339 
		-0.95425916 -0.082057603 0.28749952 -0.95425916 -0.082057603 0.28749952 -0.95425916 
		-0.082057603 0.28749952 -0.95425916 -0.082057603 0.28749952 0.13487734 -0.9887622 
		0.064477697 0.13487734 -0.9887622 0.064477697 0.13487734 -0.9887622 0.064477697 
		0.13487734 -0.9887622 0.064477697 0.95975155 -0.26006752 -0.1060275 0.95975155 
		-0.26006752 -0.1060275 0.95975155 -0.26006752 -0.1060275 0.95975155 -0.26006752 
		-0.1060275 0.12493398 0.97890288 0.16168073 0.12493398 0.97890288 0.16168073 
		0.12493398 0.97890288 0.16168073 0.12493398 0.97890288 0.16168073 -0.89575922 
		-0.29130098 0.3357963 -0.89575922 -0.29130098 0.3357963 -0.89575922 -0.29130098 
		0.3357963 -0.89575922 -0.29130098 0.3357963 0.017464513 -0.99976844 -0.012572699 
		0.017464513 -0.99976844 -0.012572699 0.017464513 -0.99976844 -0.012572699 
		0.017464513 -0.99976844 -0.012572699 0.94766384 -0.29283613 -0.12720148 0.94766384 
		-0.29283613 -0.12720148 0.94766384 -0.29283613 -0.12720148 0.94766384 -0.29283613 
		-0.12720148 0.17853928 0.95113277 0.25193271 0.17853928 0.95113277 0.25193271 
		0.17853928 0.95113277 0.25193271 0.17853928 0.95113277 0.25193271 -0.81082928 
		-0.52047455 0.26769775 -0.81082928 -0.52047455 0.26769775 -0.81082928 -0.52047455 
		0.26769775 -0.81082928 -0.52047455 0.26769775 -0.062065706 -0.99470091 -0.081963018 
		-0.062065706 -0.99470091 -0.081963018 -0.062065706 -0.99470091 -0.081963018 
		-0.062065706 -0.99470091 -0.081963018 0.77410334 -0.62552232 -0.097395122 
		0.77410334 -0.62552232 -0.097395122 0.77410334 -0.62552232 -0.097395122 0.77410334 
		-0.62552232 -0.097395122 0.43823904 0.67984605 0.58801013 0.43823904 0.67984605 
		0.58801013 0.43823904 0.67984605 0.58801013 0.43823904 0.67984605 0.58801013 
		0.87672657 -0.43524453 0.20472588 0.87672657 -0.43524453 0.20472588 0.87672657 
		-0.43524453 0.20472588 0.87672657 -0.43524453 0.20472588 0.72971725 -0.59090424 
		-0.34401295 0.72971725 -0.59090424 -0.34401295 0.72971725 -0.59090424 -0.34401295 
		0.72971725 -0.59090424 -0.34401295 0.46835601 -0.58995587 -0.65771937 0.46835601 
		-0.58995587 -0.65771937 0.46835601 -0.58995587 -0.65771937 0.46835601 -0.58995587 
		-0.65771937 -0.12972273 -0.58635801 -0.79959756 -0.12972273 -0.58635801 -0.79959756 
		-0.12972273 -0.58635801 -0.79959756 -0.12972273 -0.58635801 -0.79959756 -0.65117592 
		-0.6947729 -0.30538583 -0.65117592 -0.6947729 -0.30538583 -0.65117592 -0.6947729 
		-0.30538583 -0.65117592 -0.6947729 -0.30538583 -0.80677485 -0.45642892 0.37521589 
		-0.80677485 -0.45642892 0.37521589 -0.80677485 -0.45642892 0.37521589 -0.80677485 
		-0.45642892 0.37521589 -0.4892247 -0.20252465 0.84831768;
	setAttr ".n[2656:2821]" -type "float3"  -0.4892247 -0.20252465 0.84831768 
		-0.4892247 -0.20252465 0.84831768 -0.4892247 -0.20252465 0.84831768 0.3758809 
		-0.22302589 0.89942926 0.3758809 -0.22302589 0.89942926 0.3758809 -0.22302589 
		0.89942926 0.3758809 -0.22302589 0.89942926 0 -1 -2.187333e-009 0 -1 -2.187333e-009 
		0 -1 -2.187333e-009 0 -1 -2.187333e-009 -0.94998604 0.18583806 0.2509796 
		-0.94998604 0.18583806 0.2509796 -0.94998604 0.18583806 0.2509796 -0.94998604 
		0.18583806 0.2509796 -0.92986649 0.02885299 -0.36676395 -0.92986649 0.02885299 
		-0.36676395 -0.92986649 0.02885299 -0.36676395 -0.92986649 0.02885299 -0.36676395 
		-0.22483772 0.19286169 0.95511901 -0.22483772 0.19286169 0.95511901 -0.22483772 
		0.19286169 0.95511901 -0.22483772 0.19286169 0.95511901 0.56638861 -0.099685483 
		0.81808728 0.56638861 -0.099685483 0.81808728 0.56638861 -0.099685483 0.81808728 
		0.56638861 -0.099685483 0.81808728 0.16262607 -0.52527457 -0.83524811 0.16262607 
		-0.52527457 -0.83524811 0.16262607 -0.52527457 -0.83524811 0.16262607 -0.52527457 
		-0.83524811 -0.52897161 -0.2636798 -0.80663621 -0.52897161 -0.2636798 -0.80663621 
		-0.52897161 -0.2636798 -0.80663621 -0.52897161 -0.2636798 -0.80663621 0.88282466 
		-0.3730568 0.28539327 0.88282466 -0.3730568 0.28539327 0.88282466 -0.3730568 
		0.28539327 0.88282466 -0.3730568 0.28539327 0.766895 -0.55793077 -0.31715184 
		0.766895 -0.55793077 -0.31715184 0.766895 -0.55793077 -0.31715184 0.766895 
		-0.55793077 -0.31715184 -0.97334349 -0.19034633 0.12794802 -0.97334349 -0.19034633 
		0.12794802 -0.97334349 -0.19034633 0.12794802 -0.97334349 -0.19034633 0.12794802 
		-0.9789812 0.096223287 -0.17982468 -0.9789812 0.096223287 -0.17982468 -0.9789812 
		0.096223287 -0.17982468 -0.9789812 0.096223287 -0.17982468 -0.38626394 -0.25564712 
		0.88625318 -0.38626394 -0.25564712 0.88625318 -0.38626394 -0.25564712 0.88625318 
		-0.38626394 -0.25564712 0.88625318 0.33745894 -0.36120665 0.86928201 0.33745894 
		-0.36120665 0.86928201 0.33745894 -0.36120665 0.86928201 0.33745894 -0.36120665 
		0.86928201 0.28800562 -0.15247858 -0.94541156 0.28800562 -0.15247858 -0.94541156 
		0.28800562 -0.15247858 -0.94541156 0.28800562 -0.15247858 -0.94541156 -0.6563161 
		-0.10708934 -0.74684739 -0.6563161 -0.10708934 -0.74684739 -0.6563161 -0.10708934 
		-0.74684739 -0.6563161 -0.10708934 -0.74684739 0.78425205 -0.54612136 0.29444882 
		0.78425205 -0.54612136 0.29444882 0.78425205 -0.54612136 0.29444882 0.78425205 
		-0.54612136 0.29444882 0.83141696 -0.46573916 -0.30303937 0.83141696 -0.46573916 
		-0.30303937 0.83141696 -0.46573916 -0.30303937 0.83141696 -0.46573916 -0.30303937 
		-0.91906637 -0.29244712 0.2641812 -0.91906637 -0.29244712 0.2641812 -0.91906637 
		-0.29244712 0.2641812 -0.91906637 -0.29244712 0.2641812 -0.97001058 -0.097258642 
		-0.22275597 -0.97001058 -0.097258642 -0.22275597 -0.97001058 -0.097258642 
		-0.22275597 -0.97001058 -0.097258642 -0.22275597 -0.44298691 -0.46912664 
		0.76399136 -0.44298691 -0.46912664 0.76399136 -0.44298691 -0.46912664 0.76399136 
		-0.44298691 -0.46912664 0.76399136 0.67501712 -0.2982527 0.67483127 0.67501712 
		-0.2982527 0.67483127 0.67501712 -0.2982527 0.67483127 0.67501712 -0.2982527 
		0.67483127 0.24315745 0.22512318 -0.94350094 0.24315745 0.22512318 -0.94350094 
		0.24315745 0.22512318 -0.94350094 0.24315745 0.22512318 -0.94350094 -0.54264987 
		0.14062773 -0.82810324 -0.54264987 0.14062773 -0.82810324 -0.54264987 0.14062773 
		-0.82810324 -0.54264987 0.14062773 -0.82810324 0.6556325 -0.28373423 0.69974345 
		0.6556325 -0.28373423 0.69974345 0.6556325 -0.28373423 0.69974345 0.6556325 
		-0.28373423 0.69974345 0.9720155 -0.0068699913 -0.23481604 0.9720155 -0.0068699913 
		-0.23481604 0.9720155 -0.0068699913 -0.23481604 0.9720155 -0.0068699913 -0.23481604 
		-0.96797806 -0.16251175 0.19133335 -0.96797806 -0.16251175 0.19133335 -0.96797806 
		-0.16251175 0.19133335 -0.96797806 -0.16251175 0.19133335 -0.88714355 -0.15728721 
		-0.43386295 -0.88714355 -0.15728721 -0.43386295 -0.88714355 -0.15728721 -0.43386295 
		-0.88714355 -0.15728721 -0.43386295 -0.43394747 -0.42428717 0.79477668 -0.43394747 
		-0.42428717 0.79477668 -0.43394747 -0.42428717 0.79477668 -0.43394747 -0.42428717 
		0.79477668 0.52022797 -0.27291185 0.80924779 0.52022797 -0.27291185 0.80924779 
		0.52022797 -0.27291185 0.80924779 0.52022797 -0.27291185 0.80924779 0.17108327 
		0.73716694 -0.65369362 0.17108327 0.73716694 -0.65369362 0.17108327 0.73716694 
		-0.65369362 0.17108327 0.73716694 -0.65369362 -0.53702033 0.54560184 -0.64337224 
		-0.53702033 0.54560184 -0.64337224 -0.53702033 0.54560184 -0.64337224 -0.53702033 
		0.54560184 -0.64337224 0.74011379 -0.14943683 0.65566772 0.74011379 -0.14943683 
		0.65566772 0.74011379 -0.14943683 0.65566772 0.74011379 -0.14943683 0.65566772 
		0.82361633 0.56696683 -0.014306557 0.82361633 0.56696683 -0.014306557 0.82361633 
		0.56696683 -0.014306557 0.82361633 0.56696683 -0.014306557 -0.38128886 -0.49180081 
		0.78278399 -0.38128886 -0.49180081 0.78278399 -0.38128886 -0.49180081 0.78278399 
		-0.38128886 -0.49180081 0.78278399 -0.89493793 -0.34273568 0.28568932 -0.89493793 
		-0.34273568 0.28568932 -0.89493793 -0.34273568 0.28568932 -0.89493793 -0.34273568 
		0.28568932 -0.96448249 -0.12007359 -0.23527832 -0.96448249 -0.12007359 -0.23527832 
		-0.96448249 -0.12007359 -0.23527832 -0.96448249 -0.12007359 -0.23527832 -0.60469824 
		0.18783157 -0.77398926 -0.60469824 0.18783157 -0.77398926 -0.60469824 0.18783157 
		-0.77398926 -0.60469824 0.18783157 -0.77398926 0.20314585 0.33767539 -0.91907948 
		0.20314585 0.33767539 -0.91907948 0.20314585 0.33767539 -0.91907948 0.20314585 
		0.33767539 -0.91907948 0.96759748 0.076536752 -0.24061845 0.96759748 0.076536752 
		-0.24061845 0.96759748 0.076536752 -0.24061845 0.96759748 0.076536752 -0.24061845 
		0.78530949 -0.24114637 0.57020825 0.78530949 -0.24114637 0.57020825 0.78530949 
		-0.24114637 0.57020825;
	setAttr ".n[2822:2987]" -type "float3"  0.78530949 -0.24114637 0.57020825 
		0.55659372 -0.30809647 0.77154392 0.55659372 -0.30809647 0.77154392 0.55659372 
		-0.30809647 0.77154392 0.55659372 -0.30809647 0.77154392 -0.90171784 0.35193592 
		0.25108975 -0.90171784 0.35193592 0.25108975 -0.90171784 0.35193592 0.25108975 
		-0.90171784 0.35193592 0.25108975 -0.97276908 0.19868216 -0.11935522 -0.97276908 
		0.19868216 -0.11935522 -0.97276908 0.19868216 -0.11935522 -0.97276908 0.19868216 
		-0.11935522 -0.27340811 0.83555126 0.47655228 -0.27340811 0.83555126 0.47655228 
		-0.27340811 0.83555126 0.47655228 -0.27340811 0.83555126 0.47655228 0.24824287 
		0.80626369 0.5369491 0.24824287 0.80626369 0.5369491 0.24824287 0.80626369 
		0.5369491 0.24824287 0.80626369 0.5369491 0.13404608 0.66087615 -0.73842692 
		0.13404608 0.66087615 -0.73842692 0.13404608 0.66087615 -0.73842692 0.13404608 
		0.66087615 -0.73842692 -0.83922505 0.31671488 -0.44203272 -0.83922505 0.31671488 
		-0.44203272 -0.83922505 0.31671488 -0.44203272 -0.83922505 0.31671488 -0.44203272 
		0.82358599 0.5232929 0.21879354 0.82358599 0.5232929 0.21879354 0.82358599 
		0.5232929 0.21879354 0.82358599 0.5232929 0.21879354 0.91478074 0.38779691 
		-0.11309186 0.91478074 0.38779691 -0.11309186 0.91478074 0.38779691 -0.11309186 
		0.91478074 0.38779691 -0.11309186 -0.86591375 0.49179465 0.091276512 -0.86591375 
		0.49179465 0.091276512 -0.86591375 0.49179465 0.091276512 -0.86591375 0.49179465 
		0.091276512 -0.18433553 0.97218406 0.14449416 -0.18433553 0.97218406 0.14449416 
		-0.18433553 0.97218406 0.14449416 -0.18433553 0.97218406 0.14449416 0.33052084 
		0.9274959 0.17466347 0.33052084 0.9274959 0.17466347 0.33052084 0.9274959 
		0.17466347 0.33052084 0.9274959 0.17466347 0.23199442 0.34590483 -0.90913612 
		0.23199442 0.34590483 -0.90913612 0.23199442 0.34590483 -0.90913612 0.23199442 
		0.34590483 -0.90913612 -0.80298924 0.23991063 -0.54557419 -0.80298924 0.23991063 
		-0.54557419 -0.80298924 0.23991063 -0.54557419 -0.80298924 0.23991063 -0.54557419 
		0.97383207 0.18403922 0.1333442 0.97383207 0.18403922 0.1333442 0.97383207 
		0.18403922 0.1333442 0.97383207 0.18403922 0.1333442 0.85316187 0.19823946 
		-0.48251006 0.85316187 0.19823946 -0.48251006 0.85316187 0.19823946 -0.48251006 
		0.85316187 0.19823946 -0.48251006 0.084876753 0.77093208 -0.63123661 0.084876753 
		0.77093208 -0.63123661 0.084876753 0.77093208 -0.63123661 0.084876753 0.77093208 
		-0.63123661 -0.68553334 0.51075929 -0.51881498 -0.68553334 0.51075929 -0.51881498 
		-0.68553334 0.51075929 -0.51881498 -0.68553334 0.51075929 -0.51881498 0.75456136 
		0.53838456 -0.37520561 0.75456136 0.53838456 -0.37520561 0.75456136 0.53838456 
		-0.37520561 0.75456136 0.53838456 -0.37520561 0.96003217 -0.097081907 -0.26251346 
		0.96003217 -0.097081907 -0.26251346 0.96003217 -0.097081907 -0.26251346 0.96003217 
		-0.097081907 -0.26251346 -0.84668976 0.41226786 -0.33638015 -0.84668976 0.41226786 
		-0.33638015 -0.84668976 0.41226786 -0.33638015 -0.84668976 0.41226786 -0.33638015 
		-0.98911303 -0.12891273 -0.070971787 -0.98911303 -0.12891273 -0.070971787 
		-0.98911303 -0.12891273 -0.070971787 -0.98911303 -0.12891273 -0.070971787 
		-0.60486042 -0.63237596 -0.48398808 -0.60486042 -0.63237596 -0.48398808 -0.60486042 
		-0.63237596 -0.48398808 -0.60486042 -0.63237596 -0.48398808 0.79402202 0.59713113 
		-0.11385696 0.79402202 0.59713113 -0.11385696 0.79402202 0.59713113 -0.11385696 
		0.79402202 0.59713113 -0.11385696 0.97097254 0.15645723 0.180924 0.97097254 
		0.15645723 0.180924 0.97097254 0.15645723 0.180924 0.97097254 0.15645723 
		0.180924 0.98536485 0.1668089 -0.035083607 0.98536485 0.1668089 -0.035083607 
		0.98536485 0.1668089 -0.035083607 0.98536485 0.1668089 -0.035083607 -0.43144867 
		0.89235902 0.13246666 -0.43144867 0.89235902 0.13246666 -0.43144867 0.89235902 
		0.13246666 -0.43144867 0.89235902 0.13246666 -0.78040802 0.61725289 -0.099810801 
		-0.78040802 0.61725289 -0.099810801 -0.78040802 0.61725289 -0.099810801 -0.78040802 
		0.61725289 -0.099810801 -0.18980008 0.95263225 0.23762932 -0.18980008 0.95263225 
		0.23762932 -0.18980008 0.95263225 0.23762932 -0.18980008 0.95263225 0.23762932 
		0.19013967 0.95600873 0.22337006 0.19013967 0.95600873 0.22337006 0.19013967 
		0.95600873 0.22337006 0.19013967 0.95600873 0.22337006 0.94752866 0.31561419 
		-0.050765809 0.94752866 0.31561419 -0.050765809 0.94752866 0.31561419 -0.050765809 
		0.94752866 0.31561419 -0.050765809 0.25046036 0.36662096 -0.89602381 0.25046036 
		0.36662096 -0.89602381 0.25046036 0.36662096 -0.89602381 0.25046036 0.36662096 
		-0.89602381 -0.84669459 0.24995013 -0.46971607 -0.84669459 0.24995013 -0.46971607 
		-0.84669459 0.24995013 -0.46971607 -0.84669459 0.24995013 -0.46971607 -0.80386275 
		0.5472393 -0.23309602 -0.80386275 0.5472393 -0.23309602 -0.80386275 0.5472393 
		-0.23309602 -0.80386275 0.5472393 -0.23309602 -0.78987765 0.30199486 -0.53375316 
		-0.78987765 0.30199486 -0.53375316 -0.78987765 0.30199486 -0.53375316 -0.78987765 
		0.30199486 -0.53375316 0.92303622 -0.14178166 -0.3576341 0.92303622 -0.14178166 
		-0.3576341 0.92303622 -0.14178166 -0.3576341 0.92303622 -0.14178166 -0.3576341 
		-0.050380744 -0.99400085 0.097077511 -0.050380744 -0.99400085 0.097077511 
		-0.050380744 -0.99400085 0.097077511 -0.050380744 -0.99400085 0.097077511 
		0.13783304 -0.9811452 0.13548462 0.13783304 -0.9811452 0.13548462 0.13783304 
		-0.9811452 0.13548462 0.13783304 -0.9811452 0.13548462 0.98762274 -0.15538114 
		-0.021400971 0.98762274 -0.15538114 -0.021400971 0.98762274 -0.15538114 -0.021400971 
		0.98762274 -0.15538114 -0.021400971 0.32974324 -0.94271833 -0.050512653 0.32974324 
		-0.94271833 -0.050512653 0.32974324 -0.94271833 -0.050512653 0.32974324 -0.94271833 
		-0.050512653 0.27044126 -0.96272302 -0.0050849062 0.27044126 -0.96272302 
		-0.0050849062 0.27044126 -0.96272302 -0.0050849062 0.27044126 -0.96272302 
		-0.0050849062 -0.15815076 -0.98741466 -0.000803795;
	setAttr ".n[2988:3153]" -type "float3"  -0.15815076 -0.98741466 -0.000803795 
		-0.15815076 -0.98741466 -0.000803795 -0.15815076 -0.98741466 -0.000803795 
		-0.98465455 0.070512794 -0.15963523 -0.98465455 0.070512794 -0.15963523 -0.98465455 
		0.070512794 -0.15963523 -0.98465455 0.070512794 -0.15963523 -0.8967694 0.0057757678 
		-0.44246048 -0.8967694 0.0057757678 -0.44246048 -0.8967694 0.0057757678 -0.44246048 
		-0.8967694 0.0057757678 -0.44246048 0.96990377 -0.24330153 0.0095422138 0.96990377 
		-0.24330153 0.0095422138 0.96990377 -0.24330153 0.0095422138 0.96990377 -0.24330153 
		0.0095422138 0.14043573 -0.64319915 -0.75271016 0.14043573 -0.64319915 -0.75271016 
		0.14043573 -0.64319915 -0.75271016 0.14043573 -0.64319915 -0.75271016 -0.063422948 
		-0.99790156 0.013037848 -0.063422948 -0.99790156 0.013037848 -0.063422948 
		-0.99790156 0.013037848 -0.063422948 -0.99790156 0.013037848 -0.92524177 
		-0.27192262 -0.26454815 -0.92524177 -0.27192262 -0.26454815 -0.92524177 -0.27192262 
		-0.26454815 -0.92524177 -0.27192262 -0.26454815 -0.98308998 -0.042560514 
		-0.17810872 -0.98308998 -0.042560514 -0.17810872 -0.98308998 -0.042560514 
		-0.17810872 -0.98308998 -0.042560514 -0.17810872 -0.97967452 0.16445088 -0.11486423 
		-0.97967452 0.16445088 -0.11486423 -0.97967452 0.16445088 -0.11486423 -0.97967452 
		0.16445088 -0.11486423 -0.48141968 -0.85378975 -0.1981872 -0.48141968 -0.85378975 
		-0.1981872 -0.48141968 -0.85378975 -0.1981872 -0.48141968 -0.85378975 -0.1981872 
		0 -1 -1.6342579e-008 0 -1 -1.6342579e-008 0 -1 -1.6342579e-008 0 -1 -1.6342579e-008 
		0.46189967 -0.88673383 0.018756861 0.46189967 -0.88673383 0.018756861 0.46189967 
		-0.88673383 0.018756861 0.46189967 -0.88673383 0.018756861 0.81265771 -0.57596916 
		-0.088583358 0.81265771 -0.57596916 -0.088583358 0.81265771 -0.57596916 -0.088583358 
		0.81265771 -0.57596916 -0.088583358 0.99537683 -0.068234332 -0.067595281 
		0.99537683 -0.068234332 -0.067595281 0.99537683 -0.068234332 -0.067595281 
		0.99537683 -0.068234332 -0.067595281 0.00034093068 -0.99752009 0.070381209 
		0.00034093068 -0.99752009 0.070381209 0.00034093068 -0.99752009 0.070381209 
		0.00034093068 -0.99752009 0.070381209 -0.51393998 0.8562209 -0.052453671 
		-0.51393998 0.8562209 -0.052453671 -0.51393998 0.8562209 -0.052453671 -0.51393998 
		0.8562209 -0.052453671 0.043603957 -0.99201113 -0.11837486 0.043603957 -0.99201113 
		-0.11837486 0.043603957 -0.99201113 -0.11837486 0.043603957 -0.99201113 -0.11837486 
		-0.026891842 -0.99541605 -0.091780439 -0.026891842 -0.99541605 -0.091780439 
		-0.026891842 -0.99541605 -0.091780439 -0.026891842 -0.99541605 -0.091780439 
		0 -1 -6.2997949e-009 0 -1 -6.2997949e-009 0 -1 -6.2997949e-009 0 -1 -6.2997949e-009 
		-0.08892554 -0.98498064 -0.14800471 -0.08892554 -0.98498064 -0.14800471 -0.08892554 
		-0.98498064 -0.14800471 -0.08892554 -0.98498064 -0.14800471 0 -1 -3.9318464e-009 
		0 -1 -3.9318464e-009 0 -1 -3.9318464e-009 0 -1 -3.9318464e-009 0.21731097 
		0.55221188 -0.80488384 0.21731097 0.55221188 -0.80488384 0.21731097 0.55221188 
		-0.80488384 0.21731097 0.55221188 -0.80488384 -0.92651522 -0.11358061 -0.35870466 
		-0.92651522 -0.11358061 -0.35870466 -0.92651522 -0.11358061 -0.35870466 -0.92651522 
		-0.11358061 -0.35870466 0.95171142 -0.23317088 -0.19969168 0.95171142 -0.23317088 
		-0.19969168 0.95171142 -0.23317088 -0.19969168 0.95171142 -0.23317088 -0.19969168 
		-0.76059765 -0.64586818 -0.065920025 -0.76059765 -0.64586818 -0.065920025 
		-0.76059765 -0.64586818 -0.065920025 -0.76059765 -0.64586818 -0.065920025 
		-0.023671702 -0.99387318 0.10796172 -0.023671702 -0.99387318 0.10796172 -0.023671702 
		-0.99387318 0.10796172 -0.023671702 -0.99387318 0.10796172 0.50884008 -0.85703337 
		0.081090406 0.50884008 -0.85703337 0.081090406 0.50884008 -0.85703337 0.081090406 
		0.50884008 -0.85703337 0.081090406 0.096271634 0.99491322 -0.029655434 0.096271634 
		0.99491322 -0.029655434 0.096271634 0.99491322 -0.029655434 0.096271634 0.99491322 
		-0.029655434 0.85930264 -0.23225863 -0.45569167 0.85930264 -0.23225863 -0.45569167 
		0.85930264 -0.23225863 -0.45569167 0.85930264 -0.23225863 -0.45569167 0.1007264 
		-0.99377811 0.04753207 0.1007264 -0.99377811 0.04753207 0.1007264 -0.99377811 
		0.04753207 0.1007264 -0.99377811 0.04753207 -0.90813255 0.32786605 0.26038247 
		-0.90813255 0.32786605 0.26038247 -0.90813255 0.32786605 0.26038247 -0.90813255 
		0.32786605 0.26038247 -0.10674401 0.99417889 0.014629726 -0.10674401 0.99417889 
		0.014629726 -0.10674401 0.99417889 0.014629726 -0.10674401 0.99417889 0.014629726 
		0.99051607 0.10169806 0.092387557 0.99051607 0.10169806 0.092387557 0.99051607 
		0.10169806 0.092387557 0.99051607 0.10169806 0.092387557 -0.043838833 -0.99267876 
		0.11254746 -0.043838833 -0.99267876 0.11254746 -0.043838833 -0.99267876 0.11254746 
		-0.043838833 -0.99267876 0.11254746 -0.99578083 -0.032168325 -0.085940808 
		-0.99578083 -0.032168325 -0.085940808 -0.99578083 -0.032168325 -0.085940808 
		-0.99578083 -0.032168325 -0.085940808 0.89193457 0.25757468 0.37162882 0.89193457 
		0.25757468 0.37162882 0.89193457 0.25757468 0.37162882 0.89193457 0.25757468 
		0.37162882 -0.11777917 -0.99015617 0.075622648 -0.11777917 -0.99015617 0.075622648 
		-0.11777917 -0.99015617 0.075622648 -0.11777917 -0.99015617 0.075622648 -0.9808659 
		-0.13179569 -0.14328982 -0.9808659 -0.13179569 -0.14328982 -0.9808659 -0.13179569 
		-0.14328982 -0.9808659 -0.13179569 -0.14328982 -0.22171108 0.97348207 0.056363549 
		-0.22171108 0.97348207 0.056363549 -0.22171108 0.97348207 0.056363549 -0.22171108 
		0.97348207 0.056363549 0.56536227 0.65125638 0.50619227 0.56536227 0.65125638 
		0.50619227 0.56536227 0.65125638 0.50619227 0.56536227 0.65125638 0.50619227 
		0.62929821 0.59283751 0.5025211 0.62929821 0.59283751 0.5025211 0.62929821 
		0.59283751 0.5025211 0.62929821 0.59283751 0.5025211 0.63270992 0.61510485 
		0.47045106 0.63270992 0.61510485 0.47045106 0.63270992 0.61510485 0.47045106;
	setAttr ".n[3154:3319]" -type "float3"  0.63270992 0.61510485 0.47045106 
		0.583767 0.66342604 0.46806192 0.583767 0.66342604 0.46806192 0.583767 0.66342604 
		0.46806192 0.583767 0.66342604 0.46806192 0.019615926 0.99978423 0.0068313587 
		0.019615926 0.99978423 0.0068313587 0.019615926 0.99978423 0.0068313587 0.019615926 
		0.99978423 0.0068313587 0.97915488 0.092770651 -0.18069127 0.97915488 0.092770651 
		-0.18069127 0.97915488 0.092770651 -0.18069127 0.97915488 0.092770651 -0.18069127 
		0.22033533 -0.95843989 0.18123275 0.22033533 -0.95843989 0.18123275 0.22033533 
		-0.95843989 0.18123275 0.22033533 -0.95843989 0.18123275 -0.86558563 0.41080326 
		0.28636032 -0.86558563 0.41080326 0.28636032 -0.86558563 0.41080326 0.28636032 
		-0.86558563 0.41080326 0.28636032 -0.042656016 0.99630821 -0.074500978 -0.042656016 
		0.99630821 -0.074500978 -0.042656016 0.99630821 -0.074500978 -0.042656016 
		0.99630821 -0.074500978 0.97659266 0.0037490376 -0.21506456 0.97659266 0.0037490376 
		-0.21506456 0.97659266 0.0037490376 -0.21506456 0.97659266 0.0037490376 -0.21506456 
		0.14676301 -0.9815619 0.12246152 0.14676301 -0.9815619 0.12246152 0.14676301 
		-0.9815619 0.12246152 0.14676301 -0.9815619 0.12246152 -0.91778827 0.27093822 
		0.29027081 -0.91778827 0.27093822 0.29027081 -0.91778827 0.27093822 0.29027081 
		-0.91778827 0.27093822 0.29027081 0.14378017 0.98367417 0.10822367 0.14378017 
		0.98367417 0.10822367 0.14378017 0.98367417 0.10822367 0.14378017 0.98367417 
		0.10822367 0.97823024 -0.1740146 -0.11306887 0.97823024 -0.1740146 -0.11306887 
		0.97823024 -0.1740146 -0.11306887 0.97823024 -0.1740146 -0.11306887 0.1517912 
		-0.98167855 0.11518095 0.1517912 -0.98167855 0.11518095 0.1517912 -0.98167855 
		0.11518095 0.1517912 -0.98167855 0.11518095 -0.92947841 0.14482723 0.3392565 
		-0.92947841 0.14482723 0.3392565 -0.92947841 0.14482723 0.3392565 -0.92947841 
		0.14482723 0.3392565 0.30179387 0.91228718 0.27686214 0.30179387 0.91228718 
		0.27686214 0.30179387 0.91228718 0.27686214 0.30179387 0.91228718 0.27686214 
		0.98036611 -0.092387736 -0.17420343 0.98036611 -0.092387736 -0.17420343 0.98036611 
		-0.092387736 -0.17420343 0.98036611 -0.092387736 -0.17420343 -0.14283371 
		-0.98639303 -0.081408158 -0.14283371 -0.98639303 -0.081408158 -0.14283371 
		-0.98639303 -0.081408158 -0.14283371 -0.98639303 -0.081408158 -0.91119921 
		0.17750515 0.37176329 -0.91119921 0.17750515 0.37176329 -0.91119921 0.17750515 
		0.37176329 -0.91119921 0.17750515 0.37176329 0.41565555 0.8103072 0.41307706 
		0.41565555 0.8103072 0.41307706 0.41565555 0.8103072 0.41307706 0.41565555 
		0.8103072 0.41307706 0.94896394 -0.27288407 -0.15811922 0.94896394 -0.27288407 
		-0.15811922 0.94896394 -0.27288407 -0.15811922 0.94896394 -0.27288407 -0.15811922 
		-0.24835636 -0.95798063 -0.14349997 -0.24835636 -0.95798063 -0.14349997 -0.24835636 
		-0.95798063 -0.14349997 -0.24835636 -0.95798063 -0.14349997 -0.84978366 -0.10810017 
		0.51592833 -0.84978366 -0.10810017 0.51592833 -0.84978366 -0.10810017 0.51592833 
		-0.84978366 -0.10810017 0.51592833 -0.11548106 0.69059515 0.71396255 -0.11548106 
		0.69059515 0.71396255 -0.11548106 0.69059515 0.71396255 -0.11548106 0.69059515 
		0.71396255 -0.17971602 0.72597039 0.66382921 -0.17971602 0.72597039 0.66382921 
		-0.17971602 0.72597039 0.66382921 -0.17971602 0.72597039 0.66382921 -0.25874427 
		0.67307258 0.69283819 -0.25874427 0.67307258 0.69283819 -0.25874427 0.67307258 
		0.69283819 -0.25874427 0.67307258 0.69283819 -0.20370267 0.63184232 0.74785054 
		-0.20370267 0.63184232 0.74785054 -0.20370267 0.63184232 0.74785054 -0.20370267 
		0.63184232 0.74785054 -0.0097298929 0.99976271 0.019487832 -0.0097298929 
		0.99976271 0.019487832 -0.0097298929 0.99976271 0.019487832 -0.0097298929 
		0.99976271 0.019487832 0.97094297 0.13096008 0.20029765 0.97094297 0.13096008 
		0.20029765 0.97094297 0.13096008 0.20029765 0.97094297 0.13096008 0.20029765 
		-0.055282205 -0.97864813 0.19796881 -0.055282205 -0.97864813 0.19796881 -0.055282205 
		-0.97864813 0.19796881 -0.055282205 -0.97864813 0.19796881 -0.99968219 -0.0016066113 
		0.025158437 -0.99968219 -0.0016066113 0.025158437 -0.99968219 -0.0016066113 
		0.025158437 -0.99968219 -0.0016066113 0.025158437 -0.010554476 0.99626201 
		-0.085735202 -0.010554476 0.99626201 -0.085735202 -0.010554476 0.99626201 
		-0.085735202 -0.010554476 0.99626201 -0.085735202 0.99031842 -0.052640062 
		0.12844625 0.99031842 -0.052640062 0.12844625 0.99031842 -0.052640062 0.12844625 
		0.99031842 -0.052640062 0.12844625 -0.048776075 -0.98667902 0.15519473 -0.048776075 
		-0.98667902 0.15519473 -0.048776075 -0.98667902 0.15519473 -0.048776075 -0.98667902 
		0.15519473 -0.98906475 -0.13888744 0.049610734 -0.98906475 -0.13888744 0.049610734 
		-0.98906475 -0.13888744 0.049610734 -0.98906475 -0.13888744 0.049610734 -0.03345779 
		0.972018 0.23251164 -0.03345779 0.972018 0.23251164 -0.03345779 0.972018 
		0.23251164 -0.03345779 0.972018 0.23251164 0.98537314 -0.11008944 0.13007738 
		0.98537314 -0.11008944 0.13007738 0.98537314 -0.11008944 0.13007738 0.98537314 
		-0.11008944 0.13007738 -0.070411764 -0.9915691 0.10877891 -0.070411764 -0.9915691 
		0.10877891 -0.070411764 -0.9915691 0.10877891 -0.070411764 -0.9915691 0.10877891 
		-0.98728621 -0.15895285 -1.0230519e-005 -0.98728621 -0.15895285 -1.0230519e-005 
		-0.98728621 -0.15895285 -1.0230519e-005 -0.98728621 -0.15895285 -1.0230519e-005 
		-0.03029431 0.95960689 0.27970859 -0.03029431 0.95960689 0.27970859 -0.03029431 
		0.95960689 0.27970859 -0.03029431 0.95960689 0.27970859 0.97160584 -0.19296955 
		0.13691165 0.97160584 -0.19296955 0.13691165 0.97160584 -0.19296955 0.13691165 
		0.97160584 -0.19296955 0.13691165 0.018681355 -0.99779886 -0.063627757 0.018681355 
		-0.99779886 -0.063627757 0.018681355 -0.99779886 -0.063627757 0.018681355 
		-0.99779886 -0.063627757 -0.96456784 -0.26191396 0.031779546 -0.96456784 
		-0.26191396 0.031779546 -0.96456784 -0.26191396 0.031779546 -0.96456784 -0.26191396 
		0.031779546 -0.061328676 0.89243412 0.44699013;
	setAttr ".n[3320:3485]" -type "float3"  -0.061328676 0.89243412 0.44699013 
		-0.061328676 0.89243412 0.44699013 -0.061328676 0.89243412 0.44699013 0.95796555 
		-0.25433633 0.13272156 0.95796555 -0.25433633 0.13272156 0.95796555 -0.25433633 
		0.13272156 0.95796555 -0.25433633 0.13272156 0.10215766 -0.97926301 -0.17495073 
		0.10215766 -0.97926301 -0.17495073 0.10215766 -0.97926301 -0.17495073 0.10215766 
		-0.97926301 -0.17495073 -0.8970291 -0.4419713 -0.00039931707 -0.8970291 -0.4419713 
		-0.00039931707 -0.8970291 -0.4419713 -0.00039931707 -0.8970291 -0.4419713 
		-0.00039931707 -0.68835235 0.3902362 0.61146283 -0.68835235 0.3902362 0.61146283 
		-0.68835235 0.3902362 0.61146283 -0.68835235 0.3902362 0.61146283 -0.80144203 
		0.20427117 0.56210673 -0.80144203 0.20427117 0.56210673 -0.80144203 0.20427117 
		0.56210673 -0.80144203 0.20427117 0.56210673 -0.74963522 0.059939176 0.65913147 
		-0.74963522 0.059939176 0.65913147 -0.74963522 0.059939176 0.65913147 -0.74963522 
		0.059939176 0.65913147 -0.64515817 0.26250625 0.71753848 -0.64515817 0.26250625 
		0.71753848 -0.64515817 0.26250625 0.71753848 -0.64515817 0.26250625 0.71753848 
		0.95579851 0.0017116334 0.29401749 0.95579851 0.0017116334 0.29401749 0.95579851 
		0.0017116334 0.29401749 0.95579851 0.0017116334 0.29401749 -0.14796032 -0.98495883 
		0.089240201 -0.14796032 -0.98495883 0.089240201 -0.14796032 -0.98495883 0.089240201 
		-0.14796032 -0.98495883 0.089240201 -0.9641946 -0.10796974 -0.24222167 -0.9641946 
		-0.10796974 -0.24222167 -0.9641946 -0.10796974 -0.24222167 -0.9641946 -0.10796974 
		-0.24222167 0.00099034747 0.99999934 -0.00055866182 0.00099034747 0.99999934 
		-0.00055866182 0.00099034747 0.99999934 -0.00055866182 0.00099034747 0.99999934 
		-0.00055866182 0.92682958 -0.080788657 0.36668807 0.92682958 -0.080788657 
		0.36668807 0.92682958 -0.080788657 0.36668807 0.92682958 -0.080788657 0.36668807 
		-0.13966009 -0.98853278 0.057428315 -0.13966009 -0.98853278 0.057428315 -0.13966009 
		-0.98853278 0.057428315 -0.13966009 -0.98853278 0.057428315 -0.97492045 -0.16054361 
		-0.15412928 -0.97492045 -0.16054361 -0.15412928 -0.97492045 -0.16054361 -0.15412928 
		-0.97492045 -0.16054361 -0.15412928 0.053712785 0.99648029 -0.064358413 0.053712785 
		0.99648029 -0.064358413 0.053712785 0.99648029 -0.064358413 0.053712785 0.99648029 
		-0.064358413 0.95425922 -0.082057208 0.28749952 0.95425922 -0.082057208 0.28749952 
		0.95425922 -0.082057208 0.28749952 0.95425922 -0.082057208 0.28749952 -0.13487749 
		-0.9887622 0.064477764 -0.13487749 -0.9887622 0.064477764 -0.13487749 -0.9887622 
		0.064477764 -0.13487749 -0.9887622 0.064477764 -0.95975161 -0.26006737 -0.10602751 
		-0.95975161 -0.26006737 -0.10602751 -0.95975161 -0.26006737 -0.10602751 -0.95975161 
		-0.26006737 -0.10602751 -0.12493409 0.97890288 0.16168083 -0.12493409 0.97890288 
		0.16168083 -0.12493409 0.97890288 0.16168083 -0.12493409 0.97890288 0.16168083 
		0.89575911 -0.29130137 0.3357963 0.89575911 -0.29130137 0.3357963 0.89575911 
		-0.29130137 0.3357963 0.89575911 -0.29130137 0.3357963 -0.01746452 -0.99976844 
		-0.01257272 -0.01746452 -0.99976844 -0.01257272 -0.01746452 -0.99976844 -0.01257272 
		-0.01746452 -0.99976844 -0.01257272 -0.94766378 -0.29283628 -0.12720148 -0.94766378 
		-0.29283628 -0.12720148 -0.94766378 -0.29283628 -0.12720148 -0.94766378 -0.29283628 
		-0.12720148 -0.17853896 0.95113301 0.25193223 -0.17853896 0.95113301 0.25193223 
		-0.17853896 0.95113301 0.25193223 -0.17853896 0.95113301 0.25193223 0.81082916 
		-0.52047479 0.26769772 0.81082916 -0.52047479 0.26769772 0.81082916 -0.52047479 
		0.26769772 0.81082916 -0.52047479 0.26769772 0.06206562 -0.99470091 -0.081962891 
		0.06206562 -0.99470091 -0.081962891 0.06206562 -0.99470091 -0.081962891 0.06206562 
		-0.99470091 -0.081962891 -0.77410382 -0.62552178 -0.097395189 -0.77410382 
		-0.62552178 -0.097395189 -0.77410382 -0.62552178 -0.097395189 -0.77410382 
		-0.62552178 -0.097395189 -0.43823874 0.67984658 0.58800972 -0.43823874 0.67984658 
		0.58800972 -0.43823874 0.67984658 0.58800972 -0.43823874 0.67984658 0.58800972 
		-0.87672657 -0.43524468 0.20472571 -0.87672657 -0.43524468 0.20472571 -0.87672657 
		-0.43524468 0.20472571 -0.87672657 -0.43524468 0.20472571 -0.72971737 -0.59090406 
		-0.34401307 -0.72971737 -0.59090406 -0.34401307 -0.72971737 -0.59090406 -0.34401307 
		-0.72971737 -0.59090406 -0.34401307 -0.46835589 -0.58995575 -0.65771961 -0.46835589 
		-0.58995575 -0.65771961 -0.46835589 -0.58995575 -0.65771961 -0.46835589 -0.58995575 
		-0.65771961 0.12972268 -0.58635753 -0.79959798 0.12972268 -0.58635753 -0.79959798 
		0.12972268 -0.58635753 -0.79959798 0.12972268 -0.58635753 -0.79959798 0.65117586 
		-0.69477308 -0.30538556 0.65117586 -0.69477308 -0.30538556 0.65117586 -0.69477308 
		-0.30538556 0.65117586 -0.69477308 -0.30538556 0.80677515 -0.45642814 0.37521625 
		0.80677515 -0.45642814 0.37521625 0.80677515 -0.45642814 0.37521625 0.80677515 
		-0.45642814 0.37521625 0.48922473 -0.2025248 0.84831768 0.48922473 -0.2025248 
		0.84831768 0.48922473 -0.2025248 0.84831768 0.48922473 -0.2025248 0.84831768 
		-0.37588122 -0.22302581 0.89942914 -0.37588122 -0.22302581 0.89942914 -0.37588122 
		-0.22302581 0.89942914 -0.37588122 -0.22302581 0.89942914 -0.14883648 0.44416863 
		0.88349414 -0.14883648 0.44416863 0.88349414 -0.14883648 0.44416863 0.88349414 
		-0.14883648 0.44416863 0.88349414 -0.83478975 0.51055545 0.20605625 -0.83478975 
		0.51055545 0.20605625 -0.83478975 0.51055545 0.20605625 -0.83478975 0.51055545 
		0.20605625 -0.8946504 0.25496978 -0.3668665 -0.8946504 0.25496978 -0.3668665 
		-0.8946504 0.25496978 -0.3668665 -0.8946504 0.25496978 -0.3668665 -0.63019848 
		-0.076723747 -0.77263403 -0.63019848 -0.076723747 -0.77263403 -0.63019848 
		-0.076723747 -0.77263403 -0.63019848 -0.076723747 -0.77263403 0.28207529 
		-0.42170504 -0.86174148 0.28207529 -0.42170504 -0.86174148 0.28207529 -0.42170504 
		-0.86174148 0.28207529 -0.42170504 -0.86174148 0.55628312 -0.033224832 0.8303284 
		0.55628312 -0.033224832 0.8303284 0.55628312 -0.033224832 0.8303284;
	setAttr ".n[3486:3651]" -type "float3"  0.55628312 -0.033224832 0.8303284 
		0.8527962 -0.44272351 0.27701008 0.8527962 -0.44272351 0.27701008 0.8527962 
		-0.44272351 0.27701008 0.8527962 -0.44272351 0.27701008 0.78911966 -0.49415639 
		-0.36482823 0.78911966 -0.49415639 -0.36482823 0.78911966 -0.49415639 -0.36482823 
		0.78911966 -0.49415639 -0.36482823 0.41336572 0.64662766 0.64109397 0.41336572 
		0.64662766 0.64109397 0.41336572 0.64662766 0.64109397 0.41336572 0.64662766 
		0.64109397 0.29572642 -0.077665918 0.95211023 0.29572642 -0.077665918 0.95211023 
		0.29572642 -0.077665918 0.95211023 0.29572642 -0.077665918 0.95211023 0.42332435 
		0.9031539 -0.07148096 0.42332435 0.9031539 -0.07148096 0.42332435 0.9031539 
		-0.07148096 0.42332435 0.9031539 -0.07148096 0.41872361 0.54053444 -0.72972119 
		0.41872361 0.54053444 -0.72972119 0.41872361 0.54053444 -0.72972119 0.41872361 
		0.54053444 -0.72972119 0.046487894 -0.56248635 0.82549864 0.046487894 -0.56248635 
		0.82549864 0.046487894 -0.56248635 0.82549864 0.046487894 -0.56248635 0.82549864 
		0.12944312 -0.97872889 -0.1591673 0.12944312 -0.97872889 -0.1591673 0.12944312 
		-0.97872889 -0.1591673 0.12944312 -0.97872889 -0.1591673 0.17307912 -0.9440248 
		-0.28082168 0.17307912 -0.9440248 -0.28082168 0.17307912 -0.9440248 -0.28082168 
		0.17307912 -0.9440248 -0.28082168 0.34094968 0.086034685 -0.93613636 0.34094968 
		0.086034685 -0.93613636 0.34094968 0.086034685 -0.93613636 0.34094968 0.086034685 
		-0.93613636 0.014556227 0.88010889 0.47454876 0.014556227 0.88010889 0.47454876 
		0.014556227 0.88010889 0.47454876 0.014556227 0.88010889 0.47454876 -0.003965361 
		0.15903747 0.98726457 -0.003965361 0.15903747 0.98726457 -0.003965361 0.15903747 
		0.98726457 -0.003965361 0.15903747 0.98726457 -0.0091776513 0.98704737 0.16016623 
		-0.0091776513 0.98704737 0.16016623 -0.0091776513 0.98704737 0.16016623 -0.0091776513 
		0.98704737 0.16016623 -0.21584342 0.85664326 -0.4685871 -0.21584342 0.85664326 
		-0.4685871 -0.21584342 0.85664326 -0.4685871 -0.21584342 0.85664326 -0.4685871 
		-0.0061214254 -0.57426089 0.81864947 -0.0061214254 -0.57426089 0.81864947 
		-0.0061214254 -0.57426089 0.81864947 -0.0061214254 -0.57426089 0.81864947 
		-0.12945406 -0.98572671 -0.10763158 -0.12945406 -0.98572671 -0.10763158 -0.12945406 
		-0.98572671 -0.10763158 -0.12945406 -0.98572671 -0.10763158 -0.18569097 -0.92057699 
		-0.34359396 -0.18569097 -0.92057699 -0.34359396 -0.18569097 -0.92057699 -0.34359396 
		-0.18569097 -0.92057699 -0.34359396 -0.2407513 0.23361142 -0.94205338 -0.2407513 
		0.23361142 -0.94205338 -0.2407513 0.23361142 -0.94205338 -0.2407513 0.23361142 
		-0.94205338 -0.26806536 0.74931562 0.60553032 -0.26806536 0.74931562 0.60553032 
		-0.26806536 0.74931562 0.60553032 -0.26806536 0.74931562 0.60553032 -0.28651449 
		0.088905498 0.95394194 -0.28651449 0.088905498 0.95394194 -0.28651449 0.088905498 
		0.95394194 -0.28651449 0.088905498 0.95394194 -0.062844478 0.99343807 0.09555839 
		-0.062844478 0.99343807 0.09555839 -0.062844478 0.99343807 0.09555839 -0.062844478 
		0.99343807 0.09555839 -0.23039895 0.78565454 -0.57416308 -0.23039895 0.78565454 
		-0.57416308 -0.23039895 0.78565454 -0.57416308 -0.23039895 0.78565454 -0.57416308 
		-0.006277266 -0.5281319 0.84913915 -0.006277266 -0.5281319 0.84913915 -0.006277266 
		-0.5281319 0.84913915 -0.006277266 -0.5281319 0.84913915 -0.22327974 -0.97475314 
		-0.0015830731 -0.22327974 -0.97475314 -0.0015830731 -0.22327974 -0.97475314 
		-0.0015830731 -0.22327974 -0.97475314 -0.0015830731 -0.33203602 -0.83791268 
		-0.433191 -0.33203602 -0.83791268 -0.433191 -0.33203602 -0.83791268 -0.433191 
		-0.33203602 -0.83791268 -0.433191 -0.49508005 0.26381454 -0.8278271 -0.49508005 
		0.26381454 -0.8278271 -0.49508005 0.26381454 -0.8278271 -0.49508005 0.26381454 
		-0.8278271 0.36046788 0.8302955 0.42505553 0.36046788 0.8302955 0.42505553 
		0.36046788 0.8302955 0.42505553 0.36046788 0.8302955 0.42505553 0.59762806 
		0.16517177 0.7845757 0.59762806 0.16517177 0.7845757 0.59762806 0.16517177 
		0.7845757 0.59762806 0.16517177 0.7845757 0.17847368 0.98054421 0.081732519 
		0.17847368 0.98054421 0.081732519 0.17847368 0.98054421 0.081732519 0.17847368 
		0.98054421 0.081732519 0.20874505 0.78857219 -0.57842845 0.20874505 0.78857219 
		-0.57842845 0.20874505 0.78857219 -0.57842845 0.20874505 0.78857219 -0.57842845 
		0.54838282 -0.56799042 0.61372888 0.54838282 -0.56799042 0.61372888 0.54838282 
		-0.56799042 0.61372888 0.54838282 -0.56799042 0.61372888 0.20021896 -0.96739024 
		-0.15514021 0.20021896 -0.96739024 -0.15514021 0.20021896 -0.96739024 -0.15514021 
		0.20021896 -0.96739024 -0.15514021 0.17359228 -0.90900898 -0.37890422 0.17359228 
		-0.90900898 -0.37890422 0.17359228 -0.90900898 -0.37890422 0.17359228 -0.90900898 
		-0.37890422 0.25364557 0.28116235 -0.92553318 0.25364557 0.28116235 -0.92553318 
		0.25364557 0.28116235 -0.92553318 0.25364557 0.28116235 -0.92553318 0.034481775 
		0.80957931 0.58599687 0.034481775 0.80957931 0.58599687 0.034481775 0.80957931 
		0.58599687 0.034481775 0.80957931 0.58599687 -0.035815354 0.16574353 0.98551834 
		-0.035815354 0.16574353 0.98551834 -0.035815354 0.16574353 0.98551834 -0.035815354 
		0.16574353 0.98551834 0.09230116 0.97936064 0.17981449 0.09230116 0.97936064 
		0.17981449 0.09230116 0.97936064 0.17981449 0.09230116 0.97936064 0.17981449 
		0.21867433 0.84074515 -0.49530715 0.21867433 0.84074515 -0.49530715 0.21867433 
		0.84074515 -0.49530715 0.21867433 0.84074515 -0.49530715 -0.0020787837 -0.45867038 
		0.88860404 -0.0020787837 -0.45867038 0.88860404 -0.0020787837 -0.45867038 
		0.88860404 -0.0020787837 -0.45867038 0.88860404 0.17157248 -0.98516387 0.0038713613 
		0.17157248 -0.98516387 0.0038713613 0.17157248 -0.98516387 0.0038713613 0.17157248 
		-0.98516387 0.0038713613 0.25199568 -0.85013133 -0.46235788 0.25199568 -0.85013133 
		-0.46235788 0.25199568 -0.85013133 -0.46235788 0.25199568 -0.85013133 -0.46235788 
		0.32989696 0.25578162 -0.9087044;
	setAttr ".n[3652:3817]" -type "float3"  0.32989696 0.25578162 -0.9087044 
		0.32989696 0.25578162 -0.9087044 0.32989696 0.25578162 -0.9087044 -0.17551237 
		0.78824878 0.58979601 -0.17551237 0.78824878 0.58979601 -0.17551237 0.78824878 
		0.58979601 -0.17551237 0.78824878 0.58979601 -0.21028991 0.09320233 0.97318625 
		-0.21028991 0.09320233 0.97318625 -0.21028991 0.09320233 0.97318625 -0.21028991 
		0.09320233 0.97318625 -0.1197613 0.9869169 0.10794588 -0.1197613 0.9869169 
		0.10794588 -0.1197613 0.9869169 0.10794588 -0.1197613 0.9869169 0.10794588 
		-0.029666735 0.8628276 -0.50462699 -0.029666735 0.8628276 -0.50462699 -0.029666735 
		0.8628276 -0.50462699 -0.029666735 0.8628276 -0.50462699 -0.24989107 -0.46710253 
		0.84815663 -0.24989107 -0.46710253 0.84815663 -0.24989107 -0.46710253 0.84815663 
		-0.24989107 -0.46710253 0.84815663 -0.15746999 -0.98641312 0.046822689 -0.15746999 
		-0.98641312 0.046822689 -0.15746999 -0.98641312 0.046822689 -0.15746999 -0.98641312 
		0.046822689 -0.013173704 -0.80949283 -0.58698195 -0.013173704 -0.80949283 
		-0.58698195 -0.013173704 -0.80949283 -0.58698195 -0.013173704 -0.80949283 
		-0.58698195 0.062197141 0.31909385 -0.94568002 0.062197141 0.31909385 -0.94568002 
		0.062197141 0.31909385 -0.94568002 0.062197141 0.31909385 -0.94568002 -0.29839909 
		-0.025848862 0.95409113 -0.29839909 -0.025848862 0.95409113 -0.29839909 -0.025848862 
		0.95409113 -0.29839909 -0.025848862 0.95409113 -0.051277556 0.82213062 0.56698489 
		-0.051277556 0.82213062 0.56698489 -0.051277556 0.82213062 0.56698489 -0.051277556 
		0.82213062 0.56698489 0.015504643 0.99836427 0.055030983 0.015504643 0.99836427 
		0.055030983 0.015504643 0.99836427 0.055030983 0.015504643 0.99836427 0.055030983 
		-0.31971955 0.65912306 -0.68068802 -0.31971955 0.65912306 -0.68068802 -0.31971955 
		0.65912306 -0.68068802 -0.31971955 0.65912306 -0.68068802 -0.56338674 0.12450845 
		-0.81675762 -0.56338674 0.12450845 -0.81675762 -0.56338674 0.12450845 -0.81675762 
		-0.56338674 0.12450845 -0.81675762 -0.43223673 -0.83700186 -0.33555812 -0.43223673 
		-0.83700186 -0.33555812 -0.43223673 -0.83700186 -0.33555812 -0.43223673 -0.83700186 
		-0.33555812 -0.54866332 -0.82572538 -0.13094313 -0.54866332 -0.82572538 -0.13094313 
		-0.54866332 -0.82572538 -0.13094313 -0.54866332 -0.82572538 -0.13094313 -0.49394888 
		-0.41932058 0.7616986 -0.49394888 -0.41932058 0.7616986 -0.49394888 -0.41932058 
		0.7616986 -0.49394888 -0.41932058 0.7616986 -0.94450235 -0.3084853 -0.11292559 
		-0.94450235 -0.3084853 -0.11292559 -0.94450235 -0.3084853 -0.11292559 -0.94450235 
		-0.3084853 -0.11292559 -0.95364416 -0.20852739 0.21697737 -0.95364416 -0.20852739 
		0.21697737 -0.95364416 -0.20852739 0.21697737 -0.95364416 -0.20852739 0.21697737 
		-0.92633009 -0.18088648 0.33044311 -0.92633009 -0.18088648 0.33044311 -0.92633009 
		-0.18088648 0.33044311 -0.92633009 -0.18088648 0.33044311 -0.6458596 -0.18224615 
		0.74138498 -0.6458596 -0.18224615 0.74138498 -0.6458596 -0.18224615 0.74138498 
		-0.6458596 -0.18224615 0.74138498 -0.1469949 0.96708339 -0.20770697 -0.1469949 
		0.96708339 -0.20770697 -0.1469949 0.96708339 -0.20770697 -0.1469949 0.96708339 
		-0.20770697 -0.69770062 0.71481913 0.047407474 -0.69770062 0.71481913 0.047407474 
		-0.69770062 0.71481913 0.047407474 -0.69770062 0.71481913 0.047407474 -0.91534871 
		0.38731134 0.11012096 -0.91534871 0.38731134 0.11012096 -0.91534871 0.38731134 
		0.11012096 -0.91534871 0.38731134 0.11012096 -0.96965504 0.086917736 -0.22850469 
		-0.96965504 0.086917736 -0.22850469 -0.96965504 0.086917736 -0.22850469 -0.96965504 
		0.086917736 -0.22850469 -0.94715655 -0.21209508 -0.24064521 -0.94715655 -0.21209508 
		-0.24064521 -0.94715655 -0.21209508 -0.24064521 -0.94715655 -0.21209508 -0.24064521 
		-0.034481812 0.80958074 0.58599496 -0.034481812 0.80958074 0.58599496 -0.034481812 
		0.80958074 0.58599496 -0.034481812 0.80958074 0.58599496 0.035815373 0.16574353 
		0.98551834 0.035815373 0.16574353 0.98551834 0.035815373 0.16574353 0.98551834 
		0.035815373 0.16574353 0.98551834 0.0020787634 -0.45867142 0.88860351 0.0020787634 
		-0.45867142 0.88860351 0.0020787634 -0.45867142 0.88860351 0.0020787634 -0.45867142 
		0.88860351 -0.17157245 -0.98516393 0.0038713606 -0.17157245 -0.98516393 0.0038713606 
		-0.17157245 -0.98516393 0.0038713606 -0.17157245 -0.98516393 0.0038713606 
		-0.25199583 -0.85013127 -0.46235803 -0.25199583 -0.85013127 -0.46235803 -0.25199583 
		-0.85013127 -0.46235803 -0.25199583 -0.85013127 -0.46235803 -0.32989696 0.25578162 
		-0.9087044 -0.32989696 0.25578162 -0.9087044 -0.32989696 0.25578162 -0.9087044 
		-0.32989696 0.25578162 -0.9087044 -0.21867433 0.84074515 -0.49530715 -0.21867433 
		0.84074515 -0.49530715 -0.21867433 0.84074515 -0.49530715 -0.21867433 0.84074515 
		-0.49530715 -0.092301197 0.979361 0.17981236 -0.092301197 0.979361 0.17981236 
		-0.092301197 0.979361 0.17981236 -0.092301197 0.979361 0.17981236 -0.57876128 
		0.7970351 0.17254105 -0.57876128 0.7970351 0.17254105 -0.57876128 0.7970351 
		0.17254105 -0.57876128 0.7970351 0.17254105 -0.28206676 0.92950922 0.23759395 
		-0.28206676 0.92950922 0.23759395 -0.28206676 0.92950922 0.23759395 -0.28206676 
		0.92950922 0.23759395 0.80524701 0.56826001 -0.16928612 0.80524701 0.56826001 
		-0.16928612 0.80524701 0.56826001 -0.16928612 0.80524701 0.56826001 -0.16928612 
		-0.86623907 0.0477795 0.49733993 -0.86623907 0.0477795 0.49733993 -0.86623907 
		0.0477795 0.49733993 -0.86623907 0.0477795 0.49733993 -0.054758687 0.26781365 
		0.96191335 -0.054758687 0.26781365 0.96191335 -0.054758687 0.26781365 0.96191335 
		-0.054758687 0.26781365 0.96191335 -0.4758496 0.088272847 -0.87508571 -0.4758496 
		0.088272847 -0.87508571 -0.4758496 0.088272847 -0.87508571 -0.4758496 0.088272847 
		-0.87508571 -0.80102396 -0.33095229 0.49882987 -0.80102396 -0.33095229 0.49882987 
		-0.80102396 -0.33095229 0.49882987 -0.80102396 -0.33095229 0.49882987 0.58574659 
		0.61223471 -0.53110224 0.58574659 0.61223471 -0.53110224 0.58574659 0.61223471 
		-0.53110224;
	setAttr ".n[3818:3983]" -type "float3"  0.58574659 0.61223471 -0.53110224 
		-0.14640033 0.97673303 0.15671493 -0.14640033 0.97673303 0.15671493 -0.14640033 
		0.97673303 0.15671493 0.48880255 0.74783802 -0.44923311 0.48880255 0.74783802 
		-0.44923311 0.48880255 0.74783802 -0.44923311 0.48880255 0.74783802 -0.44923311 
		-0.206093 0.48326096 0.85087281 -0.206093 0.48326096 0.85087281 -0.206093 
		0.48326096 0.85087281 -0.206093 0.48326096 0.85087281 -0.62956274 0.46136761 
		-0.6251325 -0.62956274 0.46136761 -0.6251325 -0.62956274 0.46136761 -0.6251325 
		-0.62956274 0.46136761 -0.6251325 -0.64696842 -0.62319618 0.43938401 -0.64696842 
		-0.62319618 0.43938401 -0.64696842 -0.62319618 0.43938401 -0.64696842 -0.62319618 
		0.43938401 -0.83361077 -0.33770323 0.43709221 -0.83361077 -0.33770323 0.43709221 
		-0.83361077 -0.33770323 0.43709221 -0.83361077 -0.33770323 0.43709221 -0.73429096 
		-0.49658826 0.46283567 -0.73429096 -0.49658826 0.46283567 -0.73429096 -0.49658826 
		0.46283567 -0.73429096 -0.49658826 0.46283567 -0.94784963 -0.2542536 0.19218795 
		-0.94784963 -0.2542536 0.19218795 -0.94784963 -0.2542536 0.19218795 -0.94784963 
		-0.2542536 0.19218795 -0.71401197 -0.53557855 0.45093518 -0.71401197 -0.53557855 
		0.45093518 -0.71401197 -0.53557855 0.45093518 -0.71401197 -0.53557855 0.45093518 
		-0.6055795 -0.63174033 0.48391905 -0.6055795 -0.63174033 0.48391905 -0.6055795 
		-0.63174033 0.48391905 -0.6055795 -0.63174033 0.48391905 -0.96761739 -0.19960275 
		0.15451653 -0.96761739 -0.19960275 0.15451653 -0.96761739 -0.19960275 0.15451653 
		-0.96761739 -0.19960275 0.15451653 -0.99029714 0.13638049 0.026682304 -0.99029714 
		0.13638049 0.026682304 -0.99029714 0.13638049 0.026682304 -0.99029714 0.13638049 
		0.026682304 -0.99029714 0.13638049 0.026682304 -0.98937297 0.081168152 -0.12063524 
		-0.98937297 0.081168152 -0.12063524 -0.98937297 0.081168152 -0.12063524 -0.98937297 
		0.081168152 -0.12063524 -0.83309841 0.54884803 -0.068650164 -0.83309841 0.54884803 
		-0.068650164 -0.83309841 0.54884803 -0.068650164 -0.83309841 0.54884803 -0.068650164 
		0.031899951 0.24559398 0.96884775 0.031899951 0.24559398 0.96884775 0.031899951 
		0.24559398 0.96884775 0.031899951 0.24559398 0.96884775 0.89476377 0.44309518 
		-0.055357382 0.89476377 0.44309518 -0.055357382 0.89476377 0.44309518 -0.055357382 
		0.89476377 0.44309518 -0.055357382 0.62638801 0.58499682 -0.51518613 0.62638801 
		0.58499682 -0.51518613 0.62638801 0.58499682 -0.51518613 0.62638801 0.58499682 
		-0.51518613 -0.4832145 0.076299459 -0.87217093 -0.4832145 0.076299459 -0.87217093 
		-0.4832145 0.076299459 -0.87217093 -0.4832145 0.076299459 -0.87217093 -0.88829112 
		-0.22985363 0.39762577 -0.88829112 -0.22985363 0.39762577 -0.88829112 -0.22985363 
		0.39762577 -0.88829112 -0.22985363 0.39762577 -0.94350159 0.0044733686 0.3313379 
		-0.94350159 0.0044733686 0.3313379 -0.94350159 0.0044733686 0.3313379 -0.94350159 
		0.0044733686 0.3313379 -0.99668074 -0.0021476278 0.08138106 -0.99668074 -0.0021476278 
		0.08138106 -0.99668074 -0.0021476278 0.08138106 -0.99668074 -0.0021476278 
		0.08138106 -0.87721014 0.087206736 0.47212008 -0.87721014 0.087206736 0.47212008 
		-0.87721014 0.087206736 0.47212008 -0.87721014 0.087206736 0.47212008 -0.8254863 
		-0.42555091 0.3707813 -0.8254863 -0.42555091 0.3707813 -0.8254863 -0.42555091 
		0.3707813 -0.8254863 -0.42555091 0.3707813 -0.66286069 -0.65656066 0.35992199 
		-0.66286069 -0.65656066 0.35992199 -0.66286069 -0.65656066 0.35992199 -0.66286069 
		-0.65656066 0.35992199 -0.57083684 0.75416166 0.32463124 -0.57083684 0.75416166 
		0.32463124 -0.57083684 0.75416166 0.32463124 -0.57083684 0.75416166 0.32463124 
		0.6121037 0.75110608 -0.24732305 0.6121037 0.75110608 -0.24732305 0.6121037 
		0.75110608 -0.24732305 0.6121037 0.75110608 -0.24732305 -0.28610241 -0.24415804 
		0.92657012 -0.28610241 -0.24415804 0.92657012 -0.28610241 -0.24415804 0.92657012 
		-0.28610241 -0.24415804 0.92657012 0.015867645 -0.96690786 0.25463194 0.015867645 
		-0.96690786 0.25463194 0.015867645 -0.96690786 0.25463194 0.015867645 -0.96690786 
		0.25463194 -0.14145973 -0.54881173 0.82389009 -0.14145973 -0.54881173 0.82389009 
		-0.14145973 -0.54881173 0.82389009 -0.14145973 -0.54881173 0.82389009 -0.85622722 
		-0.25566399 -0.44889957 -0.85622722 -0.25566399 -0.44889957 -0.85622722 -0.25566399 
		-0.44889957 -0.85622722 -0.25566399 -0.44889957 -0.69263721 0.71012497 0.12639698 
		-0.69263721 0.71012497 0.12639698 -0.69263721 0.71012497 0.12639698 -0.69263721 
		0.71012497 0.12639698 -0.38776675 -0.13928939 0.91117257 -0.38776675 -0.13928939 
		0.91117257 -0.38776675 -0.13928939 0.91117257 -0.38776675 -0.13928939 0.91117257 
		-0.73882133 0.66061133 -0.13317543 -0.73882133 0.66061133 -0.13317543 -0.73882133 
		0.66061133 -0.13317543 -0.73882133 0.66061133 -0.13317543 -0.79752463 -0.21457797 
		-0.5638358 -0.79752463 -0.21457797 -0.5638358 -0.79752463 -0.21457797 -0.5638358 
		-0.79752463 -0.21457797 -0.5638358 -0.016257538 -0.99589652 0.089027546 -0.016257538 
		-0.99589652 0.089027546 -0.016257538 -0.99589652 0.089027546 -0.016257538 
		-0.99589652 0.089027546 -0.71221799 -0.64232433 -0.28313422 -0.71221799 -0.64232433 
		-0.28313422 -0.71221799 -0.64232433 -0.28313422 -0.71221799 -0.64232433 -0.28313422 
		0.53225178 -0.25642571 0.80681711 0.53225178 -0.25642571 0.80681711 0.53225178 
		-0.25642571 0.80681711 0.53225178 -0.25642571 0.80681711 0.96657097 0.053518143 
		0.25075167 0.96657097 0.053518143 0.25075167 0.96657097 0.053518143 0.25075167 
		0.96657097 0.053518143 0.25075167 -0.97408986 -0.0035031876 0.22613405 -0.97408986 
		-0.0035031876 0.22613405 -0.97408986 -0.0035031876 0.22613405 -0.97408986 
		-0.0035031876 0.22613405 -0.64316076 -0.20969637 0.73645884 -0.64316076 -0.20969637 
		0.73645884 -0.64316076 -0.20969637 0.73645884 -0.64316076 -0.20969637 0.73645884 
		2.8249687e-007 -0.59217197 -0.80581158 2.8249687e-007 -0.59217197 -0.80581158 
		2.8249687e-007 -0.59217197 -0.80581158 2.8249687e-007 -0.59217197 -0.80581158 
		-1.6379046e-007 -0.90318608 -0.42924923;
	setAttr ".n[3984:4149]" -type "float3"  -1.6379046e-007 -0.90318608 
		-0.42924923 -1.6379046e-007 -0.90318608 -0.42924923 -1.6379046e-007 -0.90318608 
		-0.42924923 -4.5714803e-008 -0.98966372 -0.14340727 -4.5714803e-008 -0.98966372 
		-0.14340727 -4.5714803e-008 -0.98966372 -0.14340727 -4.5714803e-008 -0.98966372 
		-0.14340727 -0.91242623 -0.25260094 0.32198015 -0.91242623 -0.25260094 0.32198015 
		-0.91242623 -0.25260094 0.32198015 -0.91242623 -0.25260094 0.32198015 -0.90382391 
		0.21466286 0.37016511 -0.90382391 0.21466286 0.37016511 -0.90382391 0.21466286 
		0.37016511 -0.90382391 0.21466286 0.37016511 -0.80409944 0.22477722 0.55036283 
		-0.80409944 0.22477722 0.55036283 -0.80409944 0.22477722 0.55036283 -0.80409944 
		0.22477722 0.55036283 -0.96136731 -0.012484205 0.27498558 -0.96136731 -0.012484205 
		0.27498558 -0.96136731 -0.012484205 0.27498558 -0.96136731 -0.012484205 0.27498558 
		-0.96136731 -0.012484205 0.27498558 -0.96136731 -0.012484205 0.27498558 -0.97555828 
		-0.14910337 0.16141331 -0.97555828 -0.14910337 0.16141331 -0.97555828 -0.14910337 
		0.16141331 -0.97555828 -0.14910337 0.16141331 -0.94935107 -0.17661016 0.25988731 
		-0.94935107 -0.17661016 0.25988731 -0.94935107 -0.17661016 0.25988731 -0.94935107 
		-0.17661016 0.25988731 -0.8770588 -0.42591307 0.22218452 -0.8770588 -0.42591307 
		0.22218452 -0.8770588 -0.42591307 0.22218452 -0.8770588 -0.42591307 0.22218452 
		-0.93485755 -0.20672919 0.28862506 -0.93485755 -0.20672919 0.28862506 -0.93485755 
		-0.20672919 0.28862506 -0.93485755 -0.20672919 0.28862506 -0.95466655 -0.039507058 
		0.29504389 -0.95466655 -0.039507058 0.29504389 -0.95466655 -0.039507058 0.29504389 
		-0.95466655 -0.039507058 0.29504389 -0.94801152 -0.15185905 0.27966595 -0.94801152 
		-0.15185905 0.27966595 -0.94801152 -0.15185905 0.27966595 -0.94801152 -0.15185905 
		0.27966595 -0.85644972 0.31596652 0.40823892 -0.85644972 0.31596652 0.40823892 
		-0.85644972 0.31596652 0.40823892 -0.85644972 0.31596652 0.40823892 -0.85165727 
		0.29073727 0.43606392 -0.85165727 0.29073727 0.43606392 -0.85165727 0.29073727 
		0.43606392 -0.85165727 0.29073727 0.43606392 -0.85165727 0.29073727 0.43606392 
		-0.51079857 0.11372203 0.85214555 -0.51079857 0.11372203 0.85214555 -0.51079857 
		0.11372203 0.85214555 -0.51079857 0.11372203 0.85214555 -0.66569221 0.29420355 
		0.68578291 -0.66569221 0.29420355 0.68578291 -0.66569221 0.29420355 0.68578291 
		-0.66569221 0.29420355 0.68578291 -0.49209851 0.24844523 0.83433443 -0.49209851 
		0.24844523 0.83433443 -0.49209851 0.24844523 0.83433443 -0.49209851 0.24844523 
		0.83433443 -0.28448802 0.93172628 0.22572719 -0.28448802 0.93172628 0.22572719 
		-0.28448802 0.93172628 0.22572719 -0.28448802 0.93172628 0.22572719 -0.86281896 
		-0.12270059 0.49039578 -0.86281896 -0.12270059 0.49039578 -0.86281896 -0.12270059 
		0.49039578 -0.86281896 -0.12270059 0.49039578 -0.28073803 -0.42166716 0.86219662 
		-0.28073803 -0.42166716 0.86219662 -0.28073803 -0.42166716 0.86219662 -0.28073803 
		-0.42166716 0.86219662 0.62687612 0.27392939 0.72937578 0.62687612 0.27392939 
		0.72937578 0.62687612 0.27392939 0.72937578 0.62687612 0.27392939 0.72937578 
		1.2680891e-007 -0.34679303 0.93794167 1.2680891e-007 -0.34679303 0.93794167 
		1.2680891e-007 -0.34679303 0.93794167 1.2680891e-007 -0.34679303 0.93794167 
		9.0602789e-008 -0.94659907 0.32241309 9.0602789e-008 -0.94659907 0.32241309 
		9.0602789e-008 -0.94659907 0.32241309 9.0602789e-008 -0.94659907 0.32241309 
		-5.1789982e-007 -0.13891132 0.99030483 -5.1789982e-007 -0.13891132 0.99030483 
		-5.1789982e-007 -0.13891132 0.99030483 -5.1789982e-007 -0.13891132 0.99030483 
		-1.4795323e-007 0.65003073 0.7599079 -1.4795323e-007 0.65003073 0.7599079 
		-1.4795323e-007 0.65003073 0.7599079 -1.4795323e-007 0.65003073 0.7599079 
		-5.042525e-008 0.94944274 -0.31394026 -5.042525e-008 0.94944274 -0.31394026 
		-5.042525e-008 0.94944274 -0.31394026 -5.042525e-008 0.94944274 -0.31394026 
		2.865961e-008 0.99697423 0.07773269 2.865961e-008 0.99697423 0.07773269 2.865961e-008 
		0.99697423 0.07773269 2.865961e-008 0.99697423 0.07773269 1.209965e-008 0.99289423 
		0.1190003 1.209965e-008 0.99289423 0.1190003 1.209965e-008 0.99289423 0.1190003 
		1.209965e-008 0.99289423 0.1190003 -0.030665318 0.98321819 0.17983758 -0.030665318 
		0.98321819 0.17983758 -0.030665318 0.98321819 0.17983758 -0.030665318 0.98321819 
		0.17983758 -2.4105926e-008 0.96223462 0.27222142 -2.4105926e-008 0.96223462 
		0.27222142 -2.4105926e-008 0.96223462 0.27222142 -2.4105926e-008 0.96223462 
		0.27222142 0.73096365 0.36884505 -0.57414764 0.73096365 0.36884505 -0.57414764 
		0.73096365 0.36884505 -0.57414764 0.73096365 0.36884505 -0.57414764 3.4094526e-008 
		0.46853396 -0.88344544 3.4094526e-008 0.46853396 -0.88344544 3.4094526e-008 
		0.46853396 -0.88344544 3.4094526e-008 0.46853396 -0.88344544 0.94231433 -0.32123065 
		0.094098791 0.94231433 -0.32123065 0.094098791 0.94231433 -0.32123065 0.094098791 
		0.94231433 -0.32123065 0.094098791 0.94397098 -0.041160617 0.32745171 0.94397098 
		-0.041160617 0.32745171 0.94397098 -0.041160617 0.32745171 0.94397098 -0.041160617 
		0.32745171 0.84053552 0.5409832 -0.02893405 0.84053552 0.5409832 -0.02893405 
		0.84053552 0.5409832 -0.02893405 0.84053552 0.5409832 -0.02893405 0.87641078 
		0.31317908 -0.3658182 0.87641078 0.31317908 -0.3658182 0.87641078 0.31317908 
		-0.3658182 0.87641078 0.31317908 -0.3658182 0.8651852 0.36566892 -0.34313372 
		0.8651852 0.36566892 -0.34313372 0.8651852 0.36566892 -0.34313372 0.8651852 
		0.36566892 -0.34313372 0.91539383 0.33810166 -0.21849787 0.91539383 0.33810166 
		-0.21849787 0.91539383 0.33810166 -0.21849787 0.91539383 0.33810166 -0.21849787 
		0.81783247 -0.37175682 -0.43925717 0.81783247 -0.37175682 -0.43925717 0.81783247 
		-0.37175682 -0.43925717 0.81783247 -0.37175682 -0.43925717 0.77381563 0.035844449 
		-0.63239586 0.77381563 0.035844449 -0.63239586 0.77381563 0.035844449 -0.63239586 
		0.77381563 0.035844449 -0.63239586 0.90835989 -0.23783866 -0.34396967 0.90835989 
		-0.23783866 -0.34396967 0.90835989 -0.23783866 -0.34396967 0.90835989 -0.23783866 
		-0.34396967;
	setAttr ".n[4150:4315]" -type "float3"  0.027006166 -0.98257655 -0.18388566 
		0.027006166 -0.98257655 -0.18388566 0.027006166 -0.98257655 -0.18388566 0.027006166 
		-0.98257655 -0.18388566 0.65890408 -0.052655324 -0.75038177 0.65890408 -0.052655324 
		-0.75038177 0.65890408 -0.052655324 -0.75038177 0.65890408 -0.052655324 -0.75038177 
		-0.94981891 -0.1343604 0.28247359 -0.94981891 -0.1343604 0.28247359 -0.94981891 
		-0.1343604 0.28247359 -0.94981891 -0.1343604 0.28247359 -0.95002866 -0.19511452 
		0.24367169 -0.95002866 -0.19511452 0.24367169 -0.95002866 -0.19511452 0.24367169 
		-0.95002866 -0.19511452 0.24367169 -0.8763864 -0.24840511 0.41260368 -0.8763864 
		-0.24840511 0.41260368 -0.8763864 -0.24840511 0.41260368 -0.8763864 -0.24840511 
		0.41260368 -0.94642001 -0.15257584 0.2846221 -0.94642001 -0.15257584 0.2846221 
		-0.94642001 -0.15257584 0.2846221 -0.94642001 -0.15257584 0.2846221 -0.73748463 
		-0.10705524 0.666825 -0.73748463 -0.10705524 0.666825 -0.73748463 -0.10705524 
		0.666825 -0.73748463 -0.10705524 0.666825 7.365233e-008 -0.01120276 0.99993724 
		7.365233e-008 -0.01120276 0.99993724 7.365233e-008 -0.01120276 0.99993724 
		7.365233e-008 -0.01120276 0.99993724 0.47658548 0.48690987 0.73197341 0.47658548 
		0.48690987 0.73197341 0.47658548 0.48690987 0.73197341 0.47658548 0.48690987 
		0.73197341 0.47658548 0.48690987 0.73197341 0.47658548 0.48690987 0.73197341 
		0.92935151 0.33304155 0.15933965 0.92935151 0.33304155 0.15933965 0.92935151 
		0.33304155 0.15933965 0.92935151 0.33304155 0.15933965 0.43887028 0.55318338 
		0.70808262 0.43887028 0.55318338 0.70808262 0.43887028 0.55318338 0.70808262 
		0.43887028 0.55318338 0.70808262 0.19288732 0.9247067 0.32819518 0.19288732 
		0.9247067 0.32819518 0.19288732 0.9247067 0.32819518 0.19288732 0.9247067 
		0.32819518 0.98299015 0.18365818 0.00012252691 0.98299015 0.18365818 0.00012252691 
		0.98299015 0.18365818 0.00012252691 0.98299015 0.18365818 0.00012252691 0.87228352 
		0.20651644 0.44325212 0.87228352 0.20651644 0.44325212 0.87228352 0.20651644 
		0.44325212 0.87228352 0.20651644 0.44325212 0.9616797 0.026296524 0.27291158 
		0.9616797 0.026296524 0.27291158 0.9616797 0.026296524 0.27291158 0.68997955 
		0.17084013 0.70337892 0.68997955 0.17084013 0.70337892 0.68997955 0.17084013 
		0.70337892 0.68997955 0.17084013 0.70337892 0.50501543 0.76009387 0.40892139 
		0.50501543 0.76009387 0.40892139 0.50501543 0.76009387 0.40892139 0.50501543 
		0.76009387 0.40892139 0.61607271 0.60830432 0.50042015 0.61607271 0.60830432 
		0.50042015 0.61607271 0.60830432 0.50042015 0.61607271 0.60830432 0.50042015 
		0.61607271 0.60830432 0.50042015 0.79069549 0.01674882 0.61198056 0.79069549 
		0.01674882 0.61198056 0.79069549 0.01674882 0.61198056 0.79069549 0.01674882 
		0.61198056 0.21237981 0.40534484 0.88915145 0.21237981 0.40534484 0.88915145 
		0.21237981 0.40534484 0.88915145 0.21237981 0.40534484 0.88915145 0.33845717 
		0.87171495 0.35434413 0.33845717 0.87171495 0.35434413 0.33845717 0.87171495 
		0.35434413 0.76059544 0.083618276 0.64381874 0.76059544 0.083618276 0.64381874 
		0.76059544 0.083618276 0.64381874 0.76059544 0.083618276 0.64381874 0.35387415 
		0.69648635 0.62424344 0.35387415 0.69648635 0.62424344 0.35387415 0.69648635 
		0.62424344 0.35387415 0.69648635 0.62424344 0.83284032 0.3508043 0.42815107 
		0.83284032 0.3508043 0.42815107 0.83284032 0.3508043 0.42815107 0.83284032 
		0.3508043 0.42815107 0.15378162 -0.0045410902 0.98809439 0.15378162 -0.0045410902 
		0.98809439 0.15378162 -0.0045410902 0.98809439 0.15378162 -0.0045410902 0.98809439 
		0.77169597 0.62184203 0.13340871 0.77169597 0.62184203 0.13340871 0.77169597 
		0.62184203 0.13340871 0.77169597 0.62184203 0.13340871 0.96935457 0.23028547 
		0.08555875 0.96935457 0.23028547 0.08555875 0.96935457 0.23028547 0.08555875 
		0.96935457 0.23028547 0.08555875 0.41209882 0.86832988 0.27600321 0.41209882 
		0.86832988 0.27600321 0.41209882 0.86832988 0.27600321 0.41209882 0.86832988 
		0.27600321 0.13748001 0.48806506 0.86191165 0.13748001 0.48806506 0.86191165 
		0.13748001 0.48806506 0.86191165 0.13748001 0.48806506 0.86191165 0.99241948 
		0.092554018 0.080853835 0.99241948 0.092554018 0.080853835 0.99241948 0.092554018 
		0.080853835 0.99241948 0.092554018 0.080853835 0.98295957 0.17057523 0.068516791 
		0.98295957 0.17057523 0.068516791 0.98295957 0.17057523 0.068516791 0.98295957 
		0.17057523 0.068516791 0.99394143 0.018689435 0.1083105 0.99394143 0.018689435 
		0.1083105 0.99394143 0.018689435 0.1083105 0.99394143 0.018689435 0.1083105 
		0.79904604 -0.039260555 0.59998667 0.79904604 -0.039260555 0.59998667 0.79904604 
		-0.039260555 0.59998667 0.79904604 -0.039260555 0.59998667 0.83129078 -0.48129588 
		0.27804664 0.83129078 -0.48129588 0.27804664 0.83129078 -0.48129588 0.27804664 
		0.83129078 -0.48129588 0.27804664 0.89666086 0.32388589 0.30182317 0.89666086 
		0.32388589 0.30182317 0.89666086 0.32388589 0.30182317 0.89666086 0.32388589 
		0.30182317 0.053526171 0.9294256 0.36510691 0.053526171 0.9294256 0.36510691 
		0.053526171 0.9294256 0.36510691 0.053526171 0.9294256 0.36510691 -0.46981084 
		0.66675907 0.57854134 -0.46981084 0.66675907 0.57854134 -0.46981084 0.66675907 
		0.57854134 -0.46981084 0.66675907 0.57854134 -0.63953102 -0.54013568 0.54704064 
		-0.63953102 -0.54013568 0.54704064 -0.63953102 -0.54013568 0.54704064 -0.63953102 
		-0.54013568 0.54704064 -0.096193582 -0.69447315 0.71305948 -0.096193582 -0.69447315 
		0.71305948 -0.096193582 -0.69447315 0.71305948 -0.096193582 -0.69447315 0.71305948 
		-0.76296729 0.5942449 0.25446787 -0.76296729 0.5942449 0.25446787 -0.76296729 
		0.5942449 0.25446787 -0.76296729 0.5942449 0.25446787 -0.93108284 0.0094235716 
		0.36468607 -0.93108284 0.0094235716 0.36468607 -0.93108284 0.0094235716 0.36468607 
		-0.93108284 0.0094235716 0.36468607 0.21021058 -0.57005018 0.79426342;
	setAttr ".n[4316:4481]" -type "float3"  0.21021058 -0.57005018 0.79426342 
		0.21021058 -0.57005018 0.79426342 0.21021058 -0.57005018 0.79426342 0.75885946 
		-0.4370355 0.48283777 0.75885946 -0.4370355 0.48283777 0.75885946 -0.4370355 
		0.48283777 0.75885946 -0.4370355 0.48283777 0.85414439 0.41407648 0.31460768 
		0.85414439 0.41407648 0.31460768 0.85414439 0.41407648 0.31460768 0.85414439 
		0.41407648 0.31460768 0.088662788 0.94279259 0.32137364 0.088662788 0.94279259 
		0.32137364 0.088662788 0.94279259 0.32137364 0.088662788 0.94279259 0.32137364 
		-0.27741143 0.28237122 0.91831875 -0.27741143 0.28237122 0.91831875 -0.27741143 
		0.28237122 0.91831875 -0.27741143 0.28237122 0.91831875 0.64416254 0.038894277 
		0.76389915 0.64416254 0.038894277 0.76389915 0.64416254 0.038894277 0.76389915 
		0.64416254 0.038894277 0.76389915 0.10061245 0.34408146 0.93353367 0.10061245 
		0.34408146 0.93353367 0.10061245 0.34408146 0.93353367 0.10061245 0.34408146 
		0.93353367 0.75026727 0.25308919 -0.61077398 0.75026727 0.25308919 -0.61077398 
		0.75026727 0.25308919 -0.61077398 0.75026727 0.25308919 -0.61077398 0.45952392 
		-0.84704792 -0.26710957 0.45952392 -0.84704792 -0.26710957 0.45952392 -0.84704792 
		-0.26710957 0.45952392 -0.84704792 -0.26710957 0.93364429 -0.2141622 0.28712872 
		0.93364429 -0.2141622 0.28712872 0.93364429 -0.2141622 0.28712872 0.93364429 
		-0.2141622 0.28712872 0.93364429 -0.2141622 0.28712872 0.55796266 -0.73985231 
		0.37589383 0.55796266 -0.73985231 0.37589383 0.55796266 -0.73985231 0.37589383 
		0.55796266 -0.73985231 0.37589383 0.67867935 0.15201959 -0.71852934 0.67867935 
		0.15201959 -0.71852934 0.67867935 0.15201959 -0.71852934 0.67867935 0.15201959 
		-0.71852934 0.19934246 0.41606361 -0.88721681 0.19934246 0.41606361 -0.88721681 
		0.19934246 0.41606361 -0.88721681 0.19934246 0.41606361 -0.88721681 0.49218848 
		-0.86814135 -0.063883491 0.49218848 -0.86814135 -0.063883491 0.49218848 -0.86814135 
		-0.063883491 0.49218848 -0.86814135 -0.063883491 0.29759806 -0.93724626 -0.18167225 
		0.29759806 -0.93724626 -0.18167225 0.29759806 -0.93724626 -0.18167225 0.95009965 
		-0.27608609 -0.14521413 0.95009965 -0.27608609 -0.14521413 0.95009965 -0.27608609 
		-0.14521413 0.95009965 -0.27608609 -0.14521413 0.9563126 -0.26305637 -0.12754454 
		0.9563126 -0.26305637 -0.12754454 0.9563126 -0.26305637 -0.12754454 0.9563126 
		-0.26305637 -0.12754454 0.75981152 -0.46966764 -0.44955391 0.75981152 -0.46966764 
		-0.44955391 0.75981152 -0.46966764 -0.44955391 0.75981152 -0.46966764 -0.44955391 
		0.83830798 -0.064548098 -0.5413624 0.83830798 -0.064548098 -0.5413624 0.83830798 
		-0.064548098 -0.5413624 0.83830798 -0.064548098 -0.5413624 0.36838585 0.18318239 
		-0.91144723 0.36838585 0.18318239 -0.91144723 0.36838585 0.18318239 -0.91144723 
		0.36838585 0.18318239 -0.91144723 0.54648185 -0.81110561 0.20848323 0.54648185 
		-0.81110561 0.20848323 0.54648185 -0.81110561 0.20848323 0.54648185 -0.81110561 
		0.20848323 0.3893936 -0.9189204 0.062912442 0.3893936 -0.9189204 0.062912442 
		0.3893936 -0.9189204 0.062912442 0.3893936 -0.9189204 0.062912442 0.92267108 
		-0.30368039 0.23760521 0.92267108 -0.30368039 0.23760521 0.92267108 -0.30368039 
		0.23760521 0.92267108 -0.30368039 0.23760521 0.92267108 -0.30368039 0.23760521 
		0.92267108 -0.30368039 0.23760521 0.94450241 -0.30848527 -0.11292528 0.94450241 
		-0.30848527 -0.11292528 0.94450241 -0.30848527 -0.11292528 0.94450241 -0.30848527 
		-0.11292528 0.95364445 -0.20852783 0.21697564 0.95364445 -0.20852783 0.21697564 
		0.95364445 -0.20852783 0.21697564 0.95364445 -0.20852783 0.21697564 0.92633027 
		-0.1808866 0.33044258 0.92633027 -0.1808866 0.33044258 0.92633027 -0.1808866 
		0.33044258 0.92633027 -0.1808866 0.33044258 0.6458593 -0.182246 0.74138528 
		0.6458593 -0.182246 0.74138528 0.6458593 -0.182246 0.74138528 0.6458593 -0.182246 
		0.74138528 0.69770056 0.71481901 0.04740965 0.69770056 0.71481901 0.04740965 
		0.69770056 0.71481901 0.04740965 0.69770056 0.71481901 0.04740965 0.91534859 
		0.38731167 0.11012113 0.91534859 0.38731167 0.11012113 0.91534859 0.38731167 
		0.11012113 0.91534859 0.38731167 0.11012113 0.96965498 0.086917691 -0.22850503 
		0.96965498 0.086917691 -0.22850503 0.96965498 0.086917691 -0.22850503 0.96965498 
		0.086917691 -0.22850503 0.94715667 -0.21209513 -0.24064472 0.94715667 -0.21209513 
		-0.24064472 0.94715667 -0.21209513 -0.24064472 0.94715667 -0.21209513 -0.24064472 
		0.57876104 0.79703462 0.17254399 0.57876104 0.79703462 0.17254399 0.57876104 
		0.79703462 0.17254399 0.57876104 0.79703462 0.17254399 0.28206691 0.92950958 
		0.23759241 0.28206691 0.92950958 0.23759241 0.28206691 0.92950958 0.23759241 
		0.28206691 0.92950958 0.23759241 -0.80524713 0.56826013 -0.16928513 -0.80524713 
		0.56826013 -0.16928513 -0.80524713 0.56826013 -0.16928513 -0.80524713 0.56826013 
		-0.16928513 0.86623961 0.047779579 0.49733889 0.86623961 0.047779579 0.49733889 
		0.86623961 0.047779579 0.49733889 0.86623961 0.047779579 0.49733889 0.054758459 
		0.26781335 0.96191347 0.054758459 0.26781335 0.96191347 0.054758459 0.26781335 
		0.96191347 0.054758459 0.26781335 0.96191347 0.47585058 0.088273033 -0.87508518 
		0.47585058 0.088273033 -0.87508518 0.47585058 0.088273033 -0.87508518 0.47585058 
		0.088273033 -0.87508518 0.80102295 -0.33095184 0.49883172 0.80102295 -0.33095184 
		0.49883172 0.80102295 -0.33095184 0.49883172 0.80102295 -0.33095184 0.49883172 
		-0.58574617 0.61223429 -0.53110313 -0.58574617 0.61223429 -0.53110313 -0.58574617 
		0.61223429 -0.53110313 -0.58574617 0.61223429 -0.53110313 -1.5566445e-009 
		0.97882146 0.20471582 -1.5566445e-009 0.97882146 0.20471582 -1.5566445e-009 
		0.97882146 0.20471582 -1.5566445e-009 0.97882146 0.20471582 -9.8329531e-009 
		0.94739616 0.32006326 -9.8329531e-009 0.94739616 0.32006326 -9.8329531e-009 
		0.94739616 0.32006326 -9.8329531e-009 0.94739616 0.32006326 1.2529092e-008 
		0.56939501 0.82206404;
	setAttr ".n[4482:4647]" -type "float3"  1.2529092e-008 0.56939501 0.82206404 
		1.2529092e-008 0.56939501 0.82206404 1.2529092e-008 0.56939501 0.82206404 
		5.188846e-008 0.54339737 0.83947563 5.188846e-008 0.54339737 0.83947563 5.188846e-008 
		0.54339737 0.83947563 5.188846e-008 0.54339737 0.83947563 4.4852246e-008 
		0.56386596 0.82586634 4.4852246e-008 0.56386596 0.82586634 4.4852246e-008 
		0.56386596 0.82586634 4.4852246e-008 0.56386596 0.82586634 -4.1391477e-008 
		0.93002927 0.36748537 -4.1391477e-008 0.93002927 0.36748537 -4.1391477e-008 
		0.93002927 0.36748537 -4.1391477e-008 0.93002927 0.36748537 -1.2196496e-007 
		0.37576696 0.92671418 -1.2196496e-007 0.37576696 0.92671418 -1.2196496e-007 
		0.37576696 0.92671418 -1.2196496e-007 0.37576696 0.92671418 -0.48880273 0.74783814 
		-0.44923264 -0.48880273 0.74783814 -0.44923264 -0.48880273 0.74783814 -0.44923264 
		-0.48880273 0.74783814 -0.44923264 0.20609215 0.48326048 0.85087329 0.20609215 
		0.48326048 0.85087329 0.20609215 0.48326048 0.85087329 0.20609215 0.48326048 
		0.85087329 0.62956232 0.46136692 -0.62513345 0.62956232 0.46136692 -0.62513345 
		0.62956232 0.46136692 -0.62513345 0.62956232 0.46136692 -0.62513345 0.64696699 
		-0.62319517 0.43938765 0.64696699 -0.62319517 0.43938765 0.64696699 -0.62319517 
		0.43938765 0.64696699 -0.62319517 0.43938765 0.83361018 -0.33770317 0.43709335 
		0.83361018 -0.33770317 0.43709335 0.83361018 -0.33770317 0.43709335 0.83361018 
		-0.33770317 0.43709335 0.73429114 -0.49658898 0.46283475 0.73429114 -0.49658898 
		0.46283475 0.73429114 -0.49658898 0.46283475 0.73429114 -0.49658898 0.46283475 
		0.94784999 -0.25425336 0.19218646 0.94784999 -0.25425336 0.19218646 0.94784999 
		-0.25425336 0.19218646 0.94784999 -0.25425336 0.19218646 0.71401155 -0.53557771 
		0.45093682 0.71401155 -0.53557771 0.45093682 0.71401155 -0.53557771 0.45093682 
		0.71401155 -0.53557771 0.45093682 0.60557991 -0.63174063 0.48391816 0.60557991 
		-0.63174063 0.48391816 0.60557991 -0.63174063 0.48391816 0.60557991 -0.63174063 
		0.48391816 0.96761739 -0.19960269 0.15451656 0.96761739 -0.19960269 0.15451656 
		0.96761739 -0.19960269 0.15451656 0.96761739 -0.19960269 0.15451656 0.99029714 
		0.13638055 0.026682286 0.99029714 0.13638055 0.026682286 0.99029714 0.13638055 
		0.026682286 0.99029714 0.13638055 0.026682286 0.99029714 0.13638055 0.026682286 
		0.98937297 0.081168085 -0.120635 0.98937297 0.081168085 -0.120635 0.98937297 
		0.081168085 -0.120635 0.98937297 0.081168085 -0.120635 0.83309841 0.54884815 
		-0.068649866 0.83309841 0.54884815 -0.068649866 0.83309841 0.54884815 -0.068649866 
		0.83309841 0.54884815 -0.068649866 -0.031900026 0.2455942 0.96884769 -0.031900026 
		0.2455942 0.96884769 -0.031900026 0.2455942 0.96884769 -0.031900026 0.2455942 
		0.96884769 -0.89476371 0.44309515 -0.055359278 -0.89476371 0.44309515 -0.055359278 
		-0.89476371 0.44309515 -0.055359278 -0.89476371 0.44309515 -0.055359278 -0.62638772 
		0.58499676 -0.51518655 -0.62638772 0.58499676 -0.51518655 -0.62638772 0.58499676 
		-0.51518655 -0.62638772 0.58499676 -0.51518655 0.48321438 0.076299399 -0.87217098 
		0.48321438 0.076299399 -0.87217098 0.48321438 0.076299399 -0.87217098 0.48321438 
		0.076299399 -0.87217098 0.88829082 -0.22985362 0.39762637 0.88829082 -0.22985362 
		0.39762637 0.88829082 -0.22985362 0.39762637 0.88829082 -0.22985362 0.39762637 
		0.94350183 0.0044733081 0.33133718 0.94350183 0.0044733081 0.33133718 0.94350183 
		0.0044733081 0.33133718 0.94350183 0.0044733081 0.33133718 0.99668074 -0.0021474706 
		0.081381239 0.99668074 -0.0021474706 0.081381239 0.99668074 -0.0021474706 
		0.081381239 0.99668074 -0.0021474706 0.081381239 0.87721062 0.087206818 0.47211912 
		0.87721062 0.087206818 0.47211912 0.87721062 0.087206818 0.47211912 0.87721062 
		0.087206818 0.47211912 0.2660518 0.58234054 -0.76817697 0.2660518 0.58234054 
		-0.76817697 0.2660518 0.58234054 -0.76817697 0.2660518 0.58234054 -0.76817697 
		0.14699486 0.96708316 -0.20770814 0.14699486 0.96708316 -0.20770814 0.14699486 
		0.96708316 -0.20770814 0.14699486 0.96708316 -0.20770814 -5.2540479e-009 
		0.9545238 0.29813486 -5.2540479e-009 0.9545238 0.29813486 -5.2540479e-009 
		0.9545238 0.29813486 0.14640038 0.97673303 0.15671499 0.14640038 0.97673303 
		0.15671499 0.14640038 0.97673303 0.15671499 0.82548606 -0.42555034 0.37078243 
		0.82548606 -0.42555034 0.37078243 0.82548606 -0.42555034 0.37078243 0.82548606 
		-0.42555034 0.37078243 0.66286069 -0.65656066 0.35992193 0.66286069 -0.65656066 
		0.35992193 0.66286069 -0.65656066 0.35992193 0.66286069 -0.65656066 0.35992193 
		0.57083678 0.7541613 0.32463217 0.57083678 0.7541613 0.32463217 0.57083678 
		0.7541613 0.32463217 0.57083678 0.7541613 0.32463217 -0.61210394 0.75110614 
		-0.24732226 -0.61210394 0.75110614 -0.24732226 -0.61210394 0.75110614 -0.24732226 
		-0.61210394 0.75110614 -0.24732226 0.28610155 -0.24415739 0.92657059 0.28610155 
		-0.24415739 0.92657059 0.28610155 -0.24415739 0.92657059 0.28610155 -0.24415739 
		0.92657059 -0.015867639 -0.96691078 0.25462079 -0.015867639 -0.96691078 0.25462079 
		-0.015867639 -0.96691078 0.25462079 -0.015867639 -0.96691078 0.25462079 0.14146082 
		-0.54881698 0.82388639 0.14146082 -0.54881698 0.82388639 0.14146082 -0.54881698 
		0.82388639 0.14146082 -0.54881698 0.82388639 0.8562274 -0.25566387 -0.44889936 
		0.8562274 -0.25566387 -0.44889936 0.8562274 -0.25566387 -0.44889936 0.8562274 
		-0.25566387 -0.44889936 0.69263732 0.71012521 0.12639527 0.69263732 0.71012521 
		0.12639527 0.69263732 0.71012521 0.12639527 0.69263732 0.71012521 0.12639527 
		0.38776422 -0.13928843 0.91117382 0.38776422 -0.13928843 0.91117382 0.38776422 
		-0.13928843 0.91117382 0.38776422 -0.13928843 0.91117382 0.73882109 0.66061157 
		-0.13317598 0.73882109 0.66061157 -0.13317598 0.73882109 0.66061157 -0.13317598 
		0.73882109 0.66061157 -0.13317598 0.79752374 -0.2145775 -0.56383717 0.79752374 
		-0.2145775 -0.56383717 0.79752374 -0.2145775 -0.56383717 0.79752374 -0.2145775 
		-0.56383717;
	setAttr ".n[4648:4813]" -type "float3"  0.016257549 -0.99589694 0.08902286 
		0.016257549 -0.99589694 0.08902286 0.016257549 -0.99589694 0.08902286 0.016257549 
		-0.99589694 0.08902286 0.71221805 -0.64232367 -0.28313547 0.71221805 -0.64232367 
		-0.28313547 0.71221805 -0.64232367 -0.28313547 0.71221805 -0.64232367 -0.28313547 
		0.97408992 -0.0035030649 0.2261339 0.97408992 -0.0035030649 0.2261339 0.97408992 
		-0.0035030649 0.2261339 0.97408992 -0.0035030649 0.2261339 0.64316094 -0.20969649 
		0.73645872 0.64316094 -0.20969649 0.73645872 0.64316094 -0.20969649 0.73645872 
		0.64316094 -0.20969649 0.73645872 -7.4830853e-009 -0.97188717 -0.23544699 
		-7.4830853e-009 -0.97188717 -0.23544699 -7.4830853e-009 -0.97188717 -0.23544699 
		-7.4830853e-009 -0.97188717 -0.23544699 2.8249758e-007 -0.59217346 -0.80581051 
		2.8249758e-007 -0.59217346 -0.80581051 2.8249758e-007 -0.59217346 -0.80581051 
		2.8249758e-007 -0.59217346 -0.80581051 -1.6379113e-007 -0.90318978 -0.42924142 
		-1.6379113e-007 -0.90318978 -0.42924142 -1.6379113e-007 -0.90318978 -0.42924142 
		-1.6379113e-007 -0.90318978 -0.42924142 -4.5714824e-008 -0.98966396 -0.14340599 
		-4.5714824e-008 -0.98966396 -0.14340599 -4.5714824e-008 -0.98966396 -0.14340599 
		-4.5714824e-008 -0.98966396 -0.14340599 0.9124257 -0.25260058 0.32198185 
		0.9124257 -0.25260058 0.32198185 0.9124257 -0.25260058 0.32198185 0.9124257 
		-0.25260058 0.32198185 0.90382409 0.21466269 0.37016478 0.90382409 0.21466269 
		0.37016478 0.90382409 0.21466269 0.37016478 0.90382409 0.21466269 0.37016478 
		0.80409878 0.22477724 0.55036384 0.80409878 0.22477724 0.55036384 0.80409878 
		0.22477724 0.55036384 0.80409878 0.22477724 0.55036384 0.96136725 -0.012484084 
		0.27498573 0.96136725 -0.012484084 0.27498573 0.96136725 -0.012484084 0.27498573 
		0.96136725 -0.012484084 0.27498573 0.96136725 -0.012484084 0.27498573 0.96136725 
		-0.012484084 0.27498573 0.97555834 -0.14910322 0.16141307 0.97555834 -0.14910322 
		0.16141307 0.97555834 -0.14910322 0.16141307 0.97555834 -0.14910322 0.16141307 
		0.94935107 -0.1766101 0.25988728 0.94935107 -0.1766101 0.25988728 0.94935107 
		-0.1766101 0.25988728 0.94935107 -0.1766101 0.25988728 0.87705934 -0.42591268 
		0.22218324 0.87705934 -0.42591268 0.22218324 0.87705934 -0.42591268 0.22218324 
		0.87705934 -0.42591268 0.22218324 0.93485802 -0.20672943 0.28862324 0.93485802 
		-0.20672943 0.28862324 0.93485802 -0.20672943 0.28862324 0.93485802 -0.20672943 
		0.28862324 0.95466673 -0.039507315 0.29504332 0.95466673 -0.039507315 0.29504332 
		0.95466673 -0.039507315 0.29504332 0.95466673 -0.039507315 0.29504332 0.94801134 
		-0.15185927 0.27966639 0.94801134 -0.15185927 0.27966639 0.94801134 -0.15185927 
		0.27966639 0.94801134 -0.15185927 0.27966639 0.85644943 0.31596661 0.40823948 
		0.85644943 0.31596661 0.40823948 0.85644943 0.31596661 0.40823948 0.85644943 
		0.31596661 0.40823948 0.85165793 0.29073754 0.43606254 0.85165793 0.29073754 
		0.43606254 0.85165793 0.29073754 0.43606254 0.85165793 0.29073754 0.43606254 
		0.85165793 0.29073754 0.43606254 0.5107978 0.11372224 0.85214603 0.5107978 
		0.11372224 0.85214603 0.5107978 0.11372224 0.85214603 0.5107978 0.11372224 
		0.85214603 0.66569161 0.29420289 0.68578374 0.66569161 0.29420289 0.68578374 
		0.66569161 0.29420289 0.68578374 0.66569161 0.29420289 0.68578374 0.49209744 
		0.24844427 0.83433539 0.49209744 0.24844427 0.83433539 0.49209744 0.24844427 
		0.83433539 0.49209744 0.24844427 0.83433539 0.28448656 0.93172538 0.22573261 
		0.28448656 0.93172538 0.22573261 0.28448656 0.93172538 0.22573261 0.28448656 
		0.93172538 0.22573261 0.8628177 -0.12270057 0.49039802 0.8628177 -0.12270057 
		0.49039802 0.8628177 -0.12270057 0.49039802 0.8628177 -0.12270057 0.49039802 
		0.28074056 -0.42166951 0.86219466 0.28074056 -0.42166951 0.86219466 0.28074056 
		-0.42166951 0.86219466 0.28074056 -0.42166951 0.86219466 -0.62687331 0.27392948 
		0.72937816 -0.62687331 0.27392948 0.72937816 -0.62687331 0.27392948 0.72937816 
		-0.62687331 0.27392948 0.72937816 -1.786142e-007 0.51239955 0.85874712 -1.786142e-007 
		0.51239955 0.85874712 -1.786142e-007 0.51239955 0.85874712 -1.786142e-007 
		0.51239955 0.85874712 -7.5921911e-008 -0.24302219 0.97002071 -7.5921911e-008 
		-0.24302219 0.97002071 -7.5921911e-008 -0.24302219 0.97002071 -7.5921911e-008 
		-0.24302219 0.97002071 -3.2850526e-008 -0.8661437 0.49979508 -3.2850526e-008 
		-0.8661437 0.49979508 -3.2850526e-008 -0.8661437 0.49979508 -3.2850526e-008 
		-0.8661437 0.49979508 -8.337115e-009 -0.98475629 0.17393975 -8.337115e-009 
		-0.98475629 0.17393975 -8.337115e-009 -0.98475629 0.17393975 -8.337115e-009 
		-0.98475629 0.17393975 3.0154752e-009 -0.99739957 -0.072069675 3.0154752e-009 
		-0.99739957 -0.072069675 3.0154752e-009 -0.99739957 -0.072069675 3.0154752e-009 
		-0.99739957 -0.072069675 9.0602825e-008 -0.94659936 0.32241225 9.0602825e-008 
		-0.94659936 0.32241225 9.0602825e-008 -0.94659936 0.32241225 9.0602825e-008 
		-0.94659936 0.32241225 -5.1789954e-007 -0.13891122 0.99030483 -5.1789954e-007 
		-0.13891122 0.99030483 -5.1789954e-007 -0.13891122 0.99030483 -5.1789954e-007 
		-0.13891122 0.99030483 -1.4795292e-007 0.65002906 0.75990933 -1.4795292e-007 
		0.65002906 0.75990933 -1.4795292e-007 0.65002906 0.75990933 -1.4795292e-007 
		0.65002906 0.75990933 -5.0425239e-008 0.94944227 -0.31394169 -5.0425239e-008 
		0.94944227 -0.31394169 -5.0425239e-008 0.94944227 -0.31394169 -5.0425239e-008 
		0.94944227 -0.31394169 2.8659617e-008 0.99697441 0.077730119 2.8659617e-008 
		0.99697441 0.077730119 2.8659617e-008 0.99697441 0.077730119 2.8659617e-008 
		0.99697441 0.077730119 1.2099647e-008 0.99289393 0.11900278 1.2099647e-008 
		0.99289393 0.11900278 1.2099647e-008 0.99289393 0.11900278 1.2099647e-008 
		0.99289393 0.11900278 0.03066548 0.98321837 0.17983659 0.03066548 0.98321837 
		0.17983659 0.03066548 0.98321837 0.17983659 0.03066548 0.98321837 0.17983659 
		-0.73096281 0.3688446 -0.57414901 -0.73096281 0.3688446 -0.57414901 -0.73096281 
		0.3688446 -0.57414901 -0.73096281 0.3688446 -0.57414901 -0.94231445 -0.3212305 
		0.094098471 -0.94231445 -0.3212305 0.094098471 -0.94231445 -0.3212305 0.094098471;
	setAttr ".n[4814:4979]" -type "float3"  -0.94231445 -0.3212305 0.094098471 
		-0.94397074 -0.041160375 0.32745233 -0.94397074 -0.041160375 0.32745233 -0.94397074 
		-0.041160375 0.32745233 -0.94397074 -0.041160375 0.32745233 -0.84053558 0.54098302 
		-0.028935911 -0.84053558 0.54098302 -0.028935911 -0.84053558 0.54098302 -0.028935911 
		-0.84053558 0.54098302 -0.028935911 -0.87641019 0.31317878 -0.36581993 -0.87641019 
		0.31317878 -0.36581993 -0.87641019 0.31317878 -0.36581993 -0.87641019 0.31317878 
		-0.36581993 -0.86518466 0.36566871 -0.34313533 -0.86518466 0.36566871 -0.34313533 
		-0.86518466 0.36566871 -0.34313533 -0.86518466 0.36566871 -0.34313533 -0.91539419 
		0.33810151 -0.21849678 -0.91539419 0.33810151 -0.21849678 -0.91539419 0.33810151 
		-0.21849678 -0.91539419 0.33810151 -0.21849678 -0.8178336 -0.37175798 -0.43925413 
		-0.8178336 -0.37175798 -0.43925413 -0.8178336 -0.37175798 -0.43925413 -0.8178336 
		-0.37175798 -0.43925413 -0.77381533 0.035844095 -0.63239628 -0.77381533 0.035844095 
		-0.63239628 -0.77381533 0.035844095 -0.63239628 -0.77381533 0.035844095 -0.63239628 
		-0.90836066 -0.23783877 -0.34396741 -0.90836066 -0.23783877 -0.34396741 -0.90836066 
		-0.23783877 -0.34396741 -0.90836066 -0.23783877 -0.34396741 -5.9863083e-008 
		-0.19794771 -0.98021257 -5.9863083e-008 -0.19794771 -0.98021257 -5.9863083e-008 
		-0.19794771 -0.98021257 -5.9863083e-008 -0.19794771 -0.98021257 -0.027006319 
		-0.98257715 -0.18388252 -0.027006319 -0.98257715 -0.18388252 -0.027006319 
		-0.98257715 -0.18388252 -0.027006319 -0.98257715 -0.18388252 -0.65890551 
		-0.052655391 -0.75038052 -0.65890551 -0.052655391 -0.75038052 -0.65890551 
		-0.052655391 -0.75038052 -0.65890551 -0.052655391 -0.75038052 0.94981885 
		-0.13436046 0.28247395 0.94981885 -0.13436046 0.28247395 0.94981885 -0.13436046 
		0.28247395 0.94981885 -0.13436046 0.28247395 0.95002878 -0.19511448 0.24367125 
		0.95002878 -0.19511448 0.24367125 0.95002878 -0.19511448 0.24367125 0.95002878 
		-0.19511448 0.24367125 0.8763867 -0.24840489 0.41260311 0.8763867 -0.24840489 
		0.41260311 0.8763867 -0.24840489 0.41260311 0.8763867 -0.24840489 0.41260311 
		0.94642043 -0.15257612 0.28462055 0.94642043 -0.15257612 0.28462055 0.94642043 
		-0.15257612 0.28462055 0.94642043 -0.15257612 0.28462055 0.73748446 -0.10705519 
		0.66682523 0.73748446 -0.10705519 0.66682523 0.73748446 -0.10705519 0.66682523 
		0.73748446 -0.10705519 0.66682523 0.44231936 0.39478561 -0.80529368 0.44231936 
		0.39478561 -0.80529368 0.44231936 0.39478561 -0.80529368 0.44231936 0.39478561 
		-0.80529368 0.98290396 0.16851982 -0.074168541 0.98290396 0.16851982 -0.074168541 
		0.98290396 0.16851982 -0.074168541 0.98290396 0.16851982 -0.074168541 0.00066611037 
		-0.99686694 -0.079093672 0.00066611037 -0.99686694 -0.079093672 0.00066611037 
		-0.99686694 -0.079093672 0.00066611037 -0.99686694 -0.079093672 -0.55297971 
		-0.78390741 -0.28231657 -0.55297971 -0.78390741 -0.28231657 -0.55297971 -0.78390741 
		-0.28231657 -0.55297971 -0.78390741 -0.28231657 -0.18668814 -0.88215041 -0.43238667 
		-0.18668814 -0.88215041 -0.43238667 -0.18668814 -0.88215041 -0.43238667 -0.18668814 
		-0.88215041 -0.43238667 0.021449329 -0.077625372 -0.99675184 0.021449329 
		-0.077625372 -0.99675184 0.021449329 -0.077625372 -0.99675184 -0.14355637 
		-0.44506121 -0.88391858 -0.14355637 -0.44506121 -0.88391858 -0.14355637 -0.44506121 
		-0.88391858 -0.14355637 -0.44506121 -0.88391858 -0.36960351 -0.6314792 -0.68163568 
		-0.36960351 -0.6314792 -0.68163568 -0.36960351 -0.6314792 -0.68163568 -0.36960351 
		-0.6314792 -0.68163568 -0.17519952 -0.96465051 0.19686157 -0.17519952 -0.96465051 
		0.19686157 -0.17519952 -0.96465051 0.19686157 -0.17519952 -0.96465051 0.19686157 
		-0.74178952 -0.67037171 0.01870944 -0.74178952 -0.67037171 0.01870944 -0.74178952 
		-0.67037171 0.01870944 -0.74178952 -0.67037171 0.01870944 0.25044641 -0.96646827 
		-0.056707032 0.25044641 -0.96646827 -0.056707032 0.25044641 -0.96646827 -0.056707032 
		0.25044641 -0.96646827 -0.056707032 0.38676643 -0.88990587 -0.24182488 0.38676643 
		-0.88990587 -0.24182488 0.38676643 -0.88990587 -0.24182488 0.38676643 -0.88990587 
		-0.24182488 0.55868268 -0.8209275 -0.11811727 0.55868268 -0.8209275 -0.11811727 
		0.55868268 -0.8209275 -0.11811727 0.55868268 -0.8209275 -0.11811727 0.5069406 
		-0.85486722 -0.11051361 0.5069406 -0.85486722 -0.11051361 0.5069406 -0.85486722 
		-0.11051361 0.5069406 -0.85486722 -0.11051361 -0.33322453 -0.84180796 -0.42464194 
		-0.33322453 -0.84180796 -0.42464194 -0.33322453 -0.84180796 -0.42464194 -0.33322453 
		-0.84180796 -0.42464194 0.86821765 -0.1770267 0.46352965 0.86821765 -0.1770267 
		0.46352965 0.86821765 -0.1770267 0.46352965 0.86821765 -0.1770267 0.46352965 
		0.36448815 -0.92997903 0.047826875 0.36448815 -0.92997903 0.047826875 0.36448815 
		-0.92997903 0.047826875 0.36448815 -0.92997903 0.047826875 0.37223297 -0.89801687 
		0.23453872 0.37223297 -0.89801687 0.23453872 0.37223297 -0.89801687 0.23453872 
		0.37223297 -0.89801687 0.23453872 -0.15165839 -0.92809987 0.34004468 -0.15165839 
		-0.92809987 0.34004468 -0.15165839 -0.92809987 0.34004468 -0.15165839 -0.92809987 
		0.34004468 -0.40196377 0.85529745 0.32694256 -0.40196377 0.85529745 0.32694256 
		-0.40196377 0.85529745 0.32694256 -0.40196377 0.85529745 0.32694256 -0.67348146 
		0.2330025 0.70152158 -0.67348146 0.2330025 0.70152158 -0.67348146 0.2330025 
		0.70152158 -0.67348146 0.2330025 0.70152158 -0.3111394 0.94396693 0.11008519 
		-0.3111394 0.94396693 0.11008519 -0.3111394 0.94396693 0.11008519 -0.3111394 
		0.94396693 0.11008519 -0.069487832 0.75636762 -0.65044558 -0.069487832 0.75636762 
		-0.65044558 -0.069487832 0.75636762 -0.65044558 -0.069487832 0.75636762 -0.65044558 
		-0.18843384 -0.80822939 -0.55790496 -0.18843384 -0.80822939 -0.55790496 -0.18843384 
		-0.80822939 -0.55790496 -0.18843384 -0.80822939 -0.55790496 -0.061246853 
		0.47485086 -0.87793249 -0.061246853 0.47485086 -0.87793249 -0.061246853 0.47485086 
		-0.87793249 -0.061246853 0.47485086 -0.87793249 -0.26348037 0.91445309 0.30717048 
		-0.26348037 0.91445309 0.30717048;
	setAttr ".n[4980:5145]" -type "float3"  -0.26348037 0.91445309 0.30717048 
		-0.26348037 0.91445309 0.30717048 -0.43440142 0.060343724 0.89869577 -0.43440142 
		0.060343724 0.89869577 -0.43440142 0.060343724 0.89869577 -0.43440142 0.060343724 
		0.89869577 -0.257541 0.93890917 0.22830272 -0.257541 0.93890917 0.22830272 
		-0.257541 0.93890917 0.22830272 -0.257541 0.93890917 0.22830272 0.15641247 
		0.79533029 -0.58564913 0.15641247 0.79533029 -0.58564913 0.15641247 0.79533029 
		-0.58564913 0.15641247 0.79533029 -0.58564913 -0.81749511 -0.10691525 0.56592488 
		-0.81749511 -0.10691525 0.56592488 -0.81749511 -0.10691525 0.56592488 -0.81749511 
		-0.10691525 0.56592488 0.15615599 -0.2199893 -0.96292263 0.15615599 -0.2199893 
		-0.96292263 0.15615599 -0.2199893 -0.96292263 0.15615599 -0.2199893 -0.96292263 
		0.17297989 0.68760765 -0.70517635 0.17297989 0.68760765 -0.70517635 0.17297989 
		0.68760765 -0.70517635 0.17297989 0.68760765 -0.70517635 0.22489469 -0.91937387 
		-0.32276011 0.22489469 -0.91937387 -0.32276011 0.22489469 -0.91937387 -0.32276011 
		0.22489469 -0.91937387 -0.32276011 0.84194762 -0.068568088 0.53518474 0.84194762 
		-0.068568088 0.53518474 0.84194762 -0.068568088 0.53518474 0.84194762 -0.068568088 
		0.53518474 0.060814057 0.88992822 0.45202804 0.060814057 0.88992822 0.45202804 
		0.060814057 0.88992822 0.45202804 0.060814057 0.88992822 0.45202804 0.89983749 
		-0.3997539 0.17461182 0.89983749 -0.3997539 0.17461182 0.89983749 -0.3997539 
		0.17461182 0.89983749 -0.3997539 0.17461182 -0.43236923 -0.79272932 0.42969415 
		-0.43236923 -0.79272932 0.42969415 -0.43236923 -0.79272932 0.42969415 -0.43236923 
		-0.79272932 0.42969415 -0.43236923 -0.79272932 0.42969415 0.34107843 0.81151217 
		0.47446123 0.34107843 0.81151217 0.47446123 0.34107843 0.81151217 0.47446123 
		0.34107843 0.81151217 0.47446123 0.34107843 0.81151217 0.47446123 0.56373453 
		0.68404108 -0.46291596 0.56373453 0.68404108 -0.46291596 0.56373453 0.68404108 
		-0.46291596 0.56373453 0.68404108 -0.46291596 0.94055325 0.20896213 -0.26775831 
		0.94055325 0.20896213 -0.26775831 0.94055325 0.20896213 -0.26775831 0.94055325 
		0.20896213 -0.26775831 0.5239076 -0.32579231 -0.78700709 0.5239076 -0.32579231 
		-0.78700709 0.5239076 -0.32579231 -0.78700709 0.5239076 -0.32579231 -0.78700709 
		-0.18422687 0.0650222 0.98073065 -0.18422687 0.0650222 0.98073065 -0.18422687 
		0.0650222 0.98073065 -0.18422687 0.0650222 0.98073065 0.90038228 -0.35430291 
		0.25254938 0.90038228 -0.35430291 0.25254938 0.90038228 -0.35430291 0.25254938 
		0.90038228 -0.35430291 0.25254938 0.90038228 -0.35430291 0.25254938 0.81177229 
		-0.27920443 0.51290411 0.81177229 -0.27920443 0.51290411 0.81177229 -0.27920443 
		0.51290411 0.81177229 -0.27920443 0.51290411 0.81177229 -0.27920443 0.51290411 
		0.10359234 -0.70489824 0.70170301 0.10359234 -0.70489824 0.70170301 0.10359234 
		-0.70489824 0.70170301 0.10359234 -0.70489824 0.70170301 0.3575502 -0.58325714 
		0.72936201 0.3575502 -0.58325714 0.72936201 0.3575502 -0.58325714 0.72936201 
		0.3575502 -0.58325714 0.72936201 0.61403942 -0.76738608 0.18459195 0.61403942 
		-0.76738608 0.18459195 0.61403942 -0.76738608 0.18459195 0.61403942 -0.76738608 
		0.18459195 0.61403942 -0.76738608 0.18459195 -0.57382375 0.35465941 0.73820257 
		-0.57382375 0.35465941 0.73820257 -0.57382375 0.35465941 0.73820257 -0.57382375 
		0.35465941 0.73820257 -0.85908401 -0.01427021 0.51163566 -0.85908401 -0.01427021 
		0.51163566 -0.85908401 -0.01427021 0.51163566 -0.85908401 -0.01427021 0.51163566 
		-0.48919195 0.37570235 0.787108 -0.48919195 0.37570235 0.787108 -0.48919195 
		0.37570235 0.787108 -0.48919195 0.37570235 0.787108 -0.070448928 -0.9666872 
		-0.24607486 -0.070448928 -0.9666872 -0.24607486 -0.070448928 -0.9666872 -0.24607486 
		-0.070448928 -0.9666872 -0.24607486 -0.63243878 0.49854502 0.59285253 -0.63243878 
		0.49854502 0.59285253 -0.63243878 0.49854502 0.59285253 0.28261599 0.56117487 
		0.77795309 0.28261599 0.56117487 0.77795309 0.28261599 0.56117487 0.77795309 
		0.28261599 0.56117487 0.77795309 0.72487134 0.52709872 -0.4435409 0.72487134 
		0.52709872 -0.4435409 0.72487134 0.52709872 -0.4435409 0.72487134 0.52709872 
		-0.4435409 0.72487134 0.52709872 -0.4435409 -0.21630976 0.94091445 0.26055729 
		-0.21630976 0.94091445 0.26055729 -0.21630976 0.94091445 0.26055729 -0.21630976 
		0.94091445 0.26055729 -0.38429993 0.59973812 0.70187443 -0.38429993 0.59973812 
		0.70187443 -0.38429993 0.59973812 0.70187443 -0.38429993 0.59973812 0.70187443 
		-0.39761704 -0.020792417 0.91731584 -0.39761704 -0.020792417 0.91731584 -0.39761704 
		-0.020792417 0.91731584 -0.39761704 -0.020792417 0.91731584 -0.13330626 -0.81556511 
		0.56310123 -0.13330626 -0.81556511 0.56310123 -0.13330626 -0.81556511 0.56310123 
		-0.13330626 -0.81556511 0.56310123 0.27421436 -0.94370234 -0.18501991 0.27421436 
		-0.94370234 -0.18501991 0.27421436 -0.94370234 -0.18501991 0.27421436 -0.94370234 
		-0.18501991 0.45831168 -0.66635752 -0.588148 0.45831168 -0.66635752 -0.588148 
		0.45831168 -0.66635752 -0.588148 0.45831168 -0.66635752 -0.588148 0.47562632 
		0.25202304 -0.84277159 0.47562632 0.25202304 -0.84277159 0.47562632 0.25202304 
		-0.84277159 0.47562632 0.25202304 -0.84277159 0.29217088 0.71592963 -0.63409853 
		0.29217088 0.71592963 -0.63409853 0.29217088 0.71592963 -0.63409853 0.29217088 
		0.71592963 -0.63409853 -0.097192191 0.98567778 0.13781518 -0.097192191 0.98567778 
		0.13781518 -0.097192191 0.98567778 0.13781518 -0.097192191 0.98567778 0.13781518 
		-0.40237167 0.1377133 0.90505916 -0.40237167 0.1377133 0.90505916 -0.40237167 
		0.1377133 0.90505916 -0.40237167 0.1377133 0.90505916 -0.22222431 -0.64546287 
		0.73074895 -0.22222431 -0.64546287 0.73074895 -0.22222431 -0.64546287 0.73074895 
		-0.22222431 -0.64546287 0.73074895 0.26315132 -0.93747962 -0.22777918 0.26315132 
		-0.93747962 -0.22777918 0.26315132 -0.93747962 -0.22777918;
	setAttr ".n[5146:5311]" -type "float3"  0.26315132 -0.93747962 -0.22777918 
		0.53050619 0.02631831 -0.8472724 0.53050619 0.02631831 -0.8472724 0.53050619 
		0.02631831 -0.8472724 0.53050619 0.02631831 -0.8472724 0.41826478 0.50954312 
		-0.75194436 0.41826478 0.50954312 -0.75194436 0.41826478 0.50954312 -0.75194436 
		0.41826478 0.50954312 -0.75194436 0.032737244 0.93015701 0.36569956 0.032737244 
		0.93015701 0.36569956 0.032737244 0.93015701 0.36569956 0.032737244 0.93015701 
		0.36569956 -0.17811681 0.3913554 0.9028374 -0.17811681 0.3913554 0.9028374 
		-0.17811681 0.3913554 0.9028374 -0.17811681 0.3913554 0.9028374 -0.24049887 
		-0.7432493 0.62429219 -0.24049887 -0.7432493 0.62429219 -0.24049887 -0.7432493 
		0.62429219 -0.24049887 -0.7432493 0.62429219 0.15475714 -0.8527984 -0.49878359 
		0.15475714 -0.8527984 -0.49878359 0.15475714 -0.8527984 -0.49878359 0.15475714 
		-0.8527984 -0.49878359 0.29538265 -0.26443914 -0.91805285 0.29538265 -0.26443914 
		-0.91805285 0.29538265 -0.26443914 -0.91805285 0.29538265 -0.26443914 -0.91805285 
		0.23774552 0.80726552 -0.54018462 0.23774552 0.80726552 -0.54018462 0.23774552 
		0.80726552 -0.54018462 0.23774552 0.80726552 -0.54018462 0.94623441 0.036333755 
		-0.32143465 0.94623441 0.036333755 -0.32143465 0.94623441 0.036333755 -0.32143465 
		0.94623441 0.036333755 -0.32143465 0.2309612 0.11923604 0.96562916 0.2309612 
		0.11923604 0.96562916 0.2309612 0.11923604 0.96562916 0.2309612 0.11923604 
		0.96562916 0.2309612 0.11923604 0.96562916 -0.46201605 -0.49334997 0.73698503 
		-0.46201605 -0.49334997 0.73698503 -0.46201605 -0.49334997 0.73698503 -0.46201605 
		-0.49334997 0.73698503 0.40050122 -0.76194692 -0.50895542 0.40050122 -0.76194692 
		-0.50895542 0.40050122 -0.76194692 -0.50895542 0.40050122 -0.76194692 -0.50895542 
		0.71492428 0.53052396 -0.45544225 0.71492428 0.53052396 -0.45544225 0.71492428 
		0.53052396 -0.45544225 0.71492428 0.53052396 -0.45544225 0.015636828 0.49530414 
		0.86857891 0.015636828 0.49530414 0.86857891 0.015636828 0.49530414 0.86857891 
		0.015636828 0.49530414 0.86857891 -0.54253137 -0.38469476 0.74677283 -0.54253137 
		-0.38469476 0.74677283 -0.54253137 -0.38469476 0.74677283 -0.54253137 -0.38469476 
		0.74677283 -0.52396107 -0.84207231 -0.12798053 -0.52396107 -0.84207231 -0.12798053 
		-0.52396107 -0.84207231 -0.12798053 -0.52396107 -0.84207231 -0.12798053 0.074827008 
		-0.53735536 -0.84002984 0.074827008 -0.53735536 -0.84002984 0.074827008 -0.53735536 
		-0.84002984 0.074827008 -0.53735536 -0.84002984 0.35595816 0.80968624 -0.4665854 
		0.35595816 0.80968624 -0.4665854 0.35595816 0.80968624 -0.4665854 0.35595816 
		0.80968624 -0.4665854 -0.11829738 0.73613292 0.66641885 -0.11829738 0.73613292 
		0.66641885 -0.11829738 0.73613292 0.66641885 -0.11829738 0.73613292 0.66641885 
		-0.46406847 -0.4524512 0.76153028 -0.46406847 -0.4524512 0.76153028 -0.46406847 
		-0.4524512 0.76153028 -0.46406847 -0.4524512 0.76153028 -0.51033902 -0.85965496 
		0.023397638 -0.51033902 -0.85965496 0.023397638 -0.51033902 -0.85965496 0.023397638 
		-0.51033902 -0.85965496 0.023397638 -0.032388594 -0.29480752 -0.95500761 
		-0.032388594 -0.29480752 -0.95500761 -0.032388594 -0.29480752 -0.95500761 
		-0.032388594 -0.29480752 -0.95500761 0.071202196 0.97293723 0.21982579 0.071202196 
		0.97293723 0.21982579 0.071202196 0.97293723 0.21982579 0.071202196 0.97293723 
		0.21982579 -0.36933744 0.089244708 0.92500013 -0.36933744 0.089244708 0.92500013 
		-0.36933744 0.089244708 0.92500013 -0.36933744 0.089244708 0.92500013 -0.38947681 
		-0.60532558 0.69418204 -0.38947681 -0.60532558 0.69418204 -0.38947681 -0.60532558 
		0.69418204 -0.38947681 -0.60532558 0.69418204 0.0023141287 -0.92585468 -0.37787268 
		0.0023141287 -0.92585468 -0.37787268 0.0023141287 -0.92585468 -0.37787268 
		0.0023141287 -0.92585468 -0.37787268 0.38571379 0.015009867 -0.92249638 0.38571379 
		0.015009867 -0.92249638 0.38571379 0.015009867 -0.92249638 0.38571379 0.015009867 
		-0.92249638 0.40536451 0.4550266 -0.79286218 0.40536451 0.4550266 -0.79286218 
		0.40536451 0.4550266 -0.79286218 0.40536451 0.4550266 -0.79286218 0.066348113 
		0.92779636 0.36714011 0.066348113 0.92779636 0.36714011 0.066348113 0.92779636 
		0.36714011 0.066348113 0.92779636 0.36714011 -0.25318286 0.50163043 0.82720333 
		-0.25318286 0.50163043 0.82720333 -0.25318286 0.50163043 0.82720333 -0.25318286 
		0.50163043 0.82720333 -0.42075229 -0.014677537 0.90705681 -0.42075229 -0.014677537 
		0.90705681 -0.42075229 -0.014677537 0.90705681 -0.42075229 -0.014677537 0.90705681 
		-0.40431499 -0.80386937 0.43626073 -0.40431499 -0.80386937 0.43626073 -0.40431499 
		-0.80386937 0.43626073 -0.40431499 -0.80386937 0.43626073 -0.093749233 -0.94396651 
		-0.31644642 -0.093749233 -0.94396651 -0.31644642 -0.093749233 -0.94396651 
		-0.31644642 -0.093749233 -0.94396651 -0.31644642 0.18517867 -0.63297945 -0.75169528 
		0.18517867 -0.63297945 -0.75169528 0.18517867 -0.63297945 -0.75169528 0.18517867 
		-0.63297945 -0.75169528 0.45076528 0.20072331 -0.86978209 0.45076528 0.20072331 
		-0.86978209 0.45076528 0.20072331 -0.86978209 0.45076528 0.20072331 -0.86978209 
		0.43505657 0.70844197 -0.55572987 0.43505657 0.70844197 -0.55572987 0.43505657 
		0.70844197 -0.55572987 0.43505657 0.70844197 -0.55572987 0.10063454 0.91137707 
		0.39907956 0.10063454 0.91137707 0.39907956 0.10063454 0.91137707 0.39907956 
		0.10063454 0.91137707 0.39907956 -0.24586518 0.49980167 0.83051109 -0.24586518 
		0.49980167 0.83051109 -0.24586518 0.49980167 0.83051109 -0.24586518 0.49980167 
		0.83051109 -0.4224824 -0.71383226 0.55852675 -0.4224824 -0.71383226 0.55852675 
		-0.4224824 -0.71383226 0.55852675 -0.4224824 -0.71383226 0.55852675 -0.031396393 
		-0.84474379 -0.53424919 -0.031396393 -0.84474379 -0.53424919 -0.031396393 
		-0.84474379 -0.53424919 -0.031396393 -0.84474379 -0.53424919 0.26830143 -0.31213659 
		-0.91136444 0.26830143 -0.31213659 -0.91136444 0.26830143 -0.31213659 -0.91136444 
		0.26830143 -0.31213659 -0.91136444;
	setAttr ".n[5312:5477]" -type "float3"  0.41059759 0.77117968 -0.48650959 
		0.41059759 0.77117968 -0.48650959 0.41059759 0.77117968 -0.48650959 0.41059759 
		0.77117968 -0.48650959 0.12418977 0.96056306 0.24878803 0.12418977 0.96056306 
		0.24878803 0.12418977 0.96056306 0.24878803 0.12418977 0.96056306 0.24878803 
		-0.27262443 0.14792247 0.95068127 -0.27262443 0.14792247 0.95068127 -0.27262443 
		0.14792247 0.95068127 -0.27262443 0.14792247 0.95068127 -0.34110534 -0.6250183 
		0.70213902 -0.34110534 -0.6250183 0.70213902 -0.34110534 -0.6250183 0.70213902 
		-0.34110534 -0.6250183 0.70213902 0.054522548 -0.93504655 -0.3503074 0.054522548 
		-0.93504655 -0.3503074 0.054522548 -0.93504655 -0.3503074 0.054522548 -0.93504655 
		-0.3503074 0.4341161 0.011494309 -0.9007836 0.4341161 0.011494309 -0.9007836 
		0.4341161 0.011494309 -0.9007836 0.4341161 0.011494309 -0.9007836 0.47570416 
		0.48822746 -0.73166901 0.47570416 0.48822746 -0.73166901 0.47570416 0.48822746 
		-0.73166901 0.47570416 0.48822746 -0.73166901 0.21025139 0.87308228 0.43991095 
		0.21025139 0.87308228 0.43991095 0.21025139 0.87308228 0.43991095 0.21025139 
		0.87308228 0.43991095 -0.12315506 0.54062766 0.83219862 -0.12315506 0.54062766 
		0.83219862 -0.12315506 0.54062766 0.83219862 -0.12315506 0.54062766 0.83219862 
		-0.3964867 -0.046926033 0.91684037 -0.3964867 -0.046926033 0.91684037 -0.3964867 
		-0.046926033 0.91684037 -0.3964867 -0.046926033 0.91684037 -0.3856405 -0.79914969 
		0.46113026 -0.3856405 -0.79914969 0.46113026 -0.3856405 -0.79914969 0.46113026 
		-0.3856405 -0.79914969 0.46113026 -0.017465029 -0.95385993 -0.29974353 -0.017465029 
		-0.95385993 -0.29974353 -0.017465029 -0.95385993 -0.29974353 -0.017465029 
		-0.95385993 -0.29974353 0.24706888 -0.65345949 -0.71550524 0.24706888 -0.65345949 
		-0.71550524 0.24706888 -0.65345949 -0.71550524 0.24706888 -0.65345949 -0.71550524 
		0.52372622 0.2216782 -0.82253855 0.52372622 0.2216782 -0.82253855 0.52372622 
		0.2216782 -0.82253855 0.52372622 0.2216782 -0.82253855 0.54616493 0.6840502 
		-0.48350719 0.54616493 0.6840502 -0.48350719 0.54616493 0.6840502 -0.48350719 
		0.54616493 0.6840502 -0.48350719 0.1626633 0.88690108 0.43237388 0.1626633 
		0.88690108 0.43237388 0.1626633 0.88690108 0.43237388 0.1626633 0.88690108 
		0.43237388 -0.14984998 0.43062979 0.89000165 -0.14984998 0.43062979 0.89000165 
		-0.14984998 0.43062979 0.89000165 -0.14984998 0.43062979 0.89000165 -0.39280358 
		-0.72458667 0.56628567 -0.39280358 -0.72458667 0.56628567 -0.39280358 -0.72458667 
		0.56628567 -0.39280358 -0.72458667 0.56628567 0.038469061 -0.85936022 -0.50992167 
		0.038469061 -0.85936022 -0.50992167 0.038469061 -0.85936022 -0.50992167 0.038469061 
		-0.85936022 -0.50992167 0.36023265 -0.30824882 -0.880463 0.36023265 -0.30824882 
		-0.880463 0.36023265 -0.30824882 -0.880463 0.36023265 -0.30824882 -0.880463 
		0.49407065 0.74662369 -0.44547415 0.49407065 0.74662369 -0.44547415 0.49407065 
		0.74662369 -0.44547415 0.49407065 0.74662369 -0.44547415 0.098386154 0.96622294 
		0.2381877 0.098386154 0.96622294 0.2381877 0.098386154 0.96622294 0.2381877 
		0.098386154 0.96622294 0.2381877 0.19815303 -0.4206956 0.88529688 0.19815303 
		-0.4206956 0.88529688 0.19815303 -0.4206956 0.88529688 0.19815303 -0.4206956 
		0.88529688 0.19815303 -0.4206956 0.88529688 0.26871046 -0.93763632 -0.22052857 
		0.26871046 -0.93763632 -0.22052857 0.26871046 -0.93763632 -0.22052857 0.26871046 
		-0.93763632 -0.22052857 0.68481189 0.20947754 -0.69796264 0.68481189 0.20947754 
		-0.69796264 0.68481189 0.20947754 -0.69796264 0.68481189 0.20947754 -0.69796264 
		0.68481189 0.20947754 -0.69796264 0.14167288 -0.016973043 0.98976803 0.14167288 
		-0.016973043 0.98976803 0.14167288 -0.016973043 0.98976803 0.14167288 -0.016973043 
		0.98976803 0.14167288 -0.016973043 0.98976803 0.29212996 -0.89335394 0.34143645 
		0.29212996 -0.89335394 0.34143645 0.29212996 -0.89335394 0.34143645 0.29212996 
		-0.89335394 0.34143645 0.29212996 -0.89335394 0.34143645 0.63636118 -0.418982 
		-0.64768708 0.63636118 -0.418982 -0.64768708 0.63636118 -0.418982 -0.64768708 
		0.63636118 -0.418982 -0.64768708 0.63636118 -0.418982 -0.64768708 0.45347571 
		0.89038414 -0.039697424 0.45347571 0.89038414 -0.039697424 0.45347571 0.89038414 
		-0.039697424 0.45347571 0.89038414 -0.039697424 0.45347571 0.89038414 -0.039697424 
		0.25905505 0.48081526 0.83767962 0.25905505 0.48081526 0.83767962 0.25905505 
		0.48081526 0.83767962 0.25905505 0.48081526 0.83767962 0.25905505 0.48081526 
		0.83767962 -0.22060952 -0.72434109 0.65319324 -0.22060952 -0.72434109 0.65319324 
		-0.22060952 -0.72434109 0.65319324 -0.22060952 -0.72434109 0.65319324 0.32124034 
		-0.70076549 -0.63697129 0.32124034 -0.70076549 -0.63697129 0.32124034 -0.70076549 
		-0.63697129 0.32124034 -0.70076549 -0.63697129 0.32124034 -0.70076549 -0.63697129 
		0.4048543 0.7387659 -0.53881156 0.4048543 0.7387659 -0.53881156 0.4048543 
		0.7387659 -0.53881156 0.4048543 0.7387659 -0.53881156 0.42870018 0.80718297 
		0.40579778 0.42870018 0.80718297 0.40579778 0.42870018 0.80718297 0.40579778 
		0.42870018 0.80718297 0.40579778 -0.47769913 -0.44265488 0.75885451 -0.47769913 
		-0.44265488 0.75885451 -0.47769913 -0.44265488 0.75885451 -0.47769913 -0.44265488 
		0.75885451 -0.30771023 -0.8446784 -0.43798727 -0.30771023 -0.8446784 -0.43798727 
		-0.30771023 -0.8446784 -0.43798727 -0.30771023 -0.8446784 -0.43798727 0.38885638 
		-0.01127175 -0.92122942 0.38885638 -0.01127175 -0.92122942 0.38885638 -0.01127175 
		-0.92122942 0.38885638 -0.01127175 -0.92122942 -0.39385584 -0.01407364 0.91906446 
		-0.39385584 -0.01407364 0.91906446 -0.39385584 -0.01407364 0.91906446 -0.39385584 
		-0.01407364 0.91906446 -0.52690941 -0.84907526 -0.03791666 -0.52690941 -0.84907526 
		-0.03791666 -0.52690941 -0.84907526 -0.03791666 -0.52690941 -0.84907526 -0.03791666 
		0.18681188 -0.42612994 -0.88516361 0.18681188 -0.42612994 -0.88516361;
	setAttr ".n[5478:5643]" -type "float3"  0.18681188 -0.42612994 -0.88516361 
		0.18681188 -0.42612994 -0.88516361 0.63259584 0.77441353 0.010303853 0.63259584 
		0.77441353 0.010303853 0.63259584 0.77441353 0.010303853 0.63259584 0.77441353 
		0.010303853 -0.12457604 0.56450605 0.81597406 -0.12457604 0.56450605 0.81597406 
		-0.12457604 0.56450605 0.81597406 -0.12457604 0.56450605 0.81597406 -0.6667316 
		-0.6976338 0.262252 -0.6667316 -0.6976338 0.262252 -0.6667316 -0.6976338 
		0.262252 -0.6667316 -0.6976338 0.262252 -0.021233771 -0.7714721 -0.63590878 
		-0.021233771 -0.7714721 -0.63590878 -0.021233771 -0.7714721 -0.63590878 -0.021233771 
		-0.7714721 -0.63590878 0.75726056 0.61634427 -0.21604674 0.75726056 0.61634427 
		-0.21604674 0.75726056 0.61634427 -0.21604674 0.75726056 0.61634427 -0.21604674 
		0.28689113 0.90185285 0.32304013 0.28689113 0.90185285 0.32304013 0.28689113 
		0.90185285 0.32304013 0.28689113 0.90185285 0.32304013 -0.37508807 -0.44245112 
		0.8145833 -0.37508807 -0.44245112 0.8145833 -0.37508807 -0.44245112 0.8145833 
		-0.37508807 -0.44245112 0.8145833 -0.0028468024 -0.9229992 -0.38479123 -0.0028468024 
		-0.9229992 -0.38479123 -0.0028468024 -0.9229992 -0.38479123 -0.0028468024 
		-0.9229992 -0.38479123 0.56051528 0.11818235 -0.81966794 0.56051528 0.11818235 
		-0.81966794 0.56051528 0.11818235 -0.81966794 0.56051528 0.11818235 -0.81966794 
		0.38452223 0.84714556 0.3667247 0.38452223 0.84714556 0.3667247 0.38452223 
		0.84714556 0.3667247 0.38452223 0.84714556 0.3667247 -0.43489984 -0.42118132 
		0.79590726 -0.43489984 -0.42118132 0.79590726 -0.43489984 -0.42118132 0.79590726 
		-0.43489984 -0.42118132 0.79590726 -0.20851588 -0.85997802 -0.46578857 -0.20851588 
		-0.85997802 -0.46578857 -0.20851588 -0.85997802 -0.46578857 -0.20851588 -0.85997802 
		-0.46578857 0.4220489 0.037851129 -0.90578252 0.4220489 0.037851129 -0.90578252 
		0.4220489 0.037851129 -0.90578252 0.4220489 0.037851129 -0.90578252 -0.35503158 
		0.030152943 0.9343679 -0.35503158 0.030152943 0.9343679 -0.35503158 0.030152943 
		0.9343679 -0.35503158 0.030152943 0.9343679 -0.22237323 -0.95855516 0.17810702 
		-0.22237323 -0.95855516 0.17810702 -0.22237323 -0.95855516 0.17810702 -0.22237323 
		-0.95855516 0.17810702 0.35318139 -0.46645275 -0.81097764 0.35318139 -0.46645275 
		-0.81097764 0.35318139 -0.46645275 -0.81097764 0.35318139 -0.46645275 -0.81097764 
		0.42675096 0.90137357 -0.073548168 0.42675096 0.90137357 -0.073548168 0.42675096 
		0.90137357 -0.073548168 0.42675096 0.90137357 -0.073548168 -0.36567622 -0.0012926022 
		0.93074125 -0.36567622 -0.0012926022 0.93074125 -0.36567622 -0.0012926022 
		0.93074125 -0.36567622 -0.0012926022 0.93074125 -0.48414129 -0.87482738 0.016860288 
		-0.48414129 -0.87482738 0.016860288 -0.48414129 -0.87482738 0.016860288 -0.48414129 
		-0.87482738 0.016860288 0.17891535 -0.4237605 -0.88792813 0.17891535 -0.4237605 
		-0.88792813 0.17891535 -0.4237605 -0.88792813 0.17891535 -0.4237605 -0.88792813 
		0.56605828 0.82421613 -0.015678946 0.56605828 0.82421613 -0.015678946 0.56605828 
		0.82421613 -0.015678946 0.56605828 0.82421613 -0.015678946 -0.017333247 0.61508167 
		0.78827292 -0.017333247 0.61508167 0.78827292 -0.017333247 0.61508167 0.78827292 
		-0.017333247 0.61508167 0.78827292 -0.368126 -0.70950878 0.60089976 -0.368126 
		-0.70950878 0.60089976 -0.368126 -0.70950878 0.60089976 -0.368126 -0.70950878 
		0.60089976 0.11385419 -0.69849646 -0.70649838 0.11385419 -0.69849646 -0.70649838 
		0.11385419 -0.69849646 -0.70649838 0.11385419 -0.69849646 -0.70649838 0.54444402 
		0.67135739 -0.5028519 0.54444402 0.67135739 -0.5028519 0.54444402 0.67135739 
		-0.5028519 0.54444402 0.67135739 -0.5028519 -0.077147879 0.59378231 0.80091876 
		-0.077147879 0.59378231 0.80091876 -0.077147879 0.59378231 0.80091876 -0.077147879 
		0.59378231 0.80091876 -0.54588825 -0.71021301 0.44452617 -0.54588825 -0.71021301 
		0.44452617 -0.54588825 -0.71021301 0.44452617 -0.54588825 -0.71021301 0.44452617 
		0.097478986 -0.72754985 -0.67909431 0.097478986 -0.72754985 -0.67909431 0.097478986 
		-0.72754985 -0.67909431 0.097478986 -0.72754985 -0.67909431 0.66569728 0.66105044 
		-0.3462072 0.66569728 0.66105044 -0.3462072 0.66569728 0.66105044 -0.3462072 
		0.66569728 0.66105044 -0.3462072 0.99140429 0.060750071 -0.11587476 0.99140429 
		0.060750071 -0.11587476 0.99140429 0.060750071 -0.11587476 0.99140429 0.060750071 
		-0.11587476 0.89751852 -0.40439522 0.17585504 0.89751852 -0.40439522 0.17585504 
		0.89751852 -0.40439522 0.17585504 0.89751852 -0.40439522 0.17585504 0.46987277 
		0.76061755 -0.44797376 0.46987277 0.76061755 -0.44797376 0.46987277 0.76061755 
		-0.44797376 0.46987277 0.76061755 -0.44797376 0.095548764 0.4439438 0.89094579 
		0.095548764 0.4439438 0.89094579 0.095548764 0.4439438 0.89094579 0.095548764 
		0.4439438 0.89094579 -0.088169463 -0.87197775 0.48154029 -0.088169463 -0.87197775 
		0.48154029 -0.088169463 -0.87197775 0.48154029 -0.088169463 -0.87197775 0.48154029 
		0.32659408 -0.42832181 -0.84254181 0.32659408 -0.42832181 -0.84254181 0.32659408 
		-0.42832181 -0.84254181 0.32659408 -0.42832181 -0.84254181 0.82594895 0.4811042 
		-0.29384881 0.82594895 0.4811042 -0.29384881 0.82594895 0.4811042 -0.29384881 
		0.82594895 0.4811042 -0.29384881 0.3347556 0.11705372 0.9350065 0.3347556 
		0.11705372 0.9350065 0.3347556 0.11705372 0.9350065 0.3347556 0.11705372 
		0.9350065 0.19304901 0.36828974 0.90944749 0.19304901 0.36828974 0.90944749 
		0.19304901 0.36828974 0.90944749 0.19304901 0.36828974 0.90944749 -0.65015417 
		-0.47668749 0.59166598 -0.65015417 -0.47668749 0.59166598 -0.65015417 -0.47668749 
		0.59166598 -0.59129959 -0.78821838 0.1705187 -0.59129959 -0.78821838 0.1705187 
		-0.59129959 -0.78821838 0.1705187 0.58466166 -0.68792003 0.4300428 0.58466166 
		-0.68792003 0.4300428 0.58466166 -0.68792003 0.4300428 0.58466166 -0.68792003 
		0.4300428 0.58466166 -0.68792003 0.4300428 0.40019411 -0.90837145 0.121268;
	setAttr ".n[5644:5697]" -type "float3"  0.40019411 -0.90837145 0.121268 
		0.40019411 -0.90837145 0.121268 0.40019411 -0.90837145 0.121268 0.55297875 
		-0.78390813 -0.28231639 0.55297875 -0.78390813 -0.28231639 0.55297875 -0.78390813 
		-0.28231639 0.55297875 -0.78390813 -0.28231639 0.18668787 -0.88214999 -0.43238759 
		0.18668787 -0.88214999 -0.43238759 0.18668787 -0.88214999 -0.43238759 0.18668787 
		-0.88214999 -0.43238759 -0.021449268 -0.077625521 -0.99675184 -0.021449268 
		-0.077625521 -0.99675184 -0.021449268 -0.077625521 -0.99675184 0.14355582 
		-0.44505903 -0.88391978 0.14355582 -0.44505903 -0.88391978 0.14355582 -0.44505903 
		-0.88391978 0.14355582 -0.44505903 -0.88391978 0.36960277 -0.63147962 -0.6816358 
		0.36960277 -0.63147962 -0.6816358 0.36960277 -0.63147962 -0.6816358 0.36960277 
		-0.63147962 -0.6816358 0.17519973 -0.96465063 0.19686083 0.17519973 -0.96465063 
		0.19686083 0.17519973 -0.96465063 0.19686083 0.17519973 -0.96465063 0.19686083 
		0.74178886 -0.67037243 0.018710373 0.74178886 -0.67037243 0.018710373 0.74178886 
		-0.67037243 0.018710373 0.74178886 -0.67037243 0.018710373 -0.25044677 -0.96646833 
		-0.056704577 -0.25044677 -0.96646833 -0.056704577 -0.25044677 -0.96646833 
		-0.056704577 -0.25044677 -0.96646833 -0.056704577 -0.38676721 -0.88990563 
		-0.24182443 -0.38676721 -0.88990563 -0.24182443 -0.38676721 -0.88990563 -0.24182443 
		-0.38676721 -0.88990563 -0.24182443 -0.55868274 -0.82092726 -0.11811887 -0.55868274 
		-0.82092726 -0.11811887 -0.55868274 -0.82092726 -0.11811887 -0.55868274 -0.82092726 
		-0.11811887 -0.50694007 -0.85486764 -0.11051317 -0.50694007 -0.85486764 -0.11051317 
		-0.50694007 -0.85486764 -0.11051317 -0.50694007 -0.85486764 -0.11051317 0.33322403 
		-0.84180796 -0.42464232 0.33322403 -0.84180796 -0.42464232 0.33322403 -0.84180796 
		-0.42464232 0.33322403 -0.84180796 -0.42464232 -0.86821723 -0.17702541 0.46353078 
		-0.86821723 -0.17702541 0.46353078 -0.86821723 -0.17702541 0.46353078 -0.86821723 
		-0.17702541 0.46353078;
	setAttr -s 1416 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 275 274 -273 -271 
		mu 0 4 0 1 2 3 
		f 4 283 282 -281 -279 
		mu 0 4 4 5 6 7 
		f 4 287 -287 -286 284 
		mu 0 4 8 9 10 11 
		f 4 13 -34 -15 18 
		mu 0 4 12 13 14 15 
		f 4 14 -35 -90 19 
		mu 0 4 15 14 16 17 
		f 4 15 -36 -14 20 
		mu 0 4 18 19 13 12 
		f 4 16 -37 -16 21 
		mu 0 4 20 21 19 18 
		f 4 2459 24 -2459 -38 
		mu 0 4 24 27 25 1626 
		f 4 17 -40 -17 25 
		mu 0 4 27 26 21 20 
		f 4 26 6 -28 33 
		mu 0 4 13 28 29 14 
		f 4 27 7 -29 34 
		mu 0 4 14 29 30 16 
		f 4 29 -9 -27 35 
		mu 0 4 19 31 28 13 
		f 4 30 -10 -30 36 
		mu 0 4 21 32 31 19 
		f 4 -2465 2466 -82 84 
		mu 0 4 67 1627 1628 68 
		f 4 31 11 -33 38 
		mu 0 4 24 34 35 26 
		f 4 32 -13 -31 39 
		mu 0 4 26 35 32 21 
		f 4 83 82 2471 2474 
		mu 0 4 36 23 69 1630 
		f 4 -71 -72 69 -55 
		mu 0 4 38 39 40 41 
		f 4 8 43 -60 -61 
		mu 0 4 28 31 42 43 
		f 4 55 46 -69 -50 
		mu 0 4 45 41 46 47 
		f 5 -345 -361 -362 -360 -355 
		mu 0 5 48 49 50 51 52 
		f 5 58 -41 -7 -92 -49 
		mu 0 5 54 53 29 28 55 
		f 4 -48 -44 9 62 
		mu 0 4 56 42 31 32 
		f 4 92 -62 -63 -94 
		mu 0 4 57 58 56 32 
		f 4 64 -51 -12 65 
		mu 0 4 59 44 35 34 
		f 4 -74 -8 40 41 
		mu 0 4 60 30 29 53 
		f 5 68 67 -93 -54 -67 
		mu 0 5 47 46 58 57 61 
		f 5 -43 48 90 45 71 
		mu 0 5 39 54 55 62 40 
		f 4 75 74 73 72 
		mu 0 4 63 64 30 60 
		f 4 -58 -11 -75 76 
		mu 0 4 65 66 30 64 
		f 5 -76 -78 54 364 365 
		mu 0 5 64 63 38 41 190 
		f 4 56 -85 86 -88 
		mu 0 4 66 67 68 70 
		f 4 2468 2467 -87 81 
		mu 0 4 1628 1629 70 68 
		f 4 28 10 87 85 
		mu 0 4 16 30 66 70 
		f 4 2470 -83 -2457 2458 
		mu 0 4 25 69 23 1626 
		f 3 2475 89 -86 
		mu 0 3 70 17 16 
		f 4 91 60 -45 -91 
		mu 0 4 55 28 43 62 
		f 5 53 93 12 50 -64 
		mu 0 5 61 57 32 35 44 
		f 4 95 -97 -95 59 
		mu 0 4 42 71 72 43 
		f 4 94 -99 -98 44 
		mu 0 4 43 72 73 62 
		f 4 97 100 -100 -46 
		mu 0 4 62 73 74 40 
		f 4 99 102 -102 -70 
		mu 0 4 40 74 75 41 
		f 4 101 104 -104 -47 
		mu 0 4 41 75 76 46 
		f 4 103 106 -106 -68 
		mu 0 4 46 76 77 58 
		f 4 105 -109 -108 61 
		mu 0 4 58 77 78 56 
		f 4 107 -110 -96 47 
		mu 0 4 56 78 71 42 
		f 4 112 -112 -59 110 
		mu 0 4 79 80 53 54 
		f 4 111 114 -114 -42 
		mu 0 4 53 80 81 60 
		f 4 113 116 -116 -73 
		mu 0 4 60 81 82 63 
		f 4 -119 -118 77 115 
		mu 0 4 82 83 38 63 
		f 4 117 -121 -120 70 
		mu 0 4 38 83 84 39 
		f 4 119 -122 -111 42 
		mu 0 4 39 84 79 54 
		f 4 123 -125 -123 66 
		mu 0 4 61 85 86 47 
		f 4 122 -127 -126 49 
		mu 0 4 47 86 87 45 
		f 4 128 -128 -79 125 
		mu 0 4 87 88 89 45 
		f 4 127 130 -130 -52 
		mu 0 4 89 88 90 59 
		f 4 129 132 -132 -65 
		mu 0 4 59 90 91 44 
		f 4 -134 -124 63 131 
		mu 0 4 91 85 61 44 
		f 4 -135 -80 140 142 
		mu 0 4 92 65 37 96 
		f 5 136 -136 -57 57 134 
		mu 0 5 92 93 67 66 65 
		f 4 2465 2464 135 137 
		mu 0 4 94 1627 67 93 
		f 4 141 -141 -53 138 
		mu 0 4 95 96 37 33 
		f 4 -144 -143 150 152 
		mu 0 4 97 92 96 101 
		f 4 145 -145 -137 143 
		mu 0 4 97 98 93 92 
		f 4 144 147 -147 -138 
		mu 0 4 93 98 99 94 
		f 4 146 -150 -149 139 
		mu 0 4 94 99 100 95 
		f 4 151 -151 -142 148 
		mu 0 4 100 101 96 95 
		f 4 -154 -153 160 162 
		mu 0 4 102 97 101 105 
		f 4 155 -155 -146 153 
		mu 0 4 102 103 98 97 
		f 4 154 157 -157 -148 
		mu 0 4 98 103 51 99 
		f 4 156 -160 -159 149 
		mu 0 4 99 51 104 100 
		f 4 161 -161 -152 158 
		mu 0 4 104 105 101 100 
		f 4 166 -166 -113 164 
		mu 0 4 106 107 80 79 
		f 4 165 168 -168 -115 
		mu 0 4 80 107 108 81 
		f 4 167 170 -170 -117 
		mu 0 4 81 108 109 82 
		f 4 -173 -172 118 169 
		mu 0 4 109 110 83 82 
		f 4 171 -175 -174 120 
		mu 0 4 83 110 111 84 
		f 4 173 -176 -165 121 
		mu 0 4 84 111 106 79 
		f 4 177 -179 -177 96 
		mu 0 4 71 112 113 72 
		f 4 176 -181 -180 98 
		mu 0 4 72 113 114 73 
		f 4 179 182 -182 -101 
		mu 0 4 73 114 115 74 
		f 4 181 184 -184 -103 
		mu 0 4 74 115 116 75 
		f 4 183 186 -186 -105 
		mu 0 4 75 116 117 76 
		f 4 185 188 -188 -107 
		mu 0 4 76 117 118 77 
		f 4 187 -191 -190 108 
		mu 0 4 77 118 119 78 
		f 4 189 -192 -178 109 
		mu 0 4 78 119 112 71 
		f 4 193 -195 -193 124 
		mu 0 4 85 120 121 86 
		f 4 192 -197 -196 126 
		mu 0 4 86 121 122 87 
		f 4 198 -198 -129 195 
		mu 0 4 122 123 88 87 
		f 4 197 200 -200 -131 
		mu 0 4 88 123 124 90 
		f 4 199 202 -202 -133 
		mu 0 4 90 124 125 91 
		f 4 -204 -194 133 201 
		mu 0 4 125 120 85 91 
		f 4 206 -206 -167 204 
		mu 0 4 126 127 107 106 
		f 4 205 208 -208 -169 
		mu 0 4 107 127 128 108 
		f 4 207 210 -210 -171 
		mu 0 4 108 128 129 109 
		f 4 -213 -212 172 209 
		mu 0 4 129 130 110 109 
		f 4 211 -215 -214 174 
		mu 0 4 110 130 131 111 
		f 4 213 -216 -205 175 
		mu 0 4 111 131 126 106 
		f 4 217 -219 -217 178 
		mu 0 4 112 132 133 113 
		f 4 216 -221 -220 180 
		mu 0 4 113 133 134 114 
		f 4 219 222 -222 -183 
		mu 0 4 114 134 135 115 
		f 4 221 224 -224 -185 
		mu 0 4 115 135 136 116 
		f 4 223 226 -226 -187 
		mu 0 4 116 136 137 117 
		f 4 225 228 -228 -189 
		mu 0 4 117 137 138 118 
		f 4 227 -231 -230 190 
		mu 0 4 118 138 139 119 
		f 4 229 -232 -218 191 
		mu 0 4 119 139 132 112 
		f 4 233 -235 -233 194 
		mu 0 4 120 140 141 121 
		f 4 232 -237 -236 196 
		mu 0 4 121 141 142 122 
		f 4 238 -238 -199 235 
		mu 0 4 142 143 123 122 
		f 4 237 240 -240 -201 
		mu 0 4 123 143 144 124 
		f 4 239 242 -242 -203 
		mu 0 4 124 144 145 125 
		f 4 -244 -234 203 241 
		mu 0 4 145 140 120 125 
		f 4 246 -246 -207 244 
		mu 0 4 146 147 127 126 
		f 5 248 -248 -211 -209 245 
		mu 0 5 147 148 129 128 127 
		f 4 -251 -250 212 247 
		mu 0 4 148 149 130 129 
		f 5 -252 -245 215 214 249 
		mu 0 5 149 146 126 131 130 
		f 5 254 -254 -223 220 252 
		mu 0 5 150 151 135 134 133 
		f 5 256 -256 -227 -225 253 
		mu 0 5 151 152 137 136 135 
		f 5 -259 -258 230 -229 255 
		mu 0 5 152 153 139 138 137 
		f 5 -253 218 231 257 -260 
		mu 0 5 150 133 132 139 153 
		f 5 -263 -262 236 234 260 
		mu 0 5 154 155 142 141 140 
		f 4 264 -264 -239 261 
		mu 0 4 155 156 143 142 
		f 5 266 -266 -243 -241 263 
		mu 0 5 156 157 145 144 143 
		f 4 -268 -261 243 265 
		mu 0 4 157 154 140 145 
		f 4 270 -298 -301 296 
		mu 0 4 0 3 158 159 
		f 4 272 -299 -302 297 
		mu 0 4 3 2 160 158 
		f 4 -275 -300 -303 298 
		mu 0 4 2 1 161 160 
		f 4 -276 -297 -304 299 
		mu 0 4 1 0 159 161 
		f 4 278 -314 -317 312 
		mu 0 4 4 7 162 163 
		f 4 280 -315 -318 313 
		mu 0 4 7 6 164 162 
		f 4 -283 -316 -319 314 
		mu 0 4 6 5 165 164 
		f 4 -313 -320 315 -284 
		mu 0 4 4 163 165 5 
		f 4 -285 -326 -329 324 
		mu 0 4 8 11 166 167 
		f 4 285 -327 -330 325 
		mu 0 4 11 10 168 166 
		f 4 286 -328 -331 326 
		mu 0 4 10 9 169 168 
		f 4 -288 -325 -332 327 
		mu 0 4 9 8 167 169 
		f 4 -270 -247 268 292 
		mu 0 4 170 147 146 171 
		f 4 -272 -249 269 293 
		mu 0 4 172 148 147 170 
		f 4 -274 250 271 294 
		mu 0 4 173 149 148 172 
		f 4 -269 251 273 295 
		mu 0 4 171 146 149 173 
		f 4 -290 -293 288 300 
		mu 0 4 158 170 171 159 
		f 4 -291 -294 289 301 
		mu 0 4 160 172 170 158 
		f 4 -292 -295 290 302 
		mu 0 4 161 173 172 160 
		f 4 -289 -296 291 303 
		mu 0 4 159 171 173 161 
		f 4 -278 -255 276 308 
		mu 0 4 174 151 150 175 
		f 4 -280 -257 277 309 
		mu 0 4 176 152 151 174 
		f 4 -282 258 279 310 
		mu 0 4 177 153 152 176 
		f 4 -277 259 281 311 
		mu 0 4 175 150 153 177 
		f 4 -306 -309 304 316 
		mu 0 4 162 174 175 163 
		f 4 -307 -310 305 317 
		mu 0 4 164 176 174 162 
		f 4 -308 -311 306 318 
		mu 0 4 165 177 176 164 
		f 4 -305 -312 307 319 
		mu 0 4 163 175 177 165 
		f 4 262 320 -337 -322 
		mu 0 4 155 154 178 179 
		f 4 -265 321 -338 -323 
		mu 0 4 156 155 179 180 
		f 4 -267 322 -339 -324 
		mu 0 4 157 156 180 181 
		f 4 267 323 -340 -321 
		mu 0 4 154 157 181 178 
		f 4 332 328 -334 336 
		mu 0 4 178 167 166 179 
		f 4 333 329 -335 337 
		mu 0 4 179 166 168 180 
		f 4 334 330 -336 338 
		mu 0 4 180 168 169 181 
		f 4 335 331 -333 339 
		mu 0 4 181 169 167 178 
		f 4 2461 -343 340 -354 
		mu 0 4 184 185 183 182 
		f 4 352 351 349 347 
		mu 0 4 186 187 188 189 
		f 4 346 -348 -346 342 
		mu 0 4 185 186 189 183 
		f 4 345 -350 -349 341 
		mu 0 4 183 189 188 48 
		f 4 348 -352 -351 344 
		mu 0 4 48 188 187 49 
		f 4 350 -353 -347 343 
		mu 0 4 49 187 186 185 
		f 4 -163 2460 353 356 
		mu 0 4 102 105 184 182 
		f 4 -342 354 -359 -341 
		mu 0 4 183 48 52 182 
		f 4 358 357 -156 -357 
		mu 0 4 182 52 103 102 
		f 3 -158 -358 359 
		mu 0 3 51 103 52 
		f 3 -356 159 361 
		mu 0 3 50 104 51 
		f 5 78 2455 2454 -365 -56 
		mu 0 5 45 89 1625 190 41 
		f 4 2462 -84 2463 -366 
		mu 0 4 190 23 36 64 
		f 6 378 -2051 -2053 -377 -368 368 
		mu 0 6 191 192 1247 1248 193 194 
		f 4 391 -417 -418 412 
		mu 0 4 195 196 197 198 
		f 4 376 2053 2054 -375 
		mu 0 4 193 1248 1249 200 
		f 4 -395 -382 -371 -394 
		mu 0 4 201 202 203 204 
		f 4 -422 414 -388 -424 
		mu 0 4 205 206 207 208 
		f 4 2030 2033 -391 -2029 
		mu 0 4 1232 1233 1234 211 
		f 3 390 2035 -374 
		mu 0 3 211 1234 1236 
		f 4 -401 -419 -420 416 
		mu 0 4 196 215 216 197 
		f 4 380 397 -367 -376 
		mu 0 4 199 217 218 200 
		f 5 -2049 -390 374 366 399 
		mu 0 5 209 1246 193 200 219 
		f 4 -399 -408 -427 424 
		mu 0 4 210 209 220 212 
		f 4 -393 394 -380 402 
		mu 0 4 221 202 201 222 
		f 3 -410 -406 -398 
		mu 0 3 217 223 219 
		f 4 -403 -412 410 404 
		mu 0 4 221 222 224 225 
		f 4 408 407 -400 405 
		mu 0 4 223 220 209 219 
		f 4 403 -411 -407 409 
		mu 0 4 217 225 224 223 
		f 4 -456 -453 -446 -455 
		mu 0 4 226 227 228 229 
		f 4 1950 1949 1913 1912 
		mu 0 4 230 231 232 233 
		f 4 415 -387 -413 413 
		mu 0 4 232 206 195 198 
		f 4 -397 393 371 417 
		mu 0 4 197 234 235 198 
		f 4 -389 379 396 419 
		mu 0 4 216 236 234 197 
		f 4 386 421 422 -385 
		mu 0 4 195 206 205 213 
		f 4 -423 423 383 -421 
		mu 0 4 213 205 208 214 
		f 4 -396 -392 384 425 
		mu 0 4 212 196 195 213 
		f 4 -402 400 395 426 
		mu 0 4 220 237 196 212 
		f 4 428 -430 -428 411 
		mu 0 4 222 238 239 224 
		f 4 427 -432 -431 406 
		mu 0 4 224 239 240 223 
		f 4 430 433 -433 -409 
		mu 0 4 223 240 241 220 
		f 4 432 -436 -435 401 
		mu 0 4 220 241 242 237 
		f 4 434 -438 -437 418 
		mu 0 4 237 242 243 244 
		f 4 436 -439 -429 388 
		mu 0 4 244 243 238 222 
		f 4 440 -442 -440 429 
		mu 0 4 238 245 246 239 
		f 4 439 -444 -443 431 
		mu 0 4 239 246 229 240 
		f 4 442 445 -445 -434 
		mu 0 4 240 229 228 241 
		f 4 444 -448 -447 435 
		mu 0 4 241 228 247 242 
		f 4 446 -450 -449 437 
		mu 0 4 242 247 248 243 
		f 4 448 -451 -441 438 
		mu 0 4 243 248 245 238 
		f 4 451 454 443 441 
		mu 0 4 245 226 229 246 
		f 4 449 447 452 453 
		mu 0 4 248 247 228 227 
		f 4 450 -454 455 -452 
		mu 0 4 245 248 227 226 
		f 4 464 -481 -466 -457 
		mu 0 4 249 250 251 252 
		f 4 465 -482 -467 -458 
		mu 0 4 252 251 253 254 
		f 4 467 -483 -465 458 
		mu 0 4 255 256 250 249 
		f 4 468 -484 -468 459 
		mu 0 4 257 258 256 255 
		f 4 466 -485 -470 -461 
		mu 0 4 254 253 259 260 
		f 4 469 -486 -471 461 
		mu 0 4 260 259 261 262 
		f 4 470 -487 -472 -463 
		mu 0 4 262 261 263 264 
		f 4 471 -488 -469 463 
		mu 0 4 264 263 258 257 
		f 4 472 -513 -474 480 
		mu 0 4 250 265 266 251 
		f 4 473 -514 -475 481 
		mu 0 4 251 266 267 253 
		f 4 475 -515 -473 482 
		mu 0 4 256 268 265 250 
		f 4 476 -516 -476 483 
		mu 0 4 258 269 268 256 
		f 4 474 -517 -478 484 
		mu 0 4 253 267 270 259 
		f 4 477 -518 -479 485 
		mu 0 4 259 270 271 261 
		f 4 478 -519 -480 486 
		mu 0 4 261 271 272 263 
		f 4 479 -520 -477 487 
		mu 0 4 263 272 269 258 
		f 4 488 -537 -490 496 
		mu 0 4 273 274 275 276 
		f 4 489 -538 -491 497 
		mu 0 4 276 275 277 278 
		f 4 491 -539 -489 498 
		mu 0 4 279 280 274 273 
		f 4 492 -540 -492 499 
		mu 0 4 281 282 280 279 
		f 4 490 -541 -494 500 
		mu 0 4 278 277 283 284 
		f 4 493 -542 -495 501 
		mu 0 4 284 283 285 286 
		f 4 494 -543 -496 502 
		mu 0 4 286 285 287 288 
		f 4 495 -544 -493 503 
		mu 0 4 288 287 282 281 
		f 4 504 -497 -506 512 
		mu 0 4 265 273 276 266 
		f 4 505 -498 -507 513 
		mu 0 4 266 276 278 267 
		f 4 507 -499 -505 514 
		mu 0 4 268 279 273 265 
		f 4 508 -500 -508 515 
		mu 0 4 269 281 279 268 
		f 4 506 -501 -510 516 
		mu 0 4 267 278 284 270 
		f 4 509 -502 -511 517 
		mu 0 4 270 284 286 271 
		f 4 510 -503 -512 518 
		mu 0 4 271 286 288 272 
		f 4 511 -504 -509 519 
		mu 0 4 272 288 281 269 
		f 4 528 -521 -530 536 
		mu 0 4 274 289 290 275 
		f 4 529 -522 -531 537 
		mu 0 4 275 290 291 277 
		f 4 531 -523 -529 538 
		mu 0 4 280 292 289 274 
		f 4 532 -524 -532 539 
		mu 0 4 282 293 292 280 
		f 4 530 -525 -534 540 
		mu 0 4 277 291 294 283 
		f 4 533 -526 -535 541 
		mu 0 4 283 294 295 285 
		f 4 534 -527 -536 542 
		mu 0 4 285 295 296 287 
		f 4 535 -528 -533 543 
		mu 0 4 287 296 293 282 
		f 4 -552 -558 559 -563 
		mu 0 4 297 298 299 300 
		f 4 -554 -564 564 -567 
		mu 0 4 301 302 303 304 
		f 4 -755 -757 758 -760 
		mu 0 4 305 306 307 308 
		f 4 -762 763 765 -767 
		mu 0 4 309 306 310 311 
		f 5 -555 552 580 -2038 -583 
		mu 0 5 312 313 314 315 1238 
		f 4 -548 544 556 -556 
		mu 0 4 316 317 318 319 
		f 4 -549 545 560 -560 
		mu 0 4 299 320 321 300 
		f 4 1964 0 561 -561 
		mu 0 4 321 322 323 300 
		f 4 1 -559 562 -562 
		mu 0 4 323 324 297 300 
		f 4 -550 546 565 -565 
		mu 0 4 303 325 326 304 
		f 4 756 761 768 -770 
		mu 0 4 307 306 309 327 
		f 3 2065 566 -930 
		mu 0 3 328 301 304 
		f 4 567 549 569 -569 
		mu 0 4 329 330 331 332 
		f 4 563 554 570 -570 
		mu 0 4 331 313 312 332 
		f 4 -764 754 771 -773 
		mu 0 4 310 306 305 333 
		f 4 -547 -568 572 -572 
		mu 0 4 326 325 334 335 
		f 4 -551 551 573 -573 
		mu 0 4 334 298 297 335 
		f 4 558 -4 574 -574 
		mu 0 4 297 324 336 335 
		f 4 -545 -577 578 -578 
		mu 0 4 337 338 339 340 
		f 4 -553 553 579 -579 
		mu 0 4 339 302 301 340 
		f 6 576 547 581 2042 2040 -581 
		mu 0 6 314 317 316 1241 1239 315 
		f 4 571 585 -587 -585 
		mu 0 4 326 335 341 342 
		f 4 -575 583 587 -586 
		mu 0 4 335 336 343 341 
		f 4 924 -576 -931 -591 
		mu 0 4 344 345 328 346 
		f 4 929 589 -928 930 
		mu 0 4 328 304 347 346 
		f 4 -566 584 591 -590 
		mu 0 4 304 326 342 347 
		f 4 586 596 -598 -596 
		mu 0 4 342 341 348 349 
		f 4 -588 594 598 -597 
		mu 0 4 341 343 350 348 
		f 4 588 600 -602 -600 
		mu 0 4 351 352 353 354 
		f 4 923 590 -929 -604 
		mu 0 4 355 344 346 356 
		f 4 927 602 -926 928 
		mu 0 4 346 347 357 356 
		f 4 -592 595 604 -603 
		mu 0 4 347 342 349 357 
		f 4 592 605 -607 -595 
		mu 0 4 343 358 359 350 
		f 4 -594 599 607 -606 
		mu 0 4 358 351 354 359 
		f 4 -599 608 610 -610 
		mu 0 4 348 350 360 361 
		f 4 916 918 889 -612 
		mu 0 4 353 362 363 364 
		f 4 606 614 -616 -609 
		mu 0 4 350 359 365 360 
		f 4 -611 616 618 -618 
		mu 0 4 361 360 366 367 
		f 4 -890 891 890 -620 
		mu 0 4 364 363 368 369 
		f 4 615 622 -624 -617 
		mu 0 4 360 365 370 366 
		f 4 597 625 -627 -625 
		mu 0 4 349 348 371 372 
		f 4 609 617 -628 -626 
		mu 0 4 348 361 367 371 
		f 4 601 629 -631 -629 
		mu 0 4 354 353 373 374 
		f 4 611 619 -632 -630 
		mu 0 4 353 364 369 373 
		f 4 -605 624 633 -633 
		mu 0 4 357 349 372 375 
		f 4 -613 632 634 -621 
		mu 0 4 376 357 375 377 
		f 4 -608 628 636 -636 
		mu 0 4 359 354 374 378 
		f 4 -615 635 637 -623 
		mu 0 4 365 359 378 370 
		f 4 -619 638 641 -640 
		mu 0 4 367 366 379 380 
		f 4 -891 893 892 -643 
		mu 0 4 369 368 381 382 
		f 4 623 647 -649 -639 
		mu 0 4 366 370 383 379 
		f 4 630 651 -653 -651 
		mu 0 4 1828 1829 384 385 
		f 4 631 653 -655 -652 
		mu 0 4 1830 386 387 384 
		f 4 -637 650 656 -656 
		mu 0 4 1831 1832 388 389 
		f 4 -638 655 658 -658 
		mu 0 4 1833 390 391 1834 
		f 4 642 659 -661 -654 
		mu 0 4 386 392 393 387 
		f 4 -644 661 662 -660 
		mu 0 4 392 1835 394 393 
		f 4 649 663 -665 -662 
		mu 0 4 1836 383 395 1837 
		f 4 -648 657 665 -664 
		mu 0 4 383 370 396 395 
		f 4 640 668 -670 -668 
		mu 0 4 1838 380 397 398 
		f 4 -642 666 670 -669 
		mu 0 4 380 379 399 397 
		f 4 643 672 -674 -672 
		mu 0 4 1839 382 400 401 
		f 4 -893 895 894 -673 
		mu 0 4 382 381 402 400 
		f 4 -647 667 676 -675 
		mu 0 4 1840 1841 398 403 
		f 4 648 677 -679 -667 
		mu 0 4 379 383 404 399 
		f 4 -650 671 679 -678 
		mu 0 4 383 1842 401 404 
		f 4 669 682 -684 -682 
		mu 0 4 398 397 405 406 
		f 4 -671 680 684 -683 
		mu 0 4 397 399 407 405 
		f 4 673 686 -688 -686 
		mu 0 4 401 400 408 409 
		f 4 -895 897 896 -687 
		mu 0 4 400 402 410 408 
		f 4 -677 681 690 -689 
		mu 0 4 403 398 406 411 
		f 4 678 691 -693 -681 
		mu 0 4 399 404 412 407 
		f 4 -680 685 693 -692 
		mu 0 4 404 401 409 412 
		f 4 683 696 -698 -696 
		mu 0 4 406 405 413 414 
		f 4 -685 694 698 -697 
		mu 0 4 405 407 415 413 
		f 4 687 700 -702 -700 
		mu 0 4 409 408 416 417 
		f 4 -897 899 898 -701 
		mu 0 4 408 410 418 416 
		f 4 -691 695 704 -703 
		mu 0 4 411 406 414 419 
		f 4 692 705 -707 -695 
		mu 0 4 407 412 420 415 
		f 4 -694 699 707 -706 
		mu 0 4 412 409 417 420 
		f 4 697 710 -712 -710 
		mu 0 4 414 413 421 422 
		f 4 -699 708 712 -711 
		mu 0 4 413 415 423 421 
		f 4 701 714 -716 -714 
		mu 0 4 417 416 424 425 
		f 4 -899 901 900 -715 
		mu 0 4 416 418 426 424 
		f 4 -705 709 718 -717 
		mu 0 4 419 414 422 427 
		f 4 706 719 -721 -709 
		mu 0 4 415 420 428 423 
		f 4 -708 713 721 -720 
		mu 0 4 420 417 425 428 
		f 4 711 724 -726 -724 
		mu 0 4 422 421 429 430 
		f 4 -713 722 726 -725 
		mu 0 4 421 423 431 429 
		f 4 715 728 -730 -728 
		mu 0 4 425 424 432 433 
		f 4 961 -729 -901 962 
		mu 0 4 434 432 424 426 
		f 4 -719 723 731 -731 
		mu 0 4 427 422 430 435 
		f 4 720 732 -734 -723 
		mu 0 4 423 428 436 431 
		f 4 -722 727 734 -733 
		mu 0 4 428 425 433 436 
		f 4 725 736 -738 -736 
		mu 0 4 430 429 437 438 
		f 4 -872 872 874 -876 
		mu 0 4 439 440 441 442 
		f 4 1179 1139 1141 1176 
		mu 0 4 443 444 445 446 
		f 4 877 879 -881 -873 
		mu 0 4 440 447 448 441 
		f 4 -735 738 740 -740 
		mu 0 4 436 433 449 450 
		f 4 737 742 -744 -742 
		mu 0 4 438 437 451 452 
		f 4 -875 882 884 -886 
		mu 0 4 442 441 453 454 
		f 4 880 887 -889 -883 
		mu 0 4 441 448 455 453 
		f 4 -741 745 752 -751 
		mu 0 4 450 449 456 457 
		f 4 743 757 -759 -756 
		mu 0 4 452 451 308 307 
		f 4 -745 753 759 -758 
		mu 0 4 451 458 305 308 
		f 4 746 764 -766 -763 
		mu 0 4 456 459 311 310 
		f 4 -748 760 766 -765 
		mu 0 4 459 460 309 311 
		f 4 748 767 -769 -761 
		mu 0 4 460 461 327 309 
		f 4 -750 755 769 -768 
		mu 0 4 461 452 307 327 
		f 4 751 770 -772 -754 
		mu 0 4 458 457 333 305 
		f 4 -753 762 772 -771 
		mu 0 4 457 456 310 333 
		f 4 -727 773 775 -775 
		mu 0 4 429 431 462 463 
		f 4 -737 774 777 -777 
		mu 0 4 437 429 463 464 
		f 4 733 778 -780 -774 
		mu 0 4 431 436 465 462 
		f 4 739 780 -782 -779 
		mu 0 4 436 450 466 465 
		f 4 744 783 -785 -783 
		mu 0 4 458 451 467 468 
		f 4 -743 776 785 -784 
		mu 0 4 451 437 464 467 
		f 4 750 786 -788 -781 
		mu 0 4 450 457 469 466 
		f 4 -752 782 788 -787 
		mu 0 4 457 458 468 469 
		f 4 -776 789 791 -791 
		mu 0 4 463 462 470 471 
		f 4 -778 790 793 -793 
		mu 0 4 464 463 471 472 
		f 4 779 794 -796 -790 
		mu 0 4 462 465 473 470 
		f 4 781 796 -798 -795 
		mu 0 4 465 466 474 473 
		f 4 784 799 -801 -799 
		mu 0 4 468 467 475 476 
		f 4 -786 792 801 -800 
		mu 0 4 467 464 472 475 
		f 4 787 802 -804 -797 
		mu 0 4 466 469 477 474 
		f 4 -789 798 804 -803 
		mu 0 4 469 468 476 477 
		f 4 -792 805 807 -807 
		mu 0 4 471 470 478 479 
		f 4 -794 806 809 -809 
		mu 0 4 472 471 479 480 
		f 4 795 810 -812 -806 
		mu 0 4 470 473 481 478 
		f 4 797 812 -814 -811 
		mu 0 4 473 474 482 481 
		f 4 800 815 -817 -815 
		mu 0 4 476 475 483 484 
		f 4 -802 808 817 -816 
		mu 0 4 475 472 480 483 
		f 4 803 818 -820 -813 
		mu 0 4 474 477 485 482 
		f 4 -805 814 820 -819 
		mu 0 4 477 476 484 485 
		f 4 -808 821 823 -823 
		mu 0 4 479 478 486 487 
		f 4 -810 822 825 -825 
		mu 0 4 480 479 487 488 
		f 4 811 826 -828 -822 
		mu 0 4 478 481 489 486 
		f 4 813 828 -830 -827 
		mu 0 4 481 482 490 489 
		f 4 816 831 -833 -831 
		mu 0 4 484 483 491 492 
		f 4 -818 824 833 -832 
		mu 0 4 483 480 488 491 
		f 4 819 834 -836 -829 
		mu 0 4 482 485 493 490 
		f 4 -821 830 836 -835 
		mu 0 4 485 484 492 493 
		f 4 -824 837 839 -839 
		mu 0 4 487 486 494 495 
		f 4 -826 838 841 -841 
		mu 0 4 488 487 495 496 
		f 4 827 842 -844 -838 
		mu 0 4 486 489 497 494 
		f 4 829 844 -846 -843 
		mu 0 4 489 490 498 497 
		f 4 832 847 -849 -847 
		mu 0 4 492 491 499 500 
		f 4 -834 840 849 -848 
		mu 0 4 491 488 496 499 
		f 4 835 850 -852 -845 
		mu 0 4 490 493 501 498 
		f 4 -837 846 852 -851 
		mu 0 4 493 492 500 501 
		f 4 -840 853 855 -855 
		mu 0 4 495 494 502 503 
		f 4 -842 854 857 -857 
		mu 0 4 496 495 503 504 
		f 4 843 858 -860 -854 
		mu 0 4 494 497 505 502 
		f 4 845 860 -862 -859 
		mu 0 4 497 498 506 505 
		f 4 848 863 -865 -863 
		mu 0 4 500 499 507 508 
		f 4 -850 856 865 -864 
		mu 0 4 499 496 504 507 
		f 4 851 866 -868 -861 
		mu 0 4 498 501 509 506 
		f 4 -853 862 868 -867 
		mu 0 4 501 500 508 509 
		f 4 -856 869 871 -871 
		mu 0 4 503 502 440 439 
		f 4 -858 870 875 -874 
		mu 0 4 504 503 439 442 
		f 4 859 876 -878 -870 
		mu 0 4 502 505 447 440 
		f 4 861 878 -880 -877 
		mu 0 4 505 506 448 447 
		f 4 864 883 -885 -882 
		mu 0 4 508 507 454 453 
		f 4 -866 873 885 -884 
		mu 0 4 507 504 442 454 
		f 4 867 886 -888 -879 
		mu 0 4 506 509 455 448 
		f 4 -869 881 888 -887 
		mu 0 4 509 508 453 455 
		f 4 -892 613 904 -622 
		mu 0 4 368 363 510 511 
		f 4 -894 621 906 -646 
		mu 0 4 381 368 511 512 
		f 4 -896 645 908 -676 
		mu 0 4 402 381 512 513 
		f 4 -898 675 910 -690 
		mu 0 4 410 402 513 514 
		f 4 -900 689 912 -704 
		mu 0 4 418 410 514 515 
		f 4 -902 703 914 -718 
		mu 0 4 426 418 515 516 
		f 4 -905 902 620 -904 
		mu 0 4 511 510 376 377 
		f 4 -907 903 644 -906 
		mu 0 4 512 511 377 1843 
		f 4 -909 905 674 -908 
		mu 0 4 513 512 1844 403 
		f 4 -911 907 688 -910 
		mu 0 4 514 513 403 411 
		f 4 -913 909 702 -912 
		mu 0 4 515 514 411 419 
		f 4 -915 911 716 -914 
		mu 0 4 516 515 419 427 
		f 4 -918 -916 612 -903 
		mu 0 4 510 517 357 376 
		f 3 926 925 915 
		mu 0 3 517 356 357 
		f 4 -919 -920 917 -614 
		mu 0 4 363 362 517 510 
		f 3 -917 -921 -922 
		mu 0 3 362 353 355 
		f 4 -923 -924 920 -601 
		mu 0 4 352 344 355 353 
		f 4 921 603 -927 919 
		mu 0 4 362 355 356 517 
		f 4 729 932 -934 -932 
		mu 0 4 433 432 518 519 
		f 4 -739 931 935 -935 
		mu 0 4 449 433 519 520 
		f 4 -962 963 936 -933 
		mu 0 4 432 434 521 518 
		f 4 -938 945 949 -949 
		mu 0 4 522 521 523 524 
		f 4 -747 939 940 -939 
		mu 0 4 459 456 525 526 
		f 4 -746 934 941 -940 
		mu 0 4 456 449 520 525 
		f 5 942 -944 948 957 -956 
		mu 0 5 460 527 522 524 528 
		f 4 747 938 -945 -943 
		mu 0 4 460 459 526 527 
		f 4 966 -946 -964 967 
		mu 0 4 529 523 521 434 
		f 4 -732 950 951 -947 
		mu 0 4 435 430 530 531 
		f 4 735 952 -954 -951 
		mu 0 4 430 438 532 530 
		f 4 -749 955 956 -955 
		mu 0 4 461 460 528 533 
		f 4 741 958 -960 -953 
		mu 0 4 438 452 534 532 
		f 4 749 954 -961 -959 
		mu 0 4 452 461 533 534 
		f 4 -966 913 730 -965 
		mu 0 4 529 516 427 435 
		f 4 -967 964 946 -948 
		mu 0 4 523 529 435 531 
		f 4 -968 -963 717 965 
		mu 0 4 529 434 426 516 
		f 4 933 969 -971 -969 
		mu 0 4 519 518 535 536 
		f 4 -936 968 972 -972 
		mu 0 4 520 519 536 537 
		f 4 -937 973 974 -970 
		mu 0 4 518 521 538 535 
		f 4 937 975 -977 -974 
		mu 0 4 521 522 539 538 
		f 4 -941 978 979 -978 
		mu 0 4 1845 1846 540 541 
		f 4 -942 971 980 -979 
		mu 0 4 1847 1848 1849 542 
		f 4 943 981 -983 -976 
		mu 0 4 1850 1851 543 1852 
		f 4 944 977 -984 -982 
		mu 0 4 1853 1854 544 543 
		f 4 970 985 1366 -985 
		mu 0 4 536 535 545 546 
		f 4 -973 984 1368 -988 
		mu 0 4 537 536 546 547 
		f 4 -975 989 1379 -986 
		mu 0 4 535 538 548 545 
		f 4 976 991 1378 -990 
		mu 0 4 538 539 549 548 
		f 4 -980 994 1372 -994 
		mu 0 4 550 551 552 553 
		f 4 -981 987 1370 -995 
		mu 0 4 551 537 547 552 
		f 4 982 997 1376 -992 
		mu 0 4 539 554 555 549 
		f 4 983 993 1374 -998 
		mu 0 4 554 550 553 555 
		f 4 -1003 1023 1040 -1023 
		mu 0 4 556 557 558 559 
		f 4 1030 -1033 1041 1034 
		mu 0 4 560 561 562 559 
		f 4 -1005 1024 1042 -1024 
		mu 0 4 557 563 564 558 
		f 4 -1006 1025 1043 -1025 
		mu 0 4 563 565 566 564 
		f 4 -1007 1001 1044 -1027 
		mu 0 4 567 568 569 570 
		f 4 -1008 1000 1045 -1002 
		mu 0 4 568 571 562 569 
		f 4 -1009 1027 1046 -1026 
		mu 0 4 565 572 573 566 
		f 4 -1010 1026 1047 -1028 
		mu 0 4 572 567 570 573 
		f 4 -1017 1011 1052 -1011 
		mu 0 4 560 574 575 576 
		f 4 -1031 1010 1054 -1029 
		mu 0 4 561 560 576 577 
		f 4 -1018 1012 1050 -1012 
		mu 0 4 574 578 579 575 
		f 4 -1019 1013 1063 -1013 
		mu 0 4 578 580 581 579 
		f 4 1029 1058 -1015 -1032 
		mu 0 4 582 583 584 585 
		f 4 -1020 1028 1056 -1030 
		mu 0 4 582 561 577 583 
		f 4 -1021 1015 1062 -1014 
		mu 0 4 580 586 587 581 
		f 4 -1022 1014 1060 -1016 
		mu 0 4 586 585 584 587 
		f 4 -1041 1035 1016 -1035 
		mu 0 4 559 558 574 560 
		f 4 -1042 -1001 -1004 1022 
		mu 0 4 559 562 571 556 
		f 4 -1043 1036 1017 -1036 
		mu 0 4 558 564 578 574 
		f 4 -1044 1037 1018 -1037 
		mu 0 4 564 566 580 578 
		f 4 -1045 1033 1031 -1039 
		mu 0 4 570 569 582 585 
		f 4 -1046 1032 1019 -1034 
		mu 0 4 569 562 561 582 
		f 4 -1047 1039 1020 -1038 
		mu 0 4 566 573 586 580 
		f 4 -1048 1038 1021 -1040 
		mu 0 4 573 570 585 586 
		f 4 -1051 1048 990 -1050 
		mu 0 4 575 579 588 589 
		f 4 -1053 1049 -987 -1052 
		mu 0 4 576 575 589 590 
		f 4 -1055 1051 988 -1054 
		mu 0 4 577 576 590 591 
		f 4 -1057 1053 996 -1056 
		mu 0 4 583 577 591 592 
		f 4 -1059 1055 995 -1058 
		mu 0 4 584 583 592 593 ;
	setAttr ".fc[500:999]"
		f 4 -1061 1057 -1000 -1060 
		mu 0 4 587 584 593 594 
		f 4 -1063 1059 -999 -1062 
		mu 0 4 581 587 594 595 
		f 4 -1064 1061 -993 -1049 
		mu 0 4 579 581 595 588 
		f 4 986 1065 -1067 -1065 
		mu 0 4 590 589 596 597 
		f 4 -989 1064 1068 -1068 
		mu 0 4 591 590 597 598 
		f 4 -991 1069 1070 -1066 
		mu 0 4 589 588 599 596 
		f 4 992 1071 -1073 -1070 
		mu 0 4 588 595 600 599 
		f 4 -1085 1086 1088 -1090 
		mu 0 4 601 602 603 604 
		f 4 -997 1067 1075 -1075 
		mu 0 4 592 591 598 605 
		f 4 998 1076 -1078 -1072 
		mu 0 4 595 594 606 600 
		f 4 999 1073 -1079 -1077 
		mu 0 4 594 593 607 606 
		f 4 1110 1159 1113 1163 
		mu 0 4 608 609 610 611 
		f 4 -1120 1120 1102 -1115 
		mu 0 4 611 612 613 614 
		f 4 1122 1123 -1105 -1121 
		mu 0 4 612 615 616 613 
		f 4 -1089 1090 1091 -1093 
		mu 0 4 604 603 617 618 
		f 4 -1095 1095 1096 -1091 
		mu 0 4 603 619 620 617 
		f 4 1077 1080 -1082 -1080 
		mu 0 4 600 606 621 622 
		f 4 1098 1092 -1101 -1102 
		mu 0 4 623 604 618 624 
		f 4 -996 1082 1084 -1084 
		mu 0 4 593 592 602 601 
		f 4 1074 1085 -1087 -1083 
		mu 0 4 592 605 603 602 
		f 4 -1074 1083 1089 -1088 
		mu 0 4 607 593 601 604 
		f 4 1155 1169 -1152 -1153 
		mu 0 4 625 626 627 628 
		f 4 -1076 1093 1094 -1086 
		mu 0 4 605 598 619 603 
		f 4 1160 1129 1164 1161 
		mu 0 4 629 630 631 632 
		f 4 1166 1165 -1134 -1165 
		mu 0 4 631 633 634 632 
		f 4 1078 1087 -1099 -1098 
		mu 0 4 606 607 604 623 
		f 4 -1081 1097 1101 -1100 
		mu 0 4 621 606 623 624 
		f 4 1081 1105 -1107 -1104 
		mu 0 4 622 621 635 616 
		f 4 1066 1112 -1114 -1112 
		mu 0 4 597 596 611 610 
		f 4 -1069 1111 1116 -1116 
		mu 0 4 598 597 610 636 
		f 4 -1071 1118 1119 -1113 
		mu 0 4 596 599 612 611 
		f 4 1072 1121 -1123 -1119 
		mu 0 4 599 600 615 612 
		f 4 1079 1103 -1124 -1122 
		mu 0 4 600 622 616 615 
		f 4 -1092 1125 1126 -1125 
		mu 0 4 618 617 634 625 
		f 4 -1096 1130 1131 -1129 
		mu 0 4 620 619 637 632 
		f 4 -1094 1115 1132 -1131 
		mu 0 4 619 598 636 637 
		f 4 -1097 1128 1133 -1126 
		mu 0 4 617 620 632 634 
		f 4 -1135 1100 1124 1152 
		mu 0 4 628 624 618 625 
		f 4 -1311 1312 1314 -1316 
		mu 0 4 638 639 640 641 
		f 4 1262 1264 -1267 -1268 
		mu 0 4 642 643 644 645 
		f 4 1106 1140 -1142 -1139 
		mu 0 4 616 635 446 445 
		f 4 1142 1170 1171 1168 
		mu 0 4 646 647 648 627 
		f 4 -1155 1157 1156 -1143 
		mu 0 4 646 649 650 647 
		f 4 -1110 1146 1147 -1145 
		mu 0 4 651 630 652 653 
		f 4 -1111 1148 1149 1158 
		mu 0 4 609 608 654 652 
		f 4 1174 -1151 -1149 1175 
		mu 0 4 655 656 654 608 
		f 4 -1154 -1106 1099 1134 
		mu 0 4 628 635 621 624 
		f 4 -1186 -1188 1189 -1191 
		mu 0 4 657 658 659 660 
		f 4 -1158 -1109 1144 1145 
		mu 0 4 650 649 651 653 
		f 4 -1161 1162 -1159 -1147 
		mu 0 4 630 629 609 652 
		f 4 1117 -1162 -1132 -1133 
		mu 0 4 636 629 632 637 
		f 4 -1163 -1118 -1117 -1160 
		mu 0 4 609 629 636 610 
		f 4 1109 1127 -1167 -1130 
		mu 0 4 630 651 633 631 
		f 4 -1190 -1193 1194 -1196 
		mu 0 4 660 659 661 662 
		f 4 -1170 1167 1154 -1169 
		mu 0 4 627 626 649 646 
		f 4 1107 -1171 -1144 -1141 
		mu 0 4 635 648 647 446 
		f 4 -1172 -1108 1153 1151 
		mu 0 4 627 648 635 628 
		f 4 1358 -1361 -1363 -1364 
		mu 0 4 663 664 665 666 
		f 4 1173 -1176 -1164 1114 
		mu 0 4 614 655 608 611 
		f 4 -1177 1143 -1157 1178 
		mu 0 4 443 446 647 650 
		f 4 -1178 -1179 -1146 1181 
		mu 0 4 667 443 650 653 
		f 4 -1138 -1180 1177 1182 
		mu 0 4 668 444 443 667 
		f 4 -1181 -1182 -1148 -1150 
		mu 0 4 654 667 653 652 
		f 4 -1183 1180 1150 1172 
		mu 0 4 668 667 654 656 
		f 4 -1127 1183 1185 -1185 
		mu 0 4 625 634 658 657 
		f 4 -1166 1186 1187 -1184 
		mu 0 4 634 633 659 658 
		f 4 -1156 1184 1190 -1189 
		mu 0 4 626 625 657 660 
		f 4 -1128 1191 1192 -1187 
		mu 0 4 633 651 661 659 
		f 4 1108 1193 -1195 -1192 
		mu 0 4 651 649 662 661 
		f 4 -1168 1188 1195 -1194 
		mu 0 4 649 626 660 662 
		f 4 1104 1197 -1199 -1197 
		mu 0 4 613 616 669 670 
		f 4 1138 1199 -1201 -1198 
		mu 0 4 616 445 671 669 
		f 4 -1140 1201 1202 -1200 
		mu 0 4 445 444 672 671 
		f 4 -1136 1196 1203 -1202 
		mu 0 4 444 613 670 672 
		f 4 -1103 1204 1206 -1206 
		mu 0 4 614 613 673 674 
		f 4 1135 1207 -1209 -1205 
		mu 0 4 613 444 675 673 
		f 4 1137 1209 -1211 -1208 
		mu 0 4 444 668 676 675 
		f 4 -1137 1205 1211 -1210 
		mu 0 4 668 614 674 676 
		f 4 1136 1213 -1215 -1213 
		mu 0 4 614 668 677 678 
		f 4 -1173 1215 1216 -1214 
		mu 0 4 668 656 679 677 
		f 4 -1175 1217 1218 -1216 
		mu 0 4 656 655 680 679 
		f 4 -1174 1212 1219 -1218 
		mu 0 4 655 614 678 680 
		f 4 1198 1221 -1223 -1221 
		mu 0 4 670 669 681 682 
		f 4 1200 1223 -1225 -1222 
		mu 0 4 669 671 683 681 
		f 4 -1203 1225 1226 -1224 
		mu 0 4 671 672 684 683 
		f 4 -1204 1220 1227 -1226 
		mu 0 4 672 670 682 684 
		f 4 1222 1229 -1231 -1229 
		mu 0 4 682 681 685 686 
		f 4 1224 1231 -1233 -1230 
		mu 0 4 681 683 687 685 
		f 4 -1227 1233 1234 -1232 
		mu 0 4 683 684 688 687 
		f 4 -1228 1228 1235 -1234 
		mu 0 4 684 682 686 688 
		f 4 1230 1237 -1239 -1237 
		mu 0 4 686 685 689 690 
		f 4 1232 1239 -1241 -1238 
		mu 0 4 685 687 691 689 
		f 4 -1235 1241 1242 -1240 
		mu 0 4 687 688 692 691 
		f 4 -1236 1236 1243 -1242 
		mu 0 4 688 686 690 692 
		f 4 1238 1245 -1247 -1245 
		mu 0 4 690 689 693 694 
		f 4 1240 1247 -1249 -1246 
		mu 0 4 689 691 695 693 
		f 4 -1243 1249 1250 -1248 
		mu 0 4 691 692 696 695 
		f 4 -1244 1244 1251 -1250 
		mu 0 4 692 690 694 696 
		f 4 1246 1253 -1255 -1253 
		mu 0 4 694 693 697 698 
		f 4 1248 1255 -1257 -1254 
		mu 0 4 693 695 699 697 
		f 4 -1251 1257 1258 -1256 
		mu 0 4 695 696 700 699 
		f 4 -1252 1252 1259 -1258 
		mu 0 4 696 694 698 700 
		f 4 1254 1261 -1263 -1261 
		mu 0 4 698 697 643 642 
		f 4 1256 1263 -1265 -1262 
		mu 0 4 697 699 644 643 
		f 4 -1259 1265 1266 -1264 
		mu 0 4 699 700 645 644 
		f 4 -1260 1260 1267 -1266 
		mu 0 4 700 698 642 645 
		f 4 -1207 1268 1270 -1270 
		mu 0 4 674 673 701 702 
		f 4 1208 1271 -1273 -1269 
		mu 0 4 673 675 703 701 
		f 4 1210 1273 -1275 -1272 
		mu 0 4 675 676 704 703 
		f 4 -1212 1269 1275 -1274 
		mu 0 4 676 674 702 704 
		f 4 -1271 1276 1278 -1278 
		mu 0 4 702 701 705 706 
		f 4 1272 1279 -1281 -1277 
		mu 0 4 701 703 707 705 
		f 4 1274 1281 -1283 -1280 
		mu 0 4 703 704 708 707 
		f 4 -1276 1277 1283 -1282 
		mu 0 4 704 702 706 708 
		f 4 -1279 1284 1286 -1286 
		mu 0 4 706 705 709 710 
		f 4 1280 1287 -1289 -1285 
		mu 0 4 705 707 711 709 
		f 4 1282 1289 -1291 -1288 
		mu 0 4 707 708 712 711 
		f 4 -1284 1285 1291 -1290 
		mu 0 4 708 706 710 712 
		f 4 -1287 1292 1294 -1294 
		mu 0 4 710 709 713 714 
		f 4 1288 1295 -1297 -1293 
		mu 0 4 709 711 715 713 
		f 4 1290 1297 -1299 -1296 
		mu 0 4 711 712 716 715 
		f 4 -1292 1293 1299 -1298 
		mu 0 4 712 710 714 716 
		f 4 -1295 1300 1302 -1302 
		mu 0 4 714 713 717 718 
		f 4 1296 1303 -1305 -1301 
		mu 0 4 713 715 719 717 
		f 4 1298 1305 -1307 -1304 
		mu 0 4 715 716 720 719 
		f 4 -1300 1301 1307 -1306 
		mu 0 4 716 714 718 720 
		f 4 -1303 1308 1310 -1310 
		mu 0 4 718 717 639 638 
		f 4 1304 1311 -1313 -1309 
		mu 0 4 717 719 640 639 
		f 4 1306 1313 -1315 -1312 
		mu 0 4 719 720 641 640 
		f 4 -1308 1309 1315 -1314 
		mu 0 4 720 718 638 641 
		f 4 1214 1317 -1319 -1317 
		mu 0 4 678 677 721 722 
		f 4 -1217 1319 1320 -1318 
		mu 0 4 677 679 723 721 
		f 4 -1219 1321 1322 -1320 
		mu 0 4 679 680 724 723 
		f 4 -1220 1316 1323 -1322 
		mu 0 4 680 678 722 724 
		f 4 1318 1325 -1327 -1325 
		mu 0 4 722 721 725 726 
		f 4 -1321 1327 1328 -1326 
		mu 0 4 721 723 727 725 
		f 4 -1323 1329 1330 -1328 
		mu 0 4 723 724 728 727 
		f 4 -1324 1324 1331 -1330 
		mu 0 4 724 722 726 728 
		f 4 1326 1333 -1335 -1333 
		mu 0 4 726 725 729 730 
		f 4 -1329 1335 1336 -1334 
		mu 0 4 725 727 731 729 
		f 4 -1331 1337 1338 -1336 
		mu 0 4 727 728 732 731 
		f 4 -1332 1332 1339 -1338 
		mu 0 4 728 726 730 732 
		f 4 1334 1341 -1343 -1341 
		mu 0 4 730 729 733 734 
		f 4 -1337 1343 1344 -1342 
		mu 0 4 729 731 735 733 
		f 4 -1339 1345 1346 -1344 
		mu 0 4 731 732 736 735 
		f 4 -1340 1340 1347 -1346 
		mu 0 4 732 730 734 736 
		f 4 1342 1349 -1351 -1349 
		mu 0 4 734 733 737 738 
		f 4 -1345 1351 1352 -1350 
		mu 0 4 733 735 739 737 
		f 4 -1347 1353 1354 -1352 
		mu 0 4 735 736 740 739 
		f 4 -1348 1348 1355 -1354 
		mu 0 4 736 734 738 740 
		f 4 1350 1357 -1359 -1357 
		mu 0 4 738 737 664 663 
		f 4 -1353 1359 1360 -1358 
		mu 0 4 737 739 665 664 
		f 4 -1355 1361 1362 -1360 
		mu 0 4 739 740 666 665 
		f 4 -1356 1356 1363 -1362 
		mu 0 4 740 738 663 666 
		f 4 -1367 1364 1002 -1366 
		mu 0 4 546 545 557 556 
		f 4 -1369 1365 1003 -1368 
		mu 0 4 547 546 556 571 
		f 4 -1371 1367 1007 -1370 
		mu 0 4 552 547 571 568 
		f 4 -1373 1369 1006 -1372 
		mu 0 4 553 552 568 567 
		f 4 -1375 1371 1009 -1374 
		mu 0 4 555 553 567 572 
		f 4 -1377 1373 1008 -1376 
		mu 0 4 549 555 572 565 
		f 4 -1379 1375 1005 -1378 
		mu 0 4 548 549 565 563 
		f 4 -1380 1377 1004 -1365 
		mu 0 4 545 548 563 557 
		f 4 -1581 -1546 -1544 -1584 
		mu 0 4 741 742 743 744 
		f 4 1388 -1771 -1390 -1381 
		mu 0 4 745 746 747 748 
		f 4 1391 -1773 -1389 1381 
		mu 0 4 749 750 746 745 
		f 4 1389 -1784 -1394 1382 
		mu 0 4 748 747 751 752 
		f 4 1393 -1783 -1396 -1384 
		mu 0 4 752 751 753 754 
		f 4 1397 -1777 -1399 1384 
		mu 0 4 755 756 757 758 
		f 4 1398 -1775 -1392 1385 
		mu 0 4 758 757 750 749 
		f 4 1395 -1781 -1402 -1387 
		mu 0 4 754 753 759 760 
		f 4 1401 -1779 -1398 -1388 
		mu 0 4 760 759 756 755 
		f 4 1426 -1445 -1428 1406 
		mu 0 4 761 762 763 764 
		f 4 -1439 -1446 1436 -1435 
		mu 0 4 765 762 766 767 
		f 4 1427 -1447 -1429 1408 
		mu 0 4 764 763 768 769 
		f 4 1428 -1448 -1430 1409 
		mu 0 4 769 768 770 771 
		f 4 1430 -1449 -1406 1410 
		mu 0 4 772 773 774 775 
		f 4 1405 -1450 -1405 1411 
		mu 0 4 775 774 766 776 
		f 4 1429 -1451 -1432 1412 
		mu 0 4 771 770 777 778 
		f 4 1431 -1452 -1431 1413 
		mu 0 4 778 777 773 772 
		f 4 1414 -1457 -1416 1420 
		mu 0 4 765 779 780 781 
		f 4 1432 -1459 -1415 1434 
		mu 0 4 767 782 779 765 
		f 4 1415 -1455 -1417 1421 
		mu 0 4 781 780 783 784 
		f 4 1416 -1468 -1418 1422 
		mu 0 4 784 783 785 786 
		f 4 1435 1418 -1463 -1434 
		mu 0 4 787 788 789 790 
		f 4 1433 -1461 -1433 1423 
		mu 0 4 787 790 782 767 
		f 4 1417 -1467 -1420 1424 
		mu 0 4 786 785 791 792 
		f 4 1419 -1465 -1419 1425 
		mu 0 4 792 791 789 788 
		f 4 1438 -1421 -1440 1444 
		mu 0 4 762 765 781 763 
		f 4 -1427 1407 1404 1445 
		mu 0 4 762 761 776 766 
		f 4 1439 -1422 -1441 1446 
		mu 0 4 763 781 784 768 
		f 4 1440 -1423 -1442 1447 
		mu 0 4 768 784 786 770 
		f 4 1442 -1436 -1438 1448 
		mu 0 4 773 788 787 774 
		f 4 1437 -1424 -1437 1449 
		mu 0 4 774 787 767 766 
		f 4 1441 -1425 -1444 1450 
		mu 0 4 770 786 792 777 
		f 4 1443 -1426 -1443 1451 
		mu 0 4 777 792 788 773 
		f 4 1453 -1395 -1453 1454 
		mu 0 4 780 793 794 783 
		f 4 1455 1390 -1454 1456 
		mu 0 4 779 795 793 780 
		f 4 1457 -1393 -1456 1458 
		mu 0 4 782 796 795 779 
		f 4 1459 -1401 -1458 1460 
		mu 0 4 790 797 796 782 
		f 4 1461 -1400 -1460 1462 
		mu 0 4 789 798 797 790 
		f 4 1463 1403 -1462 1464 
		mu 0 4 791 799 798 789 
		f 4 1465 1402 -1464 1466 
		mu 0 4 785 800 799 791 
		f 4 1452 1396 -1466 1467 
		mu 0 4 783 794 800 785 
		f 4 1468 1470 -1470 -1391 
		mu 0 4 795 801 802 793 
		f 4 1471 -1473 -1469 1392 
		mu 0 4 796 803 801 795 
		f 4 1469 -1475 -1474 1394 
		mu 0 4 793 802 804 794 
		f 4 1473 1476 -1476 -1397 
		mu 0 4 794 804 805 800 
		f 4 1493 -1493 -1491 1488 
		mu 0 4 806 807 808 809 
		f 4 1478 -1480 -1472 1400 
		mu 0 4 797 810 803 796 
		f 4 1475 1481 -1481 -1403 
		mu 0 4 800 805 811 799 
		f 4 1480 1482 -1478 -1404 
		mu 0 4 799 811 812 798 
		f 4 -1568 -1518 -1564 -1515 
		mu 0 4 813 814 815 816 
		f 4 1518 -1507 -1525 1523 
		mu 0 4 814 817 818 819 
		f 4 1524 1508 -1528 -1527 
		mu 0 4 819 818 820 821 
		f 4 1496 -1496 -1495 1492 
		mu 0 4 807 822 823 808 
		f 4 1494 -1501 -1500 1498 
		mu 0 4 808 823 824 825 
		f 4 1483 1485 -1485 -1482 
		mu 0 4 805 826 827 811 
		f 4 1505 1504 -1497 -1503 
		mu 0 4 828 829 822 807 
		f 4 1487 -1489 -1487 1399 
		mu 0 4 798 806 809 797 
		f 4 1486 1490 -1490 -1479 
		mu 0 4 797 809 808 810 
		f 4 1491 -1494 -1488 1477 
		mu 0 4 812 807 806 798 
		f 4 1556 1555 -1574 -1560 
		mu 0 4 830 831 832 833 
		f 4 1489 -1499 -1498 1479 
		mu 0 4 810 808 825 803 
		f 4 -1566 -1569 -1534 -1565 
		mu 0 4 834 835 836 837 
		f 4 1568 1537 -1570 -1571 
		mu 0 4 836 835 838 839 
		f 4 1501 1502 -1492 -1483 
		mu 0 4 811 828 807 812 
		f 4 1503 -1506 -1502 1484 
		mu 0 4 827 829 828 811 
		f 4 1507 1510 -1510 -1486 
		mu 0 4 826 820 840 827 
		f 4 1515 1517 -1517 -1471 
		mu 0 4 801 815 814 802 
		f 4 1519 -1521 -1516 1472 
		mu 0 4 803 841 815 801 
		f 4 1516 -1524 -1523 1474 
		mu 0 4 802 814 819 804 
		f 4 1522 1526 -1526 -1477 
		mu 0 4 804 819 821 805 
		f 4 1525 1527 -1508 -1484 
		mu 0 4 805 821 820 826 
		f 4 1528 -1531 -1530 1495 
		mu 0 4 822 830 838 823 
		f 4 1532 -1536 -1535 1499 
		mu 0 4 824 835 842 825 
		f 4 1534 -1537 -1520 1497 
		mu 0 4 825 842 841 803 
		f 4 1529 -1538 -1533 1500 
		mu 0 4 823 838 835 824 
		f 4 -1557 -1529 -1505 1538 
		mu 0 4 831 830 822 829 
		f 4 1719 -1719 -1717 1714 
		mu 0 4 843 844 845 846 
		f 4 1671 1670 -1669 -1667 
		mu 0 4 847 848 849 850 
		f 4 1542 1545 -1545 -1511 
		mu 0 4 820 743 742 840 
		f 4 -1573 -1576 -1575 -1547 
		mu 0 4 851 832 852 853 
		f 4 1546 -1561 -1562 1558 
		mu 0 4 851 853 854 855 
		f 4 1548 -1552 -1551 1513 
		mu 0 4 856 857 858 837 
		f 4 -1563 -1554 -1553 1514 
		mu 0 4 816 858 859 813 
		f 4 -1580 1552 1554 -1579 
		mu 0 4 860 813 859 861 
		f 4 -1539 -1504 1509 1557 
		mu 0 4 831 829 827 840 
		f 4 1594 -1594 1591 1589 
		mu 0 4 862 863 864 865 
		f 4 -1550 -1549 1512 1561 
		mu 0 4 854 857 856 855 
		f 4 1550 1562 -1567 1564 
		mu 0 4 837 858 816 834 
		f 4 1536 1535 1565 -1522 
		mu 0 4 841 842 835 834 
		f 4 1563 1520 1521 1566 
		mu 0 4 816 815 841 834 
		f 4 1533 1570 -1532 -1514 
		mu 0 4 837 836 839 856 
		f 4 1599 -1599 1596 1593 
		mu 0 4 863 866 867 864 
		f 4 1572 -1559 -1572 1573 
		mu 0 4 832 851 855 833 
		f 4 1544 1547 1574 -1512 
		mu 0 4 840 742 853 852 
		f 4 -1556 -1558 1511 1575 
		mu 0 4 832 831 840 852 
		f 4 1767 1766 1764 -1763 
		mu 0 4 868 869 870 871 
		f 4 -1519 1567 1579 -1578 
		mu 0 4 817 814 813 860 
		f 4 -1583 1560 -1548 1580 
		mu 0 4 741 854 853 742 
		f 4 -1586 1549 1582 1581 
		mu 0 4 872 857 854 741 
		f 4 -1587 -1582 1583 1541 
		mu 0 4 873 872 741 744 
		f 4 1553 1551 1585 1584 
		mu 0 4 859 858 857 872 
		f 4 -1577 -1555 -1585 1586 
		mu 0 4 873 861 859 872 
		f 4 1588 -1590 -1588 1530 
		mu 0 4 830 862 865 838 
		f 4 1587 -1592 -1591 1569 
		mu 0 4 838 865 864 839 
		f 4 1592 -1595 -1589 1559 
		mu 0 4 833 863 862 830 
		f 4 1590 -1597 -1596 1531 
		mu 0 4 839 864 867 856 
		f 4 1595 1598 -1598 -1513 
		mu 0 4 856 867 866 855 
		f 4 1597 -1600 -1593 1571 
		mu 0 4 855 866 863 833 
		f 4 1600 1602 -1602 -1509 
		mu 0 4 818 874 875 820 
		f 4 1601 1604 -1604 -1543 
		mu 0 4 820 875 876 743 
		f 4 1603 -1607 -1606 1543 
		mu 0 4 743 876 877 744 
		f 4 1605 -1608 -1601 1539 
		mu 0 4 744 877 874 818 
		f 4 1609 -1611 -1609 1506 
		mu 0 4 817 878 879 818 
		f 4 1608 1612 -1612 -1540 
		mu 0 4 818 879 880 744 
		f 4 1611 1614 -1614 -1542 
		mu 0 4 744 880 881 873 
		f 4 1613 -1616 -1610 1540 
		mu 0 4 873 881 878 817 
		f 4 1616 1618 -1618 -1541 
		mu 0 4 817 882 883 873 
		f 4 1617 -1621 -1620 1576 
		mu 0 4 873 883 884 861 
		f 4 1619 -1623 -1622 1578 
		mu 0 4 861 884 885 860 
		f 4 1621 -1624 -1617 1577 
		mu 0 4 860 885 882 817 
		f 4 1624 1626 -1626 -1603 
		mu 0 4 874 886 887 875 
		f 4 1625 1628 -1628 -1605 
		mu 0 4 875 887 888 876 
		f 4 1627 -1631 -1630 1606 
		mu 0 4 876 888 889 877 
		f 4 1629 -1632 -1625 1607 
		mu 0 4 877 889 886 874 
		f 4 1632 1634 -1634 -1627 
		mu 0 4 886 890 891 887 
		f 4 1633 1636 -1636 -1629 
		mu 0 4 887 891 892 888 
		f 4 1635 -1639 -1638 1630 
		mu 0 4 888 892 893 889 
		f 4 1637 -1640 -1633 1631 
		mu 0 4 889 893 890 886 
		f 4 1640 1642 -1642 -1635 
		mu 0 4 890 894 895 891 
		f 4 1641 1644 -1644 -1637 
		mu 0 4 891 895 896 892 
		f 4 1643 -1647 -1646 1638 
		mu 0 4 892 896 897 893 
		f 4 1645 -1648 -1641 1639 
		mu 0 4 893 897 894 890 
		f 4 1648 1650 -1650 -1643 
		mu 0 4 894 898 899 895 
		f 4 1649 1652 -1652 -1645 
		mu 0 4 895 899 900 896 
		f 4 1651 -1655 -1654 1646 
		mu 0 4 896 900 901 897 
		f 4 1653 -1656 -1649 1647 
		mu 0 4 897 901 898 894 
		f 4 1656 1658 -1658 -1651 
		mu 0 4 898 902 903 899 
		f 4 1657 1660 -1660 -1653 
		mu 0 4 899 903 904 900 
		f 4 1659 -1663 -1662 1654 
		mu 0 4 900 904 905 901 
		f 4 1661 -1664 -1657 1655 
		mu 0 4 901 905 902 898 
		f 4 1664 1666 -1666 -1659 
		mu 0 4 902 847 850 903 
		f 4 1665 1668 -1668 -1661 
		mu 0 4 903 850 849 904 
		f 4 1667 -1671 -1670 1662 
		mu 0 4 904 849 848 905 
		f 4 1669 -1672 -1665 1663 
		mu 0 4 905 848 847 902 
		f 4 1673 -1675 -1673 1610 
		mu 0 4 878 906 907 879 
		f 4 1672 1676 -1676 -1613 
		mu 0 4 879 907 908 880 
		f 4 1675 1678 -1678 -1615 
		mu 0 4 880 908 909 881 
		f 4 1677 -1680 -1674 1615 
		mu 0 4 881 909 906 878 
		f 4 1681 -1683 -1681 1674 
		mu 0 4 906 910 911 907 
		f 4 1680 1684 -1684 -1677 
		mu 0 4 907 911 912 908 
		f 4 1683 1686 -1686 -1679 
		mu 0 4 908 912 913 909 
		f 4 1685 -1688 -1682 1679 
		mu 0 4 909 913 910 906 
		f 4 1689 -1691 -1689 1682 
		mu 0 4 910 914 915 911 
		f 4 1688 1692 -1692 -1685 
		mu 0 4 911 915 916 912 
		f 4 1691 1694 -1694 -1687 
		mu 0 4 912 916 917 913 
		f 4 1693 -1696 -1690 1687 
		mu 0 4 913 917 914 910 
		f 4 1697 -1699 -1697 1690 
		mu 0 4 914 918 919 915 
		f 4 1696 1700 -1700 -1693 
		mu 0 4 915 919 920 916 
		f 4 1699 1702 -1702 -1695 
		mu 0 4 916 920 921 917 
		f 4 1701 -1704 -1698 1695 
		mu 0 4 917 921 918 914 
		f 4 1705 -1707 -1705 1698 
		mu 0 4 918 922 923 919 
		f 4 1704 1708 -1708 -1701 
		mu 0 4 919 923 924 920 
		f 4 1707 1710 -1710 -1703 
		mu 0 4 920 924 925 921 
		f 4 1709 -1712 -1706 1703 
		mu 0 4 921 925 922 918 
		f 4 1713 -1715 -1713 1706 
		mu 0 4 922 843 846 923 
		f 4 1712 1716 -1716 -1709 
		mu 0 4 923 846 845 924 
		f 4 1715 1718 -1718 -1711 
		mu 0 4 924 845 844 925 
		f 4 1717 -1720 -1714 1711 
		mu 0 4 925 844 843 922 
		f 4 1720 1722 -1722 -1619 
		mu 0 4 882 926 927 883 
		f 4 1721 -1725 -1724 1620 
		mu 0 4 883 927 928 884 
		f 4 1723 -1727 -1726 1622 
		mu 0 4 884 928 929 885 
		f 4 1725 -1728 -1721 1623 
		mu 0 4 885 929 926 882 
		f 4 1728 1730 -1730 -1723 
		mu 0 4 926 930 931 927 
		f 4 1729 -1733 -1732 1724 
		mu 0 4 927 931 932 928 
		f 4 1731 -1735 -1734 1726 
		mu 0 4 928 932 933 929 
		f 4 1733 -1736 -1729 1727 
		mu 0 4 929 933 930 926 
		f 4 1736 1738 -1738 -1731 
		mu 0 4 930 934 935 931 
		f 4 1737 -1741 -1740 1732 
		mu 0 4 931 935 936 932 
		f 4 1739 -1743 -1742 1734 
		mu 0 4 932 936 937 933 
		f 4 1741 -1744 -1737 1735 
		mu 0 4 933 937 934 930 
		f 4 1744 1746 -1746 -1739 
		mu 0 4 934 938 939 935 
		f 4 1745 -1749 -1748 1740 
		mu 0 4 935 939 940 936 
		f 4 1747 -1751 -1750 1742 
		mu 0 4 936 940 941 937 
		f 4 1749 -1752 -1745 1743 
		mu 0 4 937 941 938 934 
		f 4 1752 1754 -1754 -1747 
		mu 0 4 938 942 943 939 
		f 4 1753 -1757 -1756 1748 
		mu 0 4 939 943 944 940 
		f 4 1755 -1759 -1758 1750 
		mu 0 4 940 944 945 941 
		f 4 1757 -1760 -1753 1751 
		mu 0 4 941 945 942 938 
		f 4 1760 1762 -1762 -1755 
		mu 0 4 942 868 871 943 
		f 4 1761 -1765 -1764 1756 
		mu 0 4 943 871 870 944 
		f 4 1763 -1767 -1766 1758 
		mu 0 4 944 870 869 945 
		f 4 1765 -1768 -1761 1759 
		mu 0 4 945 869 868 942 
		f 4 1769 -1407 -1769 1770 
		mu 0 4 746 761 764 747 
		f 4 1771 -1408 -1770 1772 
		mu 0 4 750 776 761 746 
		f 4 1773 -1412 -1772 1774 
		mu 0 4 757 775 776 750 
		f 4 1775 -1411 -1774 1776 
		mu 0 4 756 772 775 757 
		f 4 1777 -1414 -1776 1778 
		mu 0 4 759 778 772 756 
		f 4 1779 -1413 -1778 1780 
		mu 0 4 753 771 778 759 
		f 4 1781 -1410 -1780 1782 
		mu 0 4 751 769 771 753 
		f 4 1768 -1409 -1782 1783 
		mu 0 4 747 764 769 751 
		f 4 947 1784 -1383 1785 
		mu 0 4 946 947 948 949 
		f 4 -952 1786 1380 -1785 
		mu 0 4 950 951 952 953 
		f 4 953 1787 -1382 -1787 
		mu 0 4 954 955 956 957 
		f 4 959 1788 -1386 -1788 
		mu 0 4 958 959 960 961 
		f 4 960 1789 -1385 -1789 
		mu 0 4 962 963 964 965 
		f 4 -950 -1786 1383 1790 
		mu 0 4 966 967 968 969 
		f 4 -958 -1791 1386 1791 
		mu 0 4 970 971 972 973 
		f 4 -957 -1792 1387 -1790 
		mu 0 4 974 975 976 977 
		f 4 652 1793 1808 -1793 
		mu 0 4 978 979 980 981 
		f 4 654 1794 1809 -1794 
		mu 0 4 979 1855 982 980 
		f 4 -657 1792 1810 -1796 
		mu 0 4 983 978 981 984 
		f 4 -659 1795 1811 -1797 
		mu 0 4 396 983 984 985 
		f 4 660 1797 1812 -1795 
		mu 0 4 1856 1857 986 982 
		f 4 -663 1798 1813 -1798 
		mu 0 4 1858 1859 987 986 
		f 4 664 1799 1814 -1799 
		mu 0 4 1860 395 988 987 
		f 4 -666 1796 1815 -1800 
		mu 0 4 395 396 985 988 
		f 4 -1809 1801 1848 -1801 
		mu 0 4 981 980 989 990 
		f 4 -1810 1802 1849 -1802 
		mu 0 4 980 982 991 989 
		f 4 -1811 1800 1850 -1804 
		mu 0 4 984 981 990 992 
		f 4 -1812 1803 1851 -1805 
		mu 0 4 985 984 992 993 
		f 4 -1813 1805 1852 -1803 
		mu 0 4 982 986 994 991 
		f 4 -1814 1806 1853 -1806 
		mu 0 4 986 987 995 994 
		f 4 -1815 1807 1854 -1807 
		mu 0 4 987 988 996 995 
		f 4 -1816 1804 1855 -1808 
		mu 0 4 988 985 993 996 
		f 4 -1825 1817 1880 -1817 
		mu 0 4 997 998 999 1000 
		f 4 -1826 1818 1881 -1818 
		mu 0 4 998 1001 1002 999 
		f 4 -1827 1816 1882 -1820 
		mu 0 4 1003 997 1000 1004 
		f 4 -1828 1819 1883 -1821 
		mu 0 4 1005 1003 1004 1006 
		f 4 -1829 1821 1884 -1819 
		mu 0 4 1001 1007 1008 1002 
		f 4 -1830 1822 1885 -1822 
		mu 0 4 1007 1009 1010 1008 
		f 4 -1831 1823 1886 -1823 
		mu 0 4 1009 1011 1012 1010 
		f 4 -1832 1820 1887 -1824 
		mu 0 4 1011 1005 1006 1012 
		f 4 -1849 1841 1824 -1841 
		mu 0 4 990 989 998 997 
		f 4 -1850 1842 1825 -1842 
		mu 0 4 989 991 1001 998 
		f 4 -1851 1840 1826 -1844 
		mu 0 4 992 990 997 1003 
		f 4 -1852 1843 1827 -1845 
		mu 0 4 993 992 1003 1005 
		f 4 -1853 1845 1828 -1843 
		mu 0 4 991 994 1007 1001 
		f 4 -1854 1846 1829 -1846 
		mu 0 4 994 995 1009 1007 
		f 4 -1855 1847 1830 -1847 
		mu 0 4 995 996 1011 1009 
		f 4 -1856 1844 1831 -1848 
		mu 0 4 996 993 1005 1011 
		f 4 -1865 1857 1832 -1857 
		mu 0 4 1021 1022 1014 1013 
		f 4 -1866 1858 1833 -1858 
		mu 0 4 1022 1023 1015 1014 
		f 4 -1867 1856 1834 -1860 
		mu 0 4 1024 1021 1013 1016 
		f 4 -1868 1859 1835 -1861 
		mu 0 4 1025 1024 1016 1017 
		f 4 -1869 1861 1836 -1859 
		mu 0 4 1023 1026 1018 1015 
		f 4 -1870 1862 1837 -1862 
		mu 0 4 1026 1027 1019 1018 
		f 4 -1871 1863 1838 -1863 
		mu 0 4 1027 1028 1020 1019 
		f 4 -1872 1860 1839 -1864 
		mu 0 4 1028 1025 1017 1020 
		f 4 -1881 1873 1864 -1873 
		mu 0 4 1000 999 1022 1021 
		f 4 -1882 1874 1865 -1874 
		mu 0 4 999 1002 1023 1022 
		f 4 -1883 1872 1866 -1876 
		mu 0 4 1004 1000 1021 1024 
		f 4 -1884 1875 1867 -1877 
		mu 0 4 1006 1004 1024 1025 
		f 4 -1885 1877 1868 -1875 
		mu 0 4 1002 1008 1026 1023 
		f 4 -1886 1878 1869 -1878 
		mu 0 4 1008 1010 1027 1026 
		f 4 -1887 1879 1870 -1879 
		mu 0 4 1010 1012 1028 1027 
		f 4 -1888 1876 1871 -1880 
		mu 0 4 1012 1006 1025 1028 
		f 4 457 1888 -635 1889 
		mu 0 4 1029 1030 1031 1032 
		f 4 -634 1890 456 -1890 
		mu 0 4 1033 1034 1035 1036 
		f 4 626 1891 -459 -1891 
		mu 0 4 1037 1038 1039 1040 
		f 4 627 1892 -460 -1892 
		mu 0 4 1041 1042 1043 1044 
		f 4 639 1893 -464 -1893 
		mu 0 4 1045 1046 1047 1048 
		f 4 -641 1894 462 -1894 
		mu 0 4 1049 1050 1051 1052 
		f 4 646 1895 -462 -1895 
		mu 0 4 1053 1054 1055 1056 
		f 4 -1896 -645 -1889 460 
		mu 0 4 1057 1058 1059 1060 
		f 4 -384 1896 -571 2007 
		mu 0 4 1061 1062 1063 1064 
		f 4 2036 -2009 2006 373 
		mu 0 4 1235 1226 1218 1065 
		f 4 2013 2029 2028 -2007 
		mu 0 4 1219 1227 1231 1070 
		f 4 2005 2004 -369 -2004 
		mu 0 4 1215 1216 1075 1076 
		f 4 -6 -1965 1900 -1966 
		mu 0 4 1078 1077 1190 1191 
		f 4 -1936 -1934 1934 1971 
		mu 0 4 1079 1080 1081 1082 
		f 4 1945 1947 -386 -1937 
		mu 0 4 1083 1084 1085 1086 
		f 4 557 1903 387 -1903 
		mu 0 4 1087 1088 1089 1090 
		f 4 550 568 -1897 -1904 
		mu 0 4 1091 1092 1093 1094 
		f 4 -19 1904 520 1905 
		mu 0 4 1095 1096 1097 1098 
		f 4 -20 1906 521 -1905 
		mu 0 4 1099 1100 1101 1102 
		f 4 -23 1907 524 -1907 
		mu 0 4 1103 1104 1105 1106 
		f 4 -24 1908 525 -1908 
		mu 0 4 1107 1108 1109 1110 
		f 4 -25 1909 526 -1909 
		mu 0 4 1111 1112 1113 1114 
		f 4 -26 1910 527 -1910 
		mu 0 4 1115 1116 1117 1118 
		f 4 -22 1911 523 -1911 
		mu 0 4 1119 1120 1121 1122 
		f 4 -21 -1906 522 -1912 
		mu 0 4 1123 1124 1125 1126 
		f 4 -1914 -414 -372 369 
		mu 0 4 233 232 198 235 
		f 4 382 -1916 -370 370 
		mu 0 4 203 1127 1128 204 
		f 4 1955 1954 -1919 -1953 
		mu 0 4 1129 1130 1131 1132 
		f 4 1939 1963 1951 1920 
		mu 0 4 1133 1134 1135 1136 
		f 4 1953 1952 -1922 -1952 
		mu 0 4 1135 1129 1132 1136 
		f 4 1959 1958 1924 -1957 
		mu 0 4 1137 1138 1139 1140 
		f 4 1961 1960 -1926 -1959 
		mu 0 4 1138 1141 1142 1139 
		f 4 1957 1956 1926 -1955 
		mu 0 4 1143 1137 1140 1144 
		f 3 1965 -1915 -1967 
		mu 0 3 1145 1192 1147 
		f 4 1972 -1927 1932 1935 
		mu 0 4 1079 1144 1140 1080 
		f 4 1921 1928 -1931 -1930 
		mu 0 4 1136 1132 1160 1161 
		f 4 -1925 1931 1933 -1933 
		mu 0 4 1140 1139 1081 1080 
		f 4 1925 1938 1943 -1932 
		mu 0 4 1139 1142 1162 1081 
		f 4 1974 1975 -1978 -1979 
		mu 0 4 1163 1164 1165 1166 
		f 4 -1982 -1983 1977 1983 
		mu 0 4 1167 1168 1166 1169 
		f 4 1985 -1988 1988 -1976 
		mu 0 4 1170 1171 1172 1169 
		f 4 -1921 1929 -1942 1940 
		mu 0 4 1133 1136 1161 1173 
		f 4 -1935 -1944 1942 1969 
		mu 0 4 1082 1081 1162 1174 
		f 4 548 1948 -1946 -1902 
		mu 0 4 1175 1176 1084 1083 
		f 5 -1950 -1947 1944 -415 -416 
		mu 0 5 232 231 1177 207 206 
		f 4 -1949 1902 -1945 -1948 
		mu 0 4 1084 1176 1178 1085 
		f 4 385 1946 -1951 1927 
		mu 0 4 1179 1177 231 230 
		f 4 1915 1916 -1954 -1920 
		mu 0 4 1128 1127 1129 1135 
		f 4 1914 1917 -1956 -1917 
		mu 0 4 1127 1180 1130 1129 
		f 4 -1901 1923 -1958 -1918 
		mu 0 4 1181 1182 1137 1143 
		f 4 -546 1922 -1960 -1924 
		mu 0 4 1182 1183 1138 1137 
		f 4 1901 1937 -1962 -1923 
		mu 0 4 1183 1184 1141 1138 
		f 4 1991 1992 -1975 -1994 
		mu 0 4 1185 1186 1164 1163 
		f 4 -1996 -1997 -1986 -1993 
		mu 0 4 1187 1188 1171 1170 
		f 4 -1964 1962 -1913 1919 
		mu 0 4 1135 1134 1189 1128 
		f 4 -1999 -1984 -1989 -2000 
		mu 0 4 1193 1167 1169 1172 
		f 4 -1969 -1970 1967 1941 
		mu 0 4 1161 1082 1174 1173 
		f 4 -1971 -1972 1968 1930 
		mu 0 4 1160 1079 1082 1161 
		f 4 -1929 1918 -1973 1970 
		mu 0 4 1160 1132 1144 1079 
		f 4 -1961 1973 1978 -1977 
		mu 0 4 1142 1141 1163 1166 
		f 4 -1943 1979 1981 -1981 
		mu 0 4 1174 1162 1168 1167 
		f 4 -1939 1976 1982 -1980 
		mu 0 4 1162 1142 1166 1168 
		f 4 -1940 1986 1987 -1985 
		mu 0 4 1134 1133 1172 1171 
		f 4 1936 1990 -1992 -1990 
		mu 0 4 1184 1194 1186 1185 
		f 4 -1938 1989 1993 -1974 
		mu 0 4 1141 1184 1185 1163 
		f 4 -1928 1994 1995 -1991 
		mu 0 4 1195 1189 1188 1187 
		f 4 -1963 1984 1996 -1995 
		mu 0 4 1189 1134 1171 1188 
		f 4 -1968 1980 1998 -1998 
		mu 0 4 1173 1174 1167 1193 
		f 4 -1941 1997 1999 -1987 
		mu 0 4 1133 1173 1193 1172 
		f 4 922 2000 -5 2001 
		mu 0 4 1204 1205 1206 1207 
		f 4 -589 2002 2 -2001 
		mu 0 4 1208 1209 1210 1211 
		f 4 -2017 2043 -582 1898 
		mu 0 4 1222 1229 1242 1072 
		f 4 555 1899 -2011 -1899 
		mu 0 4 1073 1074 1224 1223 
		f 4 -2015 2024 2075 -2028 
		mu 0 4 1230 1227 1268 1269 
		f 4 -2014 2020 2074 -2025 
		mu 0 4 1227 1219 1257 1268 
		f 4 -2018 2027 2076 -2020 
		mu 0 4 1214 1230 1269 1271 
		f 4 -2030 2014 2045 2044 
		mu 0 4 1231 1227 1230 1243 
		f 4 2046 2047 -2031 -2045 
		mu 0 4 1244 1245 1233 1232 
		f 4 2031 398 -2033 -2034 
		mu 0 4 1233 209 210 1234 
		f 6 -2036 2032 -425 -426 420 -2035 
		mu 0 6 1236 1234 210 212 213 214 
		f 4 2012 -2037 2038 2039 
		mu 0 4 1225 1226 1235 1237 
		f 4 -2039 2034 -2008 582 
		mu 0 4 1237 1235 1066 1067 ;
	setAttr ".fc[1000:1415]"
		f 4 -2040 2037 1897 -2012 
		mu 0 4 1225 1237 1068 1220 
		f 4 -2042 -2010 -1898 -2041 
		mu 0 4 1240 1228 1221 1071 
		f 4 -2044 -2016 2041 -2043 
		mu 0 4 1242 1229 1228 1240 
		f 4 -2046 2017 2003 372 
		mu 0 4 1243 1230 1214 1069 
		f 4 2048 -2032 -2048 2049 
		mu 0 4 1246 209 1233 1245 
		f 5 389 -2050 -2047 -373 367 
		mu 0 5 193 1246 1245 1244 194 
		f 4 2050 -378 -2056 -2052 
		mu 0 4 1247 192 199 1250 
		f 4 2056 2055 375 -2055 
		mu 0 4 1249 1250 199 200 
		f 4 2059 2061 -2064 -2065 
		mu 0 4 1251 1252 1253 1254 
		f 4 2052 2058 -2060 -2058 
		mu 0 4 1248 1247 1252 1251 
		f 4 2051 2060 -2062 -2059 
		mu 0 4 1247 1250 1253 1252 
		f 4 -2057 2062 2063 -2061 
		mu 0 4 1250 1249 1254 1253 
		f 4 -2054 2057 2064 -2063 
		mu 0 4 1249 1248 1251 1254 
		f 4 2449 -1900 -2439 2237 
		mu 0 4 1563 1255 1256 1564 
		f 4 2008 2021 -2067 -2021 
		mu 0 4 1218 1226 1259 1258 
		f 4 -2013 2022 -2068 -2022 
		mu 0 4 1226 1225 1260 1259 
		f 4 2011 2023 -2069 -2023 
		mu 0 4 1225 1220 1261 1260 
		f 4 2009 2025 -2070 -2024 
		mu 0 4 1221 1228 1263 1262 
		f 4 2015 2026 -2071 -2026 
		mu 0 4 1228 1229 1264 1263 
		f 4 2016 2018 -2072 -2027 
		mu 0 4 1229 1222 1265 1264 
		f 4 2010 -2074 -2073 -2019 
		mu 0 4 1223 1224 1267 1266 
		f 4 -2453 2073 -2450 -2401 
		mu 0 4 1573 1267 1224 1524 
		f 4 2072 2079 -2081 -2079 
		mu 0 4 1266 1267 1273 1272 
		f 4 -2080 2452 2406 2453 
		mu 0 4 1273 1267 1573 1575 
		f 4 2066 2082 -2084 -2082 
		mu 0 4 1258 1259 1275 1274 
		f 4 2067 2084 -2086 -2083 
		mu 0 4 1259 1260 1276 1275 
		f 4 2068 2086 -2088 -2085 
		mu 0 4 1260 1261 1277 1276 
		f 4 2070 2089 -2091 -2089 
		mu 0 4 1263 1264 1279 1278 
		f 4 2069 2088 -2092 -2087 
		mu 0 4 1262 1263 1278 1280 
		f 4 2071 2078 -2093 -2090 
		mu 0 4 1264 1265 1281 1279 
		f 4 -2075 2081 2094 -2094 
		mu 0 4 1268 1257 1283 1282 
		f 4 -2076 2093 2096 -2096 
		mu 0 4 1269 1268 1282 1284 
		f 4 -2077 2095 2098 -2098 
		mu 0 4 1271 1269 1284 1285 
		f 4 -2006 2019 2077 -2101 
		mu 0 4 1216 1215 1270 1287 
		f 4 -2102 -2078 2097 2099 
		mu 0 4 1288 1287 1270 1286 
		f 4 2083 2085 2087 2102 
		mu 0 4 1289 1290 1291 1292 
		f 4 -2095 -2103 2091 2103 
		mu 0 4 1293 1294 1295 1296 
		f 4 -2097 -2104 2090 2104 
		mu 0 4 1297 1298 1299 1300 
		f 4 -2099 -2105 2092 2105 
		mu 0 4 1301 1302 1303 1304 
		f 4 -2100 -2106 2080 2106 
		mu 0 4 1305 1306 1307 1308 
		f 4 -2107 -2454 2433 -2452 
		mu 0 4 1309 1310 1613 1612 
		f 6 -2110 2108 2117 2379 2377 -2120 
		mu 0 6 1311 1316 1315 1314 1313 1312 
		f 4 -2154 2158 2157 -2133 
		mu 0 4 1317 1320 1319 1318 
		f 4 2115 -2382 -2381 -2118 
		mu 0 4 1315 1322 1321 1314 
		f 4 2134 2111 2122 2135 
		mu 0 4 1323 1326 1325 1324 
		f 4 2164 2128 -2156 2162 
		mu 0 4 1327 1330 1329 1328 
		f 4 2355 2131 -2361 -2358 
		mu 0 4 1331 1334 1333 1332 
		f 3 2114 -2363 -2132 
		mu 0 3 1334 1335 1333 
		f 4 -2158 2160 2159 2141 
		mu 0 4 1318 1319 1337 1336 
		f 4 2116 2107 -2139 -2122 
		mu 0 4 1338 1322 1340 1339 
		f 5 -2141 -2108 -2116 2130 2375 
		mu 0 5 1341 1343 1322 1315 1342 
		f 4 -2166 2167 2148 2139 
		mu 0 4 1344 1346 1345 1341 
		f 4 -2144 2120 -2136 2133 
		mu 0 4 1347 1348 1323 1324 
		f 3 2138 2146 2150 
		mu 0 3 1339 1343 1349 
		f 4 -2146 -2152 2152 2143 
		mu 0 4 1347 1351 1350 1348 
		f 4 -2147 2140 -2149 -2150 
		mu 0 4 1349 1343 1341 1345 
		f 4 -2151 2147 2151 -2145 
		mu 0 4 1339 1349 1350 1351 
		f 4 2195 2186 2193 2196 
		mu 0 4 1352 1355 1354 1353 
		f 4 -2243 -2244 -2280 -2281 
		mu 0 4 1356 1359 1358 1357 
		f 4 -2155 2153 2127 -2157 
		mu 0 4 1358 1320 1317 1328 
		f 4 -2159 -2113 -2135 2137 
		mu 0 4 1319 1320 1361 1360 
		f 4 -2161 -2138 -2121 2129 
		mu 0 4 1337 1319 1360 1362 
		f 4 2125 -2164 -2163 -2128 
		mu 0 4 1317 1363 1327 1328 
		f 4 2161 -2125 -2165 2163 
		mu 0 4 1363 1364 1330 1327 
		f 4 -2167 -2126 2132 2136 
		mu 0 4 1346 1363 1317 1318 
		f 4 -2168 -2137 -2142 2142 
		mu 0 4 1345 1346 1318 1365 
		f 4 -2153 2168 2170 -2170 
		mu 0 4 1348 1350 1367 1366 
		f 4 -2148 2171 2172 -2169 
		mu 0 4 1350 1349 1368 1367 
		f 4 2149 2173 -2175 -2172 
		mu 0 4 1349 1345 1369 1368 
		f 4 -2143 2175 2176 -2174 
		mu 0 4 1345 1365 1370 1369 
		f 4 -2160 2177 2178 -2176 
		mu 0 4 1365 1372 1371 1370 
		f 4 -2130 2169 2179 -2178 
		mu 0 4 1372 1348 1366 1371 
		f 4 -2171 2180 2182 -2182 
		mu 0 4 1366 1367 1374 1373 
		f 4 -2173 2183 2184 -2181 
		mu 0 4 1367 1368 1355 1374 
		f 4 2174 2185 -2187 -2184 
		mu 0 4 1368 1369 1354 1355 
		f 4 -2177 2187 2188 -2186 
		mu 0 4 1369 1370 1375 1354 
		f 4 -2179 2189 2190 -2188 
		mu 0 4 1370 1371 1376 1375 
		f 4 -2180 2181 2191 -2190 
		mu 0 4 1371 1366 1373 1376 
		f 4 -2183 -2185 -2196 -2193 
		mu 0 4 1373 1374 1355 1352 
		f 4 -2195 -2194 -2189 -2191 
		mu 0 4 1376 1353 1354 1375 
		f 4 2192 -2197 2194 -2192 
		mu 0 4 1373 1352 1353 1376 
		f 4 2215 -2213 2210 2204 
		mu 0 4 1377 1380 1379 1378 
		f 4 2218 -2218 2216 2206 
		mu 0 4 1381 1384 1383 1382 
		f 5 2233 2364 -2232 -2206 2207 
		mu 0 5 1385 1389 1388 1387 1386 
		f 4 2208 -2210 -2198 2200 
		mu 0 4 1390 1393 1392 1391 
		f 4 2212 -2214 -2199 2201 
		mu 0 4 1379 1380 1395 1394 
		f 4 2214 -2216 2211 -2 
		mu 0 4 1397 1380 1377 1398 
		f 4 2217 -3 -2200 2202 
		mu 0 4 1383 1384 1400 1399 
		f 3 4 -2219 -2393 
		mu 0 3 1401 1384 1381 
		f 4 2220 -2222 -2203 -2220 
		mu 0 4 1402 1405 1404 1403 
		f 4 2221 -2223 -2208 -2217 
		mu 0 4 1404 1405 1385 1386 
		f 4 2223 -2225 2219 2199 
		mu 0 4 1400 1407 1406 1399 
		f 4 2224 -2226 -2205 2203 
		mu 0 4 1406 1407 1377 1378 
		f 4 2225 -2227 3 -2212 
		mu 0 4 1377 1407 1408 1398 
		f 4 2228 -2230 2227 2197 
		mu 0 4 1409 1412 1411 1410 
		f 4 2229 -2231 -2207 2205 
		mu 0 4 1411 1412 1381 1382 
		f 6 2231 -2368 -2370 -2233 -2201 -2228 
		mu 0 6 1387 1388 1414 1413 1390 1391 
		f 4 -2335 2222 -2235 2124 
		mu 0 4 1415 1418 1417 1416 
		f 4 -2115 -2334 2335 -2364 
		mu 0 4 1419 1422 1421 1420 
		f 4 2333 -2356 -2357 -2341 
		mu 0 4 1423 1426 1425 1424 
		f 4 2330 2109 -2332 -2333 
		mu 0 4 1427 1430 1429 1428 
		f 4 -2302 -2265 2263 2265 
		mu 0 4 1433 1436 1435 1434 
		f 4 2266 2126 -2278 -2276 
		mu 0 4 1437 1440 1439 1438 
		f 4 2240 -2129 -2242 -2211 
		mu 0 4 1441 1444 1443 1442 
		f 4 2241 2234 -2221 -2204 
		mu 0 4 1445 1448 1447 1446 
		f 4 -2111 2112 2154 2243 
		mu 0 4 1359 1361 1320 1358 
		f 4 -2112 2110 2245 -2124 
		mu 0 4 1325 1326 1450 1449 
		f 4 2282 2248 -2285 -2286 
		mu 0 4 1451 1454 1453 1452 
		f 4 -2251 -2282 -2294 -2270 
		mu 0 4 1455 1458 1457 1456 
		f 4 2281 2251 -2283 -2284 
		mu 0 4 1457 1458 1454 1451 
		f 4 2286 -2255 -2289 -2290 
		mu 0 4 1459 1462 1461 1460 
		f 4 2288 2255 -2291 -2292 
		mu 0 4 1460 1461 1464 1463 
		f 4 2284 -2257 -2287 -2288 
		mu 0 4 1465 1466 1462 1459 
		f 4 2440 2123 -2440 -383 
		mu 0 4 1146 1468 1469 1147 
		f 4 2441 -2123 -2441 381 
		mu 0 4 1148 1470 1471 1149 
		f 4 2442 -2134 -2442 392 
		mu 0 4 1151 1473 1472 1150 
		f 4 2145 -2443 -405 2443 
		mu 0 4 1475 1474 1152 1153 
		f 4 2144 -2444 -404 2444 
		mu 0 4 1477 1476 1154 1155 
		f 4 2121 -2445 -381 2445 
		mu 0 4 1479 1478 1156 1157 
		f 4 -2119 -2446 377 2446 
		mu 0 4 1481 1480 1158 1159 
		f 4 -2266 -2263 2256 -2303 
		mu 0 4 1433 1434 1462 1466 
		f 4 2259 2260 -2259 -2252 
		mu 0 4 1458 1483 1482 1454 
		f 4 2262 -2264 -2262 2254 
		mu 0 4 1462 1434 1435 1461 
		f 4 2261 -2274 -2269 -2256 
		mu 0 4 1461 1435 1484 1464 
		f 4 2308 2307 -2306 -2305 
		mu 0 4 1485 1488 1487 1486 
		f 4 -2314 -2308 2312 2311 
		mu 0 4 1489 1491 1488 1490 
		f 4 2305 -2319 2317 -2316 
		mu 0 4 1492 1491 1494 1493 
		f 4 -2271 2271 -2260 2250 
		mu 0 4 1455 1495 1483 1458 
		f 4 -2300 -2273 2273 2264 
		mu 0 4 1436 1496 1484 1435 
		f 4 2239 2275 -2279 -2202 
		mu 0 4 1497 1437 1438 1498 
		f 5 2156 2155 -2275 2276 2279 
		mu 0 5 1358 1328 1329 1499 1357 
		f 4 2277 2274 -2241 2278 
		mu 0 4 1438 1439 1500 1498 
		f 4 -2258 2280 -2277 -2127 
		mu 0 4 1501 1356 1357 1499 
		f 4 2249 2283 -2247 -2246 
		mu 0 4 1450 1457 1451 1449 
		f 4 2246 2285 -2248 -2245 
		mu 0 4 1449 1451 1452 1502 
		f 4 2247 2287 -2254 2238 
		mu 0 4 1503 1465 1459 1504 
		f 4 2253 2289 -2253 2198 
		mu 0 4 1504 1459 1460 1505 
		f 4 2252 2291 -2268 -2240 
		mu 0 4 1505 1460 1463 1506 
		f 4 2323 2304 -2323 -2322 
		mu 0 4 1507 1485 1486 1508 
		f 4 2322 2315 2326 2325 
		mu 0 4 1509 1492 1493 1510 
		f 4 -2250 2242 -2293 2293 
		mu 0 4 1457 1450 1511 1456 
		f 4 2213 -2215 -1 -2295 
		mu 0 4 1395 1380 1397 1396 
		f 4 2295 -2239 2294 5 
		mu 0 4 1432 1513 1512 1431 
		f 3 -2297 1966 2439 
		mu 0 3 1469 1624 1147 
		f 3 2296 2244 -2296 
		mu 0 3 1467 1469 1514 
		f 4 2329 2318 2313 2328 
		mu 0 4 1515 1494 1491 1489 
		f 4 -2272 -2298 2299 2298 
		mu 0 4 1483 1495 1496 1436 
		f 4 -2261 -2299 2301 2300 
		mu 0 4 1482 1483 1436 1433 
		f 4 -2301 2302 -2249 2258 
		mu 0 4 1482 1433 1466 1454 
		f 4 2306 -2309 -2304 2290 
		mu 0 4 1464 1488 1485 1463 
		f 4 2310 -2312 -2310 2272 
		mu 0 4 1496 1489 1490 1484 
		f 4 2309 -2313 -2307 2268 
		mu 0 4 1484 1490 1488 1464 
		f 4 2314 -2318 -2317 2269 
		mu 0 4 1456 1493 1494 1455 
		f 4 2319 2321 -2321 -2267 
		mu 0 4 1506 1507 1508 1516 
		f 4 2303 -2324 -2320 2267 
		mu 0 4 1463 1485 1507 1506 
		f 4 2320 -2326 -2325 2257 
		mu 0 4 1517 1509 1510 1511 
		f 4 2324 -2327 -2315 2292 
		mu 0 4 1511 1510 1493 1456 
		f 4 2327 -2329 -2311 2297 
		mu 0 4 1495 1515 1489 1496 
		f 4 2316 -2330 -2328 2270 
		mu 0 4 1455 1494 1515 1495 
		f 4 -2237 2232 -2371 2343 
		mu 0 4 1518 1521 1520 1519 
		f 4 2236 2337 -2238 -2209 
		mu 0 4 1522 1525 1524 1523 
		f 4 2450 -2428 -2449 2100 
		mu 0 4 1287 1526 1428 1216 
		f 4 2354 -2403 -2352 2341 
		mu 0 4 1527 1529 1528 1424 
		f 4 2351 -2402 -2348 2340 
		mu 0 4 1424 1528 1530 1423 
		f 4 2346 -2404 -2355 2344 
		mu 0 4 1531 1532 1529 1527 
		f 4 -2372 -2373 -2342 2356 
		mu 0 4 1425 1533 1527 1424 
		f 4 2371 2357 -2375 -2374 
		mu 0 4 1534 1331 1332 1535 
		f 4 2360 2359 -2140 -2359 
		mu 0 4 1332 1333 1344 1341 
		f 6 2361 -2162 2166 2165 -2360 2362 
		mu 0 6 1335 1364 1363 1346 1344 1333 
		f 4 -2367 -2366 2363 -2340 
		mu 0 4 1536 1537 1419 1420 
		f 4 -2234 2334 -2362 2365 
		mu 0 4 1537 1539 1538 1419 
		f 4 2338 -2236 -2365 2366 
		mu 0 4 1536 1541 1540 1537 
		f 4 2367 2235 2336 2368 
		mu 0 4 1542 1545 1544 1543 
		f 4 2369 -2369 2342 2370 
		mu 0 4 1520 1542 1543 1519 
		f 4 -2114 -2331 -2345 2372 
		mu 0 4 1533 1546 1531 1527 
		f 4 -2377 2374 2358 -2376 
		mu 0 4 1342 1535 1332 1341 
		f 5 -2109 2113 2373 2376 -2131 
		mu 0 5 1315 1316 1534 1535 1342 
		f 4 2378 2382 2118 -2378 
		mu 0 4 1313 1547 1338 1312 
		f 4 2381 -2117 -2383 -2384 
		mu 0 4 1321 1322 1338 1547 
		f 4 2391 2390 -2389 -2387 
		mu 0 4 1548 1551 1550 1549 
		f 4 2384 2386 -2386 -2380 
		mu 0 4 1314 1548 1549 1313 
		f 4 2385 2388 -2388 -2379 
		mu 0 4 1313 1549 1550 1547 
		f 4 2387 -2391 -2390 2383 
		mu 0 4 1547 1550 1551 1321 
		f 4 2389 -2392 -2385 2380 
		mu 0 4 1321 1551 1548 1314 
		f 4 2119 -2447 -379 2447 
		mu 0 4 1553 1552 1212 1213 
		f 4 2448 2331 -2448 -2005 
		mu 0 4 1217 1555 1554 1196 
		f 4 -2438 2209 2438 -557 
		mu 0 4 1198 1557 1556 1197 
		f 4 -2229 2437 577 -2437 
		mu 0 4 1559 1558 1199 1200 
		f 4 2230 2436 -580 -2436 
		mu 0 4 1561 1560 1201 1202 
		f 4 2347 2393 -2349 -2336 
		mu 0 4 1421 1566 1565 1420 
		f 4 2348 2394 -2350 2339 
		mu 0 4 1420 1565 1567 1536 
		f 4 2349 2395 -2351 -2339 
		mu 0 4 1536 1567 1568 1541 
		f 4 2350 2396 -2353 -2337 
		mu 0 4 1544 1570 1569 1543 
		f 4 2352 2397 -2354 -2343 
		mu 0 4 1543 1569 1571 1519 
		f 4 2353 2398 -2346 -2344 
		mu 0 4 1519 1571 1572 1518 
		f 4 2345 2399 2400 -2338 
		mu 0 4 1525 1574 1573 1524 
		f 4 2405 2407 -2407 -2400 
		mu 0 4 1574 1576 1575 1573 
		f 4 2408 2410 -2410 -2394 
		mu 0 4 1566 1578 1577 1565 
		f 4 2409 2412 -2412 -2395 
		mu 0 4 1565 1577 1579 1567 
		f 4 2411 2414 -2414 -2396 
		mu 0 4 1567 1579 1580 1568 
		f 4 2415 2417 -2417 -2398 
		mu 0 4 1569 1582 1581 1571 
		f 4 2413 2418 -2416 -2397 
		mu 0 4 1570 1583 1582 1569 
		f 4 2416 2419 -2406 -2399 
		mu 0 4 1571 1581 1584 1572 
		f 4 2420 -2422 -2409 2401 
		mu 0 4 1528 1586 1585 1530 
		f 4 2422 -2424 -2421 2402 
		mu 0 4 1529 1587 1586 1528 
		f 4 2424 -2426 -2423 2403 
		mu 0 4 1532 1588 1587 1529 
		f 4 -2429 -2451 2101 2451 
		mu 0 4 1589 1526 1287 1288 
		f 4 2427 -2405 -2347 2332 
		mu 0 4 1428 1526 1590 1427 
		f 4 -2427 -2425 2404 2428 
		mu 0 4 1589 1591 1590 1526 
		f 4 -2430 -2415 -2413 -2411 
		mu 0 4 1592 1595 1594 1593 
		f 4 -2431 -2419 2429 2421 
		mu 0 4 1596 1599 1598 1597 
		f 4 -2432 -2418 2430 2423 
		mu 0 4 1600 1603 1602 1601 
		f 4 -2433 -2420 2431 2425 
		mu 0 4 1604 1607 1606 1605 
		f 4 -2434 -2408 2432 2426 
		mu 0 4 1608 1611 1610 1609 
		f 4 -593 -584 2226 2434 
		mu 0 4 1614 1615 1616 1617 
		f 4 593 -2435 -2224 -2003 
		mu 0 4 1618 1619 1620 1621 
		f 4 575 2392 2435 -2066 
		mu 0 4 1622 1623 1562 1203 
		f 4 -2456 51 -66 363 
		mu 0 4 1625 89 59 34 
		f 4 -2458 -364 -32 37 
		mu 0 4 1626 1625 34 24 
		f 3 -39 -18 -2460 
		mu 0 3 24 26 27 
		f 4 -2461 -162 355 362 
		mu 0 4 184 105 104 50 
		f 4 -2462 -363 360 -344 
		mu 0 4 185 184 50 49 
		f 4 -2455 2457 2456 -2463 
		mu 0 4 190 1625 1626 23 
		f 4 -2464 163 79 -77 
		mu 0 4 64 36 37 65 
		f 4 -140 -139 80 -2466 
		mu 0 4 94 95 33 1627 
		f 4 -2470 -89 -2471 23 
		mu 0 4 22 1629 69 25 
		f 4 -2472 88 -2469 2473 
		mu 0 4 1630 69 1629 1628 
		f 4 -2473 -2474 -2467 -81 
		mu 0 4 33 1630 1628 1627 
		f 4 52 -164 -2475 2472 
		mu 0 4 33 37 36 1630 
		f 4 22 -2476 -2468 2469 
		mu 0 4 22 17 70 1629 
		f 4 2732 2734 -2737 -2738 
		mu 0 4 1631 1634 1633 1632 
		f 4 2740 2742 -2745 -2746 
		mu 0 4 1635 1638 1637 1636 
		f 4 -2747 2747 2748 -2750 
		mu 0 4 1639 1642 1641 1640 
		f 4 -1833 2484 2495 -2484 
		mu 0 4 1643 1646 1645 1644 
		f 4 -1834 2551 2496 -2485 
		mu 0 4 1646 1648 1647 1645 
		f 4 -1835 2483 2497 -2486 
		mu 0 4 1649 1643 1644 1650 
		f 4 -1836 2485 2498 -2487 
		mu 0 4 1651 1649 1650 1652 
		f 4 2499 2832 -1839 -2834 
		mu 0 4 1653 1656 1655 1654 
		f 4 -1840 2486 2501 -2488 
		mu 0 4 1654 1651 1652 1657 
		f 4 -2496 2489 -2477 -2489 
		mu 0 4 1644 1645 1659 1658 
		f 4 -2497 2490 -2478 -2490 
		mu 0 4 1645 1647 1660 1659 
		f 4 -2498 2488 2478 -2492 
		mu 0 4 1650 1644 1658 1661 
		f 4 -2499 2491 2479 -2493 
		mu 0 4 1652 1650 1661 1662 
		f 4 -2547 2543 -2841 2838 
		mu 0 4 1663 1666 1665 1664 
		f 4 -2501 2494 -2482 -2494 
		mu 0 4 1653 1657 1668 1667 
		f 4 -2502 2492 2482 -2495 
		mu 0 4 1657 1652 1662 1668 
		f 4 -2849 -2846 -2545 -2546 
		mu 0 4 1669 1672 1671 1670 
		f 4 2516 -2532 2533 2532 
		mu 0 4 1673 1676 1675 1674 
		f 4 2522 2521 -2506 -2479 
		mu 0 4 1658 1678 1677 1661 
		f 4 2511 2530 -2509 -2518 
		mu 0 4 1679 1681 1680 1676 
		f 5 2816 2821 2823 2822 2806 
		mu 0 5 1682 1686 1685 1684 1683 
		f 5 2510 2553 2476 2502 -2521 
		mu 0 5 1687 1689 1658 1659 1688 
		f 4 -2525 -2480 2505 2509 
		mu 0 4 1690 1662 1661 1677 
		f 4 2555 2524 2523 -2555 
		mu 0 4 1691 1662 1690 1692 
		f 4 -2528 2481 2512 -2527 
		mu 0 4 1693 1667 1668 1694 
		f 4 -2504 -2503 2477 2535 
		mu 0 4 1695 1688 1659 1660 
		f 5 2528 2515 2554 -2530 -2531 
		mu 0 5 1681 1696 1691 1692 1680 
		f 5 -2534 -2508 -2553 -2511 2504 
		mu 0 5 1674 1675 1697 1689 1687 
		f 4 -2535 -2536 -2537 -2538 
		mu 0 4 1698 1695 1660 1699 
		f 4 -2539 2536 2480 2519 
		mu 0 4 1700 1699 1660 1701 
		f 5 -2828 -2827 -2517 2539 2537 
		mu 0 5 1699 1702 1676 1673 1698 
		f 4 2549 -2549 2546 -2519 
		mu 0 4 1701 1703 1666 1663 
		f 4 -2544 2548 -2842 -2843 
		mu 0 4 1665 1666 1703 1704 
		f 4 -2548 -2550 -2481 -2491 
		mu 0 4 1647 1703 1701 1660 
		f 4 -2833 2830 2544 -2845 
		mu 0 4 1655 1656 1670 1671 
		f 3 2547 -2552 -2850 
		mu 0 3 1703 1647 1648 
		f 4 2552 2506 -2523 -2554 
		mu 0 4 1689 1697 1678 1658 
		f 5 2525 -2513 -2483 -2556 -2516 
		mu 0 5 1696 1694 1668 1662 1691 
		f 4 -2522 2556 2558 -2558 
		mu 0 4 1677 1678 1706 1705 
		f 4 -2507 2559 2560 -2557 
		mu 0 4 1678 1697 1707 1706 
		f 4 2507 2561 -2563 -2560 
		mu 0 4 1697 1675 1708 1707 
		f 4 2531 2563 -2565 -2562 
		mu 0 4 1675 1676 1709 1708 
		f 4 2508 2565 -2567 -2564 
		mu 0 4 1676 1680 1710 1709 
		f 4 2529 2567 -2569 -2566 
		mu 0 4 1680 1692 1711 1710 
		f 4 -2524 2569 2570 -2568 
		mu 0 4 1692 1690 1712 1711 
		f 4 -2510 2557 2571 -2570 
		mu 0 4 1690 1677 1705 1712 
		f 4 -2573 2520 2573 -2575 
		mu 0 4 1713 1687 1688 1714 
		f 4 2503 2575 -2577 -2574 
		mu 0 4 1688 1695 1715 1714 
		f 4 2534 2577 -2579 -2576 
		mu 0 4 1695 1698 1716 1715 
		f 4 -2578 -2540 2579 2580 
		mu 0 4 1716 1698 1673 1717 
		f 4 -2533 2581 2582 -2580 
		mu 0 4 1673 1674 1718 1717 
		f 4 -2505 2572 2583 -2582 
		mu 0 4 1674 1687 1713 1718 
		f 4 -2529 2584 2586 -2586 
		mu 0 4 1696 1681 1720 1719 
		f 4 -2512 2587 2588 -2585 
		mu 0 4 1681 1679 1721 1720 
		f 4 -2588 2540 2589 -2591 
		mu 0 4 1721 1679 1723 1722 
		f 4 2513 2591 -2593 -2590 
		mu 0 4 1723 1693 1724 1722 
		f 4 2526 2593 -2595 -2592 
		mu 0 4 1693 1694 1725 1724 
		f 4 -2594 -2526 2585 2595 
		mu 0 4 1725 1694 1696 1719 
		f 4 -2605 -2603 2541 2596 
		mu 0 4 1726 1728 1727 1700 
		f 5 -2597 -2520 2518 2597 -2599 
		mu 0 5 1726 1700 1701 1663 1729 
		f 4 -2600 -2598 -2839 -2840 
		mu 0 4 1730 1729 1663 1664 
		f 4 -2601 2514 2602 -2604 
		mu 0 4 1731 1732 1727 1728 
		f 4 -2615 -2613 2604 2605 
		mu 0 4 1733 1734 1728 1726 
		f 4 -2606 2598 2606 -2608 
		mu 0 4 1733 1726 1729 1735 
		f 4 2599 2608 -2610 -2607 
		mu 0 4 1729 1730 1736 1735 
		f 4 -2602 2610 2611 -2609 
		mu 0 4 1730 1731 1737 1736 
		f 4 -2611 2603 2612 -2614 
		mu 0 4 1737 1731 1728 1734 
		f 4 -2625 -2623 2614 2615 
		mu 0 4 1738 1739 1734 1733 
		f 4 -2616 2607 2616 -2618 
		mu 0 4 1738 1733 1735 1740 
		f 4 2609 2618 -2620 -2617 
		mu 0 4 1735 1736 1685 1740 
		f 4 -2612 2620 2621 -2619 
		mu 0 4 1736 1737 1741 1685 
		f 4 -2621 2613 2622 -2624 
		mu 0 4 1741 1737 1734 1739 
		f 4 -2627 2574 2627 -2629 
		mu 0 4 1742 1713 1714 1743 
		f 4 2576 2629 -2631 -2628 
		mu 0 4 1714 1715 1744 1743 
		f 4 2578 2631 -2633 -2630 
		mu 0 4 1715 1716 1745 1744 
		f 4 -2632 -2581 2633 2634 
		mu 0 4 1745 1716 1717 1746 
		f 4 -2583 2635 2636 -2634 
		mu 0 4 1717 1718 1747 1746 
		f 4 -2584 2626 2637 -2636 
		mu 0 4 1718 1713 1742 1747 
		f 4 -2559 2638 2640 -2640 
		mu 0 4 1705 1706 1749 1748 
		f 4 -2561 2641 2642 -2639 
		mu 0 4 1706 1707 1750 1749 
		f 4 2562 2643 -2645 -2642 
		mu 0 4 1707 1708 1751 1750 
		f 4 2564 2645 -2647 -2644 
		mu 0 4 1708 1709 1752 1751 
		f 4 2566 2647 -2649 -2646 
		mu 0 4 1709 1710 1753 1752 
		f 4 2568 2649 -2651 -2648 
		mu 0 4 1710 1711 1754 1753 
		f 4 -2571 2651 2652 -2650 
		mu 0 4 1711 1712 1755 1754 
		f 4 -2572 2639 2653 -2652 
		mu 0 4 1712 1705 1748 1755 
		f 4 -2587 2654 2656 -2656 
		mu 0 4 1719 1720 1757 1756 
		f 4 -2589 2657 2658 -2655 
		mu 0 4 1720 1721 1758 1757 
		f 4 -2658 2590 2659 -2661 
		mu 0 4 1758 1721 1722 1759 
		f 4 2592 2661 -2663 -2660 
		mu 0 4 1722 1724 1760 1759 
		f 4 2594 2663 -2665 -2662 
		mu 0 4 1724 1725 1761 1760 
		f 4 -2664 -2596 2655 2665 
		mu 0 4 1761 1725 1719 1756 
		f 4 -2667 2628 2667 -2669 
		mu 0 4 1762 1742 1743 1763 
		f 4 2630 2669 -2671 -2668 
		mu 0 4 1743 1744 1764 1763 
		f 4 2632 2671 -2673 -2670 
		mu 0 4 1744 1745 1765 1764 
		f 4 -2672 -2635 2673 2674 
		mu 0 4 1765 1745 1746 1766 
		f 4 -2637 2675 2676 -2674 
		mu 0 4 1746 1747 1767 1766 
		f 4 -2638 2666 2677 -2676 
		mu 0 4 1747 1742 1762 1767 
		f 4 -2641 2678 2680 -2680 
		mu 0 4 1748 1749 1769 1768 
		f 4 -2643 2681 2682 -2679 
		mu 0 4 1749 1750 1770 1769 
		f 4 2644 2683 -2685 -2682 
		mu 0 4 1750 1751 1771 1770 
		f 4 2646 2685 -2687 -2684 
		mu 0 4 1751 1752 1772 1771 
		f 4 2648 2687 -2689 -2686 
		mu 0 4 1752 1753 1773 1772 
		f 4 2650 2689 -2691 -2688 
		mu 0 4 1753 1754 1774 1773 
		f 4 -2653 2691 2692 -2690 
		mu 0 4 1754 1755 1775 1774 
		f 4 -2654 2679 2693 -2692 
		mu 0 4 1755 1748 1768 1775 
		f 4 -2657 2694 2696 -2696 
		mu 0 4 1756 1757 1777 1776 
		f 4 -2659 2697 2698 -2695 
		mu 0 4 1757 1758 1778 1777 
		f 4 -2698 2660 2699 -2701 
		mu 0 4 1778 1758 1759 1779 
		f 4 2662 2701 -2703 -2700 
		mu 0 4 1759 1760 1780 1779 
		f 4 2664 2703 -2705 -2702 
		mu 0 4 1760 1761 1781 1780 
		f 4 -2704 -2666 2695 2705 
		mu 0 4 1781 1761 1756 1776 
		f 4 -2707 2668 2707 -2709 
		mu 0 4 1782 1762 1763 1783 
		f 5 -2708 2670 2672 2709 -2711 
		mu 0 5 1783 1763 1764 1765 1784 
		f 4 -2710 -2675 2711 2712 
		mu 0 4 1784 1765 1766 1785 
		f 5 -2712 -2677 -2678 2706 2713 
		mu 0 5 1785 1766 1767 1762 1782 
		f 5 -2715 -2683 2684 2715 -2717 
		mu 0 5 1786 1769 1770 1771 1787 
		f 5 -2716 2686 2688 2717 -2719 
		mu 0 5 1787 1771 1772 1773 1788 
		f 5 -2718 2690 -2693 2719 2720 
		mu 0 5 1788 1773 1774 1775 1789 
		f 5 2721 -2720 -2694 -2681 2714 
		mu 0 5 1786 1789 1775 1768 1769 
		f 5 -2723 -2697 -2699 2723 2724 
		mu 0 5 1790 1776 1777 1778 1791 
		f 4 -2724 2700 2725 -2727 
		mu 0 4 1791 1778 1779 1792 
		f 5 -2726 2702 2704 2727 -2729 
		mu 0 5 1792 1779 1780 1781 1793 
		f 4 -2728 -2706 2722 2729 
		mu 0 4 1793 1781 1776 1790 
		f 4 -2759 2762 2759 -2733 
		mu 0 4 1631 1795 1794 1634 
		f 4 -2760 2763 2760 -2735 
		mu 0 4 1634 1794 1796 1633 
		f 4 -2761 2764 2761 2736 
		mu 0 4 1633 1796 1797 1632 
		f 4 -2762 2765 2758 2737 
		mu 0 4 1632 1797 1795 1631 
		f 4 -2775 2778 2775 -2741 
		mu 0 4 1635 1799 1798 1638 
		f 4 -2776 2779 2776 -2743 
		mu 0 4 1638 1798 1800 1637 
		f 4 -2777 2780 2777 2744 
		mu 0 4 1637 1800 1801 1636 
		f 4 2745 -2778 2781 2774 
		mu 0 4 1635 1636 1801 1799 
		f 4 -2787 2790 2787 2746 
		mu 0 4 1639 1803 1802 1642 
		f 4 -2788 2791 2788 -2748 
		mu 0 4 1642 1802 1804 1641 
		f 4 -2789 2792 2789 -2749 
		mu 0 4 1641 1804 1805 1640 
		f 4 -2790 2793 2786 2749 
		mu 0 4 1640 1805 1803 1639 
		f 4 -2755 -2731 2708 2731 
		mu 0 4 1806 1807 1782 1783 
		f 4 -2756 -2732 2710 2733 
		mu 0 4 1808 1806 1783 1784 
		f 4 -2757 -2734 -2713 2735 
		mu 0 4 1809 1808 1784 1785 
		f 4 -2758 -2736 -2714 2730 
		mu 0 4 1807 1809 1785 1782 
		f 4 -2763 -2751 2754 2751 
		mu 0 4 1794 1795 1807 1806 
		f 4 -2764 -2752 2755 2752 
		mu 0 4 1796 1794 1806 1808 
		f 4 -2765 -2753 2756 2753 
		mu 0 4 1797 1796 1808 1809 
		f 4 -2766 -2754 2757 2750 
		mu 0 4 1795 1797 1809 1807 
		f 4 -2771 -2739 2716 2739 
		mu 0 4 1810 1811 1786 1787 
		f 4 -2772 -2740 2718 2741 
		mu 0 4 1812 1810 1787 1788 
		f 4 -2773 -2742 -2721 2743 
		mu 0 4 1813 1812 1788 1789 
		f 4 -2774 -2744 -2722 2738 
		mu 0 4 1811 1813 1789 1786 
		f 4 -2779 -2767 2770 2767 
		mu 0 4 1798 1799 1811 1810 
		f 4 -2780 -2768 2771 2768 
		mu 0 4 1800 1798 1810 1812 
		f 4 -2781 -2769 2772 2769 
		mu 0 4 1801 1800 1812 1813 
		f 4 -2782 -2770 2773 2766 
		mu 0 4 1799 1801 1813 1811 
		f 4 2783 2798 -2783 -2725 
		mu 0 4 1791 1815 1814 1790 
		f 4 2784 2799 -2784 2726 
		mu 0 4 1792 1816 1815 1791 
		f 4 2785 2800 -2785 2728 
		mu 0 4 1793 1817 1816 1792 
		f 4 2782 2801 -2786 -2730 
		mu 0 4 1790 1814 1817 1793 
		f 4 -2799 2795 -2791 -2795 
		mu 0 4 1814 1815 1802 1803 
		f 4 -2800 2796 -2792 -2796 
		mu 0 4 1815 1816 1804 1802 
		f 4 -2801 2797 -2793 -2797 
		mu 0 4 1816 1817 1805 1804 
		f 4 -2802 2794 -2794 -2798 
		mu 0 4 1817 1814 1803 1805 
		f 4 2815 -2803 2804 -2836 
		mu 0 4 1818 1821 1820 1819 
		f 4 -2810 -2812 -2814 -2815 
		mu 0 4 1822 1825 1824 1823 
		f 4 -2805 2807 2809 -2809 
		mu 0 4 1819 1820 1825 1822 
		f 4 -2804 2810 2811 -2808 
		mu 0 4 1820 1682 1824 1825 
		f 4 -2807 2812 2813 -2811 
		mu 0 4 1682 1683 1823 1824 
		f 4 -2806 2808 2814 -2813 
		mu 0 4 1683 1819 1822 1823 
		f 4 -2819 -2816 -2835 2624 
		mu 0 4 1738 1821 1818 1739 
		f 4 2802 2820 -2817 2803 
		mu 0 4 1820 1821 1686 1682 
		f 4 2818 2617 -2820 -2821 
		mu 0 4 1821 1738 1740 1686 
		f 3 -2822 2819 2619 
		mu 0 3 1685 1686 1740 
		f 3 -2824 -2622 2817 
		mu 0 3 1684 1685 1741 
		f 5 2517 2826 -2829 -2830 -2541 
		mu 0 5 1679 1676 1702 1826 1723 
		f 4 2827 -2838 2545 -2837 
		mu 0 4 1702 1699 1669 1670 
		f 4 -2826 2527 -2514 2829 
		mu 0 4 1826 1667 1693 1723 
		f 4 -2500 2493 2825 2831 
		mu 0 4 1656 1653 1667 1826 
		f 3 2833 2487 2500 
		mu 0 3 1653 1654 1657 
		f 4 -2825 -2818 2623 2834 
		mu 0 4 1818 1684 1741 1739 
		f 4 2805 -2823 2824 2835 
		mu 0 4 1819 1683 1684 1818 
		f 4 2836 -2831 -2832 2828 
		mu 0 4 1702 1670 1656 1826 
		f 4 2538 -2542 -2626 2837 
		mu 0 4 1699 1700 1727 1669 
		f 4 2839 -2543 2600 2601 
		mu 0 4 1730 1664 1732 1731 
		f 4 -1838 2844 2550 2843 
		mu 0 4 1827 1655 1671 1704 
		f 4 -2848 2842 -2551 2845 
		mu 0 4 1672 1665 1704 1671 
		f 4 2542 2840 2847 2846 
		mu 0 4 1732 1664 1665 1672 
		f 4 -2847 2848 2625 -2515 
		mu 0 4 1732 1672 1669 1727 
		f 4 -2844 2841 2849 -1837 
		mu 0 4 1827 1704 1703 1648 ;
createNode ikHandle -n "RAIK";
	setAttr -l on ".v";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -66.713 112.09211191036819 -7.3164499999999872 ;
	setAttr ".sp" -type "double3" -66.713 112.09211191036819 -7.3164499999999872 ;
	setAttr ".pv" -type "double3" -0.061189101718462313 -0.52324552478059272 
		-1.1445828998495351 ;
	setAttr -l on ".pvx";
	setAttr -l on ".pvy";
	setAttr -l on ".pvz";
	setAttr -l on ".off";
	setAttr -l on ".rol";
	setAttr ".roc" yes;
	setAttr -l on ".ikb";
createNode lightLinker -n "lightLinker1";
createNode brush -n "brush1";
createNode displayLayerManager -n "layerManager";
	setAttr -s 4 ".dli[1:3]"  1 2 3;
	setAttr -s 4 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
createNode renderLayer -s -n "globalRender";
createNode brush -n "Lizzard_1_slash_brush1";
createNode brush -n "Start_pose_brush1";
createNode brush -n "Lizzard__before_tipee_brush1";
createNode brush -n "lizzard__bone_work_left_arm_brush1";
createNode brush -n "Lizzard_18_rigging_brush1";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "Lizzard_16_Low_polly_brush1";
createNode brush -n "Lizzard_15_Almost_brush1";
createNode brush -n "Lizzard_13_brush1";
createNode brush -n "Lizzard_11_brush1";
createNode brush -n "Lizzard_10_Hands_done_brush1";
createNode brush -n "Lizzard_9_hand_1_brush1";
createNode brush -n "Lizzard_8_Skelly_brush1";
createNode brush -n "Lizzard_7_arms_added_brush1";
createNode brush -n "lizzard_5_brush1";
createNode brush -n "lizzard_4_brush1";
createNode brush -n "lizzard_3_brush1";
createNode brush -n "lizzard_3_lizzard_3_brush1";
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
		+ "\t\tmodelPanel -edit -l \"Persp View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"persp\" \n"
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
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" \"Trax Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l \"Trax Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"ClipEditor\");\n"
		+ "            clipEditor -e \n"
		+ "                -characterOutline \"clipEditorPanel1OutlineEditor\" \n"
		+ "                -menuContext \"track\" \n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Trax Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"ClipEditor\");\n"
		+ "            clipEditor -e \n"
		+ "                -characterOutline \"clipEditorPanel1OutlineEditor\" \n"
		+ "                -menuContext \"track\" \n"
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
		+ "\tif ($useSceneConfig) {\n"
		+ "        string $configName = `getPanel -cwl \"Current Layout\"`;\n"
		+ "        if (\"\" != $configName) {\n"
		+ "\t\t\tpanelConfiguration -edit -label \"Current Layout\"\n"
		+ "\t\t\t\t-defaultImage \"\"\n"
		+ "\t\t\t\t-image \"\"\n"
		+ "\t\t\t\t-sc false\n"
		+ "\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n"
		+ "\t\t\t\t-ap false\n"
		+ "\t\t\t\t\t\"Persp View\"\n"
		+ "\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l \\\"Persp View\\\" -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 1024\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l \\\"Persp View\\\" -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 1024\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
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
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 200 -ast 0 -aet 200 ";
	setAttr ".st" 6;
createNode ikRPsolver -n "ikRPsolver";
createNode displayLayer -n "Skin";
	setAttr ".do" 1;
createNode displayLayer -n "Skelly";
	setAttr ".do" 2;
createNode displayLayer -n "IKs";
	setAttr ".do" 3;
createNode skinCluster -n "skinCluster1";
	setAttr -s 1435 ".wl";
	setAttr ".wl[0].w[26]"  1;
	setAttr ".wl[1].w[26]"  1;
	setAttr ".wl[2].w[26]"  1;
	setAttr ".wl[3].w[26]"  1;
	setAttr -s 5 ".wl[4].w[24:28]"  0.061605956 0.38909712 0.53688657 
		0.0043488629 0.0080615245;
	setAttr -s 5 ".wl[5].w[24:28]"  0.021074884 0.30321842 0.67409676 
		0.0010934036 0.00051652658;
	setAttr -s 5 ".wl[6].w[24:28]"  0.01330084 0.016361756 0.94767714 
		0.0078928219 0.014767445;
	setAttr ".wl[7].w[26]"  1;
	setAttr -s 5 ".wl[8].w";
	setAttr ".wl[8].w[53:54]" 0.40401527285575867 0.0044870954006910324;
	setAttr ".wl[8].w[59]" 0.010782639496028423;
	setAttr ".wl[8].w[63]" 0.32112723588943481;
	setAttr ".wl[8].w[67]" 0.25958779454231262;
	setAttr -s 5 ".wl[9].w";
	setAttr ".wl[9].w[53:54]" 0.73416024446487427 0.017031300812959671;
	setAttr ".wl[9].w[60]" 0.012068850919604301;
	setAttr ".wl[9].w[63]" 0.086388625204563141;
	setAttr ".wl[9].w[67]" 0.15035100281238556;
	setAttr -s 5 ".wl[10].w";
	setAttr ".wl[10].w[53:54]" 0.73416024446487427 0.017031300812959671;
	setAttr ".wl[10].w[60]" 0.012068850919604301;
	setAttr ".wl[10].w[63]" 0.086388625204563141;
	setAttr ".wl[10].w[67]" 0.15035100281238556;
	setAttr -s 5 ".wl[11].w";
	setAttr ".wl[11].w[53:54]" 0.49223867058753967 0.0011344928061589599;
	setAttr ".wl[11].w[59]" 0.015668604522943497;
	setAttr ".wl[11].w[63]" 0.011034558527171612;
	setAttr ".wl[11].w[67]" 0.47992363572120667;
	setAttr -s 5 ".wl[12].w";
	setAttr ".wl[12].w[53:54]" 0.4597662091255188 0.0010446852538734674;
	setAttr ".wl[12].w[59]" 0.44923555850982666;
	setAttr ".wl[12].w[63]" 0.0044135842472314835;
	setAttr ".wl[12].w[67]" 0.085540071129798889;
	setAttr -s 5 ".wl[13].w";
	setAttr ".wl[13].w[53:54]" 0.58498764038085938 0.0044997320510447025;
	setAttr ".wl[13].w[59]" 0.38889804482460022;
	setAttr ".wl[13].w[63]" 0.0058616744354367256;
	setAttr ".wl[13].w[67]" 0.015752865001559258;
	setAttr -s 5 ".wl[14].w";
	setAttr ".wl[14].w[53:54]" 0.52433168888092041 0.0016824380727484822;
	setAttr ".wl[14].w[59]" 0.45797803997993469;
	setAttr ".wl[14].w[63]" 0.002726380480453372;
	setAttr ".wl[14].w[67]" 0.013281453400850296;
	setAttr -s 5 ".wl[15].w";
	setAttr ".wl[15].w[53:54]" 0.63550084829330444 0.36011621356010437;
	setAttr ".wl[15].w[59]" 0.001125250943005085;
	setAttr ".wl[15].w[63]" 0.0018693192396312952;
	setAttr ".wl[15].w[67]" 0.001388304983265698;
	setAttr -s 5 ".wl[16].w";
	setAttr ".wl[16].w[53:54]" 0.49887624382972717 0.49887624382972717;
	setAttr ".wl[16].w[59]" 0.00050602492410689592;
	setAttr ".wl[16].w[63]" 0.0010952698066830635;
	setAttr ".wl[16].w[67]" 0.00064616918098181486;
	setAttr -s 5 ".wl[17].w";
	setAttr ".wl[17].w[53:56]" 0.39118686318397522 0.44027462601661682 
		0.16064701974391937 0.0076199970208108425;
	setAttr ".wl[17].w[59]" 0.0002715385053306818;
	setAttr -s 5 ".wl[18].w";
	setAttr ".wl[18].w[51:54]" 3.6118221032666042e-005 0.49755775928497314 
		0.45730695128440857 0.044220179319381714;
	setAttr ".wl[18].w[59]" 0.00087894569151103497;
	setAttr -s 5 ".wl[19].w";
	setAttr ".wl[19].w[53:54]" 0.95008391141891479 0.04472896084189415;
	setAttr ".wl[19].w[59]" 0.0022393169347196817;
	setAttr ".wl[19].w[63]" 0.0013441432965919375;
	setAttr ".wl[19].w[67]" 0.0016036767046898603;
	setAttr -s 5 ".wl[20].w";
	setAttr ".wl[20].w[53:56]" 0.35068309307098389 0.40125024318695068 
		0.22806835174560547 0.0193028524518013;
	setAttr ".wl[20].w[59]" 0.00069541647098958492;
	setAttr -s 5 ".wl[21].w";
	setAttr ".wl[21].w[51:54]" 4.4850185076938942e-005 0.45411789417266846 
		0.42100191116333008 0.12385374307632446;
	setAttr ".wl[21].w[59]" 0.00098155206069350243;
	setAttr -s 5 ".wl[22].w";
	setAttr ".wl[22].w[53:54]" 0.8882024884223938 0.098750732839107513;
	setAttr ".wl[22].w[59]" 0.0062850932590663433;
	setAttr ".wl[22].w[63]" 0.0032362428028136492;
	setAttr ".wl[22].w[67]" 0.0035254424437880516;
	setAttr -s 5 ".wl[23].w";
	setAttr ".wl[23].w[53:54]" 0.73416018486022949 0.017031298950314522;
	setAttr ".wl[23].w[59]" 0.012068849056959152;
	setAttr ".wl[23].w[63]" 0.15035098791122437;
	setAttr ".wl[23].w[67]" 0.086388617753982544;
	setAttr -s 5 ".wl[24].w";
	setAttr ".wl[24].w[53:54]" 0.73416024446487427 0.017031300812959671;
	setAttr ".wl[24].w[60]" 0.012068850919604301;
	setAttr ".wl[24].w[63]" 0.086388625204563141;
	setAttr ".wl[24].w[67]" 0.15035100281238556;
	setAttr -s 5 ".wl[25].w[53:57]"  0.011134418 0.14505853 0.66911173 
		0.17240807 0.00228726;
	setAttr -s 5 ".wl[26].w";
	setAttr ".wl[26].w[53:54]" 0.79918265342712402 0.0068324021995067596;
	setAttr ".wl[26].w[59]" 0.031951077282428741;
	setAttr ".wl[26].w[63]" 0.019529538229107857;
	setAttr ".wl[26].w[67]" 0.1425042599439621;
	setAttr -s 5 ".wl[27].w";
	setAttr ".wl[27].w[53:54]" 0.64489603042602539 0.0039830859750509262;
	setAttr ".wl[27].w[59]" 0.25812190771102905;
	setAttr ".wl[27].w[63]" 0.0086346985772252083;
	setAttr ".wl[27].w[67]" 0.084364362061023712;
	setAttr -s 5 ".wl[28].w";
	setAttr ".wl[28].w[53:54]" 0.78216409683227539 0.024841472506523132;
	setAttr ".wl[28].w[59]" 0.15844246745109558;
	setAttr ".wl[28].w[63]" 0.012058633379638195;
	setAttr ".wl[28].w[67]" 0.022493325173854828;
	setAttr -s 5 ".wl[29].w";
	setAttr ".wl[29].w[53:54]" 0.73316264152526855 0.004991462454199791;
	setAttr ".wl[29].w[59]" 0.23859041929244995;
	setAttr ".wl[29].w[63]" 0.0048413104377686977;
	setAttr ".wl[29].w[67]" 0.018414204940199852;
	setAttr -s 5 ".wl[30].w";
	setAttr ".wl[30].w[53:54]" 0.44876766204833984 0.00075868773274123669;
	setAttr ".wl[30].w[63:65]" 0.5115007758140564 0.034928120672702789 
		0.0040447358042001724;
	setAttr -s 5 ".wl[31].w";
	setAttr ".wl[31].w[53:54]" 0.44137817621231079 0.00077320338459685445;
	setAttr ".wl[31].w[60]" 0.0068578086793422699;
	setAttr ".wl[31].w[63]" 0.39493256807327271;
	setAttr ".wl[31].w[67]" 0.15605825185775757;
	setAttr -s 5 ".wl[32].w";
	setAttr ".wl[32].w[53:54]" 0.48868432641029358 0.001208513043820858;
	setAttr ".wl[32].w[60]" 0.0064655845053493977;
	setAttr ".wl[32].w[63]" 0.048792209476232529;
	setAttr ".wl[32].w[67]" 0.45484933257102966;
	setAttr -s 5 ".wl[33].w";
	setAttr ".wl[33].w[53:54]" 0.48868432641029358 0.001208513043820858;
	setAttr ".wl[33].w[59]" 0.0064655845053493977;
	setAttr ".wl[33].w[63]" 0.45484933257102966;
	setAttr ".wl[33].w[67]" 0.048792209476232529;
	setAttr -s 5 ".wl[34].w";
	setAttr ".wl[34].w[53:54]" 0.48629206418991089 0.00042099473648704588;
	setAttr ".wl[34].w[67:69]" 0.50109505653381348 0.010679223574697971 
		0.0015126883517950773;
	setAttr -s 5 ".wl[35].w";
	setAttr ".wl[35].w[53:54]" 0.41198199987411499 0.00022186881687957793;
	setAttr ".wl[35].w[67:69]" 0.57016754150390625 0.015959825366735458 
		0.0016687893075868487;
	setAttr -s 5 ".wl[36].w";
	setAttr ".wl[36].w[53:54]" 0.50515145063400269 0.00094989541685208678;
	setAttr ".wl[36].w[59]" 0.04406309500336647;
	setAttr ".wl[36].w[63]" 0.035834308713674545;
	setAttr ".wl[36].w[67]" 0.4140012264251709;
	setAttr -s 5 ".wl[37].w";
	setAttr ".wl[37].w[53:54]" 0.48793873190879822 0.00074212066829204559;
	setAttr ".wl[37].w[67:69]" 0.48821538686752319 0.019869541749358177 
		0.0032342590857297182;
	setAttr -s 5 ".wl[38].w";
	setAttr ".wl[38].w[53:54]" 0.56665664911270142 0.00047634201473556459;
	setAttr ".wl[38].w[59]" 0.40126430988311768;
	setAttr ".wl[38].w[63]" 0.0038568140007555485;
	setAttr ".wl[38].w[67]" 0.027745898813009262;
	setAttr -s 5 ".wl[39].w";
	setAttr ".wl[39].w[53:54]" 0.46893253922462463 9.8788412287831306e-005;
	setAttr ".wl[39].w[59:61]" 0.52500903606414795 0.0051563787274062634 
		0.00080317771062254906;
	setAttr -s 5 ".wl[40].w";
	setAttr ".wl[40].w[53:54]" 0.50577658414840698 0.00077318382682278752;
	setAttr ".wl[40].w[59]" 0.48419782519340515;
	setAttr ".wl[40].w[63]" 0.002205907367169857;
	setAttr ".wl[40].w[67]" 0.0070465486496686935;
	setAttr -s 5 ".wl[41].w";
	setAttr ".wl[41].w[53:54]" 0.47738945484161377 0.00016995100304484367;
	setAttr ".wl[41].w[59:61]" 0.5110020637512207 0.009842713363468647 
		0.0015957913128659129;
	setAttr -s 5 ".wl[42].w[53:57]"  0.048069496 0.27443433 0.5002296 
		0.17032818 0.0069383513;
	setAttr -s 5 ".wl[43].w[54:58]"  0.034581505 0.40733844 0.52867895 
		0.027281741 0.002119354;
	setAttr -s 5 ".wl[44].w";
	setAttr ".wl[44].w[53:54]" 0.4343489408493042 0.00015530084783677012;
	setAttr ".wl[44].w[67:69]" 0.55670583248138428 0.0079065607860684395 
		0.00088332546874880791;
	setAttr -s 5 ".wl[45].w";
	setAttr ".wl[45].w[53:54]" 0.46438226103782654 0.00026277379947714508;
	setAttr ".wl[45].w[67:69]" 0.52043986320495605 0.013269324786961079 
		0.0016457326710224152;
	setAttr -s 5 ".wl[46].w";
	setAttr ".wl[46].w[53:54]" 0.49172419309616089 0.00038407856482081115;
	setAttr ".wl[46].w[59:61]" 0.49202466011047363 0.013369147665798664 
		0.0024979382287710905;
	setAttr -s 5 ".wl[47].w";
	setAttr ".wl[47].w[53:54]" 0.47523960471153259 0.00029573342180810869;
	setAttr ".wl[47].w[59]" 0.46594294905662537;
	setAttr ".wl[47].w[63]" 0.0025656495708972216;
	setAttr ".wl[47].w[67]" 0.055956102907657623;
	setAttr -s 5 ".wl[48].w";
	setAttr ".wl[48].w[53:54]" 0.43458199501037598 0.00066645018523558974;
	setAttr ".wl[48].w[59]" 0.17748640477657318;
	setAttr ".wl[48].w[63]" 0.010141920298337936;
	setAttr ".wl[48].w[67]" 0.3771231472492218;
	setAttr -s 5 ".wl[49].w";
	setAttr ".wl[49].w[53:54]" 0.44137817621231079 0.00077320338459685445;
	setAttr ".wl[49].w[59]" 0.0068578086793422699;
	setAttr ".wl[49].w[63]" 0.15605825185775757;
	setAttr ".wl[49].w[67]" 0.39493256807327271;
	setAttr -s 5 ".wl[50].w";
	setAttr ".wl[50].w[53:54]" 0.45687821507453918 0.00083586759865283966;
	setAttr ".wl[50].w[59]" 0.0045516467653214931;
	setAttr ".wl[50].w[63]" 0.42865493893623352;
	setAttr ".wl[50].w[67]" 0.10907930880784988;
	setAttr -s 5 ".wl[51].w";
	setAttr ".wl[51].w[53:54]" 0.48868432641029358 0.001208513043820858;
	setAttr ".wl[51].w[60]" 0.0064655845053493977;
	setAttr ".wl[51].w[63]" 0.048792209476232529;
	setAttr ".wl[51].w[67]" 0.45484933257102966;
	setAttr -s 5 ".wl[52].w[54:58]"  0.0022094245 0.02657461 0.81023127 
		0.15838145 0.0026031963;
	setAttr -s 5 ".wl[53].w[54:58]"  0.0083191628 0.22126774 0.74731427 
		0.022026584 0.0010722004;
	setAttr -s 5 ".wl[54].w[54:58]"  0.034581501 0.40733838 0.52867889 
		0.027281737 0.0021193537;
	setAttr -s 5 ".wl[55].w[53:57]"  0.011035159 0.059568331 0.47673944 
		0.44056323 0.012093863;
	setAttr -s 5 ".wl[56].w[54:58]"  0.013365081 0.37507719 0.59187216 
		0.01866206 0.0010235837;
	setAttr -s 5 ".wl[57].w[53:57]"  0.13034706 0.14488907 0.37031025 
		0.31819391 0.036259744;
	setAttr -s 5 ".wl[58].w";
	setAttr ".wl[58].w[53:54]" 0.64426285028457642 0.27550575137138367;
	setAttr ".wl[58].w[59]" 0.031882185488939285;
	setAttr ".wl[58].w[63]" 0.029754417017102242;
	setAttr ".wl[58].w[67]" 0.018594801425933838;
	setAttr -s 5 ".wl[59].w[53:57]"  0.011134418 0.14505853 0.66911173 
		0.17240807 0.00228726;
	setAttr -s 5 ".wl[60].w[53:57]"  0.011134418 0.14505853 0.66911173 
		0.17240807 0.00228726;
	setAttr -s 5 ".wl[61].w";
	setAttr ".wl[61].w[53:54]" 0.35597166419029236 0.0012114624259993434;
	setAttr ".wl[61].w[59]" 0.0064126420766115189;
	setAttr ".wl[61].w[63]" 0.28108972311019897;
	setAttr ".wl[61].w[67]" 0.3553144633769989;
	setAttr -s 5 ".wl[62].w";
	setAttr ".wl[62].w[53:54]" 0.48253616690635681 0.00031542309443466365;
	setAttr ".wl[62].w[59:61]" 0.50171536207199097 0.013141991570591927 
		0.0022910414263606071;
	setAttr -s 5 ".wl[63].w";
	setAttr ".wl[63].w[53:54]" 0.010510406456887722 0.00010740321158664301;
	setAttr ".wl[63].w[67:69]" 0.49275463819503784 0.47829601168632507 
		0.018331661820411682;
	setAttr -s 5 ".wl[64].w";
	setAttr ".wl[64].w[53:54]" 0.011727280914783478 0.00010082978405989707;
	setAttr ".wl[64].w[67:69]" 0.49692052602767944 0.47529143095016479 
		0.015959938988089561;
	setAttr -s 5 ".wl[65].w";
	setAttr ".wl[65].w[53:54]" 0.019831772893667221 0.00019760310533456504;
	setAttr ".wl[65].w[63:64]" 0.54518908262252808 0.41177558898925781;
	setAttr ".wl[65].w[69]" 0.023005915805697441;
	setAttr -s 5 ".wl[66].w";
	setAttr ".wl[66].w[53:54]" 0.019831772893667221 0.00019760310533456504;
	setAttr ".wl[66].w[67:69]" 0.54518908262252808 0.41177558898925781 
		0.023005915805697441;
	setAttr -s 5 ".wl[67].w";
	setAttr ".wl[67].w[53:54]" 0.013872110284864902 0.00012036586122121662;
	setAttr ".wl[67].w[67:69]" 0.57462131977081299 0.39362943172454834 
		0.017756687477231026;
	setAttr -s 5 ".wl[68].w";
	setAttr ".wl[68].w[53:54]" 0.011482096277177334 7.7914490248076618e-005;
	setAttr ".wl[68].w[67:69]" 0.61649876832962036 0.36080631613731384 
		0.011134902015328407;
	setAttr -s 5 ".wl[69].w";
	setAttr ".wl[69].w[53:54]" 0.011381562799215317 7.9705845564603806e-005;
	setAttr ".wl[69].w[67:69]" 0.552051842212677 0.42359271645545959 
		0.012894163839519024;
	setAttr -s 5 ".wl[70].w";
	setAttr ".wl[70].w[53:54]" 0.0066195912659168243 5.0669892516452819e-005;
	setAttr ".wl[70].w[67:69]" 0.51234805583953857 0.4708842933177948 
		0.01009739376604557;
	setAttr -s 5 ".wl[71].w";
	setAttr ".wl[71].w[53:54]" 0.019831772893667221 0.00019760310533456504;
	setAttr ".wl[71].w[63:64]" 0.54518908262252808 0.41177558898925781;
	setAttr ".wl[71].w[69]" 0.023005915805697441;
	setAttr -s 5 ".wl[72].w";
	setAttr ".wl[72].w[53:54]" 0.43458205461502075 0.00066645024344325066;
	setAttr ".wl[72].w[60]" 0.17748641967773438;
	setAttr ".wl[72].w[63]" 0.37712320685386658;
	setAttr ".wl[72].w[67]" 0.010141921229660511;
	setAttr -s 5 ".wl[73].w";
	setAttr ".wl[73].w[53:54]" 0.43458205461502075 0.00066645024344325066;
	setAttr ".wl[73].w[60]" 0.17748641967773438;
	setAttr ".wl[73].w[63]" 0.37712320685386658;
	setAttr ".wl[73].w[67]" 0.010141921229660511;
	setAttr -s 5 ".wl[74].w";
	setAttr ".wl[74].w[53:54]" 0.50515145063400269 0.00094989541685208678;
	setAttr ".wl[74].w[60]" 0.04406309500336647;
	setAttr ".wl[74].w[63]" 0.4140012264251709;
	setAttr ".wl[74].w[67]" 0.035834308713674545;
	setAttr -s 5 ".wl[75].w";
	setAttr ".wl[75].w[53:54]" 0.013872112147510052 0.00012036587577313185;
	setAttr ".wl[75].w[63:64]" 0.57462137937545776 0.39362949132919312;
	setAttr ".wl[75].w[69]" 0.017756689339876175;
	setAttr -s 5 ".wl[76].w";
	setAttr ".wl[76].w[53:54]" 0.019831772893667221 0.00019760310533456504;
	setAttr ".wl[76].w[63:64]" 0.54518908262252808 0.41177558898925781;
	setAttr ".wl[76].w[69]" 0.023005915805697441;
	setAttr -s 5 ".wl[77].w";
	setAttr ".wl[77].w[53:54]" 0.010304019786417484 7.8275217674672604e-005;
	setAttr ".wl[77].w[59:61]" 0.53241628408432007 0.43516525626182556 
		0.022036168724298477;
	setAttr -s 5 ".wl[78].w";
	setAttr ".wl[78].w[53:54]" 0.0077939881011843681 5.7782603107625619e-005;
	setAttr ".wl[78].w[59:61]" 0.50349992513656616 0.46585381031036377 
		0.022794559597969055;
	setAttr -s 5 ".wl[79].w";
	setAttr ".wl[79].w[53:54]" 0.017433976754546165 0.00014760039630346;
	setAttr ".wl[79].w[59:61]" 0.55237317085266113 0.40319180488586426 
		0.026853445917367935;
	setAttr -s 5 ".wl[80].w";
	setAttr ".wl[80].w[53:54]" 0.010018260218203068 7.3608418460935354e-005;
	setAttr ".wl[80].w[59:61]" 0.55222737789154053 0.41874456405639648 
		0.018936220556497574;
	setAttr -s 5 ".wl[81].w";
	setAttr ".wl[81].w[53:54]" 0.0084328074008226395 5.300871271174401e-005;
	setAttr ".wl[81].w[59:61]" 0.54007887840270996 0.43442985415458679 
		0.017005505040287971;
	setAttr -s 5 ".wl[82].w";
	setAttr ".wl[82].w[53:54]" 0.0097599998116493225 6.5783635363914073e-005;
	setAttr ".wl[82].w[59:61]" 0.50098717212677002 0.46408334374427795 
		0.025103675201535225;
	setAttr -s 5 ".wl[83].w[54:58]"  0.0083191628 0.22126774 0.74731427 
		0.022026584 0.0010722004;
	setAttr -s 5 ".wl[84].w[54:58]"  0.034581505 0.40733844 0.52867895 
		0.027281741 0.002119354;
	setAttr -s 5 ".wl[85].w[54:58]"  0.0053667389 0.16216867 0.80316609 
		0.028318217 0.00098032551;
	setAttr -s 5 ".wl[86].w[54:58]"  0.0053667384 0.16216865 0.80316597 
		0.028318213 0.00098032539;
	setAttr -s 5 ".wl[87].w[54:58]"  0.0083191628 0.22126774 0.74731427 
		0.022026584 0.0010722004;
	setAttr -s 5 ".wl[88].w[54:58]"  0.0083191628 0.22126774 0.74731427 
		0.022026584 0.0010722004;
	setAttr -s 5 ".wl[89].w[54:58]"  0.034581505 0.40733844 0.52867895 
		0.027281741 0.002119354;
	setAttr -s 5 ".wl[90].w[54:58]"  0.034581505 0.40733844 0.52867895 
		0.027281741 0.002119354;
	setAttr -s 5 ".wl[91].w[54:58]"  0.0053667389 0.16216867 0.80316609 
		0.028318217 0.00098032551;
	setAttr -s 5 ".wl[92].w[54:58]"  0.0022094245 0.02657461 0.81023127 
		0.15838145 0.0026031963;
	setAttr -s 5 ".wl[93].w[54:58]"  0.0020055638 0.013226609 0.49022925 
		0.48097143 0.013567106;
	setAttr -s 5 ".wl[94].w[54:58]"  0.0022094245 0.02657461 0.81023127 
		0.15838145 0.0026031963;
	setAttr -s 5 ".wl[95].w[54:58]"  0.0022094245 0.02657461 0.81023127 
		0.15838145 0.0026031963;
	setAttr -s 5 ".wl[96].w[54:58]"  0.0022094245 0.02657461 0.81023127 
		0.15838145 0.0026031963;
	setAttr -s 5 ".wl[97].w[54:58]"  0.0020055638 0.013226609 0.49022925 
		0.48097143 0.013567106;
	setAttr -s 5 ".wl[98].w";
	setAttr ".wl[98].w[53:54]" 0.019831772893667221 0.00019760310533456504;
	setAttr ".wl[98].w[63:64]" 0.54518908262252808 0.41177558898925781;
	setAttr ".wl[98].w[69]" 0.023005915805697441;
	setAttr -s 5 ".wl[99].w";
	setAttr ".wl[99].w[53:54]" 0.48793870210647583 0.00074212061008438468;
	setAttr ".wl[99].w[63:64]" 0.48821535706520081 0.019869539886713028;
	setAttr ".wl[99].w[69]" 0.0032342588528990746;
	setAttr -s 5 ".wl[100].w";
	setAttr ".wl[100].w[53:54]" 0.43458205461502075 0.00066645024344325066;
	setAttr ".wl[100].w[60]" 0.17748641967773438;
	setAttr ".wl[100].w[63]" 0.37712320685386658;
	setAttr ".wl[100].w[67]" 0.010141921229660511;
	setAttr -s 5 ".wl[101].w";
	setAttr ".wl[101].w[53:54]" 0.50515145063400269 0.00094989541685208678;
	setAttr ".wl[101].w[60]" 0.04406309500336647;
	setAttr ".wl[101].w[63]" 0.4140012264251709;
	setAttr ".wl[101].w[67]" 0.035834308713674545;
	setAttr -s 5 ".wl[102].w";
	setAttr ".wl[102].w[53:54]" 0.013872112147510052 0.00012036587577313185;
	setAttr ".wl[102].w[63:64]" 0.57462137937545776 0.39362949132919312;
	setAttr ".wl[102].w[69]" 0.017756689339876175;
	setAttr -s 5 ".wl[103].w";
	setAttr ".wl[103].w[53:54]" 0.013872112147510052 0.00012036587577313185;
	setAttr ".wl[103].w[63:64]" 0.57462137937545776 0.39362949132919312;
	setAttr ".wl[103].w[69]" 0.017756689339876175;
	setAttr -s 5 ".wl[104].w";
	setAttr ".wl[104].w[53:54]" 0.010510405525565147 0.00010740319703472778;
	setAttr ".wl[104].w[63:64]" 0.49275457859039307 0.4782959520816803;
	setAttr ".wl[104].w[69]" 0.018331659957766533;
	setAttr -s 5 ".wl[105].w";
	setAttr ".wl[105].w[53]" 0.0040977154858410358;
	setAttr ".wl[105].w[67:70]" 0.41705995798110962 0.5289650559425354 
		0.049772102385759354 0.0001052068400895223;
	setAttr -s 5 ".wl[106].w";
	setAttr ".wl[106].w[53:54]" 0.010510405525565147 0.00010740319703472778;
	setAttr ".wl[106].w[63:64]" 0.49275457859039307 0.4782959520816803;
	setAttr ".wl[106].w[69]" 0.018331659957766533;
	setAttr -s 5 ".wl[107].w";
	setAttr ".wl[107].w[53:54]" 0.019831772893667221 0.00019760310533456504;
	setAttr ".wl[107].w[63:64]" 0.54518908262252808 0.41177558898925781;
	setAttr ".wl[107].w[69]" 0.023005915805697441;
	setAttr -s 5 ".wl[108].w";
	setAttr ".wl[108].w[53]" 0.0077369934879243374;
	setAttr ".wl[108].w[67:70]" 0.41833955049514771 0.52361512184143066 
		0.050179895013570786 0.00012856950343120843;
	setAttr -s 5 ".wl[109].w";
	setAttr ".wl[109].w[53]" 0.0062125637196004391;
	setAttr ".wl[109].w[67:70]" 0.4585285484790802 0.50489312410354614 
		0.030279302969574928 8.6521569755859673e-005;
	setAttr -s 5 ".wl[110].w";
	setAttr ".wl[110].w[53]" 0.0056427023373544216;
	setAttr ".wl[110].w[67:70]" 0.47047370672225952 0.49506935477256775 
		0.028727680444717407 8.6585700046271086e-005;
	setAttr -s 5 ".wl[111].w";
	setAttr ".wl[111].w[53]" 0.0031099899206310511;
	setAttr ".wl[111].w[67:70]" 0.45798018574714661 0.51472508907318115 
		0.024126891046762466 5.7932968047680333e-005;
	setAttr -s 5 ".wl[112].w";
	setAttr ".wl[112].w[53]" 0.0051468661986291409;
	setAttr ".wl[112].w[59:62]" 0.42938521504402161 0.50124996900558472 
		0.064126603305339813 9.140161273535341e-005;
	setAttr -s 5 ".wl[113].w";
	setAttr ".wl[113].w[53]" 0.0036589610390365124;
	setAttr ".wl[113].w[59:62]" 0.41906675696372986 0.51956701278686523 
		0.057640369981527328 6.6940956457983702e-005;
	setAttr -s 5 ".wl[114].w";
	setAttr ".wl[114].w[53]" 0.0080391140654683113;
	setAttr ".wl[114].w[59:62]" 0.45372775197029114 0.47635191679000854 
		0.061755940318107605 0.00012520983000285923;
	setAttr -s 5 ".wl[115].w";
	setAttr ".wl[115].w[53]" 0.0049646813422441483;
	setAttr ".wl[115].w[59:62]" 0.45292502641677856 0.49272382259368896 
		0.049301363527774811 8.5079140262678266e-005;
	setAttr -s 5 ".wl[116].w";
	setAttr ".wl[116].w[53]" 0.0038488961290568113;
	setAttr ".wl[116].w[59:62]" 0.45924821496009827 0.49603843688964844 
		0.040801618248224258 6.2755236285738647e-005;
	setAttr -s 5 ".wl[117].w";
	setAttr ".wl[117].w[53]" 0.0046365521848201752;
	setAttr ".wl[117].w[59:62]" 0.43957743048667908 0.49665775895118713 
		0.059044044464826584 8.4213395894039422e-005;
	setAttr -s 5 ".wl[118].w";
	setAttr ".wl[118].w[53:54]" 0.011482096277177334 7.7914490248076618e-005;
	setAttr ".wl[118].w[63:64]" 0.61649876832962036 0.36080631613731384;
	setAttr ".wl[118].w[69]" 0.011134902015328407;
	setAttr -s 4 ".wl[119].w";
	setAttr ".wl[119].w[53:54]" 0.018242539837956429 0.00013858074089512229;
	setAttr ".wl[119].w[60]" 0.94260543584823608;
	setAttr ".wl[119].w[65]" 0.03901347890496254;
	setAttr -s 4 ".wl[120].w";
	setAttr ".wl[120].w[53:54]" 0.018242539837956429 0.00013858074089512229;
	setAttr ".wl[120].w[60]" 0.94260543584823608;
	setAttr ".wl[120].w[65]" 0.03901347890496254;
	setAttr -s 4 ".wl[121].w";
	setAttr ".wl[121].w[53:54]" 0.029212027788162231 0.00024731631856411695;
	setAttr ".wl[121].w[60]" 0.92554557323455811;
	setAttr ".wl[121].w[65]" 0.044995103031396866;
	setAttr -s 5 ".wl[122].w";
	setAttr ".wl[122].w[53]" 0.0062125632539391518;
	setAttr ".wl[122].w[63:64]" 0.45852851867675781 0.50489306449890137;
	setAttr ".wl[122].w[69:70]" 0.030279301106929779 8.6521562479902059e-005;
	setAttr -s 5 ".wl[123].w";
	setAttr ".wl[123].w[53]" 0.0062125632539391518;
	setAttr ".wl[123].w[63:64]" 0.45852851867675781 0.50489306449890137;
	setAttr ".wl[123].w[69:70]" 0.030279301106929779 8.6521562479902059e-005;
	setAttr -s 5 ".wl[124].w";
	setAttr ".wl[124].w[53]" 0.001116372412070632;
	setAttr ".wl[124].w[63:64]" 0.059268232434988022 0.64491719007492065;
	setAttr ".wl[124].w[69:70]" 0.29459565877914429 0.00010254666267428547;
	setAttr -s 5 ".wl[125].w";
	setAttr ".wl[125].w[53]" 0.001116372412070632;
	setAttr ".wl[125].w[67:70]" 0.059268232434988022 0.64491719007492065 
		0.29459565877914429 0.00010254666267428547;
	setAttr -s 5 ".wl[126].w";
	setAttr ".wl[126].w[53]" 0.00098106800578534603;
	setAttr ".wl[126].w[63:64]" 0.048769604414701462 0.64580494165420532;
	setAttr ".wl[126].w[69:70]" 0.30434885621070862 9.5529358077328652e-005;
	setAttr -s 5 ".wl[127].w";
	setAttr ".wl[127].w[53]" 0.0014044741401448846;
	setAttr ".wl[127].w[63:64]" 0.054338779300451279 0.62734991312026978;
	setAttr ".wl[127].w[69:70]" 0.31677946448326111 0.00012732253526337445;
	setAttr -s 5 ".wl[128].w";
	setAttr ".wl[128].w[53]" 0.0019327900372445583;
	setAttr ".wl[128].w[67:70]" 0.061653871089220047 0.58926337957382202 
		0.34697529673576355 0.00017473395564593375;
	setAttr -s 5 ".wl[129].w";
	setAttr ".wl[129].w[53]" 0.0014044741401448846;
	setAttr ".wl[129].w[67:70]" 0.054338779300451279 0.62734991312026978 
		0.31677946448326111 0.00012732253526337445;
	setAttr -s 5 ".wl[130].w";
	setAttr ".wl[130].w[53]" 0.001841152785345912;
	setAttr ".wl[130].w[67:70]" 0.076243110001087189 0.61214303970336914 
		0.3096061646938324 0.00016649457393214107;
	setAttr -s 5 ".wl[131].w";
	setAttr ".wl[131].w[53]" 0.00098106800578534603;
	setAttr ".wl[131].w[67:70]" 0.048769604414701462 0.64580494165420532 
		0.30434885621070862 9.5529358077328652e-005;
	setAttr -s 5 ".wl[132].w";
	setAttr ".wl[132].w[53]" 0.00087381602497771382;
	setAttr ".wl[132].w[59:62]" 0.034619543701410294 0.50072181224822998 
		0.46369296312332153 9.1873291239608079e-005;
	setAttr -s 5 ".wl[133].w";
	setAttr ".wl[133].w[53]" 0.00049447838682681322;
	setAttr ".wl[133].w[59:62]" 0.020453738048672676 0.49775084853172302 
		0.48124608397483826 5.4825661209179088e-005;
	setAttr -s 5 ".wl[134].w";
	setAttr ".wl[134].w[53]" 0.0018180441111326218;
	setAttr ".wl[134].w[59:62]" 0.066525682806968689 0.50023013353347778 
		0.43124774098396301 0.00017846004629973322;
	setAttr -s 5 ".wl[135].w";
	setAttr ".wl[135].w[53]" 0.0012576758163049817;
	setAttr ".wl[135].w[59:62]" 0.050346836447715759 0.50613248348236084 
		0.44212579727172852 0.00013720667629968375;
	setAttr -s 5 ".wl[136].w";
	setAttr ".wl[136].w[53]" 0.00091388012515380979;
	setAttr ".wl[136].w[59:62]" 0.042546980082988739 0.52244281768798828 
		0.43400609493255615 9.0301255113445222e-005;
	setAttr -s 5 ".wl[137].w";
	setAttr ".wl[137].w[53]" 0.00072543893475085497;
	setAttr ".wl[137].w[59:62]" 0.030808834359049797 0.50097161531448364 
		0.46741589903831482 7.8145552834030241e-005;
	setAttr -s 5 ".wl[138].w";
	setAttr ".wl[138].w[53]" 0.0056427018716931343;
	setAttr ".wl[138].w[63:64]" 0.47047367691993713 0.49506932497024536;
	setAttr ".wl[138].w[69:70]" 0.028727678582072258 8.6585692770313472e-005;
	setAttr -s 4 ".wl[139].w";
	setAttr ".wl[139].w[53:54]" 0.014591486193239689 0.00010817748989211395;
	setAttr ".wl[139].w[60]" 0.94262558221817017;
	setAttr ".wl[139].w[65]" 0.042674753814935684;
	setAttr -s 4 ".wl[140].w";
	setAttr ".wl[140].w[53:54]" 0.029212027788162231 0.00024731631856411695;
	setAttr ".wl[140].w[60]" 0.92554557323455811;
	setAttr ".wl[140].w[65]" 0.044995103031396866;
	setAttr -s 5 ".wl[141].w";
	setAttr ".wl[141].w[53]" 0.0062125632539391518;
	setAttr ".wl[141].w[63:64]" 0.45852851867675781 0.50489306449890137;
	setAttr ".wl[141].w[69:70]" 0.030279301106929779 8.6521562479902059e-005;
	setAttr -s 5 ".wl[142].w";
	setAttr ".wl[142].w[53]" 0.00098106800578534603;
	setAttr ".wl[142].w[63:64]" 0.048769604414701462 0.64580494165420532;
	setAttr ".wl[142].w[69:70]" 0.30434885621070862 9.5529358077328652e-005;
	setAttr -s 5 ".wl[143].w";
	setAttr ".wl[143].w[53]" 0.00039752342854626477;
	setAttr ".wl[143].w[63:64]" 0.011903718113899231 0.52815192937850952;
	setAttr ".wl[143].w[69:70]" 0.45948606729507446 6.0705067880917341e-005;
	setAttr -s 5 ".wl[144].w";
	setAttr ".wl[144].w[53]" 0.00039752345765009522;
	setAttr ".wl[144].w[67:70]" 0.011903719045221806 0.5281519889831543 
		0.45948609709739685 6.0705071518896148e-005;
	setAttr -s 5 ".wl[145].w";
	setAttr ".wl[145].w[53]" 0.00051664939383044839;
	setAttr ".wl[145].w[67:70]" 0.010659956373274326 0.46490859985351563 
		0.52375614643096924 0.00015851086936891079;
	setAttr -s 5 ".wl[146].w";
	setAttr ".wl[146].w[53]" 0.00058148830430582166;
	setAttr ".wl[146].w[59:62]" 0.010603188537061214 0.32784631848335266 
		0.66075587272644043 0.00021313174511305988;
	setAttr -s 5 ".wl[147].w";
	setAttr ".wl[147].w[53]" 0.00053206394659355283;
	setAttr ".wl[147].w[59:62]" 0.016991686075925827 0.46509113907814026 
		0.51730185747146606 8.326940587721765e-005;
	setAttr -s 5 ".wl[148].w";
	setAttr ".wl[148].w[53]" 0.00060361623764038086;
	setAttr ".wl[148].w[59:62]" 0.016903260722756386 0.40522706508636475 
		0.57714921236038208 0.00011683494085446;
	setAttr -s 5 ".wl[149].w";
	setAttr ".wl[149].w[53]" 0.00063136237440630794;
	setAttr ".wl[149].w[59:62]" 0.012247877195477486 0.34565427899360657 
		0.64125317335128784 0.00021329718583729118;
	setAttr -s 4 ".wl[150].w";
	setAttr ".wl[150].w[53]" 6.1883147282060236e-005;
	setAttr ".wl[150].w[60]" 0.00025816255947574973;
	setAttr ".wl[150].w[62]" 0.0076235877349972725;
	setAttr ".wl[150].w[65]" 0.99205636978149414;
	setAttr -s 4 ".wl[151].w";
	setAttr ".wl[151].w[53]" 0.00055873423116281629;
	setAttr ".wl[151].w[60]" 0.0043375813402235508;
	setAttr ".wl[151].w[62]" 0.0017848784336820245;
	setAttr ".wl[151].w[65]" 0.99331879615783691;
	setAttr -s 4 ".wl[152].w";
	setAttr ".wl[152].w[53]" 0.00055873423116281629;
	setAttr ".wl[152].w[60]" 0.0043375813402235508;
	setAttr ".wl[152].w[62]" 0.0017848784336820245;
	setAttr ".wl[152].w[65]" 0.99331879615783691;
	setAttr -s 4 ".wl[153].w";
	setAttr ".wl[153].w[53]" 0.00055873423116281629;
	setAttr ".wl[153].w[60]" 0.0043375813402235508;
	setAttr ".wl[153].w[62]" 0.0017848784336820245;
	setAttr ".wl[153].w[65]" 0.99331879615783691;
	setAttr -s 4 ".wl[154].w";
	setAttr ".wl[154].w[53]" 6.1883147282060236e-005;
	setAttr ".wl[154].w[60]" 0.00025816255947574973;
	setAttr ".wl[154].w[62]" 0.0076235877349972725;
	setAttr ".wl[154].w[65]" 0.99205636978149414;
	setAttr -s 4 ".wl[155].w";
	setAttr ".wl[155].w[53]" 6.1883147282060236e-005;
	setAttr ".wl[155].w[60]" 0.00025816255947574973;
	setAttr ".wl[155].w[62]" 0.0076235877349972725;
	setAttr ".wl[155].w[65]" 0.99205636978149414;
	setAttr -s 4 ".wl[156].w";
	setAttr ".wl[156].w[53]" 6.1883147282060236e-005;
	setAttr ".wl[156].w[60]" 0.00025816255947574973;
	setAttr ".wl[156].w[62]" 0.0076235877349972725;
	setAttr ".wl[156].w[65]" 0.99205636978149414;
	setAttr -s 4 ".wl[157].w";
	setAttr ".wl[157].w[53]" 6.1883147282060236e-005;
	setAttr ".wl[157].w[60]" 0.00025816255947574973;
	setAttr ".wl[157].w[62]" 0.0076235877349972725;
	setAttr ".wl[157].w[65]" 0.99205636978149414;
	setAttr -s 4 ".wl[158].w";
	setAttr ".wl[158].w[53]" 1.9380574940441875e-006;
	setAttr ".wl[158].w[60]" 8.2158421719213948e-006;
	setAttr ".wl[158].w[62]" 0.00023147257161326706;
	setAttr ".wl[158].w[65]" 0.99975836277008057;
	setAttr -s 4 ".wl[159].w";
	setAttr ".wl[159].w[53]" 1.9380574940441875e-006;
	setAttr ".wl[159].w[60]" 8.2158421719213948e-006;
	setAttr ".wl[159].w[62]" 0.00023147257161326706;
	setAttr ".wl[159].w[65]" 0.99975836277008057;
	setAttr -s 4 ".wl[160].w";
	setAttr ".wl[160].w[53]" 1.9380574940441875e-006;
	setAttr ".wl[160].w[60]" 8.2158421719213948e-006;
	setAttr ".wl[160].w[62]" 0.00023147257161326706;
	setAttr ".wl[160].w[65]" 0.99975836277008057;
	setAttr -s 4 ".wl[161].w";
	setAttr ".wl[161].w[53]" 1.9380574940441875e-006;
	setAttr ".wl[161].w[60]" 8.2158421719213948e-006;
	setAttr ".wl[161].w[62]" 0.00023147257161326706;
	setAttr ".wl[161].w[65]" 0.99975836277008057;
	setAttr -s 4 ".wl[162].w";
	setAttr ".wl[162].w[53]" 0.0017501584952697158;
	setAttr ".wl[162].w[60]" 0.069339185953140259;
	setAttr ".wl[162].w[62]" 0.00018401221313979477;
	setAttr ".wl[162].w[65]" 0.92872661352157593;
	setAttr -s 4 ".wl[163].w";
	setAttr ".wl[163].w[53]" 0.0076159643940627575;
	setAttr ".wl[163].w[60]" 0.87226879596710205;
	setAttr ".wl[163].w[62]" 0.00013933461741544306;
	setAttr ".wl[163].w[65]" 0.11997586488723755;
	setAttr -s 4 ".wl[164].w";
	setAttr ".wl[164].w[53]" 0.0036377622745931149;
	setAttr ".wl[164].w[60]" 0.13311262428760529;
	setAttr ".wl[164].w[62]" 0.00035708441282622516;
	setAttr ".wl[164].w[65]" 0.86289256811141968;
	setAttr -s 4 ".wl[165].w";
	setAttr ".wl[165].w[53]" 0.0017501584952697158;
	setAttr ".wl[165].w[60]" 0.069339185953140259;
	setAttr ".wl[165].w[62]" 0.00018401221313979477;
	setAttr ".wl[165].w[65]" 0.92872661352157593;
	setAttr -s 4 ".wl[166].w";
	setAttr ".wl[166].w[53]" 0.00096487585688009858;
	setAttr ".wl[166].w[60]" 0.018717747181653976;
	setAttr ".wl[166].w[62]" 0.00032597017707303166;
	setAttr ".wl[166].w[65]" 0.9799913763999939;
	setAttr -s 4 ".wl[167].w";
	setAttr ".wl[167].w[53]" 0.00096487585688009858;
	setAttr ".wl[167].w[60]" 0.018717747181653976;
	setAttr ".wl[167].w[62]" 0.00032597017707303166;
	setAttr ".wl[167].w[65]" 0.9799913763999939;
	setAttr -s 4 ".wl[168].w";
	setAttr ".wl[168].w[53]" 0.00096487585688009858;
	setAttr ".wl[168].w[60]" 0.018717747181653976;
	setAttr ".wl[168].w[62]" 0.00032597017707303166;
	setAttr ".wl[168].w[65]" 0.9799913763999939;
	setAttr -s 4 ".wl[169].w";
	setAttr ".wl[169].w[53]" 0.00096487585688009858;
	setAttr ".wl[169].w[60]" 0.018717747181653976;
	setAttr ".wl[169].w[62]" 0.00032597017707303166;
	setAttr ".wl[169].w[65]" 0.9799913763999939;
	setAttr -s 5 ".wl[170].w";
	setAttr ".wl[170].w[53]" 0.0005166494520381093;
	setAttr ".wl[170].w[63:64]" 0.010659957304596901 0.4649086594581604;
	setAttr ".wl[170].w[69:70]" 0.52375620603561401 0.00015851088392082602;
	setAttr -s 5 ".wl[171].w";
	setAttr ".wl[171].w[53]" 0.0005166494520381093;
	setAttr ".wl[171].w[63:64]" 0.010659957304596901 0.4649086594581604;
	setAttr ".wl[171].w[69:70]" 0.52375620603561401 0.00015851088392082602;
	setAttr -s 5 ".wl[172].w";
	setAttr ".wl[172].w[53]" 0.00039752342854626477;
	setAttr ".wl[172].w[63:64]" 0.011903718113899231 0.52815192937850952;
	setAttr ".wl[172].w[69:70]" 0.45948606729507446 6.0705067880917341e-005;
	setAttr -s 5 ".wl[173].w";
	setAttr ".wl[173].w[53]" 0.0005166494520381093;
	setAttr ".wl[173].w[63:64]" 0.010659957304596901 0.4649086594581604;
	setAttr ".wl[173].w[69:70]" 0.52375620603561401 0.00015851088392082602;
	setAttr -s 4 ".wl[174].w";
	setAttr ".wl[174].w[53]" 0.00036160807940177619;
	setAttr ".wl[174].w[60]" 0.0028469301760196686;
	setAttr ".wl[174].w[62]" 0.0011460147798061371;
	setAttr ".wl[174].w[65]" 0.99564540386199951;
	setAttr -s 4 ".wl[175].w";
	setAttr ".wl[175].w[53]" 0.00036160807940177619;
	setAttr ".wl[175].w[60]" 0.0028469301760196686;
	setAttr ".wl[175].w[62]" 0.0011460147798061371;
	setAttr ".wl[175].w[65]" 0.99564540386199951;
	setAttr -s 4 ".wl[176].w";
	setAttr ".wl[176].w[53]" 0.00036160807940177619;
	setAttr ".wl[176].w[60]" 0.0028469301760196686;
	setAttr ".wl[176].w[62]" 0.0011460147798061371;
	setAttr ".wl[176].w[65]" 0.99564540386199951;
	setAttr -s 4 ".wl[177].w";
	setAttr ".wl[177].w[53]" 4.1455459722783417e-005;
	setAttr ".wl[177].w[60]" 0.00017443709657527506;
	setAttr ".wl[177].w[62]" 0.0048754974268376827;
	setAttr ".wl[177].w[65]" 0.99490857124328613;
	setAttr -s 5 ".wl[178].w";
	setAttr ".wl[178].w[53]" 4.1431558202020824e-005;
	setAttr ".wl[178].w[59:62]" 0.00017433652828913182 0.0005765275564044714 
		0.99433499574661255 0.0048726866953074932;
	setAttr -s 5 ".wl[179].w";
	setAttr ".wl[179].w[53]" 1.1229311667193542e-006;
	setAttr ".wl[179].w[59:62]" 4.7859930418781005e-006 1.6002510164980777e-005 
		0.99985164403915405 0.00012648249685298651;
	setAttr -s 5 ".wl[180].w";
	setAttr ".wl[180].w[53]" 1.9380047433514846e-006;
	setAttr ".wl[180].w[59:62]" 8.2156184362247586e-006 2.7173722628504038e-005 
		0.99973118305206299 0.00023146628518588841;
	setAttr -s 5 ".wl[181].w";
	setAttr ".wl[181].w[53]" 6.1831211496610194e-005;
	setAttr ".wl[181].w[59:62]" 0.00025794591056182981 0.00083925353828817606 
		0.99122381210327148 0.0076171895489096642;
	setAttr -s 5 ".wl[182].w";
	setAttr ".wl[182].w[53]" 0.00035380164626985788;
	setAttr ".wl[182].w[59:62]" 0.0027854703366756439 0.021588042378425598 
		0.97415131330490112 0.0011212744284421206;
	setAttr -s 5 ".wl[183].w";
	setAttr ".wl[183].w[53]" 5.4949291552475188e-006;
	setAttr ".wl[183].w[59:62]" 4.3070147512480617e-005 0.0003305850550532341 
		0.99960112571716309 1.9726565369637683e-005;
	setAttr -s 5 ".wl[184].w";
	setAttr ".wl[184].w[53]" 1.536748641228769e-005;
	setAttr ".wl[184].w[59:62]" 0.0001198065365315415 0.00088273326400667429 
		0.99892610311508179 5.6016986491158605e-005;
	setAttr -s 5 ".wl[185].w";
	setAttr ".wl[185].w[53]" 0.0005416999920271337;
	setAttr ".wl[185].w[59:62]" 0.0042053409852087498 0.030487285926938057 
		0.96303534507751465 0.0017304625362157822;
	setAttr -s 5 ".wl[186].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[187].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[188].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[189].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[190].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[191].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[192].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[193].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[194].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[195].w[54:58]"  0.0020055638 0.013226609 
		0.49022925 0.48097143 0.013567106;
	setAttr -s 5 ".wl[196].w[54:58]"  0.0022094245 0.02657461 0.81023127 
		0.15838145 0.0026031963;
	setAttr -s 5 ".wl[197].w[54:58]"  0.0022094245 0.02657461 0.81023127 
		0.15838145 0.0026031963;
	setAttr -s 5 ".wl[198].w";
	setAttr ".wl[198].w[53:54]" 0.5322413444519043 0.037524107843637466;
	setAttr ".wl[198].w[59]" 0.16502721607685089;
	setAttr ".wl[198].w[63]" 0.16054815053939819;
	setAttr ".wl[198].w[67]" 0.10465910285711288;
	setAttr ".wl[199].w[26]"  1;
	setAttr ".wl[200].w[26]"  1;
	setAttr ".wl[201].w[26]"  1;
	setAttr -s 2 ".wl[202].w[25:26]"  0.045617647 0.95438236;
	setAttr ".wl[203].w[26]"  1;
	setAttr -s 2 ".wl[204].w[26:27]"  0.95069414 0.049305882;
	setAttr ".wl[205].w[26]"  1;
	setAttr ".wl[206].w[26]"  1;
	setAttr ".wl[207].w[26]"  1;
	setAttr ".wl[208].w[26]"  1;
	setAttr ".wl[209].w[26]"  1;
	setAttr ".wl[210].w[26]"  1;
	setAttr ".wl[211].w[26]"  1;
	setAttr ".wl[212].w[26]"  1;
	setAttr ".wl[213].w[26]"  1;
	setAttr ".wl[214].w[26]"  1;
	setAttr ".wl[215].w[26]"  1;
	setAttr ".wl[216].w[26]"  1;
	setAttr ".wl[217].w[26]"  1;
	setAttr ".wl[218].w[26]"  1;
	setAttr ".wl[219].w[26]"  1;
	setAttr ".wl[220].w[26]"  1;
	setAttr ".wl[221].w[26]"  1;
	setAttr ".wl[222].w[26]"  1;
	setAttr ".wl[223].w[26]"  1;
	setAttr ".wl[224].w[26]"  1;
	setAttr ".wl[225].w[26]"  1;
	setAttr ".wl[226].w[26]"  1;
	setAttr ".wl[227].w[26]"  1;
	setAttr ".wl[228].w[26]"  1;
	setAttr ".wl[229].w[26]"  1;
	setAttr ".wl[230].w[26]"  1;
	setAttr ".wl[231].w[26]"  1;
	setAttr ".wl[232].w[26]"  1;
	setAttr ".wl[233].w[26]"  1;
	setAttr ".wl[234].w[26]"  1;
	setAttr ".wl[235].w[26]"  1;
	setAttr ".wl[236].w[26]"  1;
	setAttr ".wl[237].w[26]"  1;
	setAttr ".wl[238].w[26]"  1;
	setAttr ".wl[239].w[26]"  1;
	setAttr ".wl[240].w[26]"  1;
	setAttr ".wl[241].w[26]"  1;
	setAttr ".wl[242].w[26]"  1;
	setAttr ".wl[243].w[26]"  1;
	setAttr ".wl[244].w[26]"  1;
	setAttr ".wl[245].w[26]"  1;
	setAttr ".wl[246].w[26]"  1;
	setAttr ".wl[247].w[26]"  1;
	setAttr ".wl[248].w[26]"  1;
	setAttr ".wl[249].w[26]"  1;
	setAttr -s 5 ".wl[250].w";
	setAttr ".wl[250].w[24]" 0.013803333044052124;
	setAttr ".wl[250].w[50:53]" 0.48208078742027283 0.50222229957580566 
		0.0018065361073240638 8.7002335931174457e-005;
	setAttr -s 5 ".wl[251].w";
	setAttr ".wl[251].w[24]" 0.027335187420248985;
	setAttr ".wl[251].w[50:53]" 0.57448291778564453 0.39249500632286072 
		0.0053603639826178551 0.00032653054222464561;
	setAttr -s 5 ".wl[252].w";
	setAttr ".wl[252].w[24]" 0.050928745418787003;
	setAttr ".wl[252].w[50:53]" 0.27250614762306213 0.66704404354095459 
		0.0089709032326936722 0.00055022217566147447;
	setAttr -s 5 ".wl[253].w";
	setAttr ".wl[253].w[24]" 0.0031574622262269258;
	setAttr ".wl[253].w[50:53]" 0.62147819995880127 0.37520182132720947 
		0.00015621016791556031 6.290616965998197e-006;
	setAttr -s 2 ".wl[254].w[50:51]"  0.47850001 0.52149999;
	setAttr -s 71 ".wl[255].w[0:70]"  0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.42338079 0.50988621 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 0.00096714473 
		0.00096714473 0.00096714473 0.00096714473;
	setAttr -s 71 ".wl[256].w[0:70]"  0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.64566356 0.21823156 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 0.0019725342 
		0.0019725342 0.0019725342 0.0019725342;
	setAttr -s 5 ".wl[257].w";
	setAttr ".wl[257].w[24]" 0.052823442965745926;
	setAttr ".wl[257].w[50:53]" 0.41526797413825989 0.52919989824295044 
		0.002604614244773984 0.00010407009540358558;
	setAttr ".wl[258].w[51]"  1;
	setAttr ".wl[259].w[51]"  1;
	setAttr -s 2 ".wl[260].w[50:51]"  0.27327883 0.72672117;
	setAttr ".wl[261].w[51]"  1;
	setAttr -s 2 ".wl[262].w[50:51]"  0.095661178 0.90433884;
	setAttr -s 2 ".wl[263].w[50:51]"  0.28469294 0.71530706;
	setAttr -s 71 ".wl[264].w[0:70]"  0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.087584294 0.81214404 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 0.0014532126 
		0.0014532126 0.0014532126 0.0014532126;
	setAttr -s 5 ".wl[265].w";
	setAttr ".wl[265].w[24]" 0.0081894807517528534;
	setAttr ".wl[265].w[50:53]" 0.32495185732841492 0.66472756862640381 
		0.0020757904276251793 5.5289310694206506e-005;
	setAttr -s 5 ".wl[266].w";
	setAttr ".wl[266].w[51:54]" 0.49085038900375366 0.50814664363861084 
		0.00045108786434866488 0.00044133732444606721;
	setAttr ".wl[266].w[59]" 0.00011048925807699561;
	setAttr -s 5 ".wl[267].w";
	setAttr ".wl[267].w[51:54]" 0.47261932492256165 0.52457040548324585 
		0.001258109463378787 0.0012579568428918719;
	setAttr ".wl[267].w[59]" 0.00029411487048491836;
	setAttr -s 5 ".wl[268].w";
	setAttr ".wl[268].w[51:54]" 0.47047457098960876 0.52449089288711548 
		0.0022595957852900028 0.0022595957852900028;
	setAttr ".wl[268].w[59]" 0.0005152979283593595;
	setAttr -s 5 ".wl[269].w";
	setAttr ".wl[269].w[24]" 8.6840125732123852e-005;
	setAttr ".wl[269].w[50:53]" 0.00012477106065489352 0.51839357614517212 
		0.48129114508628845 0.00010377258149674162;
	setAttr -s 5 ".wl[270].w";
	setAttr ".wl[270].w[24]" 5.5128686653915793e-005;
	setAttr ".wl[270].w[50:53]" 7.6252013968769461e-005 0.51968932151794434 
		0.48012164235115051 5.7622852182248607e-005;
	setAttr -s 5 ".wl[271].w";
	setAttr ".wl[271].w[51:54]" 0.4826042652130127 0.51263153553009033 
		0.0021290488075464964 0.0021290488075464964;
	setAttr ".wl[271].w[59]" 0.00050619605462998152;
	setAttr -s 5 ".wl[272].w";
	setAttr ".wl[272].w[24]" 0.00023538469395134598;
	setAttr ".wl[272].w[50:53]" 0.00032527110306546092 0.53121095895767212 
		0.46791034936904907 0.00031801426666788757;
	setAttr -s 5 ".wl[273].w";
	setAttr ".wl[273].w[24]" 0.00029141336563043296;
	setAttr ".wl[273].w[50:53]" 0.00039162905886769295 0.50113928318023682 
		0.49787217378616333 0.00030562042957171798;
	setAttr -s 5 ".wl[274].w";
	setAttr ".wl[274].w[24]" 0.00011449945304775611;
	setAttr ".wl[274].w[50:53]" 0.00018327770521864295 0.98150312900543213 
		0.018145246431231499 5.3847335948375985e-005;
	setAttr -s 5 ".wl[275].w";
	setAttr ".wl[275].w[24]" 0.0015334633644670248;
	setAttr ".wl[275].w[50:53]" 0.0024405834265053272 0.89430385828018188 
		0.10066527128219604 0.0010568237630650401;
	setAttr -s 5 ".wl[276].w";
	setAttr ".wl[276].w[24]" 0.00052636262262240052;
	setAttr ".wl[276].w[50:53]" 0.000802686030510813 0.96975082159042358 
		0.028463192284107208 0.00045693776337429881;
	setAttr -s 5 ".wl[277].w";
	setAttr ".wl[277].w[24]" 0.0016092429868876934;
	setAttr ".wl[277].w[50:53]" 0.0027813771739602089 0.97718417644500732 
		0.018292509019374847 0.00013271806528791785;
	setAttr ".wl[278].w[51]"  1;
	setAttr ".wl[279].w[51]"  1;
	setAttr ".wl[280].w[51]"  1;
	setAttr ".wl[281].w[51]"  1;
	setAttr -s 5 ".wl[282].w";
	setAttr ".wl[282].w[51:54]" 0.052652396261692047 0.93675011396408081 
		0.004998338408768177 0.0048341178335249424;
	setAttr ".wl[282].w[59]" 0.00076497835107147694;
	setAttr -s 5 ".wl[283].w";
	setAttr ".wl[283].w[51:54]" 0.062401622533798218 0.90900969505310059 
		0.013410177081823349 0.013410177081823349;
	setAttr ".wl[283].w[59]" 0.0017682833131402731;
	setAttr -s 5 ".wl[284].w";
	setAttr ".wl[284].w[51:54]" 0.080738574266433716 0.87474673986434937 
		0.020941412076354027 0.020941412076354027;
	setAttr ".wl[284].w[59]" 0.0026318852324038744;
	setAttr -s 5 ".wl[285].w";
	setAttr ".wl[285].w[51:54]" 0.041644349694252014 0.95303618907928467 
		0.0026208220515400171 0.0022720308043062687;
	setAttr ".wl[285].w[59]" 0.00042657781159505248;
	setAttr -s 5 ".wl[286].w";
	setAttr ".wl[286].w[51:54]" 0.062954522669315338 0.92914384603500366 
		0.0040151653811335564 0.0031873744446784258;
	setAttr ".wl[286].w[59]" 0.00069899676600471139;
	setAttr -s 5 ".wl[287].w";
	setAttr ".wl[287].w[51:54]" 0.10475683212280273 0.84121710062026978 
		0.025260841473937035 0.025260841473937035;
	setAttr ".wl[287].w[59]" 0.0035043321549892426;
	setAttr -s 5 ".wl[288].w";
	setAttr ".wl[288].w[51:54]" 0.092811703681945801 0.88606530427932739 
		0.010154612362384796 0.0092775085940957069;
	setAttr ".wl[288].w[59]" 0.0016908406978473067;
	setAttr -s 5 ".wl[289].w";
	setAttr ".wl[289].w[51:54]" 0.1184784471988678 0.86058974266052246 
		0.010572065599262714 0.0084179723635315895;
	setAttr ".wl[289].w[59]" 0.0019417607691138983;
	setAttr -s 5 ".wl[290].w";
	setAttr ".wl[290].w[51:54]" 0.43416297435760498 0.56448191404342651 
		0.00061285617994144559 0.00059901765780523419;
	setAttr ".wl[290].w[59]" 0.00014325446682050824;
	setAttr -s 5 ".wl[291].w";
	setAttr ".wl[291].w[51:54]" 0.42157062888145447 0.57368576526641846 
		0.0021366500295698643 0.0021366500295698643;
	setAttr ".wl[291].w[59]" 0.00047027139225974679;
	setAttr -s 5 ".wl[292].w";
	setAttr ".wl[292].w[51:54]" 0.42473241686820984 0.56958931684494019 
		0.0025612202007323503 0.0025612202007323503;
	setAttr ".wl[292].w[59]" 0.00055573857389390469;
	setAttr -s 5 ".wl[293].w";
	setAttr ".wl[293].w[51:54]" 0.47968947887420654 0.52002936601638794 
		0.00012932516983710229 0.00011979760893154889;
	setAttr ".wl[293].w[59]" 3.1997922633308917e-005;
	setAttr -s 5 ".wl[294].w";
	setAttr ".wl[294].w[51:54]" 0.49643740057945251 0.50321388244628906 
		0.00016227961168624461 0.00014464218111243099;
	setAttr ".wl[294].w[59]" 4.1776907892199233e-005;
	setAttr -s 5 ".wl[295].w";
	setAttr ".wl[295].w[51:54]" 0.4404338002204895 0.5540841817855835 
		0.0024628245737403631 0.0024628245737403631;
	setAttr ".wl[295].w[59]" 0.00055634247837588191;
	setAttr -s 5 ".wl[296].w";
	setAttr ".wl[296].w[51:54]" 0.43196061253547668 0.56574761867523193 
		0.0010520691284909844 0.0009882455924525857;
	setAttr ".wl[296].w[59]" 0.00025156320771202445;
	setAttr -s 5 ".wl[297].w";
	setAttr ".wl[297].w[51:54]" 0.49919155240058899 0.49929499626159668 
		0.00070195645093917847 0.00062402943149209023;
	setAttr ".wl[297].w[59]" 0.00018735417688731104;
	setAttr ".wl[298].w[26]"  1;
	setAttr ".wl[299].w[26]"  1;
	setAttr ".wl[300].w[26]"  1;
	setAttr ".wl[301].w[26]"  1;
	setAttr -s 2 ".wl[302].w[25:26]"  0.078811765 0.92118824;
	setAttr -s 2 ".wl[303].w[25:26]"  0.045811765 0.95418817;
	setAttr ".wl[304].w[26]"  1;
	setAttr ".wl[305].w[26]"  1;
	setAttr ".wl[306].w[26]"  1;
	setAttr ".wl[307].w[26]"  1;
	setAttr ".wl[308].w[26]"  1;
	setAttr ".wl[309].w[26]"  1;
	setAttr ".wl[310].w[26]"  1;
	setAttr ".wl[311].w[26]"  1;
	setAttr -s 5 ".wl[312].w[24:28]"  0.061605956 0.38909712 0.53688657 
		0.0043488629 0.0080615245;
	setAttr -s 5 ".wl[313].w[24:28]"  0.022509409 0.025114441 0.87421173 
		0.018025286 0.060139138;
	setAttr ".wl[314].w[26]"  1;
	setAttr ".wl[315].w[26]"  1;
	setAttr -s 2 ".wl[316].w[25:26]"  0.049305882 0.95069414;
	setAttr -s 5 ".wl[317].w[24:28]"  0.010955827 0.26658621 0.72104472 
		0.00093261653 0.00048062543;
	setAttr ".wl[318].w[26]"  1;
	setAttr ".wl[319].w[26]"  1;
	setAttr -s 2 ".wl[320].w[25:26]"  0.049305882 0.95069414;
	setAttr -s 5 ".wl[321].w[24:28]"  0.098260172 0.59210819 0.30877516 
		0.00047203433 0.00038445255;
	setAttr -s 5 ".wl[322].w[24:28]"  0.27432242 0.40344477 0.31416565 
		0.0020982465 0.0059688962;
	setAttr -s 5 ".wl[323].w[24:28]"  0.11827525 0.58880603 0.29086599 
		0.0010709071 0.0009818367;
	setAttr -s 5 ".wl[324].w[24:28]"  0.22590937 0.42850986 0.33893737 
		0.0017279452 0.0049154973;
	setAttr -s 4 ".wl[325].w";
	setAttr ".wl[325].w[22]" 0.0038428038824349642;
	setAttr ".wl[325].w[25:27]" 0.36292240023612976 0.63188391923904419 
		0.0013508605770766735;
	setAttr -s 4 ".wl[326].w";
	setAttr ".wl[326].w[22]" 0.0056358780711889267;
	setAttr ".wl[326].w[25:27]" 0.38093560934066772 0.61144733428955078 
		0.001981180626899004;
	setAttr -s 5 ".wl[327].w[24:28]"  0.1646191 0.6361205 0.19640329 
		0.0014905301 0.0013665562;
	setAttr -s 2 ".wl[328].w[24:25]"  0.87638587 0.12361412;
	setAttr -s 2 ".wl[329].w[24:25]"  0.95185882 0.048141178;
	setAttr -s 2 ".wl[330].w[24:25]"  0.94285178 0.057148237;
	setAttr -s 2 ".wl[331].w[24:25]"  0.82079059 0.17920941;
	setAttr -s 2 ".wl[332].w[24:25]"  0.92607999 0.073919997;
	setAttr ".wl[333].w[24]"  1;
	setAttr ".wl[334].w[24]"  1;
	setAttr ".wl[335].w[24]"  1;
	setAttr ".wl[336].w[24]"  1;
	setAttr -s 5 ".wl[337].w";
	setAttr ".wl[337].w[24:25]" 0.36342570185661316 0.11785588413476944;
	setAttr ".wl[337].w[29:31]" 0.4681536853313446 0.037421181797981262 
		0.013143528252840042;
	setAttr -s 5 ".wl[338].w";
	setAttr ".wl[338].w[24:25]" 0.37255820631980896 0.034975510090589523;
	setAttr ".wl[338].w[50:52]" 0.44960469007492065 0.13893243670463562 
		0.0039291530847549438;
	setAttr ".wl[339].w[24]"  1;
	setAttr -s 5 ".wl[340].w";
	setAttr ".wl[340].w[22:25]" 2.7165349365532165e-006 7.509050647058757e-006 
		0.99999719858169556 2.5916982338003436e-008;
	setAttr ".wl[340].w[29]" 6.0101200460849213e-008;
	setAttr -s 5 ".wl[341].w";
	setAttr ".wl[341].w[23:25]" 0.0013043356593698263 0.11816530674695969 
		0.00031792066874913871;
	setAttr ".wl[341].w[29]" 0.00011445427662692964;
	setAttr ".wl[341].w[50]" 0.88009798526763916;
	setAttr -s 5 ".wl[342].w";
	setAttr ".wl[342].w[24]" 0.16123273968696594;
	setAttr ".wl[342].w[29:32]" 0.80621433258056641 0.017653172835707664 
		0.013623102568089962 0.001276652910746634;
	setAttr -s 5 ".wl[343].w";
	setAttr ".wl[343].w[24]" 0.044593840837478638;
	setAttr ".wl[343].w[50:53]" 0.83803600072860718 0.11279016733169556 
		0.0041956999339163303 0.00038429655251093209;
	setAttr -s 5 ".wl[344].w";
	setAttr ".wl[344].w[23:25]" 0.00088264630176126957 0.84739851951599121 
		0.00021513948740903288;
	setAttr ".wl[344].w[29]" 0.15142624080181122;
	setAttr ".wl[344].w[50]" 7.7452095865737647e-005;
	setAttr -s 5 ".wl[345].w";
	setAttr ".wl[345].w[24:25]" 0.014161992818117142 0.0034500544425100088;
	setAttr ".wl[345].w[50:52]" 0.90810608863830566 0.074078269302845001 
		0.0002035934739978984;
	setAttr -s 5 ".wl[346].w";
	setAttr ".wl[346].w[24:25]" 0.0098285535350441933 0.00025779521092772484;
	setAttr ".wl[346].w[50:52]" 0.95304137468338013 0.036852676421403885 
		1.9600329324021004e-005;
	setAttr -s 5 ".wl[347].w";
	setAttr ".wl[347].w[24:25]" 0.20579513907432556 0.050134662538766861;
	setAttr ".wl[347].w[29:31]" 0.64529305696487427 0.09581129252910614 
		0.0029658891726285219;
	setAttr -s 5 ".wl[348].w";
	setAttr ".wl[348].w[24:25]" 0.26533988118171692 0.13601556420326233;
	setAttr ".wl[348].w[29:31]" 0.54028862714767456 0.043187178671360016 
		0.015168732032179832;
	setAttr -s 5 ".wl[349].w";
	setAttr ".wl[349].w[24:25]" 0.018507899716496468 0.0094872443005442619;
	setAttr ".wl[349].w[50:52]" 0.88692229986190796 0.084016755223274231 
		0.0010657981038093567;
	setAttr -s 5 ".wl[350].w";
	setAttr ".wl[350].w[24:25]" 0.32313844561576843 0.008475329726934433;
	setAttr ".wl[350].w[29:31]" 0.6225743293762207 0.045159969478845596 
		0.00065194797934964299;
	setAttr -s 6 ".wl[351].w";
	setAttr ".wl[351].w[0:1]" 2.3214095923318467e-010 1.5121180695132352e-005;
	setAttr ".wl[351].w[21:24]" 2.9133451207030703e-009 1.7069631041977118e-007 
		0.0001065368705894798 0.9998781681060791;
	setAttr -s 3 ".wl[352].w";
	setAttr ".wl[352].w[24]" 0.26495504379272461;
	setAttr ".wl[352].w[50:51]" 0.66051787137985229 0.074527032673358917;
	setAttr -s 2 ".wl[353].w";
	setAttr ".wl[353].w[24]" 0.75347059965133667;
	setAttr ".wl[353].w[50]" 0.24652941524982452;
	setAttr -s 3 ".wl[354].w";
	setAttr ".wl[354].w[24]" 0.40694311261177063;
	setAttr ".wl[354].w[29:30]" 0.49560987949371338 0.09744706004858017;
	setAttr -s 3 ".wl[355].w";
	setAttr ".wl[355].w[1]" 3.1972318538464606e-005;
	setAttr ".wl[355].w[24]" 0.88235294818878174;
	setAttr ".wl[355].w[29]" 0.11761508136987686;
	setAttr -s 3 ".wl[356].w";
	setAttr ".wl[356].w[1]" 0.00088025856530293822;
	setAttr ".wl[356].w[24]" 0.62018537521362305;
	setAttr ".wl[356].w[50]" 0.37893438339233398;
	setAttr ".wl[357].w[24]"  1;
	setAttr -s 5 ".wl[358].w";
	setAttr ".wl[358].w[24]" 0.061097472906112671;
	setAttr ".wl[358].w[29:32]" 0.43424338102340698 0.49620199203491211 
		0.0080737974494695663 0.00038336872239597142;
	setAttr -s 5 ".wl[359].w";
	setAttr ".wl[359].w[24]" 0.091494917869567871;
	setAttr ".wl[359].w[29:32]" 0.50647282600402832 0.38317611813545227 
		0.017766319215297699 0.0010898228501901031;
	setAttr -s 5 ".wl[360].w";
	setAttr ".wl[360].w[24]" 0.084922999143600464;
	setAttr ".wl[360].w[29:32]" 0.60417360067367554 0.29538914561271667 
		0.014595814049243927 0.00091842084657400846;
	setAttr -s 5 ".wl[361].w";
	setAttr ".wl[361].w[24]" 0.024459090083837509;
	setAttr ".wl[361].w[29:32]" 0.40436854958534241 0.56989222764968872 
		0.001231462461873889 4.8728685214882717e-005;
	setAttr -s 5 ".wl[362].w";
	setAttr ".wl[362].w[24]" 0.059840038418769836;
	setAttr ".wl[362].w[29:32]" 0.29730147123336792 0.64156854152679443 
		0.0012411671923473477 4.8789501306600869e-005;
	setAttr -s 5 ".wl[363].w";
	setAttr ".wl[363].w[24]" 0.062864542007446289;
	setAttr ".wl[363].w[29:32]" 0.49607312679290771 0.42945325374603271 
		0.010944469831883907 0.00066461414098739624;
	setAttr -s 5 ".wl[364].w";
	setAttr ".wl[364].w[24]" 0.10137728601694107;
	setAttr ".wl[364].w[29:32]" 0.52107930183410645 0.37147781252861023 
		0.0057888301089406013 0.00027677492471411824;
	setAttr -s 5 ".wl[365].w";
	setAttr ".wl[365].w[24]" 0.11212353408336639;
	setAttr ".wl[365].w[29:32]" 0.45216599106788635 0.43004289269447327 
		0.0054467110894620419 0.00022090204583946615;
	setAttr -s 6 ".wl[366].w";
	setAttr ".wl[366].w[0:1]" 1.0795803063956555e-005 0.0012383991852402687;
	setAttr ".wl[366].w[21:24]" 0.00078577635576948524 0.0011358873452991247 
		1.1433467079768889e-005 0.99681770801544189;
	setAttr -s 6 ".wl[367].w";
	setAttr ".wl[367].w[0:1]" 0.0018353742780163884 0.00017470368766225874;
	setAttr ".wl[367].w[21:24]" 0.0025426389183849096 0.002440630691125989 
		0.00084978912491351366 0.99215686321258545;
	setAttr ".wl[368].w[24]"  1;
	setAttr -s 6 ".wl[369].w";
	setAttr ".wl[369].w[0:1]" 1.215051497638342e-006 4.6655492269565002e-007;
	setAttr ".wl[369].w[21:24]" 1.6832833580338047e-006 1.6157561049112701e-006 
		5.6258613767568022e-007 1;
	setAttr -s 6 ".wl[370].w";
	setAttr ".wl[370].w[0:1]" 7.4439553827687632e-006 4.1181476262863725e-005;
	setAttr ".wl[370].w[21:24]" 8.8054621301125735e-006 8.5490137280430645e-006 
		4.7112011998251546e-006 0.99992930889129639;
	setAttr -s 2 ".wl[371].w";
	setAttr ".wl[371].w[1]" 7.3909759521484375e-006;
	setAttr ".wl[371].w[24]" 0.99999260902404785;
	setAttr ".wl[372].w[24]"  1;
	setAttr ".wl[373].w[23]"  1;
	setAttr ".wl[374].w[23]"  1;
	setAttr ".wl[375].w[23]"  1;
	setAttr ".wl[376].w[23]"  1;
	setAttr ".wl[377].w[23]"  1;
	setAttr ".wl[378].w[23]"  1;
	setAttr ".wl[379].w[23]"  1;
	setAttr -s 6 ".wl[380].w";
	setAttr ".wl[380].w[0:1]" 0.012367815710604191 0.0012019119458273053;
	setAttr ".wl[380].w[7]" 3.2078653021017089e-005;
	setAttr ".wl[380].w[14]" 3.2078616641229019e-005;
	setAttr ".wl[380].w[21:22]" 0.021660231053829193 0.96470588445663452;
	setAttr -s 6 ".wl[381].w";
	setAttr ".wl[381].w[0:1]" 0.0029691790696233511 0.00048686290392652154;
	setAttr ".wl[381].w[7]" 0.00013046702952124178;
	setAttr ".wl[381].w[14]" 0.0010283606825396419;
	setAttr ".wl[381].w[21:22]" 0.0032282669562846422 0.99215686321258545;
	setAttr ".wl[382].w[22]"  1;
	setAttr ".wl[383].w[22]"  1;
	setAttr ".wl[384].w[22]"  1;
	setAttr ".wl[385].w[22]"  1;
	setAttr -s 6 ".wl[386].w";
	setAttr ".wl[386].w[0:1]" 0.10769885033369064 0.018261119723320007;
	setAttr ".wl[386].w[7]" 0.0066007464192807674;
	setAttr ".wl[386].w[14]" 0.0014015776105225086;
	setAttr ".wl[386].w[21:22]" 0.15231218934059143 0.7137255072593689;
	setAttr ".wl[387].w[21]"  1;
	setAttr -s 6 ".wl[388].w";
	setAttr ".wl[388].w[0:1]" 0.0015470848884433508 0.00024014795781113207;
	setAttr ".wl[388].w[7]" 4.2370891605969518e-005;
	setAttr ".wl[388].w[14]" 0.0013673765351995826;
	setAttr ".wl[388].w[21:22]" 0.00072458811337128282 0.99607843160629272;
	setAttr -s 6 ".wl[389].w";
	setAttr ".wl[389].w[0:1]" 0.10134503245353699 0.010346121154725552;
	setAttr ".wl[389].w[7]" 0.0022859817836433649;
	setAttr ".wl[389].w[14]" 0.02543053962290287;
	setAttr ".wl[389].w[21:22]" 0.048827607184648514 0.81176471710205078;
	setAttr -s 6 ".wl[390].w";
	setAttr ".wl[390].w[0:1]" 0.017706498503684998 0.0027404280845075846;
	setAttr ".wl[390].w[7]" 0.015649756416678429;
	setAttr ".wl[390].w[14]" 0.00048494472866877913;
	setAttr ".wl[390].w[21:22]" 0.010477193631231785 0.9529411792755127;
	setAttr ".wl[391].w[22]"  1;
	setAttr -s 6 ".wl[392].w";
	setAttr ".wl[392].w[0:1]" 0.0014670442324131727 0.00024262067745439708;
	setAttr ".wl[392].w[7]" 0.00010718756675487384;
	setAttr ".wl[392].w[14]" 0.0014406940899789333;
	setAttr ".wl[392].w[21:22]" 0.00066402199445292354 0.99607843160629272;
	setAttr -s 6 ".wl[393].w";
	setAttr ".wl[393].w[0:1]" 0.0019357827259227633 0.00019762707233894616;
	setAttr ".wl[393].w[7]" 0.00048576146946288645;
	setAttr ".wl[393].w[14]" 4.3666161218425259e-005;
	setAttr ".wl[393].w[21:22]" 0.001258731004782021 0.99607843160629272;
	setAttr -s 2 ".wl[394].w";
	setAttr ".wl[394].w[0]" 0.0039215683937072754;
	setAttr ".wl[394].w[21]" 0.99607843160629272;
	setAttr ".wl[395].w[0]"  1;
	setAttr ".wl[396].w[0]"  1;
	setAttr ".wl[397].w[0]"  1;
	setAttr ".wl[398].w[0]"  1;
	setAttr -s 5 ".wl[399].w";
	setAttr ".wl[399].w[0:1]" 0.99799233675003052 2.1955404008622281e-005;
	setAttr ".wl[399].w[7]" 3.2615189411444589e-005;
	setAttr ".wl[399].w[14]" 0.0019139263313263655;
	setAttr ".wl[399].w[21]" 3.9166312490124255e-005;
	setAttr ".wl[400].w[0]"  1;
	setAttr ".wl[401].w[0]"  1;
	setAttr ".wl[402].w[0]"  1;
	setAttr ".wl[403].w[0]"  1;
	setAttr ".wl[404].w[0]"  1;
	setAttr ".wl[405].w[0]"  1;
	setAttr ".wl[406].w[0]"  1;
	setAttr ".wl[407].w[0]"  1;
	setAttr ".wl[408].w[0]"  1;
	setAttr ".wl[409].w[0]"  1;
	setAttr ".wl[410].w[0]"  1;
	setAttr ".wl[411].w[0]"  1;
	setAttr ".wl[412].w[0]"  1;
	setAttr ".wl[413].w[0]"  1;
	setAttr ".wl[414].w[0]"  1;
	setAttr ".wl[415].w[0]"  1;
	setAttr ".wl[416].w[0]"  1;
	setAttr ".wl[417].w[0]"  1;
	setAttr ".wl[418].w[0]"  1;
	setAttr ".wl[419].w[0]"  1;
	setAttr -s 5 ".wl[420].w";
	setAttr ".wl[420].w[0:1]" 0.98705458641052246 0.0017947698943316936;
	setAttr ".wl[420].w[14:16]" 0.010840539820492268 0.00029580193222500384 
		1.4301274859462865e-005;
	setAttr ".wl[421].w[0]"  1;
	setAttr -s 5 ".wl[422].w";
	setAttr ".wl[422].w[0:3]" 0.96373826265335083 0.032162182033061981 
		0.003931170329451561 1.0217437193205114e-005;
	setAttr ".wl[422].w[7]" 0.00015816620725672692;
	setAttr -s 5 ".wl[423].w";
	setAttr ".wl[423].w[0:3]" 0.89951437711715698 0.08593297004699707 
		0.01401606947183609 2.6416988475830294e-005;
	setAttr ".wl[423].w[7]" 0.00051016634097322822;
	setAttr -s 5 ".wl[424].w";
	setAttr ".wl[424].w[0:3]" 0.64686262607574463 0.3114471435546875 
		0.040390085428953171 8.1467980635352433e-005;
	setAttr ".wl[424].w[7]" 0.0012186761014163494;
	setAttr -s 5 ".wl[425].w";
	setAttr ".wl[425].w[0:3]" 0.9343268871307373 0.055855050683021545 
		0.0086677102372050285 1.7793223378248513e-005;
	setAttr ".wl[425].w[7]" 0.0011325590312480927;
	setAttr -s 5 ".wl[426].w";
	setAttr ".wl[426].w[0:3]" 0.75705975294113159 0.20909956097602844 
		0.030151046812534332 7.0634800067637116e-005;
	setAttr ".wl[426].w[7]" 0.0036190040409564972;
	setAttr -s 5 ".wl[427].w";
	setAttr ".wl[427].w[0:3]" 0.56211155652999878 0.4338347315788269 
		0.0013231133343651891 0.00015206045645754784;
	setAttr ".wl[427].w[7]" 0.0025785523466765881;
	setAttr -s 5 ".wl[428].w";
	setAttr ".wl[428].w[0:3]" 0.63433754444122314 0.34695374965667725 
		0.015960365533828735 0.00016922786016948521;
	setAttr ".wl[428].w[7]" 0.002579099265858531;
	setAttr -s 5 ".wl[429].w";
	setAttr ".wl[429].w[0:3]" 0.78180301189422607 0.20278696715831757 
		0.011200188659131527 0.00011125599849037826;
	setAttr ".wl[429].w[7]" 0.0040985755622386932;
	setAttr -s 5 ".wl[430].w";
	setAttr ".wl[430].w[0:3]" 0.027393532916903496 0.9426044225692749 
		0.012946677394211292 0.0067715514451265335;
	setAttr ".wl[430].w[7]" 0.01028387900441885;
	setAttr -s 5 ".wl[431].w";
	setAttr ".wl[431].w[0:3]" 0.096004322171211243 0.90007692575454712 
		0.0025385536719113588 0.00021174992434680462;
	setAttr ".wl[431].w[7]" 0.0011685529025271535;
	setAttr -s 5 ".wl[432].w";
	setAttr ".wl[432].w[0:3]" 0.086314953863620758 0.90856939554214478 
		0.0035592967178672552 0.00027947864145971835;
	setAttr ".wl[432].w[7]" 0.0012768016895279288;
	setAttr -s 5 ".wl[433].w";
	setAttr ".wl[433].w[0:3]" 0.092639751732349396 0.90268367528915405 
		0.0024732260499149561 0.00020552778732962906;
	setAttr ".wl[433].w[7]" 0.0019977865740656853;
	setAttr -s 5 ".wl[434].w";
	setAttr ".wl[434].w[0:3]" 0.083697624504566193 0.91032534837722778 
		0.0033997646532952785 0.000266638322500512;
	setAttr ".wl[434].w[7]" 0.0023106620647013187;
	setAttr -s 5 ".wl[435].w";
	setAttr ".wl[435].w[0:3]" 0.065320111811161041 0.92907601594924927 
		0.0037164574023336172 0.00028570392169058323;
	setAttr ".wl[435].w[7]" 0.0016017116140574217;
	setAttr -s 5 ".wl[436].w";
	setAttr ".wl[436].w[0:3]" 0.14593034982681274 0.84387362003326416 
		0.0067950231023132801 0.00056292349472641945;
	setAttr ".wl[436].w[7]" 0.0028381561860442162;
	setAttr -s 5 ".wl[437].w";
	setAttr ".wl[437].w[0:3]" 0.14341200888156891 0.8450741171836853 
		0.0064699216745793819 0.00053596118232235312;
	setAttr ".wl[437].w[7]" 0.0045081027783453465;
	setAttr -s 5 ".wl[438].w";
	setAttr ".wl[438].w[0:3]" 0.00016089894052129239 0.40823101997375488 
		0.59088581800460815 0.00069510017056018114;
	setAttr ".wl[438].w[7]" 2.7159168894286267e-005;
	setAttr -s 5 ".wl[439].w";
	setAttr ".wl[439].w[0:3]" 0.00038923585088923573 0.44287323951721191 
		0.55532920360565186 0.0013488359982147813;
	setAttr ".wl[439].w[7]" 5.9493453591130674e-005;
	setAttr -s 5 ".wl[440].w";
	setAttr ".wl[440].w[0:3]" 0.00023358836187981069 0.42789202928543091 
		0.57084941864013672 0.00098837667610496283;
	setAttr ".wl[440].w[7]" 3.6581612221198156e-005;
	setAttr -s 5 ".wl[441].w";
	setAttr ".wl[441].w[0:3]" 0.00035641875001601875 0.44207707047462463 
		0.55624926090240479 0.0012530130334198475;
	setAttr ".wl[441].w[7]" 6.4250401919707656e-005;
	setAttr -s 5 ".wl[442].w";
	setAttr ".wl[442].w[0:3]" 0.00022784923203289509 0.43228799104690552 
		0.566475510597229 0.00096604647114872932;
	setAttr ".wl[442].w[7]" 4.2599800508469343e-005;
	setAttr -s 5 ".wl[443].w";
	setAttr ".wl[443].w[0:3]" 0.00022982752125244588 0.42895454168319702 
		0.56974917650222778 0.0010265135206282139;
	setAttr ".wl[443].w[7]" 3.9947553887031972e-005;
	setAttr -s 5 ".wl[444].w";
	setAttr ".wl[444].w[0:3]" 0.00037040261668153107 0.42599990963935852 
		0.57219207286834717 0.0013790325028821826;
	setAttr ".wl[444].w[7]" 5.8563673519529402e-005;
	setAttr -s 5 ".wl[445].w";
	setAttr ".wl[445].w[0:3]" 0.00037538929609581828 0.42655003070831299 
		0.57161885499954224 0.001386975753121078;
	setAttr ".wl[445].w[7]" 6.8728877522516996e-005;
	setAttr -s 5 ".wl[446].w[0:4]"  1.43798e-005 0.0006243845 
		0.59096569 0.40805113 0.00034443528;
	setAttr -s 5 ".wl[447].w[0:4]"  4.309215e-005 0.0019410066 
		0.59927046 0.39787531 0.00087018078;
	setAttr -s 5 ".wl[448].w[0:4]"  2.6060783e-005 0.0011316497 
		0.57446927 0.4237639 0.00060905353;
	setAttr -s 5 ".wl[449].w[0:4]"  3.6598383e-005 0.0016536413 
		0.60406828 0.39349207 0.00074939884;
	setAttr -s 5 ".wl[450].w[0:4]"  2.4450872e-005 0.0010632501 
		0.57628483 0.42205417 0.00057326967;
	setAttr -s 5 ".wl[451].w[0:4]"  2.4494784e-005 0.0010707134 
		0.57303226 0.42528841 0.00058405648;
	setAttr -s 5 ".wl[452].w[0:4]"  4.3164226e-005 0.0019530831 
		0.59221333 0.40489146 0.00089897838;
	setAttr -s 5 ".wl[453].w[0:4]"  4.5195346e-005 0.0020444447 
		0.59166366 0.40531123 0.00093554059;
	setAttr -s 5 ".wl[454].w[2:6]"  0.00015763138 0.48299176 
		0.51673144 0.00011347298 5.6478116e-006;
	setAttr -s 5 ".wl[455].w[2:6]"  0.00043603027 0.49959883 
		0.49968591 0.00026526765 1.3980597e-005;
	setAttr -s 5 ".wl[456].w[2:6]"  0.00023702416 0.48864961 
		0.51093632 0.00016851399 8.4728754e-006;
	setAttr -s 5 ".wl[457].w[2:6]"  0.0003284892 0.49955884 0.49990064 
		0.00020151891 1.0544595e-005;
	setAttr -s 5 ".wl[458].w[2:6]"  0.00020852365 0.48760021 
		0.51203531 0.00014852447 7.4500922e-006;
	setAttr -s 5 ".wl[459].w[2:6]"  0.00021245914 0.48868507 
		0.51094401 0.00015096675 7.588766e-006;
	setAttr -s 5 ".wl[460].w[2:6]"  0.00037537841 0.49955824 
		0.49982274 0.00023160491 1.2154247e-005;
	setAttr -s 5 ".wl[461].w[2:6]"  0.00040957931 0.49958673 
		0.49973869 0.00025169377 1.3242598e-005;
	setAttr -s 5 ".wl[462].w[2:6]"  3.8925159e-006 4.7524507e-005 
		0.49971727 0.50019878 3.2608936e-005;
	setAttr -s 5 ".wl[463].w[2:6]"  5.5048399e-006 6.9247777e-005 
		0.50955433 0.49032924 4.1765328e-005;
	setAttr -s 5 ".wl[464].w[2:6]"  2.4176441e-006 2.9665525e-005 
		0.49980098 0.50014669 2.025054e-005;
	setAttr -s 5 ".wl[465].w[2:6]"  3.6004403e-006 4.5370405e-005 
		0.51061714 0.48930636 2.7501104e-005;
	setAttr -s 5 ".wl[466].w[2:6]"  1.8199366e-006 2.235584e-005 
		0.49972802 0.50023246 1.5279007e-005;
	setAttr -s 5 ".wl[467].w[2:6]"  4.1228177e-006 5.0519058e-005 
		0.49989718 0.50001383 3.4359804e-005;
	setAttr -s 5 ".wl[468].w[2:6]"  4.6859905e-006 5.8964652e-005 
		0.50882971 0.49107069 3.5869329e-005;
	setAttr -s 5 ".wl[469].w[2:6]"  5.0680737e-006 6.3772859e-005 
		0.50889331 0.49099916 3.8706679e-005;
	setAttr -s 5 ".wl[470].w[2:6]"  2.6019604e-008 1.0651176e-007 
		1.4672669e-006 0.66143751 0.33856091;
	setAttr -s 5 ".wl[471].w[2:6]"  1.1527926e-007 4.7558575e-007 
		6.7064352e-006 0.681292 0.31870064;
	setAttr -s 2 ".wl[472].w[5:6]"  0.5 0.5;
	setAttr -s 5 ".wl[473].w[2:6]"  2.4875551e-008 1.0182577e-007 
		1.4019196e-006 0.66103762 0.33896083;
	setAttr -s 5 ".wl[474].w[2:6]"  6.6219336e-008 2.7318947e-007 
		3.854313e-006 0.72309458 0.27690127;
	setAttr -s 5 ".wl[475].w[2:6]"  1.2798018e-008 5.2390956e-008 
		7.2164181e-007 0.71098524 0.28901395;
	setAttr -s 5 ".wl[476].w[2:6]"  3.5169805e-008 1.4398904e-007 
		1.9820741e-006 0.63966668 0.36033121;
	setAttr -s 5 ".wl[477].w[2:6]"  1.0825946e-007 4.4649616e-007 
		6.2843828e-006 0.677791 0.32220215;
	setAttr -s 5 ".wl[478].w[2:6]"  1.0557419e-007 4.3546319e-007 
		6.1309788e-006 0.68073738 0.31925592;
	setAttr -s 2 ".wl[479].w";
	setAttr ".wl[479].w[1]" 3.5107135772705078e-005;
	setAttr ".wl[479].w[24]" 0.99996489286422729;
	setAttr -s 2 ".wl[480].w";
	setAttr ".wl[480].w[1]" 1.33514404296875e-005;
	setAttr ".wl[480].w[24]" 0.99999332427978516;
	setAttr ".wl[481].w[24]"  1;
	setAttr ".wl[482].w[24]"  1;
	setAttr ".wl[483].w[23]"  1;
	setAttr ".wl[484].w[22]"  1;
	setAttr -s 6 ".wl[485].w";
	setAttr ".wl[485].w[0:1]" 0.01114688441157341 0.00152523850556463;
	setAttr ".wl[485].w[7]" 0.0093410555273294449;
	setAttr ".wl[485].w[14]" 0.0019596777856349945;
	setAttr ".wl[485].w[21:22]" 0.0073996898718178272 0.9686274528503418;
	setAttr ".wl[486].w[24]"  1;
	setAttr -s 6 ".wl[487].w";
	setAttr ".wl[487].w[1]" 9.1406232968438417e-005;
	setAttr ".wl[487].w[24:25]" 0.99976664781570435 2.5187182473018765e-005;
	setAttr ".wl[487].w[50:52]" 5.5836932006059214e-005 5.5639888159930706e-005 
		5.2819509619439486e-006;
	setAttr ".wl[488].w[24]"  1;
	setAttr ".wl[489].w[24]"  1;
	setAttr ".wl[490].w[23]"  1;
	setAttr ".wl[491].w[22]"  1;
	setAttr -s 6 ".wl[492].w";
	setAttr ".wl[492].w[0:1]" 0.014867971651256084 0.0029886479023844004;
	setAttr ".wl[492].w[7]" 0.0026138864923268557;
	setAttr ".wl[492].w[14]" 0.012459320016205311;
	setAttr ".wl[492].w[21:22]" 0.01020742766559124 0.95686274766921997;
	setAttr ".wl[493].w[24]"  1;
	setAttr ".wl[494].w[24]"  1;
	setAttr -s 5 ".wl[495].w";
	setAttr ".wl[495].w[23:25]" 0.039700843393802643 0.60512787103652954 
		0.27043139934539795;
	setAttr ".wl[495].w[29]" 0.060164589434862137;
	setAttr ".wl[495].w[50]" 0.024575322866439819;
	setAttr -s 4 ".wl[496].w";
	setAttr ".wl[496].w[22]" 0.0091086933389306068;
	setAttr ".wl[496].w[25:27]" 0.61566650867462158 0.37202280759811401 
		0.0032019792124629021;
	setAttr -s 5 ".wl[497].w";
	setAttr ".wl[497].w[23:25]" 0.043564386665821075 0.60805785655975342 
		0.25539153814315796;
	setAttr ".wl[497].w[29]" 0.026966778561472893;
	setAttr ".wl[497].w[50]" 0.066019415855407715;
	setAttr -s 4 ".wl[498].w";
	setAttr ".wl[498].w[22]" 0.008812478743493557;
	setAttr ".wl[498].w[25:27]" 0.59564590454101563 0.39244380593299866 
		0.0030978517606854439;
	setAttr -s 5 ".wl[499].w[24:28]"  0.025004601 0.030735806 0.90147465 
		0.014852447 0.027932489;
	setAttr ".wl[500].w[0]"  1;
	setAttr ".wl[501].w[0]"  1;
	setAttr -s 5 ".wl[502].w";
	setAttr ".wl[502].w[0:1]" 0.96171188354492188 0.00075540505349636078;
	setAttr ".wl[502].w[7:9]" 0.037457074970006943 7.185409776866436e-005 
		3.7825607250852045e-006;
	setAttr ".wl[503].w[0]"  1;
	setAttr -s 5 ".wl[504].w";
	setAttr ".wl[504].w[0:1]" 0.97455263137817383 0.0014422992244362831;
	setAttr ".wl[504].w[7:9]" 0.023096015676856041 0.0008750157430768013 
		3.4038843296002597e-005;
	setAttr ".wl[505].w[0]"  1;
	setAttr -s 5 ".wl[506].w";
	setAttr ".wl[506].w[0:1]" 0.99920892715454102 3.2101652323035523e-005;
	setAttr ".wl[506].w[7:9]" 0.00075252266833558679 6.183963250805391e-006 
		2.6457738044882717e-007;
	setAttr ".wl[507].w[0]"  1;
	setAttr ".wl[508].w[0]"  1;
	setAttr -s 5 ".wl[509].w";
	setAttr ".wl[509].w[0:1]" 0.98298335075378418 0.00011665363854262978;
	setAttr ".wl[509].w[14:16]" 0.016872603446245193 2.6056979550048709e-005 
		1.3357079069464817e-006;
	setAttr -s 5 ".wl[510].w";
	setAttr ".wl[510].w[0:1]" 0.98779243230819702 0.00069190392969176173;
	setAttr ".wl[510].w[14:16]" 0.011081072501838207 0.00041826162487268448 
		1.632920975680463e-005;
	setAttr ".wl[511].w[0]"  1;
	setAttr ".wl[512].w[0]"  1;
	setAttr ".wl[513].w[0]"  1;
	setAttr ".wl[514].w[0]"  1;
	setAttr ".wl[515].w[0]"  1;
	setAttr ".wl[516].w[0]"  1;
	setAttr ".wl[517].w[0]"  1;
	setAttr -s 5 ".wl[518].w";
	setAttr ".wl[518].w[0:1]" 0.014078942127525806 0.0025440421886742115;
	setAttr ".wl[518].w[7:9]" 0.9045063853263855 0.078387483954429626 
		0.0004831305705010891;
	setAttr -s 5 ".wl[519].w";
	setAttr ".wl[519].w[0:1]" 0.023026889190077782 0.0041159694083034992;
	setAttr ".wl[519].w[7:9]" 0.79261255264282227 0.17921824753284454 
		0.0010263228323310614;
	setAttr -s 5 ".wl[520].w";
	setAttr ".wl[520].w[0:1]" 0.0099916933104395866 0.0020135275553911924;
	setAttr ".wl[520].w[7:9]" 0.96333622932434082 0.024428641423583031 
		0.00022985001851338893;
	setAttr -s 5 ".wl[521].w";
	setAttr ".wl[521].w[0:1]" 0.029381060972809792 0.0053622964769601822;
	setAttr ".wl[521].w[7:9]" 0.83588093519210815 0.12839114665985107 
		0.00098452414385974407;
	setAttr -s 5 ".wl[522].w";
	setAttr ".wl[522].w[0:1]" 0.035011183470487595 0.0080289999023079872;
	setAttr ".wl[522].w[7:9]" 0.86713886260986328 0.088814713060855865 
		0.0010063322260975838;
	setAttr -s 5 ".wl[523].w";
	setAttr ".wl[523].w[0:1]" 0.02436758391559124 0.0086367931216955185;
	setAttr ".wl[523].w[7:9]" 0.9335898756980896 0.032859541475772858 
		0.00054623052710667253;
	setAttr -s 5 ".wl[524].w";
	setAttr ".wl[524].w[0:1]" 0.011401920579373837 0.0032623948063701391;
	setAttr ".wl[524].w[7:9]" 0.96298068761825562 0.022078452631831169 
		0.00027653874712996185;
	setAttr -s 5 ".wl[525].w";
	setAttr ".wl[525].w[0:1]" 0.029597774147987366 0.0083707626909017563;
	setAttr ".wl[525].w[7:9]" 0.90534275770187378 0.055926632136106491 
		0.00076210894621908665;
	setAttr -s 5 ".wl[526].w";
	setAttr ".wl[526].w[8:11]" 0.37776851654052734 0.44729799032211304 
		0.17237928509712219 0.0002093874936690554;
	setAttr ".wl[526].w[13]" 0.0023447871208190918;
	setAttr -s 5 ".wl[527].w[9:13]"  0.33794969 0.65670848 0.0010850299 
		2.7857617e-005 0.0042289696;
	setAttr -s 5 ".wl[528].w";
	setAttr ".wl[528].w[8:11]" 0.43433794379234314 0.43648448586463928 
		0.12355741113424301 0.00016563633107580245;
	setAttr ".wl[528].w[13]" 0.0054545099847018719;
	setAttr -s 5 ".wl[529].w[9:13]"  0.25226408 0.74169004 0.0016794775 
		3.9180744e-005 0.004327314;
	setAttr -s 5 ".wl[530].w";
	setAttr ".wl[530].w[0]" 2.3472825887438376e-006;
	setAttr ".wl[530].w[7:10]" 2.1701169316656888e-005 0.38253948092460632 
		0.37045300006866455 0.24698342382907867;
	setAttr -s 5 ".wl[531].w";
	setAttr ".wl[531].w[0]" 1.527677682133799e-006;
	setAttr ".wl[531].w[7:10]" 1.2513449291873258e-005 0.45485523343086243 
		0.45485523343086243 0.090275533497333527;
	setAttr -s 5 ".wl[532].w";
	setAttr ".wl[532].w[0]" 1.5334022691604332e-006;
	setAttr ".wl[532].w[7:10]" 1.2822442840842996e-005 0.44574528932571411 
		0.44574528932571411 0.10849498212337494;
	setAttr -s 5 ".wl[533].w";
	setAttr ".wl[533].w[0]" 1.0623467687764787e-006;
	setAttr ".wl[533].w[7:10]" 9.2650798251270317e-006 0.45829546451568604 
		0.45644599199295044 0.085248179733753204;
	setAttr -s 5 ".wl[534].w";
	setAttr ".wl[534].w[0:1]" 0.00025435697170905769 9.8991251434199512e-005;
	setAttr ".wl[534].w[7:9]" 0.49973905086517334 0.49973905086517334 
		0.00016854022396728396;
	setAttr -s 5 ".wl[535].w";
	setAttr ".wl[535].w[0:1]" 0.00068373029353097081 0.00026081185205839574;
	setAttr ".wl[535].w[7:9]" 0.49929168820381165 0.49929168820381165 
		0.00047215397353284061;
	setAttr -s 5 ".wl[536].w";
	setAttr ".wl[536].w[0]" 5.5638225603615865e-005;
	setAttr ".wl[536].w[7:10]" 0.4980144202709198 0.50187164545059204 
		3.2744275813456625e-005 2.5683906642370857e-005;
	setAttr -s 5 ".wl[537].w";
	setAttr ".wl[537].w[0:1]" 0.00082520430441945791 0.00031943648355081677;
	setAttr ".wl[537].w[7:9]" 0.49915140867233276 0.49915140867233276 
		0.0005525947199203074;
	setAttr -s 5 ".wl[538].w";
	setAttr ".wl[538].w[0:1]" 0.00063414347823709249 0.00025544001255184412;
	setAttr ".wl[538].w[7:9]" 0.4993552565574646 0.4993552565574646 
		0.00039992565871216357;
	setAttr -s 5 ".wl[539].w";
	setAttr ".wl[539].w[0]" 6.9211942900437862e-005;
	setAttr ".wl[539].w[7:10]" 0.49809786677360535 0.5017695426940918 
		3.5754848795477301e-005 2.7635613150778227e-005;
	setAttr -s 5 ".wl[540].w";
	setAttr ".wl[540].w[0]" 4.262034417479299e-005;
	setAttr ".wl[540].w[7:10]" 0.46014747023582458 0.5397682785987854 
		2.3495756977354176e-005 1.821984005800914e-005;
	setAttr -s 5 ".wl[541].w";
	setAttr ".wl[541].w[0:1]" 0.00042268517427146435 0.00017673026013653725;
	setAttr ".wl[541].w[7:9]" 0.49958711862564087 0.49958711862564087 
		0.00022626477584708482;
	setAttr -s 5 ".wl[542].w";
	setAttr ".wl[542].w[0]" 0.00020663216128014028;
	setAttr ".wl[542].w[7:10]" 0.032391369342803955 0.9650992751121521 
		0.0013226259034126997 0.00098014320246875286;
	setAttr -s 5 ".wl[543].w";
	setAttr ".wl[543].w[0]" 0.0004334275727160275;
	setAttr ".wl[543].w[7:10]" 0.053550183773040771 0.93942248821258545 
		0.0036453905049711466 0.0029484648257493973;
	setAttr -s 5 ".wl[544].w";
	setAttr ".wl[544].w[0]" 0.00030464839073829353;
	setAttr ".wl[544].w[7:10]" 0.048986788839101791 0.94871866703033447 
		0.0011533030774444342 0.00083655794151127338;
	setAttr -s 5 ".wl[545].w";
	setAttr ".wl[545].w[0]" 0.00062218977836892009;
	setAttr ".wl[545].w[7:10]" 0.070464923977851868 0.919361412525177 
		0.0051463856361806393 0.004405053798109293;
	setAttr -s 5 ".wl[546].w";
	setAttr ".wl[546].w[0]" 0.0002104360464727506;
	setAttr ".wl[546].w[7:10]" 0.029709389433264732 0.96754682064056396 
		0.0014299864415079355 0.001103353570215404;
	setAttr -s 5 ".wl[547].w";
	setAttr ".wl[547].w[0]" 0.0012291172752156854;
	setAttr ".wl[547].w[7:10]" 0.11086462438106537 0.88252139091491699 
		0.0031339128036051989 0.0022509149275720119;
	setAttr -s 5 ".wl[548].w";
	setAttr ".wl[548].w[0]" 0.00047220051055774093;
	setAttr ".wl[548].w[7:10]" 0.056281037628650665 0.94069027900695801 
		0.0014902908587828279 0.0010662208078429103;
	setAttr -s 5 ".wl[549].w";
	setAttr ".wl[549].w[0]" 0.00083943182835355401;
	setAttr ".wl[549].w[7:10]" 0.096541672945022583 0.8977317214012146 
		0.0028321461286395788 0.0020549830514937639;
	setAttr -s 5 ".wl[550].w";
	setAttr ".wl[550].w[0]" 5.2961924666306004e-005;
	setAttr ".wl[550].w[7:10]" 0.4186052680015564 0.58127003908157349 
		4.028028342872858e-005 3.1390085496241227e-005;
	setAttr -s 5 ".wl[551].w";
	setAttr ".wl[551].w[0]" 2.2482614440377802e-005;
	setAttr ".wl[551].w[7:10]" 0.23081421852111816 0.76913434267044067 
		1.6386484276154079e-005 1.2602268725458998e-005;
	setAttr -s 5 ".wl[552].w";
	setAttr ".wl[552].w[0]" 0.00021353299962356687;
	setAttr ".wl[552].w[7:10]" 0.47154566645622253 0.52788406610488892 
		0.00019788934150710702 0.00015892391093075275;
	setAttr -s 5 ".wl[553].w";
	setAttr ".wl[553].w[0]" 0.00071234174538403749;
	setAttr ".wl[553].w[7:10]" 0.38219541311264038 0.61476743221282959 
		0.0012557220179587603 0.0010691425995901227;
	setAttr -s 5 ".wl[554].w";
	setAttr ".wl[554].w[0]" 0.00071869819657877088;
	setAttr ".wl[554].w[7:10]" 0.37583619356155396 0.62106943130493164 
		0.0012749460292980075 0.0011007699649780989;
	setAttr -s 5 ".wl[555].w";
	setAttr ".wl[555].w[0]" 0.00049800483975559473;
	setAttr ".wl[555].w[7:10]" 0.46853792667388916 0.53002637624740601 
		0.00050954049220308661 0.00042814802145585418;
	setAttr -s 5 ".wl[556].w";
	setAttr ".wl[556].w[0]" 2.9889124562032521e-005;
	setAttr ".wl[556].w[7:10]" 0.27328971028327942 0.72664463520050049 
		2.0249965018592775e-005 1.5565441572107375e-005;
	setAttr -s 5 ".wl[557].w";
	setAttr ".wl[557].w[0]" 0.00015435554087162018;
	setAttr ".wl[557].w[7:10]" 0.44611874222755432 0.5535159707069397 
		0.00011781873763538897 9.3167487648315728e-005;
	setAttr -s 5 ".wl[558].w";
	setAttr ".wl[558].w[0]" 6.0328173276502639e-005;
	setAttr ".wl[558].w[7:10]" 0.0011417288333177567 0.94596433639526367 
		0.030835557729005814 0.021998105570673943;
	setAttr -s 5 ".wl[559].w";
	setAttr ".wl[559].w[0]" 5.0447531975805759e-005;
	setAttr ".wl[559].w[7:10]" 0.00095656339544802904 0.95335620641708374 
		0.027421986684203148 0.01821477897465229;
	setAttr -s 5 ".wl[560].w";
	setAttr ".wl[560].w[0]" 2.6824140149983577e-005;
	setAttr ".wl[560].w[7:10]" 0.0004997914656996727 0.97669285535812378 
		0.014787248335778713 0.0079932454973459244;
	setAttr -s 5 ".wl[561].w";
	setAttr ".wl[561].w[0]" 1.550794331706129e-005;
	setAttr ".wl[561].w[7:10]" 0.00026848824927583337 0.98810279369354248 
		0.007834339514374733 0.0037788990885019302;
	setAttr -s 5 ".wl[562].w";
	setAttr ".wl[562].w[0]" 1.3106156984576955e-005;
	setAttr ".wl[562].w[7:10]" 0.0002120082062901929 0.99029630422592163 
		0.0064984126947820187 0.0029801197815686464;
	setAttr -s 5 ".wl[563].w";
	setAttr ".wl[563].w[0]" 2.1899093553656712e-005;
	setAttr ".wl[563].w[7:10]" 0.00034502116614021361 0.98555958271026611 
		0.0096458718180656433 0.004427559208124876;
	setAttr -s 5 ".wl[564].w";
	setAttr ".wl[564].w[0]" 3.7227302527753636e-005;
	setAttr ".wl[564].w[7:10]" 0.00065574480686336756 0.97776883840560913 
		0.014283437281847 0.0072546908631920815;
	setAttr -s 5 ".wl[565].w";
	setAttr ".wl[565].w[0]" 3.0324988983920775e-005;
	setAttr ".wl[565].w[7:10]" 0.00056944804964587092 0.97460365295410156 
		0.015421292744576931 0.0093752797693014145;
	setAttr -s 5 ".wl[566].w[9:13]"  0.35476866 0.63985062 0.00044016115 
		1.2505383e-005 0.0049280454;
	setAttr -s 5 ".wl[567].w[9:13]"  0.045024898 0.9514274 0.0014462592 
		2.4321949e-005 0.0020771192;
	setAttr -s 5 ".wl[568].w[9:13]"  0.32031444 0.64582884 0.00026459931 
		1.1405069e-005 0.033580665;
	setAttr -s 5 ".wl[569].w[9:13]"  0.039650343 0.95435041 0.0033819748 
		4.8608428e-005 0.0025686731;
	setAttr -s 5 ".wl[570].w[9:13]"  0.2381445 0.7408548 0.0064628841 
		0.00014527015 0.014392621;
	setAttr -s 5 ".wl[571].w";
	setAttr ".wl[571].w[8:11]" 0.28121918439865112 0.33769360184669495 
		0.33244422078132629 0.00058480387087911367;
	setAttr ".wl[571].w[13]" 0.048058230429887772;
	setAttr -s 5 ".wl[572].w[9:13]"  0.4262833 0.5226385 0.00045942573 
		2.3416014e-005 0.050595313;
	setAttr -s 5 ".wl[573].w[9:13]"  0.46908042 0.50935698 0.0017177786 
		5.5999466e-005 0.019788874;
	setAttr -s 5 ".wl[574].w[9:13]"  0.22189429 0.74534279 0.0069889324 
		0.00014625891 0.025627764;
	setAttr -s 5 ".wl[575].w[9:13]"  0.42415836 0.50773281 0.0035721741 
		0.00010943517 0.06442719;
	setAttr -s 5 ".wl[576].w";
	setAttr ".wl[576].w[8:11]" 0.30398920178413391 0.3361656665802002 
		0.31004336476325989 0.00047540132072754204;
	setAttr ".wl[576].w[13]" 0.04932626336812973;
	setAttr -s 5 ".wl[577].w";
	setAttr ".wl[577].w[8:11]" 0.33717259764671326 0.35260787606239319 
		0.26597112417221069 0.00053647602908313274;
	setAttr ".wl[577].w[13]" 0.043712019920349121;
	setAttr -s 5 ".wl[578].w[9:13]"  0.18052669 0.5758816 0.00069657859 
		4.1685787e-005 0.2428534;
	setAttr -s 5 ".wl[579].w[9:13]"  0.2235301 0.55365878 0.00089861441 
		5.3208783e-005 0.22185928;
	setAttr -s 5 ".wl[580].w[9:13]"  0.013829455 0.49546555 0.00013145646 
		8.0599621e-006 0.49056554;
	setAttr -s 5 ".wl[581].w[9:13]"  0.019387867 0.50053126 0.00018631309 
		1.0986768e-005 0.47988361;
	setAttr -s 5 ".wl[582].w[9:13]"  0.17852947 0.70535755 0.00037046385 
		1.7905728e-005 0.11572465;
	setAttr -s 5 ".wl[583].w[9:13]"  0.022785883 0.6274693 0.00013281188 
		6.9070534e-006 0.34960505;
	setAttr -s 5 ".wl[584].w[9:13]"  0.40017572 0.50171459 0.0015875208 
		7.2324125e-005 0.096449777;
	setAttr -s 5 ".wl[585].w[9:13]"  0.26856121 0.53111219 0.0018123909 
		8.2729151e-005 0.19843146;
	setAttr -s 5 ".wl[586].w[9:13]"  0.00020658749 0.025976975 
		0.44350931 0.53023368 7.3402531e-005;
	setAttr -s 5 ".wl[587].w[9:13]"  1.551196e-005 0.074611664 
		0.37213463 0.55323243 5.7327261e-006;
	setAttr -s 5 ".wl[588].w[9:13]"  2.4747675e-005 0.12623216 
		0.40828022 0.46545491 7.9243009e-006;
	setAttr -s 5 ".wl[589].w[9:13]"  0.23221579 0.68559563 0.008863234 
		0.000207652 0.073117681;
	setAttr -s 5 ".wl[590].w[9:13]"  0.13623026 0.4991239 0.0032103644 
		0.00010826853 0.36132711;
	setAttr -s 5 ".wl[591].w[9:13]"  0.16246161 0.487268 0.0054263538 
		0.00015063801 0.34469336;
	setAttr -s 5 ".wl[592].w[9:13]"  0.23653662 0.58590192 0.018055379 
		0.00034805431 0.15915801;
	setAttr -s 5 ".wl[593].w[9:13]"  0.0055905394 0.5994609 0.39309162 
		0.00018437982 0.0016725619;
	setAttr -s 5 ".wl[594].w[9:13]"  0.048802376 0.93682694 0.0087170405 
		0.00010832328 0.0055452762;
	setAttr -s 5 ".wl[595].w[9:13]"  0.0030053963 0.53040218 0.46590313 
		6.1530969e-005 0.00062774168;
	setAttr -s 5 ".wl[596].w[9:13]"  0.41782379 0.5363065 0.00086956716 
		3.051867e-005 0.04496957;
	setAttr -s 5 ".wl[597].w[9:13]"  0.0034609057 0.44878373 0.54663408 
		0.0002166709 0.00090460951;
	setAttr -s 5 ".wl[598].w[9:13]"  0.034498565 0.65298283 0.30675185 
		0.00022812898 0.0055386294;
	setAttr -s 5 ".wl[599].w[9:13]"  0.0077499445 0.49605331 0.00013500811 
		8.3163959e-006 0.49605331;
	setAttr -s 5 ".wl[600].w[9:13]"  0.0048704832 0.49751866 8.6715154e-005 
		5.4925977e-006 0.49751866;
	setAttr -s 5 ".wl[601].w[9:13]"  0.013111477 0.50445509 0.00015577895 
		7.8457069e-006 0.4822697;
	setAttr -s 5 ".wl[602].w[9:13]"  0.26307148 0.65152562 0.00058550463 
		2.3752238e-005 0.084793538;
	setAttr ".wl[603].w[12]"  1;
	setAttr ".wl[604].w[12]"  1;
	setAttr ".wl[605].w[10]"  1;
	setAttr -s 5 ".wl[606].w[9:13]"  0.011319808 0.92298639 0.060240999 
		0.00035276369 0.0051000416;
	setAttr -s 5 ".wl[607].w[9:13]"  0.087079711 0.81842089 0.057414338 
		0.00058494811 0.036500137;
	setAttr -s 5 ".wl[608].w[9:13]"  0.068516724 0.874282 0.028488606 
		0.00027664509 0.02843608;
	setAttr -s 5 ".wl[609].w[9:13]"  0.059124772 0.75437498 0.16165811 
		0.00047903595 0.024363076;
	setAttr -s 5 ".wl[610].w[9:13]"  0.014531448 0.67375213 0.30408812 
		0.00089234603 0.0067359367;
	setAttr -s 5 ".wl[611].w[9:13]"  0.08298514 0.54550534 0.00097515184 
		4.1514857e-005 0.37049279;
	setAttr -s 5 ".wl[612].w[9:13]"  0.12603983 0.48880512 0.0039079674 
		0.0001199262 0.38112709;
	setAttr -s 5 ".wl[613].w[9:13]"  0.053882219 0.88654482 0.036992103 
		0.00030983769 0.022271028;
	setAttr -s 5 ".wl[614].w[9:13]"  0.050622802 0.90604967 0.030152297 
		0.00027238618 0.012902862;
	setAttr -s 5 ".wl[615].w[9:13]"  0.30622101 0.60963148 0.0055843019 
		0.0001289658 0.078434236;
	setAttr -s 5 ".wl[616].w[9:13]"  0.044096846 0.51016241 0.00070313812 
		2.9702358e-005 0.4450078;
	setAttr -s 5 ".wl[617].w[9:13]"  0.01385304 0.5064103 0.00020135332 
		8.9635078e-006 0.47952631;
	setAttr -s 5 ".wl[618].w[9:13]"  0.032328334 0.48544893 0.00067714899 
		3.0781757e-005 0.48151487;
	setAttr -s 5 ".wl[619].w[9:13]"  0.082240775 0.48971617 0.0017460501 
		7.1167939e-005 0.42622584;
	setAttr -s 5 ".wl[620].w[9:13]"  0.30209598 0.44903401 0.01471673 
		0.00038193492 0.23377132;
	setAttr -s 5 ".wl[621].w[9:13]"  0.0012310223 0.11610485 0.28119874 
		0.60084325 0.00062211399;
	setAttr -s 5 ".wl[622].w[9:13]"  0.0006244356 0.10233389 0.41636109 
		0.48041898 0.0002615923;
	setAttr -s 5 ".wl[623].w[9:13]"  0.0035501185 0.89758426 0.09728881 
		0.00010165686 0.0014751545;
	setAttr -s 5 ".wl[624].w[9:13]"  0.0031444102 0.8698554 0.1255703 
		0.00010654557 0.0013233345;
	setAttr -s 5 ".wl[625].w[9:13]"  0.0064306692 0.49669978 0.00015927439 
		1.0550097e-005 0.49669978;
	setAttr -s 5 ".wl[626].w[9:13]"  0.0088181738 0.49547538 0.00021709932 
		1.3990469e-005 0.49547538;
	setAttr -s 5 ".wl[627].w[9:13]"  0.0053754388 0.49721879 0.00017679259 
		1.0171943e-005 0.49721879;
	setAttr -s 5 ".wl[628].w[9:13]"  0.0074330894 0.49615696 0.00023943686 
		1.3562634e-005 0.49615696;
	setAttr -s 5 ".wl[629].w[9:13]"  0.021666722 0.48886719 0.00057592586 
		2.2901795e-005 0.48886719;
	setAttr -s 5 ".wl[630].w[9:13]"  0.023483638 0.48793355 0.00062399294 
		2.5368243e-005 0.48793355;
	setAttr ".wl[631].w[12]"  1;
	setAttr -s 2 ".wl[632].w[11:12]"  0.14791764 0.85208237;
	setAttr ".wl[633].w[12]"  1;
	setAttr -s 5 ".wl[634].w[9:13]"  7.05083e-005 0.0020660299 
		0.10433736 0.89348596 4.0134666e-005;
	setAttr ".wl[635].w[12]"  1;
	setAttr -s 5 ".wl[636].w[9:13]"  9.9674244e-006 0.0009530058 
		0.0085550845 0.99047756 4.37984e-006;
	setAttr ".wl[637].w[12]"  1;
	setAttr ".wl[638].w[12]"  1;
	setAttr -s 5 ".wl[639].w[9:13]"  1.5158874e-006 0.00017680635 
		0.0022498593 0.99757111 7.0787701e-007;
	setAttr -s 5 ".wl[640].w[9:13]"  1.6964119e-005 0.0014455105 
		0.035503875 0.9630245 9.1528846e-006;
	setAttr ".wl[641].w[12]"  1;
	setAttr ".wl[642].w[12]"  1;
	setAttr ".wl[643].w[12]"  1;
	setAttr ".wl[644].w[12]"  1;
	setAttr -s 5 ".wl[645].w[9:13]"  0.00032216779 0.010545714 
		0.016949052 0.97201777 0.00016530065;
	setAttr ".wl[646].w[12]"  1;
	setAttr ".wl[647].w[12]"  1;
	setAttr ".wl[648].w[12]"  1;
	setAttr ".wl[649].w[12]"  1;
	setAttr ".wl[650].w[12]"  1;
	setAttr -s 5 ".wl[651].w[9:13]"  0.0004861535 0.0068911086 
		0.095732555 0.89662349 0.00026669345;
	setAttr -s 5 ".wl[652].w[9:13]"  4.5443507e-005 0.00058921007 
		0.0027841046 0.99655664 2.4602359e-005;
	setAttr ".wl[653].w[12]"  1;
	setAttr ".wl[654].w[12]"  1;
	setAttr ".wl[655].w[12]"  1;
	setAttr ".wl[656].w[12]"  1;
	setAttr ".wl[657].w[12]"  1;
	setAttr ".wl[658].w[12]"  1;
	setAttr ".wl[659].w[12]"  1;
	setAttr ".wl[660].w[12]"  1;
	setAttr -s 3 ".wl[661].w";
	setAttr ".wl[661].w[11:12]" 0.014645039103925228 0.98310929536819458;
	setAttr ".wl[661].w[18]" 0.0022456645965576172;
	setAttr ".wl[662].w[12]"  1;
	setAttr ".wl[663].w[12]"  1;
	setAttr ".wl[664].w[12]"  1;
	setAttr ".wl[665].w[12]"  1;
	setAttr ".wl[666].w[12]"  1;
	setAttr ".wl[667].w[12]"  1;
	setAttr ".wl[668].w[12]"  1;
	setAttr ".wl[669].w[12]"  1;
	setAttr ".wl[670].w[12]"  1;
	setAttr -s 5 ".wl[671].w[9:13]"  2.4475582e-006 7.2948846e-005 
		0.024858283 0.97506505 1.2691722e-006;
	setAttr ".wl[672].w[12]"  1;
	setAttr ".wl[673].w[12]"  1;
	setAttr ".wl[674].w[12]"  1;
	setAttr -s 3 ".wl[675].w";
	setAttr ".wl[675].w[11:12]" 0.0092212548479437828 0.99075168371200562;
	setAttr ".wl[675].w[18]" 2.706059422052931e-005;
	setAttr -s 3 ".wl[676].w";
	setAttr ".wl[676].w[11:12]" 0.029201537370681763 0.97070735692977905;
	setAttr ".wl[676].w[18]" 9.1106216132175177e-005;
	setAttr -s 3 ".wl[677].w";
	setAttr ".wl[677].w[11:12]" 0.0075100515969097614 0.9924888014793396;
	setAttr ".wl[677].w[18]" 1.1470868912510923e-006;
	setAttr -s 3 ".wl[678].w";
	setAttr ".wl[678].w[11:12]" 0.062561400234699249 0.93742859363555908;
	setAttr ".wl[678].w[18]" 1.0001326700148638e-005;
	setAttr ".wl[679].w[12]"  1;
	setAttr ".wl[680].w[12]"  1;
	setAttr ".wl[681].w[12]"  1;
	setAttr ".wl[682].w[12]"  1;
	setAttr ".wl[683].w[12]"  1;
	setAttr ".wl[684].w[12]"  1;
	setAttr -s 3 ".wl[685].w";
	setAttr ".wl[685].w[11:12]" 0.031056642532348633 0.96888947486877441;
	setAttr ".wl[685].w[18]" 5.3882653446635231e-005;
	setAttr ".wl[686].w[12]"  1;
	setAttr ".wl[687].w[12]"  1;
	setAttr ".wl[688].w[12]"  1;
	setAttr ".wl[689].w[12]"  1;
	setAttr ".wl[690].w[12]"  1;
	setAttr ".wl[691].w[12]"  1;
	setAttr -s 5 ".wl[692].w[9:13]"  5.4738648e-005 0.0052923681 
		0.082542993 0.9120813 2.8594652e-005;
	setAttr -s 5 ".wl[693].w[9:13]"  0.00028108107 0.026385849 
		0.051062934 0.92212695 0.0001431866;
	setAttr ".wl[694].w[12]"  1;
	setAttr ".wl[695].w[12]"  1;
	setAttr ".wl[696].w[12]"  1;
	setAttr -s 5 ".wl[697].w[9:13]"  0.00051227136 0.030655276 
		0.092466228 0.87609822 0.00026800798;
	setAttr ".wl[698].w[12]"  1;
	setAttr ".wl[699].w[12]"  1;
	setAttr ".wl[700].w[12]"  1;
	setAttr ".wl[701].w[12]"  1;
	setAttr ".wl[702].w[12]"  1;
	setAttr ".wl[703].w[12]"  1;
	setAttr ".wl[704].w[12]"  1;
	setAttr ".wl[705].w[12]"  1;
	setAttr ".wl[706].w[12]"  1;
	setAttr ".wl[707].w[12]"  1;
	setAttr ".wl[708].w[12]"  1;
	setAttr -s 5 ".wl[709].w[9:13]"  0.00019325405 0.0045486311 
		0.064260617 0.93088746 0.00011004088;
	setAttr ".wl[710].w[12]"  1;
	setAttr ".wl[711].w[12]"  1;
	setAttr ".wl[712].w[12]"  1;
	setAttr -s 5 ".wl[713].w[9:13]"  0.0001251168 0.0024293063 
		0.055600353 0.94177222 7.3005649e-005;
	setAttr ".wl[714].w[12]"  1;
	setAttr -s 5 ".wl[715].w";
	setAttr ".wl[715].w[0:1]" 0.0010625747963786125 0.00037652888568118215;
	setAttr ".wl[715].w[7:9]" 0.49901315569877625 0.49901315569877625 
		0.00053456443129107356;
	setAttr -s 5 ".wl[716].w";
	setAttr ".wl[716].w[0:1]" 0.00062899466138333082 0.00022693064238410443;
	setAttr ".wl[716].w[7:9]" 0.49941873550415039 0.49941873550415039 
		0.00030657829483971;
	setAttr -s 5 ".wl[717].w";
	setAttr ".wl[717].w[0:1]" 0.00035195742384530604 0.00013347817002795637;
	setAttr ".wl[717].w[7:9]" 0.50695896148681641 0.49240127205848694 
		0.00015421159332618117;
	setAttr -s 5 ".wl[718].w";
	setAttr ".wl[718].w[0:1]" 0.00011628627544268966 4.7484871174674481e-005;
	setAttr ".wl[718].w[7:9]" 0.61617296934127808 0.38361486792564392 
		4.8305144446203485e-005;
	setAttr -s 5 ".wl[719].w";
	setAttr ".wl[719].w[0:1]" 0.00022198264196049422 9.6675132226664573e-005;
	setAttr ".wl[719].w[7:9]" 0.68410748243331909 0.315489262342453 
		8.4697814600076526e-005;
	setAttr -s 5 ".wl[720].w";
	setAttr ".wl[720].w[0:1]" 0.00077921495540067554 0.00031912483973428607;
	setAttr ".wl[720].w[7:9]" 0.55003815889358521 0.44856983423233032 
		0.00029361329507082701;
	setAttr -s 5 ".wl[721].w";
	setAttr ".wl[721].w[0:1]" 0.00081657175906002522 0.00031746239983476698;
	setAttr ".wl[721].w[7:9]" 0.50016379356384277 0.49834743142127991 
		0.0003547864907886833;
	setAttr -s 5 ".wl[722].w";
	setAttr ".wl[722].w[0:1]" 0.0012286842102184892 0.00044587696902453899;
	setAttr ".wl[722].w[7:9]" 0.49886363744735718 0.49886363744735718 
		0.00059827766381204128;
	setAttr -s 5 ".wl[723].w";
	setAttr ".wl[723].w[0:1]" 0.013968178071081638 0.0025240448303520679;
	setAttr ".wl[723].w[14:16]" 0.90542745590209961 0.077601008117198944 
		0.00047933310270309448;
	setAttr -s 5 ".wl[724].w";
	setAttr ".wl[724].w[0:1]" 0.022807331755757332 0.0040767514146864414;
	setAttr ".wl[724].w[14:16]" 0.79411894083023071 0.17798039317131042 
		0.0010165441781282425;
	setAttr -s 5 ".wl[725].w";
	setAttr ".wl[725].w[0:1]" 0.010009435005486012 0.0020171178039163351;
	setAttr ".wl[725].w[14:16]" 0.96343803405761719 0.024305066093802452 
		0.00023025990230962634;
	setAttr -s 5 ".wl[726].w";
	setAttr ".wl[726].w[0:1]" 0.029173139482736588 0.0053243930451571941;
	setAttr ".wl[726].w[14:16]" 0.83705055713653564 0.1274743378162384 
		0.00097756495233625174;
	setAttr -s 5 ".wl[727].w";
	setAttr ".wl[727].w[0:1]" 0.034964650869369507 0.0080184014514088631;
	setAttr ".wl[727].w[14:16]" 0.86769044399261475 0.088321536779403687 
		0.0010050033451989293;
	setAttr -s 5 ".wl[728].w";
	setAttr ".wl[728].w[0:1]" 0.024611979722976685 0.0087234936654567719;
	setAttr ".wl[728].w[14:16]" 0.93323254585266113 0.032880347222089767 
		0.00055171368876472116;
	setAttr -s 5 ".wl[729].w";
	setAttr ".wl[729].w[0:1]" 0.011541662737727165 0.0033024044241756201;
	setAttr ".wl[729].w[14:16]" 0.96274137496948242 0.022134654223918915 
		0.00027993018738925457;
	setAttr -s 5 ".wl[730].w";
	setAttr ".wl[730].w[0:1]" 0.029702713713049889 0.0084005193784832954;
	setAttr ".wl[730].w[14:16]" 0.90540367364883423 0.05572829395532608 
		0.00076481769792735577;
	setAttr -s 5 ".wl[731].w";
	setAttr ".wl[731].w[15:18]" 0.37793618440628052 0.44750925898551941 
		0.17199061810970306 0.00020857651543337852;
	setAttr ".wl[731].w[20]" 0.0023553373757749796;
	setAttr -s 5 ".wl[732].w[16:20]"  0.34085402 0.6537534 0.0010903081 
		2.9287845e-005 0.0042729927;
	setAttr -s 5 ".wl[733].w";
	setAttr ".wl[733].w[15:18]" 0.43434366583824158 0.43648126721382141 
		0.12353020906448364 0.00016518560005351901;
	setAttr ".wl[733].w[20]" 0.0054796501062810421;
	setAttr -s 5 ".wl[734].w[16:20]"  0.2510927 0.74288934 0.0016739542 
		4.0662551e-005 0.0043033753;
	setAttr -s 5 ".wl[735].w";
	setAttr ".wl[735].w[0]" 2.3417744614562253e-006;
	setAttr ".wl[735].w[14:17]" 2.163411227229517e-005 0.38175824284553528 
		0.3695809543132782 0.24863678216934204;
	setAttr -s 5 ".wl[736].w";
	setAttr ".wl[736].w[0]" 1.5277346392394975e-006;
	setAttr ".wl[736].w[14:17]" 1.2497501302277669e-005 0.45486032962799072 
		0.45486032962799072 0.090265363454818726;
	setAttr -s 5 ".wl[737].w";
	setAttr ".wl[737].w[0]" 1.5334093177443719e-006;
	setAttr ".wl[737].w[14:17]" 1.2807223356503528e-005 0.44575607776641846 
		0.44575607776641846 0.10847344994544983;
	setAttr -s 5 ".wl[738].w";
	setAttr ".wl[738].w[0]" 1.062423848452454e-006;
	setAttr ".wl[738].w[14:17]" 9.2559157565119676e-006 0.45827415585517883 
		0.45645648241043091 0.085259035229682922;
	setAttr -s 5 ".wl[739].w";
	setAttr ".wl[739].w[0:1]" 0.00024675630265846848 9.603366197552532e-005;
	setAttr ".wl[739].w[14:16]" 0.49974682927131653 0.49974682927131653 
		0.00016350482474081218;
	setAttr -s 5 ".wl[740].w";
	setAttr ".wl[740].w[0:1]" 0.0006644678651355207 0.00025346534675918519;
	setAttr ".wl[740].w[14:16]" 0.49931162595748901 0.49931162595748901 
		0.00045885468716733158;
	setAttr -s 5 ".wl[741].w";
	setAttr ".wl[741].w[0]" 5.485471774591133e-005;
	setAttr ".wl[741].w[14:17]" 0.49785152077674866 0.50203609466552734 
		3.2283343898598105e-005 2.5321021894342266e-005;
	setAttr -s 5 ".wl[742].w";
	setAttr ".wl[742].w[0:1]" 0.00080483983037993312 0.00031155496253632009;
	setAttr ".wl[742].w[14:16]" 0.49917232990264893 0.49917232990264893 
		0.0005389606230892241;
	setAttr -s 5 ".wl[743].w";
	setAttr ".wl[743].w[0:1]" 0.00062276277458295226 0.00025085706147365272;
	setAttr ".wl[743].w[14:16]" 0.49936681985855103 0.49936681985855103 
		0.00039275045855902135;
	setAttr -s 5 ".wl[744].w";
	setAttr ".wl[744].w[0]" 7.2322342020925134e-005;
	setAttr ".wl[744].w[14:17]" 0.49979525804519653 0.50006616115570068 
		3.736188227776438e-005 2.887792834371794e-005;
	setAttr -s 5 ".wl[745].w";
	setAttr ".wl[745].w[0]" 4.4181117118569091e-005;
	setAttr ".wl[745].w[14:17]" 0.46114891767501831 0.53876370191574097 
		2.4356317226192914e-005 1.88872709259158e-005;
	setAttr -s 5 ".wl[746].w";
	setAttr ".wl[746].w[0:1]" 0.00042169037624262273 0.00017631531227380037;
	setAttr ".wl[746].w[14:16]" 0.49958810210227966 0.49958810210227966 
		0.00022573348542209715;
	setAttr -s 5 ".wl[747].w";
	setAttr ".wl[747].w[0]" 0.00020269757078494877;
	setAttr ".wl[747].w[14:17]" 0.031851913779973984 0.96568727493286133 
		0.0012974477140232921 0.00096073554595932364;
	setAttr -s 5 ".wl[748].w";
	setAttr ".wl[748].w[0]" 0.00042519503040239215;
	setAttr ".wl[748].w[14:17]" 0.052778962999582291 0.94033187627792358 
		0.0035761671606451273 0.0028878005687147379;
	setAttr -s 5 ".wl[749].w";
	setAttr ".wl[749].w[0]" 0.00030622578924521804;
	setAttr ".wl[749].w[14:17]" 0.049021191895008087 0.94867241382598877 
		0.0011592803057283163 0.00084089743904769421;
	setAttr -s 5 ".wl[750].w";
	setAttr ".wl[750].w[0]" 0.00061250280123203993;
	setAttr ".wl[750].w[14:17]" 0.06968245655298233 0.92030656337738037 
		0.0050662830471992493 0.0043321242555975914;
	setAttr -s 5 ".wl[751].w";
	setAttr ".wl[751].w[0]" 0.00020697557192761451;
	setAttr ".wl[751].w[14:17]" 0.029269233345985413 0.96803230047225952 
		0.0014064769493415952 0.0010849604150280356;
	setAttr -s 5 ".wl[752].w";
	setAttr ".wl[752].w[0]" 0.0012510403757914901;
	setAttr ".wl[752].w[14:17]" 0.11157417297363281 0.88169389963150024 
		0.0031898231245577335 0.002291085897013545;
	setAttr -s 5 ".wl[753].w";
	setAttr ".wl[753].w[0]" 0.00048189118388108909;
	setAttr ".wl[753].w[14:17]" 0.056878652423620224 0.94003051519393921 
		0.0015208820113912225 0.0010881100315600634;
	setAttr -s 5 ".wl[754].w";
	setAttr ".wl[754].w[0]" 0.00084604992298409343;
	setAttr ".wl[754].w[14:17]" 0.096713438630104065 0.89751458168029785 
		0.0028544850647449493 0.0020713331177830696;
	setAttr -s 5 ".wl[755].w";
	setAttr ".wl[755].w[0]" 5.2053917897865176e-005;
	setAttr ".wl[755].w[14:17]" 0.41706809401512146 0.58280938863754272 
		3.9589915104443207e-005 3.0848805181449279e-005;
	setAttr -s 5 ".wl[756].w";
	setAttr ".wl[756].w[0]" 2.3453347239410505e-005;
	setAttr ".wl[756].w[14:17]" 0.23282177746295929 0.76712459325790405 
		1.709409843897447e-005 1.3146551282261498e-005;
	setAttr -s 5 ".wl[757].w";
	setAttr ".wl[757].w[0]" 0.00020703415793832392;
	setAttr ".wl[757].w[14:17]" 0.47096189856529236 0.52848529815673828 
		0.00019186764257028699 0.00015397914103232324;
	setAttr -s 5 ".wl[758].w";
	setAttr ".wl[758].w[0]" 0.00069683080073446035;
	setAttr ".wl[758].w[14:17]" 0.38104608654975891 0.61598426103591919 
		0.0012283852556720376 0.0010444596409797668;
	setAttr -s 5 ".wl[759].w";
	setAttr ".wl[759].w[0]" 0.00070366042200475931;
	setAttr ".wl[759].w[14:17]" 0.37466084957122803 0.6223105788230896 
		0.0012482756283134222 0.001076596206985414;
	setAttr -s 5 ".wl[760].w";
	setAttr ".wl[760].w[0]" 0.00048767539556138217;
	setAttr ".wl[760].w[14:17]" 0.46812224388122559 0.53047192096710205 
		0.00049897428834810853 0.00041909841820597649;
	setAttr -s 5 ".wl[761].w";
	setAttr ".wl[761].w[0]" 3.1446648790733889e-005;
	setAttr ".wl[761].w[14:17]" 0.27570927143096924 0.72422158718109131 
		2.130530629074201e-005 1.6376772691728547e-005;
	setAttr -s 5 ".wl[762].w";
	setAttr ".wl[762].w[0]" 0.00015312591858673841;
	setAttr ".wl[762].w[14:17]" 0.44534862041473389 0.55428892374038696 
		0.00011688079393934458 9.2417671112343669e-005;
	setAttr -s 5 ".wl[763].w";
	setAttr ".wl[763].w[0]" 5.9743077144958079e-005;
	setAttr ".wl[763].w[14:17]" 0.0011305896332487464 0.94651776552200317 
		0.030536623671650887 0.021755313500761986;
	setAttr -s 5 ".wl[764].w";
	setAttr ".wl[764].w[0]" 4.9897189455805346e-005;
	setAttr ".wl[764].w[14:17]" 0.00094610254745930433 0.95391124486923218 
		0.027122989296913147 0.017969682812690735;
	setAttr -s 5 ".wl[765].w";
	setAttr ".wl[765].w[0]" 2.6528050511842594e-005;
	setAttr ".wl[765].w[14:17]" 0.00049406063044443727 0.9769623875617981 
		0.014624128118157387 0.0078928302973508835;
	setAttr -s 5 ".wl[766].w";
	setAttr ".wl[766].w[0]" 1.5514031474594958e-005;
	setAttr ".wl[766].w[14:17]" 0.00026822887593880296 0.98809844255447388 
		0.0078374659642577171 0.0037804241292178631;
	setAttr -s 5 ".wl[767].w";
	setAttr ".wl[767].w[0]" 1.3268234397401102e-005;
	setAttr ".wl[767].w[14:17]" 0.0002142096491297707 0.99017679691314697 
		0.0065788058564066887 0.0030169826932251453;
	setAttr -s 5 ".wl[768].w";
	setAttr ".wl[768].w[0]" 2.2205533241503872e-005;
	setAttr ".wl[768].w[14:17]" 0.00034906878136098385 0.98535829782485962 
		0.0097808567807078362 0.0044895624741911888;
	setAttr -s 5 ".wl[769].w";
	setAttr ".wl[769].w[0]" 3.7270761822583154e-005;
	setAttr ".wl[769].w[14:17]" 0.00065556162735447288 0.97774064540863037 
		0.014300114475190639 0.0072664073668420315;
	setAttr -s 5 ".wl[770].w";
	setAttr ".wl[770].w[0]" 3.0018512916285545e-005;
	setAttr ".wl[770].w[14:17]" 0.00056342891184613109 0.97486156225204468 
		0.015265479683876038 0.0092795426025986671;
	setAttr -s 5 ".wl[771].w[16:20]"  0.35881931 0.6357159 0.00044272636 
		1.3159581e-005 0.00500882;
	setAttr -s 5 ".wl[772].w[16:20]"  0.046443146 0.94990075 0.0014845756 
		2.6206597e-005 0.0021452969;
	setAttr -s 5 ".wl[773].w[16:20]"  0.3173992 0.64864779 0.00026135036 
		1.1718225e-005 0.033679895;
	setAttr -s 5 ".wl[774].w[16:20]"  0.038901027 0.95520288 0.0033289914 
		4.9847164e-005 0.0025172017;
	setAttr -s 5 ".wl[775].w[16:20]"  0.23384014 0.74553412 0.006408995 
		0.00014850668 0.014068319;
	setAttr -s 5 ".wl[776].w";
	setAttr ".wl[776].w[15:18]" 0.28177258372306824 0.33832594752311707 
		0.33156460523605347 0.00058792956406250596;
	setAttr ".wl[776].w[20]" 0.047748889774084091;
	setAttr -s 5 ".wl[777].w[16:20]"  0.42497459 0.52372694 0.00045707388 
		2.4183753e-005 0.050817192;
	setAttr -s 5 ".wl[778].w[16:20]"  0.46717489 0.51148212 0.001723482 
		5.787448e-005 0.019561537;
	setAttr -s 5 ".wl[779].w[16:20]"  0.21724229 0.75076705 0.0069227521 
		0.00014879971 0.024919132;
	setAttr -s 5 ".wl[780].w[16:20]"  0.42245597 0.51038516 0.003589707 
		0.00011296509 0.063456155;
	setAttr -s 5 ".wl[781].w";
	setAttr ".wl[781].w[15:18]" 0.30380144715309143 0.33592039346694946 
		0.31035026907920837 0.0004746553604491055;
	setAttr ".wl[781].w[20]" 0.049453265964984894;
	setAttr -s 5 ".wl[782].w";
	setAttr ".wl[782].w[15:18]" 0.33746922016143799 0.35289683938026428 
		0.26555585861206055 0.00053802219917997718;
	setAttr ".wl[782].w[20]" 0.043540041893720627;
	setAttr -s 5 ".wl[783].w[16:20]"  0.17957029 0.57632917 0.00069223851 
		4.2868221e-005 0.24336538;
	setAttr -s 5 ".wl[784].w[16:20]"  0.2250434 0.55288815 0.00090706546 
		5.5345397e-005 0.2211061;
	setAttr -s 5 ".wl[785].w[16:20]"  0.013555845 0.49546859 0.00012875396 
		8.1551707e-006 0.49083871;
	setAttr -s 5 ".wl[786].w[16:20]"  0.02002288 0.50058806 0.00019292645 
		1.1705994e-005 0.47918448;
	setAttr -s 5 ".wl[787].w[16:20]"  0.17579463 0.7078793 0.00036371982 
		1.8258854e-005 0.11594416;
	setAttr -s 5 ".wl[788].w[16:20]"  0.021906447 0.62838966 0.00012739767 
		6.8653726e-006 0.34956959;
	setAttr -s 5 ".wl[789].w[16:20]"  0.40218967 0.50052804 0.0016056971 
		7.5197866e-005 0.09560135;
	setAttr -s 5 ".wl[790].w[16:20]"  0.27163133 0.52961671 0.0018454009 
		8.648634e-005 0.19682002;
	setAttr -s 5 ".wl[791].w[16:20]"  1.6795859e-005 0.0022179084 
		0.25418186 0.74357748 5.9618924e-006;
	setAttr -s 5 ".wl[792].w[16:20]"  7.4845821e-006 0.16222446 
		0.32717153 0.51059377 2.767536e-006;
	setAttr -s 5 ".wl[793].w[16:20]"  0.00090376986 0.29298276 
		0.089657351 0.61616755 0.00028859635;
	setAttr -s 5 ".wl[794].w[16:20]"  0.30087069 0.59341931 0.011615322 
		0.00027895815 0.093815669;
	setAttr -s 5 ".wl[795].w[16:20]"  0.13812168 0.49867547 0.0032742994 
		0.00011349096 0.35981494;
	setAttr -s 5 ".wl[796].w[16:20]"  0.16174234 0.4874486 0.0053878874 
		0.00015537911 0.34526575;
	setAttr -s 5 ".wl[797].w[16:20]"  0.2376059 0.58333069 0.018026154 
		0.00036317232 0.16067418;
	setAttr -s 5 ".wl[798].w[16:20]"  0.0082412194 0.80418825 0.18481396 
		0.00028635957 0.0024702384;
	setAttr -s 5 ".wl[799].w[16:20]"  0.051300149 0.93369955 0.0090350965 
		0.00011918519 0.0058459793;
	setAttr -s 5 ".wl[800].w[16:20]"  0.0051995516 0.85553563 0.13806568 
		0.00011217591 0.0010869693;
	setAttr -s 5 ".wl[801].w[16:20]"  0.41574544 0.5380488 0.00086015748 
		3.1526048e-005 0.045314126;
	setAttr -s 5 ".wl[802].w[16:20]"  0.0040915259 0.55640632 0.43816328 
		0.00027058332 0.0010682883;
	setAttr -s 5 ".wl[803].w[16:20]"  0.056230742 0.69807035 0.23631309 
		0.00038864635 0.0089971554;
	setAttr -s 5 ".wl[804].w[16:20]"  0.0080573065 0.49589652 0.00014072377 
		8.9113801e-006 0.49589652;
	setAttr -s 5 ".wl[805].w[16:20]"  0.0047376095 0.49758634 8.4271051e-005 
		5.5097421e-006 0.49758634;
	setAttr -s 5 ".wl[806].w[16:20]"  0.0124396 0.50425375 0.00014734732 
		7.6929846e-006 0.48315158;
	setAttr -s 5 ".wl[807].w[16:20]"  0.2597121 0.65450436 0.00057533116 
		2.4312401e-005 0.085183874;
	setAttr -s 2 ".wl[808].w";
	setAttr ".wl[808].w[17]" 0.17703530192375183;
	setAttr ".wl[808].w[19]" 0.82296472787857056;
	setAttr -s 2 ".wl[809].w";
	setAttr ".wl[809].w[17]" 0.19722352921962738;
	setAttr ".wl[809].w[19]" 0.80277639627456665;
	setAttr -s 5 ".wl[810].w[16:20]"  0.00011176812 0.79130673 
		0.054652348 0.15387712 5.2026051e-005;
	setAttr -s 5 ".wl[811].w[16:20]"  0.0062711472 0.85072023 0.13998935 
		0.00020373706 0.0028155267;
	setAttr -s 5 ".wl[812].w[16:20]"  0.084773943 0.82235622 0.056900721 
		0.00059227587 0.035376899;
	setAttr -s 5 ".wl[813].w[16:20]"  0.066589333 0.84228224 0.063191295 
		0.00028005839 0.027657049;
	setAttr -s 5 ".wl[814].w[16:20]"  0.060542561 0.74772888 0.16618997 
		0.00051217718 0.025026403;
	setAttr -s 5 ".wl[815].w[16:20]"  0.0076376824 0.72014421 0.26817763 
		0.00049286988 0.0035476114;
	setAttr -s 5 ".wl[816].w[16:20]"  0.085142687 0.54495293 0.0010060852 
		4.4000222e-005 0.36885431;
	setAttr -s 5 ".wl[817].w[16:20]"  0.12713629 0.48856899 0.0039573181 
		0.00012513042 0.38021228;
	setAttr -s 5 ".wl[818].w[16:20]"  0.052974481 0.88819808 0.036661226 
		0.00031719636 0.021849014;
	setAttr -s 5 ".wl[819].w[16:20]"  0.05305526 0.90212184 0.030952426 
		0.00029862032 0.013571938;
	setAttr -s 5 ".wl[820].w[16:20]"  0.30873275 0.60578734 0.0055842865 
		0.00013517083 0.07976044;
	setAttr -s 5 ".wl[821].w[16:20]"  0.042809159 0.51019293 0.0006797305 
		2.9830255e-005 0.44628838;
	setAttr -s 5 ".wl[822].w[16:20]"  0.013280025 0.50623882 0.00019247834 
		8.8833804e-006 0.48027983;
	setAttr -s 5 ".wl[823].w[16:20]"  0.033416517 0.48516834 0.00070327631 
		3.2836047e-005 0.48067906;
	setAttr -s 5 ".wl[824].w[16:20]"  0.084106594 0.48943219 0.0017963974 
		7.5161981e-005 0.42458963;
	setAttr -s 5 ".wl[825].w[16:20]"  0.30150959 0.45260572 0.01483259 
		0.00039466171 0.23065743;
	setAttr -s 2 ".wl[826].w";
	setAttr ".wl[826].w[17]" 0.098223529756069183;
	setAttr ".wl[826].w[19]" 0.90177649259567261;
	setAttr -s 5 ".wl[827].w[16:20]"  0.00041482752 0.27224582 
		0.31468266 0.41248256 0.00017410715;
	setAttr -s 5 ".wl[828].w[16:20]"  0.07594122 0.64065701 0.19085889 
		0.031592637 0.060950257;
	setAttr -s 5 ".wl[829].w[16:20]"  0.073929258 0.57851589 0.25590998 
		0.032094322 0.059550513;
	setAttr -s 5 ".wl[830].w[16:20]"  0.0063265557 0.49675307 0.00015658706 
		1.0695941e-005 0.49675307;
	setAttr -s 5 ".wl[831].w[16:20]"  0.0090825269 0.49533921 0.00022416205 
		1.4841718e-005 0.49533921;
	setAttr -s 5 ".wl[832].w[16:20]"  0.0052859024 0.49726504 0.00017370384 
		1.0311635e-005 0.49726504;
	setAttr -s 5 ".wl[833].w[16:20]"  0.0076498534 0.49604437 0.00024702918 
		1.4381553e-005 0.49604437;
	setAttr -s 5 ".wl[834].w[16:20]"  0.021499781 0.48895288 0.00057104311 
		2.3484374e-005 0.48895288;
	setAttr -s 5 ".wl[835].w[16:20]"  0.02392482 0.48770553 0.00063732319 
		2.6689366e-005 0.48770553;
	setAttr ".wl[836].w[19]"  1;
	setAttr ".wl[837].w[19]"  1;
	setAttr ".wl[838].w[19]"  1;
	setAttr -s 2 ".wl[839].w";
	setAttr ".wl[839].w[17]" 0.13510587811470032;
	setAttr ".wl[839].w[19]" 0.86489415168762207;
	setAttr -s 5 ".wl[840].w[16:20]"  5.683312e-005 0.0042405431 
		0.047372814 0.94830453 2.5272651e-005;
	setAttr -s 5 ".wl[841].w[16:20]"  4.3091473e-005 0.0040103504 
		0.0365908 0.95933682 1.8941533e-005;
	setAttr -s 2 ".wl[842].w";
	setAttr ".wl[842].w[17]" 0.16655294597148895;
	setAttr ".wl[842].w[19]" 0.83344703912734985;
	setAttr -s 2 ".wl[843].w";
	setAttr ".wl[843].w[17]" 0.16228234767913818;
	setAttr ".wl[843].w[19]" 0.83771765232086182;
	setAttr -s 5 ".wl[844].w[16:20]"  6.5788554e-006 0.00073998066 
		0.0093128234 0.98993754 3.0736194e-006;
	setAttr -s 2 ".wl[845].w";
	setAttr ".wl[845].w[17]" 0.15665294229984283;
	setAttr ".wl[845].w[19]" 0.84334707260131836;
	setAttr -s 2 ".wl[846].w";
	setAttr ".wl[846].w[17]" 0.14791764318943024;
	setAttr ".wl[846].w[19]" 0.85208237171173096;
	setAttr ".wl[847].w[19]"  1;
	setAttr ".wl[848].w[19]"  1;
	setAttr ".wl[849].w[19]"  1;
	setAttr ".wl[850].w[19]"  1;
	setAttr -s 2 ".wl[851].w";
	setAttr ".wl[851].w[17]" 0.12870000302791595;
	setAttr ".wl[851].w[19]" 0.87129998207092285;
	setAttr ".wl[852].w[19]"  1;
	setAttr ".wl[853].w[19]"  1;
	setAttr ".wl[854].w[19]"  1;
	setAttr -s 5 ".wl[855].w[16:20]"  8.8147914e-005 0.0018183865 
		0.033922784 0.96412158 4.9102397e-005;
	setAttr ".wl[856].w[19]"  1;
	setAttr ".wl[857].w[19]"  1;
	setAttr ".wl[858].w[19]"  1;
	setAttr ".wl[859].w[19]"  1;
	setAttr ".wl[860].w[19]"  1;
	setAttr ".wl[861].w[19]"  1;
	setAttr ".wl[862].w[19]"  1;
	setAttr ".wl[863].w[19]"  1;
	setAttr ".wl[864].w[19]"  1;
	setAttr ".wl[865].w[19]"  1;
	setAttr ".wl[866].w[19]"  1;
	setAttr ".wl[867].w[19]"  1;
	setAttr ".wl[868].w[19]"  1;
	setAttr ".wl[869].w[19]"  1;
	setAttr ".wl[870].w[19]"  1;
	setAttr ".wl[871].w[19]"  1;
	setAttr ".wl[872].w[19]"  1;
	setAttr ".wl[873].w[19]"  1;
	setAttr -s 2 ".wl[874].w";
	setAttr ".wl[874].w[17]" 0.080752938985824585;
	setAttr ".wl[874].w[19]" 0.91924703121185303;
	setAttr -s 2 ".wl[875].w";
	setAttr ".wl[875].w[17]" 0.052800003439188004;
	setAttr ".wl[875].w[19]" 0.94720000028610229;
	setAttr -s 5 ".wl[876].w[16:20]"  4.2761217e-006 0.00012825911 
		0.0483004 0.95156485 2.2164679e-006;
	setAttr ".wl[877].w[19]"  1;
	setAttr -s 5 ".wl[878].w[16:20]"  3.3276248e-007 8.8665674e-006 
		0.05449459 0.94549602 1.8638545e-007;
	setAttr -s 5 ".wl[879].w[16:20]"  4.0149786e-008 1.3043615e-006 
		0.0076308292 0.9923678 2.2250893e-008;
	setAttr ".wl[880].w[19]"  1;
	setAttr ".wl[881].w[19]"  1;
	setAttr ".wl[882].w[19]"  1;
	setAttr ".wl[883].w[19]"  1;
	setAttr ".wl[884].w[19]"  1;
	setAttr ".wl[885].w[19]"  1;
	setAttr ".wl[886].w[19]"  1;
	setAttr ".wl[887].w[19]"  1;
	setAttr ".wl[888].w[19]"  1;
	setAttr ".wl[889].w[19]"  1;
	setAttr ".wl[890].w[19]"  0.99999994;
	setAttr ".wl[891].w[19]"  0.99999994;
	setAttr ".wl[892].w[19]"  0.99999994;
	setAttr ".wl[893].w[19]"  1;
	setAttr ".wl[894].w[19]"  1;
	setAttr ".wl[895].w[19]"  0.99999994;
	setAttr -s 5 ".wl[896].w[16:20]"  2.5756877e-005 0.0030996331 
		0.030285325 0.96657699 1.2291624e-005;
	setAttr -s 2 ".wl[897].w";
	setAttr ".wl[897].w[17]" 0.13976471126079559;
	setAttr ".wl[897].w[19]" 0.86023527383804321;
	setAttr -s 2 ".wl[898].w";
	setAttr ".wl[898].w[17]" 0.081529416143894196;
	setAttr ".wl[898].w[19]" 0.91847056150436401;
	setAttr ".wl[899].w[19]"  1;
	setAttr ".wl[900].w[19]"  1;
	setAttr -s 5 ".wl[901].w[16:20]"  8.1607423e-006 0.00045794528 
		0.0091090519 0.99042046 4.3816922e-006;
	setAttr ".wl[902].w[19]"  1;
	setAttr ".wl[903].w[19]"  1;
	setAttr -s 5 ".wl[904].w[16:20]"  8.4417545e-005 0.0025826429 
		0.073578186 0.92370969 4.5060893e-005;
	setAttr ".wl[905].w[19]"  1;
	setAttr ".wl[906].w[19]"  1;
	setAttr ".wl[907].w[19]"  1;
	setAttr ".wl[908].w[19]"  1;
	setAttr ".wl[909].w[19]"  1;
	setAttr ".wl[910].w[19]"  1;
	setAttr -s 5 ".wl[911].w[16:20]"  2.3093249e-005 0.0004730401 
		0.006416549 0.99307436 1.2960619e-005;
	setAttr ".wl[912].w[19]"  1;
	setAttr -s 5 ".wl[913].w[16:20]"  5.790333e-006 0.00012884141 
		0.004025605 0.99583644 3.32632e-006;
	setAttr ".wl[914].w[19]"  1;
	setAttr ".wl[915].w[19]"  1;
	setAttr ".wl[916].w[19]"  1;
	setAttr ".wl[917].w[19]"  1;
	setAttr ".wl[918].w[19]"  1;
	setAttr ".wl[919].w[19]"  1;
	setAttr -s 5 ".wl[920].w";
	setAttr ".wl[920].w[0:1]" 0.0010360578307881951 0.00036713428562507033;
	setAttr ".wl[920].w[14:16]" 0.49903783202171326 0.49903783202171326 
		0.00052122701890766621;
	setAttr -s 5 ".wl[921].w";
	setAttr ".wl[921].w[0:1]" 0.00061477388953790069 0.00022180112136993557;
	setAttr ".wl[921].w[14:16]" 0.49943187832832336 0.49943187832832336 
		0.00029964861460030079;
	setAttr -s 5 ".wl[922].w";
	setAttr ".wl[922].w[0:1]" 0.00035028875572606921 0.00013284599117469043;
	setAttr ".wl[922].w[14:16]" 0.50757849216461182 0.49178487062454224 
		0.00015348133456427604;
	setAttr -s 5 ".wl[923].w";
	setAttr ".wl[923].w[0:1]" 0.00011965158046223223 4.8859335947781801e-005;
	setAttr ".wl[923].w[14:16]" 0.61803334951400757 0.38174834847450256 
		4.9703376134857535e-005;
	setAttr -s 5 ".wl[924].w";
	setAttr ".wl[924].w[0:1]" 0.0002300514024682343 0.00010018971806857735;
	setAttr ".wl[924].w[14:16]" 0.68465662002563477 0.31492546200752258 
		8.7776963482610881e-005;
	setAttr -s 5 ".wl[925].w";
	setAttr ".wl[925].w[0:1]" 0.00078345631482079625 0.00032086382270790637;
	setAttr ".wl[925].w[14:16]" 0.55131316184997559 0.44728723168373108 
		0.00029521316173486412;
	setAttr -s 5 ".wl[926].w";
	setAttr ".wl[926].w[0:1]" 0.00080951570998877287 0.00031472096452489495;
	setAttr ".wl[926].w[14:16]" 0.50033491849899292 0.49818906188011169 
		0.00035172270145267248;
	setAttr -s 5 ".wl[927].w";
	setAttr ".wl[927].w[0:1]" 0.0012023726012557745 0.00043633108725771308;
	setAttr ".wl[927].w[14:16]" 0.49888795614242554 0.49888795614242554 
		0.00058546906802803278;
	setAttr -s 5 ".wl[928].w";
	setAttr ".wl[928].w[24]" 0.010104022920131683;
	setAttr ".wl[928].w[29:32]" 0.11721473932266235 0.85376721620559692 
		0.018562430515885353 0.00035160183324478567;
	setAttr -s 5 ".wl[929].w";
	setAttr ".wl[929].w[24]" 0.043752696365118027;
	setAttr ".wl[929].w[29:32]" 0.20792751014232635 0.70521104335784912 
		0.041738450527191162 0.0013702843571081758;
	setAttr -s 5 ".wl[930].w";
	setAttr ".wl[930].w[24]" 0.10938835144042969;
	setAttr ".wl[930].w[29:32]" 0.22051723301410675 0.61884760856628418 
		0.048848666250705719 0.0023981963749974966;
	setAttr -s 5 ".wl[931].w";
	setAttr ".wl[931].w[24]" 0.00085192342521622777;
	setAttr ".wl[931].w[29:32]" 0.085133582353591919 0.91304874420166016 
		0.00094991596415638924 1.5815965525689535e-005;
	setAttr -s 5 ".wl[932].w";
	setAttr ".wl[932].w[24]" 0.0025440736208111048;
	setAttr ".wl[932].w[29:32]" 0.099925212562084198 0.89707767963409424 
		0.00044199946569278836 1.1016918506356888e-005;
	setAttr -s 5 ".wl[933].w";
	setAttr ".wl[933].w[24]" 0.11306305229663849;
	setAttr ".wl[933].w[29:32]" 0.20847098529338837 0.62489503622055054 
		0.051217969506978989 0.0023529201280325651;
	setAttr -s 5 ".wl[934].w";
	setAttr ".wl[934].w[24]" 0.036194704473018646;
	setAttr ".wl[934].w[29:32]" 0.067748233675956726 0.87808579206466675 
		0.017515063285827637 0.00045619250158779323;
	setAttr -s 5 ".wl[935].w";
	setAttr ".wl[935].w[24]" 0.052390005439519882;
	setAttr ".wl[935].w[29:32]" 0.080695554614067078 0.85353726148605347 
		0.013023495674133301 0.00035369975375942886;
	setAttr -s 5 ".wl[936].w";
	setAttr ".wl[936].w[30:33]" 0.4908064603805542 0.50829583406448364 
		0.00040473302942700684 0.00039424447459168732;
	setAttr ".wl[936].w[38]" 9.8669923318084329e-005;
	setAttr -s 5 ".wl[937].w";
	setAttr ".wl[937].w[30:33]" 0.4725545346736908 0.52447128295898438 
		0.0013317135162651539 0.0013312784722074866;
	setAttr ".wl[937].w[38]" 0.0003112044942099601;
	setAttr -s 5 ".wl[938].w";
	setAttr ".wl[938].w[30:33]" 0.46976780891418457 0.52428829669952393 
		0.00266864406876266 0.00266864406876266;
	setAttr ".wl[938].w[38]" 0.00060651620151475072;
	setAttr -s 5 ".wl[939].w";
	setAttr ".wl[939].w[24]" 5.1575381803559139e-005;
	setAttr ".wl[939].w[29:32]" 7.4102121288888156e-005 0.52052950859069824 
		0.47928327322006226 6.1631704738829285e-005;
	setAttr -s 5 ".wl[940].w";
	setAttr ".wl[940].w[24]" 3.9851660403655842e-005;
	setAttr ".wl[940].w[29:32]" 5.5120835895650089e-005 0.52130627632141113 
		0.47855708003044128 4.1654602682683617e-005;
	setAttr -s 5 ".wl[941].w";
	setAttr ".wl[941].w[30:33]" 0.48111623525619507 0.51285070180892944 
		0.0026981921400874853 0.0026981921400874853;
	setAttr ".wl[941].w[38]" 0.00063667801441624761;
	setAttr -s 5 ".wl[942].w";
	setAttr ".wl[942].w[24]" 0.00036337401252239943;
	setAttr ".wl[942].w[29:32]" 0.00050213339272886515 0.49932178854942322 
		0.49932178854942322 0.00049093319103121758;
	setAttr -s 5 ".wl[943].w";
	setAttr ".wl[943].w[24]" 0.00033218102180399001;
	setAttr ".wl[943].w[29:32]" 0.00044641358545050025 0.50128841400146484 
		0.49758470058441162 0.00034837532439269125;
	setAttr -s 5 ".wl[944].w";
	setAttr ".wl[944].w[30:33]" 5.2971608965890482e-005 0.43184363842010498 
		0.38422420620918274 0.18306130170822144;
	setAttr ".wl[944].w[38]" 0.00081785384099930525;
	setAttr -s 5 ".wl[945].w";
	setAttr ".wl[945].w[32:33]" 0.49958932399749756 0.49675455689430237;
	setAttr ".wl[945].w[38]" 0.00077264057472348213;
	setAttr ".wl[945].w[42]" 0.0016903009964153171;
	setAttr ".wl[945].w[46]" 0.0011932159541174769;
	setAttr -s 5 ".wl[946].w";
	setAttr ".wl[946].w[32:35]" 0.4209505021572113 0.47850364446640015 
		0.095246978104114532 0.0050231851637363434;
	setAttr ".wl[946].w[38]" 0.00027561973547562957;
	setAttr -s 5 ".wl[947].w";
	setAttr ".wl[947].w[30:33]" 3.6336419725557789e-005 0.50478255748748779 
		0.45690023899078369 0.037428475916385651;
	setAttr ".wl[947].w[38]" 0.00085242552449926734;
	setAttr -s 5 ".wl[948].w";
	setAttr ".wl[948].w[32:33]" 0.94965118169784546 0.044910304248332977;
	setAttr ".wl[948].w[38]" 0.0022247049491852522;
	setAttr ".wl[948].w[42]" 0.0013274506200104952;
	setAttr ".wl[948].w[46]" 0.0018863744335249066;
	setAttr -s 5 ".wl[949].w";
	setAttr ".wl[949].w[32:35]" 0.41000518202781677 0.45498725771903992 
		0.12404531985521317 0.01044311560690403;
	setAttr ".wl[949].w[38]" 0.00051903579151257873;
	setAttr -s 5 ".wl[950].w";
	setAttr ".wl[950].w[32:33]" 0.72450357675552368 0.27138286828994751;
	setAttr ".wl[950].w[38]" 0.0015450044302269816;
	setAttr ".wl[950].w[42]" 0.0013151891762390733;
	setAttr ".wl[950].w[46]" 0.0012533603003248572;
	setAttr -s 5 ".wl[951].w";
	setAttr ".wl[951].w[32:33]" 0.87660545110702515 0.11019308120012283;
	setAttr ".wl[951].w[38]" 0.0062255584634840488;
	setAttr ".wl[951].w[42]" 0.0030293911695480347;
	setAttr ".wl[951].w[46]" 0.0039465529844164848;
	setAttr -s 5 ".wl[952].w";
	setAttr ".wl[952].w[24]" 0.0015390734188258648;
	setAttr ".wl[952].w[29:32]" 0.002463541692122817 0.74048620462417603 
		0.25478851795196533 0.00072264147456735373;
	setAttr -s 5 ".wl[953].w";
	setAttr ".wl[953].w[24]" 0.0063002859242260456;
	setAttr ".wl[953].w[29:32]" 0.010027127340435982 0.57848501205444336 
		0.4008660614490509 0.0043215388432145119;
	setAttr -s 5 ".wl[954].w";
	setAttr ".wl[954].w[24]" 0.0090890377759933472;
	setAttr ".wl[954].w[29:32]" 0.013860441744327545 0.52675777673721313 
		0.44237107038497925 0.0079216146841645241;
	setAttr -s 5 ".wl[955].w";
	setAttr ".wl[955].w[24]" 0.0012218777555972338;
	setAttr ".wl[955].w[29:32]" 0.00211181933991611 0.98184984922409058 
		0.014715692959725857 0.00010077055776491761;
	setAttr -s 5 ".wl[956].w";
	setAttr ".wl[956].w[24]" 0.0024649172555655241;
	setAttr ".wl[956].w[29:32]" 0.0037482958287000656 0.96120357513427734 
		0.032382678240537643 0.00020062951080035418;
	setAttr -s 5 ".wl[957].w";
	setAttr ".wl[957].w[24]" 0.013493877835571766;
	setAttr ".wl[957].w[29:32]" 0.020279297605156898 0.56658387184143066 
		0.39273259043693542 0.006910296157002449;
	setAttr -s 5 ".wl[958].w";
	setAttr ".wl[958].w[24]" 0.015888955444097519;
	setAttr ".wl[958].w[29:32]" 0.024278843775391579 0.84100794792175293 
		0.1174166351556778 0.0014076124643906951;
	setAttr -s 5 ".wl[959].w";
	setAttr ".wl[959].w[24]" 0.012013238854706287;
	setAttr ".wl[959].w[29:32]" 0.016186894848942757 0.79905486106872559 
		0.17134402692317963 0.0014009857550263405;
	setAttr -s 5 ".wl[960].w";
	setAttr ".wl[960].w[30:33]" 0.049285799264907837 0.94124168157577515 
		0.004499990027397871 0.004288981668651104;
	setAttr ".wl[960].w[38]" 0.00068347126943990588;
	setAttr -s 5 ".wl[961].w";
	setAttr ".wl[961].w[30:33]" 0.062720924615859985 0.90879249572753906 
		0.013355223461985588 0.013355223461985588;
	setAttr ".wl[961].w[38]" 0.00177605333738029;
	setAttr -s 5 ".wl[962].w";
	setAttr ".wl[962].w[30:33]" 0.084181040525436401 0.86662000417709351 
		0.023150103166699409 0.023150103166699409;
	setAttr ".wl[962].w[38]" 0.0028988176491111517;
	setAttr -s 5 ".wl[963].w";
	setAttr ".wl[963].w[30:33]" 0.034435197710990906 0.96153104305267334 
		0.0019982960075139999 0.0017135108355432749;
	setAttr ".wl[963].w[38]" 0.00032195850508287549;
	setAttr -s 5 ".wl[964].w";
	setAttr ".wl[964].w[30:33]" 0.056742679327726364 0.93657505512237549 
		0.0033927988260984421 0.0027028669137507677;
	setAttr ".wl[964].w[38]" 0.00058654113672673702;
	setAttr -s 5 ".wl[965].w";
	setAttr ".wl[965].w[30:33]" 0.10932423919439316 0.82801079750061035 
		0.029333073645830154 0.029333073645830154;
	setAttr ".wl[965].w[38]" 0.0039988555945456028;
	setAttr -s 5 ".wl[966].w";
	setAttr ".wl[966].w[30:33]" 0.099305376410484314 0.87587475776672363 
		0.01174794789403677 0.011098518967628479;
	setAttr ".wl[966].w[38]" 0.0019734140951186419;
	setAttr -s 5 ".wl[967].w";
	setAttr ".wl[967].w[30:33]" 0.11928138136863708 0.85923492908477783 
		0.010749342851340771 0.0087569821625947952;
	setAttr ".wl[967].w[38]" 0.0019773466046899557;
	setAttr -s 5 ".wl[968].w";
	setAttr ".wl[968].w[30:33]" 0.43244987726211548 0.5663381814956665 
		0.00054956728126853704 0.00053436984308063984;
	setAttr ".wl[968].w[38]" 0.00012781498662661761;
	setAttr -s 5 ".wl[969].w";
	setAttr ".wl[969].w[30:33]" 0.42216873168945313 0.57284557819366455 
		0.0022455933503806591 0.0022455933503806591;
	setAttr ".wl[969].w[38]" 0.00049455644330009818;
	setAttr -s 5 ".wl[970].w";
	setAttr ".wl[970].w[30:33]" 0.42597723007202148 0.56733787059783936 
		0.0030163878109306097 0.0030163878109306097;
	setAttr ".wl[970].w[38]" 0.0006521018804050982;
	setAttr -s 5 ".wl[971].w";
	setAttr ".wl[971].w[30:33]" 0.47743988037109375 0.52239149808883667 
		7.767879287712276e-005 7.1767470217309892e-005;
	setAttr ".wl[971].w[38]" 1.9109733329969458e-005;
	setAttr -s 5 ".wl[972].w";
	setAttr ".wl[972].w[30:33]" 0.49680230021476746 0.50294458866119385 
		0.00011765836097765714 0.00010529132123338059;
	setAttr ".wl[972].w[38]" 3.0173399863997474e-005;
	setAttr -s 5 ".wl[973].w";
	setAttr ".wl[973].w[30:33]" 0.44104227423667908 0.55205059051513672 
		0.003105684882029891 0.003105684882029891;
	setAttr ".wl[973].w[38]" 0.00069578137481585145;
	setAttr -s 5 ".wl[974].w";
	setAttr ".wl[974].w[30:33]" 0.43487271666526794 0.56216168403625488 
		0.0013501622015610337 0.0012910538353025913;
	setAttr ".wl[974].w[38]" 0.00032423681113868952;
	setAttr -s 5 ".wl[975].w";
	setAttr ".wl[975].w[30:33]" 0.4991309642791748 0.49928012490272522 
		0.00073334365151822567 0.00065981893567368388;
	setAttr ".wl[975].w[38]" 0.000195750777493231;
	setAttr ".wl[976].w[26]"  1;
	setAttr ".wl[977].w[26]"  1;
	setAttr ".wl[978].w[26]"  1;
	setAttr ".wl[979].w[26]"  1;
	setAttr ".wl[980].w[26]"  1;
	setAttr ".wl[981].w[26]"  1;
	setAttr ".wl[982].w[26]"  1;
	setAttr ".wl[983].w[26]"  1;
	setAttr ".wl[984].w[26]"  1;
	setAttr ".wl[985].w[26]"  1;
	setAttr ".wl[986].w[26]"  1;
	setAttr ".wl[987].w[26]"  1;
	setAttr ".wl[988].w[26]"  1;
	setAttr ".wl[989].w[26]"  1;
	setAttr ".wl[990].w[26]"  1;
	setAttr ".wl[991].w[26]"  1;
	setAttr ".wl[992].w[26]"  1;
	setAttr ".wl[993].w[26]"  1;
	setAttr ".wl[994].w[26]"  1;
	setAttr ".wl[995].w[26]"  1;
	setAttr ".wl[996].w[26]"  1;
	setAttr ".wl[997].w[26]"  1;
	setAttr ".wl[998].w[26]"  1;
	setAttr ".wl[999].w[26]"  1;
	setAttr ".wl[1000].w[26]"  1;
	setAttr ".wl[1001].w[26]"  1;
	setAttr ".wl[1002].w[26]"  1;
	setAttr ".wl[1003].w[26]"  1;
	setAttr ".wl[1004].w[26]"  1;
	setAttr ".wl[1005].w[26]"  1;
	setAttr ".wl[1006].w[26]"  1;
	setAttr ".wl[1007].w[26]"  1;
	setAttr ".wl[1008].w[26]"  1;
	setAttr ".wl[1009].w[26]"  1;
	setAttr ".wl[1010].w[26]"  1;
	setAttr ".wl[1011].w[26]"  1;
	setAttr ".wl[1012].w[26]"  1;
	setAttr ".wl[1013].w[26]"  1;
	setAttr ".wl[1014].w[26]"  1;
	setAttr ".wl[1015].w[26]"  1;
	setAttr ".wl[1016].w[26]"  1;
	setAttr ".wl[1017].w[26]"  1;
	setAttr ".wl[1018].w[26]"  1;
	setAttr -s 2 ".wl[1019].w[26:27]"  0.95088822 0.049111765;
	setAttr ".wl[1020].w[26]"  1;
	setAttr -s 2 ".wl[1021].w[25:26]"  0.03707647 0.96292353;
	setAttr -s 2 ".wl[1022].w[25:26]"  0.0429 0.95709997;
	setAttr -s 2 ".wl[1023].w[25:26]"  0.049305882 0.9506942;
	setAttr -s 2 ".wl[1024].w[25:26]"  0.030282354 0.96971762;
	setAttr ".wl[1025].w[26]"  1;
	setAttr ".wl[1026].w[26]"  1;
	setAttr ".wl[1027].w[26]"  1;
	setAttr ".wl[1028].w[26]"  1;
	setAttr ".wl[1029].w[26]"  1;
	setAttr ".wl[1030].w[26]"  1;
	setAttr ".wl[1031].w[26]"  1;
	setAttr ".wl[1032].w[26]"  1;
	setAttr ".wl[1033].w[26]"  1;
	setAttr -s 2 ".wl[1034].w[25:26]"  0.049305882 0.95069414;
	setAttr ".wl[1035].w[26]"  1;
	setAttr ".wl[1036].w[26]"  1;
	setAttr ".wl[1037].w[26]"  1;
	setAttr ".wl[1038].w[26]"  1;
	setAttr ".wl[1039].w[26]"  1;
	setAttr ".wl[1040].w[26]"  1;
	setAttr ".wl[1041].w[26]"  1;
	setAttr ".wl[1042].w[26]"  1;
	setAttr ".wl[1043].w[26]"  1;
	setAttr ".wl[1044].w[26]"  1;
	setAttr ".wl[1045].w[26]"  1;
	setAttr ".wl[1046].w[26]"  1;
	setAttr ".wl[1047].w[26]"  1;
	setAttr ".wl[1048].w[26]"  1;
	setAttr ".wl[1049].w[26]"  1;
	setAttr ".wl[1050].w[26]"  1;
	setAttr ".wl[1051].w[26]"  1;
	setAttr ".wl[1052].w[26]"  1;
	setAttr ".wl[1053].w[26]"  1;
	setAttr -s 2 ".wl[1054].w[25:26]"  0.04542353 0.95457649;
	setAttr -s 2 ".wl[1055].w[25:26]"  0.043288235 0.95671177;
	setAttr ".wl[1056].w[26]"  1;
	setAttr ".wl[1057].w[26]"  1;
	setAttr ".wl[1058].w[26]"  1;
	setAttr ".wl[1059].w[26]"  1;
	setAttr ".wl[1060].w[26]"  1;
	setAttr ".wl[1061].w[26]"  1;
	setAttr ".wl[1062].w[26]"  1;
	setAttr ".wl[1063].w[26]"  1;
	setAttr ".wl[1064].w[26]"  1;
	setAttr ".wl[1065].w[26]"  1;
	setAttr ".wl[1066].w[26]"  1;
	setAttr ".wl[1067].w[26]"  1;
	setAttr ".wl[1068].w[26]"  1;
	setAttr ".wl[1069].w[26]"  1;
	setAttr ".wl[1070].w[26]"  1;
	setAttr ".wl[1071].w[26]"  1;
	setAttr ".wl[1072].w[26]"  1;
	setAttr ".wl[1073].w[26]"  1;
	setAttr ".wl[1074].w[26]"  1;
	setAttr -s 2 ".wl[1075].w[25:26]"  0.047752943 0.95224708;
	setAttr ".wl[1076].w[26]"  1;
	setAttr ".wl[1077].w[26]"  1;
	setAttr ".wl[1078].w[26]"  1;
	setAttr ".wl[1079].w[26]"  1;
	setAttr ".wl[1080].w[26]"  1;
	setAttr ".wl[1081].w[26]"  1;
	setAttr ".wl[1082].w[26]"  1;
	setAttr ".wl[1083].w[26]"  1;
	setAttr ".wl[1084].w[26]"  1;
	setAttr ".wl[1085].w[26]"  1;
	setAttr ".wl[1086].w[26]"  1;
	setAttr ".wl[1087].w[26]"  1;
	setAttr ".wl[1088].w[26]"  1;
	setAttr ".wl[1089].w[26]"  1;
	setAttr ".wl[1090].w[26]"  1;
	setAttr ".wl[1091].w[26]"  1;
	setAttr ".wl[1092].w[26]"  1;
	setAttr ".wl[1093].w[26]"  1;
	setAttr ".wl[1094].w[26]"  1;
	setAttr ".wl[1095].w[26]"  1;
	setAttr ".wl[1096].w[26]"  1;
	setAttr ".wl[1097].w[26]"  1;
	setAttr ".wl[1098].w[26]"  1;
	setAttr ".wl[1099].w[26]"  1;
	setAttr ".wl[1100].w[26]"  1;
	setAttr ".wl[1101].w[26]"  1;
	setAttr ".wl[1102].w[26]"  1;
	setAttr ".wl[1103].w[26]"  1;
	setAttr ".wl[1104].w[26]"  1;
	setAttr ".wl[1105].w[26]"  1;
	setAttr ".wl[1106].w[26]"  1;
	setAttr ".wl[1107].w[26]"  1;
	setAttr ".wl[1108].w[26]"  1;
	setAttr ".wl[1109].w[26]"  1;
	setAttr ".wl[1110].w[26]"  1;
	setAttr ".wl[1111].w[26]"  1;
	setAttr ".wl[1112].w[26]"  1;
	setAttr ".wl[1113].w[26]"  1;
	setAttr ".wl[1114].w[26]"  1;
	setAttr ".wl[1115].w[26]"  1;
	setAttr ".wl[1116].w[26]"  1;
	setAttr ".wl[1117].w[26]"  1;
	setAttr ".wl[1118].w[26]"  1;
	setAttr ".wl[1119].w[26]"  1;
	setAttr ".wl[1120].w[26]"  1;
	setAttr ".wl[1121].w[26]"  1;
	setAttr ".wl[1122].w[26]"  1;
	setAttr ".wl[1123].w[26]"  1;
	setAttr ".wl[1124].w[26]"  1;
	setAttr -s 5 ".wl[1125].w[24:28]"  0.0090482235 0.039592095 
		0.94715106 0.0014777625 0.0027308553;
	setAttr ".wl[1126].w[26]"  1;
	setAttr -s 2 ".wl[1127].w[25:26]"  0.099776477 0.90022349;
	setAttr -s 2 ".wl[1128].w[25:26]"  0.042705882 0.95729405;
	setAttr ".wl[1129].w[26]"  1;
	setAttr ".wl[1130].w[26]"  1;
	setAttr ".wl[1131].w[26]"  1;
	setAttr ".wl[1132].w[26]"  1;
	setAttr ".wl[1133].w[26]"  1;
	setAttr ".wl[1134].w[26]"  1;
	setAttr ".wl[1135].w[26]"  1;
	setAttr -s 2 ".wl[1136].w[25:26]"  0.16053528 0.83946472;
	setAttr ".wl[1137].w[26]"  1;
	setAttr ".wl[1138].w[26]"  1;
	setAttr -s 2 ".wl[1139].w[25:26]"  0.087352939 0.91264707;
	setAttr -s 5 ".wl[1140].w[24:28]"  0.014700673 0.35770893 0.6256941 
		0.0012513975 0.00064490963;
	setAttr ".wl[1141].w[26]"  1;
	setAttr ".wl[1142].w[26]"  1;
	setAttr -s 2 ".wl[1143].w[25:26]"  0.073958829 0.92604119;
	setAttr ".wl[1144].w[26]"  1;
	setAttr ".wl[1145].w[26]"  1;
	setAttr ".wl[1146].w[26]"  1;
	setAttr ".wl[1147].w[26]"  1;
	setAttr ".wl[1148].w[26]"  1;
	setAttr ".wl[1149].w[26]"  1;
	setAttr ".wl[1150].w[26]"  1;
	setAttr ".wl[1151].w[26]"  1;
	setAttr ".wl[1152].w[26]"  1;
	setAttr ".wl[1153].w[26]"  1;
	setAttr ".wl[1154].w[26]"  1;
	setAttr -s 4 ".wl[1155].w";
	setAttr ".wl[1155].w[22]" 0.0012976875295862556;
	setAttr ".wl[1155].w[25:27]" 0.0053096264600753784 0.90689480304718018 
		0.086497880518436432;
	setAttr ".wl[1156].w[26]"  1;
	setAttr ".wl[1157].w[26]"  1;
	setAttr ".wl[1158].w[26]"  1;
	setAttr ".wl[1159].w[26]"  1;
	setAttr ".wl[1160].w[26]"  1;
	setAttr ".wl[1161].w[26]"  1;
	setAttr ".wl[1162].w[26]"  1;
	setAttr ".wl[1163].w[26]"  1;
	setAttr ".wl[1164].w[26]"  1;
	setAttr ".wl[1165].w[26]"  1;
	setAttr ".wl[1166].w[26]"  1;
	setAttr ".wl[1167].w[26]"  1;
	setAttr ".wl[1168].w[26]"  1;
	setAttr ".wl[1169].w[26]"  1;
	setAttr ".wl[1170].w[26]"  1;
	setAttr ".wl[1171].w[26]"  1;
	setAttr ".wl[1172].w[26]"  1;
	setAttr ".wl[1173].w[26]"  1;
	setAttr ".wl[1174].w[26]"  1;
	setAttr ".wl[1175].w[26]"  1;
	setAttr ".wl[1176].w[26]"  1;
	setAttr ".wl[1177].w[26]"  1;
	setAttr ".wl[1178].w[26]"  1;
	setAttr ".wl[1179].w[26]"  1;
	setAttr ".wl[1180].w[26]"  1;
	setAttr ".wl[1181].w[26]"  1;
	setAttr ".wl[1182].w[26]"  1;
	setAttr ".wl[1183].w[26]"  1;
	setAttr ".wl[1184].w[26]"  1;
	setAttr ".wl[1185].w[26]"  1;
	setAttr ".wl[1186].w[26]"  1;
	setAttr ".wl[1187].w[26]"  1;
	setAttr ".wl[1188].w[26]"  1;
	setAttr -s 2 ".wl[1189].w[25:26]"  0.032611765 0.96738821;
	setAttr -s 2 ".wl[1190].w[25:26]"  0.043482352 0.95651764;
	setAttr -s 2 ".wl[1191].w[25:26]"  0.043288235 0.95671177;
	setAttr -s 2 ".wl[1192].w[25:26]"  0.030864706 0.96913528;
	setAttr ".wl[1193].w[26]"  1;
	setAttr ".wl[1194].w[26]"  1;
	setAttr ".wl[1195].w[26]"  1;
	setAttr ".wl[1196].w[26]"  1;
	setAttr ".wl[1197].w[26]"  1;
	setAttr ".wl[1198].w[26]"  1;
	setAttr ".wl[1199].w[26]"  1;
	setAttr ".wl[1200].w[26]"  1;
	setAttr ".wl[1201].w[26]"  1;
	setAttr -s 2 ".wl[1202].w[25:26]"  0.087547056 0.91245294;
	setAttr ".wl[1203].w[26]"  1;
	setAttr ".wl[1204].w[26]"  1;
	setAttr ".wl[1205].w[26]"  1;
	setAttr ".wl[1206].w[26]"  1;
	setAttr ".wl[1207].w[26]"  1;
	setAttr ".wl[1208].w[26]"  1;
	setAttr ".wl[1209].w[26]"  1;
	setAttr ".wl[1210].w[26]"  1;
	setAttr ".wl[1211].w[26]"  1;
	setAttr ".wl[1212].w[26]"  1;
	setAttr ".wl[1213].w[26]"  1;
	setAttr ".wl[1214].w[26]"  1;
	setAttr ".wl[1215].w[26]"  1;
	setAttr ".wl[1216].w[26]"  1;
	setAttr ".wl[1217].w[26]"  1;
	setAttr ".wl[1218].w[26]"  1;
	setAttr ".wl[1219].w[26]"  1;
	setAttr ".wl[1220].w[26]"  1;
	setAttr ".wl[1221].w[26]"  1;
	setAttr -s 2 ".wl[1222].w[25:26]"  0.036882352 0.96311766;
	setAttr -s 2 ".wl[1223].w[25:26]"  0.03552353 0.96447653;
	setAttr -s 4 ".wl[1224].w";
	setAttr ".wl[1224].w[22]" 3.1686133297625929e-005;
	setAttr ".wl[1224].w[25:27]" 0.017575196921825409 0.98233163356781006 
		6.1484497564379126e-005;
	setAttr ".wl[1225].w[26]"  1;
	setAttr ".wl[1226].w[26]"  1;
	setAttr ".wl[1227].w[26]"  1;
	setAttr ".wl[1228].w[26]"  1;
	setAttr ".wl[1229].w[26]"  1;
	setAttr ".wl[1230].w[26]"  1;
	setAttr ".wl[1231].w[26]"  1;
	setAttr ".wl[1232].w[26]"  1;
	setAttr ".wl[1233].w[26]"  1;
	setAttr ".wl[1234].w[26]"  1;
	setAttr ".wl[1235].w[26]"  1;
	setAttr ".wl[1236].w[26]"  1;
	setAttr ".wl[1237].w[26]"  1;
	setAttr ".wl[1238].w[26]"  1;
	setAttr ".wl[1239].w[26]"  1;
	setAttr -s 5 ".wl[1240].w";
	setAttr ".wl[1240].w[53:54]" 0.63182717561721802 0.0065142498351633549;
	setAttr ".wl[1240].w[59]" 0.33264487981796265;
	setAttr ".wl[1240].w[63]" 0.0093621434643864632;
	setAttr ".wl[1240].w[67]" 0.019651412963867188;
	setAttr -s 5 ".wl[1241].w";
	setAttr ".wl[1241].w[53:54]" 0.82404464483261108 0.056892599910497665;
	setAttr ".wl[1241].w[59]" 0.083093561232089996;
	setAttr ".wl[1241].w[63]" 0.015666641294956207;
	setAttr ".wl[1241].w[67]" 0.020302578806877136;
	setAttr -s 5 ".wl[1242].w[54:58]"  0.01336508 0.37507716 0.5918721 
		0.018662058 0.0010235836;
	setAttr -s 5 ".wl[1243].w[53:57]"  0.0072705052 0.050932094 
		0.49460739 0.44041672 0.0067732916;
	setAttr -s 5 ".wl[1244].w[53:57]"  0.032388732 0.33138788 0.5230509 
		0.10970349 0.003468937;
	setAttr -s 5 ".wl[1245].w[53:57]"  0.01103516 0.059568334 0.47673947 
		0.44056326 0.012093863;
	setAttr -s 5 ".wl[1246].w";
	setAttr ".wl[1246].w[32:33]" 0.3875231146812439 0.0029092100448906422;
	setAttr ".wl[1246].w[38]" 0.007071835920214653;
	setAttr ".wl[1246].w[42]" 0.28355118632316589;
	setAttr ".wl[1246].w[46]" 0.31894463300704956;
	setAttr -s 4 ".wl[1247].w";
	setAttr ".wl[1247].w[33]" 0.011516744270920753;
	setAttr ".wl[1247].w[39]" 0.75096863508224487;
	setAttr ".wl[1247].w[45:46]" 0.13168624043464661 0.10582832247018814;
	setAttr -s 4 ".wl[1248].w";
	setAttr ".wl[1248].w[33]" 0.011516744270920753;
	setAttr ".wl[1248].w[39]" 0.75096863508224487;
	setAttr ".wl[1248].w[45:46]" 0.13168624043464661 0.10582832247018814;
	setAttr -s 5 ".wl[1249].w";
	setAttr ".wl[1249].w[32:33]" 0.48523315787315369 0.00124061678070575;
	setAttr ".wl[1249].w[38]" 0.014952244237065315;
	setAttr ".wl[1249].w[42]" 0.013340882025659084;
	setAttr ".wl[1249].w[46]" 0.48523315787315369;
	setAttr -s 5 ".wl[1250].w";
	setAttr ".wl[1250].w[32:33]" 0.44322875142097473 0.0017068616580218077;
	setAttr ".wl[1250].w[38]" 0.42859366536140442;
	setAttr ".wl[1250].w[42]" 0.0070132119581103325;
	setAttr ".wl[1250].w[46]" 0.11945749074220657;
	setAttr -s 5 ".wl[1251].w";
	setAttr ".wl[1251].w[32:33]" 0.59313839673995972 0.0035981910768896341;
	setAttr ".wl[1251].w[38]" 0.38669964671134949;
	setAttr ".wl[1251].w[42]" 0.0040918225422501564;
	setAttr ".wl[1251].w[46]" 0.012472048401832581;
	setAttr -s 5 ".wl[1252].w";
	setAttr ".wl[1252].w[32:33]" 0.52400368452072144 0.0019514762097969651;
	setAttr ".wl[1252].w[38]" 0.45633316040039063;
	setAttr ".wl[1252].w[42]" 0.0029270239174365997;
	setAttr ".wl[1252].w[46]" 0.014784625731408596;
	setAttr -s 5 ".wl[1253].w";
	setAttr ".wl[1253].w[32:33]" 0.74447864294052124 0.011417213827371597;
	setAttr ".wl[1253].w[38]" 0.0086422357708215714;
	setAttr ".wl[1253].w[42]" 0.13054817914962769;
	setAttr ".wl[1253].w[46]" 0.10491373389959335;
	setAttr -s 4 ".wl[1254].w";
	setAttr ".wl[1254].w[33]" 0.011516744270920753;
	setAttr ".wl[1254].w[39]" 0.75096863508224487;
	setAttr ".wl[1254].w[45:46]" 0.13168624043464661 0.10582832247018814;
	setAttr -s 5 ".wl[1255].w";
	setAttr ".wl[1255].w[33:36]" 0.33492359519004822 0.60584217309951782 
		0.047865722328424454 0.0015803941059857607;
	setAttr ".wl[1255].w[39]" 0.0097881034016609192;
	setAttr -s 5 ".wl[1256].w";
	setAttr ".wl[1256].w[32:33]" 0.74544155597686768 0.0065782051533460617;
	setAttr ".wl[1256].w[38]" 0.028279991820454597;
	setAttr ".wl[1256].w[42]" 0.020985232666134834;
	setAttr ".wl[1256].w[46]" 0.19871498644351959;
	setAttr -s 5 ".wl[1257].w";
	setAttr ".wl[1257].w[32:33]" 0.60066211223602295 0.0053909868001937866;
	setAttr ".wl[1257].w[38]" 0.25881296396255493;
	setAttr ".wl[1257].w[42]" 0.011588784866034985;
	setAttr ".wl[1257].w[46]" 0.12354514747858047;
	setAttr -s 5 ".wl[1258].w";
	setAttr ".wl[1258].w[32:33]" 0.79287445545196533 0.022979702800512314;
	setAttr ".wl[1258].w[38]" 0.15319277346134186;
	setAttr ".wl[1258].w[42]" 0.0095908194780349731;
	setAttr ".wl[1258].w[46]" 0.021362243220210075;
	setAttr -s 5 ".wl[1259].w";
	setAttr ".wl[1259].w[32:33]" 0.72656750679016113 0.0055450042709708214;
	setAttr ".wl[1259].w[38]" 0.24176841974258423;
	setAttr ".wl[1259].w[42]" 0.0049850228242576122;
	setAttr ".wl[1259].w[46]" 0.021134050562977791;
	setAttr -s 5 ".wl[1260].w";
	setAttr ".wl[1260].w[32:33]" 0.45765551924705505 0.00061865459429100156;
	setAttr ".wl[1260].w[42:44]" 0.51014959812164307 0.028036277741193771 
		0.0035399070475250483;
	setAttr -s 5 ".wl[1261].w";
	setAttr ".wl[1261].w[33]" 0.00046145933447405696;
	setAttr ".wl[1261].w[39]" 0.48368120193481445;
	setAttr ".wl[1261].w[43]" 0.0083352783694863319;
	setAttr ".wl[1261].w[46]" 0.50627589225769043;
	setAttr ".wl[1261].w[48]" 0.0012461224105209112;
	setAttr -s 4 ".wl[1262].w";
	setAttr ".wl[1262].w[33]" 0.0017771134153008461;
	setAttr ".wl[1262].w[39]" 0.46116375923156738;
	setAttr ".wl[1262].w[45:46]" 0.4287014901638031 0.10835767537355423;
	setAttr -s 5 ".wl[1263].w";
	setAttr ".wl[1263].w[32:33]" 0.45655646920204163 0.0017593590309843421;
	setAttr ".wl[1263].w[38]" 0.0099905934184789658;
	setAttr ".wl[1263].w[42]" 0.42441850900650024;
	setAttr ".wl[1263].w[46]" 0.10727511346340179;
	setAttr -s 5 ".wl[1264].w";
	setAttr ".wl[1264].w[32:33]" 0.40536904335021973 0.00022107217228040099;
	setAttr ".wl[1264].w[46:48]" 0.58540254831314087 0.0080841640010476112 
		0.0009230832802131772;
	setAttr -s 5 ".wl[1265].w";
	setAttr ".wl[1265].w[32:33]" 0.29680588841438293 0.00033871486084535718;
	setAttr ".wl[1265].w[46:48]" 0.66589409112930298 0.033937297761440277 
		0.0030240039341151714;
	setAttr -s 5 ".wl[1266].w";
	setAttr ".wl[1266].w[32:33]" 0.46735677123069763 0.00081491970922797918;
	setAttr ".wl[1266].w[38]" 0.038806609809398651;
	setAttr ".wl[1266].w[42]" 0.027115272358059883;
	setAttr ".wl[1266].w[46]" 0.46590641140937805;
	setAttr -s 5 ".wl[1267].w";
	setAttr ".wl[1267].w[32:33]" 0.46364974975585938 0.0011482866248115897;
	setAttr ".wl[1267].w[46:48]" 0.49608093500137329 0.033425692468881607 
		0.0056954571045935154;
	setAttr -s 5 ".wl[1268].w";
	setAttr ".wl[1268].w[32:33]" 0.57463330030441284 0.00039796941564418375;
	setAttr ".wl[1268].w[38]" 0.39759981632232666;
	setAttr ".wl[1268].w[42]" 0.0028273225761950016;
	setAttr ".wl[1268].w[46]" 0.024541623890399933;
	setAttr -s 5 ".wl[1269].w";
	setAttr ".wl[1269].w[32:33]" 0.46030533313751221 0.00022433869889937341;
	setAttr ".wl[1269].w[38:40]" 0.52495193481445313 0.012592491693794727 
		0.0019258935935795307;
	setAttr -s 5 ".wl[1270].w";
	setAttr ".wl[1270].w[32:33]" 0.5077778697013855 0.00038741398020647466;
	setAttr ".wl[1270].w[38]" 0.4874514639377594;
	setAttr ".wl[1270].w[42]" 0.00095586146926507354;
	setAttr ".wl[1270].w[46]" 0.0034274314530193806;
	setAttr -s 5 ".wl[1271].w";
	setAttr ".wl[1271].w[32:33]" 0.48297327756881714 0.00019603157124947757;
	setAttr ".wl[1271].w[38:40]" 0.50368869304656982 0.011217009276151657 
		0.0019250421319156885;
	setAttr -s 5 ".wl[1272].w[32:36]"  0.044754814 0.32684532 0.52935368 
		0.094853997 0.0041922438;
	setAttr -s 5 ".wl[1273].w";
	setAttr ".wl[1273].w[33:36]" 0.071191102266311646 0.45195695757865906 
		0.42038333415985107 0.029919525608420372;
	setAttr ".wl[1273].w[39]" 0.026549097150564194;
	setAttr -s 5 ".wl[1274].w";
	setAttr ".wl[1274].w[32:33]" 0.26877295970916748 0.00012781527766492218;
	setAttr ".wl[1274].w[46:48]" 0.72045683860778809 0.0097862435504794121 
		0.00085614522686228156;
	setAttr -s 5 ".wl[1275].w";
	setAttr ".wl[1275].w[32:33]" 0.39378735423088074 0.0005232372204773128;
	setAttr ".wl[1275].w[46:48]" 0.57065808773040771 0.031208347529172897 
		0.003822945524007082;
	setAttr -s 5 ".wl[1276].w";
	setAttr ".wl[1276].w[32:33]" 0.4983755350112915 0.00025526608806103468;
	setAttr ".wl[1276].w[38]" 0.4983755350112915;
	setAttr ".wl[1276].w[42]" 0.00056053150910884142;
	setAttr ".wl[1276].w[46]" 0.0024330697488039732;
	setAttr -s 5 ".wl[1277].w";
	setAttr ".wl[1277].w[32:33]" 0.46698665618896484 0.00042604978079907596;
	setAttr ".wl[1277].w[38]" 0.45918524265289307;
	setAttr ".wl[1277].w[42]" 0.0033733292948454618;
	setAttr ".wl[1277].w[46]" 0.070028774440288544;
	setAttr -s 5 ".wl[1278].w";
	setAttr ".wl[1278].w[32:33]" 0.48858726024627686 0.00098294776398688555;
	setAttr ".wl[1278].w[46:48]" 0.4887995719909668 0.018244329839944839 
		0.0033858560491353273;
	setAttr -s 5 ".wl[1279].w";
	setAttr ".wl[1279].w[32:33]" 0.48368123173713684 0.00046145936357788742;
	setAttr ".wl[1279].w[46:48]" 0.50627595186233521 0.0083352793008089066 
		0.001246122526936233;
	setAttr -s 5 ".wl[1280].w";
	setAttr ".wl[1280].w[32:33]" 0.40660426020622253 0.00085639575263485312;
	setAttr ".wl[1280].w[38]" 0.0048198290169239044;
	setAttr ".wl[1280].w[42]" 0.37485784292221069;
	setAttr ".wl[1280].w[46]" 0.21286159753799438;
	setAttr -s 4 ".wl[1281].w";
	setAttr ".wl[1281].w[33]" 0.0017771134153008461;
	setAttr ".wl[1281].w[39]" 0.46116375923156738;
	setAttr ".wl[1281].w[45:46]" 0.4287014901638031 0.10835767537355423;
	setAttr -s 5 ".wl[1282].w[33:37]"  0.0060683875 0.082375556 
		0.74381185 0.16220741 0.0055368138;
	setAttr -s 5 ".wl[1283].w[33:37]"  0.023407804 0.39400727 0.55222124 
		0.028189354 0.0021743274;
	setAttr -s 5 ".wl[1284].w[32:36]"  0.026549097 0.071191102 
		0.45195696 0.42038333 0.029919526;
	setAttr -s 5 ".wl[1285].w";
	setAttr ".wl[1285].w[33:36]" 0.048315335065126419 0.60906922817230225 
		0.33302390575408936 0.0042402287945151329;
	setAttr ".wl[1285].w[39]" 0.0053512481972575188;
	setAttr -s 5 ".wl[1286].w[33:37]"  0.0031248585 0.48542684 
		0.50927174 0.0020424242 0.00013412301;
	setAttr -s 5 ".wl[1287].w[32:36]"  0.15099989 0.19861291 0.36267278 
		0.2514182 0.036296297;
	setAttr -s 5 ".wl[1288].w";
	setAttr ".wl[1288].w[32:33]" 0.65813863277435303 0.26694297790527344;
	setAttr ".wl[1288].w[38]" 0.030851125717163086;
	setAttr ".wl[1288].w[42]" 0.02385011687874794;
	setAttr ".wl[1288].w[46]" 0.020217189565300941;
	setAttr -s 5 ".wl[1289].w";
	setAttr ".wl[1289].w[33:36]" 0.33492359519004822 0.60584217309951782 
		0.047865722328424454 0.0015803941059857607;
	setAttr ".wl[1289].w[39]" 0.0097881034016609192;
	setAttr -s 5 ".wl[1290].w[32:36]"  0.0097881034 0.3349236 0.60584217 
		0.047865722 0.0015803941;
	setAttr -s 5 ".wl[1291].w";
	setAttr ".wl[1291].w[32:33]" 0.46166560053825378 0.00094623182667419314;
	setAttr ".wl[1291].w[46:48]" 0.51350694894790649 0.020945273339748383 
		0.0029359266627579927;
	setAttr -s 5 ".wl[1292].w";
	setAttr ".wl[1292].w[32:33]" 0.46646642684936523 0.00057669420493766665;
	setAttr ".wl[1292].w[38:40]" 0.50229406356811523 0.026224832981824875 
		0.0044380072504281998;
	setAttr -s 5 ".wl[1293].w";
	setAttr ".wl[1293].w[32:33]" 0.0032270997762680054 4.3309573811711743e-005;
	setAttr ".wl[1293].w[46:48]" 0.49377194046974182 0.49377194046974182 
		0.0091856960207223892;
	setAttr -s 5 ".wl[1294].w";
	setAttr ".wl[1294].w[32:33]" 0.0050778770819306374 6.195091555127874e-005;
	setAttr ".wl[1294].w[46:48]" 0.49108436703681946 0.49108436703681946 
		0.012691453099250793;
	setAttr -s 5 ".wl[1295].w";
	setAttr ".wl[1295].w[33]" 0.00013147930440027267;
	setAttr ".wl[1295].w[39]" 0.010525957681238651;
	setAttr ".wl[1295].w[43]" 0.43693169951438904;
	setAttr ".wl[1295].w[46]" 0.53492957353591919;
	setAttr ".wl[1295].w[48]" 0.017481280490756035;
	setAttr -s 5 ".wl[1296].w";
	setAttr ".wl[1296].w[32:33]" 0.010525957681238651 0.00013147930440027267;
	setAttr ".wl[1296].w[46:48]" 0.53492957353591919 0.43693169951438904 
		0.017481280490756035;
	setAttr -s 5 ".wl[1297].w";
	setAttr ".wl[1297].w[32:33]" 0.013326365500688553 0.00015561797772534192;
	setAttr ".wl[1297].w[46:48]" 0.53635239601135254 0.4232916533946991 
		0.026873903349041939;
	setAttr -s 5 ".wl[1298].w";
	setAttr ".wl[1298].w[32:33]" 0.013968968763947487 0.00013901048805564642;
	setAttr ".wl[1298].w[46:48]" 0.54375070333480835 0.41760897636413574 
		0.024532370269298553;
	setAttr -s 5 ".wl[1299].w";
	setAttr ".wl[1299].w[32:33]" 0.012888605706393719 0.00013820550520904362;
	setAttr ".wl[1299].w[46:48]" 0.4972517192363739 0.46103972196578979 
		0.02868175134062767;
	setAttr -s 5 ".wl[1300].w";
	setAttr ".wl[1300].w[32:33]" 0.0058596068993210793 6.7744091211352497e-005;
	setAttr ".wl[1300].w[46:48]" 0.48812249302864075 0.48810717463493347 
		0.017843028530478477;
	setAttr -s 5 ".wl[1301].w";
	setAttr ".wl[1301].w[33]" 0.00013147930440027267;
	setAttr ".wl[1301].w[39]" 0.010525957681238651;
	setAttr ".wl[1301].w[43]" 0.43693169951438904;
	setAttr ".wl[1301].w[46]" 0.53492957353591919;
	setAttr ".wl[1301].w[48]" 0.017481280490756035;
	setAttr -s 5 ".wl[1302].w";
	setAttr ".wl[1302].w[33]" 0.00098294776398688555;
	setAttr ".wl[1302].w[39]" 0.48858726024627686;
	setAttr ".wl[1302].w[43]" 0.018244329839944839;
	setAttr ".wl[1302].w[46]" 0.4887995719909668;
	setAttr ".wl[1302].w[48]" 0.0033858560491353273;
	setAttr -s 5 ".wl[1303].w";
	setAttr ".wl[1303].w[33]" 0.00098294776398688555;
	setAttr ".wl[1303].w[39]" 0.48858726024627686;
	setAttr ".wl[1303].w[43]" 0.018244329839944839;
	setAttr ".wl[1303].w[46]" 0.4887995719909668;
	setAttr ".wl[1303].w[48]" 0.0033858560491353273;
	setAttr -s 4 ".wl[1304].w";
	setAttr ".wl[1304].w[33]" 0.00084782071644440293;
	setAttr ".wl[1304].w[39]" 0.48622551560401917;
	setAttr ".wl[1304].w[45:46]" 0.028210006654262543 0.48471659421920776;
	setAttr -s 5 ".wl[1305].w";
	setAttr ".wl[1305].w[33]" 0.00015561799227725714;
	setAttr ".wl[1305].w[39]" 0.013326367363333702;
	setAttr ".wl[1305].w[43]" 0.42329171299934387;
	setAttr ".wl[1305].w[46]" 0.53635245561599731;
	setAttr ".wl[1305].w[48]" 0.026873907074332237;
	setAttr -s 5 ".wl[1306].w";
	setAttr ".wl[1306].w[33]" 0.00013147930440027267;
	setAttr ".wl[1306].w[39]" 0.010525957681238651;
	setAttr ".wl[1306].w[43]" 0.43693169951438904;
	setAttr ".wl[1306].w[46]" 0.53492957353591919;
	setAttr ".wl[1306].w[48]" 0.017481280490756035;
	setAttr -s 5 ".wl[1307].w";
	setAttr ".wl[1307].w[32:33]" 0.0075081158429384232 5.6916309404186904e-005;
	setAttr ".wl[1307].w[38:40]" 0.51785796880722046 0.45743504166603088 
		0.017141934484243393;
	setAttr -s 5 ".wl[1308].w";
	setAttr ".wl[1308].w[32:33]" 0.0052678207866847515 4.0630638977745548e-005;
	setAttr ".wl[1308].w[38:40]" 0.49227425456047058 0.48451629281044006 
		0.017901049926877022;
	setAttr -s 5 ".wl[1309].w";
	setAttr ".wl[1309].w[32:33]" 0.016875602304935455 0.00012780110409948975;
	setAttr ".wl[1309].w[38:40]" 0.55662226676940918 0.40245985984802246 
		0.023914406076073647;
	setAttr -s 5 ".wl[1310].w";
	setAttr ".wl[1310].w[32:33]" 0.015214213170111179 8.966966561274603e-005;
	setAttr ".wl[1310].w[38:40]" 0.57894057035446167 0.38154900074005127 
		0.024206498637795448;
	setAttr -s 5 ".wl[1311].w";
	setAttr ".wl[1311].w[32:33]" 0.012049712240695953 6.7030159698333591e-005;
	setAttr ".wl[1311].w[38:40]" 0.5476042628288269 0.41663309931755066 
		0.023645969107747078;
	setAttr -s 5 ".wl[1312].w";
	setAttr ".wl[1312].w[32:33]" 0.010512069799005985 6.9557951064780354e-005;
	setAttr ".wl[1312].w[38:40]" 0.49338537454605103 0.46569320559501648 
		0.030339756980538368;
	setAttr -s 5 ".wl[1313].w[33:37]"  0.023407804 0.39400727 0.55222124 
		0.028189354 0.0021743274;
	setAttr -s 5 ".wl[1314].w";
	setAttr ".wl[1314].w[33:36]" 0.071191102266311646 0.45195695757865906 
		0.42038333415985107 0.029919525608420372;
	setAttr ".wl[1314].w[39]" 0.026549097150564194;
	setAttr -s 5 ".wl[1315].w[33:37]"  0.00093138218 0.1688851 
		0.82767993 0.0023997654 0.00010381514;
	setAttr -s 5 ".wl[1316].w[33:37]"  0.00093138218 0.1688851 
		0.82767993 0.0023997654 0.00010381514;
	setAttr -s 5 ".wl[1317].w[33:37]"  0.023407804 0.39400727 0.55222124 
		0.028189354 0.0021743274;
	setAttr -s 5 ".wl[1318].w[33:37]"  0.023407804 0.39400727 0.55222124 
		0.028189354 0.0021743274;
	setAttr -s 5 ".wl[1319].w";
	setAttr ".wl[1319].w[33:36]" 0.071191102266311646 0.45195695757865906 
		0.42038333415985107 0.029919525608420372;
	setAttr ".wl[1319].w[39]" 0.026549097150564194;
	setAttr -s 5 ".wl[1320].w";
	setAttr ".wl[1320].w[33:36]" 0.071191102266311646 0.45195695757865906 
		0.42038333415985107 0.029919525608420372;
	setAttr ".wl[1320].w[39]" 0.026549097150564194;
	setAttr -s 5 ".wl[1321].w[33:37]"  0.00093138218 0.1688851 
		0.82767993 0.0023997654 0.00010381514;
	setAttr -s 5 ".wl[1322].w[33:37]"  0.0060683875 0.082375556 
		0.74381185 0.16220741 0.0055368138;
	setAttr -s 5 ".wl[1323].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1324].w[33:37]"  0.0060683875 0.082375556 
		0.74381185 0.16220741 0.0055368138;
	setAttr -s 5 ".wl[1325].w[33:37]"  0.0060683875 0.082375556 
		0.74381185 0.16220741 0.0055368138;
	setAttr -s 5 ".wl[1326].w[33:37]"  0.0060683875 0.082375556 
		0.74381185 0.16220741 0.0055368138;
	setAttr -s 5 ".wl[1327].w[33:37]"  0.0044576945 0.031543445 
		0.49007353 0.44874954 0.025175864;
	setAttr -s 5 ".wl[1328].w";
	setAttr ".wl[1328].w[33]" 0.00013147930440027267;
	setAttr ".wl[1328].w[39]" 0.010525957681238651;
	setAttr ".wl[1328].w[43]" 0.43693169951438904;
	setAttr ".wl[1328].w[46]" 0.53492957353591919;
	setAttr ".wl[1328].w[48]" 0.017481280490756035;
	setAttr -s 5 ".wl[1329].w";
	setAttr ".wl[1329].w[33]" 0.0011482865083962679;
	setAttr ".wl[1329].w[39]" 0.4636496901512146;
	setAttr ".wl[1329].w[43]" 0.033425688743591309;
	setAttr ".wl[1329].w[46]" 0.49608087539672852;
	setAttr ".wl[1329].w[48]" 0.0056954566389322281;
	setAttr -s 5 ".wl[1330].w";
	setAttr ".wl[1330].w[33]" 0.00098294776398688555;
	setAttr ".wl[1330].w[39]" 0.48858726024627686;
	setAttr ".wl[1330].w[43]" 0.018244329839944839;
	setAttr ".wl[1330].w[46]" 0.4887995719909668;
	setAttr ".wl[1330].w[48]" 0.0033858560491353273;
	setAttr -s 4 ".wl[1331].w";
	setAttr ".wl[1331].w[33]" 0.00084782071644440293;
	setAttr ".wl[1331].w[39]" 0.48622551560401917;
	setAttr ".wl[1331].w[45:46]" 0.028210006654262543 0.48471659421920776;
	setAttr -s 5 ".wl[1332].w";
	setAttr ".wl[1332].w[33]" 0.00015561799227725714;
	setAttr ".wl[1332].w[39]" 0.013326367363333702;
	setAttr ".wl[1332].w[43]" 0.42329171299934387;
	setAttr ".wl[1332].w[46]" 0.53635245561599731;
	setAttr ".wl[1332].w[48]" 0.026873907074332237;
	setAttr -s 5 ".wl[1333].w";
	setAttr ".wl[1333].w[33]" 0.00015561799227725714;
	setAttr ".wl[1333].w[39]" 0.013326367363333702;
	setAttr ".wl[1333].w[43]" 0.42329171299934387;
	setAttr ".wl[1333].w[46]" 0.53635245561599731;
	setAttr ".wl[1333].w[48]" 0.026873907074332237;
	setAttr -s 5 ".wl[1334].w";
	setAttr ".wl[1334].w[33]" 4.3309573811711743e-005;
	setAttr ".wl[1334].w[39]" 0.0032270997762680054;
	setAttr ".wl[1334].w[43]" 0.49377194046974182;
	setAttr ".wl[1334].w[46]" 0.49377194046974182;
	setAttr ".wl[1334].w[48]" 0.0091856960207223892;
	setAttr -s 5 ".wl[1335].w";
	setAttr ".wl[1335].w[32]" 0.0025908271782100201;
	setAttr ".wl[1335].w[46:49]" 0.34136849641799927 0.59776777029037476 
		0.058179385960102081 9.3609342002309859e-005;
	setAttr -s 5 ".wl[1336].w";
	setAttr ".wl[1336].w[33]" 4.3309573811711743e-005;
	setAttr ".wl[1336].w[39]" 0.0032270997762680054;
	setAttr ".wl[1336].w[43]" 0.49377194046974182;
	setAttr ".wl[1336].w[46]" 0.49377194046974182;
	setAttr ".wl[1336].w[48]" 0.0091856960207223892;
	setAttr -s 5 ".wl[1337].w";
	setAttr ".wl[1337].w[33]" 0.00013147930440027267;
	setAttr ".wl[1337].w[39]" 0.010525957681238651;
	setAttr ".wl[1337].w[43]" 0.43693169951438904;
	setAttr ".wl[1337].w[46]" 0.53492957353591919;
	setAttr ".wl[1337].w[48]" 0.017481280490756035;
	setAttr -s 5 ".wl[1338].w";
	setAttr ".wl[1338].w[32]" 0.0079872589558362961;
	setAttr ".wl[1338].w[46:49]" 0.35963857173919678 0.55457788705825806 
		0.077615603804588318 0.00018063497554976493;
	setAttr -s 5 ".wl[1339].w";
	setAttr ".wl[1339].w[32]" 0.0078950012102723122;
	setAttr ".wl[1339].w[46:49]" 0.383588045835495 0.54213929176330566 
		0.066217117011547089 0.00016060065536294132;
	setAttr -s 5 ".wl[1340].w";
	setAttr ".wl[1340].w[32]" 0.0070485710166394711;
	setAttr ".wl[1340].w[46:49]" 0.39015600085258484 0.53446668386459351 
		0.068165108561515808 0.00016370831872336566;
	setAttr -s 5 ".wl[1341].w";
	setAttr ".wl[1341].w[32]" 0.0033410312607884407;
	setAttr ".wl[1341].w[46:49]" 0.36428201198577881 0.58083641529083252 
		0.051447492092847824 9.3030925199855119e-005;
	setAttr -s 5 ".wl[1342].w";
	setAttr ".wl[1342].w[32]" 0.0039894948713481426;
	setAttr ".wl[1342].w[38:41]" 0.44616988301277161 0.4991239607334137 
		0.050645817071199417 7.0784037234261632e-005;
	setAttr -s 5 ".wl[1343].w";
	setAttr ".wl[1343].w[32]" 0.002560856519266963;
	setAttr ".wl[1343].w[38:41]" 0.4220786988735199 0.52849423885345459 
		0.04681779071688652 4.8455251089762896e-005;
	setAttr -s 5 ".wl[1344].w";
	setAttr ".wl[1344].w[32]" 0.0080174915492534637;
	setAttr ".wl[1344].w[38:41]" 0.46313726902008057 0.47334235906600952 
		0.055387284606695175 0.00011554134835023433;
	setAttr -s 5 ".wl[1345].w";
	setAttr ".wl[1345].w[32]" 0.0078639183193445206;
	setAttr ".wl[1345].w[38:41]" 0.43746817111968994 0.48637178540229797 
		0.06818244606256485 0.00011361268116161227;
	setAttr -s 5 ".wl[1346].w";
	setAttr ".wl[1346].w[32]" 0.0055657485499978065;
	setAttr ".wl[1346].w[38:41]" 0.43488067388534546 0.49916401505470276 
		0.060308042913675308 8.148475899361074e-005;
	setAttr -s 5 ".wl[1347].w";
	setAttr ".wl[1347].w[32]" 0.0048772846348583698;
	setAttr ".wl[1347].w[38:41]" 0.41563627123832703 0.5066608190536499 
		0.072739206254482269 8.6393090896308422e-005;
	setAttr -s 5 ".wl[1348].w";
	setAttr ".wl[1348].w[33]" 0.00013901048805564642;
	setAttr ".wl[1348].w[39]" 0.013968968763947487;
	setAttr ".wl[1348].w[43]" 0.41760897636413574;
	setAttr ".wl[1348].w[46]" 0.54375070333480835;
	setAttr ".wl[1348].w[48]" 0.024532370269298553;
	setAttr -s 4 ".wl[1349].w";
	setAttr ".wl[1349].w[32:33]" 0.94875586032867432 0.00011804885434685275;
	setAttr ".wl[1349].w[39]" 0.015572416596114635;
	setAttr ".wl[1349].w[44]" 0.0355537049472332;
	setAttr -s 4 ".wl[1350].w";
	setAttr ".wl[1350].w[32:33]" 0.94875586032867432 0.00011804885434685275;
	setAttr ".wl[1350].w[39]" 0.015572416596114635;
	setAttr ".wl[1350].w[44]" 0.0355537049472332;
	setAttr -s 4 ".wl[1351].w";
	setAttr ".wl[1351].w[32:33]" 0.90771341323852539 0.0002882443368434906;
	setAttr ".wl[1351].w[39]" 0.038061462342739105;
	setAttr ".wl[1351].w[44]" 0.053936876356601715;
	setAttr -s 5 ".wl[1352].w";
	setAttr ".wl[1352].w[39]" 0.0078950002789497375;
	setAttr ".wl[1352].w[43]" 0.54213923215866089;
	setAttr ".wl[1352].w[46]" 0.38358801603317261;
	setAttr ".wl[1352].w[48:49]" 0.066217109560966492 0.0001606006408110261;
	setAttr -s 5 ".wl[1353].w";
	setAttr ".wl[1353].w[39]" 0.0078950002789497375;
	setAttr ".wl[1353].w[43]" 0.54213923215866089;
	setAttr ".wl[1353].w[46]" 0.38358801603317261;
	setAttr ".wl[1353].w[48:49]" 0.066217109560966492 0.0001606006408110261;
	setAttr -s 5 ".wl[1354].w";
	setAttr ".wl[1354].w[39]" 0.00061755115166306496;
	setAttr ".wl[1354].w[43]" 0.63033914566040039;
	setAttr ".wl[1354].w[46]" 0.031333345919847488;
	setAttr ".wl[1354].w[48:49]" 0.3376348614692688 7.5106901931576431e-005;
	setAttr -s 5 ".wl[1355].w";
	setAttr ".wl[1355].w[32]" 0.00061755115166306496;
	setAttr ".wl[1355].w[46:49]" 0.031333345919847488 0.63033914566040039 
		0.3376348614692688 7.5106901931576431e-005;
	setAttr -s 5 ".wl[1356].w";
	setAttr ".wl[1356].w[39]" 0.00055206770775839686;
	setAttr ".wl[1356].w[43]" 0.58243221044540405;
	setAttr ".wl[1356].w[46]" 0.021850619465112686;
	setAttr ".wl[1356].w[48:49]" 0.39509248733520508 7.2640141297597438e-005;
	setAttr -s 5 ".wl[1357].w";
	setAttr ".wl[1357].w[39]" 0.0011779395863413811;
	setAttr ".wl[1357].w[43]" 0.55503618717193604;
	setAttr ".wl[1357].w[46]" 0.033594828099012375;
	setAttr ".wl[1357].w[48:49]" 0.41004925966262817 0.00014173475210554898;
	setAttr -s 5 ".wl[1358].w";
	setAttr ".wl[1358].w[32]" 0.0018816739320755005;
	setAttr ".wl[1358].w[46:49]" 0.049316581338644028 0.54708206653594971 
		0.40150225162506104 0.00021746865240857005;
	setAttr -s 5 ".wl[1359].w";
	setAttr ".wl[1359].w[32]" 0.0011779395863413811;
	setAttr ".wl[1359].w[46:49]" 0.033594828099012375 0.55503618717193604 
		0.41004925966262817 0.00014173475210554898;
	setAttr -s 5 ".wl[1360].w";
	setAttr ".wl[1360].w[32]" 0.0012726879213005304;
	setAttr ".wl[1360].w[46:49]" 0.039147663861513138 0.54959726333618164 
		0.40982598066329956 0.00015634407463949174;
	setAttr -s 5 ".wl[1361].w";
	setAttr ".wl[1361].w[32]" 0.00055206770775839686;
	setAttr ".wl[1361].w[46:49]" 0.021850619465112686 0.58243221044540405 
		0.39509248733520508 7.2640141297597438e-005;
	setAttr -s 5 ".wl[1362].w";
	setAttr ".wl[1362].w[32]" 0.0010153445182368159;
	setAttr ".wl[1362].w[38:41]" 0.04222845658659935 0.50139576196670532 
		0.45525553822517395 0.00010478951298864558;
	setAttr -s 5 ".wl[1363].w";
	setAttr ".wl[1363].w[32]" 0.00043564740917645395;
	setAttr ".wl[1363].w[38:41]" 0.019165936857461929 0.49825909733772278 
		0.48209100961685181 4.8390091251349077e-005;
	setAttr -s 5 ".wl[1364].w";
	setAttr ".wl[1364].w[32]" 0.0023929874878376722;
	setAttr ".wl[1364].w[38:41]" 0.083606146275997162 0.49347364902496338 
		0.42030695080757141 0.00022025041107553989;
	setAttr -s 5 ".wl[1365].w";
	setAttr ".wl[1365].w[32]" 0.0016229901229962707;
	setAttr ".wl[1365].w[38:41]" 0.051458846777677536 0.48963367938995361 
		0.45712617039680481 0.00015834993973840028;
	setAttr -s 5 ".wl[1366].w";
	setAttr ".wl[1366].w[32]" 0.00085879117250442505;
	setAttr ".wl[1366].w[38:41]" 0.032847613096237183 0.50260871648788452 
		0.46360614895820618 7.873235153965652e-005;
	setAttr -s 5 ".wl[1367].w";
	setAttr ".wl[1367].w[32]" 0.00051891244947910309;
	setAttr ".wl[1367].w[38:41]" 0.020271971821784973 0.49376708269119263 
		0.48538783192634583 5.4257405281532556e-005;
	setAttr -s 5 ".wl[1368].w";
	setAttr ".wl[1368].w[39]" 0.0070485705509781837;
	setAttr ".wl[1368].w[43]" 0.53446662425994873;
	setAttr ".wl[1368].w[46]" 0.39015597105026245;
	setAttr ".wl[1368].w[48:49]" 0.068165101110935211 0.00016370830417145044;
	setAttr -s 4 ".wl[1369].w";
	setAttr ".wl[1369].w[32:33]" 0.95428735017776489 8.0024765338748693e-005;
	setAttr ".wl[1369].w[39]" 0.010375326499342918;
	setAttr ".wl[1369].w[44]" 0.035257317125797272;
	setAttr -s 4 ".wl[1370].w";
	setAttr ".wl[1370].w[32:33]" 0.90771341323852539 0.0002882443368434906;
	setAttr ".wl[1370].w[39]" 0.038061462342739105;
	setAttr ".wl[1370].w[44]" 0.053936876356601715;
	setAttr -s 5 ".wl[1371].w";
	setAttr ".wl[1371].w[39]" 0.0078950002789497375;
	setAttr ".wl[1371].w[43]" 0.54213923215866089;
	setAttr ".wl[1371].w[46]" 0.38358801603317261;
	setAttr ".wl[1371].w[48:49]" 0.066217109560966492 0.0001606006408110261;
	setAttr -s 5 ".wl[1372].w";
	setAttr ".wl[1372].w[39]" 0.00055206770775839686;
	setAttr ".wl[1372].w[43]" 0.58243221044540405;
	setAttr ".wl[1372].w[46]" 0.021850619465112686;
	setAttr ".wl[1372].w[48:49]" 0.39509248733520508 7.2640141297597438e-005;
	setAttr -s 5 ".wl[1373].w";
	setAttr ".wl[1373].w[39]" 0.00033765553962439299;
	setAttr ".wl[1373].w[43]" 0.4866352379322052;
	setAttr ".wl[1373].w[46]" 0.0080402670428156853;
	setAttr ".wl[1373].w[48:49]" 0.50492000579833984 6.6846827394329011e-005;
	setAttr -s 5 ".wl[1374].w";
	setAttr ".wl[1374].w[32]" 0.00033765553962439299;
	setAttr ".wl[1374].w[46:49]" 0.0080402670428156853 0.4866352379322052 
		0.50492000579833984 6.6846827394329011e-005;
	setAttr -s 5 ".wl[1375].w";
	setAttr ".wl[1375].w[32]" 0.00032299495069310069;
	setAttr ".wl[1375].w[46:49]" 0.0059793423861265182 0.41863784193992615 
		0.5749320387840271 0.0001278583804378286;
	setAttr -s 5 ".wl[1376].w";
	setAttr ".wl[1376].w[32]" 0.00050420005572959781;
	setAttr ".wl[1376].w[38:41]" 0.0092411069199442863 0.27684491872787476 
		0.71322447061538696 0.00018538317817728966;
	setAttr -s 5 ".wl[1377].w";
	setAttr ".wl[1377].w[32]" 0.00080178701318800449;
	setAttr ".wl[1377].w[38:41]" 0.024129210039973259 0.45224332809448242 
		0.52270752191543579 0.00011818870552815497;
	setAttr -s 5 ".wl[1378].w";
	setAttr ".wl[1378].w[32]" 0.00079721485963091254;
	setAttr ".wl[1378].w[38:41]" 0.018664637580513954 0.39764180779457092 
		0.5827564001083374 0.00013997172936797142;
	setAttr -s 5 ".wl[1379].w";
	setAttr ".wl[1379].w[32]" 0.00050533015746623278;
	setAttr ".wl[1379].w[38:41]" 0.009123372845351696 0.2975437343120575 
		0.69266164302825928 0.00016604083066340536;
	setAttr -s 4 ".wl[1380].w";
	setAttr ".wl[1380].w[32]" 0.00041847361717373133;
	setAttr ".wl[1380].w[39]" 3.30757575284224e-005;
	setAttr ".wl[1380].w[41]" 0.0042167897336184978;
	setAttr ".wl[1380].w[44]" 0.99533164501190186;
	setAttr -s 4 ".wl[1381].w";
	setAttr ".wl[1381].w[32]" 0.020524125546216965;
	setAttr ".wl[1381].w[39]" 0.00039070550701580942;
	setAttr ".wl[1381].w[41]" 0.0012361180270090699;
	setAttr ".wl[1381].w[44]" 0.97784906625747681;
	setAttr -s 4 ".wl[1382].w";
	setAttr ".wl[1382].w[32]" 0.020524125546216965;
	setAttr ".wl[1382].w[39]" 0.00039070550701580942;
	setAttr ".wl[1382].w[41]" 0.0012361180270090699;
	setAttr ".wl[1382].w[44]" 0.97784906625747681;
	setAttr -s 4 ".wl[1383].w";
	setAttr ".wl[1383].w[32]" 0.020524125546216965;
	setAttr ".wl[1383].w[39]" 0.00039070550701580942;
	setAttr ".wl[1383].w[41]" 0.0012361180270090699;
	setAttr ".wl[1383].w[44]" 0.97784906625747681;
	setAttr -s 4 ".wl[1384].w";
	setAttr ".wl[1384].w[32]" 0.00041847361717373133;
	setAttr ".wl[1384].w[39]" 3.30757575284224e-005;
	setAttr ".wl[1384].w[41]" 0.0042167897336184978;
	setAttr ".wl[1384].w[44]" 0.99533164501190186;
	setAttr -s 4 ".wl[1385].w";
	setAttr ".wl[1385].w[32]" 0.00041847361717373133;
	setAttr ".wl[1385].w[39]" 3.30757575284224e-005;
	setAttr ".wl[1385].w[41]" 0.0042167897336184978;
	setAttr ".wl[1385].w[44]" 0.99533164501190186;
	setAttr -s 4 ".wl[1386].w";
	setAttr ".wl[1386].w[32]" 0.00041847361717373133;
	setAttr ".wl[1386].w[39]" 3.30757575284224e-005;
	setAttr ".wl[1386].w[41]" 0.0042167897336184978;
	setAttr ".wl[1386].w[44]" 0.99533164501190186;
	setAttr -s 4 ".wl[1387].w";
	setAttr ".wl[1387].w[32]" 0.00041847361717373133;
	setAttr ".wl[1387].w[39]" 3.30757575284224e-005;
	setAttr ".wl[1387].w[41]" 0.0042167897336184978;
	setAttr ".wl[1387].w[44]" 0.99533164501190186;
	setAttr -s 4 ".wl[1388].w";
	setAttr ".wl[1388].w[32]" 1.3253647921374068e-005;
	setAttr ".wl[1388].w[39]" 1.0267343668601825e-006;
	setAttr ".wl[1388].w[41]" 0.00011968712351517752;
	setAttr ".wl[1388].w[44]" 0.99986600875854492;
	setAttr -s 4 ".wl[1389].w";
	setAttr ".wl[1389].w[32]" 1.3253647921374068e-005;
	setAttr ".wl[1389].w[39]" 1.0267343668601825e-006;
	setAttr ".wl[1389].w[41]" 0.00011968712351517752;
	setAttr ".wl[1389].w[44]" 0.99986600875854492;
	setAttr -s 4 ".wl[1390].w";
	setAttr ".wl[1390].w[32]" 1.3253647921374068e-005;
	setAttr ".wl[1390].w[39]" 1.0267343668601825e-006;
	setAttr ".wl[1390].w[41]" 0.00011968712351517752;
	setAttr ".wl[1390].w[44]" 0.99986600875854492;
	setAttr -s 4 ".wl[1391].w";
	setAttr ".wl[1391].w[32]" 1.3253647921374068e-005;
	setAttr ".wl[1391].w[39]" 1.0267343668601825e-006;
	setAttr ".wl[1391].w[41]" 0.00011968712351517752;
	setAttr ".wl[1391].w[44]" 0.99986600875854492;
	setAttr -s 4 ".wl[1392].w";
	setAttr ".wl[1392].w[32]" 0.52350246906280518;
	setAttr ".wl[1392].w[39]" 0.0010601114481687546;
	setAttr ".wl[1392].w[41]" 0.00010940972424577922;
	setAttr ".wl[1392].w[44]" 0.47532793879508972;
	setAttr -s 4 ".wl[1393].w";
	setAttr ".wl[1393].w[32]" 0.91447436809539795;
	setAttr ".wl[1393].w[39]" 0.0044311508536338806;
	setAttr ".wl[1393].w[41]" 8.3844024629797786e-005;
	setAttr ".wl[1393].w[44]" 0.081010662019252777;
	setAttr -s 4 ".wl[1394].w";
	setAttr ".wl[1394].w[32]" 0.53849512338638306;
	setAttr ".wl[1394].w[39]" 0.0026113090571016073;
	setAttr ".wl[1394].w[41]" 0.00024034469970501959;
	setAttr ".wl[1394].w[44]" 0.45865318179130554;
	setAttr -s 4 ".wl[1395].w";
	setAttr ".wl[1395].w[32]" 0.52350246906280518;
	setAttr ".wl[1395].w[39]" 0.0010601114481687546;
	setAttr ".wl[1395].w[41]" 0.00010940972424577922;
	setAttr ".wl[1395].w[44]" 0.47532793879508972;
	setAttr -s 4 ".wl[1396].w";
	setAttr ".wl[1396].w[32]" 0.300283282995224;
	setAttr ".wl[1396].w[39]" 0.00050998287042602897;
	setAttr ".wl[1396].w[41]" 0.0001675696112215519;
	setAttr ".wl[1396].w[44]" 0.69903916120529175;
	setAttr -s 4 ".wl[1397].w";
	setAttr ".wl[1397].w[32]" 0.300283282995224;
	setAttr ".wl[1397].w[39]" 0.00050998287042602897;
	setAttr ".wl[1397].w[41]" 0.0001675696112215519;
	setAttr ".wl[1397].w[44]" 0.69903916120529175;
	setAttr -s 4 ".wl[1398].w";
	setAttr ".wl[1398].w[32]" 0.300283282995224;
	setAttr ".wl[1398].w[39]" 0.00050998287042602897;
	setAttr ".wl[1398].w[41]" 0.0001675696112215519;
	setAttr ".wl[1398].w[44]" 0.69903916120529175;
	setAttr -s 4 ".wl[1399].w";
	setAttr ".wl[1399].w[32]" 0.300283282995224;
	setAttr ".wl[1399].w[39]" 0.00050998287042602897;
	setAttr ".wl[1399].w[41]" 0.0001675696112215519;
	setAttr ".wl[1399].w[44]" 0.69903916120529175;
	setAttr -s 5 ".wl[1400].w";
	setAttr ".wl[1400].w[39]" 0.00032299492158927023;
	setAttr ".wl[1400].w[43]" 0.41863781213760376;
	setAttr ".wl[1400].w[46]" 0.0059793419204652309;
	setAttr ".wl[1400].w[48:49]" 0.57493197917938232 0.00012785836588591337;
	setAttr -s 5 ".wl[1401].w";
	setAttr ".wl[1401].w[39]" 0.00032299492158927023;
	setAttr ".wl[1401].w[43]" 0.41863781213760376;
	setAttr ".wl[1401].w[46]" 0.0059793419204652309;
	setAttr ".wl[1401].w[48:49]" 0.57493197917938232 0.00012785836588591337;
	setAttr -s 5 ".wl[1402].w";
	setAttr ".wl[1402].w[39]" 0.00033765553962439299;
	setAttr ".wl[1402].w[43]" 0.4866352379322052;
	setAttr ".wl[1402].w[46]" 0.0080402670428156853;
	setAttr ".wl[1402].w[48:49]" 0.50492000579833984 6.6846827394329011e-005;
	setAttr -s 5 ".wl[1403].w";
	setAttr ".wl[1403].w[39]" 0.00032299492158927023;
	setAttr ".wl[1403].w[43]" 0.41863781213760376;
	setAttr ".wl[1403].w[46]" 0.0059793419204652309;
	setAttr ".wl[1403].w[48:49]" 0.57493197917938232 0.00012785836588591337;
	setAttr -s 4 ".wl[1404].w";
	setAttr ".wl[1404].w[32]" 0.013098477385938168;
	setAttr ".wl[1404].w[39]" 0.00023343916109297425;
	setAttr ".wl[1404].w[41]" 0.00074540427885949612;
	setAttr ".wl[1404].w[44]" 0.98592269420623779;
	setAttr -s 4 ".wl[1405].w";
	setAttr ".wl[1405].w[32]" 0.013098477385938168;
	setAttr ".wl[1405].w[39]" 0.00023343916109297425;
	setAttr ".wl[1405].w[41]" 0.00074540427885949612;
	setAttr ".wl[1405].w[44]" 0.98592269420623779;
	setAttr -s 4 ".wl[1406].w";
	setAttr ".wl[1406].w[32]" 0.013098477385938168;
	setAttr ".wl[1406].w[39]" 0.00023343916109297425;
	setAttr ".wl[1406].w[41]" 0.00074540427885949612;
	setAttr ".wl[1406].w[44]" 0.98592269420623779;
	setAttr -s 4 ".wl[1407].w";
	setAttr ".wl[1407].w[32]" 0.00020531566406134516;
	setAttr ".wl[1407].w[39]" 1.5858209735597484e-005;
	setAttr ".wl[1407].w[41]" 0.001967620337381959;
	setAttr ".wl[1407].w[44]" 0.99781125783920288;
	setAttr -s 5 ".wl[1408].w";
	setAttr ".wl[1408].w[32]" 1.5857192920520902e-005;
	setAttr ".wl[1408].w[38:41]" 6.411782669601962e-005 0.00020530249457806349 
		0.99774724245071411 0.0019674941431730986;
	setAttr -s 5 ".wl[1409].w";
	setAttr ".wl[1409].w[32]" 1.8520702838031866e-007;
	setAttr ".wl[1409].w[38:41]" 7.5281246836311766e-007 2.4260637019324349e-006 
		0.99997591972351074 2.0694737031590194e-005;
	setAttr -s 5 ".wl[1410].w";
	setAttr ".wl[1410].w[32]" 1.0267301604471868e-006;
	setAttr ".wl[1410].w[38:41]" 4.1267589949711692e-006 1.3253594261186663e-005 
		0.9998619556427002 0.00011968663602601737;
	setAttr -s 5 ".wl[1411].w";
	setAttr ".wl[1411].w[32]" 3.3071402867790312e-005;
	setAttr ".wl[1411].w[38:41]" 0.00013167598808649927 0.00041841849451884627 
		0.99520057439804077 0.0042162341997027397;
	setAttr -s 5 ".wl[1412].w";
	setAttr ".wl[1412].w[32]" 0.00023302328190766275;
	setAttr ".wl[1412].w[38:41]" 0.0017815046012401581 0.013075142167508602 
		0.98416626453399658 0.00074407632928341627;
	setAttr -s 5 ".wl[1413].w";
	setAttr ".wl[1413].w[32]" 6.2331200751941651e-006;
	setAttr ".wl[1413].w[38:41]" 4.6279936213977635e-005 0.00032596261007711291 
		0.99959981441497803 2.1617039237753488e-005;
	setAttr -s 5 ".wl[1414].w";
	setAttr ".wl[1414].w[32]" 1.7050349924829789e-005;
	setAttr ".wl[1414].w[38:41]" 0.00012309686280786991 0.00086128414841368794 
		0.99893957376480103 5.8991612604586408e-005;
	setAttr -s 5 ".wl[1415].w";
	setAttr ".wl[1415].w[32]" 0.00038958503864705563;
	setAttr ".wl[1415].w[38:41]" 0.0028677685186266899 0.020465265959501266 
		0.97504478693008423 0.0012325730640441179;
	setAttr -s 5 ".wl[1416].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1417].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1418].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1419].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1420].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1421].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1422].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1423].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1424].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1425].w[33:37]"  0.004457694 0.031543441 
		0.4900735 0.44874951 0.025175862;
	setAttr -s 5 ".wl[1426].w[33:37]"  0.0060683875 0.082375556 
		0.74381185 0.16220741 0.0055368138;
	setAttr -s 5 ".wl[1427].w[33:37]"  0.0060683875 0.082375556 
		0.74381185 0.16220741 0.0055368138;
	setAttr -s 5 ".wl[1428].w";
	setAttr ".wl[1428].w[32:33]" 0.56603968143463135 0.031542908400297165;
	setAttr ".wl[1428].w[38]" 0.16856770217418671;
	setAttr ".wl[1428].w[42]" 0.11406192183494568;
	setAttr ".wl[1428].w[46]" 0.11978784948587418;
	setAttr -s 5 ".wl[1429].w";
	setAttr ".wl[1429].w[32:33]" 0.65022289752960205 0.0047810529358685017;
	setAttr ".wl[1429].w[38]" 0.32451975345611572;
	setAttr ".wl[1429].w[42]" 0.0058278916403651237;
	setAttr ".wl[1429].w[46]" 0.01464846171438694;
	setAttr -s 5 ".wl[1430].w";
	setAttr ".wl[1430].w[32:33]" 0.83531039953231812 0.053949836641550064;
	setAttr ".wl[1430].w[38]" 0.078888975083827972;
	setAttr ".wl[1430].w[42]" 0.012186774984002113;
	setAttr ".wl[1430].w[46]" 0.019664039835333824;
	setAttr -s 5 ".wl[1431].w[33:37]"  0.0031248585 0.48542684 
		0.50927174 0.0020424242 0.00013412301;
	setAttr -s 5 ".wl[1432].w[32:36]"  0.0028330991 0.045129608 
		0.70859784 0.24145317 0.0019863888;
	setAttr -s 5 ".wl[1433].w[32:36]"  0.015573734 0.40732422 0.5433678 
		0.032546818 0.0011875113;
	setAttr -s 5 ".wl[1434].w[32:36]"  0.0053512482 0.048315335 
		0.60906923 0.33302391 0.0042402288;
	setAttr -s 71 ".pm";
	setAttr ".pm[0]" -type "matrix" 1.3041010416881519e-016 8.7855228071623071e-016 1 0
		 0.98916193101477901 -0.14682872413500592 1.2440437568735404e-017 0 0.14682872413500592 0.98916193101477901 -8.3994402619256823e-016 0
		 -68.696503581967391 38.128650156122788 -2.4121634977109344e-014 1;
	setAttr ".pm[1]" -type "matrix" -8.8691792104163166e-016 -4.7302289122219698e-017 1 0
		 -0.053257642916150025 0.99858080467782684 1.2440437568735401e-017 0 -0.99858080467782684 -0.053257642916150025 -8.3994402619256832e-016 0
		 -32.584353686883446 -73.064725741625551 -2.8832264932661966e-014 1;
	setAttr ".pm[2]" -type "matrix" -8.8817841970012523e-016 -2.2803010541544873e-031 1 0
		 -2.5673907444456745e-016 1 1.2440437568735392e-017 0 -1 -2.5673907444456745e-016 -8.3994402619256813e-016 0
		 -61.336655639173578 -69.897277927791365 -2.8832264932661954e-014 1;
	setAttr ".pm[3]" -type "matrix" -8.8817841970012523e-016 -2.2803010541544873e-031 1 0
		 -2.5673907444456745e-016 1 1.2440437568735392e-017 0 -1 -2.5673907444456745e-016 -8.3994402619256813e-016 0
		 -78.107564536318733 -69.897277927791365 -2.8832264932661979e-014 1;
	setAttr ".pm[4]" -type "matrix" -8.8814484207995197e-016 7.722998626783105e-018 1 0
		 0.008695323434440811 0.99996219496057492 1.2440437568735395e-017 0 -0.99996219496057492 0.008695323434440811 -8.3994402619256832e-016 0
		 -95.482665987804268 -69.069636444973625 -2.8832264932661979e-014 1;
	setAttr ".pm[5]" -type "matrix" -8.8815088739429588e-016 1.0224088283961524e-012 -1 0
		 0.0078737716644030845 -0.99996900137943101 -1.0223965686676745e-012 0 -0.99996900137943112 -0.0078737716644030828 -7.2103247000268086e-015 0
		 -114.52219236822241 69.163748918329006 7.0742943447825805e-011 1;
	setAttr ".pm[6]" -type "matrix" 2.9079999272684042e-016 1.4303089004620907e-013 1 0
		 0.98916193101477878 -0.14682872413500703 2.0725835252603879e-014 0 0.14682872413500714 0.98916193101477889 -1.414751747912737e-013 0
		 -49.637208626595296 143.91011106913976 -2.0478029675142706e-011 1;
	setAttr ".pm[7]" -type "matrix" 0.020791374890708623 -0.040159256484371138 0.9989769531119207 0
		 -0.91627889750284264 -0.40052985967518107 0.0029687538724927397 0 0.40000087590045313 -0.9154032257028607 -0.04512464572346301 0
		 75.07792283124472 7.6585516065065686 -10.127550312850344 1;
	setAttr ".pm[8]" -type "matrix" -0.017556508113839613 -0.041675152277326585 0.99897695203919001 0
		 -0.89411583151735974 0.44782593343266774 0.0029686992404996228 0 -0.44749150701758489 -0.89314898814689481 -0.045124673065952824 0
		 31.805893559701751 -31.261320946747883 -17.497817311108296 1;
	setAttr ".pm[9]" -type "matrix" -0.016260721892252025 0.042197609150651579 -0.9989769520391909 0
		 -0.90752311699740862 -0.41999164151221857 -0.0029686992404928596 0 -0.41968724193004853 0.90654640413044596 0.045124673065938231 0
		 -4.3746916487129601 27.910107115000827 14.559437269626692 1;
	setAttr ".pm[10]" -type "matrix" 0.043952254419547206 0.010641833767152621 -0.99897695203919068 0
		 -0.29855358850164015 0.9543882551758549 -0.0029686992404928583 0 0.95338027781375501 0.29837863488604432 0.045124673065938217 0
		 27.648863649733237 3.1371131920951205 14.770479599452489 1;
	setAttr ".pm[11]" -type "matrix" 0.072261287536527802 -0.12021071299833866 -0.99011498867757497 0
		 0.05509242650086707 0.9916756824310009 -0.11637940289095468 0 0.99586300808183958 -0.046138111745493586 0.078282461501606768 0
		 12.086562077732951 0.97929382262032083 15.838965667086676 1;
	setAttr ".pm[12]" -type "matrix" 0.99897695203919468 -0.0031095635587035674 0.045115184904370789 0
		 0.0029686992405732224 0.99999050853507909 0.0031889911528941248 0 -0.045124673065853903 -0.003051795246834335 0.99897670164347274 0
		 -15.452368415308021 -0.9890443150884467 -9.022092011649864 1;
	setAttr ".pm[13]" -type "matrix" 0.043952254419547206 0.010641833767152621 -0.99897695203919068 0
		 -0.29855358850164015 0.9543882551758549 -0.0029686992404928583 0 0.95338027781375501 0.29837863488604432 0.045124673065938217 0
		 30.829886574699344 8.4973098726577607 14.770479599452454 1;
	setAttr ".pm[14]" -type "matrix" 0.017072284080783248 -0.032998379218678653 0.99930958370527279 0
		 0.91651219745520407 0.39999924092730665 -0.0024493210102917926 0 -0.399642251309966 0.91592123800385739 0.037072317723380002 0
		 -75.119286173000162 -7.5447633467315534 9.9041107909353254 1;
	setAttr ".pm[15]" -type "matrix" -0.014433429351028655 -0.034234953365873781 0.9993095837052729 0
		 0.89385741829878662 -0.44834464040380423 -0.0024493210102917926 0 0.44811894834898119 0.89320493247027022 0.037072317723380009 0
		 -31.744878637887652 31.365883682373656 17.386690650622764 1;
	setAttr ".pm[16]" -type "matrix" -0.013368972418327464 0.03466448458109074 -0.99930958370527256 0
		 0.90728085073585008 0.42051808369512478 0.0024493210102917388 0 0.42031265560830966 -0.90662170434757761 -0.037072317723379877 0
		 4.4324113939484739 -28.016460874567112 -14.336030790935309 1;
	setAttr ".pm[17]" -type "matrix" 0.036107334335999462 0.0087530749992807376 -0.99930958370527279 0
		 0.29910703918514203 -0.9542164219591307 0.0024493210102917392 0 -0.95353617630221332 -0.29898896926403584 -0.037072317723379898 0
		 -27.76182269340395 -3.1805332860444069 -14.547030790935311 1;
	setAttr ".pm[18]" -type "matrix" 0.064264276598413148 -0.11929901472561467 -0.99077638639542698 0
		 -0.054499841828732201 -0.99176652606745397 0.11588323870490194 0 -0.99644361104576595 0.046550003840941781 -0.070236935785115875 0
		 -12.213634001154468 -0.95502080384927823 -15.620310055325913 1;
	setAttr ".pm[19]" -type "matrix" 0.99930958370527601 -0.002544369288064435 0.037065915606034644 0
		 -0.0024493210103650616 -0.99999359568095336 -0.0026094872418966938 0 0.037072317723281345 0.0025168992835216445 -0.99930941578503119 0
		 15.630869426946726 1.1555448678390567 8.5686527628339384 1;
	setAttr ".pm[20]" -type "matrix" 0.036107334335999462 0.0087530749992807376 -0.99930958370527279 0
		 0.29910703918514203 -0.9542164219591307 0.0024493210102917392 0 -0.95353617630221332 -0.29898896926403584 -0.037072317723379898 0
		 -30.942828850221233 -8.5407193410606457 -14.547030790935313 1;
	setAttr ".pm[21]" -type "matrix" 1.7866538610312928e-016 8.7002274971958725e-016 1 0
		 0.97955853286024686 -0.2011593415695147 1.244043756873538e-017 0 0.2011593415695147 0.97955853286024686 -8.3994402619256813e-016 0
		 -79.670291166758133 45.466621150279892 -2.741767164129065e-014 1;
	setAttr ".pm[22]" -type "matrix" 1.7866538610312926e-016 8.7002274971958705e-016 1 0
		 0.97955853286024663 -0.20115934156951468 1.2440437568735423e-017 0 0.20115934156951468 0.97955853286024663 -8.3994402619256813e-016 0
		 -88.546646614670621 45.985981588451629 -2.4069136988111891e-014 1;
	setAttr ".pm[23]" -type "matrix" 1.7866538610312926e-016 8.7002274971958705e-016 1 0
		 0.97955853286024663 -0.20115934156951468 1.2440437568735423e-017 0 0.20115934156951468 0.97955853286024663 -8.3994402619256813e-016 0
		 -100.79619788505148 45.22442256603393 -2.2831639511212623e-014 1;
	setAttr ".pm[24]" -type "matrix" 8.1907314870879783e-016 3.4348228816820763e-016 1 0
		 0.3867266762506763 -0.9221943818285302 1.2440437568735457e-017 0 0.9221943818285302 0.3867266762506763 -8.3994402619256823e-016 0
		 -29.334215690684541 115.58486567564223 -2.3046780795656913e-014 1;
	setAttr ".pm[25]" -type "matrix" 1.9438776032567582e-016 -9.8910606683421257e-016 -1 0
		 0.97575601053736416 0.21886116124202476 -3.9242314434928167e-017 0 0.21886116124202476 -0.97575601053736416 9.594357272210113e-016 0
		 -117.0503206301762 -35.856739489996194 3.0017571110427876e-014 1;
	setAttr ".pm[26]" -type "matrix" 5.8838568815397118e-016 9.4094685688401422e-016 1 0
		 0.79616219412310274 -0.60508326753355746 1.1334119583624836e-016 0 0.60508326753355746 0.79616219412310252 -1.056934255380643e-015 0
		 -104.0120656036332 87.055789756585156 -4.1458043359124598e-014 1;
	setAttr ".pm[27]" -type "matrix" 1.2893990969098518e-016 -1.2247097928748661e-015 -1 0
		 0.97854978498674949 0.20601048104983982 -1.3856937024101223e-016 0 0.20601048104983993 -0.97854978498674927 1.1767680838032727e-015 0
		 -150.75896992057639 -28.272207590911428 4.8078272567828091e-014 1;
	setAttr ".pm[28]" -type "matrix" 5.8838568815397118e-016 9.4094685688401422e-016 1 0
		 0.79616219412310274 -0.60508326753355746 1.1334119583624836e-016 0 0.60508326753355746 0.79616219412310252 -1.056934255380643e-015 0
		 -113.85315420011079 64.502193376156953 -4.5743577009722965e-014 1;
	setAttr ".pm[29]" -type "matrix" 0.78535554762090332 -0.61904496106589146 -1.843853954289153e-016 0
		 -0.61904496106589157 -0.78535554762090332 -2.7875789267208606e-016 0 6.9680576946185538e-017 3.6917227900553239e-016 -1.0000000000000002 0
		 62.00188895109217 95.703326915469418 -15.04813733590559 1;
	setAttr ".pm[30]" -type "matrix" 0.97730208053655232 0.20872663614034284 0.036246858408184576 0
		 0.06531345550167382 -0.13409688776139617 -0.9888135199435425 0 -0.20153112888424191 0.96873691787721417 -0.1446858252642555 0
		 -22.734140416560134 25.074821561554963 110.43398592261093 1;
	setAttr ".pm[31]" -type "matrix" 0.93092977809384381 -0.36292515846416867 0.040682645094741066 0
		 -0.014589547174636876 -0.1482687230698371 -0.98883948691002377 0 0.36490669132174824 0.91994658274978003 -0.14332268318593672 0
		 -30.81137874419364 43.022797142322489 106.83857300142644 1;
	setAttr ".pm[32]" -type "matrix" 0.99886609896977085 -0.040682645094741093 -0.024727286891354502 0
		 0.03669975047414456 0.98883948691002399 -0.14439389683313028 0 0.030325643341032837 0.14332268318593736 0.98921128372069056 0
		 -70.480691444860994 -105.77113240799613 24.8816653056574 1;
	setAttr ".pm[33]" -type "matrix" 0.010939527841181273 -0.99911223049200426 0.04068264509473777 0
		 -0.14299202662567664 -0.041830006562306815 -0.98883948691002421 0 0.98966338067652793 0.0050001432269219642 -0.14332268318593733 0
		 19.626101893170581 70.972678183417088 105.05481233876372 1;
	setAttr ".pm[34]" -type "matrix" 0.84098534956185611 0.53952624052071663 -0.040682645094738082 0
		 -0.043566786657306844 0.14247246831538268 0.9888394869100241 0 0.53930100771524547 -0.82982710944009563 0.1433226831859378 0
		 -50.403329086183923 -53.195679272816527 -103.99225361733659 1;
	setAttr ".pm[35]" -type "matrix" 0.88235462020893407 0.46882325729857227 -0.040682645094738089 0
		 -0.031749659044010121 0.14556245490548075 0.9888394869100241 0 0.46951281489064473 -0.87121542980932509 0.14332268318593783 0
		 -57.406490725563089 -47.727103955063207 -101.79523697808538 1;
	setAttr ".pm[36]" -type "matrix" 0.99537843985837382 0.086986687793047676 -0.040682645094738089 0
		 0.027621236774677056 0.14640196858839785 0.9888394869100241 0 0.091971891054532282 -0.98539321072363661 0.1433226831859378 0
		 -75.229135840431852 -19.845807468219565 -99.614916264451082 1;
	setAttr ".pm[37]" -type "matrix" 0.99886609896977097 -0.040682645094738033 -0.02472728689135404 0
		 0.036699750474141736 0.98883948691002443 -0.14439389683312812 0 0.030325643341031622 0.14332268318593541 0.98921128372069111 0
		 -80.735591421891115 -98.867405386985752 13.981198079704345 1;
	setAttr ".pm[38]" -type "matrix" 0.93286243190765827 -0.35792821280729581 0.040682645094741045 0
		 -0.013794307363131367 -0.14834482199218332 -0.98883948691002388 0 0.35996861004773872 0.92189001961442374 -0.14332268318593722 0
		 -68.809931818769954 51.18088844469716 105.04616905615816 1;
	setAttr ".pm[39]" -type "matrix" 0.88235462020893407 -0.46882325729857188 0.040682645094741045 0
		 -0.031749659044007318 -0.14556245490548164 -0.98883948691002377 0 0.46951281489064489 0.87121542980932476 -0.14332268318593719 0
		 -66.758926086875448 60.017804568795512 104.74853257583197 1;
	setAttr ".pm[40]" -type "matrix" 0.84654091946234589 -0.53076679819289896 0.040682645094741052 0
		 -0.042085415262953452 -0.14291706318584169 -0.98883948691002388 0 0.53065741255351462 0.83538094243667815 -0.14332268318593722 0
		 -64.992272238378476 65.23051511530528 104.0704926548072 1;
	setAttr ".pm[41]" -type "matrix" 0.99886609896977097 -0.040682645094741066 -0.024727286891354387 0
		 0.036699750474144574 0.98883948691002399 -0.14439389683313039 0 0.030325643341032899 0.14332268318593747 0.98921128372069056 0
		 -99.341467186251677 -99.282930965344249 16.605841202428032 1;
	setAttr ".pm[42]" -type "matrix" 0.8503400977084391 -0.52465859434235673 0.040682645094740962 0
		 -0.041055430748925134 -0.14321634241084807 -0.98883948691002399 0 0.52462955486249796 0.83917962239866217 -0.14332268318593713 0
		 -59.543350780140187 54.927219922757928 107.89883397020165 1;
	setAttr ".pm[43]" -type "matrix" 0.91824040640593874 0.3939282655910239 -0.040682645094740573 0
		 -0.019551684129712456 0.14769631266627054 0.98883948691002421 0 0.39554050069638735 -0.90719695810404677 0.14332268318593624 0
		 -71.085397281180292 -45.361338596220804 -107.91822076269138 1;
	setAttr ".pm[44]" -type "matrix" 0.91824040640593874 0.3939282655910239 -0.040682645094740573 0
		 -0.019551684129712456 0.14769631266627054 0.98883948691002421 0 0.39554050069638735 -0.90719695810404677 0.14332268318593624 0
		 -74.126169111320579 -45.372273210251365 -107.66540305151504 1;
	setAttr ".pm[45]" -type "matrix" 0.99886609896977097 -0.040682645094740587 -0.024727286891354668 0
		 0.036699750474144165 0.9888394869100241 -0.14439389683312934 0 0.030325643341032854 0.14332268318593644 0.98921128372069078 0
		 -95.837738778288198 -102.68503190542982 10.289797633318427 1;
	setAttr ".pm[46]" -type "matrix" 0.87448602647364482 -0.48334160993073111 0.040682645094741038 0
		 -0.034150985236284702 -0.14501785867579267 -0.98883948691002399 0 0.48384697964307571 0.86333696131618098 -0.14332268318593727 0
		 -61.808998208599768 56.5834859013422 108.93481581757527 1;
	setAttr ".pm[47]" -type "matrix" 0.83209826922150909 -0.55313415438450741 0.040682645094741024 0
		 -0.045878450220062719 -0.14174497145552054 -0.98883948691002388 0 0.55272745378167543 0.82094516888791658 -0.14332268318593727 0
		 -62.048009408368074 62.487312954133905 109.52613538015184 1;
	setAttr ".pm[48]" -type "matrix" 0.89469880777582178 0.44481340554508753 -0.040682645094740781 0
		 -0.0278053851315496 0.14636710588519242 0.9888394869100241 0 0.44580366073217648 -0.88358231340502424 0.1433226831859368 0
		 -72.867170275908265 -54.45253139711842 -108.59930838519215 1;
	setAttr ".pm[49]" -type "matrix" 0.99886609896977074 -0.04068264509474076 -0.024727286891354377 0
		 0.036699750474144234 0.98883948691002388 -0.14439389683313009 0 0.030325643341032833 0.14332268318593724 0.98921128372069045 0
		 -99.191567472185554 -102.87228463181857 13.248011685299129 1;
	setAttr ".pm[50]" -type "matrix" 0.78535554762090309 -0.61904496106589135 2.120816717937586e-016 0
		 0.61904496106589157 0.7853555476209032 -4.4878225591181755e-017 0 -3.341111841184493e-017 2.3838430728265852e-016 1 0
		 -62.001857095801626 -95.703230232222538 15.048100000000002 1;
	setAttr ".pm[51]" -type "matrix" 0.97606395676921776 0.2165332677166828 0.020310004134742966 0
		 -0.019309564376735526 -0.0067351629370450998 0.99979086728364952 0 0.21662477471332459 -0.97625200719493876 -0.0023927867131373231 0
		 17.666177666294807 -9.009041249191327 -113.78934824127114 1;
	setAttr ".pm[52]" -type "matrix" 0.93426094160778206 -0.35572963086369425 0.024757275934960209 0
		 -0.024457232410080521 0.0053413605455884614 0.99968660771781948 0 -0.35575038547973398 -0.9345736458905215 -0.0037099377243972826 0
		 35.425801495941762 -26.817764792049786 -110.17868062045306 1;
	setAttr ".pm[53]" -type "matrix" 0.99955185092558108 -0.024757275934960216 -0.016827792473299037 0
		 -0.02481606611518325 -0.99968660771781936 -0.0032938142336070429 0 -0.016740972905151839 0.0037099377243968376 -0.99985297728629596 0
		 69.309493715044212 109.11079696718376 -8.0731510381926874 1;
	setAttr ".pm[54]" -type "matrix" 0.018858464667566018 -0.99951560047788257 0.024757275934960216 0
		 -0.0041774389751362672 0.024682693395325979 0.99968660771781948 0 -0.99981343625398011 -0.018955976579694313 -0.003709937724396783 0
		 -2.8701758240196957 -69.202344989997925 -108.39501655052516 1;
	setAttr ".pm[55]" -type "matrix" 0.84567118664675722 0.5331297415861781 -0.024757275934961701 0
		 -0.022921881057671942 -0.010063484407333893 -0.99968660771781948 0 -0.53321180730010398 0.84597364315789292 0.0037099377243944255 0
		 57.661110135904877 38.945369578367838 107.09020379692379 1;
	setAttr ".pm[56]" -type "matrix" 0.88650073670582241 0.46206441229369055 -0.024757275934961701 0
		 -0.023669202813392066 -0.0081520051408978684 -0.99968660771781948 0 -0.46212142631370434 0.88680889920200323 0.0037099377243944263 0
		 63.42242805245246 33.039683092612229 105.13880755762111 1;
	setAttr ".pm[57]" -type "matrix" 0.9965556132893606 0.079145353052127373 -0.024757275934961704 0
		 -0.024973201260867672 0.0017394161155139015 -0.99968660771781948 0 -0.079077486304573327 0.99686156888598698 0.0037099377243944255 0
		 75.01460435466683 3.9935835026115001 102.35257117647528 1;
	setAttr ".pm[58]" -type "matrix" 0.99955185092558108 -0.024757275934961624 -0.01682779247329853 0
		 -0.024816066115184641 -0.99968660771781948 -0.0032938142336093462 0 -0.016740972905151696 0.0037099377243990871 -0.99985297728629607 0
		 79.509225931047595 100.67811304234286 1.7992799151231997 1;
	setAttr ".pm[59]" -type "matrix" 0.93615496447394408 -0.35071492665563592 0.024757275934960452 0
		 -0.02448552166038136 0.0052101419037928259 0.99968660771781925 0 -0.35073400422514911 -0.93646777554931071 -0.0037099377243962157 0
		 73.35214442668304 -34.954427495252816 -108.98864102180197 1;
	setAttr ".pm[60]" -type "matrix" 0.88650073670582286 -0.46206441229369 0.024757275934960448 0
		 -0.023669202813391747 0.0081520051408957711 0.99968660771781925 0 -0.46212142631370329 -0.88680889920200368 -0.0037099377243962131 0
		 73.225746629156333 -44.459096296763803 -107.97929513838815 1;
	setAttr ".pm[61]" -type "matrix" 0.85116010122678953 -0.5243219996985452 0.024757275934960448 0
		 -0.023025116144690126 0.0098249873364902075 0.99968660771781925 0 -0.52440092115300918 -0.85146339337399379 -0.0037099377243962131 0
		 72.622439094714693 -50.066136533433536 -107.29181553026599 1;
	setAttr ".pm[62]" -type "matrix" 0.9995518509255813 -0.024757275934960458 -0.016827792473299193 0
		 -0.024816066115183472 -0.99968660771781948 -0.003293814233606402 0 -0.016740972905151915 0.0037099377243962148 -0.99985297728629607 0
		 97.947226840281843 101.48934779672473 -0.38623500853367299 1;
	setAttr ".pm[63]" -type "matrix" 0.85491276213266509 -0.51818070827750529 0.024757275934960327 0
		 -0.023095251869369185 0.0096589694444624511 0.99968660771781948 0 -0.51825744421454012 -0.85521661459439269 -0.0037099377243966477 0
		 67.064753843442062 -39.649663823961092 -109.91245137228718 1;
	setAttr ".pm[64]" -type "matrix" 0.92181090968741441 0.38684845103676074 -0.024757275934960375 0
		 -0.024264430843419216 -0.0061582258389561891 -0.99968660771781948 0 -0.38687967661419709 0.92212274247248416 0.0037099377243965314 0
		 76.150787472000118 28.740487177229767 110.2520940774332 1;
	setAttr ".pm[65]" -type "matrix" 0.92181090968741441 0.38684845103676074 -0.024757275934960375 0
		 -0.024264430843419216 -0.0061582258389561891 -0.99968660771781948 0 -0.38687967661419709 0.92212274247248416 0.0037099377243965314 0
		 79.250387066525505 28.537102854928087 109.93695452791421 1;
	setAttr ".pm[66]" -type "matrix" 0.99955185092558119 -0.02475727593496032 -0.016827792473299515 0
		 -0.024816066115183333 -0.99968660771781948 -0.0032938142336084784 0 -0.016740972905152082 0.0037099377243983078 -0.99985297728629596 0
		 94.601677117388306 104.18504376973074 6.3103667260665448 1;
	setAttr ".pm[67]" -type "matrix" 0.87874327790460827 -0.47665220950473325 0.024757275934960427 0
		 -0.023531244714933158 0.0085420648443217256 0.99968660771781948 0 -0.4767143086373955 -0.87905045606179577 -0.0037099377243964464 0
		 69.186449431875914 -40.975716080771825 -112.02440467356247 1;
	setAttr ".pm[68]" -type "matrix" 0.83688753049642306 -0.54681472052961266 0.024757275934960427 0
		 -0.02275515804005341 0.010434995553945373 0.99968660771781948 0 -0.54690169508072506 -0.83718861212985374 -0.0037099377243964447 0
		 70.516879244527729 -47.302139977317132 -111.9969800989266 1;
	setAttr ".pm[69]" -type "matrix" 0.89866080600925591 0.43794501142389342 -0.024757275934960476 0
		 -0.023880806879480066 -0.0075095547420366959 -0.99968660771781936 0 -0.43799367895619118 0.89897039637381926 0.0037099377243963319 0
		 79.239925784536055 38.005875386361843 111.03982963423883 1;
	setAttr ".pm[70]" -type "matrix" 0.99955185092558108 -0.02475727593496049 -0.016827792473298984 0
		 -0.024816066115183597 -0.99968660771781948 -0.0032938142336073803 0 -0.016740972905152099 0.0037099377243972219 -0.99985297728629563 0
		 97.988155719925587 104.91380551703806 3.5562813065736338 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 71 ".ma";
	setAttr -s 71 ".dpf[0:70]"  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 71 ".lw";
	setAttr -s 71 ".lw";
	setAttr ".mi" 5;
	setAttr ".ptw" -type "doubleArray" 1435 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 3.6118221032666042e-005 0 0 4.4850185076938942e-005 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.50222229957580566
		 0.39249500632286072 0.66704404354095459 0.37520182132720947 0.52149999141693115
		 0.50988620519638062 0.21823155879974365 0.52919989824295044 1 1 0.72672116756439209
		 1 0.90433883666992188 0.71530705690383911 0.81214404106140137 0.66472756862640381
		 0.49085038900375366 0.47261932492256165 0.47047457098960876 0.51839357614517212
		 0.51968932151794434 0.4826042652130127 0.53121095895767212 0.50113928318023682
		 0.98150312900543213 0.89430385828018188 0.96975082159042358 0.97718417644500732
		 1 1.1000113487243652 1.0566047430038452 1 0.052652396261692047 0.062401622533798218
		 0.080738574266433716 0.041644349694252014 0.062954522669315338 0.10475683212280273
		 0.092811703681945801 0.1184784471988678 0.43416297435760498 0.42157062888145447
		 0.42473241686820984 0.47968947887420654 0.49643740057945251 0.4404338002204895
		 0.43196061253547668 0.49919155240058899 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.13893243670463562 0 0 0 0
		 0.11279016733169556 0 0.074078269302845001 0.036852676421403885 0 0 0.084016755223274231
		 0 0 0.074527032673358917 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.5639888159930706e-005
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
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
	setAttr ".ucm" yes;
createNode tweak -n "tweak1";
createNode objectSet -n "skinCluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose1";
	setAttr -s 72 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 72 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 73.550347192516043
		 -27.628789241941231 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.53545044685176213 0.46183635518032651 0.53545044685176169 0.46183635518032612 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.5916627334603399
		 -8.3638648434063469 4.7106299555526237e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 -0.77437096355841861 0.63273186327037956 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 -6.300245533736713e-045 -1.1666580901899714e-043
		 4.9298642074809958e-016 0 24.942688988840082 -1.7763568394002505e-015
		 3.944304526105059e-030 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.026638274363904445 0.99964513820601031 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 -6.2418761485227633e-045 -1.9065812521134679e-043
		 4.1542936701669977e-016 0 16.770908897145148 1.7763568394002505e-015
		 1.2621774483536189e-029 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1
		 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 -8.6066846001220059e-045 -2.7108674222057944e-043
		 3.3787231328529825e-016 0 16.770908897145134 5.3290705182007514e-015
		 -1.5777218104420236e-030 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.0043477028086837399 0.9999905486954801 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 -6.647469448165912e-045 1.7743362666699646e-028
		 -1.735435063692554e-016 0 19.096311275134205 -7.1054273576010019e-015
		 2.0194839173657902e-028 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.99999991562579171 -0.00041078998228710729 -2.0999908864520106e-016 5.1120786772235045e-013 1
		 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 21.088826298162637
		 2.7295980809764163e-024 -8.0779356694631609e-028 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 -0.65611137108604944 0.7546640767464583 3.3220423151723155e-013 3.8210372616196958e-013 1
		 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 -0.040178748779872854 -0.020792873135831655
		 -0.0027043370928102393 0 -1.0329719544250071 4.3500309633549117 8.8637778526833024 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.96156926463219605 0.27456246887493152 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 1.6100393150186242e-008 6.1101695330423733e-008
		 1.3018516093398289e-007 0 30.702328837307075 3.2210250272565379 7.3702689416519389 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.42432443384886842 0.90551022900839573 1
		 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 37.040681973710264
		 -3.4996748058453737 -2.9383800414811576 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.99988067894087573 0.015447584948249835 -1.244277648216217e-016 8.0538749834183196e-015 1
		 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.3272092599796776
		 0.90296612392917253 -0.2110423298257996 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.75162888165105857 0.65958625233397572 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 2.1061443138132192e-008 -2.4765033977768532e-010
		 6.6595202156124257e-010 0 15.628881150352722 -0.45507411964633021 -0.7386481543902379 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.054282597709532546 0.023735834589709806 0.17707210980242091 0.98241308911900926 1
		 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 21.567988283159739
		 -0.25360652830568958 0.68196872171433354 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.022748860142898231 0.69491113720171682 -0.058241316201307791 0.71637207500177924 1
		 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.1810229249661037
		 -5.3601966805626402 3.5958393806610861e-014 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 -0.033009183346679946 -0.017073113512433409
		 -0.0022822640130934543 0 -1.0329373312600592 4.3499997093370437 -8.8637800000000038 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.27456246887493152 0.96156926463219605 1
		 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 -6.0860814045662551e-016 -2.2677016580315414e-015
		 -4.8431318626873595e-015 0 -30.702381912256723 -3.2210387021269171 -7.4825798596874353 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.42432443384886842 0.90551022900839573 1
		 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 -1.3842758118021633e-008 -5.3709818748746128e-009
		 1.2550722704528145e-009 0 -37.040644675454566 3.4997175884039446 3.0506598596874497 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.99988067894087573 0.015447584948252435 -9.4586053394204251e-019 6.1223011624761438e-017 1
		 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.3272142309788348
		 -0.90295773213896824 0.21100000000000385 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.7516288816510569 0.6595862523339775 1 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 -15.628898395600284
		 0.4550668907179915 0.73869999999999969 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.054282597709529395 0.023735834589701903 0.177072109802421 0.9824130891190096 1
		 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0 0 -21.255923633275529
		 0.11129493052373218 -0.25212401671571716 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.022748860142931204 0.69491113720171982 -0.058241316201274929 0.71637207500177802 1
		 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.1810061568172747
		 5.3601860550162375 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 13.360095262274513
		 -2.8748072533964435 3.2960366641813119e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0.027586415347637241 0.99961942242448831 1 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002
		 1 0 0 0 0 8.876355447912502 -0.51936043817175204 -3.3485346531787591e-015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1.0000000000000002 1.0000000000000002
		 1 0 0 0 0 12.249551270380863 0.76155902241770468 -1.2374974768992751e-015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0.99999999999999978 0.99999999999999978
		 1 yes;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 11.179013614173885
		 4.2133339051900673 2.1514128444428646e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0.46672827734466399 0.88440076612748497 0.99999999999999978 0.99999999999999978
		 1 yes;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 0 0 0 0 9.2290725587366111
		 -0.60186388446098615 2.579751214090665e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 -0.88858972875129438 0.45870283840161824 -2.808652052114904e-017 5.440863138850689e-017 1
		 1 1 yes;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 0 0 0 0 13.756277391863158
		 0.016011103983546354 -7.7956492140276794e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 -0.977059177547283 0.21296798719673066 -1.3040097514093953e-017 5.9825643844243448e-017 1
		 1 1 yes;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 0 0 0 0 20.131574060907599
		 -3.0327304022979495 3.1579967034619463e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 -0.97563769886509055 0.21938796811409453 -1.3433194985235063e-017 5.9738606252941652e-017 1
		 1 1 yes;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 0 0 0 0 9.8410885964775758
		 22.55359638042821 4.2855336505983882e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.69862059332111826
		 5.0565446355781667 10.551134833547628 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.095326184759740862 -0.70065178120029892 0.35887000657928914 0.60927195764927622 1
		 1 1 yes;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0.13479162048154625 0.065359981075556475
		 0.02182842349444564 0 1.5973946998228157 -1.8993723750615625 -2.1538273881156389 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.68988296026193341 0.15511770092491584 -0.30524602331978767 0.6378282411805356 1
		 1 1 yes;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 0.0003519943759860433 0.0046272209400250236
		 0.0099225483142351151 0 26.221798814101643 5.8358108346939144 3.438849138997329 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.28219716832747732 0.95935642916903074 1
		 1 1 yes;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 0 0 0 0 27.007814616176734
		 -4.3434990405600917 1.0674405934303377 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.69649206623125481 0.1220606475360384 -0.12206064753603846 0.69649206623125515 1
		 1 1 yes;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.25371880935075253
		 -0.7163200692326378 2.7349445890513699 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.50884465471114337 -0.49099604618764203 0.49099604618764042 0.50884465471114504 1
		 1 1 yes;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.8487190563099958
		 -0.36311438533430751 1.0625587214271122 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.88010117153114342 0.47478619174267156 -1.3449502172512193e-016 2.4931059125986776e-016 1
		 1 1 yes;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.9006418355554477
		 -0.92648841112504332 -2.1970166392512112 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.040992233766360534 0.99915946513599319 1 1 1 yes;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.0973041279071936
		 -0.076687671613656264 -2.1803207136343121 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0.19927144567742741 0.9799443305298664 1 1 1 yes;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.4771061789194393
		 -0.85568884986789051 -0.74751087746536438 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0.70676243860346799 0.022064799552179687 0.022064799552179742 0.70676243860346977 1
		 1 1 yes;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 0 0 0 0 11.499129580025796
		 -0.72496335183797211 -0.28972725851825315 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0.69681681421287833 -0.12019287595450427 0.12019287595450426 0.69681681421287844 1
		 1 1 yes;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.7584644233757576
		 -0.26405447382178243 0.29763648032620638 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.060978206170816229 0.99813909770742348 1 1 1 yes;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.7349183606647154
		 -0.3942897237934565 0.67803992102476274 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.035805414538648619 0.999358780563675 1 1 1 yes;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 0 0 0 0 11.983957829182339
		 0.27559944802634045 4.787561689462966 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.68193273660828491 0.18699663831720459 -0.18699663831720462 0.68193273660828502 1
		 1 1 yes;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.6278332794854578
		 2.1277015622055031 7.4388608721006726 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.68260143951255192 -0.1845407130564736 0.18454071305647357 0.68260143951255203 1
		 1 1 yes;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.0998433283697482
		 -0.3930167861604365 -0.019386792489674152 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0.99727919273574284 -0.073717106131107782 -3.7250693241874519e-017 5.0394465049987642e-016 1
		 1 1 yes;
	setAttr ".xm[45]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.0407718301403075
		 0.010934614030565094 -0.25281771117634327 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[46]" -type "matrix" "xform" 1 1 1 0 0 0 0 11.035402548885356
		 -0.22519332867254407 -4.9803711460852336 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.69434801988722838 0.13371921058204458 0.13371921058204456 0.69434801988722827 1
		 1 1 yes;
	setAttr ".xm[47]" -type "matrix" "xform" 1 1 1 0 0 0 0 10.476439270204082
		 3.1636834095791557 3.2486783948780555 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.6868249566241349 -0.16814124704621158 0.16814124704621156 0.68682495662413501 1
		 1 1 yes;
	setAttr ".xm[48]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.1342427523126366
		 -0.62859535269035938 -0.59131956257657903 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0.040861886634644136 0.99916480433442889 1 1 1 yes;
	setAttr ".xm[49]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.4431888483874631
		 -0.64434020390341629 0.92682699495975629 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.99803830579929698 -0.062606230977985899 -1.7734775235577779e-017 2.8271922384324945e-016 1
		 1 1 yes;
	setAttr ".xm[50]" -type "matrix" "xform" 1 1 1 0 0 0 0 11.416164210839183
		 -0.50073440204134878 -5.7270237533735751 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.69032295702722835 0.15314769015947868 0.1531476901594786 0.69032295702722801 1
		 1 1 yes;
	setAttr ".xm[51]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.6986180336520873
		 5.0566472827976234 -10.551100000000009 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.70065178120029947 0.095326184759740806 -0.60927195764927577 0.35887000657928908 1
		 1 1 yes;
	setAttr ".xm[52]" -type "matrix" "xform" 1 1 1 -0.0067364698723557069 0.019310764536484368
		 0.0067923838595321346 0 -1.5973485075217013 1.899560713827869 2.1538000000000022 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.68988296026193352 0.15511770092491595 -0.30524602331978756 0.6378282411805356 1
		 1 1 yes;
	setAttr ".xm[53]" -type "matrix" "xform" 1 1 1 0.00035161239055128815 0.0046260557199628832
		 0.0099231296034102811 0 -26.221765821812703 -5.8357541394996701 -3.4385428584398205 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.28219716832747721 0.95935642916903074 1
		 1 1 yes;
	setAttr ".xm[54]" -type "matrix" "xform" 1 1 1 0 0 0 0 -27.007846361687925
		 4.3434499132648483 -1.0678836532692562 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.69649206623125481 0.12206064753603847 -0.12206064753603854 0.69649206623125515 1
		 1 1 yes;
	setAttr ".xm[55]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.2536816662950514
		 0.71578041665863879 -2.7348663264799198 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.50884465471114415 -0.49099604618764142 0.49099604618764137 0.50884465471114415 1
		 1 1 yes;
	setAttr ".xm[56]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.9877135441037614
		 0.37327354138930524 -1.3048127536012495 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.88010117153114331 0.47478619174267167 -6.6161358357193039e-016 1.2264191758933174e-015 1
		 1 1 yes;
	setAttr ".xm[57]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.8417084498453309
		 0.82144031984888377 1.9513962393026798 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.040992233766360353 0.99915946513599319 1 1 1 yes;
	setAttr ".xm[58]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.0749566656818041
		 0.066320633019173611 2.7862363811458537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.19927144567742741 0.9799443305298664 1 1 1 yes;
	setAttr ".xm[59]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.4520195964125753
		 0.82971021420836888 1.6744581341324101 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.70676243860346721 0.022064799552179722 0.022064799552179826 0.70676243860347054 1
		 1 1 yes;
	setAttr ".xm[60]" -type "matrix" "xform" 1 1 1 0 0 0 0 -11.514045465502349
		 0.12215594538176203 0.28774651198115514 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.69681681421287855 -0.12019287595450436 0.12019287595450441 0.69681681421287822 1
		 1 1 yes;
	setAttr ".xm[61]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.7410274529477467
		 0.26030974217033537 -1.0093458834138287 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.060978206170815973 0.99813909770742348 1 1 1 yes;
	setAttr ".xm[62]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.7934631031519408
		 0.28144951042637972 -0.68747960812214304 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.035805414538648501 0.999358780563675 1 1 1 yes;
	setAttr ".xm[63]" -type "matrix" "xform" 1 1 1 0 0 0 0 -11.427804615839266
		 0.22665574716998624 -5.802467733541274 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.68193273660828513 0.18699663831720439 -0.18699663831720437 0.68193273660828502 1
		 1 1 yes;
	setAttr ".xm[64]" -type "matrix" "xform" 1 1 1 0 0 0 0 -8.5979424215326823
		 -0.80165440510340602 -7.6165942949548651 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.68260143951255203 -0.18454071305647368 0.18454071305647371 0.68260143951255192 1
		 1 1 yes;
	setAttr ".xm[65]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.032592496728947
		 -0.024856200756021143 0.339642705146048 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.99727919273574284 0.073717106131107893 -4.5137218276776626e-018 6.1063721797952087e-017 1
		 1 1 yes;
	setAttr ".xm[66]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.0995995945253938
		 0.20338432230168432 0.3151395495189756 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[67]" -type "matrix" "xform" 1 1 1 0 0 0 0 -10.928676422059159
		 -0.73804957784074887 5.7519107581834872 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.69434801988722772 0.13371921058204442 0.13371921058204464 0.69434801988722894 1
		 1 1 yes;
	setAttr ".xm[68]" -type "matrix" "xform" 1 1 1 0 0 0 0 -10.981036313793004
		 -2.9136077063787318 -3.690813647035796 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.68682495662413501 -0.16814124704621167 0.16814124704621175 0.68682495662413467 1
		 1 1 yes;
	setAttr ".xm[69]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.9574273623796712
		 0.41037142142210953 -0.027424574635879606 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0.040861886634644122 0.99916480433442889 1 1 1 yes;
	setAttr ".xm[70]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.3524045002078369
		 0.30816690325442347 -0.95715046468775988 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.99803830579929698 0.062606230977986121 -3.8333994122256575e-018 6.1110202531996996e-017 1
		 1 1 yes;
	setAttr ".xm[71]" -type "matrix" "xform" 1 1 1 0 0 0 0 -11.059188523269842
		 -0.20924928110024052 6.1260241172007577 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.6903229570272279 0.15314769015947849 0.15314769015947866 0.69032295702722857 1
		 1 1 yes;
	setAttr -s 72 ".m";
	setAttr -s 72 ".p";
	setAttr -s 72 ".g[0:71]" yes no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no;
	setAttr ".bp" yes;
createNode animCurveTL -n "RL_IK_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -5.1213413676119011;
createNode animCurveTL -n "LL_IK_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -1.4133251013959125e-008;
createNode animCurveTL -n "RL_IK_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.18015981694669847;
createNode animCurveTL -n "LL_IK_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 9.7080054515408172;
createNode animCurveTL -n "RL_IK_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 21.316142015572929;
createNode animCurveTL -n "LL_IK_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -25.817274295566044;
createNode animCurveTA -n "RL_IK_twist";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "LL_IK_twist";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -6.8754935415698784;
createNode animCurveTL -n "Tail_IK_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -11.749194501412852;
createNode animCurveTL -n "Tail_IK_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -25.191734041602203;
createNode animCurveTL -n "Tail_IK_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 13.308388976573056;
createNode animCurveTA -n "Tail_IK_twist";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "RAIK_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 29.581355413391847 40 24.443973082861731 
		70 29.011484920590384;
createNode animCurveTL -n "RAIK_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -35.911667096213264 40 -19.467779027425507 
		70 -26.79397583265083;
createNode animCurveTL -n "RAIK_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -7.4363869099648863 40 -7.4363871565424002 
		70 -44.264324024772826;
createNode animCurveTA -n "RAIK_twist";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -13.750987083139757 40 -13.750987083139757 
		70 -13.750987083139757;
	setAttr -s 3 ".kit[0:2]"  10 1 1;
	setAttr -s 3 ".kot[0:2]"  10 1 1;
	setAttr -s 3 ".kix[1:2]"  1 1;
	setAttr -s 3 ".kiy[1:2]"  0 0;
	setAttr -s 3 ".kox[1:2]"  1 1;
	setAttr -s 3 ".koy[1:2]"  0 0;
createNode animCurveTL -n "LAIK_translateX";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 -24.685295112856096 40 -24.346086906494065 
		55 -66.759714737689308 70 -66.60073154677832;
	setAttr -s 4 ".kit[2:3]"  3 10;
	setAttr -s 4 ".kot[2:3]"  3 10;
	setAttr -s 4 ".kix[0:3]"  0.056304790079593658 0.053574163466691971 
		1 0.96913713216781616;
	setAttr -s 4 ".kiy[0:3]"  0.99841362237930298 -0.99856388568878174 
		0 0.24652236700057983;
	setAttr -s 4 ".kox[0:3]"  0.061093803495168686 0.053574156016111374 
		1 0.96913713216781616;
	setAttr -s 4 ".koy[0:3]"  0.99813205003738403 -0.99856388568878174 
		0 0.24652236700057983;
createNode animCurveTL -n "LAIK_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 -41.387076958778906 40 10.100077130223951 
		55 -15.751440726096959 70 -46.964192987202097;
	setAttr -s 4 ".kit[1:3]"  3 10 10;
	setAttr -s 4 ".kot[1:3]"  3 10 10;
createNode animCurveTL -n "LAIK_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 -20.625326532331229 40 19.674243826869073 
		55 44.394058439142142 70 18.699592530125678;
	setAttr -s 4 ".kit[1:3]"  9 3 10;
	setAttr -s 4 ".kot[1:3]"  9 1 10;
	setAttr -s 4 ".ktl[0:3]" no no no no;
	setAttr -s 4 ".kox[2:3]"  0.031497534364461899 0.024317115545272827;
	setAttr -s 4 ".koy[2:3]"  -0.99950385093688965 -0.99970430135726929;
createNode animCurveTA -n "LAIK_twist";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 -24.064227395494576 40 -17.188733853924695 
		55 104.54433586057685 70 74.484513367007025;
	setAttr -s 4 ".kit[2:3]"  3 10;
	setAttr -s 4 ".kot[2:3]"  3 10;
createNode animCurveTA -n "RLOutsidetwoRoot_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "RLAnkleLower_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "RLAnkleLower_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -23.634988978501646;
createNode animCurveTA -n "RLAnkleUpper_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -7.9313161698309788e-007;
createNode animCurveTA -n "RLAnkleUpper_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -5.8977292780891943;
createNode animCurveTA -n "RLAnkleUpper_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -1.9463058036039833;
createNode animCurveTA -n "LLOutsidetwoRoot_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 50.835542098406847;
createNode animCurveTA -n "LLAnkleLower_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 9.994353121114365;
createNode animCurveTA -n "LLAnkleLower_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -26.411168206673675;
createNode animCurveTA -n "LLAnkleUpper_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 7.9312929795449385e-007;
createNode animCurveTA -n "LLAnkleUpper_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -26.725484159340795;
createNode animCurveTA -n "LLAnkleUpper_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -7.1924709503253198e-008;
createNode animCurveTL -n "Master_translateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.61446387377740308;
createNode animCurveTL -n "Master_translateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 74.872459102884264;
createNode animCurveTL -n "Master_translateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -27.628789241941231;
createNode animCurveTA -n "Master_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "Master_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "Master_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "Spine1_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 4 5.8007929462854912 40 0 70 
		-11.034987368570757;
createNode animCurveTA -n "Spine1_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 -13.032006303473258 4 -13.032006303473258 
		40 -13.032006303473258 70 -6.2246069178949552;
createNode animCurveTA -n "Spine1_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 4 0 40 0 70 9.9981777402282247e-017;
createNode animCurveTA -n "Spine2_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 -4.9376089962622514;
createNode animCurveTA -n "Spine2_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 0;
createNode animCurveTA -n "Spine2_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 1.8834621896436528;
createNode animCurveTA -n "Spine3_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 -6.7515234172678182;
createNode animCurveTA -n "Spine3_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 0;
createNode animCurveTA -n "Spine3_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 6.690366138358077;
createNode animCurveTA -n "Spine4base_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 0;
createNode animCurveTA -n "Spine4base_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 11.589331683487469;
createNode animCurveTA -n "Spine4base_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 70 0;
createNode animCurveTA -n "Neck_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "Neck_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -2.7066975754054057;
createNode animCurveTA -n "Neck_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "Head_rotateX";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "Head_rotateY";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 15.119999999999019;
createNode animCurveTA -n "Head_rotateZ";
	setAttr ".tan" 10;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 12.834985276922646;
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :lightList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -sn "currentRenderer" -ln "currentRenderer" -dt "string";
	setAttr ".currentRenderer" -type "string" "mayaSoftware";
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
select -ne :hyperGraphLayout;
	setAttr -s 10 ".hyp";
	setAttr ".hyp[56].isc" no;
	setAttr ".hyp[56].isf" no;
	setAttr ".hyp[67].isc" no;
	setAttr ".hyp[67].isf" no;
	setAttr ".hyp[68].isc" no;
	setAttr ".hyp[68].isf" no;
	setAttr ".hyp[69].isc" no;
	setAttr ".hyp[69].isf" no;
	setAttr ".hyp[76].isc" no;
	setAttr ".hyp[76].isf" no;
	setAttr ".hyp[77].isc" no;
	setAttr ".hyp[77].isf" no;
	setAttr ".hyp[78].isc" no;
	setAttr ".hyp[78].isf" no;
	setAttr ".hyp[79].isc" no;
	setAttr ".hyp[79].isf" no;
	setAttr ".hyp[80].isc" no;
	setAttr ".hyp[80].isf" no;
	setAttr ".hyp[81].isc" no;
	setAttr ".hyp[81].isf" no;
connectAttr "LLHip.msg" "LL_IK.hsj";
connectAttr "effector1.hp" "LL_IK.hee";
connectAttr "ikRPsolver.msg" "LL_IK.hsv";
connectAttr "IKs.di" "LL_IK.do";
connectAttr "LL_IK_translateX.o" "LL_IK.tx";
connectAttr "LL_IK_translateY.o" "LL_IK.ty";
connectAttr "LL_IK_translateZ.o" "LL_IK.tz";
connectAttr "LL_IK_twist.o" "LL_IK.twi";
connectAttr "RLHip.msg" "RL_IK.hsj";
connectAttr "effector2.hp" "RL_IK.hee";
connectAttr "ikRPsolver.msg" "RL_IK.hsv";
connectAttr "IKs.di" "RL_IK.do";
connectAttr "RL_IK_translateX.o" "RL_IK.tx";
connectAttr "RL_IK_translateY.o" "RL_IK.ty";
connectAttr "RL_IK_translateZ.o" "RL_IK.tz";
connectAttr "RL_IK_twist.o" "RL_IK.twi";
connectAttr "Skelly.di" "Master.do";
connectAttr "Master_translateX.o" "Master.tx";
connectAttr "Master_translateY.o" "Master.ty";
connectAttr "Master_translateZ.o" "Master.tz";
connectAttr "Master_rotateX.o" "Master.rx";
connectAttr "Master_rotateY.o" "Master.ry";
connectAttr "Master_rotateZ.o" "Master.rz";
connectAttr "Master.s" "Tail1.is";
connectAttr "Skelly.di" "Tail1.do";
connectAttr "Tail1.s" "Tail2.is";
connectAttr "Skelly.di" "Tail2.do";
connectAttr "Tail2.s" "Tail3.is";
connectAttr "Skelly.di" "Tail3.do";
connectAttr "Tail3.s" "Tail4.is";
connectAttr "Skelly.di" "Tail4.do";
connectAttr "Tail4.s" "Tail5.is";
connectAttr "Skelly.di" "Tail5.do";
connectAttr "Tail5.s" "Tail6E.is";
connectAttr "Skelly.di" "Tail6E.do";
connectAttr "Tail6E.tx" "effector6.tx";
connectAttr "Tail6E.ty" "effector6.ty";
connectAttr "Tail6E.tz" "effector6.tz";
connectAttr "Skelly.di" "effector6.do";
connectAttr "Master.s" "LLHip.is";
connectAttr "Skelly.di" "LLHip.do";
connectAttr "LLHip.s" "LLKnee.is";
connectAttr "Skelly.di" "LLKnee.do";
connectAttr "LLKnee.s" "LLAnkleUpper.is";
connectAttr "Skelly.di" "LLAnkleUpper.do";
connectAttr "LLAnkleUpper_rotateX.o" "LLAnkleUpper.rx";
connectAttr "LLAnkleUpper_rotateY.o" "LLAnkleUpper.ry";
connectAttr "LLAnkleUpper_rotateZ.o" "LLAnkleUpper.rz";
connectAttr "LLAnkleLower_rotateY.o" "LLAnkleLower.ry";
connectAttr "LLAnkleLower_rotateZ.o" "LLAnkleLower.rz";
connectAttr "LLAnkleUpper.s" "LLAnkleLower.is";
connectAttr "Skelly.di" "LLAnkleLower.do";
connectAttr "LLOutsidetwoRoot_rotateZ.o" "LLOutsidetwoRoot.rz";
connectAttr "LLAnkleLower.s" "LLOutsidetwoRoot.is";
connectAttr "Skelly.di" "LLOutsidetwoRoot.do";
connectAttr "LLOutsidetwoRoot.s" "LLMidToe2E.is";
connectAttr "Skelly.di" "LLMidToe2E.do";
connectAttr "LLAnkleLower.s" "LLFootHeel.is";
connectAttr "Skelly.di" "LLFootHeel.do";
connectAttr "LLAnkleUpper.tx" "effector1.tx";
connectAttr "LLAnkleUpper.ty" "effector1.ty";
connectAttr "LLAnkleUpper.tz" "effector1.tz";
connectAttr "Skelly.di" "effector1.do";
connectAttr "Master.s" "RLHip.is";
connectAttr "Skelly.di" "RLHip.do";
connectAttr "RLHip.s" "RLKnee.is";
connectAttr "Skelly.di" "RLKnee.do";
connectAttr "RLKnee.s" "RLAnkleUpper.is";
connectAttr "Skelly.di" "RLAnkleUpper.do";
connectAttr "RLAnkleUpper_rotateX.o" "RLAnkleUpper.rx";
connectAttr "RLAnkleUpper_rotateY.o" "RLAnkleUpper.ry";
connectAttr "RLAnkleUpper_rotateZ.o" "RLAnkleUpper.rz";
connectAttr "RLAnkleLower_rotateY.o" "RLAnkleLower.ry";
connectAttr "RLAnkleLower_rotateZ.o" "RLAnkleLower.rz";
connectAttr "RLAnkleUpper.s" "RLAnkleLower.is";
connectAttr "Skelly.di" "RLAnkleLower.do";
connectAttr "RLOutsidetwoRoot_rotateZ.o" "RLOutsidetwoRoot.rz";
connectAttr "RLAnkleLower.s" "RLOutsidetwoRoot.is";
connectAttr "Skelly.di" "RLOutsidetwoRoot.do";
connectAttr "RLOutsidetwoRoot.s" "RLMidToe2E.is";
connectAttr "Skelly.di" "RLMidToe2E.do";
connectAttr "RLAnkleLower.s" "RLFootHeel.is";
connectAttr "Skelly.di" "RLFootHeel.do";
connectAttr "RLAnkleUpper.tx" "effector2.tx";
connectAttr "RLAnkleUpper.ty" "effector2.ty";
connectAttr "RLAnkleUpper.tz" "effector2.tz";
connectAttr "Skelly.di" "effector2.do";
connectAttr "Master.s" "Spine1.is";
connectAttr "Skelly.di" "Spine1.do";
connectAttr "Spine1_rotateX.o" "Spine1.rx";
connectAttr "Spine1_rotateY.o" "Spine1.ry";
connectAttr "Spine1_rotateZ.o" "Spine1.rz";
connectAttr "Spine1.s" "Spine2.is";
connectAttr "Skelly.di" "Spine2.do";
connectAttr "Spine2_rotateX.o" "Spine2.rx";
connectAttr "Spine2_rotateY.o" "Spine2.ry";
connectAttr "Spine2_rotateZ.o" "Spine2.rz";
connectAttr "Spine2.s" "Spine3.is";
connectAttr "Skelly.di" "Spine3.do";
connectAttr "Spine3_rotateX.o" "Spine3.rx";
connectAttr "Spine3_rotateY.o" "Spine3.ry";
connectAttr "Spine3_rotateZ.o" "Spine3.rz";
connectAttr "Spine3.s" "Spine4base.is";
connectAttr "Skelly.di" "Spine4base.do";
connectAttr "Spine4base_rotateX.o" "Spine4base.rx";
connectAttr "Spine4base_rotateY.o" "Spine4base.ry";
connectAttr "Spine4base_rotateZ.o" "Spine4base.rz";
connectAttr "Spine4base.s" "Neck.is";
connectAttr "Skelly.di" "Neck.do";
connectAttr "Neck_rotateX.o" "Neck.rx";
connectAttr "Neck_rotateY.o" "Neck.ry";
connectAttr "Neck_rotateZ.o" "Neck.rz";
connectAttr "Neck.s" "Head.is";
connectAttr "Skelly.di" "Head.do";
connectAttr "Head_rotateX.o" "Head.rx";
connectAttr "Head_rotateY.o" "Head.ry";
connectAttr "Head_rotateZ.o" "Head.rz";
connectAttr "Head.s" "Head_Top.is";
connectAttr "Skelly.di" "Head_Top.do";
connectAttr "Head.s" "Chin.is";
connectAttr "Skelly.di" "Chin.do";
connectAttr "Spine4base.s" "LARoot.is";
connectAttr "Skelly.di" "LARoot.do";
connectAttr "LARoot.s" "LAShoulder.is";
connectAttr "Skelly.di" "LAShoulder.do";
connectAttr "LAShoulder.s" "LAElbow.is";
connectAttr "Skelly.di" "LAElbow.do";
connectAttr "LAElbow.s" "LAWrist.is";
connectAttr "Skelly.di" "LAWrist.do";
connectAttr "Skelly.di" "LAFThumbRoot.do";
connectAttr "LAFThumbRoot.s" "LAFThumb1.is";
connectAttr "Skelly.di" "LAFThumb1.do";
connectAttr "LAFThumb1.s" "LAThumb2.is";
connectAttr "Skelly.di" "LAThumb2.do";
connectAttr "LAThumb2.s" "LAFThumb3.is";
connectAttr "Skelly.di" "LAFThumb3.do";
connectAttr "LAFThumb3.s" "LAThumb4E.is";
connectAttr "Skelly.di" "LAThumb4E.do";
connectAttr "Skelly.di" "LAFPinkyRoot.do";
connectAttr "LAFPinkyRoot.s" "LAFPinky1.is";
connectAttr "Skelly.di" "LAFPinky1.do";
connectAttr "LAFPinky1.s" "LAFPinky2.is";
connectAttr "Skelly.di" "LAFPinky2.do";
connectAttr "LAFPinky2.s" "LAFPinky3E.is";
connectAttr "Skelly.di" "LAFPinky3E.do";
connectAttr "Skelly.di" "LAFPointerRoot.do";
connectAttr "LAFPointerRoot.s" "LAFPointer1.is";
connectAttr "Skelly.di" "LAFPointer1.do";
connectAttr "LAFPointer1.s" "LAFPointer2.is";
connectAttr "Skelly.di" "LAFPointer2.do";
connectAttr "LAFPointer2.s" "LAFPointer3E.is";
connectAttr "Skelly.di" "LAFPointer3E.do";
connectAttr "Skelly.di" "LAFMiddleroot.do";
connectAttr "LAFMiddleroot.s" "LAFMiddle1.is";
connectAttr "Skelly.di" "LAFMiddle1.do";
connectAttr "LAFMiddle1.s" "LAFMiddle2.is";
connectAttr "Skelly.di" "LAFMiddle2.do";
connectAttr "LAFMiddle2.s" "LAFMiddle3E.is";
connectAttr "Skelly.di" "LAFMiddle3E.do";
connectAttr "LAWrist.tx" "effector4.tx";
connectAttr "LAWrist.ty" "effector4.ty";
connectAttr "LAWrist.tz" "effector4.tz";
connectAttr "Skelly.di" "effector4.do";
connectAttr "LAWrist.tx" "effector5.tx";
connectAttr "LAWrist.ty" "effector5.ty";
connectAttr "LAWrist.tz" "effector5.tz";
connectAttr "Skelly.di" "effector5.do";
connectAttr "Spine4base.s" "RARoot.is";
connectAttr "Skelly.di" "RARoot.do";
connectAttr "RARoot.s" "RAShoulder.is";
connectAttr "Skelly.di" "RAShoulder.do";
connectAttr "RAShoulder.s" "RAElbow.is";
connectAttr "Skelly.di" "RAElbow.do";
connectAttr "RAElbow.s" "RAWrist.is";
connectAttr "Skelly.di" "RAWrist.do";
connectAttr "Skelly.di" "RAFThumbRoot.do";
connectAttr "RAWrist.s" "RAFThumbRoot.is";
connectAttr "RAFThumbRoot.s" "RAFThumb1.is";
connectAttr "Skelly.di" "RAFThumb1.do";
connectAttr "RAFThumb1.s" "RAThumb2.is";
connectAttr "Skelly.di" "RAThumb2.do";
connectAttr "RAThumb2.s" "RAFThumb3.is";
connectAttr "Skelly.di" "RAFThumb3.do";
connectAttr "RAFThumb3.s" "RAThumb4E.is";
connectAttr "Skelly.di" "RAThumb4E.do";
connectAttr "Skelly.di" "RAFPinkyRoot.do";
connectAttr "RAWrist.s" "RAFPinkyRoot.is";
connectAttr "RAFPinkyRoot.s" "RAFPinky1.is";
connectAttr "Skelly.di" "RAFPinky1.do";
connectAttr "RAFPinky1.s" "RAFPinky2.is";
connectAttr "Skelly.di" "RAFPinky2.do";
connectAttr "RAFPinky2.s" "RAFPinky3E.is";
connectAttr "Skelly.di" "RAFPinky3E.do";
connectAttr "Skelly.di" "RAFPointerRoot.do";
connectAttr "RAWrist.s" "RAFPointerRoot.is";
connectAttr "RAFPointerRoot.s" "RAFPointer1.is";
connectAttr "Skelly.di" "RAFPointer1.do";
connectAttr "RAFPointer1.s" "RAFPointer2.is";
connectAttr "Skelly.di" "RAFPointer2.do";
connectAttr "RAFPointer2.s" "RAFPointer3E.is";
connectAttr "Skelly.di" "RAFPointer3E.do";
connectAttr "Skelly.di" "RAFMiddleroot.do";
connectAttr "RAWrist.s" "RAFMiddleroot.is";
connectAttr "RAFMiddleroot.s" "RAFMiddle1.is";
connectAttr "Skelly.di" "RAFMiddle1.do";
connectAttr "RAFMiddle1.s" "RAFMiddle2.is";
connectAttr "Skelly.di" "RAFMiddle2.do";
connectAttr "RAFMiddle2.s" "RAFMiddle3E.is";
connectAttr "Skelly.di" "RAFMiddle3E.do";
connectAttr "Skelly.di" "effector7.do";
connectAttr "Skelly.di" "effector8.do";
connectAttr "RAWrist.tx" "effector9.tx";
connectAttr "RAWrist.ty" "effector9.ty";
connectAttr "RAWrist.tz" "effector9.tz";
connectAttr "LAShoulder.msg" "LAIK.hsj";
connectAttr "effector5.hp" "LAIK.hee";
connectAttr "ikRPsolver.msg" "LAIK.hsv";
connectAttr "IKs.di" "LAIK.do";
connectAttr "LAIK_translateX.o" "LAIK.tx";
connectAttr "LAIK_translateY.o" "LAIK.ty";
connectAttr "LAIK_translateZ.o" "LAIK.tz";
connectAttr "LAIK_twist.o" "LAIK.twi";
connectAttr "Tail1.msg" "Tail_IK.hsj";
connectAttr "effector6.hp" "Tail_IK.hee";
connectAttr "ikRPsolver.msg" "Tail_IK.hsv";
connectAttr "IKs.di" "Tail_IK.do";
connectAttr "Tail_IK_translateX.o" "Tail_IK.tx";
connectAttr "Tail_IK_translateY.o" "Tail_IK.ty";
connectAttr "Tail_IK_translateZ.o" "Tail_IK.tz";
connectAttr "Tail_IK_twist.o" "Tail_IK.twi";
connectAttr "Skin.di" "Body.do";
connectAttr "skinCluster1.og[0]" "BodyShape.i";
connectAttr "Skin.di" "BodyShape.do";
connectAttr "skinCluster1GroupId.id" "BodyShape.iog.og[8].gid";
connectAttr "skinCluster1Set.mwc" "BodyShape.iog.og[8].gco";
connectAttr "groupId2.id" "BodyShape.iog.og[9].gid";
connectAttr "tweakSet1.mwc" "BodyShape.iog.og[9].gco";
connectAttr "tweak1.vl[0].vt[0]" "BodyShape.twl";
connectAttr "RAShoulder.msg" "RAIK.hsj";
connectAttr "effector9.hp" "RAIK.hee";
connectAttr "ikRPsolver.msg" "RAIK.hsv";
connectAttr "RAIK_translateX.o" "RAIK.tx";
connectAttr "RAIK_translateY.o" "RAIK.ty";
connectAttr "RAIK_translateZ.o" "RAIK.tz";
connectAttr "RAIK_twist.o" "RAIK.twi";
connectAttr "IKs.di" "RAIK.do";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "layerManager.dli[1]" "Skin.id";
connectAttr "layerManager.dli[2]" "Skelly.id";
connectAttr "layerManager.dli[3]" "IKs.id";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "Master.wm" "skinCluster1.ma[0]";
connectAttr "Tail1.wm" "skinCluster1.ma[1]";
connectAttr "Tail2.wm" "skinCluster1.ma[2]";
connectAttr "Tail3.wm" "skinCluster1.ma[3]";
connectAttr "Tail4.wm" "skinCluster1.ma[4]";
connectAttr "Tail5.wm" "skinCluster1.ma[5]";
connectAttr "Tail6E.wm" "skinCluster1.ma[6]";
connectAttr "LLHip.wm" "skinCluster1.ma[7]";
connectAttr "LLKnee.wm" "skinCluster1.ma[8]";
connectAttr "LLAnkleUpper.wm" "skinCluster1.ma[9]";
connectAttr "LLAnkleLower.wm" "skinCluster1.ma[10]";
connectAttr "LLOutsidetwoRoot.wm" "skinCluster1.ma[11]";
connectAttr "LLMidToe2E.wm" "skinCluster1.ma[12]";
connectAttr "LLFootHeel.wm" "skinCluster1.ma[13]";
connectAttr "RLHip.wm" "skinCluster1.ma[14]";
connectAttr "RLKnee.wm" "skinCluster1.ma[15]";
connectAttr "RLAnkleUpper.wm" "skinCluster1.ma[16]";
connectAttr "RLAnkleLower.wm" "skinCluster1.ma[17]";
connectAttr "RLOutsidetwoRoot.wm" "skinCluster1.ma[18]";
connectAttr "RLMidToe2E.wm" "skinCluster1.ma[19]";
connectAttr "RLFootHeel.wm" "skinCluster1.ma[20]";
connectAttr "Spine1.wm" "skinCluster1.ma[21]";
connectAttr "Spine2.wm" "skinCluster1.ma[22]";
connectAttr "Spine3.wm" "skinCluster1.ma[23]";
connectAttr "Spine4base.wm" "skinCluster1.ma[24]";
connectAttr "Neck.wm" "skinCluster1.ma[25]";
connectAttr "Head.wm" "skinCluster1.ma[26]";
connectAttr "Head_Top.wm" "skinCluster1.ma[27]";
connectAttr "Chin.wm" "skinCluster1.ma[28]";
connectAttr "LARoot.wm" "skinCluster1.ma[29]";
connectAttr "LAShoulder.wm" "skinCluster1.ma[30]";
connectAttr "LAElbow.wm" "skinCluster1.ma[31]";
connectAttr "LAWrist.wm" "skinCluster1.ma[32]";
connectAttr "LAFThumbRoot.wm" "skinCluster1.ma[33]";
connectAttr "LAFThumb1.wm" "skinCluster1.ma[34]";
connectAttr "LAThumb2.wm" "skinCluster1.ma[35]";
connectAttr "LAFThumb3.wm" "skinCluster1.ma[36]";
connectAttr "LAThumb4E.wm" "skinCluster1.ma[37]";
connectAttr "LAFPinkyRoot.wm" "skinCluster1.ma[38]";
connectAttr "LAFPinky1.wm" "skinCluster1.ma[39]";
connectAttr "LAFPinky2.wm" "skinCluster1.ma[40]";
connectAttr "LAFPinky3E.wm" "skinCluster1.ma[41]";
connectAttr "LAFPointerRoot.wm" "skinCluster1.ma[42]";
connectAttr "LAFPointer1.wm" "skinCluster1.ma[43]";
connectAttr "LAFPointer2.wm" "skinCluster1.ma[44]";
connectAttr "LAFPointer3E.wm" "skinCluster1.ma[45]";
connectAttr "LAFMiddleroot.wm" "skinCluster1.ma[46]";
connectAttr "LAFMiddle1.wm" "skinCluster1.ma[47]";
connectAttr "LAFMiddle2.wm" "skinCluster1.ma[48]";
connectAttr "LAFMiddle3E.wm" "skinCluster1.ma[49]";
connectAttr "RARoot.wm" "skinCluster1.ma[50]";
connectAttr "RAShoulder.wm" "skinCluster1.ma[51]";
connectAttr "RAElbow.wm" "skinCluster1.ma[52]";
connectAttr "RAWrist.wm" "skinCluster1.ma[53]";
connectAttr "RAFThumbRoot.wm" "skinCluster1.ma[54]";
connectAttr "RAFThumb1.wm" "skinCluster1.ma[55]";
connectAttr "RAThumb2.wm" "skinCluster1.ma[56]";
connectAttr "RAFThumb3.wm" "skinCluster1.ma[57]";
connectAttr "RAThumb4E.wm" "skinCluster1.ma[58]";
connectAttr "RAFPinkyRoot.wm" "skinCluster1.ma[59]";
connectAttr "RAFPinky1.wm" "skinCluster1.ma[60]";
connectAttr "RAFPinky2.wm" "skinCluster1.ma[61]";
connectAttr "RAFPinky3E.wm" "skinCluster1.ma[62]";
connectAttr "RAFPointerRoot.wm" "skinCluster1.ma[63]";
connectAttr "RAFPointer1.wm" "skinCluster1.ma[64]";
connectAttr "RAFPointer2.wm" "skinCluster1.ma[65]";
connectAttr "RAFPointer3E.wm" "skinCluster1.ma[66]";
connectAttr "RAFMiddleroot.wm" "skinCluster1.ma[67]";
connectAttr "RAFMiddle1.wm" "skinCluster1.ma[68]";
connectAttr "RAFMiddle2.wm" "skinCluster1.ma[69]";
connectAttr "RAFMiddle3E.wm" "skinCluster1.ma[70]";
connectAttr "Master.liw" "skinCluster1.lw[0]";
connectAttr "Tail1.liw" "skinCluster1.lw[1]";
connectAttr "Tail2.liw" "skinCluster1.lw[2]";
connectAttr "Tail3.liw" "skinCluster1.lw[3]";
connectAttr "Tail4.liw" "skinCluster1.lw[4]";
connectAttr "Tail5.liw" "skinCluster1.lw[5]";
connectAttr "Tail6E.liw" "skinCluster1.lw[6]";
connectAttr "LLHip.liw" "skinCluster1.lw[7]";
connectAttr "LLKnee.liw" "skinCluster1.lw[8]";
connectAttr "LLAnkleUpper.liw" "skinCluster1.lw[9]";
connectAttr "LLAnkleLower.liw" "skinCluster1.lw[10]";
connectAttr "LLOutsidetwoRoot.liw" "skinCluster1.lw[11]";
connectAttr "LLMidToe2E.liw" "skinCluster1.lw[12]";
connectAttr "LLFootHeel.liw" "skinCluster1.lw[13]";
connectAttr "RLHip.liw" "skinCluster1.lw[14]";
connectAttr "RLKnee.liw" "skinCluster1.lw[15]";
connectAttr "RLAnkleUpper.liw" "skinCluster1.lw[16]";
connectAttr "RLAnkleLower.liw" "skinCluster1.lw[17]";
connectAttr "RLOutsidetwoRoot.liw" "skinCluster1.lw[18]";
connectAttr "RLMidToe2E.liw" "skinCluster1.lw[19]";
connectAttr "RLFootHeel.liw" "skinCluster1.lw[20]";
connectAttr "Spine1.liw" "skinCluster1.lw[21]";
connectAttr "Spine2.liw" "skinCluster1.lw[22]";
connectAttr "Spine3.liw" "skinCluster1.lw[23]";
connectAttr "Spine4base.liw" "skinCluster1.lw[24]";
connectAttr "Neck.liw" "skinCluster1.lw[25]";
connectAttr "Head.liw" "skinCluster1.lw[26]";
connectAttr "Head_Top.liw" "skinCluster1.lw[27]";
connectAttr "Chin.liw" "skinCluster1.lw[28]";
connectAttr "LARoot.liw" "skinCluster1.lw[29]";
connectAttr "LAShoulder.liw" "skinCluster1.lw[30]";
connectAttr "LAElbow.liw" "skinCluster1.lw[31]";
connectAttr "LAWrist.liw" "skinCluster1.lw[32]";
connectAttr "LAFThumbRoot.liw" "skinCluster1.lw[33]";
connectAttr "LAFThumb1.liw" "skinCluster1.lw[34]";
connectAttr "LAThumb2.liw" "skinCluster1.lw[35]";
connectAttr "LAFThumb3.liw" "skinCluster1.lw[36]";
connectAttr "LAThumb4E.liw" "skinCluster1.lw[37]";
connectAttr "LAFPinkyRoot.liw" "skinCluster1.lw[38]";
connectAttr "LAFPinky1.liw" "skinCluster1.lw[39]";
connectAttr "LAFPinky2.liw" "skinCluster1.lw[40]";
connectAttr "LAFPinky3E.liw" "skinCluster1.lw[41]";
connectAttr "LAFPointerRoot.liw" "skinCluster1.lw[42]";
connectAttr "LAFPointer1.liw" "skinCluster1.lw[43]";
connectAttr "LAFPointer2.liw" "skinCluster1.lw[44]";
connectAttr "LAFPointer3E.liw" "skinCluster1.lw[45]";
connectAttr "LAFMiddleroot.liw" "skinCluster1.lw[46]";
connectAttr "LAFMiddle1.liw" "skinCluster1.lw[47]";
connectAttr "LAFMiddle2.liw" "skinCluster1.lw[48]";
connectAttr "LAFMiddle3E.liw" "skinCluster1.lw[49]";
connectAttr "RARoot.liw" "skinCluster1.lw[50]";
connectAttr "RAShoulder.liw" "skinCluster1.lw[51]";
connectAttr "RAElbow.liw" "skinCluster1.lw[52]";
connectAttr "RAWrist.liw" "skinCluster1.lw[53]";
connectAttr "RAFThumbRoot.liw" "skinCluster1.lw[54]";
connectAttr "RAFThumb1.liw" "skinCluster1.lw[55]";
connectAttr "RAThumb2.liw" "skinCluster1.lw[56]";
connectAttr "RAFThumb3.liw" "skinCluster1.lw[57]";
connectAttr "RAThumb4E.liw" "skinCluster1.lw[58]";
connectAttr "RAFPinkyRoot.liw" "skinCluster1.lw[59]";
connectAttr "RAFPinky1.liw" "skinCluster1.lw[60]";
connectAttr "RAFPinky2.liw" "skinCluster1.lw[61]";
connectAttr "RAFPinky3E.liw" "skinCluster1.lw[62]";
connectAttr "RAFPointerRoot.liw" "skinCluster1.lw[63]";
connectAttr "RAFPointer1.liw" "skinCluster1.lw[64]";
connectAttr "RAFPointer2.liw" "skinCluster1.lw[65]";
connectAttr "RAFPointer3E.liw" "skinCluster1.lw[66]";
connectAttr "RAFMiddleroot.liw" "skinCluster1.lw[67]";
connectAttr "RAFMiddle1.liw" "skinCluster1.lw[68]";
connectAttr "RAFMiddle2.liw" "skinCluster1.lw[69]";
connectAttr "RAFMiddle3E.liw" "skinCluster1.lw[70]";
connectAttr "RAShoulder.msg" "skinCluster1.ptt";
connectAttr "groupParts2.og" "tweak1.ip[0].ig";
connectAttr "groupId2.id" "tweak1.ip[0].gi";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "BodyShape.iog.og[8]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "tweak1.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupId2.msg" "tweakSet1.gn" -na;
connectAttr "BodyShape.iog.og[9]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "BodyShapeOrig.w" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "Lizzard.msg" "bindPose1.m[0]";
connectAttr "Master.msg" "bindPose1.m[1]";
connectAttr "Tail1.msg" "bindPose1.m[2]";
connectAttr "Tail2.msg" "bindPose1.m[3]";
connectAttr "Tail3.msg" "bindPose1.m[4]";
connectAttr "Tail4.msg" "bindPose1.m[5]";
connectAttr "Tail5.msg" "bindPose1.m[6]";
connectAttr "Tail6E.msg" "bindPose1.m[7]";
connectAttr "LLHip.msg" "bindPose1.m[8]";
connectAttr "LLKnee.msg" "bindPose1.m[9]";
connectAttr "LLAnkleUpper.msg" "bindPose1.m[10]";
connectAttr "LLAnkleLower.msg" "bindPose1.m[11]";
connectAttr "LLOutsidetwoRoot.msg" "bindPose1.m[12]";
connectAttr "LLMidToe2E.msg" "bindPose1.m[13]";
connectAttr "LLFootHeel.msg" "bindPose1.m[14]";
connectAttr "RLHip.msg" "bindPose1.m[15]";
connectAttr "RLKnee.msg" "bindPose1.m[16]";
connectAttr "RLAnkleUpper.msg" "bindPose1.m[17]";
connectAttr "RLAnkleLower.msg" "bindPose1.m[18]";
connectAttr "RLOutsidetwoRoot.msg" "bindPose1.m[19]";
connectAttr "RLMidToe2E.msg" "bindPose1.m[20]";
connectAttr "RLFootHeel.msg" "bindPose1.m[21]";
connectAttr "Spine1.msg" "bindPose1.m[22]";
connectAttr "Spine2.msg" "bindPose1.m[23]";
connectAttr "Spine3.msg" "bindPose1.m[24]";
connectAttr "Spine4base.msg" "bindPose1.m[25]";
connectAttr "Neck.msg" "bindPose1.m[26]";
connectAttr "Head.msg" "bindPose1.m[27]";
connectAttr "Head_Top.msg" "bindPose1.m[28]";
connectAttr "Chin.msg" "bindPose1.m[29]";
connectAttr "LARoot.msg" "bindPose1.m[30]";
connectAttr "LAShoulder.msg" "bindPose1.m[31]";
connectAttr "LAElbow.msg" "bindPose1.m[32]";
connectAttr "LAWrist.msg" "bindPose1.m[33]";
connectAttr "LAFThumbRoot.msg" "bindPose1.m[34]";
connectAttr "LAFThumb1.msg" "bindPose1.m[35]";
connectAttr "LAThumb2.msg" "bindPose1.m[36]";
connectAttr "LAFThumb3.msg" "bindPose1.m[37]";
connectAttr "LAThumb4E.msg" "bindPose1.m[38]";
connectAttr "LAFPinkyRoot.msg" "bindPose1.m[39]";
connectAttr "LAFPinky1.msg" "bindPose1.m[40]";
connectAttr "LAFPinky2.msg" "bindPose1.m[41]";
connectAttr "LAFPinky3E.msg" "bindPose1.m[42]";
connectAttr "LAFPointerRoot.msg" "bindPose1.m[43]";
connectAttr "LAFPointer1.msg" "bindPose1.m[44]";
connectAttr "LAFPointer2.msg" "bindPose1.m[45]";
connectAttr "LAFPointer3E.msg" "bindPose1.m[46]";
connectAttr "LAFMiddleroot.msg" "bindPose1.m[47]";
connectAttr "LAFMiddle1.msg" "bindPose1.m[48]";
connectAttr "LAFMiddle2.msg" "bindPose1.m[49]";
connectAttr "LAFMiddle3E.msg" "bindPose1.m[50]";
connectAttr "RARoot.msg" "bindPose1.m[51]";
connectAttr "RAShoulder.msg" "bindPose1.m[52]";
connectAttr "RAElbow.msg" "bindPose1.m[53]";
connectAttr "RAWrist.msg" "bindPose1.m[54]";
connectAttr "RAFThumbRoot.msg" "bindPose1.m[55]";
connectAttr "RAFThumb1.msg" "bindPose1.m[56]";
connectAttr "RAThumb2.msg" "bindPose1.m[57]";
connectAttr "RAFThumb3.msg" "bindPose1.m[58]";
connectAttr "RAThumb4E.msg" "bindPose1.m[59]";
connectAttr "RAFPinkyRoot.msg" "bindPose1.m[60]";
connectAttr "RAFPinky1.msg" "bindPose1.m[61]";
connectAttr "RAFPinky2.msg" "bindPose1.m[62]";
connectAttr "RAFPinky3E.msg" "bindPose1.m[63]";
connectAttr "RAFPointerRoot.msg" "bindPose1.m[64]";
connectAttr "RAFPointer1.msg" "bindPose1.m[65]";
connectAttr "RAFPointer2.msg" "bindPose1.m[66]";
connectAttr "RAFPointer3E.msg" "bindPose1.m[67]";
connectAttr "RAFMiddleroot.msg" "bindPose1.m[68]";
connectAttr "RAFMiddle1.msg" "bindPose1.m[69]";
connectAttr "RAFMiddle2.msg" "bindPose1.m[70]";
connectAttr "RAFMiddle3E.msg" "bindPose1.m[71]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[5]" "bindPose1.p[6]";
connectAttr "bindPose1.m[6]" "bindPose1.p[7]";
connectAttr "bindPose1.m[1]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[9]" "bindPose1.p[10]";
connectAttr "bindPose1.m[10]" "bindPose1.p[11]";
connectAttr "bindPose1.m[11]" "bindPose1.p[12]";
connectAttr "bindPose1.m[12]" "bindPose1.p[13]";
connectAttr "bindPose1.m[11]" "bindPose1.p[14]";
connectAttr "bindPose1.m[1]" "bindPose1.p[15]";
connectAttr "bindPose1.m[15]" "bindPose1.p[16]";
connectAttr "bindPose1.m[16]" "bindPose1.p[17]";
connectAttr "bindPose1.m[17]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "bindPose1.m[19]" "bindPose1.p[20]";
connectAttr "bindPose1.m[18]" "bindPose1.p[21]";
connectAttr "bindPose1.m[1]" "bindPose1.p[22]";
connectAttr "bindPose1.m[22]" "bindPose1.p[23]";
connectAttr "bindPose1.m[23]" "bindPose1.p[24]";
connectAttr "bindPose1.m[24]" "bindPose1.p[25]";
connectAttr "bindPose1.m[25]" "bindPose1.p[26]";
connectAttr "bindPose1.m[26]" "bindPose1.p[27]";
connectAttr "bindPose1.m[27]" "bindPose1.p[28]";
connectAttr "bindPose1.m[27]" "bindPose1.p[29]";
connectAttr "bindPose1.m[25]" "bindPose1.p[30]";
connectAttr "bindPose1.m[30]" "bindPose1.p[31]";
connectAttr "bindPose1.m[31]" "bindPose1.p[32]";
connectAttr "bindPose1.m[32]" "bindPose1.p[33]";
connectAttr "bindPose1.m[33]" "bindPose1.p[34]";
connectAttr "bindPose1.m[34]" "bindPose1.p[35]";
connectAttr "bindPose1.m[35]" "bindPose1.p[36]";
connectAttr "bindPose1.m[36]" "bindPose1.p[37]";
connectAttr "bindPose1.m[37]" "bindPose1.p[38]";
connectAttr "bindPose1.m[33]" "bindPose1.p[39]";
connectAttr "bindPose1.m[39]" "bindPose1.p[40]";
connectAttr "bindPose1.m[40]" "bindPose1.p[41]";
connectAttr "bindPose1.m[41]" "bindPose1.p[42]";
connectAttr "bindPose1.m[33]" "bindPose1.p[43]";
connectAttr "bindPose1.m[43]" "bindPose1.p[44]";
connectAttr "bindPose1.m[44]" "bindPose1.p[45]";
connectAttr "bindPose1.m[45]" "bindPose1.p[46]";
connectAttr "bindPose1.m[33]" "bindPose1.p[47]";
connectAttr "bindPose1.m[47]" "bindPose1.p[48]";
connectAttr "bindPose1.m[48]" "bindPose1.p[49]";
connectAttr "bindPose1.m[49]" "bindPose1.p[50]";
connectAttr "bindPose1.m[25]" "bindPose1.p[51]";
connectAttr "bindPose1.m[51]" "bindPose1.p[52]";
connectAttr "bindPose1.m[52]" "bindPose1.p[53]";
connectAttr "bindPose1.m[53]" "bindPose1.p[54]";
connectAttr "bindPose1.m[54]" "bindPose1.p[55]";
connectAttr "bindPose1.m[55]" "bindPose1.p[56]";
connectAttr "bindPose1.m[56]" "bindPose1.p[57]";
connectAttr "bindPose1.m[57]" "bindPose1.p[58]";
connectAttr "bindPose1.m[58]" "bindPose1.p[59]";
connectAttr "bindPose1.m[54]" "bindPose1.p[60]";
connectAttr "bindPose1.m[60]" "bindPose1.p[61]";
connectAttr "bindPose1.m[61]" "bindPose1.p[62]";
connectAttr "bindPose1.m[62]" "bindPose1.p[63]";
connectAttr "bindPose1.m[54]" "bindPose1.p[64]";
connectAttr "bindPose1.m[64]" "bindPose1.p[65]";
connectAttr "bindPose1.m[65]" "bindPose1.p[66]";
connectAttr "bindPose1.m[66]" "bindPose1.p[67]";
connectAttr "bindPose1.m[54]" "bindPose1.p[68]";
connectAttr "bindPose1.m[68]" "bindPose1.p[69]";
connectAttr "bindPose1.m[69]" "bindPose1.p[70]";
connectAttr "bindPose1.m[70]" "bindPose1.p[71]";
connectAttr "Master.bps" "bindPose1.wm[1]";
connectAttr "Tail1.bps" "bindPose1.wm[2]";
connectAttr "Tail2.bps" "bindPose1.wm[3]";
connectAttr "Tail3.bps" "bindPose1.wm[4]";
connectAttr "Tail4.bps" "bindPose1.wm[5]";
connectAttr "Tail5.bps" "bindPose1.wm[6]";
connectAttr "Tail6E.bps" "bindPose1.wm[7]";
connectAttr "LLHip.bps" "bindPose1.wm[8]";
connectAttr "LLKnee.bps" "bindPose1.wm[9]";
connectAttr "LLAnkleUpper.bps" "bindPose1.wm[10]";
connectAttr "LLAnkleLower.bps" "bindPose1.wm[11]";
connectAttr "LLOutsidetwoRoot.bps" "bindPose1.wm[12]";
connectAttr "LLMidToe2E.bps" "bindPose1.wm[13]";
connectAttr "LLFootHeel.bps" "bindPose1.wm[14]";
connectAttr "RLHip.bps" "bindPose1.wm[15]";
connectAttr "RLKnee.bps" "bindPose1.wm[16]";
connectAttr "RLAnkleUpper.bps" "bindPose1.wm[17]";
connectAttr "RLAnkleLower.bps" "bindPose1.wm[18]";
connectAttr "RLOutsidetwoRoot.bps" "bindPose1.wm[19]";
connectAttr "RLMidToe2E.bps" "bindPose1.wm[20]";
connectAttr "RLFootHeel.bps" "bindPose1.wm[21]";
connectAttr "Spine1.bps" "bindPose1.wm[22]";
connectAttr "Spine2.bps" "bindPose1.wm[23]";
connectAttr "Spine3.bps" "bindPose1.wm[24]";
connectAttr "Spine4base.bps" "bindPose1.wm[25]";
connectAttr "Neck.bps" "bindPose1.wm[26]";
connectAttr "Head.bps" "bindPose1.wm[27]";
connectAttr "Head_Top.bps" "bindPose1.wm[28]";
connectAttr "Chin.bps" "bindPose1.wm[29]";
connectAttr "LARoot.bps" "bindPose1.wm[30]";
connectAttr "LAShoulder.bps" "bindPose1.wm[31]";
connectAttr "LAElbow.bps" "bindPose1.wm[32]";
connectAttr "LAWrist.bps" "bindPose1.wm[33]";
connectAttr "LAFThumbRoot.bps" "bindPose1.wm[34]";
connectAttr "LAFThumb1.bps" "bindPose1.wm[35]";
connectAttr "LAThumb2.bps" "bindPose1.wm[36]";
connectAttr "LAFThumb3.bps" "bindPose1.wm[37]";
connectAttr "LAThumb4E.bps" "bindPose1.wm[38]";
connectAttr "LAFPinkyRoot.bps" "bindPose1.wm[39]";
connectAttr "LAFPinky1.bps" "bindPose1.wm[40]";
connectAttr "LAFPinky2.bps" "bindPose1.wm[41]";
connectAttr "LAFPinky3E.bps" "bindPose1.wm[42]";
connectAttr "LAFPointerRoot.bps" "bindPose1.wm[43]";
connectAttr "LAFPointer1.bps" "bindPose1.wm[44]";
connectAttr "LAFPointer2.bps" "bindPose1.wm[45]";
connectAttr "LAFPointer3E.bps" "bindPose1.wm[46]";
connectAttr "LAFMiddleroot.bps" "bindPose1.wm[47]";
connectAttr "LAFMiddle1.bps" "bindPose1.wm[48]";
connectAttr "LAFMiddle2.bps" "bindPose1.wm[49]";
connectAttr "LAFMiddle3E.bps" "bindPose1.wm[50]";
connectAttr "RARoot.bps" "bindPose1.wm[51]";
connectAttr "RAShoulder.bps" "bindPose1.wm[52]";
connectAttr "RAElbow.bps" "bindPose1.wm[53]";
connectAttr "RAWrist.bps" "bindPose1.wm[54]";
connectAttr "RAFThumbRoot.bps" "bindPose1.wm[55]";
connectAttr "RAFThumb1.bps" "bindPose1.wm[56]";
connectAttr "RAThumb2.bps" "bindPose1.wm[57]";
connectAttr "RAFThumb3.bps" "bindPose1.wm[58]";
connectAttr "RAThumb4E.bps" "bindPose1.wm[59]";
connectAttr "RAFPinkyRoot.bps" "bindPose1.wm[60]";
connectAttr "RAFPinky1.bps" "bindPose1.wm[61]";
connectAttr "RAFPinky2.bps" "bindPose1.wm[62]";
connectAttr "RAFPinky3E.bps" "bindPose1.wm[63]";
connectAttr "RAFPointerRoot.bps" "bindPose1.wm[64]";
connectAttr "RAFPointer1.bps" "bindPose1.wm[65]";
connectAttr "RAFPointer2.bps" "bindPose1.wm[66]";
connectAttr "RAFPointer3E.bps" "bindPose1.wm[67]";
connectAttr "RAFMiddleroot.bps" "bindPose1.wm[68]";
connectAttr "RAFMiddle1.bps" "bindPose1.wm[69]";
connectAttr "RAFMiddle2.bps" "bindPose1.wm[70]";
connectAttr "RAFMiddle3E.bps" "bindPose1.wm[71]";
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "BodyShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
connectAttr "LLFootHeel.msg" ":hyperGraphLayout.hyp[56].dn";
connectAttr "LLMidToe2E.msg" ":hyperGraphLayout.hyp[67].dn";
connectAttr "RLHip.msg" ":hyperGraphLayout.hyp[68].dn";
connectAttr "LLHip.msg" ":hyperGraphLayout.hyp[69].dn";
connectAttr "effector4.msg" ":hyperGraphLayout.hyp[76].dn";
connectAttr "LAFThumbRoot.msg" ":hyperGraphLayout.hyp[77].dn";
connectAttr "LAFPinkyRoot.msg" ":hyperGraphLayout.hyp[78].dn";
connectAttr "LAFPointerRoot.msg" ":hyperGraphLayout.hyp[79].dn";
connectAttr "LAFMiddleroot.msg" ":hyperGraphLayout.hyp[80].dn";
connectAttr "LARoot.msg" ":hyperGraphLayout.hyp[81].dn";
// End of lizzard 1 strike.ma
