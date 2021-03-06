
-- Copyright (C) 2001 Bill Billowitch.

-- Some of the work to develop this test suite was done with Air Force
-- support.  The Air Force and Bill Billowitch assume no
-- responsibilities for this software.

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

-- ---------------------------------------------------------------------
--
-- $Id: tc1990.vhd,v 1.2 2001-10-26 16:30:14 paw Exp $
-- $Revision: 1.2 $
--
-- ---------------------------------------------------------------------

ENTITY c07s02b02x00p07n01i01990ent IS
END c07s02b02x00p07n01i01990ent;

ARCHITECTURE c07s02b02x00p07n01i01990arch OF c07s02b02x00p07n01i01990ent IS

BEGIN
  TESTING: PROCESS
    type ft is file of integer;
    file f1 : ft is "01.vhdl";
    file f2 : ft is "02.vhdl";
  BEGIN
    if (f1/=f2) then    -- Failure_here
      -- equality and inequality operators are
      NULL;        -- not defined for file types.
    end if;
    assert FALSE 
      report "***FAILED TEST: c07s02b02x00p07n01i01990 - Inequality operators are not defined for file types."
      severity ERROR;
    wait;
  END PROCESS TESTING;

END c07s02b02x00p07n01i01990arch;
