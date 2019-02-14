<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if ( class_exists( 'SP_Event_Importer_Base' ) ) {
	class SP_EventC_Importer extends SP_Event_Importer_Base {

		/**
		 * __construct function.
		 *
		 * @access public
		 * @return void
		 */
		public function __construct() {
			$this->import_page = 'sp_eventC_csv';
			$this->import_label = __( 'Import previewed matches', 'sportspress' );
			$this->columns = array(
				//'post_date' => __( 'Date', 'sportspress' ),
				//'post_time' => __( 'Time', 'sportspress' ),
				//'sp_venue' => __( 'Venue', 'sportspress' ),
				//'sp_team' => __( 'Teams', 'sportspress' ),
				'sp_grade' => __( 'Grade', 'sportspress' ),
				'sp_section' => __( 'Section', 'sportspress' ),
				'sp_player' => __( 'Players', 'sportspress' ),
				//'sp_outcome' => __( 'Outcome', 'sportspress' ),
				'sp_results' => __( 'Results', 'sportspress' ),
				//'sp_games' => __( 'Games', 'sportspress' ),
			);
			//$performance_labels = sp_get_var_labels( 'sp_performance' );
			//if ( $performance_labels && is_array( $performance_labels ) && sizeof( $performance_labels ) )
			//	$this->columns = array_merge( $this->columns, $performance_labels );
		}
// function handle_upload() {
// 	echo '<p><strong>' . __( 'custom handle_upload.', 'sportspress' ) . '</strong><br />';
// 	return true;
// }
		function dispatch() {
			$this->header();

			if ( ! empty( $_POST['delimiter'] ) )
				$this->delimiter = stripslashes( trim( $_POST['delimiter'] ) );

			if ( ! $this->delimiter )
				$this->delimiter = ',';

			$step = empty( $_GET['step'] ) ? 0 : (int) $_GET['step'];
			sp_trace('c_dispatch_step',$step);

			switch ( $step ):
				case 0:
					$this->greet();
					//check_admin_referer( 'import-upload' );

					$this->table( null );
					break;
				// case 1:
				// 	break;
				case 2:
					check_admin_referer( 'import-upload' );
					if ( isset( $_POST['sp_import'] ) ):
						sp_trace('T_POST[sp_import]',$_POST['sp_import']);

						$columns = array_filter( sp_array_value( $_POST, 'sp_columns', array( 'post_title' ) ) );
						$this->import( $_POST['sp_import'], array_values( $columns ) );

					else:
						sp_trace('F_POST[sp_import]',$_POST['sp_import']);
					endif;
					break;
			endswitch;
			$this->footer();
		}
function table( $file ) {
	global $wpdb;

	$this->imported = $this->skipped = 0;

	// if ( ! is_file($file) ):
	// 	$this->footer();
	// 	die();
	// endif;

	ini_set( 'auto_detect_line_endings', '1' );

	if (true 
		//( $handle = fopen( $file, "r" ) ) !== FALSE 
	):

		$header = null;//fgetcsv( $handle, 0, $this->delimiter );

		if ( sizeof( $header ) >= 1  || true ):
			$action = 'admin.php?import=' . $this->import_page . '&step=2';
			?>
			<form enctype="multipart/form-data" id="import-upload-form" class="sportspress" method="post" action="<?php echo esc_attr(wp_nonce_url($action, 'import-upload')); ?>">
				<?php $this->options(); ?>
				<table class="wp-list-table sp-data-table sp-import-table widefat fixed pages">
					<thead>
						<tr>
							<?php foreach ( $this->columns as $key => $label ): ?>
								<th scope="col" class="manage-column">
									<?php $this->dropdown( $key ); ?>
								</th>
							<?php endforeach; ?>
							<th scope="col" class="sp-actions-column">
								<a href="#" title="<?php _e( 'Insert row after', 'sportspress' ); ?>" class="dashicons dashicons-plus-alt sp-add-row sp-add-first"></a>
							</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$row = '';
						$rowsTotal = 3;
						while ( $rowsTotal-- > 0
							//( $row = fgetcsv( $handle, 0, $this->delimiter )) !== FALSE 
							): ?>
							<tr>
								<?php $index = 0; foreach ( $this->columns as $key => $label ): $value = sp_array_value( $row, $index ); ?>
									<td>
										<input type="text" class="widefat" value="<?php echo esc_attr( $value ); ?>" name="sp_import[]"<?php if ( in_array( $key, $this->optionals ) ) { ?> placeholder="<?php _e( 'Default', 'sportspress' ); ?>"<?php } ?>>
									</td>
								<?php $index ++; endforeach; ?>
								<td class="sp-actions-column">
									<a href="#" title="<?php _e( 'Delete row', 'sportspress' ); ?>" class="dashicons dashicons-dismiss sp-delete-row"></a>
									<a href="#" title="<?php _e( 'Insert row after', 'sportspress' ); ?>" class="dashicons dashicons-plus-alt sp-add-row"></a>
								</td>
							</tr>
						<?php $this->imported++; endwhile; ?>
						<tr>
							<?php foreach ( $this->columns as $key => $label ): ?>
								<td>
									<input type="text" class="widefat" name="sp_import[]">
								</td>
							<?php endforeach; ?>
							<td class="sp-actions-column">
								<a href="#" title="<?php _e( 'Insert row after', 'sportspress' ); ?>" class="dashicons dashicons-plus-alt sp-add-row"></a>
							</td>
						</tr>
				    </tbody>
				</table>
				<p class="sp-post-count alignright">
					<?php printf( __( 'Displaying %s&#8211;%s of %s', 'sportspress' ), 1, $this->imported+1, $this->imported+1 ); ?>
				</p>
				<p class="submit">
					<input type="submit" class="button button-primary button-hero" value="<?php echo esc_attr( $this->import_label ); ?>" />
				</p>
			</form>
			<?php
		else:

			echo '<p><strong>' . __( 'Sorry, there has been an error.', 'sportspress' ) . '</strong><br />';
			_e( 'The CSV is invalid.', 'sportspress' ) . '</p>';
			$this->footer();
			die();

		endif;

	    //fclose( $handle );
	endif;
}

function import( $rows = array(), $columns = array( 'post_title' ) ) {
	$this->imported = $this->skipped = 0;
	sp_trace('SP_EventC_Importer_import','Y');
	// Get event format, league, and season from post vars
	$event_format = ( empty( $_POST['sp_format'] ) ? false : $_POST['sp_format'] );
	$league = ( sp_array_value( $_POST, 'sp_league', '-1' ) == '-1' ? false : $_POST['sp_league'] );
	$season = ( sp_array_value( $_POST, 'sp_season', '-1' ) == '-1' ? false : $_POST['sp_season'] );
	$date_format = ( empty( $_POST['sp_date_format'] ) ? 'yyyy/mm/dd' : $_POST['sp_date_format'] );
	$venue = sp_array_value( $_POST, 'venue', '-1' ) == '-1' ? null : $_POST['venue'];
	$matchDate = sp_array_value( $_POST, 'matchDate', '-1' ) == '-1' ? null : $_POST['matchDate'];

	$event_meta = array('sp_format' => $event_format, 'league' => $league, 'season' => $season, 'date_format' => $date_format, 'venue' => $venue, 'matchDate' => $matchDate);
	//delete all?
	//$this->delete_all_of_type();
	//do players exist
	//get the unique id for the import and set in _sp_import
	//create team if not exist
	//update team link to the league, season
	//set the team featured image
	//is there event already for this row
	//create event: smart title, points format, setting
	//link the event to the league, season, teams, venue
	//featured image for the match
	//store results if provided
	//calc rank points
	//generate:gw,gl,outcome

	$this->import_matches_r($rows, $event_meta, $this->columns);
	
	// Show Result
	echo '<div class="updated settings-error below-h2"><p>
		'.sprintf( __( 'Import complete - imported 
			<strong>%s</strong> eventsC and skipped 
			<strong>%s</strong>.', 'sportspress' ),
		 $this->imported,
		 $this->skipped
		 ).'
	</p></div>';

	sp_trace('columns', $columns);
	sp_trace('rows', $rows);
	sp_trace('event_format', $event_format);
	sp_trace('league', $league);
	sp_trace('season', $season);
	sp_trace('date_format', $date_format);

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
			//wp_import_upload_form( 'admin.php?import=sp_eventC_csv&step=1' );
			echo '</div>';
		}

	public static function get_players_field() {
		$limit = 2;// get_option( 'sportspress_event_teams', 2 );
		$teams = array();//(array) get_post_meta( $post->ID, 'sp_team', false );
		$post_type = 'sp_player';//sp_get_post_mode_type( $post->ID );
		if ( $limit && 'sp_player' !== $post_type ) {
			for ( $i = 0; $i < $limit; $i ++ ):
				$team = array_shift( $teams );
				?>
				<div class="sp-instance">
					<p class="sp-tab-select sp-title-generator">
					<?php
					$args = array(
						'post_type' => $post_type,
						'name' => 'sp_team[]',
						'class' => 'sportspress-pages',
						'show_option_none' => __( '&mdash; None &mdash;', 'sportspress' ),
						'values' => 'ID',
						'selected' => $team,
						'chosen' => true,
						'tax_query' => array(),
					);
					if ( 'yes' == get_option( 'sportspress_event_filter_teams_by_league', 'no' ) ) {
						$league_id = sp_get_the_term_id( $post->ID, 'sp_league', 0 );
						if ( $league_id ) {
							$args['tax_query'][] = array(
								'taxonomy' => 'sp_league',
								'terms' => $league_id,
							);
						}
					}
					if ( 'yes' == get_option( 'sportspress_event_filter_teams_by_season', 'no' ) ) {
						$season_id = sp_get_the_term_id( $post->ID, 'sp_season', 0 );
						if ( $season_id ) {
							$args['tax_query'][] = array(
								'taxonomy' => 'sp_season',
								'terms' => $season_id,
							);
						}
					}
					if ( ! sp_dropdown_pages( $args ) ) {
						unset( $args['tax_query'] );
						sp_dropdown_pages( $args );
					}
					?>
					</p>
					<?php
					$tabs = array();
					$sections = get_option( 'sportspress_event_performance_sections', -1 );
					if ( 0 == $sections ) {
						$tabs['sp_offense'] = array(
							'label' => __( 'Offense', 'sportspress' ),
							'post_type' => 'sp_player',
						);
						$tabs['sp_defense'] = array(
							'label' => __( 'Defense', 'sportspress' ),
							'post_type' => 'sp_player',
						);
					} elseif ( 1 == $sections ) {
						$tabs['sp_defense'] = array(
							'label' => __( 'Defense', 'sportspress' ),
							'post_type' => 'sp_player',
						);
						$tabs['sp_offense'] = array(
							'label' => __( 'Offense', 'sportspress' ),
							'post_type' => 'sp_player',
						);
					} else {
						$tabs['sp_player'] = array(
							'label' => __( 'Players', 'sportspress' ),
							'post_type' => 'sp_player',
						);
					}
					$tabs['sp_staff'] = array(
						'label' => __( 'Staff', 'sportspress' ),
						'post_type' => 'sp_staff',
					);
					?>
					<?php if ( $tabs ) { ?>
					<ul id="sp_team-tabs" class="sp-tab-bar category-tabs">
						<?php
							$j = 0;
							foreach ( $tabs as $slug => $tab ) {
								?>
								<li class="<?php if ( 0 == $j ) { ?>tabs<?php } ?>"><a href="#<?php echo $slug; ?>-all"><?php echo $tab['label']; ?></a></li>
								<?php
								$j++;
							}
						?>
					</ul>
					<?php
						$j = 0;
						foreach ( $tabs as $slug => $tab ) {
							do_action( 'sportspress_event_teams_meta_box_checklist', $post->ID, $tab['post_type'], ( 0 == $j ? 'block' : 'none' ), $team, $i, $slug );
							$j++;
						}
					?>
					<?php } ?>
				</div>
				<?php
			endfor;
		} else {
			?>
			<p><strong>Select Players:</strong></p>
			<?php
			$args = array(
				'post_type' => $post_type,
				'name' => 'sp_team[]',
				'selected' => $teams,
				'values' => 'ID',
				'class' => 'widefat',
				'property' => 'multiple',
				'chosen' => true,
				'placeholder' => __( 'None', 'sportspress' ),
			);
			if ( ! sp_dropdown_pages( $args ) ):
				sp_post_adder( $post_type, __( 'Add New', 'sportspress' )  );
			endif;
		}
		wp_nonce_field( 'sp-get-players', 'sp-get-players-nonce', false );
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
						<th scope="row"><label>Match day</label><br/></th>
						<td>
<input type="text" class="widefat" value="<?php echo esc_attr( $value ); ?>" name="sp_match_day" placeholder="">
							<?php 
						//SP_EventC_Importer::get_players_field();
						?></td>
					</tr>
					<tr>
						<th scope="row"><label>Venue</label><br/></th>
						<td><?php
						$args = array(
							'taxonomy' => 'sp_venue',
							'name' => 'sp_venue',
							'values' => 'slug',
							'show_option_none' => __( '&mdash; Not set &mdash;', 'sportspress' ),
						);
						if ( ! sp_dropdown_taxonomies( $args ) ):
							// echo '<p>' . __( 'None', 'sportspress' ) . '</p>';
							// sp_taxonomy_adder( 'sp_league', 'sp_team', __( 'Add New', 'sportspress' ) );
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

