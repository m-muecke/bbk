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

