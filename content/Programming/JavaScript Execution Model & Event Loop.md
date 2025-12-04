---
tags:
  - javascript
  - execution
  - model
  - event-loop
desc: Tips, notes and examples on the JavaScript Execution Model and the Event Loop, timers, events, promises and other async features.
---
## Challenge 1

In what order will the output happen? Why?

```javascript
const log = console.log.bind(console);

log('A');

setTimeout(() => log('B'), 0);

Promise.resolve().then(() => log('C'));

process.nextTick(() => log('D'));

fs.readFile(__filename, () => log('E'));

log('F');
```
