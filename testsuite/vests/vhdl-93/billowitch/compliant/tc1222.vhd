
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
-- $Id: tc1222.vhd,v 1.2 2001-10-26 16:29:39 paw Exp $
-- $Revision: 1.2 $
--
-- ---------------------------------------------------------------------

ENTITY c08s01b00x00p27n01i01222ent IS
END c08s01b00x00p27n01i01222ent;

ARCHITECTURE c08s01b00x00p27n01i01222arch OF c08s01b00x00p27n01i01222ent IS
  -- Local signals.
  signal A : BIT;
BEGIN
  TESTING: PROCESS
    -- Local variables.
    variable ShouldBeTime    : TIME;
    variable I               : INTEGER;
    variable k       : integer := 0;
  BEGIN
    -- Assign same value to a signal.  Verify that the wait statement waits for the timeout interval.
    ShouldBeTime := NOW + 3 ns;
    A <= A after 2 ns;
    wait until (A = '1') for 3 ns;
    if (ShouldBeTime /= Now) then
      k := 1;
    end if;
    assert (ShouldBeTime = NOW);

    -- Assign same value to a signal.  Verify that the wait statement waits for the timeout interval.
    ShouldBeTime := NOW + 3 ns;
    A <= A after 2 ns;
    wait on A for 3 ns;
    if (ShouldBeTime /= Now) then
      k := 1;
    end if;
    assert (ShouldBeTime = NOW);
    assert NOT(k=0) 
      report "***PASSED TEST: c08s01b00x00p27n01i01222"
      severity NOTE;
    assert (k=0) 
      report "***FAILED TEST: c08s01b00x00p27n01i01222 - The suspended process should resume immediately after the timeout interval has expired."
      severity ERROR;
    wait;
  END PROCESS TESTING;

END c08s01b00x00p27n01i01222arch;
