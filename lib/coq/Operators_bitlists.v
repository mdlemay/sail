(*==========================================================================*)
(*     Sail                                                                 *)
(*                                                                          *)
(*  Sail and the Sail architecture models here, comprising all files and    *)
(*  directories except the ASL-derived Sail code in the aarch64 directory,  *)
(*  are subject to the BSD two-clause licence below.                        *)
(*                                                                          *)
(*  The ASL derived parts of the ARMv8.3 specification in                   *)
(*  aarch64/no_vector and aarch64/full are copyright ARM Ltd.               *)
(*                                                                          *)
(*  Copyright (c) 2013-2021                                                 *)
(*    Kathyrn Gray                                                          *)
(*    Shaked Flur                                                           *)
(*    Stephen Kell                                                          *)
(*    Gabriel Kerneis                                                       *)
(*    Robert Norton-Wright                                                  *)
(*    Christopher Pulte                                                     *)
(*    Peter Sewell                                                          *)
(*    Alasdair Armstrong                                                    *)
(*    Brian Campbell                                                        *)
(*    Thomas Bauereiss                                                      *)
(*    Anthony Fox                                                           *)
(*    Jon French                                                            *)
(*    Dominic Mulligan                                                      *)
(*    Stephen Kell                                                          *)
(*    Mark Wassell                                                          *)
(*    Alastair Reid (Arm Ltd)                                               *)
(*                                                                          *)
(*  All rights reserved.                                                    *)
(*                                                                          *)
(*  This work was partially supported by EPSRC grant EP/K008528/1 <a        *)
(*  href="http://www.cl.cam.ac.uk/users/pes20/rems">REMS: Rigorous          *)
(*  Engineering for Mainstream Systems</a>, an ARM iCASE award, EPSRC IAA   *)
(*  KTF funding, and donations from Arm.  This project has received         *)
(*  funding from the European Research Council (ERC) under the European     *)
(*  Union’s Horizon 2020 research and innovation programme (grant           *)
(*  agreement No 789108, ELVER).                                            *)
(*                                                                          *)
(*  This software was developed by SRI International and the University of  *)
(*  Cambridge Computer Laboratory (Department of Computer Science and       *)
(*  Technology) under DARPA/AFRL contracts FA8650-18-C-7809 ("CIFV")        *)
(*  and FA8750-10-C-0237 ("CTSRD").                                         *)
(*                                                                          *)
(*  Redistribution and use in source and binary forms, with or without      *)
(*  modification, are permitted provided that the following conditions      *)
(*  are met:                                                                *)
(*  1. Redistributions of source code must retain the above copyright       *)
(*     notice, this list of conditions and the following disclaimer.        *)
(*  2. Redistributions in binary form must reproduce the above copyright    *)
(*     notice, this list of conditions and the following disclaimer in      *)
(*     the documentation and/or other materials provided with the           *)
(*     distribution.                                                        *)
(*                                                                          *)
(*  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''      *)
(*  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED       *)
(*  TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A         *)
(*  PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR     *)
(*  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,            *)
(*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *)
(*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF        *)
(*  USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND     *)
(*  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,      *)
(*  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT      *)
(*  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF      *)
(*  SUCH DAMAGE.                                                            *)
(*==========================================================================*)

Require Import Sail.Values.
Require Import Sail.Operators.

(*

(* Specialisation of operators to bit lists *)

val access_vec_inc : list bitU -> integer -> bitU
let access_vec_inc = access_bv_inc

val access_vec_dec : list bitU -> integer -> bitU
let access_vec_dec = access_bv_dec

val update_vec_inc : list bitU -> integer -> bitU -> list bitU
let update_vec_inc = update_bv_inc

val update_vec_dec : list bitU -> integer -> bitU -> list bitU
let update_vec_dec = update_bv_dec

val subrange_vec_inc : list bitU -> integer -> integer -> list bitU
let subrange_vec_inc = subrange_bv_inc

val subrange_vec_dec : list bitU -> integer -> integer -> list bitU
let subrange_vec_dec = subrange_bv_dec

val update_subrange_vec_inc : list bitU -> integer -> integer -> list bitU -> list bitU
let update_subrange_vec_inc = update_subrange_bv_inc

val update_subrange_vec_dec : list bitU -> integer -> integer -> list bitU -> list bitU
let update_subrange_vec_dec = update_subrange_bv_dec

val extz_vec : integer -> list bitU -> list bitU
let extz_vec = extz_bv

val exts_vec : integer -> list bitU -> list bitU
let exts_vec = exts_bv

val concat_vec : list bitU -> list bitU -> list bitU
let concat_vec = concat_bv

val cons_vec : bitU -> list bitU -> list bitU
let cons_vec = cons_bv

val bool_of_vec : mword ty1 -> bitU
let bool_of_vec = bool_of_bv

val cast_unit_vec : bitU -> mword ty1
let cast_unit_vec = cast_unit_bv

val vec_of_bit : integer -> bitU -> list bitU
let vec_of_bit = bv_of_bit

val msb : list bitU -> bitU
let msb = most_significant

val int_of_vec : bool -> list bitU -> integer
let int_of_vec = int_of_bv

val string_of_vec : list bitU -> string
let string_of_vec = string_of_bv

val and_vec : list bitU -> list bitU -> list bitU
val or_vec  : list bitU -> list bitU -> list bitU
val xor_vec : list bitU -> list bitU -> list bitU
val not_vec : list bitU -> list bitU
let and_vec = and_bv
let or_vec  = or_bv
let xor_vec = xor_bv
let not_vec = not_bv

val add_vec   : list bitU -> list bitU -> list bitU
val sadd_vec  : list bitU -> list bitU -> list bitU
val sub_vec   : list bitU -> list bitU -> list bitU
val mult_vec  : list bitU -> list bitU -> list bitU
val smult_vec : list bitU -> list bitU -> list bitU
let add_vec   = add_bv
let sadd_vec  = sadd_bv
let sub_vec   = sub_bv
let mult_vec  = mult_bv
let smult_vec = smult_bv

val add_vec_int   : list bitU -> integer -> list bitU
val sadd_vec_int  : list bitU -> integer -> list bitU
val sub_vec_int   : list bitU -> integer -> list bitU
val mult_vec_int  : list bitU -> integer -> list bitU
val smult_vec_int : list bitU -> integer -> list bitU
let add_vec_int   = add_bv_int
let sadd_vec_int  = sadd_bv_int
let sub_vec_int   = sub_bv_int
let mult_vec_int  = mult_bv_int
let smult_vec_int = smult_bv_int

val add_int_vec   : integer -> list bitU -> list bitU
val sadd_int_vec  : integer -> list bitU -> list bitU
val sub_int_vec   : integer -> list bitU -> list bitU
val mult_int_vec  : integer -> list bitU -> list bitU
val smult_int_vec : integer -> list bitU -> list bitU
let add_int_vec   = add_int_bv
let sadd_int_vec  = sadd_int_bv
let sub_int_vec   = sub_int_bv
let mult_int_vec  = mult_int_bv
let smult_int_vec = smult_int_bv

val add_vec_bit  : list bitU -> bitU -> list bitU
val sadd_vec_bit : list bitU -> bitU -> list bitU
val sub_vec_bit  : list bitU -> bitU -> list bitU
let add_vec_bit  = add_bv_bit
let sadd_vec_bit = sadd_bv_bit
let sub_vec_bit  = sub_bv_bit

val add_overflow_vec         : list bitU -> list bitU -> (list bitU * bitU * bitU)
val add_overflow_vec_signed  : list bitU -> list bitU -> (list bitU * bitU * bitU)
val sub_overflow_vec         : list bitU -> list bitU -> (list bitU * bitU * bitU)
val sub_overflow_vec_signed  : list bitU -> list bitU -> (list bitU * bitU * bitU)
val mult_overflow_vec        : list bitU -> list bitU -> (list bitU * bitU * bitU)
val mult_overflow_vec_signed : list bitU -> list bitU -> (list bitU * bitU * bitU)
let add_overflow_vec         = add_overflow_bv
let add_overflow_vec_signed  = add_overflow_bv_signed
let sub_overflow_vec         = sub_overflow_bv
let sub_overflow_vec_signed  = sub_overflow_bv_signed
let mult_overflow_vec        = mult_overflow_bv
let mult_overflow_vec_signed = mult_overflow_bv_signed

val add_overflow_vec_bit         : list bitU -> bitU -> (list bitU * bitU * bitU)
val add_overflow_vec_bit_signed  : list bitU -> bitU -> (list bitU * bitU * bitU)
val sub_overflow_vec_bit         : list bitU -> bitU -> (list bitU * bitU * bitU)
val sub_overflow_vec_bit_signed  : list bitU -> bitU -> (list bitU * bitU * bitU)
let add_overflow_vec_bit         = add_overflow_bv_bit
let add_overflow_vec_bit_signed  = add_overflow_bv_bit_signed
let sub_overflow_vec_bit         = sub_overflow_bv_bit
let sub_overflow_vec_bit_signed  = sub_overflow_bv_bit_signed

val shiftl       : list bitU -> integer -> list bitU
val shiftr       : list bitU -> integer -> list bitU
val arith_shiftr : list bitU -> integer -> list bitU
val rotl         : list bitU -> integer -> list bitU
val rotr         : list bitU -> integer -> list bitU
let shiftl       = shiftl_bv
let shiftr       = shiftr_bv
let arith_shiftr = arith_shiftr_bv
let rotl         = rotl_bv
let rotr         = rotr_bv

val mod_vec         : list bitU -> list bitU -> list bitU
val quot_vec        : list bitU -> list bitU -> list bitU
val quot_vec_signed : list bitU -> list bitU -> list bitU
let mod_vec         = mod_bv
let quot_vec        = quot_bv
let quot_vec_signed = quot_bv_signed

val mod_vec_int  : list bitU -> integer -> list bitU
val quot_vec_int : list bitU -> integer -> list bitU
let mod_vec_int  = mod_bv_int
let quot_vec_int = quot_bv_int

val replicate_bits : list bitU -> integer -> list bitU
let replicate_bits = replicate_bits_bv

val duplicate : bitU -> integer -> list bitU
let duplicate = duplicate_bit_bv

val eq_vec    : list bitU -> list bitU -> bool
val neq_vec   : list bitU -> list bitU -> bool
val ult_vec   : list bitU -> list bitU -> bool
val slt_vec   : list bitU -> list bitU -> bool
val ugt_vec   : list bitU -> list bitU -> bool
val sgt_vec   : list bitU -> list bitU -> bool
val ulteq_vec : list bitU -> list bitU -> bool
val slteq_vec : list bitU -> list bitU -> bool
val ugteq_vec : list bitU -> list bitU -> bool
val sgteq_vec : list bitU -> list bitU -> bool
let eq_vec    = eq_bv
let neq_vec   = neq_bv
let ult_vec   = ult_bv
let slt_vec   = slt_bv
let ugt_vec   = ugt_bv
let sgt_vec   = sgt_bv
let ulteq_vec = ulteq_bv
let slteq_vec = slteq_bv
let ugteq_vec = ugteq_bv
let sgteq_vec = sgteq_bv
*)
