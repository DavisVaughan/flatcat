% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flat-map.R
\name{flat-map-df}
\alias{flat-map-df}
\alias{flat_map_dfr}
\alias{flat_map_dfc}
\title{Flat map and convert to a data frame}
\usage{
flat_map_dfr(.x, .f, ..., .ptype = NULL, .names_to = NULL,
  .name_repair = c("unique", "universal", "check_unique"))

flat_map_dfc(.x, .f, ..., .ptype = NULL, .size = NULL,
  .name_repair = c("unique", "universal", "check_unique", "minimal"))
}
\arguments{
\item{.x}{A list or atomic vector.}

\item{.f}{A function, formula, or vector (not necessarily atomic).

If a \strong{function}, it is used as is.

If a \strong{formula}, e.g. \code{~ .x + 2}, it is converted to a function. There
are three ways to refer to the arguments:
\itemize{
\item For a single argument function, use \code{.}
\item For a two argument function, use \code{.x} and \code{.y}
\item For more arguments, use \code{..1}, \code{..2}, \code{..3} etc
}

This syntax allows you to create very compact anonymous functions.

If \strong{character vector}, \strong{numeric vector}, or \strong{list}, it is
converted to an extractor function. Character vectors index by
name and numeric vectors index by position; use a list to index
by position and name at different levels. If a component is not
present, the value of \code{.default} will be returned.}

\item{...}{Data frames or vectors.

\code{vec_rbind()} ignores names unless \code{.names_to} is supplied.
\code{vec_cbind()} creates packed data frame columns with named
inputs.

\code{NULL} inputs are silently ignored. Empty (e.g. zero row) inputs
will not appear in the output, but will affect the derived \code{.ptype}.}

\item{.ptype}{If \code{NULL}, the default, the output type is determined by
computing the common type across all elements of \code{...}.

Alternatively, you can supply \code{.ptype} to give the output known type.
If \code{getOption("vctrs.no_guessing")} is \code{TRUE} you must supply this value:
this is a convenient way to make production code demand fixed types.}

\item{.names_to}{Optionally, the name of a column where the names
of \code{...} arguments are copied. These names are useful to identify
which row comes from which input. If supplied and \code{...} is not named,
an integer column is used to identify the rows.}

\item{.name_repair}{One of \code{"unique"}, \code{"universal"}, or
\code{"check_unique"}. See \code{\link[=vec_as_names]{vec_as_names()}} for the meaning of these
options.

With \code{vec_rbind()}, the repair function is applied to all inputs
separately. This is because \code{vec_rbind()} needs to align their
columns before binding the rows, and thus needs all inputs to
have unique names. On the other hand, \code{vec_cbind()} applies the
repair function after all inputs have been concatenated together
in a final data frame. Hence \code{vec_cbind()} allows the more
permissive minimal names repair.}

\item{.size}{If, \code{NULL}, the default, will determine the number of
rows in \code{vec_cbind()} output by using the standard recycling rules.

Alternatively, specify the desired number of rows, and any inputs
of length 1 will be recycled appropriately.}
}
\description{
\itemize{
\item \code{flat_map_dfr()} calls \code{map()}, and then row binds the results into a
data frame using \code{vec_rbind()}.
\item \code{flat_map_dfc()} calls \code{map()}, and then column binds the results into a
data frame using \code{vec_cbind()}.
}
}
\details{
\code{flat_map_dfr()} and \code{flat_map_dfc()} try a bit harder to coerce the results
of \code{.f} to a data frame than \code{flat_map_vec()} would. For example, if a result
of \code{.f} is a 1d vector, for \code{flat_map_dfr()} it would be coerced into a 1
row data frame with as many columns as number of elements in the vector.
}
\examples{
flat_map_dfr(1:5, ~data.frame(x = 1))

flat_map_dfc(1:5, ~data.frame(x = 1))

# `flat_map_dfr()` "tries harder" to coerce vectors to a data frame
try(flat_map_vec(1:5, ~.x, .ptype = data.frame(x = integer())))

flat_map_dfr(1:5, ~.x)
}
