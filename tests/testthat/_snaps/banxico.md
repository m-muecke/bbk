# Banxico requests accept at most 20 series

    Code
      banxico_data(series, api_key = "dummy")
    Condition
      Error in `banxico_data()`:
      ! Assertion on 'series' failed: Must have length <= 20, but has length 21.

---

    Code
      banxico_metadata(series, api_key = "dummy")
    Condition
      Error in `banxico_metadata()`:
      ! Assertion on 'series' failed: Must have length <= 20, but has length 21.

# banxico_data requires both or neither date

    Code
      banxico_data("SF43718", start_date = "2024-01-01", api_key = "dummy")
    Condition
      Error:
      ! `start_date` and `end_date` must be supplied together.
    Code
      banxico_data("SF43718", end_date = "2024-01-31", api_key = "dummy")
    Condition
      Error:
      ! `start_date` and `end_date` must be supplied together.

