#!/bin/bash

declare -r app_version='V 1.0.0'

OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'
	

#Looking for Sycamorte
function hunt_monster(){
	curl --silent -k  -X $'GET' \
		-H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0' -H $'X-Requested-With: XMLHttpRequest' -H $'Referer: http://www.gaiaonline.com/pets/lite' -H $'If-None-Match: \"3821701555\"-gzip' \
		-b $'gaia55_tag=14985325121940174107; gaia55_prp=384; _ga=GA1.2.1725442208.1498532519; __utma=111702034.1725442208.1498532519.1500295681.1500372931.29; __utmz=111702034.1498532521.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); __gads=ID=398197a355f3a67b:T=1498533333:S=ALNI_MamjmJol3YgvngVaw823rCBJErdPQ; footer_display_state=2; gaia55_trk=7620_1499500590; __qca=P0-1838028001-1499058700594; sm_dapi_session=1; gaia55_authpath=%2Fauth%2Flogin%2F%23signed-aa576a5510dcfe6ccb4564c8cd001871; gaia55_sid=l86e4lcoc84b9b0d9e53aac0d8n2gu7dnomnng8ohti8lcmk; mcim=13793795%26d4bae6d922b8259ef94d97099526b4b9; hdr_town_name=barton%2381c279df4f57cecd5c2f1eb4d3d77a87; _clt=26.0.0; _gid=GA1.2.1820675991.1500520168' \
		$'http://www.gaiaonline.com/pets/api/battle/selectenv?env_id=23' > batt_env.txt &
		wait
		
	MONSTER_ID=$(cat batt_env.txt | grep -Po  'base_id":"\K[0-9]+')
	BATTLE_ID=$(cat batt_env.txt | grep -Po  'battle_id":"\K[0-9]+') 
	
	#If Monster not Sycamorte
	# 10184991 Sycamorte
	# 10167989 Autumn Poucher
	if [ "$MONSTER_ID" == 10184991 ]; then
	   echo -e "$OKGREEN	[✔-OK!]:: Sycamorte Found and battle ID is: $BATTLE_ID! $RESET"
	else
	   echo -e "$OKRED	[X-FAILED!]:: Not a Sycamorte! $RESET"
	   sleep 10
	   start_main
	fi
}

# Choose Sandman Rose!
function init_pet(){
	
	BATTLE_ID=$(cat batt_env.txt | grep -Po  'battle_id":"\K[0-9]+') 
	
	echo -e "$OKORANGE	[✔-OK!]:: Sandman-Rose has been selected for Battle"
	
	#Choose Sandman-Rose-Pet
	curl --silent -k  -X $'GET' \
	-H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0' -H $'X-Requested-With: XMLHttpRequest' -H $'Referer: http://www.gaiaonline.com/pets/lite' -H $'If-None-Match: \"3821701555\"-gzip' \
	-b $'gaia55_tag=14985325121940174107; gaia55_prp=384; _ga=GA1.2.1725442208.1498532519; __utma=111702034.1725442208.1498532519.1500295681.1500372931.29; __utmz=111702034.1498532521.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); __gads=ID=398197a355f3a67b:T=1498533333:S=ALNI_MamjmJol3YgvngVaw823rCBJErdPQ; footer_display_state=2; gaia55_trk=7620_1499500590; __qca=P0-1838028001-1499058700594; sm_dapi_session=1; gaia55_authpath=%2Fauth%2Flogin%2F%23signed-aa576a5510dcfe6ccb4564c8cd001871; gaia55_sid=l86e4lcoc84b9b0d9e53aac0d8n2gu7dnomnng8ohti8lcmk; mcim=13793795%26d4bae6d922b8259ef94d97099526b4b9; hdr_town_name=barton%2381c279df4f57cecd5c2f1eb4d3d77a87; _clt=26.0.0; _gid=GA1.2.1820675991.1500520168' \
    $'http://www.gaiaonline.com/pets/api/battle/selectpet?battle_id='$BATTLE_ID'&pet_id=199749'	> pet_stat.txt 	
	sleep 8
}

#Read Stat
function init_stat(){
	#Check Pet and Enemy HP
	ENEMY_HP=$(cat pet_stat.txt | grep -Po  'receptor_hp":\K[0-9]+') 
	PET_HP=$(cat pet_stat.txt | grep -Po  'initiator_hp":\K[0-9]+')
	#Pet_Stamina
	#Pet_MP
	
	echo -e "$OKORANGE	[✔-OK!]:: Pet HP: "$PET_HP" Current Enemy HP: "$ENEMY_HP $RESET
}

#Attacking
function init_attack(){
	BATTLE_ID=$(cat batt_env.txt | grep -Po  'battle_id":"\K[0-9]+') 
	
	echo -e "$OKBLUE	[✔-OK!]:: Sandman-Rose turns to attack"
	
	curl --silent -k  -X $'GET' \
	-H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0' -H $'X-Requested-With: XMLHttpRequest' -H $'Referer: http://www.gaiaonline.com/pets/lite' -H $'If-None-Match: \"3821701555\"-gzip' \
	-b $'gaia55_tag=14985325121940174107; gaia55_prp=384; _ga=GA1.2.1725442208.1498532519; __utma=111702034.1725442208.1498532519.1500295681.1500372931.29; __utmz=111702034.1498532521.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); __gads=ID=398197a355f3a67b:T=1498533333:S=ALNI_MamjmJol3YgvngVaw823rCBJErdPQ; footer_display_state=2; gaia55_trk=7620_1499500590; __qca=P0-1838028001-1499058700594; sm_dapi_session=1; gaia55_authpath=%2Fauth%2Flogin%2F%23signed-aa576a5510dcfe6ccb4564c8cd001871; gaia55_sid=l86e4lcoc84b9b0d9e53aac0d8n2gu7dnomnng8ohti8lcmk; mcim=13793795%26d4bae6d922b8259ef94d97099526b4b9; hdr_town_name=barton%2381c279df4f57cecd5c2f1eb4d3d77a87; _clt=26.0.0; _gid=GA1.2.1820675991.1500520168' \
	$'http://www.gaiaonline.com/pets/api/battle/doplayerturn?battle_id='$BATTLE_ID'&skill_id=101&turn=initiator' > pet_stat.txt

	check_error
	init_stat	
	sleep 8
}

#Healing
function init_heal(){
	BATTLE_ID=$(cat batt_env.txt | grep -Po  'battle_id":"\K[0-9]+') 
	
	echo -e "$OKBLUE	[✔-OK!]:: Sandman-Rose Hurts! Casting Heal... $RESET"
	#Healing				
	curl --silent -k  -X $'GET' \
	-H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0' -H $'X-Requested-With: XMLHttpRequest' -H $'Referer: http://www.gaiaonline.com/pets/lite' -H $'If-None-Match: \"3821701555\"-gzip' \
	-b $'gaia55_tag=14985325121940174107; gaia55_prp=384; _ga=GA1.2.1725442208.1498532519; __utma=111702034.1725442208.1498532519.1500295681.1500372931.29; __utmz=111702034.1498532521.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); __gads=ID=398197a355f3a67b:T=1498533333:S=ALNI_MamjmJol3YgvngVaw823rCBJErdPQ; footer_display_state=2; gaia55_trk=7620_1499500590; __qca=P0-1838028001-1499058700594; sm_dapi_session=1; gaia55_authpath=%2Fauth%2Flogin%2F%23signed-aa576a5510dcfe6ccb4564c8cd001871; gaia55_sid=l86e4lcoc84b9b0d9e53aac0d8n2gu7dnomnng8ohti8lcmk; mcim=13793795%26d4bae6d922b8259ef94d97099526b4b9; hdr_town_name=barton%2381c279df4f57cecd5c2f1eb4d3d77a87; _clt=26.0.0; _gid=GA1.2.1820675991.1500520168' \
	$'http://www.gaiaonline.com/pets/api/battle/doplayerturn?battle_id='$BATTLE_ID'&skill_id=187&turn=initiator' > pet_stat.txt
	check_error
	init_stat
	sleep 8	
}

#Enemy Turn
function init_enemy_turn(){
	BATTLE_ID=$(cat batt_env.txt | grep -Po  'battle_id":"\K[0-9]+') 
	
	#Receieve Attack
	echo -e "$OKRED	[X-BRACE!]:: Sandman-Rose being attacked! $RESET"
	curl --silent -k  -X $'GET' \
	-H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0' -H $'X-Requested-With: XMLHttpRequest' -H $'Referer: http://www.gaiaonline.com/pets/lite' -H $'If-None-Match: \"3821701555\"-gzip' \
	-b $'gaia55_tag=14985325121940174107; gaia55_prp=384; _ga=GA1.2.1725442208.1498532519; __utma=111702034.1725442208.1498532519.1500295681.1500372931.29; __utmz=111702034.1498532521.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); __gads=ID=398197a355f3a67b:T=1498533333:S=ALNI_MamjmJol3YgvngVaw823rCBJErdPQ; footer_display_state=2; gaia55_trk=7620_1499500590; __qca=P0-1838028001-1499058700594; sm_dapi_session=1; gaia55_authpath=%2Fauth%2Flogin%2F%23signed-aa576a5510dcfe6ccb4564c8cd001871; gaia55_sid=l86e4lcoc84b9b0d9e53aac0d8n2gu7dnomnng8ohti8lcmk; mcim=13793795%26d4bae6d922b8259ef94d97099526b4b9; hdr_town_name=barton%2381c279df4f57cecd5c2f1eb4d3d77a87; _clt=26.0.0; _gid=GA1.2.1820675991.1500520168' \
	$'http://www.gaiaonline.com/pets/api/battle/doplayerturn?battle_id='$BATTLE_ID'&turn=receptor' > pet_stat.txt 
	check_error
	init_stat
	sleep 8	
}

#Winning
function init_win(){
	BATTLE_ID=$(cat batt_env.txt | grep -Po  'battle_id":"\K[0-9]+') 
	
	#Winning Process
	echo -e "$OKGREEN	[✔-OK!]:: Battle End With Success! $RESET"
	curl --silent -k  -X $'GET' \
	-H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0' -H $'X-Requested-With: XMLHttpRequest' -H $'Referer: http://www.gaiaonline.com/pets/lite' -H $'If-None-Match: \"3821701555\"-gzip' \
	-b $'gaia55_tag=14985325121940174107; gaia55_prp=384; _ga=GA1.2.1725442208.1498532519; __utma=111702034.1725442208.1498532519.1500295681.1500372931.29; __utmz=111702034.1498532521.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); __gads=ID=398197a355f3a67b:T=1498533333:S=ALNI_MamjmJol3YgvngVaw823rCBJErdPQ; footer_display_state=2; gaia55_trk=7620_1499500590; __qca=P0-1838028001-1499058700594; sm_dapi_session=1; gaia55_authpath=%2Fauth%2Flogin%2F%23signed-aa576a5510dcfe6ccb4564c8cd001871; gaia55_sid=l86e4lcoc84b9b0d9e53aac0d8n2gu7dnomnng8ohti8lcmk; mcim=13793795%26d4bae6d922b8259ef94d97099526b4b9; hdr_town_name=barton%2381c279df4f57cecd5c2f1eb4d3d77a87; _clt=26.0.0; _gid=GA1.2.1820675991.1500520168' \
	$'http://www.gaiaonline.com/pets/api/battle/finishBattle?battle_id='$BATTLE_ID''  > win_stat.txt
		
	#Check if General Error
	FAIL_STATUS=$(cat win_stat.txt | grep -Po  'status":"\K[a-z]+')
	
	if [ $FAIL_STATUS = "fail" ];then
		echo -e "$OKRED	[X-FAIL!]:: Error! Reward blocked by captcha! $RESET"
		exit 1
	else
		REWARD_TYPE=$(cat win_stat.txt | grep -Po  'type":"\K[a-z]+')
		REWARD_QUANTITY=$(cat win_stat.txt | grep -Po  'quantity":\K[0-9]+')
		echo -e "$OKGREEN	[✔ Your Battle Reward is $REWARD_TYPE with amount of $REWARD_QUANTITY ✔] $RESET"
	fi
	
	sleep 10
	
	echo
	echo
	echo -e "$OKGREEN	[✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔ :: Restarting Battle :: ✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔] $RESET"
	echo
	echo
	start_main

}

#Check enemy hp
function check_enemy_hp(){
	#Check Enemy HP
	ENEMY_HP=$(cat pet_stat.txt | grep -Po  'receptor_hp":\K[0-9]+')
	if [ $ENEMY_HP -eq 0 ]; then
		init_win
	fi
}


#Check error status
function check_error(){
	#Check if General Error
	FAIL_STATUS=$(cat pet_stat.txt | grep -Po  'status":"\K[a-z]+')
	if [ $FAIL_STATUS = "fail" ];then
		echo -e "$OKRED	[X-FAIL!]:: Error! Lack of Stamina or you dead! $RESET"
		exit 1
	fi
}


function start_main(){
	hunt_monster
	init_pet
	init_attack
	check_enemy_hp
	
	CONTINUE_ATTACK=true
	
	while $CONTINUE_ATTACK; 
	do
		
		init_enemy_turn
		
		#Check Pet and Enemy HP
		ENEMY_HP=$(cat pet_stat.txt | grep -Po  'receptor_hp":\K[0-9]+') 
		PET_HP=$(cat pet_stat.txt | grep -Po  'initiator_hp":\K[0-9]+')
		
		#check for error
		check_error
		
		
		if [ "$ENEMY_HP" -eq 0 ]; then
			init_win
			CONTINUE_ATTACK=false
		else			
			if [ "$PET_HP" -eq 0 ]; then
				echo -e "$OKRED	[X-FAIL!]:: Ouchh! Sandman-Rose was dead in battle.. $RESET"
				CONTINUE_ATTACK=false
				sleep 5
				start_main
			elif [ "$PET_HP" -lt 420 ] && [ "$ENEMY_HP" -gt 700 ]; then
				init_heal
			else
				init_attack				
				check_enemy_hp
			fi
		fi
	done		
}

start_main
