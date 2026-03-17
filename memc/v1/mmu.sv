module mmu(
  input[15:0] vaddr,
	input e,
  output[13:0] busaddr
  );
  assign busaddr=vaddr[13:0];
  endmodule
