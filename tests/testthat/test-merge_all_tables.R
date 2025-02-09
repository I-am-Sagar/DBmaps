library(testthat)
library(DBmaps)
library(data.table)

# Sample data
students <- data.table(id = c("A", "B", "C", "D"),
                       Birthdate = as.Date(c("2001-08-04", "2002-04-28", "2002-06-13", "2002-02-09")))

scores <- data.table(id = c("B", "C", "E"),
                     homework = c(87, 94, 92),
                     quiz = c(91, 90, 87))

attendance <- data.table(id = c("A", "B", "C", "D", "F"),
                         attendance_days = c(180, 175, 160, 170, 165))

# Test for left merge with full final merge
test_that("merge_all_tables works with left merge and full final merge", {
  result <- merge_all_tables(students, scores, attendance, merge_type = "left",
                             final_merge_type = "full")

  # Check if the result is a data.table
  expect_s3_class(result, "data.table")

  # Check that the final table contains all rows from students
  expect_equal(nrow(result), 5)

  # Check that all columns are merged correctly
  expect_true(all(c("id", "Birthdate", "homework", "quiz", "attendance_days")
                  %in% colnames(result)))

  # Check if the 'id' column is sorted correctly
  expect_equal(result$id, c("A", "B", "C", "D", "F"))
})

# Test for an inner merge
test_that("merge_all_tables works with inner merge", {
  result <- merge_all_tables(students, scores, attendance, merge_type = "inner",
                             final_merge_type = "inner")

  # Check if the result is a data.table
  expect_s3_class(result, "data.table")

  # Check if the resulting rows are correct (only common 'id's)
  expect_equal(nrow(result), 2)  # Only "B" and "C" have all data

  # Check that the correct columns exist
  expect_true(all(c("id", "Birthdate", "homework", "quiz", "attendance_days")
                  %in% colnames(result)))
})

test_that("merge_all_tables fails with invalid merge_type", {
  # Test invalid merge_type - use expect_error with exact error message
  expect_error(
    merge_all_tables(students, scores, attendance,
                     merge_type = "invalid",
                     final_merge_type = "inner"),
    "Invalid merge_type. Choose from 'inner', 'left', 'right', or 'full'.",
    fixed = TRUE  # Add fixed=TRUE to match exact string
  )
})

test_that("merge_all_tables fails with invalid final_merge_type", {
  # Test invalid final_merge_type - match the exact error message including line breaks
  expect_error(
    merge_all_tables(students, scores, attendance,
                     merge_type = "inner",
                     final_merge_type = "invalid"),
    "Invalid final_merge_type. Choose from 'inner', 'left', 'right', or 'full'.",
    fixed = TRUE  # Add fixed=TRUE to match exact string
  )
})

