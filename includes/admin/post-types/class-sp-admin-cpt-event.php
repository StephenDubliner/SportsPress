<?php
/**
 * Admin functions for the events post type
 *
 * @author 		ThemeBoy
 * @category 	Admin
 * @package 	SportsPress/Admin/Post_Types
 * @version		2.6.5
 */

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if ( ! class_exists( 'SP_Admin_CPT' ) )
	include( 'class-sp-admin-cpt.php' );

if ( ! class_exists( 'SP_Admin_CPT_Event' ) ) :

/**
 * SP_Admin_CPT_Event Class
 */
class SP_Admin_CPT_Event extends SP_Admin_CPT {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->type = 'sp_event';

		// Post title fields
		add_filter( 'enter_title_here', array( $this, 'enter_title_here' ), 1, 2 );

		// Empty data filter
		add_filter( 'wp_insert_post_empty_content', array( $this, 'wp_insert_post_empty_content' ), 99, 2 );

		// Before data updates
		add_filter( 'wp_insert_post_data', array( $this, 'wp_insert_post_data' ), 99, 2 );

		// Admin Columns
		add_filter( 'manage_edit-sp_event_columns', array( $this, 'edit_columns' ) );
		add_filter( 'manage_edit-sp_event_sortable_columns', array( $this, 'sortable_columns' ) );
		add_action( 'pre_get_posts', array( $this, 'orderby_columns' ) );
		add_action( 'manage_sp_event_posts_custom_column', array( $this, 'custom_columns' ), 2, 2 );

		// Filtering
		add_action( 'restrict_manage_posts', array( $this, 'filters' ) );
		add_filter( 'parse_query', array( $this, 'filters_query' ) );
		
		// Quick edit
		add_action( 'quick_edit_custom_box', array( $this, 'quick_edit_competitions' ), 10, 2 );
		add_action( 'save_post', array( $this, 'quick_save' ) );
		
		// Bulk edit
		add_action( 'bulk_edit_custom_box', array( $this, 'bulk_edit_competitions' ), 10, 2 );
		add_action( 'wp_ajax_save_bulk_edit_sp_event', array( $this, 'bulk_save' ) );
		
		// Call SP_Admin_CPT constructor
		parent::__construct();
	}

	/**
	 * Change title boxes in admin.
	 * @param  string $text
	 * @param  object $post
	 * @return string
	 */
	public function enter_title_here( $text, $post ) {
		if ( $post->post_type == 'sp_event' )
			return __( '(Auto)', 'sportspress' );

		return $text;
	}

	/**
	 * Mark as not empty when saving event if teams are selected for auto title.
	 *
	 * @param array $maybe_empty
	 * @param array $postarr
	 * @return bool
	 */
	public function wp_insert_post_empty_content( $maybe_empty, $postarr ) {
		if ( $maybe_empty && 'sp_event' === sp_array_value( $postarr, 'post_type' ) ):
			$teams = sp_array_value( $postarr, 'sp_team', array() );
			$teams = array_filter( $teams );
			if ( sizeof( $teams ) ) return false;
		endif;

		return $maybe_empty;
	}

	/**
	 * Auto-generate an event title based on the team playing if left blank.
	 *
	 * @param array $data
	 * @param array $postarr
	 * @return array
	 */
	public function wp_insert_post_data( $data, $postarr ) {
		if ( $data['post_type'] == 'sp_event' && $data['post_title'] == '' ):

			$teams = sp_array_value( $postarr, 'sp_team', array() );
			$teams = array_filter( $teams );

			$team_names = array();
			foreach ( $teams as $team ):
				while ( is_array( $team ) ) {
					$team = array_shift( array_filter( $team ) );
				}
				if ( $team > 0 ) $team_names[] = sp_team_short_name( $team );
			endforeach;

			$team_names = array_unique( $team_names );

			$reverse_teams = get_option( 'sportspress_event_reverse_teams', 'no' ) === 'yes' ? true : false;
			if ( $reverse_teams ) {
				$team_names = array_reverse( $team_names );
			}

			$data['post_title'] = implode( ' ' . get_option( 'sportspress_event_teams_delimiter', 'vs' ) . ' ', $team_names );

		endif;

		return $data;
	}

	/**
	 * Change the columns shown in admin.
	 */
	public function edit_columns( $existing_columns ) {
		unset( $existing_columns['author'], $existing_columns['comments'] );
		$columns = array_merge( array(
			'cb' => '<input type="checkbox" />',
			'sp_format' => '<span class="dashicons sp-icon-calendar sp-tip" title="' . __( 'Format', 'sportspress' ) . '"></span>',
			'title' => null,
			'date' => __( 'Date', 'sportspress' ),
			'sp_time' => __( 'Time', 'sportspress' ),
			'sp_team' => __( 'Teams', 'sportspress' ),
			'sp_competition' => __( 'Competition', 'sportspress' ),
			'sp_league' => __( 'League', 'sportspress' ),
			'sp_season' => __( 'Season', 'sportspress' ),
			'sp_venue' => __( 'Venue', 'sportspress' ),
			'sp_day' => __( 'Match Day', 'sportspress' ),
		), $existing_columns, array(
			'title' => __( 'Event', 'sportspress' ),
		) );
		return apply_filters( 'sportspress_event_admin_columns', $columns );
	}

	/**
	 * Change the sortable columns in admin.
	 */
	public function sortable_columns( $columns ) {
    $columns['sp_day'] = 'sp_day';
    return $columns;
	}

	/**
	 * Define the sortable columns in admin.
	 */
	public function orderby_columns( $query ) {
		if ( ! is_admin() ) return;

		$orderby = $query->get( 'orderby');

		if ( 'sp_day' == $orderby ) {
		  $query->set( 'meta_key','sp_day' );
		  $query->set( 'orderby','meta_value_num' );
		}
	}

	/**
	 * Define our custom columns shown in admin.
	 * @param  string $column
	 */
	public function custom_columns( $column, $post_id ) {
		switch ( $column ):
			case 'sp_competition':
			$competition = get_post_meta( $post_id, 'sp_competition', true );
			if ( $competition > 0 ) {
				echo '<div id="sp_competition-' . $post_id . '" data-id="'.$competition.'">' .get_the_title( $competition ). '</div>';
			}else{
				echo '&mdash;';
			}
				break;
			case 'sp_format':
				$format = get_post_meta( $post_id, 'sp_format', true );
				$formats = new SP_Formats();
				$event_formats = $formats->event;
				if ( array_key_exists( $format, $event_formats ) ):
					echo '<span class="dashicons sp-icon-' . $format . ' sp-tip" title="' . $event_formats[ $format ] . '"></span>';
				endif;
				break;
			case 'sp_time':
				echo apply_filters( 'sportspress_event_time_admin', get_post_time( 'H:i', false, $post_id, true ) );
				break;
			case 'sp_team':
				$teams = (array)get_post_meta( $post_id, 'sp_team', false );
				$teams = array_filter( $teams );
				$teams = array_unique( $teams );
				$reverse_teams = get_option( 'sportspress_event_reverse_teams', 'no' ) === 'yes' ? true : false;
				if ( $reverse_teams ) {
					$teams = array_reverse( $teams , true );
				}
				if ( empty( $teams ) ):
					echo '&mdash;';
				else:
					$results = get_post_meta( $post_id, 'sp_results', true );
					$main_result = get_option( 'sportspress_primary_result', null );
					echo '<input type="hidden" name="sp_post_id" value="' . $post_id . '">';
					echo '<div class="sp-results">';
						foreach( $teams as $team_id ):
							if ( ! $team_id ) continue;
							$team = get_post( $team_id );

							if ( $team ):
								$team_results = sportspress_array_value( $results, $team_id, null );

								if ( $main_result ):
									$team_result = sportspress_array_value( $team_results, $main_result, null );
								else:
									if ( is_array( $team_results ) ):
										end( $team_results );
										$team_result = prev( $team_results );
										$main_result = key( $team_results );
									else:
										$team_result = null;
									endif;
								endif;

								if ( is_array( $team_results ) ):
									unset( $team_results['outcome'] );
									$team_results = array_filter( $team_results, 'sp_filter_non_empty' );
									$team_results = implode( ' | ', $team_results );
								endif;

								echo '<a class="sp-result sp-tip" tabindex="10" title="' . $team_results . '" data-team="' . $team_id . '" href="#">' . ( $team_result == '' ? '-' : apply_filters( 'sportspress_event_team_result_admin', $team_result, $post_id, $team_id ) ) . '</a>';
								echo '<input type="text" tabindex="10" class="sp-edit-result hidden small-text" data-team="' . $team_id . '" data-key="' . $main_result . '" value="' . $team_result . '"> ';
								echo $team->post_title;
								echo '<br>';
							endif;
						endforeach;
					echo '</div>';
					if ( current_user_can( 'edit_others_sp_events' ) ) {
						?>
						<div class="row-actions sp-row-actions"><span class="inline hide-if-no-js"><a href="#" class="sp-edit-results"><?php _e( 'Edit Results', 'sportspress' ); ?></a></span></div>
						<p class="inline-edit-save sp-inline-edit-save hidden">
							<a href="#inline-edit" class="button-secondary cancel alignleft"><?php _e( 'Cancel' ); ?></a>
							<a href="#inline-edit" class="button-primary save alignright"><?php _e( 'Update' ); ?></a>
						</p>
						<?php
					}
				endif;
				break;
			case 'sp_league':
				echo get_the_terms ( $post_id, 'sp_league' ) ? the_terms( $post_id, 'sp_league' ) : '&mdash;';
				break;
			case 'sp_season':
				echo get_the_terms ( $post_id, 'sp_season' ) ? the_terms( $post_id, 'sp_season' ) : '&mdash;';
				break;
			case 'sp_venue':
				echo get_the_terms ( $post_id, 'sp_venue' ) ? the_terms( $post_id, 'sp_venue' ) : '&mdash;';
				break;
			case 'sp_day':
				$day = get_post_meta ( $post_id, 'sp_day', true );
				if ( '' === $day ) $day = __( 'Default', 'sportspress' );
				echo $day;
				break;
		endswitch;
	}

	/**
	 * Show a category filter box
	 */
	public function filters() {
		global $typenow, $wp_query;

	    if ( $typenow != 'sp_event' )
	    	return;

		$selected = isset( $_REQUEST['team'] ) ? $_REQUEST['team'] : null;
		$args = array(
			'post_type' => 'sp_team',
			'name' => 'team',
			'show_option_none' => __( 'Show all teams', 'sportspress' ),
			'selected' => $selected,
			'values' => 'ID',
		);
		wp_dropdown_pages( $args );
		
		$selected = isset( $_REQUEST['competition'] ) ? $_REQUEST['competition'] : null;
		$args = array(
			'post_type' => 'sp_competition',
			'name' => 'competition',
			'show_option_none' => __( 'Show all Competitions', 'sportspress' ),
			'selected' => $selected,
			'values' => 'ID',
		);
		wp_dropdown_pages( $args );

		$selected = isset( $_REQUEST['sp_league'] ) ? $_REQUEST['sp_league'] : null;
		$args = array(
			'show_option_all' =>  __( 'Show all leagues', 'sportspress' ),
			'taxonomy' => 'sp_league',
			'name' => 'sp_league',
			'selected' => $selected
		);
		sp_dropdown_taxonomies( $args );

		$selected = isset( $_REQUEST['sp_season'] ) ? $_REQUEST['sp_season'] : null;
		$args = array(
			'show_option_all' =>  __( 'Show all seasons', 'sportspress' ),
			'taxonomy' => 'sp_season',
			'name' => 'sp_season',
			'selected' => $selected
		);
		sp_dropdown_taxonomies( $args );

		$selected = isset( $_REQUEST['match_day'] ) ? $_REQUEST['match_day'] : null;
		echo '<input name="match_day" type="text" class="sp-tablenav-input" placeholder="' . __( 'Match Day', 'sportspress' ) . '" value="' . $selected . '">';

		if ( current_user_can( 'edit_others_sp_events' ) )
			wp_nonce_field( 'sp-save-inline-results', 'sp-inline-nonce', false );
	}

	/**
	 * Filter in admin based on options
	 *
	 * @param mixed $query
	 */
	public function filters_query( $query ) {
		global $typenow, $wp_query;

	    if ( $typenow == 'sp_event' ) {

	    	if ( ! empty( $_GET['team'] ) ) {
		    	$query->query_vars['meta_value'] 	= $_GET['team'];
		        $query->query_vars['meta_key'] 		= 'sp_team';
		    }
			
			if ( ! empty( $_GET['competition'] ) ) {
		    	$query->query_vars['meta_value'] 	= $_GET['competition'];
		        $query->query_vars['meta_key'] 		= 'sp_competition';
		    }

	    	if ( ! empty( $_GET['match_day'] ) ) {
		    	$query->query_vars['meta_value'] 	= $_GET['match_day'];
		        $query->query_vars['meta_key'] 		= 'sp_day';
		    }
		}
	}
	
	/**
	 * Quick edit competitions
	 *
	 * @param string $column_name
	 * @param string $post_type
	 */
	public function quick_edit_competitions( $column_name, $post_type ) {
		if ( $this->type !== $post_type ) return;
		if ( 'sp_competition' !== $column_name ) return;

		$competitions = get_posts( array(
			'post_type' => 'sp_competition',
			'numberposts' => -1,
			'post_status' => 'publish',
		) );
		
		if ( ! $competitions ) return;
		?>
		<fieldset class="inline-edit-col-right">
			<div class="inline-edit-col">
				<span class="title"><?php _e( 'Competitions', 'sportspress' ); ?></span>
				<select name="competition">
					<?php foreach ( $competitions as $competition ) { ?>
					<option value="<?php echo $competition->ID; ?>"> <?php echo $competition->post_title; ?></option>
					<?php } ?>
				</select>
			</div>
		</fieldset>
		<?php
	}

	/**
	 * Save quick edit boxes
	 *
	 * @param int $post_id
	 */
	public function quick_save( $post_id ) {
		if ( empty( $_POST ) ) return $post_id;
		if ( ! current_user_can( 'edit_post', $post_id ) )  return $post_id;;

		// verify quick edit nonce
		if ( isset( $_POST[ '_inline_edit' ] ) && ! wp_verify_nonce( $_POST[ '_inline_edit' ], 'inlineeditnonce' ) ) return $post_id;

		if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) return $post_id;
		if ( isset( $post->post_type ) && $post->post_type == 'revision' ) return $post_id;
		
		if ( isset( $_POST[ 'competition' ] ) ) {
			update_post_meta( $post_id, 'sp_competition', $_POST[ 'competition' ] );
		}
	}

	
	/**
	 * Bulk edit competitions
	 *
	 * @param string $column_name
	 * @param string $post_type
	 */
	public function bulk_edit_competitions( $column_name, $post_type ) {
		if ( $this->type !== $post_type ) return;
		if ( 'sp_competition' !== $column_name ) return;

		static $print_nonce = true;
		if ( $print_nonce ) {
			$print_nonce = false;
			wp_nonce_field( plugin_basename( __FILE__ ), "{$this->type}_edit_nonce" );
		}

		$competitions = get_posts( array(
			'post_type' => 'sp_competition',
			'numberposts' => -1,
			'post_status' => 'publish',
		) );
		
		if ( ! $competitions ) return;
		?>
		<fieldset class="inline-edit-col-right">
			<div class="inline-edit-col">
				<span class="title"><?php _e( 'Competitions', 'sportspress' ); ?></span>
				<select name="competition">
					<option value="-1">— No Change —</option>
					<?php foreach ( $competitions as $competition ) { ?>
					<option value="<?php echo $competition->ID; ?>"> <?php echo $competition->post_title; ?></option>
					<?php } ?>
				</select>
			</div>
		</fieldset>
		<?php
	}

	/**
	 * Save bulk edit boxes
	 */
	public function bulk_save() {
		$_POST += array( "nonce" => '' );
		//if ( ! wp_verify_nonce( $_POST["nonce"], plugin_basename( __FILE__ ) ) ) return; *WIP*

		$post_ids = ( ! empty( $_POST[ 'post_ids' ] ) ) ? $_POST[ 'post_ids' ] : array();

		$competition = sp_array_value( $_POST, 'competition', array() );

		if ( ! empty( $post_ids ) && is_array( $post_ids ) ) {
			foreach ( $post_ids as $post_id ) {
				if ( ! current_user_can( 'edit_post', $post_id ) ) continue;

				if ( isset( $_POST[ 'competition' ] ) ) {
					update_post_meta( $post_id, 'sp_competition', $_POST[ 'competition' ] );
				}
			}
		}

		die();
	}
}

endif;

return new SP_Admin_CPT_Event();
