library ieee;
use ieee.std_logic_1164.all;
library work;
use work.userdatabase.all;


entity usercheck is
port( clk: in std_logic;
      rst: in std_logic;
      user: in std_logic_vector(19 downto 0);
      password: in std_logic_vector(23 downto 0);
		enc_password:buffer std_logic_vector(127 downto 0);
		enter: out std_logic); 
end usercheck;

architecture behavioural of usercheck is

signal list_user: ROM_user;
signal list_pass: ROM_pass;
signal key: std_logic_vector(127 downto 0) :=x"3c4fcf098815f7aba6d2ae2816157e2b";
signal plainpass : std_logic_vector(127 downto 0);
signal concate_pass: std_logic_vector(103 downto 0):=x"00000000000000000000000000";
signal done: std_logic ;
signal user_match: std_logic;
signal index: integer;

component aes_enc
		port(
			clk        : in  std_logic;
			rst        : in  std_logic;
			key        : in  std_logic_vector(127 downto 0);
			plaintext  : in  std_logic_vector(127 downto 0);
			ciphertext : out std_logic_vector(127 downto 0);
			done       : out std_logic
		);		
	end component aes_enc;	

begin
list_user <=table_user(list_user);
list_pass <=table_pass(list_pass);
plainpass <= concate_pass & password;

label1: aes_enc
		port map(clk,rst,key,plainpass,enc_password,done);
		
process(user)
begin
for i in 9 downto 0 loop
if(list_user(i)=user) then
user_match<= '1';
index<=i;
else
user_match<= '0';
end if;
end loop;
end process;

process(enc_password,done)
begin
	if(done='1') then
			if(list_pass(index)=enc_password) then
				enter<='1';
			else
				enter<= '0';
			end if;
	else
      enter<= '0';	
	end if;
end process;
end behavioural;