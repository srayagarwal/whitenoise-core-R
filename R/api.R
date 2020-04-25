# Title     : api helpers
# Objective : Helper R functions for calling to the C library
# Created by: Consequences of Data
# Created on: 2020-04-20

#' Validate analysis
#'
#' @export
#' @rdname whitenoise
#' @useDynLib whitenoise validate_analysis_wrapper
validate_analysis <- function(analysis, release) {
  request <- RProtoBuf::new(whitenoise.RequestValidateAnalysis,
                            analysis = analysis,
                            release = release)
  request_message <- request$serialize(NULL)
  response_message <- .Call(validate_analysis_wrapper, request_message, PACKAGE = 'whitenoise')

  whitenoise.ResponseValidateAnalysis$read(response_message)
}

#' Compute privacy usage
#'
#' @export
#' @rdname whitenoise
#' @useDynLib whitenoise compute_privacy_usage_wrapper
compute_privacy_usage <- function(analysis, release) {
  request <- RProtoBuf::new(whitenoise.RequestComputePrivacyUsage,
                            analysis = analysis,
                            release = release)
  request_message <- request$serialize(NULL)
  response_message <- .Call(compute_privacy_usage_wrapper, request_message, PACKAGE = 'whitenoise')

  whitenoise.ResponseComputePrivacyUsage$read(response_message)
}

#' Generate report
#'
#' @export
#' @rdname whitenoise
#' @useDynLib whitenoise generate_report_wrapper
generate_report <- function(analysis, release) {
  request <- RProtoBuf::new(whitenoise.RequestGenerateReport,
                            analysis = analysis,
                            release = release)
  request_message <- request$serialize(NULL)
  response_message <- .Call(generate_report_wrapper, request_message, PACKAGE = 'whitenoise')

  whitenoise.ResponseGenerateReport$read(response_message)
}

#' Get properties
#'
#' @export
#' @rdname whitenoise
#' @useDynLib whitenoise get_properties_wrapper
get_properties <- function(analysis, release) {
  request <- RProtoBuf::new(whitenoise.RequestGetProperties,
                            analysis = analysis,
                            release = release)
  request_message <- request$serialize(NULL)
  response_message <- .Call(get_properties_wrapper, request_message, PACKAGE = 'whitenoise')

  whitenoise.ResponseGetProperties$read(response_message)
}

#' Release
#'
#' @export
#' @rdname whitenoise
#' @useDynLib whitenoise release_wrapper
release <- function(analysis, release, stack_trace, filter_level) {
  request <- RProtoBuf::new(whitenoise.RequestRelease,
                            analysis = analysis,
                            release = release,
                            stack_trace = stack_trace,
                            filter_level = filter_level)
  request_message <- request$serialize(NULL)
  response_message <- .Call(get_properties_wrapper, request_message, PACKAGE = 'whitenoise')

  whitenoise.ResponseRelease$read(response_message)
}
