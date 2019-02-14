<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if ( class_exists( 'WP_Importer' ) ) {
	class SP_Event_Importer_Base extends SP_Importer {
		public function __construct() {
			sp_trace('SP_Event_Importer_Base', $this);
		}

		function import_matches_r( $rows_in = array(), $event_meta = array(), $columns = array( 'post_title' ) ) {
	$rows = array_chunk( $rows_in, sizeof( $columns ) );
	//sp_trace('rows', $rows);

	$event_format = sp_nvl($event_meta['event_format'], 'league');;
	$league = sp_nvl($event_meta['league'], -1);;
	$season = sp_nvl($event_meta['season'], -1);
	$date_format = sp_nvl($event_meta['date_format'],'yyyy/mm/dd');

	// Get labels from result and performance post types
	//$result_labels = sp_get_var_labels( 'sp_result' );
	//$performance_labels = sp_get_var_labels( 'sp_performance' );

	//tbd
	$matchImportIdx = 0;
	$importSize = sizeof($rows);
	$import_data = array();
	$matches = array();
	$teamaName = $teambName = null;
	while ( $matchImportIdx < $importSize ):

		$row_check = array_filter( $rows[$matchImportIdx] );

		if ( !empty( $row_check ) ) {
			//$commonDetails = array_slice( $rows[$matchImportIdx], 0, 4 );
			//'sp_format' => $event_format, 'league' => $league, 'season' => $season.'', 'date_format' => $date_format
			$grade = $rows[$matchImportIdx][0];
			$section = $rows[$matchImportIdx][1];
			$rowA = array_slice( $rows[$matchImportIdx], 2);
			$rowB = array_slice( $rows[$matchImportIdx + 1], 2);
			$commonDetails = array(
				$event_meta['matchDate'],//todo 
				$event_meta['venue'],//todo 
				$section,
				$grade,
			);			
			$match = $this->build_match($commonDetails, $rowA, $rowB);
			if($match != null)
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
	sp_trace('matches', $matches);

	//upsert input data from $import_data
	//$this->commit_import($import_data);
}
	}
}