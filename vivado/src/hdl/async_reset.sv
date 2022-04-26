module async_reset(

input                       clk,
input                       asyncrst_p,
output      logic           rst_n
);


wire                        asyncrst_n;

assign asyncrst_n = ~asyncrst_p;

logic    rff1;

always @(posedge clk or negedge asyncrst_n)
begin
    if (!asyncrst_n) begin
        {rst_n, rff1} <= 2'b0;
    end else begin
        {rst_n,rff1} <= {rff1,1'b1};
    end
end

endmodule