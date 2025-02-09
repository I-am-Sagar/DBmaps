#' Sample Student Data
#'
#' The `students` dataset contains information about students and their birthdates.
#'
#' @format A data.table with 4 rows and 2 variables:
#' \describe{
#'   \item{id}{Character. Student ID}
#'   \item{Birthdate}{Date. Date of birth}
#' }
#' @examples
#' data(students)
#' head(students)
#'
#' @source
#' This data is manually created for demonstration purposes.
"students"

#' Sample Student Scores Data
#'
#' The `scores` dataset contains students' homework and quiz scores.
#'
#' @format A data.table with 3 rows and 3 variables:
#' \describe{
#'   \item{id}{Character. Student ID}
#'   \item{homework}{Numeric. Homework scores}
#'   \item{quiz}{Numeric. Quiz scores}
#' }
#' @examples
#' data(scores)
#' head(scores)
#'
#' @source
#' This data is manually created for demonstration purposes.
"scores"

#' Sample Attendance Data
#'
#' A dataset containing student IDs and their corresponding attendance records.
#'
#' @format A data.table with 5 rows and 2 variables:
#' \describe{
#'   \item{id}{Character. Unique identifier for each student.}
#'   \item{attendance_days}{Integer. Number of days the student was present.}
#' }
#'
#' @examples
#' data(attendance)
#' head(attendance)
#'
#' @source
#' This data is manually created for demonstration purposes.
"attendance"

