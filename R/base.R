# Title     : base
# Objective : core R data structures
# Created by: Consequences of Data
# Created on: 2020-04-20
# load proto descriptors
.onLoad <- function(libname, pkgname) {
  RProtoBuf::readProtoFiles2(
    files = c('api.proto', 'base.proto', 'components.proto', 'value.proto'),
    protoPath = file.path(system.file(package = "whitenoise"), "prototypes"))

  # list loaded messages
  # print(ls("RProtoBuf:DescriptorPool"))

   component_filenames <- list.files(
    file.path(system.file(package = "whitenoise"), "prototypes", "components"),
    pattern = "*.json", full.names = TRUE)
  components <- lapply( component_filenames, jsonlite::read_json)

  variant_message_map <- lapply(components, function(component) component$name)
  names(variant_message_map) <- lapply(components, function(component) component$id)
  assign("variantMessageMap", variant_message_map, envir = parent.env(environment()))
}
