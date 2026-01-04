---
tags:
  - exercism
  - javascript
  - dsa
  - exception
  - switch
  - character-set
description: Notes and solutions for the Factory Sensors Exercism challenge in JavaScript
---

## Intro

Challenge URL in Exercism:

- https://exercism.org/tracks/javascript/exercises/factory-sensors

My own repo with solutions:

- https://github.com/FernandoBasso/coding-studies/tree/devel/exercism/javascript

## Solution

This one is more mechanical and self-explanatory.

```javascript
class ArgumentError extends Error {}

class OverheatingError extends Error {
  /**
   * @param {number | null} temperature
   */
  constructor(temperature) {
    super(`The temperature is ${temperature} ! Overheating !`);
    this.temperature = temperature;
  }
}

/**
 * Check if the humidity level is not too high.
 *
 * @param {number} humidityPercentage
 * @throws {Error}
 */
function checkHumidityLevel(humidityPercentage) {
  if (humidityPercentage > 70)
    throw new Error("Humidity has acceeded 70%")
}

/**
 * Check if the temperature is not too high.
 *
 * @param {number | null} temperature
 * @throws {ArgumentError|OverheatingError}
 */
function reportOverheating(temperature) {
  if (temperature === null)
    throw new ArgumentError();
  else if (temperature > 500)
    throw new OverheatingError(temperature);
}

/**
 *  Triggers the needed action depending on the result of the machine check.
 *
 * @param {{
 *   check: function,
 *   alertDeadSensor: function,
 *   alertOverheating: function,
 *   shutdown: function
 * }} actions
 * @throws {ArgumentError|OverheatingError|Error}
 */
function monitorTheMachine({
  check,
  alertDeadSensor,
  alertOverheating,
  shutdown,
}) {
  try {
    check();
  } catch (err) {
    if (err instanceof ArgumentError)
      alertDeadSensor();
    else if (err instanceof OverheatingError)
      if (err.temperature > 600)
        shutdown();
      else
        alertOverheating();
    else
      throw err;
  }
}
```

For fun, we can use/switch case on `err.constructor` instead of if/else with `instanceof`.

```javascript
/**
 *  Triggers the needed action depending on the result of the machine check.
 *
 * @param {{
 *   check: function,
 *   alertDeadSensor: function,
 *   alertOverheating: function,
 *   shutdown: function
 * }} actions
 * @throws {ArgumentError|OverheatingError|Error}
 */
export function monitorTheMachine({
  check,
  alertDeadSensor,
  alertOverheating,
  shutdown,
}) {
  try {
    check();
  } catch (err) {
    switch (err.constructor) {
    case ArgumentError:
      alertDeadSensor();
      break;
    case OverheatingError:
      if (err.temperature > 600)
        shutdown();
      else
        alertOverheating();
      break;
    default:
      throw err;
    }
  }
}
```
