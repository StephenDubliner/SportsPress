## Basic formula based on game points for the player
Sum all game points player played scaled by the division factor  
n - number of game results in which player participated  
matchDivision - division the match/game was played in  
q- number of games in a match  
gamePoints - points in a game for the player  
  
$$rankPoints = \sum_{i=1}^{n} ((11 - matchDivision_i) * \sum_{j=1}^{q} gamePointsFor_j)$$ 


## [TBD]Event titles pool, knockout way  
Every tournament in subject declares arbitrary number of points awarded for winner, runner up, 1/4, 1/8, 1/16. the recognition level is on number of matches won, not games or points


$$rankPoints = \sum_{i=1}^{n} (matchTitlePoints_i)$$ 


## Number of games won-lost  
m - number of matches played

$$rankPoints = \sum_{i=1}^{m} (allPayed_i - allLost_i gamesWonFor_i - gamesLostFor_i)$$ 

example:
g:0-2 -> rankPoints = (2 - 2)/2 * (reward)  
g:1-1 -> rankPoints = (2 - 1)/2 * (reward)  
g:2-0 -> rankPoints = (2 - 0)/2 * (reward)  
g:3-2 -> rankPoints = (3 - 2)/5 * (reward)  
g:3-1 -> rankPoints = (3 - 1)/4 * (reward)  

Can be scaled with the division factor.

## [TBD]Strictly number of points
