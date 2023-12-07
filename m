Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079835271
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4XkqmRy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD90C433C9
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701943527;
	bh=cxB+BffghapeqSFBYGJpUOCeSldIqPuYcrN686e5Noo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d4XkqmRywazVEwM2NbXXB9v7T+xhuWzYUzR9mntJPv9Qpu4dAFCvTQ7T1w46+rpVr
	 SLOqADkqg/gdvt/PsLSJoWdAqsFoQRaoqRn7YsbvdgcKUGVn/sjD0A6c1vQSc/BfFt
	 xmE13+URYf/ROcxa+CqZ+DVLVWRdoFLfdYG320HNn9c9Ppejbvt02KdGbSMxSITZbq
	 7uzPvdUTQFFFNhYwz6dhw0XHfETir2q/N96F/u2kq+u4MnYVHGlmRfGkHXCRHN/lA4
	 UM7KX1l/zOH5z/qEl+Rtyzc1j/tpXCiI0xxURjS/LVzUxJuPFK8TJC+l9mHSOsdrxk
	 1DxcCJj5uR0mw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so983255a12.3
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 02:05:27 -0800 (PST)
X-Gm-Message-State: AOJu0Yz+88nhn6OC82sZeBvFL0n4LdV5c1qC1hn+pf89LoieahC1xGoJ
	xBnUBGacCGxyIAN30rKCtVR9vcs51qx2WfUm5mk=
X-Google-Smtp-Source: AGHT+IEF9D9+D58HpRrpSN1ifW07++ItOO3uH9Ge8nGLxmbT5V3SIY/YHeu1AhI27URVUijBTe7xguLi5TCmB6Rar50=
X-Received: by 2002:a17:906:e0c5:b0:a19:9b79:8b3e with SMTP id
 gl5-20020a170906e0c500b00a199b798b3emr920807ejb.79.1701943525760; Thu, 07 Dec
 2023 02:05:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231206073834.9707-1-hengqi.chen@gmail.com>
In-Reply-To: <20231206073834.9707-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 7 Dec 2023 18:05:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4CU8grnyLwW=gwNR8kUouOcubtNP-quQv=ChYM0bidNQ@mail.gmail.com>
Message-ID: <CAAhV-H4CU8grnyLwW=gwNR8kUouOcubtNP-quQv=ChYM0bidNQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] LoongArch: BPF: Remove fatal signed-extension instructions
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, yangtiezhu@loongson.cn, hejinyang@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi and Tiezhu,

I applied both of your fixes, but ldsx_insn/ctx_member_sign_ext still
fails. However it passes in Hengqi's original commit message.

./test_progs -t ldsx_insn

test_map_val_and_probed_memory:PASS:test_ldsx_insn__open 0 nsec
test_map_val_and_probed_memory:PASS:test_ldsx_insn__load 0 nsec
libbpf: prog 'test_ptr_struct_arg': failed to attach: ERROR: strerror_r(-52=
4)=3D22
libbpf: prog 'test_ptr_struct_arg': failed to auto-attach: -524
test_map_val_and_probed_memory:FAIL:test_ldsx_insn__attach unexpected
error: -524 (errno 524)
#117/1   ldsx_insn/map_val and probed_memory:FAIL
(cgroup_helpers.c:97: errno: Invalid argument) Enabling controller
cpu: /mnt/cgroup.subtree_control
#117 ldsx_insn: Failed to setup cgroup environment
test_ctx_member_sign_ext:FAIL:join_cgroup /ldsx_test unexpected
join_cgroup /ldsx_test: actual -1 < expected 0
#117/2   ldsx_insn/ctx_member_sign_ext:FAIL
#117/3   ldsx_insn/ctx_member_narrow_sign_ext:OK
#117     ldsx_insn:FAIL

All error logs:
test_map_val_and_probed_memory:PASS:test_ldsx_insn__open 0 nsec
test_map_val_and_probed_memory:PASS:test_ldsx_insn__load 0 nsec
libbpf: prog 'test_ptr_struct_arg': failed to attach: ERROR: strerror_r(-52=
4)=3D22
libbpf: prog 'test_ptr_struct_arg': failed to auto-attach: -524
test_map_val_and_probed_memory:FAIL:test_ldsx_insn__attach unexpected
error: -524 (errno 524)
#117/1   ldsx_insn/map_val and probed_memory:FAIL
(cgroup_helpers.c:97: errno: Invalid argument) Enabling controller
cpu: /mnt/cgroup.subtree_control
#117 ldsx_insn: Failed to setup cgroup environment
test_ctx_member_sign_ext:FAIL:join_cgroup /ldsx_test unexpected
join_cgroup /ldsx_test: actual -1 < expected 0
#117/2   ldsx_insn/ctx_member_sign_ext:FAIL
#117     ldsx_insn:FAIL
Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED


Huacai

On Thu, Dec 7, 2023 at 1:53=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> As reported on mailing list ([0]), several BPF testcases could
> triggered kernel panics like:
>
>   # ./test_progs -t cls_redirect
>   Can't find bpf_testmod.ko kernel module: -2
>   WARNING! Selftests relying on bpf_testmod.ko will be skipped.
>   [   30.938489] CPU 3 Unable to handle kernel paging request at virtual =
address fffffffffd814de0, era =3D=3D ffff800002009fb8, ra =3D=3D ffff800002=
009f9c
>   [   30.939331] Oops[#1]:
>   [   30.939513] CPU: 3 PID: 1260 Comm: test_progs Not tainted 6.7.0-rc2-=
loong-devel-g2f56bb0d2327 #35 a896aca3f4164f09cc346f89f2e09832e07be5f6
>   [   30.939732] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2=
/2/2022
>   [   30.939901] pc ffff800002009fb8 ra ffff800002009f9c tp 9000000104da4=
000 sp 9000000104da7ab0
>   [   30.940038] a0 fffffffffd814de0 a1 9000000104da7a68 a2 0000000000000=
000 a3 9000000104da7c10
>   [   30.940183] a4 9000000104da7c14 a5 0000000000000002 a6 0000000000000=
021 a7 00005555904d7f90
>   [   30.940321] t0 0000000000000110 t1 0000000000000000 t2 fffffffffd814=
de0 t3 0004c4b400000000
>   [   30.940456] t4 ffffffffffffffff t5 00000000c3f63600 t6 0000000000000=
000 t7 0000000000000000
>   [   30.940590] t8 000000000006d803 u0 0000000000000020 s9 9000000104da7=
b10 s0 900000010504c200
>   [   30.940727] s1 fffffffffd814de0 s2 900000010504c200 s3 9000000104da7=
c10 s4 9000000104da7ad0
>   [   30.940866] s5 0000000000000000 s6 90000000030e65bc s7 9000000104da7=
b44 s8 90000000044f6fc0
>   [   30.941015]    ra: ffff800002009f9c bpf_prog_846803e5ae81417f_cls_re=
direct+0xa0/0x590
>   [   30.941535]   ERA: ffff800002009fb8 bpf_prog_846803e5ae81417f_cls_re=
direct+0xbc/0x590
>   [   30.941696]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -W=
E)
>   [   30.942224]  PRMD: 00000004 (PPLV0 +PIE -PWE)
>   [   30.942330]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
>   [   30.942453]  ECFG: 00071c1c (LIE=3D2-4,10-12 VS=3D7)
>   [   30.942612] ESTAT: 00010000 [PIL] (IS=3D ECode=3D1 EsubCode=3D0)
>   [   30.942764]  BADV: fffffffffd814de0
>   [   30.942854]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
>   [   30.942974] Modules linked in:
>   [   30.943078] Process test_progs (pid: 1260, threadinfo=3D00000000ce30=
3226, task=3D000000007d10bb76)
>   [   30.943306] Stack : 900000010a064000 90000000044f6fc0 9000000104da7b=
48 0000000000000000
>   [   30.943495]         0000000000000000 9000000104da7c14 9000000104da7c=
10 900000010504c200
>   [   30.943626]         0000000000000001 ffff80001b88c000 9000000104da7b=
70 90000000030e6668
>   [   30.943785]         0000000000000000 9000000104da7b58 ffff80001b88c0=
48 9000000003d05000
>   [   30.943936]         900000000303ac88 0000000000000000 00000000000000=
00 9000000104da7b70
>   [   30.944091]         0000000000000000 0000000000000001 0000000731eeab=
00 0000000000000000
>   [   30.944245]         ffff80001b88c000 0000000000000000 00000000000000=
00 54b99959429f83b8
>   [   30.944402]         ffff80001b88c000 90000000044f6fc0 9000000101d700=
00 ffff80001b88c000
>   [   30.944538]         000000000000005a 900000010504c200 900000010a0640=
00 900000010a067000
>   [   30.944697]         9000000104da7d88 0000000000000000 9000000003d050=
00 90000000030e794c
>   [   30.944852]         ...
>   [   30.944924] Call Trace:
>   [   30.945120] [<ffff800002009fb8>] bpf_prog_846803e5ae81417f_cls_redir=
ect+0xbc/0x590
>   [   30.945650] [<90000000030e6668>] bpf_test_run+0x1ec/0x2f8
>   [   30.945958] [<90000000030e794c>] bpf_prog_test_run_skb+0x31c/0x684
>   [   30.946065] [<90000000026d4f68>] __sys_bpf+0x678/0x2724
>   [   30.946159] [<90000000026d7288>] sys_bpf+0x20/0x2c
>   [   30.946253] [<90000000032dd224>] do_syscall+0x7c/0x94
>   [   30.946343] [<9000000002541c5c>] handle_syscall+0xbc/0x158
>   [   30.946492]
>   [   30.946549] Code: 0015030e  5c0009c0  5001d000 <28c00304> 02c00484  =
29c00304  00150009  2a42d2e4  0280200d
>   [   30.946793]
>   [   30.946971] ---[ end trace 0000000000000000 ]---
>   [   32.093225] Kernel panic - not syncing: Fatal exception in interrupt
>   [   32.093526] Kernel relocated by 0x2320000
>   [   32.093630]  .text @ 0x9000000002520000
>   [   32.093725]  .data @ 0x9000000003400000
>   [   32.093792]  .bss  @ 0x9000000004413200
>   [   34.971998] ---[ end Kernel panic - not syncing: Fatal exception in =
interrupt ]---
>
> Tracking this down reveals two different code paths lead to
> these panics.
>
> 1. Signed extend function return value
>
>   Take the `cls_redirect` test as an example, when subprog mode
>   is enabled, we have:
>
>     cls_redirect()
>       -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480
>
>   The pointer is later signed-extended to 0xfffffffffc00b480 at
>   `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
>   page fault and a kernel panic.
>
>   The `verifier_map_ptr_mixing` test is another victim of this
>   signed-extension.
>
>   BPF verifier ensures all BPF progs loaded run to completion, so
>   every BPF prog has at least one `exit` instruction. Why do most of
>   them survive this signed-extension? That's because most BPF prog
>   types (if not all) return small non-negative integers, like TC or XDP.
>   Some prog types (like tracing) even ignore the return value.
>   In the above cases, we use subprogs, and subprogs return pointer
>   values, so bad things happened.
>
> 2. Signed extend memory load operand
>
>   The `cgrp_local_storage` test triggers panics when doing memory
>   load (see `cgrp_ls_tp_btf.c` for details):
>
>     ptr =3D bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
>                                BPF_LOCAL_STORAGE_GET_F_CREATE);
>
>   The expression `task->cgroups->dfl_cgrp` involves two memory load.
>   Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
>   to perform memory load. But the ldd and ldptrd instructions both
>   have the side effect that it will signed-extended the imm operand.
>   Finally, we got the wrong addresses and result in kernel panics.
>
> Let's get rid of those fatal signed-extension instrutions to fix
> these issues.
>   - For the first case, don't sext on return values like other arches.
>   - For the second case, we fallback to use a generic ldxd instruction.
>
>   [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8=
NM6eKkdvdojJqB9P7eQ@mail.gmail.com/
>
> Hengqi Chen (2):
>   LoongArch: BPF: Don't sign extend function return value
>   LoongArch: BPF: Don't sign extend memory load operand
>
>  arch/loongarch/net/bpf_jit.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> --
> 2.34.1
