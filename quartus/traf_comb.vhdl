library ieee;
use ieee.std_logic_1164.all;

entity comb is
  port (
    Q3,Q2,Q1,Q0,EV,CW: in std_logic;
    Q3p,Q2p,Q1p,Q0p,GREEN,YELLOW,RED: out std_logic
  );
end entity;

architecture rtl of comb is
begin
      D3     <=   ((not Q3) and (not Q2)                           and EV                   )
    	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and (not EV) and CW      )
    	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and EV                   )
    	 or (Q3       and (not Q2) and (not Q1) and (not Q0)                          )
    	 or (Q3       and (not Q2) and (not Q1) and Q0                                )
    	 or (Q3       and Q2       and (not Q1) and (not Q0)                          )
    	 or (Q3       and Q2       and (not Q1) and Q0                                )
    	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );

      D2     <=   ((not Q3) and (not Q2) and Q1       and Q0       and (not EV)             )
    	 or (Q3       and (not Q2) and (not Q1) and Q0                                )
    	 or (Q3       and Q2       and (not Q1) and (not Q0)                          )
    	 or (Q3       and Q2       and (not Q1) and Q0                                )
    	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );

      D1     <=   ((not Q3) and (not Q2) and (not Q1) and Q0       and (not EV)             )
    	 or ((not Q3) and (not Q2) and Q1       and (not Q0) and (not EV)             )
    	 or (Q3       and Q2       and (not Q1) and Q0                                )
    	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );

      D0     <=   ((not Q3) and (not Q2) and (not Q1) and (not Q0) and (not EV)             )
    	 or ((not Q3) and (not Q2) and Q1       and (not Q0) and (not EV)             )
    	 or ((not Q3) and (not Q2)                           and EV                   )
    	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and EV                   )
    	 or (Q3       and (not Q2) and (not Q1) and (not Q0)                          )
    	 or (Q3       and Q2       and (not Q1) and (not Q0)                          );

      GREEN  <=   ((not Q3) and (not Q2) and (not Q1) and (not Q0) and (not EV)             )
    	 or ((not Q3) and (not Q2) and (not Q1) and Q0       and (not EV)             )
    	 or ((not Q3) and (not Q2) and Q1       and (not Q0) and (not EV)             )
    	 or ((not Q3) and (not Q2) and Q1       and Q0       and (not EV)             )
    	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and (not EV) and (not CW))
    	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and (not EV) and CW      );

      YELLOW <=   ((not Q3) and (not Q2)                           and EV                   )
    	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and EV                   )
    	 or (Q3       and (not Q2) and (not Q1) and (not Q0)                          )
    	 or (Q3       and (not Q2) and (not Q1) and Q0                                );

      RED    <=   (Q3       and Q2       and (not Q1) and (not Q0)                          )
    	 or (Q3       and Q2       and (not Q1) and Q0                                )
    	 or (Q3       and Q2       and Q1       and (not Q0) and (not EV)             )
    	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );
end rtl;
