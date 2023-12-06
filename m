Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829A1103
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 05:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoAg/eIl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d098b87eeeso4827775ad.0
        for <loongarch@lists.linux.dev>; Wed, 06 Dec 2023 21:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701928411; x=1702533211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQNgFqjCFoK0CHMofG7Ew86sJ/5WJfiLYQkaT/2jAmY=;
        b=IoAg/eIl4pYYBJClTr9Kx8bHk+24CvzttezKkpXqXFgKTeIqMDW4aT7xvvLl3dVkF3
         O75ad6FC33urcdTE2z2QgzmSqhVUHFJF6OS8NQT5S+5EmNZPJd6xYI7qHH8MQRfBEgO1
         MUFG9c2ZVq9G3Ax9vkH0rjFri8DtJpxAazvsl5zAcSpdSWcLkl6BW+3Ujg4ZsKnTJ4X9
         v47hI8Nt7C9CO4BHWkKgsoalOGPmB3hAT+FwrfTW/efXjuJZ4Q+Yb2Yhau5L1sr/eSlB
         4dCiFFf/mVSoBu47SqdvA1izBp74jIP8a4Mmv+Z+OMKbXvDFe9W3Q85S12Pch9X+i/Es
         Q+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701928411; x=1702533211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQNgFqjCFoK0CHMofG7Ew86sJ/5WJfiLYQkaT/2jAmY=;
        b=l34iZ/hSu5RzvAf2KTyF9Ui+RnqmenqkEkV6Xzj/AmOmsQg2EAcq5QqHGfr8a0z4Vu
         VWodjaihGNuGIWJ/oh6fDswnTM84MyWdl3aBKNsGcGbtiutjYMJTElTadNy1G4h4wvjy
         ZnDqAffBS+2419hYqtDjaBaG3lR24r+YfJX29XMNKrjvZJVYtvDIN3qdN1i+WZ0PExR7
         S9eDMo0zFKFMvjh1fa+QxN91tN5SGWf9o4LvUd80Z+wHm3Rv9x2rD1JXEKyrAnG+EdWF
         rX0N5OvN+839+5IOwFAw+GuO2LACGBx4U4ltv7E8zy6EkzhMJw6i/1I8wqnUvYl7OILk
         ym6Q==
X-Gm-Message-State: AOJu0YyAiG2Kzwl2FkxX7H5p/YQq+Hdj4X56iaRxYKWnaVGWr/Zntr6J
	dlbKuC/be4l/eSf3cawkA0V11uSG8U94WA==
X-Google-Smtp-Source: AGHT+IGC1PoBCtbH8/3Q47tOKLDHF1mnmin3LkZjaeTIP3s36fqCFVzAilyBDnuDVuyKfxZol3wJ3Q==
X-Received: by 2002:a17:902:c944:b0:1d1:cb7a:a908 with SMTP id i4-20020a170902c94400b001d1cb7aa908mr2218554pla.60.1701928411376;
        Wed, 06 Dec 2023 21:53:31 -0800 (PST)
Received: from ubuntu.. ([43.132.98.107])
        by smtp.googlemail.com with ESMTPSA id p14-20020a170902780e00b001cfed5524easm438574pll.288.2023.12.06.21.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:53:30 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	hejinyang@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH 0/2] LoongArch: BPF: Remove fatal signed-extension instructions
Date: Wed,  6 Dec 2023 07:38:32 +0000
Message-Id: <20231206073834.9707-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported on mailing list ([0]), several BPF testcases could
triggered kernel panics like:

  # ./test_progs -t cls_redirect
  Can't find bpf_testmod.ko kernel module: -2
  WARNING! Selftests relying on bpf_testmod.ko will be skipped.
  [   30.938489] CPU 3 Unable to handle kernel paging request at virtual address fffffffffd814de0, era == ffff800002009fb8, ra == ffff800002009f9c
  [   30.939331] Oops[#1]:
  [   30.939513] CPU: 3 PID: 1260 Comm: test_progs Not tainted 6.7.0-rc2-loong-devel-g2f56bb0d2327 #35 a896aca3f4164f09cc346f89f2e09832e07be5f6
  [   30.939732] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
  [   30.939901] pc ffff800002009fb8 ra ffff800002009f9c tp 9000000104da4000 sp 9000000104da7ab0
  [   30.940038] a0 fffffffffd814de0 a1 9000000104da7a68 a2 0000000000000000 a3 9000000104da7c10
  [   30.940183] a4 9000000104da7c14 a5 0000000000000002 a6 0000000000000021 a7 00005555904d7f90
  [   30.940321] t0 0000000000000110 t1 0000000000000000 t2 fffffffffd814de0 t3 0004c4b400000000
  [   30.940456] t4 ffffffffffffffff t5 00000000c3f63600 t6 0000000000000000 t7 0000000000000000
  [   30.940590] t8 000000000006d803 u0 0000000000000020 s9 9000000104da7b10 s0 900000010504c200
  [   30.940727] s1 fffffffffd814de0 s2 900000010504c200 s3 9000000104da7c10 s4 9000000104da7ad0
  [   30.940866] s5 0000000000000000 s6 90000000030e65bc s7 9000000104da7b44 s8 90000000044f6fc0
  [   30.941015]    ra: ffff800002009f9c bpf_prog_846803e5ae81417f_cls_redirect+0xa0/0x590
  [   30.941535]   ERA: ffff800002009fb8 bpf_prog_846803e5ae81417f_cls_redirect+0xbc/0x590
  [   30.941696]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
  [   30.942224]  PRMD: 00000004 (PPLV0 +PIE -PWE)
  [   30.942330]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
  [   30.942453]  ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
  [   30.942612] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
  [   30.942764]  BADV: fffffffffd814de0
  [   30.942854]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
  [   30.942974] Modules linked in:
  [   30.943078] Process test_progs (pid: 1260, threadinfo=00000000ce303226, task=000000007d10bb76)
  [   30.943306] Stack : 900000010a064000 90000000044f6fc0 9000000104da7b48 0000000000000000
  [   30.943495]         0000000000000000 9000000104da7c14 9000000104da7c10 900000010504c200
  [   30.943626]         0000000000000001 ffff80001b88c000 9000000104da7b70 90000000030e6668
  [   30.943785]         0000000000000000 9000000104da7b58 ffff80001b88c048 9000000003d05000
  [   30.943936]         900000000303ac88 0000000000000000 0000000000000000 9000000104da7b70
  [   30.944091]         0000000000000000 0000000000000001 0000000731eeab00 0000000000000000
  [   30.944245]         ffff80001b88c000 0000000000000000 0000000000000000 54b99959429f83b8
  [   30.944402]         ffff80001b88c000 90000000044f6fc0 9000000101d70000 ffff80001b88c000
  [   30.944538]         000000000000005a 900000010504c200 900000010a064000 900000010a067000
  [   30.944697]         9000000104da7d88 0000000000000000 9000000003d05000 90000000030e794c
  [   30.944852]         ...
  [   30.944924] Call Trace:
  [   30.945120] [<ffff800002009fb8>] bpf_prog_846803e5ae81417f_cls_redirect+0xbc/0x590
  [   30.945650] [<90000000030e6668>] bpf_test_run+0x1ec/0x2f8
  [   30.945958] [<90000000030e794c>] bpf_prog_test_run_skb+0x31c/0x684
  [   30.946065] [<90000000026d4f68>] __sys_bpf+0x678/0x2724
  [   30.946159] [<90000000026d7288>] sys_bpf+0x20/0x2c
  [   30.946253] [<90000000032dd224>] do_syscall+0x7c/0x94
  [   30.946343] [<9000000002541c5c>] handle_syscall+0xbc/0x158
  [   30.946492]
  [   30.946549] Code: 0015030e  5c0009c0  5001d000 <28c00304> 02c00484  29c00304  00150009  2a42d2e4  0280200d
  [   30.946793]
  [   30.946971] ---[ end trace 0000000000000000 ]---
  [   32.093225] Kernel panic - not syncing: Fatal exception in interrupt
  [   32.093526] Kernel relocated by 0x2320000
  [   32.093630]  .text @ 0x9000000002520000
  [   32.093725]  .data @ 0x9000000003400000
  [   32.093792]  .bss  @ 0x9000000004413200
  [   34.971998] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Tracking this down reveals two different code paths lead to
these panics.

1. Signed extend function return value

  Take the `cls_redirect` test as an example, when subprog mode
  is enabled, we have:

    cls_redirect()
      -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480

  The pointer is later signed-extended to 0xfffffffffc00b480 at
  `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
  page fault and a kernel panic.

  The `verifier_map_ptr_mixing` test is another victim of this
  signed-extension.

  BPF verifier ensures all BPF progs loaded run to completion, so
  every BPF prog has at least one `exit` instruction. Why do most of
  them survive this signed-extension? That's because most BPF prog
  types (if not all) return small non-negative integers, like TC or XDP.
  Some prog types (like tracing) even ignore the return value.
  In the above cases, we use subprogs, and subprogs return pointer
  values, so bad things happened.

2. Signed extend memory load operand

  The `cgrp_local_storage` test triggers panics when doing memory
  load (see `cgrp_ls_tp_btf.c` for details):

    ptr = bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
                               BPF_LOCAL_STORAGE_GET_F_CREATE);

  The expression `task->cgroups->dfl_cgrp` involves two memory load.
  Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
  to perform memory load. But the ldd and ldptrd instructions both
  have the side effect that it will signed-extended the imm operand.
  Finally, we got the wrong addresses and result in kernel panics.

Let's get rid of those fatal signed-extension instrutions to fix
these issues.
  - For the first case, don't sext on return values like other arches.
  - For the second case, we fallback to use a generic ldxd instruction.

  [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/

Hengqi Chen (2):
  LoongArch: BPF: Don't sign extend function return value
  LoongArch: BPF: Don't sign extend memory load operand

 arch/loongarch/net/bpf_jit.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

--
2.34.1
