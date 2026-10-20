# assert_dateish rejects impossible dates

    Code
      assert_dateish(start_date)
    Condition
      Error:
      ! Assertion on 'start_date' failed: Must be a Date or a valid date string in 'YYYY-MM-DD' format.

---

    Code
      assert_dateish(end_date, null.ok = TRUE)
    Condition
      Error:
      ! Assertion on 'end_date' failed: Must be `NULL`, a Date, or a valid date string in 'YYYY-MM-DD' format.

