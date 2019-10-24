#' @rdname flat-map2
#' @export
flat_pmap_vec <- function(.l,
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
flat_pmap_lst <- function(.l,
                          .f,
                          ...,
                          .name_spec = NULL,
                          .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_pmap_vec(.l, .f, ..., .ptype = list(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
flat_pmap_dbl <- function(.l,
                          .f,
                          ...,
                          .name_spec = NULL,
                          .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_pmap_vec(.l, .f, ..., .ptype = double(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
flat_pmap_int <- function(.l,
                          .f,
                          ...,
                          .name_spec = NULL,
                          .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_pmap_vec(.l, .f, ..., .ptype = integer(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
flat_pmap_chr <- function(.l,
                          .f,
                          ...,
                          .name_spec = NULL,
                          .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_pmap_vec(.l, .f, ..., .ptype = character(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2
#' @export
flat_pmap_lgl <- function(.l,
                          .f,
                          ...,
                          .name_spec = NULL,
                          .name_repair = c("minimal", "unique", "check_unique", "universal")) {
  flat_pmap_vec(.l, .f, ..., .ptype = logical(), .name_spec = .name_spec, .name_repair = .name_repair)
}

#' @rdname flat-map2-df
#' @export
flat_pmap_dfr <- function(.l,
                          .f,
                          ...,
                          .ptype = NULL,
                          .names_to = NULL,
                          .name_repair = c("unique", "universal", "check_unique")) {
  out <- pmap(.l, .f, ...)
  vec_rbind(!!! out, .ptype = .ptype, .names_to = .names_to, .name_repair = .name_repair)
}

#' @rdname flat-map2-df
#' @export
flat_pmap_dfc <- function(.l,
                          .f,
                          ...,
                          .ptype = NULL,
                          .size = NULL,
                          .name_repair = c("unique", "universal", "check_unique", "minimal")) {
  out <- pmap(.l, .f, ...)
  vec_cbind(!!! out, .ptype = .ptype, .size = .size, .name_repair = .name_repair)
}
