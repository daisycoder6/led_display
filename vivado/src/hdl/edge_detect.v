module edge_detect(



input                       async_sig,
input                       clk,
output reg                  sync_signal
//                    output reg  fall

);

reg [1:3] resync;

//    reg    Q0;

always @(posedge clk)
begin
    // detect rising and falling edges.
//        Q0 <= async_sig;
//        sync_signal = Q0;
    sync_signal <= resync[2] & !resync[3];
//        fall <= resync[3] & !resync[2];
     // update history shifter.
    resync <= {async_sig , resync[1:2]};
end

endmodule