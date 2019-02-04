<?php
$matchImportIdx = 0;
$importSize = length($rows);
if($importSize%2 <> 0)
exit();

while ( $matchImportIdx < $importSize ):
	$rowA = ProcessMatchMasterRow($rows[$matchImportIdx++]);
	$rowB = ProcessMatchRow($rows[$matchImportIdx]);
	$matches[$matchImportIdx] = BuildMatch($rowA, $rowB);
	$matchImportIdx++;
endwhile

foreach ( $matches as $match ):
	foreach ( $match['teams'] as $team ):
		$team['gw']
	endforeach;
endforeach;
function ProcessMatchMasterRow($row){
	$result['matchDate']
	$result['matchSection']
	$result['matchGrade']
	$result['matches']
}
function BuildMatch($rowA, $rowB){
	$result = array();
	$result['teams'] = array();

	$isFirstGame = true;
	foreach( $rowA as $gkey => $points ):
		if($isFirstGame){
			$taTitle = ''//todo
			$tbTitle = ''//todo
			$result['teams'][$taTitle]['gw'] = $points > $rowB[$gkey] ? 1 : 0;
			$result['teams'][$taTitle]['gl'] = $points < $rowB[$gkey] ? 1 : 0;

			$result['teams'][$tbTitle]['gw'] = $result['teams'][$taTitle]['gl'];
			$result['teams'][$tbTitle]['gl'] = $result['teams'][$taTitle]['gw'];
		}
		else{
			$result['teams'][$taTitle][$points > $rowB[$gkey] ? 'gw' : 'gl']++;
			$result['teams'][$tbTitle][$points < $rowB[$gkey] ? 'gw' : 'gl']++;
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
}