library(jasmines)

#' @rdname rosemary
#' @export
one_art_please <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "one_art_please.png")

  pal <- function(n, alpha = 1, ...) {
    f <- jasmines::palette_named("base")
    c("#00000088", f(n = n-1, alpha = alpha))
  }

  set.seed(1)
  pic <- jasmines::scene_grid(1:10, 1:10, grain = 200) %>%
    jasmines::unfold_slice(seed = 1) %>%
    jasmines::unfold_inside() %>%
    dplyr::mutate(order = 1 + (inside > 0) * id) %>%
    jasmines::style_ribbon(palette = pal)

  r <- c(.125,.875)
  pic <- pic +
    ggplot2::coord_cartesian(xlim= r, ylim = r)

  pic %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}


