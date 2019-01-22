## 1. Basic formula based on game points for the player
Sum all game points player played scaled by the division factor  
n - number of game results in which player participated  
matchDivision - division the match/game was played in  
q- number of games in a match  
gamePoints - points in a game for the player  
  
$$rankPoints = \sum_{i=1}^{n} ((11 - matchDivision_i) * \sum_{j=1}^{q} gamePointsFor_j)$$ 

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

$$rankPoints = \sum_{i=1}^{m} (\frac{gamesWonFor_i}{gamesPayedInMatch_i}) * matchReward_i$$ 

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

n - number of games in a match  

$$winnerRankPoints = formatFactor \times n \times gameRewardPoints \times max(0.51, \frac{\sum_{i=1}^{n} gamePointsFor_i}{\sum_{i=1}^{n} gamePointsAll_i})$$  

$$looserRankPoints = formatFactor \times n \times gameRewardPoints \times min(0.49, \frac{\sum_{i=1}^{n} gamePointsFor_i}{\sum_{i=1}^{n} gamePointsAll_i})$$  

examples:  
### a. 12-21, 15-21  
-> for $$winnerRankPoints = 1.05 \times 3 \times 210 \times max(0.51, \frac{21 + 21}{12 + 21 + 15 + 21}) = 661.5 \times max(0.51, 0.61) = 402.65$$

-> against $$looserRankPoints = 1.05 \times 3 \times 210 \times min(0.49, \frac{12 + 12}{12 + 21 + 15 + 21}) = 661.5 \times min(0.49, 0.35) = 230.09$$

note reward varies on games format:  
 11: 110  
 15: 150  
 21: 210  
 5% for game with setting  
