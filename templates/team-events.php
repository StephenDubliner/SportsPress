<?php
/**
 * Team Events
 *
 * @author 		ThemeBoy
 * @package 	SportsPress/Templates
 * @version   2.6.9
 */

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if ( ! isset( $id ) )
	$id = get_the_ID();
$sp_team_filter = get_post_meta($id, 'sp_team_filter', true);
if ( !$sp_team_filter ) {
	$sp_team_filter = 'both';
}
$competitions = array_filter( get_post_meta( $id, 'sp_competition', false ) );

$format = get_option( 'sportspress_team_events_format', 'blocks' );

if ( 'calendar' === $format ) {
	$args = array(
		'team' => $id,
		'competitions' =>  $competitions,
	);
	$args = apply_filters( 'event-calendar_args', $args );
	sp_get_template( 'event-calendar.php', $args );
}
elseif ( 'list' === $format ) {
	$args = array(
		'team' => $id,
		'league' => apply_filters( 'sp_team_events_league', 0 ),
		'season' => apply_filters( 'sp_team_events_season', 0 ),
		'title_format' => 'homeaway',
		'time_format' => 'separate',
		'columns' => array( 'event', 'time', 'results' ),
		'order' => 'DESC',
		'competitions' =>  $competitions,
	);
	$args = apply_filters( 'sp_team_events_list_args', $args );
	sp_get_template( 'event-list.php', $args );
} else {
	$args = array(
		'team' => $id,
		'competitions' =>  $competitions,
	);
	$args = apply_filters( 'event-fixtures-results_args', $args );
	sp_get_template( 'event-fixtures-results.php', $args );
}
/*
if ( 'calendar' === $format )
	sp_get_template( 'event-calendar.php', array( 'team' => $id, 'filter' =>  $sp_team_filter, 'competitions' =>  $competitions ) );
elseif ( 'list' === $format )
	sp_get_template( 'event-list.php', array( 'team' => $id, 'order' => 'DESC', 'title_format' => 'homeaway', 'time_format' => 'separate', 'columns' => array( 'event', 'time', 'results' ), 'filter' =>  $sp_team_filter, 'competitions' =>  $competitions ) );
else
	sp_get_template( 'event-fixtures-results.php', array( 'team' => $id, 'filter' =>  $sp_team_filter, 'competitions' =>  $competitions ) );
*/
