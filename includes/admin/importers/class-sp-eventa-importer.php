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
			$this->import_label = __( 'Import EventsAB', 'sportspress' );
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
	$unknown_player = 'unknknown';
	//if (trim($pa_name) != '' && trim($pb_name) != ''):
		$result = $this->nvl($pa_name, $unknown_player) . ' with ' . $this->nvl($pb_name, $unknown_player); 
	// elseif (trim($pa_name) != '' && trim($pb_name) == ''):
	// 	$result =  $pa_name . ' with unknknown';
	// elseif (trim($pa_name) == '' && trim($pb_name) != ''):
	// 	$result =  $pb_name . ' with unknknown';
	// elseif (trim($pa_name) == '' && trim($pb_name) == ''):
	// else
	// 	$result = 'unknknown team';
	// endif;

	return $result;
}
function nvl($val, $replace)
{
    if( is_null($val) || $val === '' )  return $replace;
    else                                return $val;
}
function delete_all_posts_from_author($post_id) {

    $id = -1;//$post->ID;

    // Only trigger if post type is "company"
    if ( get_post_type($id) == "company" || true) {

        //$author_id = $post->post_author;

        $posts_from_author = get_posts(
            array(
                'posts_per_page'    => -1,
                'post_status'       => 'publish',
                'post_type'         => array('sp_event'),
                //'author'            => $author_id,
                'fields'            => 'ids', // Only get post ID's
            )
        );

        foreach ( $posts_from_author as $post_from_author ) {
            wp_trash_post( $post_from_author, false); // Set to False if you want to send them to Trash.
        }
    }
}
// function build_random_match($venue, $event_date, $match_format){
// 	$commonDetails[0] = $event_date;//'2019/01/01';
// 	$commonDetails[1] = $venue; //random_token(array('Baldoyle','NIA','Terenure','Marino');
// 	$commonDetails[2] = 7;
// 	$commonDetails[3] = random_token(array('MD','WD','XD'));

// 	$tapa = random_player();
// 	$tapb = random_player();
// 	$tbpa = random_player();
// 	$tbpb = random_player();
// 	$rgp = random_game_points($tapa, $tapb, $tbpa, $tbpb, $match_format);
// 	$rowA[0] = 'A|B';//$rgp['ta']
// 	$rowA[1] = '12|14';
// 	$rowB[0] = 'C|D';
// 	$rowB[1] = '21|21';
// 	$result = build_match($commonDetails, $rowA, $rowB);
// 	return $result;
// }
function build_match($commonDetails, $rowA, $rowB){
	$result = array();
	$result['matchDate'] = $this->nvl($commonDetails[0],'2019/01/01');
	$result['venue'] = $this->nvl($commonDetails[1],'Baldoyle');
	$result['matchSection'] = $this->nvl($commonDetails[3], 'MD');
	$result['matchGrade'] = $this->nvl($commonDetails[2], 11);

	$result['teams'] = array();
	$points_a = explode( '|', $rowA[1] );
	$points_b = explode( '|', $rowB[1] );
	//$players_a = explode( '|', $rowA[0] );
	//$players_b = explode( '|', $rowB[0] );

	$taTitle = $this->teamNameFromPiped($rowA[0]);
	$tbTitle = $this->teamNameFromPiped($rowB[0]);

	// $taTitle = str_replace('|',' with ', $rowA[0]);
	// $tbTitle = str_replace('|',' with ', $rowB[0]);

	$isFirstGame = true;
	$result['teams'][$taTitle]['results'] = array();
	$result['teams'][$tbTitle]['results'] = array();
	foreach( $points_a as $gkey => $points ):
	//for($i=0;$i<sizeof($points_a), $i++)
		//$points_a[$i]
		if($isFirstGame){
			$result['teams'][$taTitle]['results']['gw'] = $points > $points_b[$gkey] ? 1 : 0;
			$result['teams'][$taTitle]['results']['gl'] = $points < $points_b[$gkey] ? 1 : 0;

			$result['teams'][$tbTitle]['results']['gw'] = $result['teams'][$taTitle]['results']['gl'];
			$result['teams'][$tbTitle]['results']['gl'] = $result['teams'][$taTitle]['results']['gw'];

			$result['teams'][$taTitle]['players'] = explode( '|', $rowA[0] );
			$result['teams'][$tbTitle]['players'] = explode( '|', $rowB[0] );
			$isFirstGame = false;
		}
		else{
			$result['teams'][$taTitle]['results'][$points > $points_b[$gkey] ? 'gw' : 'gl']++;
			$result['teams'][$tbTitle]['results'][$points < $points_b[$gkey] ? 'gw' : 'gl']++;
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
	
//$this->Trace($taTitle.' gw', $result['teams'][$taTitle]['results']);
//$this->Trace($tbTitle.' gw', $result['teams'][$tbTitle]['results']);

	if($result['teams'][$taTitle]['results']['gw'] > $result['teams'][$tbTitle]['results']['gw']){
		$result['teams'][$taTitle]['outcomeLabel'] = 'Won';
		$result['teams'][$tbTitle]['outcomeLabel'] = 'Lost';
	}
	elseif($result['teams'][$taTitle]['results']['gw'] = $result['teams'][$tbTitle]['results']['gw']){
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

function link_player($player1_name, $league, $season, $match_id, $team_id){

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
						$player1_id = wp_insert_post( array( 'post_type' => 'sp_player', 'post_status' => 'publish', 'post_title' => wp_strip_all_tags( $player1_name ) ) );

						// Flag as import
						update_post_meta( $player1_id, '_sp_import', 1 );

						// Update number
						update_post_meta( $player1_id, 'sp_number', null );

						// Get player number
						$player1_number = null;

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
					//$aps= 0;//todo

					//$result[ $player1_id ] = array('number' => $player1_number, 'ap'=> $aps);
					endif;
					$result = array('player_id' => $player1_id,'player_number' => $player1_number);

					return $result;
					//return array('player_ap' => $player_ap);
					//return array('id'=>$player1_id, 'number'=>$player1_number);
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
function importA( $array = array(), $columns = array( 'post_title' ) ) {
		$rows = array_chunk( $array, sizeof( $columns ) );

	// Get event format, league, and season from post vars
	$event_format = ( empty( $_POST['sp_format'] ) ? false : $_POST['sp_format'] );
	$league = ( sp_array_value( $_POST, 'sp_league', '-1' ) == '-1' ? false : $_POST['sp_league'] );
	$season = ( sp_array_value( $_POST, 'sp_season', '-1' ) == '-1' ? false : $_POST['sp_season'] );
	$date_format = ( empty( $_POST['sp_date_format'] ) ? 'yyyy/mm/dd' : $_POST['sp_date_format'] );

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
		array_push ($matches, $this->build_match($commonDetails, $rowA, $rowB));
		//array_push ($matches, $this->build_random_match());
	}
	$matchImportIdx += 2;
	endwhile;

	foreach ( $matches as $match ):

		$match_check = array_filter( $match );
		if ( empty( $match_check ) ) continue;
		$match_hash = $this->match_hash($match);
		$this->Trace('match_hash', $match_hash);

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

//$this->delete_all_posts_from_author(-1);

if($events_q->have_posts()):
	$events_q->the_post();
	$match_id = $post->ID;

	//$this->Trace('ev', $post);
	//$this->Trace('match_id found', $match_id);
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

$this->Trace('team_match_data',$team_match_data);
		list($player1_name, $player2_name) = $team_match_data['players'];
		$meta1 = $this->link_player($player1_name, $league, $season, $match_id, $team_id);
		$meta2 = $this->link_player($player2_name, $league, $season, $match_id, $team_id);

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

		$k =array();
		if($meta1['player_id'] != null):
			$k[$meta1['player_id']] =  array('number' => $meta1['player_number'], 'ap'=> $ap);
		endif;

		if($meta2['player_id'] != null):
			$k[$meta2['player_id']] =  array('number' => $meta2['player_number'], 'ap'=> $ap);
		endif;

		$players[ $team_id ] = $k;

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
		update_post_meta( $match_id, 'sp_players', $players );
	endif;	


	$this->imported++;
endforeach;

}
function randome_name($gender){
	$men = array('Jack', 'Pat', 'Nick');
	$women = array('Ann', 'Kate', 'Liz');
	return $gender == 'M' ? $men[array_rand($men,1)] : $women[array_rand($women,1)];
}
function randome_surname(){
	return 'Smith';
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
		//$this->Trace('random_player',$this->random_player('M','6'));
	//$this->Trace('random_player',$this->random_player('F','6'));
	$all_players = array();
	$gender = 'M';
	//$genders = array('M', 'F');
	for($grade = 1; $grade < 11; $grade++):
	//foreach($genders as $gender): //all grades
	for($i = 0; $i < 20; $i++): //all grades
		//$grade = $this->random_grade();
		//$gender = $this->random_gender();
		//array_push($all_players, $this->random_player($gender, $grade));
		$gender = ($gender=='M')?'F':'M';
		//$grade_label = $grade . '';
		if($all_players[$gender] == null){
			$all_players[$gender] = array();
		}
		if($all_players[$gender][$grade] == null){
			$all_players[$gender][$grade] = array();
		}
		array_push($all_players[$gender][$grade], $this->random_player($gender, $grade, $i));
	endfor;
	//endforeach;
	endfor;
	//$this->Trace('all_players', $all_players);
	return $all_players;
}

function find_player($players, $gender, $grade, $excluded){
	$result = null;
	//$search_result = array_intersect_key($players, array(array('gender' => $gender, 'grade' => $grade)));
	// if(is_array( $search_result ) && sizeof( $search_result )){
	// 	$result = $search_result[0];
	// }

	$key = array_rand($players[$gender][$grade], 1);
	$result = $players[$gender][$grade][$key];
	if($result)
	{
		$this->Trace('failed to fetch', null);
		$this->Trace('gender', $gender);
		$this->Trace('grade', $grade);
		$this->Trace('key', $key);
		die();
	}
	return $result;
}
function random_two_teams($players, $grade, $section){
		$teams_in_match = array();
		$excluded=null;
				if($section == 'XD'):
				$pa = $this->find_player($players, 'M', $grade, $excluded);
				$pb = $this->find_player($players, 'F', $grade, $excluded);
				//$this->Trace('pa', $pa);
				//$this->Trace('pb', $pb);
				$team_x = $pa['name']. '|' .$pb['name'];
				$teams_in_match[$team_x] = array($pa, $pb);
				//$this->Trace('team_x', $team_x);
				$pc = $this->find_player($players, 'M', $grade, $excluded);
				$pd = $this->find_player($players, 'F', $grade, $excluded);
				$team_y = $pc['name']. '|' .$pd['name'];
				//$this->Trace('team_y', $team_y);
				$teams_in_match[$team_y] = array($pc, $pd);
			elseif($section == 'MD'):
				die();//tbd
			elseif($section == 'WD'):
				die();//tbd
			endif;
			return $teams_in_match;
}
function importB( $array = array(), $columns = array( 'post_title' ) ) {

	$annual_events = array(
	'St Valentines' => array(
		'title'=>'St Valentines', 
		'date'=>'', 
		'league'=>'Bonanza', 
		'venue'=>'Baldoyle', 
		'formatPoints' => '21',
		'grades'=>array(3,6,8),
		'sections'=>array('XD')),
	//more
	);
	$seasons = array(2016, 2017, 2018);
	$all_players = $this->random_players();
	$teams_in_alltimes = array();


	$excluded = array();
	foreach($seasons as $season):
		$teams_in_season = array();
		foreach($annual_events as $event):
			$teams_in_event = array();
			foreach($event['sections'] as $section):
				foreach($event['grades'] as $grade):
					array_push($teams_in_event, array($section => $this->random_two_teams($all_players, $grade, $section)));
				endforeach;	
			endforeach;	
			array_push($teams_in_season, array($event['title'] => $teams_in_event));
		endforeach;
		array_push($teams_in_alltimes, array($season => $teams_in_season));
	endforeach;

	// $team_x = null;
	// $team_y = null;

	//array_push($teams_in_event, $this->random_two_teams($all_players, $grade,$section));
			

			//array_push($teams_in_event, array($team_x => array_merge($pa, $pb)));
			//array_push($teams_in_event, array($team_y => array_merge($pc, $pd));
			//$this->Trace('team_x', $team_x);
			//$this->Trace('teams_in_event', $teams_in_event);
	//$this->Trace('teams_in_alltimes', $teams_in_alltimes);
	$raw_import = array();
	foreach ($teams_in_alltimes as $season => $teams_in_season) {
		foreach ($teams_in_season as $event_title => $teams_in_eventX) {
			foreach ($teams_in_eventX as $p => $q) {
				// $ta=null;
				// $tb=null;
				// list($ta, $tb) = $match_teams;
				//$this->Trace('match_teams', $match_teams);
				foreach ($q as $teams_in_event_key => $teams_in_event) {
					foreach ($teams_in_event as $event_sections) {
						foreach ($event_sections as $section => $section_teams){
							$isMatchFirstRow = true;
							foreach ($section_teams as $teamLabel => $team) {
								$this->Trace('teamLabel', $teamLabel);
								$this->Trace('section_teams', $section_teams);
								$row = null;
								if($isMatchFirstRow){
									$row = 
									'2018/12/29'.','
									. $annual_events['St Valentines']['venue'].','
									//
									. $team[0]['grade'].','
									. $section.',';
									$isMatchFirstRow = false;
								}
								else{
									$row = ',,,,';

								}
								$row .= $teamLabel . ','
								. 'points';

								
								//die();
	//2018/12/29,Baldoyle,8,MD,|B,21|12|21
								array_push($raw_import, $row);
							}

						}

					}

				}
			}
		}
	}
	//$this->importA($raw_import);
	$this->Trace('raw_import', $raw_import);
}



function import( $array = array(), $columns = array( 'post_title' ) ) {
	$this->imported = $this->skipped = 0;
	if ( ! is_array( $array ) || ! sizeof( $array ) ):
		$this->footer();
		die();
	endif;

	//$this->importA($array, $columns);
	$this->importB($array, $columns);

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
			echo '<p>' . sprintf( __( 'Supports CSV files generated by <a href="%s">LeagueLobster</a>.', 'sportspress' ), 'http://tboy.co/leaguelobster' ) . '</p>';
			wp_import_upload_form( 'admin.php?import=sp_eventA_csv&step=1' );
			echo '</div>';
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

