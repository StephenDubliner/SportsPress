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

	$points_a = explode( '|', $rowA[1] );
	$points_b = explode( '|', $rowB[1] );
	$players_a = explode( '|', $rowA[0] );
	$players_b = explode( '|', $rowB[0] );

	$taTitle = str_replace('|',' with ', $rowA[0]);
	$tbTitle = str_replace('|',' with ', $rowB[0]);

	$isFirstGame = true;
	foreach( $points_a as $gkey => $points ):
		if($isFirstGame){
			$result['teams'][$taTitle]['gw'] = $points > $points_b[$gkey] ? 1 : 0;
			$result['teams'][$taTitle]['gl'] = $points < $points_b[$gkey] ? 1 : 0;

			$result['teams'][$tbTitle]['gw'] = $result['teams'][$taTitle]['gl'];
			$result['teams'][$tbTitle]['gl'] = $result['teams'][$taTitle]['gw'];
		}
		else{
			$result['teams'][$taTitle][$points > $points_b[$gkey] ? 'gw' : 'gl']++;
			$result['teams'][$tbTitle][$points < $points_b[$gkey] ? 'gw' : 'gl']++;
		}

	endforeach;

	if($result['teams'][$taTitle]['gw'] > $result['teams'][$tbTitle]['gw']){
		$result['teams'][$taTitle]['outcome'] = 'Won';
		$result['teams'][$tbTitle]['outcome'] = 'Lost';
	}
	elseif($result['teams'][$taTitle]['gw'] = $result['teams'][$tbTitle]['gw']){
		$result['teams'][$taTitle]['outcome'] = 'Draw';
		$result['teams'][$tbTitle]['outcome'] = 'Draw';
	}
	else{
		$result['teams'][$taTitle]['outcome'] = 'Lost';
		$result['teams'][$tbTitle]['outcome'] = 'Won';
	}

	return $result;
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
while ( $matchImportIdx < $importSize ):
//print_r($rows);

				$row_check = array_filter( $rows[$matchImportIdx] );

				if ( !empty( $row_check ) ) {
					$commonDetails = array_slice( $rows[$matchImportIdx], 0, 3 );
					$rowA = array_slice( $rows[$matchImportIdx], 4);
					$rowB = array_slice($rows[$matchImportIdx+1], 4);

					//print_r($commonDetails);
					//print_r($rowA);
					//print_r($rowB);

					$matches[$matchImportIdx] = $this->build_match($commonDetails, $rowA, $rowB);
				}
	$matchImportIdx+=2;
endwhile;

print_r($matches);

foreach ( $matches as $match_idx => $match ):

	// Define post type args
	$args = array( 'post_type' => 'sp_event', 'post_status' => 'publish', 'post_date' => $date, 'post_title' => __( 'Event', 'sportspress' ) );
	// Insert event
	$match_id = wp_insert_post( $args );
	// Flag as import
	update_post_meta( $match_id, '_sp_import', 1 );

	foreach ( $match['teams'] as $team_name => $team_match_data ):

		// Find out if team exists
		$team_object = get_page_by_title( stripslashes( $team_name ), OBJECT, 'sp_team' );

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
	endforeach;
endforeach;


						// Add player performance to last event if available
			//if ( isset( $id ) && isset( $players ) && sizeof( $players ) > 0 ):
			//	update_post_meta( $id, 'sp_players', $players );
			//endif;

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

