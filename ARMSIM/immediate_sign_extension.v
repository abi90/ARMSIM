module immediate_sign_extension(output reg [31:0] Out, input [31:0] In, input EN, input [1:0] SISE);
always@(*)	
begin
	if (EN)
	begin
		case (SISE)
			2'b00:
			begin
				Out[7:0] <= In[7:0];
				Out[31:8] <= {24{In[7]}};
			end
			2'b01:
			begin
				Out[11:0] <= In[11:0];
				Out[31:12] <= {20{In[11]}};
			end
			2'b10:
			begin
				Out[7:0] <= {In[11:8], In[3:0]};
				Out[31:8] <= {24{In[11]}};
			end
			default:
			begin
				Out[7:0] <= {In[11:8], In[3:0]};
				Out[31:8] <= {24{In[11]}};
			end
		endcase
	end
	else
	begin
		case (SISE)
			2'b00:
			begin
				Out[7:0] <= In[7:0];
				Out[31:8] <= 24'b000000000000000000000000;
			end
			2'b01:
			begin
				Out[11:0] <= In[11:0];
				Out[31:12] <= 20'b00000000000000000000;
			end
			2'b10:
			begin
				Out[7:0] <= {In[11:8], In[3:0]};
				Out[31:8] <= 24'b000000000000000000000000;
			end
			default:
			begin
				Out[7:0] <= {In[11:8], In[3:0]};
				Out[31:8] <= 24'b000000000000000000000000;
			end
		endcase
	end
end
endmodule