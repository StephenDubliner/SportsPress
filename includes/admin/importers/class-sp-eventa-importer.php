<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if ( class_exists( 'WP_Importer' ) ) {
	class SP_EventA_Importer extends SP_Importer {

		/**
		 * __construct function.
		 *
		 * @access public
		 * @return void
		 */
		public function __construct() {
			$this->import_page = 'sp_eventA_csv';
			$this->import_label = __( 'Import randomly generated Events', 'sportspress' );
			$this->columns = array(
				'post_date' => __( 'Date', 'sportspress' ),
				//'post_time' => __( 'Time', 'sportspress' ),
				'sp_venue' => __( 'Venue', 'sportspress' ),
				//'sp_team' => __( 'Teams', 'sportspress' ),
				'sp_grade' => __( 'Grade', 'sportspress' ),
				'sp_section' => __( 'Section', 'sportspress' ),
				'sp_player' => __( 'Players', 'sportspress' ),
				'sp_outcome' => __( 'Outcome', 'sportspress' ),
				'sp_results' => __( 'Results', 'sportspress' ),
				'sp_games' => __( 'Games', 'sportspress' ),
			);
			//$performance_labels = sp_get_var_labels( 'sp_performance' );
			//if ( $performance_labels && is_array( $performance_labels ) && sizeof( $performance_labels ) )
			//	$this->columns = array_merge( $this->columns, $performance_labels );
		}

function teamNameFromPiped($input){
	$pa_name = null; 
	$pb_name = null;
	$result = null; //'unknown';
	$two_players = explode( '|', $input );
	sort($two_players);
	list($pa_name, $pb_name) = $two_players;
	$pa_name = trim($pa_name);
	$pb_name = trim($pb_name);
	if($pa_name == '' && $pb_name == '')
		return null;
	$unknown_player = 'unknknown';

	$result = $this->nvl($pa_name, $unknown_player) . ' with ' . $this->nvl($pb_name, $unknown_player); 

	return $result;
}
function nvl($val, $replace)
{
    if( is_null($val) || $val === '' )  return $replace;
    else                                return $val;
}
function delete_all_of_type() {

		$post_type = array('sp_event', 'sp_team', 'sp_player');
        $posts_to_delete = get_posts(
            array(
                'posts_per_page'    => -1,
                'post_status'       => 'publish',
                'post_type'         => $post_type,
                //'author'            => $author_id,
                'fields'            => 'ids', // Only get post ID's
            )
        );

        foreach ( $posts_to_delete as $post ) {
            //wp_trash_post( $post_from_author, false); // Set to False if you want to send them to Trash.
            wp_delete_post( $post, true);
        }
        $delete_count = sizeof($post_to_delete);
        $this->Trace('delete_count', $delete_count);
}

function build_match($commonDetails, $rowA, $rowB){

	$result = array();
	$result['matchDate'] = $this->nvl($commonDetails[0],'2019/01/01');
	$result['venue'] = $this->nvl($commonDetails[1],'Baldoyle');
	$result['matchSection'] = $this->nvl($commonDetails[3], 'MD');
	$result['matchGrade'] = $this->nvl($commonDetails[2], 11);

	$result['teams'] = array();
	$points_a = explode( '|', $rowA[1] );
	$points_b = explode( '|', $rowB[1] );
	// $this->Trace('points_a',$points_a);
	// $this->Trace('points_b',$points_b);
	$taTitle = $this->teamNameFromPiped($rowA[0]);
	$tbTitle = $this->teamNameFromPiped($rowB[0]);
	if($taTitle == null || $tbTitle == null)
	{
		$this->Trace('rowA',$rowA);
		$this->Trace('rowB',$rowB);
		return null;
	}

	$isFirstGame = true;
	$result['teams'][$taTitle]['results'] = array();
	$result['teams'][$tbTitle]['results'] = array();

	$result['teams'][$taTitle]['players'] = explode( '|', $rowA[0] );
	$result['teams'][$tbTitle]['players'] = explode( '|', $rowB[0] );
	$agw = 0;
	$agl = 0;
	foreach( $points_a as $gkey => $points ):
		if(intval($points) > intval($points_b[$gkey])){
			$agw = $agw + 1;
		}
		else
		{
			$agl = $agl + 1;
		}

		$game_key = null;
		if( $gkey == 0 ):
				$game_key = 'gap';
			elseif( $gkey == 1 ):
				$game_key = 'gbp';
			elseif( $gkey == 2 ):
				$game_key = 'gcp';
			elseif( $gkey == 3 ):
				$game_key = 'gdp';
			elseif( $gkey == 4 ):
				$game_key = 'gep';
		endif;
		$result['teams'][$taTitle]['results'][ $game_key ] = $points;
		$result['teams'][$tbTitle]['results'][ $game_key ] = $points_b[$gkey];

	endforeach;

	$result['teams'][$taTitle]['results']['gw'] = $agw;
	$result['teams'][$taTitle]['results']['gl'] = $agl;

	$result['teams'][$tbTitle]['results']['gw'] = $result['teams'][$taTitle]['results']['gl'];
	$result['teams'][$tbTitle]['results']['gl'] = $result['teams'][$taTitle]['results']['gw'];

//$this->Trace($taTitle.' gw', $result['teams'][$taTitle]['results']);
//$this->Trace($tbTitle.' gw', $result['teams'][$tbTitle]['results']);

	if($result['teams'][$taTitle]['results']['gw'] > $result['teams'][$tbTitle]['results']['gw']){
		$result['teams'][$taTitle]['outcomeLabel'] = 'Won';
		$result['teams'][$tbTitle]['outcomeLabel'] = 'Lost';
	}
	elseif($result['teams'][$taTitle]['results']['gw'] == $result['teams'][$tbTitle]['results']['gw']){
		$result['teams'][$taTitle]['outcomeLabel'] = 'Draw';
		$result['teams'][$tbTitle]['outcomeLabel'] = 'Draw';
	}
	else{
		$result['teams'][$taTitle]['outcomeLabel'] = 'Lost';
		$result['teams'][$tbTitle]['outcomeLabel'] = 'Won';
	}

	$result['matchTitle'] = $taTitle . ' ' . get_option( 'sportspress_event_teams_delimiter', 'vs' ) . ' ' . $tbTitle;
	return $result;
}

function trace($label, $o){
	//print_r('<br/>'.$label);
	//print_r($o);
	//print_r('<br/>');
	//error_log(print_r("$label: $o", true));
	error_log("$label:" . var_export($o, true));
	//error_log('q'. print_r($wpdb->queries, true));
}

function link_player($player, $league, $season, $match_id, $team_id){
$player1_name = $player['name'];
$pseudo = 'PS-' . $player1_name;
	$player1_id = null;
	$player1_number = null;
	$result = array();
	if(trim($player1_name) != ''):
$this->Trace('link_player',$player1_name);
	// Find out if player exists
	$player1_object = get_page_by_title( stripslashes( $player1_name ), OBJECT, 'sp_player' );

	// Get or insert player
	if ( $player1_object ):
$this->Trace('exists',$player1_name);
		// Make sure player is published
		if ( $player_object->post_status != 'publish' ):
			wp_update_post( array( 'ID' => $player_object->ID, 'post_status' => 'publish' ) );
		endif;

		// Get player ID
		$player1_id = $player1_object->ID;
$this->Trace('id',$player1_id);
		// Get player number
		$player1_number = get_post_meta( $player1_id, 'sp_number', true );

	else:
$this->Trace('new player',$player1_name);
		// Insert player
$post_title = 
//wp_strip_all_tags($pseudo);
wp_strip_all_tags( $player1_name );
		$player1_id = wp_insert_post( array( 'post_type' => 'sp_player', 'post_status' => 'publish', 'post_title' => $post_title) );

		// Flag as import
		update_post_meta( $player1_id, '_sp_import', 1 );

		// Update number
		update_post_meta( $player1_id, 'sp_number', $player1_id );
		update_post_meta( $player1_id, 'sp_nationality', mt_rand(0,1)?'irl':'fra' );

		// Get player number
		$player1_number = $player1_id;
		
		update_post_meta( $player1_id, 'sp_metrics', 
			array(
				'grade' => $player['grade'], 
				'pseudo' => $pseudo, 
				'usepseudo' => mt_rand(0,1) ? 'Y' : null,
				'bi' => $player1_id, 
				'height' => mt_rand(159,205), 
				'club' => mt_rand(0,1)?'SD':'DB', 
				'playrorl' => mt_rand(0,1)?'R':'L',
				'gender' => $player['gender']
				 ) );

	endif;

	// Update league
	if ( $league ):
		wp_set_object_terms( $player1_id, $league, 'sp_league', true );
	endif;

	// Update season
	if ( $season ):
		wp_set_object_terms( $player1_id, $season, 'sp_season', true );
	endif;



	// Get player teams
	$player_teams = get_post_meta( $player1_id, 'sp_team', false );
	$current_team = get_post_meta( $player1_id, 'sp_current_team', true );
	$past_teams = get_post_meta( $player1_id, 'sp_past_team', false );

	// Add team if not exists in player
	if ( ! in_array( $team_id, $player_teams ) ):
		add_post_meta( $player1_id, 'sp_team', $team_id );
	endif;

	// Add as past team or set current team if not set
	if ( ! $current_team ):
		update_post_meta( $player1_id, 'sp_current_team', $team_id );
	elseif ( $current_team != $team_id && ! in_array( $team_id, $past_teams ) ):
		add_post_meta( $player1_id, 'sp_past_team', $team_id );
	endif;
	
	if ( $match_id ):
		add_post_meta( $match_id, 'sp_player', $player1_id );
	endif;

	endif;
	$result = array('player_id' => $player1_id,'player_number' => $player1_number);

	return $result;
}
function match_hash($match){
//match id: date, venue, league, grade, section, pa_id or pb_id, pc_id or pd_id
	list($ta, $tb) = array_keys($match['teams']);
	$result = $match['matchDate'] 
	. $match['venue'] 
	. $match['league'] 
	. $match['matchGrade'] 
	. $match['matchSection'] 
	. $ta 
	. $tb;

	return $result;
}
function import_matches( $array = array(), $event_meta = array(), $columns = array( 'post_title' ) ) {

	$rows = array_chunk( $array, 8 );//sizeof( $columns )
	$event_format = $this->nvl($event_meta['event_format'], 'league');;
	$league = $this->nvl($event_meta['league'], -1);;
	$season = $this->nvl($event_meta['season'], -1);
	$date_format = $this->nvl($event_meta['date_format'],'yyyy/mm/dd');

	// Get labels from result and performance post types
	$result_labels = sp_get_var_labels( 'sp_result' );
	$performance_labels = sp_get_var_labels( 'sp_performance' );

	//tbd
	$matchImportIdx = 0;
	$importSize = sizeof($rows);
	//if($importSize%2 <> 0)
	//exit();
	$matches = array();
	$teamaName = $teambName = null;
	while ( $matchImportIdx < $importSize ):

	$row_check = array_filter( $rows[$matchImportIdx] );

	if ( !empty( $row_check ) ) {
		$commonDetails = array_slice( $rows[$matchImportIdx], 0, 3 );
		$rowA = array_slice( $rows[$matchImportIdx], 4);
		$rowB = array_slice( $rows[$matchImportIdx+1], 4);
		$match = $this->build_match($commonDetails, $rowA, $rowB);
		if($match != null)
			array_push ($matches, $match);
		//array_push ($matches, $this->build_random_match());
	}
	$matchImportIdx += 2;
	endwhile;
	$mc = sizeof($matches);
	$this->Trace('processing matches', $mc);
	foreach ( $matches as $match ):

		$match_check = array_filter( $match );
		if ( empty( $match_check ) ) continue;
		$match_hash = $this->match_hash($match);
		//$this->Trace('match_hash', $match_hash);

		global $post;
		$cc_args = array(
		    'posts_per_page'   => -1,
		    'post_type'        => 'sp_event',
		    'post_status' 	   => 'publish',
		    'meta_key'         => 'sp_event_hash',
		    'meta_value'       => $match_hash
		);
		$events_q = new WP_Query( $cc_args );

		$match_id = null;

//$this->delete_all_post_to_delete(-1);

if($events_q->have_posts()):
	$events_q->the_post();
	$match_id = $post->ID;

	//$this->Trace('ev', $post);
	$this->Trace('match skipped', $match_hash);
	$this->skipped++;
	continue;
else:
		$args = array( 'post_type' => 'sp_event', 'post_status' => 'publish', 'post_date' => $date, 'post_title' => $match['matchTitle'] );

	// Insert event
	$match_id = wp_insert_post( $args );
	$this->Trace('match_id created', $match_id);
	update_post_meta( $match_id, 'sp_event_hash', $match_hash );
endif;
	//$this->Trace('match', $match);
	//$this->Trace('match_hash', $match_hash);
	// Define post type args


	// Flag as import
	update_post_meta( $match_id, '_sp_import', 1 );

	// Update event format
	if ( $event_format ):
		update_post_meta( $match_id, 'sp_format', $event_format );
	endif;

	// Update league
	if ( $league ):
		wp_set_object_terms( $match_id, $league, 'sp_league', false );
	endif;

	// Update season
	if ( $season ):
		wp_set_object_terms( $match_id, $season, 'sp_season', false );
	endif;

	// Update venue
	wp_set_object_terms( $match_id, $match['venue'], 'sp_venue', false );

	$players = array();
	foreach ( $match['teams'] as $team_name => $team_match_data ):

		// Find out if team exists
		$team_object = get_page_by_title( stripslashes( $team_name ), OBJECT, 'sp_team' );

		$team_id = null;
		// Get or insert team
		if ( $team_object ):

			// Make sure team is published
			if ( $team_object->post_status != 'publish' ):
				wp_update_post( array( 'ID' => $team_object->ID, 'post_status' => 'publish' ) );
			endif;

			// Get team ID
			$team_id = $team_object->ID;

		else:

			// Insert team
			$team_id = wp_insert_post( array( 'post_type' => 'sp_team', 'post_status' => 'publish', 'post_title' => wp_strip_all_tags( $team_name ) ) );

			// Flag as import
			update_post_meta( $team_id, '_sp_import', 1 );

		endif;
		
		// Update league
		if ( $league ):
			wp_set_object_terms( $team_id, $league, 'sp_league', true );
		endif;

		// Update season
		if ( $season ):
			wp_set_object_terms( $team_id, $season, 'sp_season', true );
		endif;

		if ( isset( $match_id ) && isset( $team_id )):
			// Add team to event
			add_post_meta( $match_id, 'sp_team', $team_id );
			
			// Add empty player to event
			add_post_meta( $match_id, 'sp_player', 0 );
		endif;

//$this->Trace('team_match_data',$team_match_data);
		list($player1_name, $player2_name) = $team_match_data['players'];
		$p1m = array(
			'gender' => $match['matchSection'] == 'MD'?'M':'F',//todo
			'name' => $player1_name,
			'grade' => $match['matchGrade']
		);
		$p2m = array(
			'gender' => $match['matchSection'] == 'MD'?'M':'F',//todo
			'name' => $player2_name,
			'grade' => $match['matchGrade']
		);
		
		$meta1 = $this->link_player($p1m, $league, $season, $match_id, $team_id);
		$meta2 = $this->link_player($p2m, $league, $season, $match_id, $team_id);

		$ap = (11 - $match['matchGrade']) * (
		      $team_match_data['results']['gap'] 
			+ $team_match_data['results']['gbp'] //* 100 
			+ $team_match_data['results']['gcp'] //* 10000
			+ $team_match_data['results']['gdp']
			+ $team_match_data['results']['gep']
			) / 2;
		if($team_match_data['outcomeLabel']=='Won'):
			$ap = $ap * 1.4;
		elseif($team_match_data['outcomeLabel']=='Draw'):
			$ap = $ap * 1.1;
		endif;
		$ap = intval($ap);
		$k = array();
		if($meta1['player_id'] != null):
			$k[$meta1['player_id']] =  array('number' => $meta1['player_number'], 'ap'=> $ap);
		endif;

		if($meta2['player_id'] != null):
			$k[$meta2['player_id']] =  array('number' => $meta2['player_number'], 'ap'=> $ap);
		endif;

		$players[ $team_id ] = $k;

		// update_post_meta( $meta1['player_id'], 'sp_statistics', $k[$meta1['player_id']] );
		// update_post_meta( $meta2['player_id'], 'sp_statistics', $k[$meta2['player_id']] );
		
		//update_post_meta( 918, 'sp_players', $k[$meta1['player_id']] );
		//update_post_meta( 918, 'sp_players', $k[$meta2['player_id']] );

		// array(
		// 	$meta1['player_id'] => array('number' => $meta1['player_number'], 'ap'=> $ap),
		// 	$meta2['player_id'] => array('number' => $meta2['player_number'], 'ap'=> $ap)
		// );

		// $this->Trace('p',$players[ $team_id ]);
		// $this->Trace('k',$k);
		// Get existing results
		$event_results = get_post_meta( $match_id, 'sp_results', true );

		// Create new array if results not exists
		if ( ! $event_results ):
			$event_results = array();
		endif;

		// Add team results to existing results
		$event_results[ $team_id ] = $team_match_data['results'];//$team_results;

		$outcome_slug = null;
		$outcome = $team_match_data['outcomeLabel'];
		$this->Trace('team_name', $team_name);
		$this->Trace('outcomeLabel', $outcome);
		

		// Get or insert outcome
		$outcome_object = get_page_by_title( stripslashes( $outcome ), OBJECT, 'sp_outcome' );

		if ( $outcome_object ):

			// Make sure outcome is published
			if ( $outcome_object->post_status != 'publish' ):
				wp_update_post( array( 'ID' => $outcome_object->ID, 'post_status' => 'publish' ) );
			endif;

			// Get outcome slug
			$outcome_slug = $outcome_object->post_name;

		else:

			// Insert outcome
			$outcome_id = wp_insert_post( array( 'post_type' => 'sp_outcome', 'post_status' => 'publish', 'post_title' => wp_strip_all_tags( $outcome ) ) );

			// Get outcome slug
		    $post_data = get_post( $outcome_id, ARRAY_A );
		    $outcome_slug = $post_data['post_name'];

			// Flag as import
			update_post_meta( $outcome_id, '_sp_import', 1 );

		endif;
		$event_results[ $team_id ][ 'outcome' ][] = $outcome_slug;
		// Update event results
		update_post_meta( $match_id, 'sp_results', $event_results );
		
		update_post_meta( $match_id, 'sp_specs', array('grade'=> $match['matchGrade'], 'section'=> $match['matchSection'] ));//winfactor lostfactor

	endforeach;
	// Add player performance to last event if available
	if ( isset( $match_id ) && isset( $players ) && sizeof( $players ) > 0 ):
		$this->Trace('pperf', $players);
		update_post_meta( $match_id, 'sp_players', $players );
	endif;	


	$this->imported++;
endforeach;

}
function randome_name($gender){
	$men = get_mock_firstname_male();//array('Jack', 'Pat', 'Nick');
	$women = get_mock_firstname_female();//array('Ann', 'Kate', 'Liz');
	return $gender == 'M' ? $men[array_rand($men, 1)] : $women[array_rand($women, 1)];
}

function randome_surname(){
	$surname = get_mock_surname();
	return $surname[array_rand($surname, 1)]
	;//'Smith'; //https://www.mockaroo.com/
}
function random_gender(){
	return mt_rand(0,1) == 0 ? 'M' : 'F';
}
function random_grade(){
	return mt_rand(1,10) . '';
}
function random_player($gender, $grade, $id){
	$firstname = $this->randome_name($gender);
	$lastname = $this->randome_surname();
	return array(
		'firstname' => $firstname,
		'lastname' => $lastname,
		'name' => "$firstname $lastname",
		'gender' => $gender,
		'grade' => $grade,
		'rl' => (mt_rand(0,1) == 0 ? 'R' : 'L'),
		'id' => $id
	);
}
function random_players(){
	$all_players = array();
	$gender = 'M';
	$id = 0;
	for($grade = 1; $grade < 11; $grade++):
		for($i = 0; $i < 80; $i++): //all grades
			$gender = ($gender=='M')?'F':'M';
			array_push($all_players, $this->random_player($gender, $grade, $id));
			$id++;
		endfor;
	endfor;
	return $all_players;
}

function find_player($players, $gender, $grade, &$excluded){
	$result = null;
	foreach ($players as $player) {
		if($player['gender'] == $gender 
			&& $player['grade'] == $grade 
			&& ! in_array($player['id'], $excluded)){
				$result = $player;
				array_push($excluded, $player['id']); 
			break;
		}
	}

	return $result;
}

function random_game_points($outcome, $expect, $max){
	return $outcome == $expect ? $max : mt_rand(0, $max - 1);
}

function random_match_points($format, $max){//number of games in a match
	$result = array();
	$result_a = array();
	$result_b = array();
	$awc = 0;
	$bwc = 0;
	for($i = 0;$i < $format;$i++){
		$outcome = mt_rand(0, 1);
		array_push($result_a, $this->random_game_points($outcome, 1, $max));
		array_push($result_b, $this->random_game_points($outcome, 0, $max));
		$result = array(0 => $result_a, 1 => $result_b);
		$awc += $outcome == 1 ? 1 : 0;
		$bwc += $outcome == 0 ? 1 : 0;
		if($awc == 2 || $bwc == 2)
			//($format == 3 || $format == 5) && $wc == ($format -1))
			break;
	}

	return $result;
}

function random_match_points_complete($format, $max){//number of games in a match
	$result = array();
	$result_a = array();
	$result_b = array();
	$awc = 0;
	$bwc = 0;
	if( $format <3 ){
		for($i = 0;$i < $format; $i++){
			$outcome = mt_rand(0, 1);
			array_push($result_a, $this->random_game_points($outcome, 1, $max));
			array_push($result_b, $this->random_game_points($outcome, 0, $max));
		}
	}
	else if($format == 3 ){
		for($i = 0;$i < 3; $i++){
			$outcome = mt_rand(0, 1);
			array_push($result_a, $this->random_game_points($outcome, 1, $max));
			array_push($result_b, $this->random_game_points($outcome, 0, $max));
			$awc += $outcome == 1 ? 1 : 0;
			$bwc += $outcome == 0 ? 1 : 0;
			if($awc == 2 || $bwc == 2) break;
		}
	}
	else if($format == 5 ){
		for($i = 0;$i < 3; $i++){
			$outcome = mt_rand(0, 1);
			array_push($result_a, $this->random_game_points($outcome, 1, $max));
			array_push($result_b, $this->random_game_points($outcome, 0, $max));
			$awc += $outcome == 1 ? 1 : 0;
			$bwc += $outcome == 0 ? 1 : 0;
			if($awc == 3 || $bwc == 3) break;
		}
	}

	$result = array(0 => $result_a, 1 => $result_b);
	return $result;
}
function random_two_teams($players, $grade, $section, &$excluded){
	$teams_in_match = array();

	if($section == 'XD'):
		$pa = $this->find_player($players, 'M', $grade, $excluded);
		$pb = $this->find_player($players, 'F', $grade, $excluded);

		$pc = $this->find_player($players, 'M', $grade, $excluded);
		$pd = $this->find_player($players, 'F', $grade, $excluded);
	elseif($section == 'MD'):
		$pa = $this->find_player($players, 'M', $grade, $excluded);
		$pb = $this->find_player($players, 'M', $grade, $excluded);

		$pc = $this->find_player($players, 'M', $grade, $excluded);
		$pd = $this->find_player($players, 'M', $grade, $excluded);
	elseif($section == 'WD'):
		$pa = $this->find_player($players, 'F', $grade, $excluded);
		$pb = $this->find_player($players, 'F', $grade, $excluded);

		$pc = $this->find_player($players, 'F', $grade, $excluded);
		$pd = $this->find_player($players, 'F', $grade, $excluded);
	endif;
	$team_x = $pa['name']. '|' .$pb['name'];
	$teams_in_match[$team_x] = array($pa, $pb);
	$team_y = $pc['name']. '|' .$pd['name'];
	$teams_in_match[$team_y] = array($pc, $pd);
	if($pa['name'] == null){
		$this->Trace('pa', $excluded);
		die();
	}
	if($pb['name'] == null){
		$this->Trace('pb', $excluded);
		die();
	}
	if($pc['name'] == null){
		$this->Trace('pc', $excluded);
		die();
	}
	if($pd['name'] == null){
		$this->Trace('pd', $excluded);
		die();
	}
	if(team_x == $team_y){
		$this->Trace('team_x', $team_x);
		die();
	}
	return $teams_in_match;
}
function match_points_imploded($format, $max){
	$result = array();
	$points = $this->random_match_points($format, $max);
	//$points = $this->random_match_points_complete($format, $max);
	array_push($result, implode ('|' , $points[0]));
	array_push($result, implode ('|' , $points[1]));
	return $result;
}
function importA( $array = array(), $columns = array( 'post_title' ) ) {

	$annual_events = array(
	'St Valentines' => array(
		'title'=>'St Valentines', 
		'date'=>'2016/12/29', 
		'league'=>'Bonanza', 
		'venue'=>'Baldoyle', 
		'formatGame' => '21',
		'formatMatch' => '3',
		'grades'=>array(3),//,6,8
		'sections'=>array('XD')),//, 'MD', 'WD'
	//more
	);
	$seasons = array(2016);//, 2017, 2018
	$all_players = $this->random_players();
	$teams_in_alltimes = array();

	$excluded = array();
	foreach($seasons as $season):
		$teams_in_season = array();
		foreach($annual_events as $event):
			$teams_in_event = array();
			foreach($event['sections'] as $section):
				foreach($event['grades'] as $grade):

					$excluded = array();
					$teams = $this->random_two_teams($all_players, $grade, $section, $excluded);
					$teams = array_merge($teams, $this->random_two_teams($all_players, $grade, $section, $excluded));
					$teams = array_merge($teams, $this->random_two_teams($all_players, $grade, $section, $excluded));
					foreach ($teams as $key1 => $t1) {
						foreach ($teams as $key2 => $t2) {
							if($key1 != $key2){
								array_push($teams_in_event,array($section => array($key1 => $t1, $key2 => $t2)));
							}
						}
					}

				endforeach;	
			endforeach;	
			array_push($teams_in_season, array($event['title'] => $teams_in_event));
		endforeach;
		array_push($teams_in_alltimes, array($season => $teams_in_season));
	endforeach;

	//$this->Trace('teams_in_alltimes', $teams_in_alltimes);
	$raw_import = array();
	foreach ($teams_in_alltimes as $season => $teams_in_season) {
		foreach ($teams_in_season as $event_title => $teams_in_eventX) {
			foreach ($teams_in_eventX as $p => $q) {
				foreach ($q as $event_label => $teams_in_event) {
					//$this->Trace('event_label', $event_label);
					foreach ($teams_in_event as $event_sections) {
						$format = $annual_events[$event_label]['formatMatch'];
						$max = $annual_events[$event_label]['formatGame'];
						foreach ($event_sections as $section => $section_teams){
							$isMatchFirstRow = true;
							$points_imploded = $this->match_points_imploded($format, $max);
							foreach ($section_teams as $teamLabel => $team) {
								//$this->Trace('teamLabel', $teamLabel);
								//$this->Trace('section_teams', $section_teams);
//2018/12/29,Baldoyle,8,MD,A|B,21|12|21
//,,,,E|F,15|21|19
								if($isMatchFirstRow){
									array_push($raw_import, $annual_events[$event_label]['date']);
									array_push($raw_import, $annual_events[$event_label]['venue']);
									array_push($raw_import, $team[0]['grade'] . '');
									array_push($raw_import, $section);
									array_push($raw_import, $teamLabel);
									array_push($raw_import, $points_imploded[0]);
									//array_push($raw_import, );
									$isMatchFirstRow = false;
								}
								else{
									array_push($raw_import, '');array_push($raw_import, '');array_push($raw_import, '');array_push($raw_import, '');array_push($raw_import, '');array_push($raw_import, '');
									array_push($raw_import, $teamLabel);
									array_push($raw_import, $points_imploded[1]);
									array_push($raw_import, '');array_push($raw_import, '');
								}
							}
						}
					}
				}
			}
		}
	}

	$this->Trace('raw_import', $raw_import);
	$this->Trace('file_import', $array);
		$league = $annual_events['St Valentines']['league'];
		$season = $seasons[0];
		//$annual_events['St Valentines']['venue']
		//$annual_events['St Valentines']['title']

	$event_meta = array('sp_format' => $event_format, 'league' => $league, 'season' => $season, 'date_format' => $date_format);
	$this->import_matches($raw_import, $event_meta, $columns);
}

function import( $array = array(), $columns = array( 'post_title' ) ) {
	$this->imported = $this->skipped = 0;
	// if ( ! is_array( $array ) || ! sizeof( $array ) ):
	// 	$this->footer();
	// 	die();
	// endif;
	// Get event format, league, and season from post vars
	$event_format = ( empty( $_POST['sp_format'] ) ? false : $_POST['sp_format'] );
	$league = ( sp_array_value( $_POST, 'sp_league', '-1' ) == '-1' ? false : $_POST['sp_league'] );
	$season = ( sp_array_value( $_POST, 'sp_season', '-1' ) == '-1' ? false : $_POST['sp_season'] );
	$date_format = ( empty( $_POST['sp_date_format'] ) ? 'yyyy/mm/dd' : $_POST['sp_date_format'] );
	
	$event_meta = array('sp_format' => $event_format, 'league' => $league, 'season' => $season, 'date_format' => $date_format);
	$this->delete_all_of_type();
	//$this->import_matches($array, $event_meta, $columns);
	
	$this->importA($array, $event_meta, $columns);

	// Show Result
	echo '<div class="updated settings-error below-h2"><p>
		'.sprintf( __( 'Import complete - imported <strong>%s</strong> eventsA and skipped <strong>%s</strong>.', 'sportspress' ), $this->imported, $this->skipped ).'
	</p></div>';

	$this->import_end();
}


		/**
		 * Performs post-import cleanup of files and the cache
		 */
		function import_end() {
			$import_end = array('imported' => $this->imported, 'skipped' => $this->skipped);
			$this->Trace('import_end',$import_end);
			echo '<p>' . __( 'All done!', 'sportspress' ) . ' <a href="' . admin_url('edit.php?post_type=sp_event') . '">' . __( 'View Events', 'sportspress' ) . '</a>' . '</p>';

			do_action( 'import_end' );
		}

		/**
		 * greet function.
		 *
		 * @access public
		 * @return void
		 */
		function greet() {
			echo '<div class="narrow">';
			echo '<p>' . __( 'Hi there! Choose a .csv file to upload, then click "Upload file and import".', 'sportspress' ).'</p>';
			echo '<p>' . sprintf( __( 'Events need to be defined with columns in a specific order (3+ columns). <a href="%s">Click here to download a sample</a>.', 'sportspress' ), plugin_dir_url( SP_PLUGIN_FILE ) . 'dummy-data/events-sample.csv' ) . '</p>';
			//$this->wp_trigger_import( 'admin.php?import=sp_eventA_csv&step=1' );
			$this->import();
		}


		/**
		 * options function.
		 *
		 * @access public
		 * @return void
		 */
		function options() {
			?>
			<table class="form-table">
				<tbody>
					<tr>
						<th scope="row"><label><?php _e( 'Format', 'sportspress' ); ?></label><br/></th>
						<td class="forminp forminp-radio" id="sp_formatdiv">
							<fieldset id="post-formats-select">
								<ul>
									<li><input type="radio" name="sp_format" class="post-format" id="post-format-league" value="league" checked="checked"> <label for="post-format-league" class="post-format-icon post-format-league"><?php _e( 'Competitive', 'sportspress' ); ?></label></li>
									<li><input type="radio" name="sp_format" class="post-format" id="post-format-friendly" value="friendly"> <label for="post-format-friendly" class="post-format-icon post-format-friendly"><?php _e( 'Friendly', 'sportspress' ); ?></label></li>
								<br>
							</fieldset>
						</td>
					</tr>
					<tr>
						<th scope="row"><label><?php _e( 'League', 'sportspress' ); ?></label><br/></th>
						<td><?php
						$args = array(
							'taxonomy' => 'sp_league',
							'name' => 'sp_league',
							'values' => 'slug',
							'show_option_none' => __( '&mdash; Not set &mdash;', 'sportspress' ),
						);
						if ( ! sp_dropdown_taxonomies( $args ) ):
							echo '<p>' . __( 'None', 'sportspress' ) . '</p>';
							sp_taxonomy_adder( 'sp_league', 'sp_team', __( 'Add New', 'sportspress' ) );
						endif;
						?></td>
					</tr>
					<tr>
						<th scope="row"><label><?php _e( 'Season', 'sportspress' ); ?></label><br/></th>
						<td><?php
						$args = array(
							'taxonomy' => 'sp_season',
							'name' => 'sp_season',
							'values' => 'slug',
							'show_option_none' => __( '&mdash; Not set &mdash;', 'sportspress' ),
						);
						if ( ! sp_dropdown_taxonomies( $args ) ):
							echo '<p>' . __( 'None', 'sportspress' ) . '</p>';
							sp_taxonomy_adder( 'sp_season', 'sp_team', __( 'Add New', 'sportspress' ) );
						endif;
						?></td>
					</tr>
					<tr>
						<th scope="row" class="titledesc">
							<?php _e( 'Date Format', 'sportspress' ); ?>
						</th>
                		<td class="forminp forminp-radio">
                			<fieldset>
                				<ul>
									<li>
		                        		<label><input name="sp_date_format" value="yyyy/mm/dd" type="radio" checked> yyyy/mm/dd</label>
		                        	</li>
									<li>
		                        		<label><input name="sp_date_format" value="dd/mm/yyyy" type="radio"> dd/mm/yyyy</label>
		                        	</li>
									<li>
		                        		<label><input name="sp_date_format" value="mm/dd/yyyy" type="radio"> mm/dd/yyyy</label>
		                        	</li>
								</ul>
	                    	</fieldset>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
			<?php
		}
	}
}

