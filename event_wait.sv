module sv_event();
  bit a;
  
  initial
    begin
       #1; // comment this to see the behaviour of @ condition
       a=1;
    end
  
  initial
    begin
      @(a) $display("-------------------@ triggered, a = %0d------------------", a);
      // Causes race condition if 'a' triggered at the same time
      // bcz '@' condition waits for the edge triggering(change in edge -> posedge/negedge)
    end  
  initial
    begin
      wait(a) $display("-----------------wait triggered, a = %0d-----------------", a);
      // Avoids race condition even if 'a' is true in same time unit 
      // bcz 'wait' condition Waits for 'a' to be true 
    end
endmodule: sv_event
