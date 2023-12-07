Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2E3D0D4
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfWRy3/G"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1faecf57bedso672524fac.3
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 06:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701960587; x=1702565387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNg8MEiUnwatkBpt7vBIFl/U0UtdV4R9jX2GEvrnKr8=;
        b=nfWRy3/GitSrOUwX0t+nqOjArUwHAS0T1LEmpRPP92XCnInuWHZUrwmGbkFpT+1Bc4
         au6i/9udSADLAN2ePuFTivzVp8EGGTlfVJkFz2eeDFY//PnwU20eKed/Pv7hC5N0dqVf
         S0Mn90Sqpqwn67k/MOBnnB4tFQiGrPUFwjdZVoxjGyLK8kWl+alOnkhhC6F+A0ZqIbe+
         qJl4n8v5hP6535auYaKMhoTnqSYj6nBn4EhTjkrgOhtkZk1Yao6x0lWj5hPLFYu2cLVv
         Lst7ePM6Knh7+5CoMZWqRlhz9SzmGVcJVBiOBI/FaPfvWtAEJ+bu3xJOecw/j6O1qJOZ
         HS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701960587; x=1702565387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNg8MEiUnwatkBpt7vBIFl/U0UtdV4R9jX2GEvrnKr8=;
        b=ULBnvWiB/R+TIjVEbM6X1ZfvFbTq4po/GYK7SQLhTIauRjrPSCfdvmnM9RIaVOeItc
         oBKkJsZOMr9JWuHfSrAZQyGv/P8L9uo5jGv725ttExUgsgO6QL/9CGwhq7lLCXHVBxd9
         X/uAPp4lgM8bLn/0askYuuzi4nNp9Te36YoBzt7Unmc1lyrGHUmBmK32zFDSuTNsts1E
         Gg/xUH/Ngr8K7wv4Prm5yiO/E+lo7ozWuZbpI9dDtUEBiHVm6JkHHoOGtE4qwbu2hrwl
         oznPp+zCZN4sVMkYaE7FcemIoH6GG8mrcO6EGE/n149EjdQ192ogzFbrPX5icXnJPehu
         cCiQ==
X-Gm-Message-State: AOJu0YyS3oUvncD9X/tmlCfvgvDIdsPTLNI7H+H7uUbD3MpwW60GWv9X
	8PGkWLRDffVXN/WC923K9Fs+j+6CvOnX1KEC7VPoEYb1SUo=
X-Google-Smtp-Source: AGHT+IG5q8Fwfhsi5+5IM5q3+e9yyyTLFf9M8cxP0Yjc2Dtt8X3TlsH70OORjBGG1FH+7e2IUpNAT9yARTLKvv+tal8=
X-Received: by 2002:a05:6870:e2d6:b0:1fb:75a:de7c with SMTP id
 w22-20020a056870e2d600b001fb075ade7cmr3024115oad.106.1701960586769; Thu, 07
 Dec 2023 06:49:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231206073834.9707-1-hengqi.chen@gmail.com> <CAAhV-H4CU8grnyLwW=gwNR8kUouOcubtNP-quQv=ChYM0bidNQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4CU8grnyLwW=gwNR8kUouOcubtNP-quQv=ChYM0bidNQ@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 7 Dec 2023 22:49:35 +0800
Message-ID: <CAEyhmHTf4VFicFE77er1RbqR7kQ5GxwxLmy4v49Qj5qX2XKxVw@mail.gmail.com>
Subject: Re: [PATCH 0/2] LoongArch: BPF: Remove fatal signed-extension instructions
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, yangtiezhu@loongson.cn, hejinyang@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Huacai,

On Thu, Dec 7, 2023 at 6:05=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Hengqi and Tiezhu,
>
> I applied both of your fixes, but ldsx_insn/ctx_member_sign_ext still
> fails. However it passes in Hengqi's original commit message.
>
> ./test_progs -t ldsx_insn
>

Testing good on my side, no regression.

> test_map_val_and_probed_memory:PASS:test_ldsx_insn__open 0 nsec
> test_map_val_and_probed_memory:PASS:test_ldsx_insn__load 0 nsec
> libbpf: prog 'test_ptr_struct_arg': failed to attach: ERROR: strerror_r(-=
524)=3D22
> libbpf: prog 'test_ptr_struct_arg': failed to auto-attach: -524
> test_map_val_and_probed_memory:FAIL:test_ldsx_insn__attach unexpected
> error: -524 (errno 524)
> #117/1   ldsx_insn/map_val and probed_memory:FAIL
> (cgroup_helpers.c:97: errno: Invalid argument) Enabling controller
> cpu: /mnt/cgroup.subtree_control
> #117 ldsx_insn: Failed to setup cgroup environment
> test_ctx_member_sign_ext:FAIL:join_cgroup /ldsx_test unexpected
> join_cgroup /ldsx_test: actual -1 < expected 0

It seems like it's related to your cgroup setup.

> #117/2   ldsx_insn/ctx_member_sign_ext:FAIL
> #117/3   ldsx_insn/ctx_member_narrow_sign_ext:OK
> #117     ldsx_insn:FAIL
>
> All error logs:
> test_map_val_and_probed_memory:PASS:test_ldsx_insn__open 0 nsec
> test_map_val_and_probed_memory:PASS:test_ldsx_insn__load 0 nsec
> libbpf: prog 'test_ptr_struct_arg': failed to attach: ERROR: strerror_r(-=
524)=3D22
> libbpf: prog 'test_ptr_struct_arg': failed to auto-attach: -524
> test_map_val_and_probed_memory:FAIL:test_ldsx_insn__attach unexpected
> error: -524 (errno 524)
> #117/1   ldsx_insn/map_val and probed_memory:FAIL
> (cgroup_helpers.c:97: errno: Invalid argument) Enabling controller
> cpu: /mnt/cgroup.subtree_control
> #117 ldsx_insn: Failed to setup cgroup environment
> test_ctx_member_sign_ext:FAIL:join_cgroup /ldsx_test unexpected
> join_cgroup /ldsx_test: actual -1 < expected 0
> #117/2   ldsx_insn/ctx_member_sign_ext:FAIL
> #117     ldsx_insn:FAIL
> Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED
>
>
> Huacai
>
> On Thu, Dec 7, 2023 at 1:53=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > As reported on mailing list ([0]), several BPF testcases could
> > triggered kernel panics like:
> >
> >   # ./test_progs -t cls_redirect
> >   Can't find bpf_testmod.ko kernel module: -2
> >   WARNING! Selftests relying on bpf_testmod.ko will be skipped.
> >   [   30.938489] CPU 3 Unable to handle kernel paging request at virtua=
l address fffffffffd814de0, era =3D=3D ffff800002009fb8, ra =3D=3D ffff8000=
02009f9c
> >   [   30.939331] Oops[#1]:
> >   [   30.939513] CPU: 3 PID: 1260 Comm: test_progs Not tainted 6.7.0-rc=
2-loong-devel-g2f56bb0d2327 #35 a896aca3f4164f09cc346f89f2e09832e07be5f6
> >   [   30.939732] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown=
 2/2/2022
> >   [   30.939901] pc ffff800002009fb8 ra ffff800002009f9c tp 9000000104d=
a4000 sp 9000000104da7ab0
> >   [   30.940038] a0 fffffffffd814de0 a1 9000000104da7a68 a2 00000000000=
00000 a3 9000000104da7c10
> >   [   30.940183] a4 9000000104da7c14 a5 0000000000000002 a6 00000000000=
00021 a7 00005555904d7f90
> >   [   30.940321] t0 0000000000000110 t1 0000000000000000 t2 fffffffffd8=
14de0 t3 0004c4b400000000
> >   [   30.940456] t4 ffffffffffffffff t5 00000000c3f63600 t6 00000000000=
00000 t7 0000000000000000
> >   [   30.940590] t8 000000000006d803 u0 0000000000000020 s9 9000000104d=
a7b10 s0 900000010504c200
> >   [   30.940727] s1 fffffffffd814de0 s2 900000010504c200 s3 9000000104d=
a7c10 s4 9000000104da7ad0
> >   [   30.940866] s5 0000000000000000 s6 90000000030e65bc s7 9000000104d=
a7b44 s8 90000000044f6fc0
> >   [   30.941015]    ra: ffff800002009f9c bpf_prog_846803e5ae81417f_cls_=
redirect+0xa0/0x590
> >   [   30.941535]   ERA: ffff800002009fb8 bpf_prog_846803e5ae81417f_cls_=
redirect+0xbc/0x590
> >   [   30.941696]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC =
-WE)
> >   [   30.942224]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> >   [   30.942330]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
> >   [   30.942453]  ECFG: 00071c1c (LIE=3D2-4,10-12 VS=3D7)
> >   [   30.942612] ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
> >   [   30.942764]  BADV: fffffffffd814de0
> >   [   30.942854]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
> >   [   30.942974] Modules linked in:
> >   [   30.943078] Process test_progs (pid: 1260, threadinfo=3D00000000ce=
303226, task=3D000000007d10bb76)
> >   [   30.943306] Stack : 900000010a064000 90000000044f6fc0 9000000104da=
7b48 0000000000000000
> >   [   30.943495]         0000000000000000 9000000104da7c14 9000000104da=
7c10 900000010504c200
> >   [   30.943626]         0000000000000001 ffff80001b88c000 9000000104da=
7b70 90000000030e6668
> >   [   30.943785]         0000000000000000 9000000104da7b58 ffff80001b88=
c048 9000000003d05000
> >   [   30.943936]         900000000303ac88 0000000000000000 000000000000=
0000 9000000104da7b70
> >   [   30.944091]         0000000000000000 0000000000000001 0000000731ee=
ab00 0000000000000000
> >   [   30.944245]         ffff80001b88c000 0000000000000000 000000000000=
0000 54b99959429f83b8
> >   [   30.944402]         ffff80001b88c000 90000000044f6fc0 9000000101d7=
0000 ffff80001b88c000
> >   [   30.944538]         000000000000005a 900000010504c200 900000010a06=
4000 900000010a067000
> >   [   30.944697]         9000000104da7d88 0000000000000000 9000000003d0=
5000 90000000030e794c
> >   [   30.944852]         ...
> >   [   30.944924] Call Trace:
> >   [   30.945120] [<ffff800002009fb8>] bpf_prog_846803e5ae81417f_cls_red=
irect+0xbc/0x590
> >   [   30.945650] [<90000000030e6668>] bpf_test_run+0x1ec/0x2f8
> >   [   30.945958] [<90000000030e794c>] bpf_prog_test_run_skb+0x31c/0x684
> >   [   30.946065] [<90000000026d4f68>] __sys_bpf+0x678/0x2724
> >   [   30.946159] [<90000000026d7288>] sys_bpf+0x20/0x2c
> >   [   30.946253] [<90000000032dd224>] do_syscall+0x7c/0x94
> >   [   30.946343] [<9000000002541c5c>] handle_syscall+0xbc/0x158
> >   [   30.946492]
> >   [   30.946549] Code: 0015030e  5c0009c0  5001d000 <28c00304> 02c00484=
  29c00304  00150009  2a42d2e4  0280200d
> >   [   30.946793]
> >   [   30.946971] ---[ end trace 0000000000000000 ]---
> >   [   32.093225] Kernel panic - not syncing: Fatal exception in interru=
pt
> >   [   32.093526] Kernel relocated by 0x2320000
> >   [   32.093630]  .text @ 0x9000000002520000
> >   [   32.093725]  .data @ 0x9000000003400000
> >   [   32.093792]  .bss  @ 0x9000000004413200
> >   [   34.971998] ---[ end Kernel panic - not syncing: Fatal exception i=
n interrupt ]---
> >
> > Tracking this down reveals two different code paths lead to
> > these panics.
> >
> > 1. Signed extend function return value
> >
> >   Take the `cls_redirect` test as an example, when subprog mode
> >   is enabled, we have:
> >
> >     cls_redirect()
> >       -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480
> >
> >   The pointer is later signed-extended to 0xfffffffffc00b480 at
> >   `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
> >   page fault and a kernel panic.
> >
> >   The `verifier_map_ptr_mixing` test is another victim of this
> >   signed-extension.
> >
> >   BPF verifier ensures all BPF progs loaded run to completion, so
> >   every BPF prog has at least one `exit` instruction. Why do most of
> >   them survive this signed-extension? That's because most BPF prog
> >   types (if not all) return small non-negative integers, like TC or XDP=
.
> >   Some prog types (like tracing) even ignore the return value.
> >   In the above cases, we use subprogs, and subprogs return pointer
> >   values, so bad things happened.
> >
> > 2. Signed extend memory load operand
> >
> >   The `cgrp_local_storage` test triggers panics when doing memory
> >   load (see `cgrp_ls_tp_btf.c` for details):
> >
> >     ptr =3D bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
> >                                BPF_LOCAL_STORAGE_GET_F_CREATE);
> >
> >   The expression `task->cgroups->dfl_cgrp` involves two memory load.
> >   Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
> >   to perform memory load. But the ldd and ldptrd instructions both
> >   have the side effect that it will signed-extended the imm operand.
> >   Finally, we got the wrong addresses and result in kernel panics.
> >
> > Let's get rid of those fatal signed-extension instrutions to fix
> > these issues.
> >   - For the first case, don't sext on return values like other arches.
> >   - For the second case, we fallback to use a generic ldxd instruction.
> >
> >   [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqx=
y8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/
> >
> > Hengqi Chen (2):
> >   LoongArch: BPF: Don't sign extend function return value
> >   LoongArch: BPF: Don't sign extend memory load operand
> >
> >  arch/loongarch/net/bpf_jit.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > --
> > 2.34.1
