pragma solidity ^0.5.15;

import "ds-test/test.sol";
import {DSToken} from "ds-token/token.sol";
import "../flap.sol";
import "../vat.sol";

contract Hevm {
    function warp(uint256) public;
}

contract FlapTest is DSTest {
    Hevm hevm;

    Flapper flap;
    Vat     vat;
    DSToken gem;

    address ali;
    address bob;

    function setUp() public {
        hevm = Hevm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
        hevm.warp(604411200);

        vat = new Vat();
        gem = new DSToken('');

        flap = new Flapper(address(vat));

        vat.hope(address(flap));
        gem.approve(address(flap));

        vat.suck(address(this), address(this), int(1000 ether));

        gem.mint(1000 ether);
        gem.setOwner(address(flap));

        gem.push(ali, 200 ether);
        gem.push(bob, 200 ether);
    }
//     function test_kick() public {
//         assertEq(vat.mai(address(this)), 1000 ether);
//         assertEq(vat.mai(address(flap)),    0 ether);
//         flap.kick({ lot: 100 ether
//                   , bid: 0
//                   });
//         assertEq(vat.mai(address(this)),  900 ether);
//         assertEq(vat.mai(address(flap)),  100 ether);
//     }
//     function test_tend() public {
//         uint id = flap.kick({ lot: 100 ether
//                             , bid: 0
//                             });
//         // lot taken from creator
//         assertEq(vat.mai(address(this)), 900 ether);
//
//         Guy(ali).tend(id, 100 ether, 1 ether);
//         // bid taken from bidder
//         assertEq(gem.balanceOf(ali), 199 ether);
//         // payment remains in auction
//         assertEq(gem.balanceOf(address(flap)),  1 ether);
//
//         Guy(bob).tend(id, 100 ether, 2 ether);
//         // bid taken from bidder
//         assertEq(gem.balanceOf(bob), 198 ether);
//         // prev bidder refunded
//         assertEq(gem.balanceOf(ali), 200 ether);
//         // excess remains in auction
//         assertEq(gem.balanceOf(address(flap)),   2 ether);
//
//         hevm.warp(now + 5 weeks);
//         Guy(bob).deal(id);
//         // high bidder gets the lot
//         assertEq(vat.mai(address(flap)),  0 ether);
//         assertEq(vat.mai(bob), 100 ether);
//         // income is burned
//         assertEq(gem.balanceOf(address(flap)),   0 ether);
//     }
//     function test_beg() public {
//         uint id = flap.kick({ lot: 100 ether
//                             , bid: 0
//                             });
//         assertTrue( Guy(ali).try_tend(id, 100 ether, 1.00 ether));
//         assertTrue(!Guy(bob).try_tend(id, 100 ether, 1.01 ether));
//         // high bidder is subject to beg
//         assertTrue(!Guy(ali).try_tend(id, 100 ether, 1.01 ether));
//         assertTrue( Guy(bob).try_tend(id, 100 ether, 1.07 ether));
//     }
//     function test_tick() public {
//         // start an auction
//         uint id = flap.kick({ lot: 100 ether
//                             , bid: 0
//                             });
//         // check no tick
//         assertTrue(!Guy(ali).try_tick(id));
//         // run past the end
//         hevm.warp(now + 2 weeks);
//         // check not biddable
//         assertTrue(!Guy(ali).try_tend(id, 100 ether, 1 ether));
//         assertTrue( Guy(ali).try_tick(id));
//         // check biddable
//         assertTrue( Guy(ali).try_tend(id, 100 ether, 1 ether));
//     }
}
