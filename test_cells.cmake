function (assert_dead x y)
    is_alive(${x} ${y} bvar ${ARGN})
    if (bvar)
        message(FATAL_ERROR "[${x},${y}] should be dead")
    endif()
endfunction()

assert_dead(0 2 0;0;0;1;1;0;1;1)

function (assert_alive x y)
    is_alive(${x} ${y} bvar ${ARGN})
    if (NOT bvar)
        message(FATAL_ERROR "[${x},${y}] should be alive")
    endif()
endfunction()

assert_alive(0 1 0;0;0;1;1;0;1;1)

function(test_any_cell_with_less_than_two_neighbours_dies)
    set(cells 0;0)
    evolve(new_cells ${cells})
    assert_dead(0 0 ${new_cells})

    set(cells 0;0 0;1)
    evolve(new_cells ${cells})
    assert_dead(0 1 ${new_cells})
endfunction()

test_any_cell_with_less_than_two_neighbours_dies()

function (test_any_cell_with_two_or_three_neighbours_survives)
    set(cells     1;1 2;1
            0;2 1;2    )
    evolve(new_cells ${cells})
    assert_alive(0 2 ${new_cells})
    assert_alive(1 2 ${new_cells})
endfunction()

test_any_cell_with_two_or_three_neighbours_survives()

function(test_any_cell_with_more_than_three_neighbours_dies)
    set(cells 0;1 1;1 2;1
            0;2 1;2 2;2 )
    evolve(new_cells ${cells})
    assert_dead(1 1 ${new_cells})
    assert_dead(1 2 ${new_cells})
endfunction()

test_any_cell_with_more_than_three_neighbours_dies()

function(test_three_neighbours_give_life_to_a_new_cell)
    set(cells     1;1 2;1
            0;2        )
    evolve(new_cells ${cells})
    assert_alive(1 2 ${new_cells})
endfunction()

test_three_neighbours_give_life_to_a_new_cell()
