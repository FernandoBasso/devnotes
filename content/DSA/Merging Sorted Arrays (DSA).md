---
tags:
  - merge
  - array
  - dsa
description: Notes, tips and examples on merging arrays.
---
## Intro

Let's implement a function that merges two arrays, keeping the sorting order of the original arrays. For example:

```text
merge([10, 30], [20, 40]);
//=> [10, 20, 30, 40]
```

Note how 20 from the second array came right after 10 and before 30 in the result, and 40 was correctly kept at the end.