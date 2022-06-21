library ieee;
use ieee.std_logic_1164.all;

entity test_enc is 
end test_enc;

architecture behavior of test_enc is
	component usercheck is
      port( clk: in std_logic;
      rst: in std_logic;
      user: in std_logic_vector(19 downto 0);
      password: in std_logic_vector(23 downto 0);
		enc_password:buffer std_logic_vector(127 downto 0);
		enter: out std_logic); 
    end component;
	signal enc_password: std_logic_vector(127 downto 0);
	signal user :std_logic_vector(19 downto 0);
	signal password : std_logic_vector(23 downto 0);
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';

	signal enter: std_logic;
	
	
begin
--process
--begin


rst <= '1' after 10ns;
user <= x"36148";
password <= x"123879";
--wait;
--end process;
clk <= not clk after 5ns;
enc_inst: usercheck port map(clk, rst, user, password,enc_password, enter);
end behavior;