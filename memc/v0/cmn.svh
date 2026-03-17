`ifndef CMN_SVH
`define CMN_SVH

typedef struct packed{
	bit valid;
	bit dirty;
	byte tag;
	logic [127:0] data;
}cacheline_t;

typedef struct packed{
	cacheline_t [2] lines;
}cacheset_t;

`endif
