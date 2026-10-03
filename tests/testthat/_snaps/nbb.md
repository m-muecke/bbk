# nbb_data input validation works

    Code
      nbb_data(1L)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'flow' failed: Must be of type 'string', not 'integer'.
    Code
      nbb_data(TRUE)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'flow' failed: Must be of type 'string', not 'logical'.
    Code
      nbb_data(NULL)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'flow' failed: Must be of type 'string', not 'NULL'.
    Code
      nbb_data(NA)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'flow' failed: May not be NA.
    Code
      nbb_data(c("DF_EXR", "DF_HICP"))
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'flow' failed: Must have length 1.
    Code
      nbb_data("DF_EXR", 1L)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'key' failed: Must be of type 'string' (or 'NULL'), not 'integer'.
    Code
      nbb_data("DF_EXR", TRUE)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'key' failed: Must be of type 'string' (or 'NULL'), not 'logical'.
    Code
      nbb_data("DF_EXR", NA)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'key' failed: May not be NA.
    Code
      nbb_data("DF_EXR", "abc", start_period = TRUE)
    Condition
      Error:
      ! Assertion on 'start_period' failed: One of the following must apply:
       * check_null(start_period): Must be NULL
       * check_string(start_period): Must be of type 'string', not 'logical'
       * check_count(start_period): Must be of type 'count', not 'logical'.
    Code
      nbb_data("DF_EXR", "abc", start_period = c("a", "b"))
    Condition
      Error:
      ! Assertion on 'start_period' failed: One of the following must apply:
       * check_null(start_period): Must be NULL
       * check_string(start_period): Must have length 1
       * check_count(start_period): Must be of type 'count', not 'character'.
    Code
      nbb_data("DF_EXR", "abc", end_period = TRUE)
    Condition
      Error:
      ! Assertion on 'end_period' failed: One of the following must apply:
       * check_null(end_period): Must be NULL
       * check_string(end_period): Must be of type 'string', not 'logical'
       * check_count(end_period): Must be of type 'count', not 'logical'.
    Code
      nbb_data("DF_EXR", "abc", end_period = c("a", "b"))
    Condition
      Error:
      ! Assertion on 'end_period' failed: One of the following must apply:
       * check_null(end_period): Must be NULL
       * check_string(end_period): Must have length 1
       * check_count(end_period): Must be of type 'count', not 'character'.
    Code
      nbb_data("DF_EXR", "abc", last_n = "abc")
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'last_n' failed: Must be of type 'count' (or 'NULL'), not 'character'.
    Code
      nbb_data("DF_EXR", "abc", last_n = TRUE)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'last_n' failed: Must be of type 'count' (or 'NULL'), not 'logical'.
    Code
      nbb_data("DF_EXR", "abc", last_n = -1L)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'last_n' failed: Must be >= 1.
    Code
      nbb_data("DF_EXR", "abc", last_n = 0L)
    Condition
      Error in `nbb_data()`:
      ! Assertion on 'last_n' failed: Must be >= 1.

# nbb_dimension input validation works

    Code
      nbb_dimension(1L)
    Condition
      Error in `nbb_dimension()`:
      ! Assertion on 'id' failed: Must be of type 'string', not 'integer'.
    Code
      nbb_dimension(TRUE)
    Condition
      Error in `nbb_dimension()`:
      ! Assertion on 'id' failed: Must be of type 'string', not 'logical'.
    Code
      nbb_dimension(NULL)
    Condition
      Error in `nbb_dimension()`:
      ! Assertion on 'id' failed: Must be of type 'string', not 'NULL'.
    Code
      nbb_dimension(c("a", "b"))
    Condition
      Error in `nbb_dimension()`:
      ! Assertion on 'id' failed: Must have length 1.

# nbb_metadata input validation works

    Code
      nbb_metadata(1L)
    Condition
      Error in `nbb_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but types do not match (integer != character).
    Code
      nbb_metadata(TRUE)
    Condition
      Error in `nbb_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but types do not match (logical != character).
    Code
      nbb_metadata("data")
    Condition
      Error in `nbb_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but is 'data'.
    Code
      nbb_metadata(c("datastructure", "dataflow"))
    Condition
      Error in `nbb_metadata()`:
      ! Assertion on 'type' failed: Must be element of set {'datastructure','dataflow','codelist','concept'}, but is not atomic scalar.
    Code
      nbb_metadata("dataflow", id = 1L)
    Condition
      Error in `nbb_metadata()`:
      ! Assertion on 'id' failed: Must be of type 'string' (or 'NULL'), not 'integer'.
    Code
      nbb_metadata("dataflow", id = TRUE)
    Condition
      Error in `nbb_metadata()`:
      ! Assertion on 'id' failed: Must be of type 'string' (or 'NULL'), not 'logical'.
    Code
      nbb_metadata("dataflow", lang = "de")
    Condition
      Error in `nbb_metadata()`:
      ! Assertion on 'lang' failed: Must be element of set {'en','fr','nl'}, but is 'de'.

