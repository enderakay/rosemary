# https://www.flickr.com/photos/stringrbelle/49268334767

#' @rdname rosemary
#' @export
rainbow_tears <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "rainbow_tears.png")

  set.seed(2)

  pal <- function(n, alpha, ...) {
    c("#00000000", grDevices::rainbow(n = n-1, alpha = alpha, ...))
  }
  fname <- "~/Desktop/rain.png"

  jasmines::scene_mix(
    n = 30,
    entity = "droplet",
    grain = 500,
    size = c(1.5, 2),
    angle = 0,
    xpos = (1:20),
    ypos = (1:20),
    shape = 2
  ) %>%
    dplyr::mutate(
      x = x * .75,
      y = y * .75
    ) %>%
    jasmines::unfold_tempest(
      iterations = 100,
      scale = .005,
      seed = 2
    ) %>%
    jasmines::unfold_inside() %>%
    dplyr::mutate(order = 1 + (inside == 1)*id) %>%
    jasmines::style_ribbon(
      palette = pal,
      seed_fill = "#00000044",
      alpha_init = .8,
      alpha_decay = .025
    ) %>%
    jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}



