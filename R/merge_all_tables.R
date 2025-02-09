library(data.table)

#' Merge Three Data Tables
#'
#' This function first merges two data tables (`x` and `y`) using the specified
#' join type. It then merges the resulting table with a third data table (`z`).
#'
#' @param x First data table (e.g., students).
#' @param y Second data table (e.g., scores).
#' @param z Third data table (e.g., attendance).
#' @param by_col The column name (as a string) on which the merge should be
#'        performed. Default is `"id"`.
#' @param merge_type Type of merge to perform between `x` and `y`. Options:
#'   - `"inner"`: Matches only common rows.
#'   - `"left"`: All rows from `x`, with matches from `y`.
#'   - `"right"`: All rows from `y`, with matches from `x`.
#'   - `"full"`: All rows from both.
#' @param final_merge_type Type of merge to perform between `(x + y)` and `z`.
#'        Same options as `merge_type`.
#'
#' @return A merged `data.table` object containing all three tables.
#'
#' @examples
#' merge_all_tables(students, scores, attendance, merge_type = "inner",
#'       final_merge_type = "full")
#' merge_all_tables(students, scores, attendance, merge_type = "left",
#'       final_merge_type = "right")
#'
#' @export
merge_all_tables <- function(x, y, z, by_col = "id", merge_type = "inner",
                             final_merge_type = "inner") {
  # First merge x and y
  merged_xy <- switch(
    merge_type,
    "inner" = merge(x, y, by = by_col),
    "left" = merge(x, y, by = by_col, all.x = TRUE),
    "right" = merge(x, y, by = by_col, all.y = TRUE),
    "full" = merge(x, y, by = by_col, all = TRUE),
    stop("Invalid merge_type. Choose from 'inner', 'left', 'right', or 'full'.")
  )

  # Now merge the result with z
  final_merge <- switch(
    final_merge_type,
    "inner" = merge(merged_xy, z, by = by_col),
    "left" = merge(merged_xy, z, by = by_col, all.x = TRUE),
    "right" = merge(merged_xy, z, by = by_col, all.y = TRUE),
    "full" = merge(merged_xy, z, by = by_col, all = TRUE),
    stop("Invalid final_merge_type. Choose from 'inner', 'left', 'right', or
         'full'.")
  )

  return(final_merge)
}

# ---------------------------- MEDIUM TASK ----------------------------------- #

# Loading the sample data
data(students)
data(scores)
data(attendance)

result <- merge_all_tables(students, scores, attendance, merge_type = "left",
                           final_merge_type = "full")
print(result)

