@ TODO make sure that section names are unique
@ TODO convert labels, code_sections, memory_sections and modules to maps for calrity
@ TODO maybe: inner memory_map and code_map aswell
@ TODO add modules on indent -> add move lists on register -> resolve to get accurate registers

core {
    module instruction
    module selector
    module comparitor
    module adder
    module subtractor
    module inverter
    register memory[2]
    register data[2]
    register operant[3]
}

define {
    code_offset = 1
    memory_offset = 1
    command_prefix = "> "
}

memory main {
    command_display:
    string #command_prefix
}

code main {
    main:
    [ #true -> instruction:condition | .loop -> instruction:jump ]
    [ 3 -> adder0:in0 | 1 -> adder0:in1 ]

    .loop:
    [ #true -> instruction:condition | .loop -> instruction:jump ]
}

memory_map {
    #memory_offset -> main -> #default
}

code_map {
    #code_offset -> main -> #default
}
