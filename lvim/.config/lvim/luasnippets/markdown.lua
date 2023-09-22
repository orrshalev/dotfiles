return {
  -- \frac
  s(
    {
      trig = "ff",
      dscr = "Expands 'ff' into '\frac{}{}'",
    },
    fmt(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2),
      },
      { delimiters = "<>" } -- manually specifying angle bracket delimiters
    )
  ),
}
