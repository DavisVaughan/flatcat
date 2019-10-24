#' Flat map
#'
#' Flat map is similar to map, except that the size restriction on the output
#' of each `.f` call is lifted. This means that rather than requiring a result
#' of size `1` from each function call, a flat map can return an object of
#' arbitrary size.
#'
#' @section Invariants:
#'
#'  * `vec_size(flat_map_vec(.x, .f)) == sum(map_int(map(.x, .f), vec_size))`
#'
#'  * `vec_ptype(flat_map_vec(.x, .ptype = ptype)) == ptype %||% vec_ptype_common(!!! map(.x, .f))`
#'
#' @inheritParams vctrs::vec_c
#' @inheritParams purrr::map
#'
#' @examples
#' # `map()` functions require that each result from `.f` have size 1
#' try(map_dbl(list(1, 2:3, 4:6), ~.x))
#'
#' # `flat_map_dbl()` and friends don't care
#' flat_map_dbl(list(1, 2:3, 4:6), ~.x)
#'
#' # Returning arbitrary output types
#' flat_map_vec(1:3, ~Sys.Date() + seq(0, .x))
#'
#' # Returning data frames of arbitrary sizes
#' flat_map_vec(1:3, ~data.frame(x = seq_len(.x)))
#'
#' # Name repair if required
#' flat_map_dbl(list(x = 1, x = 2), ~c(a = .x), .name_spec = "{outer}_{inner}")
#' @name flat-map
NULL

#' @rdname flat-map
#' @export
flat_map_vec <- function(.x,
                         .f,
                         ...,
                         .ptype = NULL,
                         .name_spec = NULL,
                         .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  out <- map(.x, .f, ...)
  vec_c(!!! out, .ptype = .ptype, .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map
#' @export
flat_map_lst <- function(.x,
                         .f,
                         ...,
                         .name_spec = NULL,
                         .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_map_vec(.x, .f, ..., .ptype = list(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map
#' @export
flat_map_dbl <- function(.x,
                         .f,
                         ...,
                         .name_spec = NULL,
                         .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_map_vec(.x, .f, ..., .ptype = double(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map
#' @export
flat_map_int <- function(.x,
                         .f,
                         ...,
                         .name_spec = NULL,
                         .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_map_vec(.x, .f, ..., .ptype = integer(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map
#' @export
flat_map_chr <- function(.x,
                         .f,
                         ...,
                         .name_spec = NULL,
                         .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_map_vec(.x, .f, ..., .ptype = character(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map
#' @export
flat_map_lgl <- function(.x,
                         .f,
                         ...,
                         .name_spec = NULL,
                         .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_map_vec(.x, .f, ..., .ptype = logical(), .name_spec = .name_spec, .name_repair = .name_repair)
}
