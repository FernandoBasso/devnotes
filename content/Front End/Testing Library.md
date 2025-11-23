---
tags:
  - frontend
  - testing-library
  - way-aria
  - listitem
description: Notes, tips and examples on using Testing Library to test UI components and interfaces.
---

## ByRole

This doesn't work:

```text
expect(getByRole("listitem", { name: /about/i }));
```

Even if a given list item does have the text "About", it still fails.

> TestingLibraryElementError: Unable to find an accessible element with the role "listitem" and name `/about/i`

------------------------------------------------------------------------
If one wants to avoid the find/filter iteration thing and stick to `getByRole()` instead of `getAllByRole()`, another option would be to use `toHaveTextContent()` (or similar):

typescript

```typescript
import { describe, it, expect } from "vitest";
import { render } from "@testing-library/react";
import { HeaderItem } from "./HeaderItem.tsx";

describe("<HeaderItem />", () => {
  it("renders with correct passed-in props", () => {
    const { getByRole } = render(<HeaderItem text="About" />);

    const listItem = getByRole('listitem');

    expect(listItem).toBeInTheDocument();
    expect(listItem).toHaveTextContent(/about/i);
  });
});
```

We still cannot use `{ name: /pattern/ }`, though. Just thought I could share a slightly different way of doing it.

------------------------------------------------------------------------
### References

- https://github.com/testing-library/react-testing-library/issues/752
- https://stackoverflow.com/questions/63033144/unable-to-use-getbyrole-on-listitem-with-a-specific-name-rtl (wrote a slightly different answer myself).