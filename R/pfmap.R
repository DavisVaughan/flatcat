#' @rdname flat-map2
#' @export
pfmap_vec <- function(.l,
                      .f,
                      ...,
                      .ptype = NULL,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  out <- pmap(.l, .f, ...)
  vec_c(!!! out, .ptype = .ptype, .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
pfmap_lst <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = list(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
pfmap_dbl <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = double(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
pfmap_int <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = integer(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
pfmap_chr <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = character(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
pfmap_lgl <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = logical(), .name_spec = .name_spec, .name_repair = .name_repair)
}
