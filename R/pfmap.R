#' @rdname flat-map2
#' @export
pfmap_vec <- function(.l,
                      .f,
                      ...,
                      .ptype = NULL,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  out <- pmap(.l, .f, ...)
  vec_c(!!! out, .ptype = .ptype)
}

#' @rdname flat-map2
#' @export
pfmap_lst <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = list())
}

#' @rdname flat-map2
#' @export
pfmap_dbl <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = double())
}

#' @rdname flat-map2
#' @export
pfmap_int <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = integer())
}

#' @rdname flat-map2
#' @export
pfmap_chr <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = character())
}

#' @rdname flat-map2
#' @export
pfmap_lgl <- function(.l,
                      .f,
                      ...,
                      .name_spec = NULL,
                      .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  pfmap_vec(.l, .f, ..., .ptype = logical())
}
