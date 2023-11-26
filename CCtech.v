module CCtech(clk,msg,rst,opmsg,count);
    input clk,rst;
    reg [2:0]src;
    input [3:0]msg;
    output reg [3:0]count;
    output reg [2:0]opmsg;
// for an n-k shift register where n= 7,k=4//
//m(x)=1+x+x^3 = 1011//
always@(posedge clk)
begin
    if(rst==1'b0)
    begin
    src[2]<=0;
    src[1]<=0;
    src[0]<=0;
    count<=4'b0000;
    end
    else
    begin
        count<=count+1;
        src[2]<=msg[count]^src[0];
        src[1]<=src[2]^msg[count];
        src[0]<=src[1];
        opmsg<=src;
    end
end
endmodule