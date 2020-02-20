core {
    module instruction
    module selector
    module adder
    register data[2]
    register operant[2]
    @register memory[2]
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

code fibonacci {
    start:
    [ 1 -> data:slot0 | 1 -> data:slot1 ]

    .loop:
    [ data:slot0 -> adder0:in0 | data:slot1 -> adder0:in1 ]
    [ data:slot1 -> data:slot0 | adder0:out -> data:slot1 ]
    [ .loop -> instruction:jump | #true -> instruction:condition ]
}

memory_map {
    #memory_offset -> main -> #default
}

code_map {
    #code_offset -> fibonacci -> #default
}
