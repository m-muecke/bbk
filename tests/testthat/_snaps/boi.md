# boi_data input validation works

    Code
      boi_data(1L)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'flow' failed: Must be of type 'string', not 'integer'.
    Code
      boi_data(TRUE)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'flow' failed: Must be of type 'string', not 'logical'.
    Code
      boi_data(NULL)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'flow' failed: Must be of type 'string', not 'NULL'.
    Code
      boi_data(NA)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'flow' failed: May not be NA.
    Code
      boi_data(c("EXR", "IR"))
    Condition
      Error in `boi_data()`:
      ! Assertion on 'flow' failed: Must have length 1.
    Code
      boi_data("EXR", 1L)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'key' failed: Must be of type 'string' (or 'NULL'), not 'integer'.
    Code
      boi_data("EXR", TRUE)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'key' failed: Must be of type 'string' (or 'NULL'), not 'logical'.
    Code
      boi_data("EXR", NA)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'key' failed: May not be NA.
    Code
      boi_data("EXR", "abc", start_period = TRUE)
    Condition
      Error:
      ! Assertion on 'start_period' failed: One of the following must apply:
       * check_null(start_period): Must be NULL
       * check_string(start_period): Must be of type 'string', not 'logical'
       * check_count(start_period): Must be of type 'count', not 'logical'.
    Code
      boi_data("EXR", "abc", start_period = c("a", "b"))
    Condition
      Error:
      ! Assertion on 'start_period' failed: One of the following must apply:
       * check_null(start_period): Must be NULL
       * check_string(start_period): Must have length 1
       * check_count(start_period): Must be of type 'count', not 'character'.
    Code
      boi_data("EXR", "abc", end_period = TRUE)
    Condition
      Error:
      ! Assertion on 'end_period' failed: One of the following must apply:
       * check_null(end_period): Must be NULL
       * check_string(end_period): Must be of type 'string', not 'logical'
       * check_count(end_period): Must be of type 'count', not 'logical'.
    Code
      boi_data("EXR", "abc", end_period = c("a", "b"))
    Condition
      Error:
      ! Assertion on 'end_period' failed: One of the following must apply:
       * check_null(end_period): Must be NULL
       * check_string(end_period): Must have length 1
       * check_count(end_period): Must be of type 'count', not 'character'.
    Code
      boi_data("EXR", "abc", last_n = "abc")
    Condition
      Error in `boi_data()`:
      ! Assertion on 'last_n' failed: Must be of type 'count' (or 'NULL'), not 'character'.
    Code
      boi_data("EXR", "abc", last_n = TRUE)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'last_n' failed: Must be of type 'count' (or 'NULL'), not 'logical'.
    Code
      boi_data("EXR", "abc", last_n = -1L)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'last_n' failed: Must be >= 1.
    Code
      boi_data("EXR", "abc", last_n = 0L)
    Condition
      Error in `boi_data()`:
      ! Assertion on 'last_n' failed: Must be >= 1.

# boi_dimension input validation works

    Code
      boi_dimension(1L)
    Condition
      Error in `boi_dimension()`:
      ! Assertion on 'id' failed: Must be of type 'string', not 'integer'.
    Code
      boi_dimension(TRUE)
    Condition
      Error in `boi_dimension()`:
      ! Assertion on 'id' failed: Must be of type 'string', not 'logical'.
    Code
      boi_dimension(NULL)
    Condition
      Error in `boi_dimension()`:
      ! Assertion on 'id' failed: Must be of type 'string', not 'NULL'.
    Code
      boi_dimension(c("a", "b"))
    Condition
      Error in `boi_dimension()`:
      ! Assertion on 'id' failed: Must have length 1.

# boi_metadata input validation works

    Code
      boi_metadata(1L)
    Condition
      Error in `boi_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but types do not match (integer != character).
    Code
      boi_metadata(TRUE)
    Condition
      Error in `boi_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but types do not match (logical != character).
    Code
      boi_metadata("data")
    Condition
      Error in `boi_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but is 'data'.
    Code
      boi_metadata(c("datastructure", "dataflow"))
    Condition
      Error in `boi_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but is not atomic scalar.
    Code
      boi_metadata("dataflow", id = 1L)
    Condition
      Error in `boi_metadata()`:
      ! Assertion on 'id' failed: Must be of type 'string' (or 'NULL'), not 'integer'.
    Code
      boi_metadata("dataflow", id = TRUE)
    Condition
      Error in `boi_metadata()`:
      ! Assertion on 'id' failed: Must be of type 'string' (or 'NULL'), not 'logical'.
    Code
      boi_metadata("dataflow", lang = "fr")
    Condition
      Error in `boi_metadata()`:
      ! Assertion on 'lang' failed: Must be element of set {'en','he'}, but is 'fr'.

