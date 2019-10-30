function(ASSERTTRUE)
    set(options)
    set(oneValueArgs MSG)
    set(multiValueArgs EXPECTED CURRENT CONDITION)
    cmake_parse_arguments(
        PARSE_ARGV 0
        AEL "${options}" "${oneValueArgs}" "${multiValueArgs}"
    )

    foreach(arg IN LISTS AEL_UNPARSED_ARGUMENTS)
        message("Unparse argument: '${arg}'")
    endforeach()

    set(AEL_EXPECTED x ${AEL_EXPECTED})
    set(AEL_CURRENT  x ${AEL_CURRENT})
    if (${AEL_CONDITION})
    else()
        message("Expected:<${AEL_EXPECTED}>")
        message("Current: <${AEL_CURRENT}>")
        message(FATAL_ERROR ${AEL_MSG})
    endif()
endfunction()

function(ASSERTEQ)
    ASSERTTRUE(CONDITION AEL_EXPECTED STREQUAL AEL_CURRENT ${ARGN})
endfunction()

function(ASSERTNEQ)
    ASSERTTRUE(CONDITION NOT AEL_EXPECTED STREQUAL AEL_CURRENT ${ARGN})
endfunction()
