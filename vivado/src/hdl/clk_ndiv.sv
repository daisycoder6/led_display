module clk_ndiv

# (divider = 2500000)

(

input                       clk,
input                       rstN,
output  logic                 clk_out
);


logic                     [31:0] count;

always @(posedge clk, negedge rstN)
    begin
        if(!rstN) begin
            count <= 32'b0;
        end
        else begin
            if(count == divider-1) begin
                count <= 32'b0;
            end else begin
                count <= count + 1'b1;
            end
        end
    end


always @(posedge clk, negedge rstN)
    begin
        if(!rstN) begin
            clk_out <= 1'b0;
        end else begin
            if(count == divider-1) begin
                clk_out <= ~clk_out;
            end else begin
                clk_out <= clk_out;
            end
        end
    end

endmodule