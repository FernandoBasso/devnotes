---
tags:
  - exercism
  - javascript
  - dsa
description: Notes and solutions for the High Score Board Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/high-score-board

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

This one is very mechanical, so here's just the entire solution:

```javascript
function createScoreBoard() {
  return {
    "The Best Ever": 1_000_000,
  }
}

function addPlayer(scoreBoard, player, score) {
  scoreBoard[player] = score;
  return scoreBoard;
}

function removePlayer(scoreBoard, player) {
  delete scoreBoard[player];
  return scoreBoard;
}

function updateScore(scoreBoard, player, points) {
  scoreBoard[player] += points;
  return scoreBoard;
}

function applyMondayBonus(scoreBoard) {
  for (const player in scoreBoard)
    scoreBoard[player] += 100;

  return scoreBoard;
}
```
