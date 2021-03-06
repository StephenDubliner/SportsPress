# Formulas  

## 1. Basic formula based on game points for the player
Sum all game points player played scaled by the division factor  
n - number of game results in which player participated  
matchDivision - division the match/game was played in  
q- number of games in a match  
gamePoints - points in a game for the player  
  
$$rankPoints = \sum_{i=1}^{n} ((11 - matchDivision_i) \times \sum_{j=1}^{q} gamePointsFor_j)$$ 

## 2.[TBD]Number of games won fixed reward  

Soccer like  

$$rankPoints = \Bigg\{\begin{align}
 &0 \rightarrow gamesWon = 0,\\
 &1 \rightarrow gamesWon > 0, lost\\
 &2 \rightarrow won
\end{align}$$


examples:  
g:0-2 -> rankPoints = 0  
g:1-1 -> rankPoints = 1  
g:2-0 -> rankPoints = 3  
g:3-2 -> rankPoints = 3  
g:3-1 -> rankPoints = 3  
g:2-3 -> rankPoints = 1  


## 3. Number of games won over all played  
m - number of matches played

$$rankPoints = \sum_{i=1}^{m} (\frac{gamesWonFor_i}{gamesPayedInMatch_i}) \times matchReward_i$$ 

examples:  
g:0-2 -> rankPoints = 0/2 * (reward)  
g:1-1 -> rankPoints = 1/2 * (reward)  
g:2-0 -> rankPoints = 2/2 * (reward)  
g:3-2 -> rankPoints = 3/5 * (reward)  
g:3-1 -> rankPoints = 3/4 * (reward)  
g:2-3 -> rankPoints = 2/5 * (reward)  

Can be scaled with the division factor.

## 4. [TBD]Event titles pool, knockout way  
Every tournament in subject declares arbitrary number of points awarded for winner, runner up, 1/4, 1/8, 1/16. the recognition level is on number of matches won, not games or points

$$rankPoints = \sum_{i=1}^{n} (matchTitlePoints_i)$$

## 5. Proportional share in all points score each game

Accumulation of advantage points in all games scaled to the maximum possible advantage in the specific match format. Promotes matches with bigger deficit over close matches. There is a need to introduce fixed reward/penalty for the winning/losing side, as it's be possible to loose a match and score higher rank.

n - number of games in a match  

$$rankPoints = \sum_{i=1}^{n} \frac{\frac{pointsFor_i}{pointsFor_i + pointsAgainst_i}}{n}$$

examples:  
### a. 12-21, 15-21  
-> for $$rankPoints = \frac{12}{(12+21)2} + \frac{15}{(15+21)2}$$  
-> against $$rankPoints = \frac{21}{(12+21)2} + \frac{21}{(15+21)2}$$  

### b. 1-21, 21-19, 21-19 
-> for $$rankPoints = \frac{1}{(1+21)3} + \frac{21}{(19+21)3} + \frac{21}{(19+21)3}$$  
-> against $$rankPoints = \frac{21}{(1+21)3} + \frac{19}{(19+21)3} + \frac{19}{(19+21)3}$$  

### c. 23-25, 20-22  
-> for $$rankPoints = \frac{23}{(23+25)2} + \frac{20}{(20+22)2}$$  
-> against $$rankPoints = \frac{25}{(23+25)2} + \frac{22}{(20+22)2}$$  

### d. 6-21, 21-18 
-> for $$rankPoints = \frac{6}{(6+21)2} + \frac{21}{(18+21)2}$$  
-> against $$rankPoints = \frac{21}{(6+21)2} + \frac{18}{(18+21)2}$$  

## 6. Proportional share in all points score scaled with match reward.  

g - number of games in a match  

$$winnerRankPoints = (11 - matchDivision_i) \times formatFactor \times g \times gameRewardPoints \times max(0.51, \frac{\sum_{j=1}^{g} gamePointsFor_j}{\sum_{j=1}^{g} gamePointsAll_j})$$  

$$looserRankPoints = (11 - matchDivision_i) \times formatFactor \times g \times gameRewardPoints \times min(0.49, \frac{\sum_{i=1}^{g} gamePointsFor_i}{\sum_{i=1}^{g} gamePointsAll_i})$$  

examples:  
### a. 12-21, 15-21  div 1
-> for $$winnerRankPoints  
= (11 - 1) \times 1.05 \times 3 \times 210 \times max(0.51, \frac{21 + 21}{12 + 21 + 15 + 21})  
= 10 \times 661.5 \times max(0.51, 0.61) = 4026.5$$

-> against $$looserRankPoints  
= (11 - 1) \times 1.05 \times 3 \times 210 \times min(0.49, \frac{12 + 12}{12 + 21 + 15 + 21})  
= 10 \times 661.5 \times min(0.49, 0.35) = 2300.9$$

note reward varies on games format:  
 11: 110  
 15: 150  
 21: 210  
 5% for game with setting  

## GDPR Todo:
- [ ] support for obtaining explicit and informed consent on collecting personal data
- [ ] support revoking consent to stop collecting data
- [ ] support revoking consent to erase collected data
- [ ] support all user data request
- [ ] publish Terms of Service
- [ ] publish Privacy Policy : showing what data is going to be stored, how it is going to be used/processed, reasons to collect and store
- [ ] publish Security Policy (data protection policy) : how security is implemented
- [ ] support data breach notification
- [ ] identify roles: data controllers, data processors
- [ ] review all plugins are compatible with GDPR
- [ ] verify no checkbox that’s selected by default as a consent
## Nice to have:  
- [ ] request GDPR compilance audit (Security Audit Log plugin?)

# General Work Back-log
- [ ] @NBT Rank history captured
- [ ]   evaluate dynamic vs static report approach - dynamic should take event closing date as the milestone; sample - lddlc: following every fixture night milestone is produced; bonanza - following closingg Sunday outcomes comes milestone;pbl - each event night is a milestone; in order to keep inclusion the milestones must periodically get marked as reset:no prior data included; history must contain list of milestones - ordered evaluation dates; mark_milestone(input data) => upsert milestone date; gather all resuls up to the date; aggregate the key  metrics; order subject entities(players)
- [ ] release branches, specific to deployments: wp.config, back.end.dump.sql
- [ ] spare deployments: SD, KBC, DB, global, demo/test
- [ ] test how other roles function in admining area
- [x] test support for singles MS, WS
- [ ] legal stuff T&C, Privacy, Security, GDPR
- [ ] winning team in bold on brief match view
- [ ] quick delete in native SQL call 
	$wpdb->delete( 'wp_posts', array( '_sp_import' => 1 ) );
	$wpdb->delete( 'wp_post_meta', array( '_sp_import' => 1 ) );
- [ ] importer view to add event fixtures in bulk
- [ ] make every import batch unique so it'd be possible to selectively process
- [ ] performance stats aggregated on the club / multi-team - PBL CAC
- [ ] link results to teams
- [ ] team bulk input form
- [ ] 	auto team name based on input template
- [ ] 	league/competition
- [ ] 	logo
- [ ] 	players to link to the team
- [x] match bulk input form for
- [x] 	delete all checkbox
- [x] 	statics: MatchDay, event, venue, format, season
- [x] 	league/competition
- [ ] 	pre-typed defautls based on the last record entered: section, grade
- [ ] match details view with push notofocations - autoupdating
- [ ] match day friendly formatted in the UI
- [ ] additional outcome 'retired'
- [ ] NBT results entering view that records point by point sequence
- [ ] generic player avatars to choose from
- [ ] generic team logos
- [x] auto outcome works as expected when results are partial
- [x] generic player photo
- [x] preview release
- [x] Azure deployment
- [x] fix Matches view
- [x] basic calendar of recorded matches
- [x] Basic portal layout: news, about, ranks, matches, leagues, players
- [x] Support pseudonym - minimum basic: no FN on player details, no FN on rank, no FN on player team
- [x] fix match day
- [x] fix missing zeroes in the results
- [x] most optimal math formula in place
- [x] Test data 100+
- [x] More columns: WL: matches, games, ratio, grade, gender
- [x] prevent match duplicates on import
- [x] support for unknown player in match result
- [x] support 1-5 games/match
- [x] division biased rank formula in place
- [x] Teams names creation
- [x] Outcome sorted
- [ ] support for cookies monit
- [ ] support rank points re-calculation on already entered match
- [ ] under construction solution
- [ ] game points input max 2 digits, min and max, autocomplete, sample inpit for points and players
- [ ] Automate testing as in https://www.quora.com/What-are-the-best-PHP-testing-frameworks
	- [ ] processing inputs: player full name, tokenizing, match results constraints, player allowed sections, handling pseudos
- [ ] Register http://brank.westeurope.cloudapp.azure.com/v1/wp-login.php?action=register
- [ ] 	User signs up online, producing the consent
- [ ] 		Register page bot-proof
- [ ] 		Sign up confirmation email referring to T&C, auto generated password
- [ ] 		Unsecure login/register page inform of no https
- [ ] 	User opts out online recalling the consent with immediate effect: take offline or remove all
- [ ] 	User requests online dump off all his data 
- [ ] 	Admin can instantly view user consent history
