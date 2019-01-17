## 1. Basic formula based on game points for the player
Sum all game points player played scaled by the division factor  
n - number of game results in which player participated  
matchDivision - division the match/game was played in  
q- number of games in a match  
gamePoints - points in a game for the player  
  
$$rankPoints = \sum_{i=1}^{n} ((11 - matchDivision_i) * \sum_{j=1}^{q} gamePointsFor_j)$$ 

## 2.[TBD]Number of games won fixed reward  

$$rankPoints = \Bigg\{\begin{align}
 &0 \rightarrow gamesWon = 0,\\
 &1 \rightarrow gamesWon > 0, lost\\
 &2 \rightarrow won
\end{align}$$


example:  
g:0-2 -> rankPoints = 0  
g:1-1 -> rankPoints = 1  
g:2-0 -> rankPoints = 3  
g:3-2 -> rankPoints = 3  
g:3-1 -> rankPoints = 3  
g:2-3 -> rankPoints = 1  


## 3. Number of games won over all played  
m - number of matches played

$$rankPoints = \sum_{i=1}^{m} (\frac{gamesWonFor_i}{gamesPayedInMatch_i}) * matchReward_i$$ 

example:  
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

## 5.[TBD]Strictly number of points
