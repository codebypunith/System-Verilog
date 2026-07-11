class Packet;
  static int packet_count = 0; // Shared across all instances
         int packet_id;        // Unique to each instance

  function new();
    packet_count++;
    packet_id = packet_count;
  endfunction
endclass

module top;
  initial begin
    Packet p1 = new(); // packet_count=1, p1.packet_id=1
    Packet p2 = new(); // packet_count=2, p2.packet_id=2
    Packet p3 = new(); // packet_count=3, p3.packet_id=3
    
    $display("Total packets: %0d", Packet::packet_count); // Accessible via scope operator
    $display("p1 ID: %0d, p2 ID: %0d, p3 ID: %0d", p1.packet_id, p2.packet_id, p3.packet_id);
  end
endmodule
