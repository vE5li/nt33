core {
    module instruction
    module selector
    module adder
    module inverter
    module comparitor
    register data[2]
    register memory[2]
    register operant[2]
}

define {
    code_offset = 1
    memory_offset = 1
    command_prefix = "> "
}

memory main {
    command_display:
    string #command_prefix
    memory_start:
}

code fibonacci {
    start:
    [ 1 -> data:slot0 | 1 -> data:slot1 ]

    [ $memory_start -> selector:address ]
    [ 255 -> memory:slot0 | '6' -> memory:slot1 ]

    .loop:
    [ data:slot0 -> adder0:in0 | data:slot1 -> adder0:in1 ]
    [ data:slot1 -> data:slot0 | adder0:out -> data:slot1 ]
    [ adder0:overflow -> comparitor0:in0 | #true -> comparitor0:in1 ]
    [ comparitor0:equal -> inverter0:in ]
    [ .loop -> instruction:jump | inverter0:out -> instruction:condition ]

    .done:
    [ .done -> instruction:jump | #true -> instruction:condition ]
}

code {
    send_string:
    [ memory:slot0 -> comparitor0:in0 | 0 -> data:slot0 | 1 -> adder0:in0 ]

    .loop:
    [ selector:address -> adder0:in1 ]
    [ adder0:out -> selector:address ]

    [ data:slot0 -> comparitor0:in1 | data:slot0 -> adder0:in1 ]
    [ .loop -> instruction:jump | comparitor0:equal -> instruction:condition | adder0:out -> data:slot0 ]
}

map memory {
    #memory_offset -> main -> #default
}

map code {
    #code_offset -> fibonacci -> #default
}
