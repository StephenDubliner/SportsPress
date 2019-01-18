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

function build_match($commonDetails, $rowA, $rowB){
	$result = array();
	$result['matchDate'] = $commonDetails[0];
	$result['venue'] = $commonDetails[1];
	$result['matchSection'] = $commonDetails[3];
	$result['matchGrade'] = $commonDetails[2];

	$result['teams'] = array();
	//print('rowA:');//Array ( [0] => A|B [1] => Win [2] => 21|12|21 [3] => 2|1 ) 
	//print_r($rowA);
	$points_a = explode( '|', $rowA[1] );
	$points_b = explode( '|', $rowB[1] );
	$players_a = explode( '|', $rowA[0] );
	$players_b = explode( '|', $rowB[0] );

	$taTitle = str_replace('|',' with ', $rowA[0]);
	$tbTitle = str_replace('|',' with ', $rowB[0]);

	$isFirstGame = true;
	$result['teams'][$taTitle]['results'] = array();
	$result['teams'][$tbTitle]['results'] = array();
	print_r('points_a:');
	print_r($points_a);
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
		endif;
		$result['teams'][$taTitle]['results'][ $game_key ] = $points;
		$result['teams'][$tbTitle]['results'][ $game_key ] = $points_b[$gkey];

	endforeach;

	// $result['teams'][$taTitle]['results']['gw'] = $result['teams'][$taTitle]['gw'];
	// $result['teams'][$tbTitle]['results']['gw'] = $result['teams'][$tbTitle]['gw'];
	// $result['teams'][$taTitle]['results']['gl'] = $result['teams'][$taTitle]['gl'];
	// $result['teams'][$tbTitle]['results']['gl'] = $result['teams'][$tbTitle]['gl'];	

	// if($result['teams'][$taTitle]['gw'] > $result['teams'][$tbTitle]['gw']){
	// 	$result['teams'][$taTitle]['outcome'] = 'Won';
	// 	$result['teams'][$tbTitle]['outcome'] = 'Lost';
	// }
	// elseif($result['teams'][$taTitle]['gw'] = $result['teams'][$tbTitle]['gw']){
	// 	$result['teams'][$taTitle]['outcome'] = 'Draw';
	// 	$result['teams'][$tbTitle]['outcome'] = 'Draw';
	// }
	// else{
	// 	$result['teams'][$taTitle]['outcome'] = 'Lost';
	// 	$result['teams'][$tbTitle]['outcome'] = 'Won';
	// }


	$result['matchTitle'] = $taTitle . ' ' . get_option( 'sportspress_event_teams_delimiter', 'vs' ) . ' ' . $tbTitle;
	return $result;
}

function link_player($player1_name, $league, $season, $match_id, $team_id){

	$player1_id = null;
	$player1_number = null;
						// Find out if player exists
					$player1_object = get_page_by_title( stripslashes( $player1_name ), OBJECT, 'sp_player' );

					// Get or insert player
					if ( $player1_object ):

						// Make sure player is published
						if ( $player_object->post_status != 'publish' ):
							wp_update_post( array( 'ID' => $player_object->ID, 'post_status' => 'publish' ) );
						endif;

						// Get player ID
						$player1_id = $player1_object->ID;

						// Get player number
						$player1_number = get_post_meta( $player1_id, 'sp_number', true );

					else:

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
					$result = array();
					//$result[ $player1_id ] = array('number' => $player1_number, 'ap'=> $aps);
					$result = array('player_id' => $player1_id,'player_number' => $player1_number);
//print_r($result);
					return $result;
					//return array('player_ap' => $player_ap);
					//return array('id'=>$player1_id, 'number'=>$player1_number);
}

		function import( $array = array(), $columns = array( 'post_title' ) ) {
			$this->imported = $this->skipped = 0;
			if ( ! is_array( $array ) || ! sizeof( $array ) ):
				$this->footer();
				die();
			endif;

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
			//print_r($rows);

			$row_check = array_filter( $rows[$matchImportIdx] );

			if ( !empty( $row_check ) ) {
				$commonDetails = array_slice( $rows[$matchImportIdx], 0, 3 );
				$rowA = array_slice( $rows[$matchImportIdx], 4);
				$rowB = array_slice( $rows[$matchImportIdx+1], 4);

				//print_r($commonDetails);
				//print_r($rowA);
				//print_r($rowB);

				array_push ($matches, $this->build_match($commonDetails, $rowA, $rowB));
			}
			$matchImportIdx+=2;
endwhile;
// print_r('matches');
// print_r($matches);
// print_r('ematches');

foreach ( $matches as $match ):

	$match_check = array_filter( $match );
	if ( empty( $match_check ) ) continue;

	// Define post type args
	$args = array( 'post_type' => 'sp_event', 'post_status' => 'publish', 'post_date' => $date, 'post_title' => $match['matchTitle'] );

	// Insert event
	$match_id = wp_insert_post( $args );

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

		list($player1_name, $player2_name) = $team_match_data['players'];
		$meta1 = $this->link_player($player1_name, $league, $season, $match_id, $team_id);
		$meta2 = $this->link_player($player2_name, $league, $season, $match_id, $team_id);

		$ap = $team_match_data['results']['gap'] * 10;
		$players[ $team_id ] = array(
			$meta1['player_id'] => array('number' => $meta1['player_number'], 'ap'=> $ap),
			$meta2['player_id'] => array('number' => $meta2['player_number'], 'ap'=> $ap)
		);
		//$players[ $team_id ] = array();

						// Get existing results
		$event_results = get_post_meta( $match_id, 'sp_results', true );

		// Create new array if results not exists
		if ( ! $event_results ):
			$event_results = array();
		endif;

		//print_r($team_match_data['results']);
		// Add team results to existing results
		$event_results[ $team_id ] = $team_match_data['results'];//$team_results;

		// Update event results
		update_post_meta( $match_id, 'sp_results', $event_results );
		
		update_post_meta( $match_id, 'sp_specs', array('grade'=> $match['matchGrade'], 'section'=> $match['matchSection'] ));//winfactor lostfactor


	endforeach;
	// Add player performance to last event if available
	if ( isset( $match_id ) && isset( $players ) && sizeof( $players ) > 0 ):
		print_r('PB');
		print_r($players);
		print_r('PE');
		update_post_meta( $match_id, 'sp_players', $players );
	endif;	


	$this->imported++;
endforeach;



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

