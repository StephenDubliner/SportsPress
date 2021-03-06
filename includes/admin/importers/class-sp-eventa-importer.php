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
	$two_players = explode( '|', $input );
	return $this->teamName($two_players);
}

function teamNameFromPiped_md5($input){
	return 'Team '. md5($input);
}
function teamNameFromPiped_initials($input){
	//sp_trace('input', $input);
	$initials = array();
	$two_players = explode( '|', $input );
	foreach ($two_players as $playerTitle) {
		$titleParts = explode( ' ', $playerTitle );
		$playerInitials = array();
		foreach ($titleParts as $titlePart) {
			if(trim($titlePart))
				array_push($playerInitials, $titlePart[0]);
		}

		array_push($initials, $playerInitials);
	}
//sp_trace('initials', $initials);
	$resultInitials = array();
	foreach ($initials as $initial) {
		array_push($resultInitials, implode('', $initial));
	}

	return implode(' with ', $resultInitials);
	//return 'Team '. md5($input);
}
function teamNameFromPipedB($input){
//global $generic_team_titles = array('aa','bb','cc');
	return 'Team '. $generic_team_titles[md5($input)];// $adjectives[] . '-' . $noun[] ;
}
//extract generating players from events import
//while generating matches take existing players to create teams


//alt team name
//md5hash
//adj+noun
//
function teamName($two_players = array()){
	$pa_name = null; 
	$pb_name = null;
	$result = null;

	sort($two_players);
	list($pa_name, $pb_name) = $two_players;
	$pa_name = trim($pa_name);
	$pb_name = trim($pb_name);
	if($pa_name == '' && $pb_name == '')
		return null;
	$unknown_player = 'unknknown';

	$result = sp_nvl($pa_name, $unknown_player) . ' with ' . sp_nvl($pb_name, $unknown_player); 

	return $result;
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
                'meta_key'         => '_sp_import',
                'meta_value'       => 1
            )
        );
        $delete_count = 0;
        foreach ( $posts_to_delete as $post ) {
            //wp_trash_post( $post_from_author, false); // Set to False if you want to send them to Trash.
            wp_delete_post( $post, true);
            $delete_count++;
        }
        //$delete_count = sizeof($post_to_delete);
        sp_trace('delete_count', $delete_count);
}

function build_match($commonDetails, $rowA, $rowB){
	//sp_trace('commonDetails',$commonDetails);
	$result = array();
	$result['matchDate'] = sp_nvl($commonDetails[0],'2019/01/01');
	$result['venue'] = sp_nvl($commonDetails[1],'Baldoyle');
	$result['matchSection'] = sp_nvl($commonDetails[3], 'MD');
	$result['matchGrade'] = sp_nvl($commonDetails[2], 11);

	$result['teams'] = array();
	$points_a = explode( '|', $rowA[1] );
	$points_b = explode( '|', $rowB[1] );
	// sp_trace('points_a',$points_a);
	// sp_trace('points_b',$points_b);
	$taTitle = $this->teamNameFromPiped_initials($rowA[0]);
	$tbTitle = $this->teamNameFromPiped_initials($rowB[0]);
	if($taTitle == null || $tbTitle == null)
	{
		sp_trace('rowA', $rowA);
		sp_trace('rowB', $rowB);
		return null;
	}
	$result['teams'][$taTitle]['title'] = $taTitle;
	$result['teams'][$tbTitle]['title'] = $tbTitle;

	$isFirstGame = true;
	$result['teams'][$taTitle]['results'] = array();
	$result['teams'][$tbTitle]['results'] = array();

	$result['teams'][$taTitle]['results']['taTitle'] = $taTitle;
	$result['teams'][$tbTitle]['results']['tbTitle'] = $tbTitle;

	$two_players_a = explode( '|', $rowA[0] );
	$two_players_b = explode( '|', $rowB[0] );
	$result['teams'][$taTitle]['players_o'] = array( 
		0 => array('title' => $two_players_a[0]),
		1 => array('title' => $two_players_a[1]),
	);
	$result['teams'][$tbTitle]['players_o'] = array( 
		0 => array('title' => $two_players_b[0]),
		1 => array('title' => $two_players_b[1]),
	);

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

	$result['teams'][$tbTitle]['results']['gw'] = $agl;
	$result['teams'][$tbTitle]['results']['gl'] = $agw;

//sp_trace($taTitle.' gw', $result['teams'][$taTitle]['results']);
//sp_trace($tbTitle.' gw', $result['teams'][$tbTitle]['results']);

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

function link_player($player, $league, $season, $match_id, $team_id){
//sp_trace('player',$player);
$player1_name = $player['name'];
$pseudo = $player['pseudo'];//'PS-' . $player1_name;
	$player1_id = null;
	$player1_number = null;
	$result = array();
	if(trim($player1_name) != ''):
//sp_trace('link_player',$player1_name);
	// Find out if player exists
	$player1_object = get_page_by_title( stripslashes( $player1_name ), OBJECT, 'sp_player' );

	// Get or insert player
	if ( $player1_object ):
///sp_trace('exists',$player1_name);
		// Make sure player is published
		if ( $player_object->post_status != 'publish' ):
			wp_update_post( array( 'ID' => $player_object->ID, 'post_status' => 'publish' ) );
		endif;

		// Get player ID
		$player1_id = $player1_object->ID;
//sp_trace('id',$player1_id);
		// Get player number
		$player1_number = get_post_meta( $player1_id, 'sp_number', true );

	else:
//sp_trace('new player',$player1_name);
		// Insert player
		$post_title = wp_strip_all_tags( $player1_name );
		$player1_id = wp_insert_post( array( 'post_type' => 'sp_player', 'post_status' => 'publish', 'post_title' => $post_title) );

		// Flag as import
		update_post_meta( $player1_id, '_sp_import', 1 );

		// Update number
		update_post_meta( $player1_id, 'sp_number', $player1_id );
		
		update_post_meta( $player1_id, 'sp_nationality', array_rand(
			//array('irl', 'fra', 'usa', 'ita', 'ger')
			SP()->countries->countries
			, 1));
		update_post_meta( $player1_id, '_thumbnail_id', $player['gender'] == 'F' ? 9185 : 9186);

		// Get player number
		$player1_number = $player1_id;
		
		update_post_meta( $player1_id, 'sp_metrics', 
			array(
				'grade' => $player['grade'], 
				'pseudo' => $pseudo, 
				'usepseudo' => $player['usepseudo'],
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
	wp_set_object_terms( $player1_id, 
		$player['gender'] == 'F' ?
		array(59, 60, 62):
		array(58, 60, 61),
		// array(62):
		// array(61),		
		 'sp_position', true );


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
function player_meta($match, $player1_name){
	return array(
	'name' => $player1_name,
	'pseudo' => 'PS-'.$player1_name,
	'usepseudo' => null,//mt_rand(0, 1) ? 'Y': null,
	'grade' => $match['matchGrade']
);
}
function import_matches_r( $array = array(), $event_meta = array(), $columns = array( 'post_title' ) ) {
	$rows = array_chunk( $array, 8 );//sizeof( $columns )
	$event_format = sp_nvl($event_meta['event_format'], 'league');;
	$league = sp_nvl($event_meta['league'], -1);;
	$season = sp_nvl($event_meta['season'], -1);
	$date_format = sp_nvl($event_meta['date_format'],'yyyy/mm/dd');

	// Get labels from result and performance post types
	$result_labels = sp_get_var_labels( 'sp_result' );
	$performance_labels = sp_get_var_labels( 'sp_performance' );

	//tbd
	$matchImportIdx = 0;
	$importSize = sizeof($rows);
	//if($importSize%2 <> 0)
	//exit();
	$import_data = array();
	$matches = array();
	$teamaName = $teambName = null;
	while ( $matchImportIdx < $importSize ):

	$row_check = array_filter( $rows[$matchImportIdx] );

	if ( !empty( $row_check ) ) {
		$commonDetails = array_slice( $rows[$matchImportIdx], 0, 4 );
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
	//sp_trace('processing matches', $mc);

	$import_data['season'] = $season;
	$import_data['league'] = $league;
	$import_data['event_format'] = $event_format;
	$import_data['date_format'] = $date_format;
	$import_data['matches'] = array();
	foreach ( $matches as $match ):
		// $match_r = array();
		// $match_r['matchDate'] = $match['matchDate'];
		// $match_r['venue'] = $match['venue'];
		// $match_r['matchSection'] = $match['matchSection'];
		// $match_r['matchGrade'] = $match['matchGrade'];
		// //$match_r['format'] = $match[''];
		// $match_r['teams'] = $match['teams'];
		$import_data['matches'] = array_merge($import_data['matches'], array( $this->match_hash($match) => $match));
	endforeach;

	//upsert input data from $import_data
	$this->commit_import($import_data);
}
function mr_usepseudo(){
	$cc_args = array(
		    'posts_per_page'   => -1,
		    'post_type'        => 'sp_player',
		    //'post_status' 	   => 'publish'
		);
		$q = new WP_Query( $cc_args );

	while ( $q->have_posts() ) : 
		if(mt_rand(0,1)==0 || true){
			$p = $q->the_post();
			sp_trace('the_post',$p);
			$m = get_post_meta($p, 'sp_metrics');
			$m['usepseudo'] = 'Y';
			update_post_meta($p->ID,'sp_metrics', $m);
		}
    endwhile;

}
function upsert_match($match, $event_format, $league, $season){
		$match_check = array_filter( $match );
		if ( empty( $match_check ) ) return null;
		$match_hash = $this->match_hash($match);
		//sp_trace('match_hash', $match_hash);

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

			//sp_trace('ev', $post);
			sp_trace('match skipped', $match_hash);
			$this->skipped++;
			return null;
		else:
			$args = array( 'post_type' => 'sp_event', 'post_status' => 'publish', 'post_date' => $date, 'post_title' => $match['matchTitle'] );

			// Insert event
			$match_id = wp_insert_post( $args );
			//sp_trace('match_id created', $match_id);
			update_post_meta( $match_id, 'sp_event_hash', $match_hash );
		endif;
	//sp_trace('match', $match);
	//sp_trace('match_hash', $match_hash);
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

	//update_post_meta( $match_id, 'sp_day',  '2018/01/01');//
	update_post_meta( $match_id, 'sp_day', $match['matchDate']);
	//wp_set_object_terms( $match_id, 'AABC', 'sp_day', false );
	return $match_id;
}
function player_upsert(&$player){
	$player_title = $player['title'];
	$player_obj = get_page_by_title( stripslashes( $player_title ), OBJECT, 'sp_player' );
	$player_id = null;
	$player_number = null;
	// Get or insert player
	if ( $player1_object ):
		// Make sure player is published
		if ( $player_object->post_status != 'publish' ):
			wp_update_post( array( 'ID' => $player_object->ID, 'post_status' => 'publish' ) );
		endif;

		$player_id = $player1_object->ID;
		$player_number = get_post_meta( $player_id, 'sp_number', true );
	else:
		// Insert player
		$post_title = wp_strip_all_tags( $player_title );
		$player_id = wp_insert_post( array( 'post_type' => 'sp_player', 'post_status' => 'publish', 'post_title' => $post_title) );

		// Flag as import
		update_post_meta( $player_id, '_sp_import', 1 );

		// Update number
		update_post_meta( $player_id, 'sp_number', $player_id );
		if($player['nationality'] != '')
			update_post_meta( $player_id, 'sp_nationality', $player['nationality']);

		update_post_meta( $player_id, 'sp_metrics', 
			array(
				'grade' => $player['grade'],
				'pseudo' => $player['pseudo'],
				'usepseudo' => $player['usepseudo'],
				'bi' => $player['bi'],
				'height' => $player['height'],
				'club' => $player['club'],
				'playrorl' => $player['playrorl'],
				'gender' => $player['gender']
				 ) );

	endif;
	$player['id'] = $player_id;
}
function team_upsert(&$team_data){
	$team_name = $team_data['title'];
	$team_object = get_page_by_title( stripslashes( $team_name ), OBJECT, 'sp_team' );

	$team_id = null;
	if ( $team_object ):
		// Make sure team is published
		if ( $team_object->post_status != 'publish' ):
			wp_update_post( array( 'ID' => $team_object->ID, 'post_status' => 'publish' ) );
		endif;

		$team_id = $team_object->ID;
	else:
		// Insert team
		$team_id = wp_insert_post( array( 'post_type' => 'sp_team', 'post_status' => 'publish', 'post_title' => wp_strip_all_tags( $team_name ) ) );

		// Flag as import
		update_post_meta( $team_id, '_sp_import', 1 );
	endif;
	$team_data['id'] = $team_id;
}
function match_upsert(&$match){
	// $match_check = array_filter( $match );
	// if ( empty( $match_check ) ) continue;
	$match_hash = $this->match_hash($match);
	//sp_trace('match_hash', $match_hash);

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
	if($events_q->have_posts()):
		$events_q->the_post();
		$match_id = $post->ID;

		//sp_trace('ev', $post);
		sp_trace('match skipped', $match_hash);
		$this->skipped++;
		return null;
	else:
		$args = array( 'post_type' => 'sp_event', 'post_status' => 'publish', 'post_date' => null, 'post_title' => $match['matchTitle'] );

		// Insert event
		$match_id = wp_insert_post( $args );
		//sp_trace('match_id created', $match_id);
		update_post_meta( $match_id, 'sp_event_hash', $match_hash );
	endif;

	// Flag as import
	update_post_meta( $match_id, '_sp_import', 1 );

		// Update event format
	if ( $match['event_format'] ):
		update_post_meta( $match_id, 'sp_format', $match['event_format'] );
	endif;

	// Update league
	if ( $match['league'] ):
		wp_set_object_terms( $match_id, $match['league'], 'sp_league', false );
	endif;

	// Update season
	if ( $match['season'] ):
		wp_set_object_terms( $match_id, $match['season'], 'sp_season', false );
	endif;

	// Update venue
	if ( $match['venue'] ):
		wp_set_object_terms( $match_id, $match['venue'], 'sp_venue', false );
	endif;

	update_post_meta( $match_id, 'sp_specs', array(
		'grade' => $match['matchGrade'], 
		'section' => $match['matchSection'] ));

	//update_post_meta( $match_id, 'sp_day', '2018/01/01');//
	//wp_set_object_terms( $match_id, 'AABC', 'sp_day', false );
	update_post_meta( $match_id, 'sp_day',  $match['matchDate']);
	$match['id'] = $match_id;
}

function commit_import($import_data = array()){
	//players
	//sp_trace('import_data', $import_data);
	$league = $import_data['league'];
	$season = $import_data['season'];
	foreach ($import_data['matches'] as $match_hash => $match) {
		$this->match_upsert($match);
		$match_id = $match['id'];
		$event_results = array();
		$players_aps = array();
		foreach ($match['teams'] as $team_hash => $team_match) {
			//array_push($team_match['team_merged'], $this->team_upsert($team_match['players_merged']));
			//$team_match['title'] = $team_hash;
			$this->team_upsert($team_match);
			$team_id = $team_match['id'];

			// sp_trace('match_id',$match_id);
			// sp_trace('team_id',$team_id);

			// Update event results
			//$event_results = array();
			$event_results[$team_id] = $team_match['results'];
			$outcome_object = get_page_by_title( stripslashes( $outcome ), OBJECT, 'sp_outcome' );


			$outcome = $team_match['outcomeLabel'];
			// Get or insert outcome
			$outcome_object = get_page_by_title( stripslashes( $outcome ), OBJECT, 'sp_outcome' );
			$outcome_slug = null;
			if ( $outcome_object ):

				// Make sure outcome is published
				if ( $outcome_object->post_status != 'publish' ):
					wp_update_post( array( 'ID' => $outcome_object->ID, 'post_status' => 'publish' ) );
				endif;

				// Get outcome slug
				$outcome_slug = $outcome_object->post_name;
				$event_results[ $team_id ][ 'outcome' ][] = $outcome_slug;

			endif;
			if ( isset( $match_id ) && isset( $team_id )):
				// Add team to event
				add_post_meta( $match_id, 'sp_team', $team_id );
				
				// Add empty player to event
				add_post_meta( $match_id, 'sp_player', 0 );
			endif;

			$all_points = 0;
			foreach ($team_match['players_o'] as $player_key => $player_value) {
				//array_push($team_match['players_merged'], $this->player_upsert($player_value));
				$this->player_upsert($player_value);
				$player_id = $player_value['id'];

				// Update league
				if ( $league ):
					wp_set_object_terms( $player_id, $league, 'sp_league', true );
				endif;

				// Update season
				if ( $season ):
					wp_set_object_terms( $player_id, $season, 'sp_season', true );
				endif;

				// Get player teams
				$player_teams = get_post_meta( $player_id, 'sp_team', false );
				$current_team = get_post_meta( $player_id, 'sp_current_team', true );
				$past_teams = get_post_meta( $player_id, 'sp_past_team', false );

				// Add team if not exists in player
				if ( ! in_array( $team_id, $player_teams ) ):
					add_post_meta( $player_id, 'sp_team', $team_id );
				endif;

				// Add as past team or set current team if not set
				if ( ! $current_team ):
					update_post_meta( $player_id, 'sp_current_team', $team_id );
				elseif ( $current_team != $team_id && ! in_array( $team_id, $past_teams ) ):
					add_post_meta( $player_id, 'sp_past_team', $team_id );
				endif;
				
				if ( $match_id ):
					add_post_meta( $match_id, 'sp_player', $player_id );
				endif;

				$ap = (11 - $match['matchGrade']) * (
				      $team_match['results']['gap'] 
					+ $team_match['results']['gbp'] //* 100 
					+ $team_match['results']['gcp'] //* 10000
					+ $team_match['results']['gdp']
					+ $team_match['results']['gep']
					) / 2;
				if($team_match['outcomeLabel']=='Won'):
					$ap = $ap * 1.4;
				elseif($team_match['outcomeLabel']=='Draw'):
					$ap = $ap * 1.1;
				endif;
				$ap = intval($ap);

				$players_aps[$team_id][$player_id] = array('number' => $player_id, 'ap'=> $ap);
			}

			// Update league
			if ( $league ):
				wp_set_object_terms( $team_id, $league, 'sp_league', true );
			endif;

			// Update season
			if ( $season ):
				wp_set_object_terms( $team_id, $season, 'sp_season', true );
			endif;

			//link player
		}

		update_post_meta( $match_id, 'sp_results', $event_results );
		update_post_meta( $match_id, 'sp_players', $players_aps );
		//update_post_meta( $match_id, 'sp_day',  '2018/01/01');//$match['matchDate']
		//update_post_meta( $match_id, 'sp_day',  'AABC');//$match['matchDate']
		wp_set_object_terms( $match_id, 'AABC', 'sp_day', false );
	}
}
function import_matches( $array = array(), $event_meta = array(), $columns = array( 'post_title' ) ) {

	$rows = array_chunk( $array, 8 );//sizeof( $columns )

	$event_format = sp_nvl($event_meta['event_format'], 'league');;
	$league = sp_nvl($event_meta['league'], -1);;
	$season = sp_nvl($event_meta['season'], -1);
	$date_format = sp_nvl($event_meta['date_format'],'yyyy/mm/dd');

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
		$commonDetails = array_slice( $rows[$matchImportIdx], 0, 4 );
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
	//sp_trace('matches',$matches);

	foreach ( $matches as $match ):

		$match_check = array_filter( $match );
		if ( empty( $match_check ) ) continue;
		$match_hash = $this->match_hash($match);
		//sp_trace('match_hash', $match_hash);

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

	//sp_trace('ev', $post);
	sp_trace('match skipped', $match_hash);
	$this->skipped++;
	continue;
else:
	$args = array( 'post_type' => 'sp_event', 'post_status' => 'publish', 'post_date' => $date, 'post_title' => $match['matchTitle'] );

	// Insert event
	$match_id = wp_insert_post( $args );
	sp_trace('match_id created', $match_id);
	update_post_meta( $match_id, 'sp_event_hash', $match_hash );
endif;
	//sp_trace('match', $match);
	//sp_trace('match_hash', $match_hash);
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

	update_post_meta( $match_id, 'sp_day', $match['matchDate'] );
	// Update venue
	wp_set_object_terms( $match_id, $match['venue'], 'sp_venue', false );

	$players = array();
	$team_terms = array();
	foreach ( $match['teams'] as $team_name => $team_match_data ):
		//build player dtos 

		//build team dto

		//$team_name_actual =  $this->teamName($team_match_data['players']);
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

//sp_trace('team_match_data',$team_match_data);
		list($player1_name, $player2_name) = $team_match_data['players'];

		$p1m = $this->player_meta($match, $player1_name);

		$p2m = $this->player_meta($match, $player2_name);


		if($match['matchSection']=='XD'):
			$p1m['gender'] = 'M';
			$p2m['gender'] = 'F';
		else:
			$p1m['gender'] = $match['matchSection'] == 'MD'?'M':'F';
			$p2m['gender'] = $p1m['gender'];
		endif;
		
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
		//$k = array();
		$players[ $team_id ] = array();
		if($meta1['player_id'] != null):
			//$k[$meta1['player_id']] =  array('number' => $meta1['player_number'], 'ap'=> $ap);
			$players[ $team_id ][$meta1['player_id']] = array('number' => $meta1['player_number'], 'ap'=> $ap);
		endif;

		if($meta2['player_id'] != null):
			//$k[$meta2['player_id']] =  array('number' => $meta2['player_number'], 'ap'=> $ap);
			$players[ $team_id ][$meta2['player_id']] = array('number' => $meta2['player_number'], 'ap'=> $ap);
		endif;

		//$players[ $team_id ] = $k;

		//alt formula
		$tpf = 
		      $team_match_data['results']['gap'] 
			+ $team_match_data['results']['gbp']
			+ $team_match_data['results']['gcp']
			+ $team_match_data['results']['gdp']
			+ $team_match_data['results']['gep'];

		$team_terms[ $team_id ] = array('tpf' => $tpf, 'outcomeLabel'=> $team_match_data['outcomeLabel']);

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
		//sp_trace('team_name', $team_name);
		//sp_trace('outcomeLabel', $outcome);
		

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
		

	endforeach;
	$all_points = 0;
//sp_trace('players_b', $players);

	foreach ($team_terms as $term) {
		$all_points += $term['tpf'];//total scored game points for
	}
	//sp_trace('team_terms', $team_terms);
	foreach ($team_terms as $team_id => $term) {
		$t= ($team['outcomeLabel'] == 'Won') 
			? max(0.51, $term['tpf']/$all_points)
			: min(0.49, $term['tpf']/$all_points)
		;

//$ap = intval((11 - $match['matchGrade']) * 1.05 * 3 * 210 * $t / 2);
		$setting = $match['formatSetting'] == true ? 1.05 : 1;
		$ap = intval((11 - $match['matchGrade']) * $setting * intval($match['formatMatch']) * intval($match['formatGame']) * 10 * $t / 2);
		//sp_trace('ap',$ap);
		foreach ($players[$team_id] as $player_id => $player_dto) {
			$players[$team_id][$player_id]['ap'] = $ap;
		}
	}

	update_post_meta( $match_id, 'sp_specs', array('grade'=> $match['matchGrade'], 'section'=> $match['matchSection'] ));//winfactor lostfactor

	update_post_meta( $match_id, 'sp_eventsection', $match['matchSection'] );//winfactor lostfactor

	// Add player performance to last event if available
	if ( isset( $match_id ) && isset( $players ) && sizeof( $players ) > 0 ):
		sp_trace('players', $players);
		update_post_meta( $match_id, 'sp_players', $players );
	endif;
	
	$positions = array();
	$all_positions = array(58=>'MS',59=>'WS', 60=>'XD',61=>'MD',62=>'WD');
	$p = array(array_search($match['matchSection'], $all_positions));
	//sp_trace('mpos', $p);
	if($p)
		wp_set_object_terms( $match_id, $p, 'sp_position', true );

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
	$fullname = "$firstname $lastname";
	return array(
		'firstname' => $firstname,
		'lastname' => $lastname,
		'name' => $fullname,
		'gender' => $gender,
		'grade' => $grade,
		'rl' => (mt_rand(0,1) == 0 ? 'R' : 'L'),
		'id' => $id,
		'pseudo' => 'PS-' . $fullname, 
		'usepseudo' => null,//mt_rand(0,4) ? null : 'Y',
		'bi' => $id, 
		'height' => mt_rand(159,205),
		'club' => mt_rand(0,1)?'SD':'DB', 
		'playrorl' => mt_rand(0,1)?'R':'L',
		'nationality' => array_rand(SP()->countries->countries, 1)
	);
}
function random_players(){
	$all_players = array();
	$id = 0;
	$excluded = array();
	for($grade = 1; $grade < 11; $grade++):
		for($i = 0; $i < 80; $i++): //all grades
			$gender = mt_rand(0,1)?'F':'M';
			$rp = $this->random_player($gender, $grade, $id);
			if(! in_array($rp['name'], $excluded)){
				array_push($excluded, $rp['name']);
				//$all_players[$rp['name']] = $rp;
				array_push($all_players, $rp);
				$id++;
			}

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
		if($awc == 2 || $bwc == 2) //best of 3, the match is resolved to whoever take 2 games first
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
	$pa = array();
	$pb = array();
	$pc = array();
	$pd = array();
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
		sp_trace('pa', $excluded);
		die();
	}
	if($pb['name'] == null){
		sp_trace('pb', $excluded);
		die();
	}
	if($pc['name'] == null){
		sp_trace('pc', $excluded);
		die();
	}
	if($pd['name'] == null){
		sp_trace('pd', $excluded);
		die();
	}
	if(team_x == $team_y){
		sp_trace('team_x', $team_x);
		die();
	}
	return $teams_in_match;
}
function player_title($player){
	if($player['usepseudo'] == Y)
		return $player['pseudo'];
	else
		return $player['name'];
}

function match_points_imploded($format, $max){
	$result = array();
	$points = $this->random_match_points($format, $max);
	//$points = $this->random_match_points_complete($format, $max);
	array_push($result, implode ('|' , $points[0]));
	array_push($result, implode ('|' , $points[1]));
	return $result;
}
function build_rank_history_report(){
	$result = array('player_id' => '', 'date_by' => '', 'rank_points' => '', 'rank_id' => '', 'direction' => '');
}
function import_auto_gen( $array = array(), $columns = array( 'post_title' ) ) {

	$annual_events = array(
	'Christmas Bonanza' => array(
		'title'=>'Christmas Bonanza',
		'date'=>'2018/12/29',
		'league'=>'Bonanza',
		'venue'=>'Baldoyle',
		'formatGame' => '21',
		'formatSetting' => true,
		'formatMatch' => '3',
		'grades'=>array(3),//,6,8
		'sections'=>array( 'WD'),// ,'XD' ,'MD'
		),
/*
	'Inter County' => array(
		'title'=>'Inter County',
		'date'=>'2019/02/10',
		'league'=>'CAC',
		'venue'=>null,
		'formatGame' => '21',
		'formatMatch' => '3',
		'grades'=>array(2, 4, 6, 8, 10),
		'sections'=>array('WD', 'XD' ,'MD'),
		),
	'St Valentines' => array(
		'title'=>'St Valentines',
		'date'=>'2019/02/16',
		'league'=>'Bonanza',
		'venue'=>'Baldoyle',
		'formatGame' => '21',
		'formatMatch' => '2',
		'grades'=>array(3),//,6,8
		'sections'=>array( 'XD'),
		),
	'Good Friday' => array(
		'title'=>'Good Friday',
		'date'=>'2019/04/01',
		'league'=>'Bonanza',
		'venue'=>'Baldoyle',
		'formatGame' => '21',
		'formatMatch' => '2',
		'grades'=>array(3),//,6,8
		'sections'=>array('WD', 'XD', 'MD'),
		),
	*/
	//more
	);
	//settings.php
	define('BR_DEPLOYMENT', 'LIVE');//todo use it
	//include('settings.php')
	if(defined(BR_DEPLOYMENT) && BR_DEPLOYMENT == 'PROD'){
		$a = array( 'WD', 'XD', 'MD');
	}
	$seasons = array(2018);//, 2017, 2018
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

	//sp_trace('teams_in_alltimes', $teams_in_alltimes);
	$raw_import = array();
	foreach ($teams_in_alltimes as $season => $teams_in_season) {
		foreach ($teams_in_season as $event_title => $teams_in_eventX) {
			foreach ($teams_in_eventX as $p => $q) {
				foreach ($q as $event_label => $teams_in_event) {
					//sp_trace('event_label', $event_label);
					foreach ($teams_in_event as $event_sections) {
						$format = $annual_events[$event_label]['formatMatch'];
						$max = $annual_events[$event_label]['formatGame'];
						foreach ($event_sections as $section => $section_teams){
							$isMatchFirstRow = true;
							$points_imploded = $this->match_points_imploded($format, $max);
							foreach ($section_teams as $teamLabel => $team) {
								//sp_trace('teamLabel', $teamLabel);
								//sp_trace('section_teams', $section_teams);
//2018/12/29,Baldoyle,8,MD,A|B,21|12|21
//,,,,E|F,15|21|19
								if($isMatchFirstRow){
									$matchDate = sp_random_date();//$annual_events[$event_label]['date']
									array_push($raw_import, );
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

	//sp_trace('raw_import', $raw_import);
	//sp_trace('file_import', $array);
	$league = $annual_events['Christmas Bonanza']['league'];
	$season = $seasons[0];
	//$annual_events['Christmas Bonanza']['venue']
	//$annual_events['Christmas Bonanza']['title']

	$event_meta = array('sp_format' => $event_format, 'league' => $league, 'season' => $season.'', 'date_format' => $date_format);
	$this->import_matches($raw_import, $event_meta, $columns);
	//$this->import_matches_r($raw_import, $event_meta, $columns);
}

function import( $array = array(), $columns = array( 'post_title' ) ) {
	$this->imported = $this->skipped = 0;
	//$aa = array('k1' => '123');
	//sp_trace('aa', $aa, true, true);
	//$this->mr_usepseudo();
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

	//$this->import_auto_gen($array, $event_meta, $columns);

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
			sp_trace('import_end',$import_end);
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

