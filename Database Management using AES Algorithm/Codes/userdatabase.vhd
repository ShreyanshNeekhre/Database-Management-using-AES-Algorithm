library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package userdatabase is
   type ROM_user is array (9 downto 0) of std_logic_vector(19 downto 0);
	type ROM_pass is array (9 downto 0) of std_logic_vector(127 downto 0);
	  function table_user(dat:ROM_user) return ROM_user;
	  function table_pass(dat:ROM_pass) return ROM_pass;
end userdatabase;

package body userdatabase is
	 function table_user(dat:ROM_user) return ROM_user is
    variable d: ROM_user;
	 begin
	 d(0):=x"00001";
	 d(1):=x"12345";
	 d(2):=x"78459";
	 d(3):=x"12456";
	 d(4):=x"96587";
	 d(5):=x"36148";
	 d(6):=x"85264";
	 d(7):=x"96345";
	 d(8):=x"87936";
	 d(9):=x"98756";
	 return d;
	 end function table_user;
	 
    function table_pass(dat:ROM_pass) return ROM_pass is
    variable d: ROM_pass;
	 begin
	 d(0):=x"c97804928533a86b302e315f7e6cc1c8";
	 d(1):=x"62f6b1afc1bff6d5914fee5da926fb5b";
	 d(2):=x"22faa4ad1f46d005fb533b418d071e98";
	 d(3):=x"abfa3ed2fb85909a1cfca4007f988f5b";
	 d(4):=x"7f348b4eadfa141e6f73be62a6e6d73e";
	 d(5):=x"8c2b799a6d88d0ac82e7ca462a3124a4";
	 d(6):=x"4bdcc17f5b92e00477b8fa727e9cbe32";
	 d(7):=x"e869b43b8d717a77def52c07bf12bd5a";
	 d(8):=x"a05770975a7debc7d18c3ac96ffdf5bc";
	 d(9):=x"f03be6a3880a061e02106f3e25be8922";
	 return d;
	 end function table_pass;
	 
end userdatabase;