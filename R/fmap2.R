#' Flat map over multiple inputs simultaneously
#'
#' These functions are variants of [fmap_vec()] that iterate over multiple
#' arguments simultaneously.
#'
#' @param .x,.y Vectors of the same length. A vector of length 1 will be
#'   recycled.
#'
#' @inheritParams purrr::map2
#' @inheritParams fmap_vec
#'
#' @examples
#' # Interleave vectors (but this isn't that efficient)
#' fmap2_dbl(1:5, 6:10, ~c(.x, .y))
#'
#' @name flat-map2
NULL

#' @rdname flat-map2
#' @export
fmap2_vec <- function(.x,
                      .y,
                      .f,
                      ...,
                      .ptype = NULL,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  out <- map2(.x, .y, .f, ...)
  vec_c(!!! out, .ptype = .ptype, .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
fmap2_lst <- function(.x,
                      .y,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  fmap2_vec(.x, .y, .f, ..., .ptype = list(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
fmap2_dbl <- function(.x,
                      .y,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  fmap2_vec(.x, .y, .f, ..., .ptype = double(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
fmap2_int <- function(.x,
                      .y,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  fmap2_vec(.x, .y, .f, ..., .ptype = integer(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
fmap2_chr <- function(.x,
                      .y,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  fmap2_vec(.x, .y, .f, ..., .ptype = character(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
fmap2_lgl <- function(.x,
                      .y,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  fmap2_vec(.x, .y, .f, ..., .ptype = logical(), .name_spec = .name_spec, .name_repair = .name_repair)
}
