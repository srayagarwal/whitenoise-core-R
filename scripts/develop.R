# Title     : TODO
# Objective : TODO
# Created by: michael
# Created on: 4/25/20

build_docs <- function() {
  pkgbuild::compile_dll()
  devtools::document()
}

build_package <- function() {
  Sys.setenv(R_BUILD_TAR = "tar")
  devtools::build()
}

install_package <- function() {
  Sys.setenv(R_BUILD_TAR = "tar")
  devtools::install()
}

clean <- function() {
  unlink(file.path(getwd(), "src", "whitenoise.so"))
  unlink(file.path(getwd(), "src", "wrapper.o"))
  unlink(file.path(getwd(), "R", "components.R"))
}