<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if ( class_exists( 'WP_Importer' ) ) {
	class SP_Event_Importer_Base extends SP_Importer {
		public function __construct() {
			sp_trace('SP_Event_Importer_Base', $this);
		}

	protected function import_matches_r( $rows_in = array(), $event_meta = array(), $columns = array( 'post_title' ) ) {
	sp_trace('event_meta', $event_meta);
	$rows = array_chunk( $rows_in, sizeof( $columns ) );

	$event_format = sp_arr_nvl($event_meta,'event_format', 'league');;
	$league = sp_arr_nvl($event_meta,'sp_league', -1);
	$season = sp_arr_nvl($event_meta,'sp_season', -1);
	$date_format = sp_arr_nvl($event_meta,'sp_date_format','yyyy/mm/dd');

	// Get labels from result and performance post types
	//$result_labels = sp_get_var_labels( 'sp_result' );
	//$performance_labels = sp_get_var_labels( 'sp_performance' );

	$matchImportIdx = 0;
	$importSize = sizeof($rows);
	$import_data = array();
	$import_data['sp_auto_create_player'] = $event_meta['sp_auto_create_player'];
	$matches = array();
	$teamaName = $teambName = null;
	while ( $matchImportIdx < $importSize ):

		$row_check = array_filter( $rows[$matchImportIdx] );

		if ( !empty( $row_check ) ) {
			//$commonDetails = array_slice( $rows[$matchImportIdx], 0, 4 );
			//'sp_format' => $event_format, 'league' => $league, 'season' => $season.'', 'date_format' => $date_format
			$grade = sp_nvl($rows[$matchImportIdx][0], $rows[$matchImportIdx + 1][0]);
			$section = sp_nvl($rows[$matchImportIdx][1], $rows[$matchImportIdx +1 ][1]);
			$rowA = array_slice( $rows[$matchImportIdx], 2);
			$rowB = array_slice( $rows[$matchImportIdx + 1], 2);
			$commonDetails = array(
				$event_meta['sp_match_date'],
				$event_meta['sp_venue'],
				$section,
				$grade,
				$league,
				$season
			);
			sp_trace('commonDetails', $commonDetails);
			sp_trace('rowA', $rowA);
			sp_trace('rowB', $rowB);

			$match = $this->build_match_c($commonDetails, $rowA, $rowB);
			//sp_trace('match', $match);
			assert($match != null);
			array_push ($matches, $match);

			//array_push ($matches, $this->build_random_match());
		}

		$matchImportIdx += 2;
	endwhile;
	$mc = sizeof($matches);

	$import_data['season'] = $season;
	$import_data['league'] = $league;
	$import_data['event_format'] = $event_format;
	$import_data['date_format'] = $date_format;
	$import_data['matches'] = array();
	foreach ( $matches as $match ):
		$import_data['matches'] = array_merge($import_data['matches'], array( $this->match_hash($match) => $match));
	endforeach;
	sp_trace('import_data', $import_data);

	//upsert input data from $import_data
	$this->commit_import($import_data);
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
function match_upsert(&$match){
	assert($match != null);

	$match_hash = $this->match_hash($match);

	global $post;
	$cc_args = array(
	    'posts_per_page'   => -1,
	    'post_type'        => 'sp_event',
	    'post_status'      => 'publish',
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
	if ( array_key_exists('event_format', $match) ):
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

	update_post_meta( $match_id, 'sp_day',  $match['matchDate']);
	$match['id'] = $match_id;
	$this->imported++;
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
function player_upsert(&$player, $auto_create_player = false){
	$player_title = $player['title'];
	$player1_object = get_page_by_title( stripslashes( $player_title ), OBJECT, 'sp_player' );
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
	elseif($auto_create_player == 'Y'):
		// Insert player
		$post_title = wp_strip_all_tags( $player_title );
		$player_id = wp_insert_post( array( 'post_type' => 'sp_player', 'post_status' => 'publish', 'post_title' => $post_title) );

		// Flag as import
		update_post_meta( $player_id, '_sp_import', 1 );

		// Update number
		update_post_meta( $player_id, 'sp_number', $player_id );
		if(array_key_exists('nationality', $player) && $player['nationality'] != '')
			update_post_meta( $player_id, 'sp_nationality', $player['nationality']);

		update_post_meta( $player_id, 'sp_metrics', 
			array(
				'grade' => sp_arr_nvl($player,'grade'),
				'pseudo' => sp_arr_nvl($player,'pseudo'),
				'usepseudo' => sp_arr_nvl($player,'usepseudo'),
				'bi' => sp_arr_nvl($player,'bi'),
				'height' => sp_arr_nvl($player,'height'),
				'club' => sp_arr_nvl($player,'club'),
				'playrorl' => sp_arr_nvl($player,'playrorl'),
				'gender' => sp_arr_nvl($player,'gender')
				 ) );

			wp_set_object_terms( $player_id, 
		$player['gender'] == 'F' ?
		array(59, 60, 62):
		array(58, 60, 61),
		// array(62):
		// array(61),		
		 'sp_position', true );

	endif;
	$player['id'] = $player_id;
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

			sp_trace('match_id',$match_id);
			sp_trace('team_id',$team_id);

			// Update event results
			//$event_results = array();
			$event_results[$team_id] = $team_match['results'];

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
				sp_trace('sp_auto_create_player', $import_data['sp_auto_create_player']);

				$this->player_upsert($player_value, $import_data['sp_auto_create_player']);
				$player_id = $player_value['id'];
				if($player_id == null){
					sp_trace('failed to upsert player', $player_value);
					continue;
				}
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
				      sp_arr_nvl($team_match['results'],'gap',0) 
					+ sp_arr_nvl($team_match['results'],'gbp',0) //* 100 
					+ sp_arr_nvl($team_match['results'],'gcp',0) //* 10000
					+ sp_arr_nvl($team_match['results'],'gdp',0)
					+ sp_arr_nvl($team_match['results'],'gep',0)
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
function teamNameFromPiped_initials($input){
	//sp_trace('input', $input);
	$initials = array();
	$two_players = explode( $this->detect_separator($input), $input );
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
//{player  1 initials} with {player  2 initials}
//{club} G{grade} {section}{unique id}
//{root team} G{grade} {section}{unique id}
	return implode(' with ', $resultInitials);
	//return 'Team '. md5($input);
}
function detect_separator($input){
	$default_separator = '|';
	$result = null;
	if($input != null){
		if(strpos($input, '.') !== false):
			$result = '.';
		elseif(strpos($input, '/') !== false):
			$result = '/';
		endif;
	}

	return sp_nvl($result, $default_separator);
}
function teamNameFromTemplate($parent_team, $grade, $section, $suffix = ''){
	$result = "$parent_team G$grade $section$suffix";
	return $result;
}
function teamNameShortFromTemplate($parent_team, $grade, $section, $suffix = ''){
	$result = "$parent_team $section$suffix";
	return $result;
}
function build_match_c($commonDetails, $rowA, $rowB){
	$result = array();
	$result['season'] = $commonDetails[5];
	$result['league'] = $commonDetails[4];
	$result['matchDate'] = sp_nvl($commonDetails[0],'2019/01/01');
	$result['venue'] = sp_nvl($commonDetails[1],'Baldoyle');
	$result['matchSection'] = sp_nvl($commonDetails[2], 'MD');
	$result['matchGrade'] = sp_nvl($commonDetails[3], 11);

	$result['teams'] = array();

	$points_a = explode( $this->detect_separator($rowA[1]), $rowA[1] );
	$points_b = explode( $this->detect_separator($rowB[1]), $rowB[1] );

	$taTitle = $this->teamNameFromPiped_initials($rowA[0]);
	$team_a_parent = 'Co Dublin';//todo:dynamic
	$team_b_parent = 'Co Meath';//todo:dynamic
	$grade = $result['matchGrade'];
	$section = $result['matchSection'];
	$suffix_a = $rowA[2];
	$suffix_b = $rowB[2];

	$taTitle = $this->teamNameFromTemplate($team_a_parent, $grade, $section);
	$tbTitle = $this->teamNameFromTemplate($team_b_parent, $grade, $section);

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
	sp_trace('points_a', $points_a);
	if($points_a[0] != 0)://are there any reult points?
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
else:
	sp_trace('no game results',$result);
endif;
	$result['matchTitle'] = $taTitle . ' ' . get_option( 'sportspress_event_teams_delimiter', 'vs' ) . ' ' . $tbTitle;
	//{season} {league} {section} {grade} {team 1 short} vs {team 2 short}
	return $result;
}
	}
}