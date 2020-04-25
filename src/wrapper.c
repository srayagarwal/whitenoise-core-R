#define R_NO_REMAP
#define STRICT_R_HEADERS
#include <R.h>
#include <Rinternals.h>

// Import C headers for rust API
#include "whitenoise-core/validator-rust/api.h"
#include "whitenoise-core/runtime-rust/api.h"

SEXP validate_analysis_wrapper(SEXP buffer) {
    ByteBufferValidator response = validate_analysis(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}
SEXP compute_privacy_usage_wrapper(SEXP buffer) {
    ByteBufferValidator response = compute_privacy_usage(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}
SEXP generate_report_wrapper(SEXP buffer) {
    ByteBufferValidator response = generate_report(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}
SEXP accuracy_to_privacy_usage_wrapper(SEXP buffer) {
    ByteBufferValidator response = accuracy_to_privacy_usage(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}
SEXP privacy_usage_to_accuracy_wrapper(SEXP buffer) {
    ByteBufferValidator response = privacy_usage_to_accuracy(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}
SEXP get_properties_wrapper(SEXP buffer) {
    ByteBufferValidator response = get_properties(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}
SEXP expand_component_wrapper(SEXP buffer) {
    ByteBufferValidator response = expand_component(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}
SEXP release_wrapper(SEXP buffer) {
    ByteBufferRuntime response = release(RAW(buffer), Rf_length(buffer));
    return Rf_ScalarString(Rf_mkCharLenCE((const char *)(response.data), response.len, CE_UTF8));
}

// Standard R package stuff
static const R_CallMethodDef CallEntries[] = {
        {"validate_analysis_wrapper", (DL_FUNC) &validate_analysis_wrapper, 1},
        {"compute_privacy_usage_wrapper", (DL_FUNC) &compute_privacy_usage_wrapper, 1},
        {"generate_report_wrapper", (DL_FUNC) &generate_report_wrapper, 1},
        {"accuracy_to_privacy_usage_wrapper", (DL_FUNC) &accuracy_to_privacy_usage_wrapper, 1},
        {"privacy_usage_to_accuracy_wrapper", (DL_FUNC) &privacy_usage_to_accuracy_wrapper, 1},
        {"get_properties_wrapper", (DL_FUNC) &get_properties_wrapper, 1},
        {"expand_component_wrapper", (DL_FUNC) &expand_component_wrapper, 1},
        {"release_wrapper", (DL_FUNC) &release_wrapper, 1},
        {NULL, NULL, 0}
};

void R_init_whitenoise(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
