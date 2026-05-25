Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1777533F585
	for <loongarch@lists.linux.dev>; Mon, 25 May 2026 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704075; cv=none; b=Lw6lLHEB5BoA/dXC/Goiw52Z2PjJyY4AhtWQEW6sJKx/bKYJ7/rL9mlX2WpcVNUfGslvOql2KuwzTHKx2gfbzfITp9SUZ2MCT3ayODDdky1ZnzLRhjBrUAS5pWfROymgrd1MnV+HyJZpHcYp/8alDocSiFjArQ1UwxrNcKrvxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704075; c=relaxed/simple;
	bh=9Shut4LwPg9RzL3C6q88DWP2Od0SPEgIQJhuLRUCubA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMu5Lo/gNyrHHiDgTIaOmoz6MMh2n45hrcvGKR7dDNNsqg+CP9Sc2GGP6B45z0x4EGCgLRBoSn5Sx/F4t4dAKiz7+d7132ffI83J/nd1KX38hPxD9pGpeVvnhyJN6Br4hUfciYSVzHU+Py1v4S+CQ6mG3JvPoAFkzYhdigL3MyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7GoRV7j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7GoRV7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DA51F000E9
	for <loongarch@lists.linux.dev>; Mon, 25 May 2026 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704072;
	bh=dUAZrkQxlHQuaRMGZ2OHSU2/UxEYnmUpWIrg2lUbNJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f7GoRV7jpIxjpOPpS/9O17sPigb2Q1N4WZmu45qpNPKuYuQXuvte+NtLd+1mSmRq9
	 9nk6yGMarXDpfO6Z0T7r3lUpg1SsrEjz6qO32JzJNTKYEacOh18GfKczPGpzT1LrjY
	 GXi51kUKejpzyNKgULdXbThBnWQRg01eNvNY17jzhuj4WtpsGdqwCcvhflq5Qg32bo
	 KOosmqxZAR5/3N0483AzKj+14oo2jIorj+4POZVYsI+52EAENWUX404dZ0hEUw45v4
	 wv5vtDZ1kxfKfGCKqrhSHOGJ3KC59oH2EjnFS0XBIiX5LTyNxg5BSl6ivT1UWgx1g+
	 GEKFV66fPg1PA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd56d108454so1722251166b.2
        for <loongarch@lists.linux.dev>; Mon, 25 May 2026 03:14:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/9EISkWHYaOqPBxtSc3RIOzABufSfjoMvhwrHrMiwiA8Yz+ACpFG9FGgZ4mdjd5Jefqmd6S0Tx9AQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0LK0X+BP1+ybUix+8FViX9vzw27c+GZ68OhTml0STSemR0ezQ
	d6BCpm7RJVI5T0W5WPMp+GI4xKE+Q8Sp1P6hKrFFel92G8/MWzvHfPuFJMoIAJkwg7xaRj8fz0r
	/aGVHfQ9+MknYsmss/pNx81ByjTqSh+Q=
X-Received: by 2002:a17:907:3f13:b0:bc5:1329:a1c8 with SMTP id
 a640c23a62f3a-bdd25ce8c6bmr701925566b.31.1779704071168; Mon, 25 May 2026
 03:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
In-Reply-To: <20260525084932.934910-1-ruanjinjie@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 25 May 2026 18:14:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
X-Gm-Features: AVHnY4JdnTdCqWcFn0MbwORLZN7izpJL9xjUY_iGyTtHymhcSRhMVmbA2oKRU5I
Message-ID: <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA reservation
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, pmladek@suse.com, 
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, kees@kernel.org, 
	elver@google.com, kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org, 
	paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org, masahiroy@kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, james.morse@arm.com, leitao@debian.org, 
	sourabhjain@linux.ibm.com, yeoreum.yun@arm.com, coxu@redhat.com, 
	jbohac@suse.cz, ryan.roberts@arm.com, cfsworks@gmail.com, 
	tangyouling@kylinos.cn, ritesh.list@gmail.com, songshuaishuai@tinylab.org, 
	junhui.liu@pigmoral.tech, vishal.moola@gmail.com, kas@kernel.org, 
	debug@rivosinc.com, namcao@linutronix.de, liaoyuanhong@vivo.com, 
	fuqiang.wang@easystack.cn, seanjc@google.com, guoren@kernel.org, 
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, bgwin@google.com, 
	takahiro.akashi@linaro.org, lizhengyu3@huawei.com, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jinjie,

On Mon, May 25, 2026 at 4:50=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> The crash memory allocation, and the exclude of crashk_res, crashk_low_re=
s
> and crashk_cma memory are almost identical across different architectures=
,
> This patch set handle them in crash core in a general way, which eliminat=
e
> a lot of duplication code.
>
> And add support for crashkernel CMA reservation for arm64 and riscv.
>
> Also add support for arm64 crash hotplug.
>
> This patch set is rebased on v7.1-rc1.
>
> Basic second kernel boot test were performed on QEMU platforms for x86,
> ARM64 and RISC-V architectures with the following parameters:
>
>         "cma=3D256M crashkernel=3D4G crashkernel=3D64M,cma"
>
> For first kernel, there will be such log:
>
>         # dmesg | grep crash
>         [    0.000000] crashkernel low memory reserved: 0xe8000000 - 0xf0=
000000 (128 MB)
>         [    0.000000] crashkernel reserved: 0x000000023e600000 - 0x00000=
0033e600000 (4096 MB)
>         [    0.000000] crashkernel CMA reserved: 64 MB in 1 ranges
>
>         # dmesg | grep cma
>         [    0.000000] cma: Reserved 256 MiB at 0x00000000f0000000
>         [    0.000000] cma: Reserved 64 MiB at 0x0000000100000000
>
> For second kernel, there will be such log:
>
>         [    0.000000] OF: fdt: Looking for usable-memory-range property.=
..
>         [    0.000000] OF: fdt: cap_mem_regions[0]: base=3D0x000000023e60=
0000, size=3D0x0000000100000000
>         [    0.000000] OF: fdt: cap_mem_regions[1]: base=3D0x00000000e800=
0000, size=3D0x0000000008000000
>         [    0.000000] OF: fdt: cap_mem_regions[2]: base=3D0x000000010000=
0000, size=3D0x0000000004000000
>
> Changes in v14:
> - Fix image->elf_headers memory leak during retry loop for arm64 as Sashi=
ko
>   AI code review pointed out.
> - Solve the hotplug notifier arch_crash_handle_hotplug_event() AA
>   self-deadlock problem as Sashiko AI code review pointed out.
> - Fix the TOCTOU issue in prepare_elf_headers() by get_online_mems().
> - -ENOMEM -> -EAGAIN as Breno suggested.
> - Add support for arm64 crash hotplug.
> - Link to v13: https://lore.kernel.org/all/20260511030454.1730881-1-ruanj=
injie@huawei.com/
>
> Changes in v13:
> - Rebased on v7.1-rc1.
> - Update the commit message.
> - Add Reviewed-by.
> - Link to v12: https://lore.kernel.org/all/20260402072701.628293-1-ruanji=
njie@huawei.com/
>
> Changes in v12:
> - Remove the unused "nr_mem_ranges" for x86.
> - Add "Fix crashk_low_res not exclude bug" test log.
> - Provide a separate patch for each architecture for using
>   crash_prepare_headers(), which will make the review more convenient.
> - Add Reviewed-by and Tested-by.
> - Link to v11: https://lore.kernel.org/all/20260328074013.3589544-1-ruanj=
injie@huawei.com/
>
> Changes in v11:
> - Avoid silently drop crash memory if the crash kernel is built without
>   CONFIG_CMA.
> - Remove unnecessary "cmem->nr_ranges =3D 0" for arch_crash_populate_cmem=
()
>   as we use kvzalloc().
> - Provide a separate patch for each architecture to fix the existing
>   buffer overflow issue.
> - Add Acked-bys for arm64.
>
> Changes in v10:
> - Fix crashk_low_res not excluded bug in the existing
>   RISC-V code.
> - Fix an existing memory leak issue in the existing PowerPC code.
> - Fix the ordering issue of adding CMA ranges to
>   "linux,usable-memory-range".
> - Fix an existing concurrency issue. A Concurrent memory hotplug may occu=
r
>   between reading memblock and attempting to fill cmem during kexec_load(=
)
>   for almost all existing architectures.
> - Link to v9: https://lore.kernel.org/all/20260323072745.2481719-1-ruanji=
njie@huawei.com/
>
> Changes in v9:
> - Collect Reviewed-by and Acked-by, and prepare for Sashiko AI review.
> - Link to v8: https://lore.kernel.org/all/20260302035315.3892241-1-ruanji=
njie@huawei.com/
>
> Changes in v8:
> - Fix the build issues reported by kernel test robot and Sourabh.
> - Link to v7: https://lore.kernel.org/all/20260226130437.1867658-1-ruanji=
njie@huawei.com/
>
> Changes in v7:
> - Correct the inclusion of CMA-reserved ranges for kdump kernel in of/kex=
ec
>   for arm64 and riscv.
> - Add Acked-by.
> - Link to v6: https://lore.kernel.org/all/20260224085342.387996-1-ruanjin=
jie@huawei.com/
>
> Changes in v6:
> - Update the crash core exclude code as Mike suggested.
> - Rebased on v7.0-rc1.
> - Add acked-by.
> - Link to v5: https://lore.kernel.org/all/20260212101001.343158-1-ruanjin=
jie@huawei.com/
>
> Jinjie Ruan (16):
>   riscv: kexec_file: Fix crashk_low_res not exclude bug
>   powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()
>   arm64: kexec: Fix image->elf_headers memory leak during retry loop
>   x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
>   arm64: kexec_file: Fix potential buffer overflow in
>     prepare_elf_headers()
>   riscv: kexec_file: Fix potential buffer overflow in
>     prepare_elf_headers()
>   LoongArch: kexec: Fix potential buffer overflow in
>     prepare_elf_headers()
>   crash: Add crash_prepare_headers() to exclude crash kernel memory
>   arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
>   x86/kexec: Use crash_prepare_headers() helper to simplify code
>   riscv: kexec_file: Use crash_prepare_headers() helper to simplify code
>   LoongArch: kexec: Use crash_prepare_headers() helper to simplify code
>   crash: Use crash_exclude_core_ranges() on powerpc
>   arm64: kexec: Add support for crashkernel CMA reservation
>   riscv: kexec: Add support for crashkernel CMA reservation
>   arm64/crash: Add crash hotplug support
I have some bikesheedings about the subjects. Can we unify the prefix forma=
ts?
x86/kexec, arm64: kexec_file, riscv: kexec_file, LoongArch: kexec .....

Huacai

>
> Sourabh Jain (1):
>   powerpc/crash: sort crash memory ranges before preparing elfcorehdr
>
>  .../admin-guide/kernel-parameters.txt         |  16 +--
>  arch/arm64/Kconfig                            |   3 +
>  arch/arm64/include/asm/kexec.h                |  14 +-
>  arch/arm64/kernel/Makefile                    |   1 +
>  arch/arm64/kernel/crash.c                     | 125 ++++++++++++++++++
>  arch/arm64/kernel/kexec_image.c               |  22 ++-
>  arch/arm64/kernel/machine_kexec_file.c        |  78 ++++++-----
>  arch/arm64/mm/init.c                          |   5 +-
>  arch/loongarch/kernel/machine_kexec_file.c    |  43 +++---
>  arch/powerpc/include/asm/kexec_ranges.h       |   1 -
>  arch/powerpc/kexec/crash.c                    |   7 +-
>  arch/powerpc/kexec/ranges.c                   | 101 +-------------
>  arch/riscv/kernel/machine_kexec_file.c        |  42 +++---
>  arch/riscv/mm/init.c                          |   5 +-
>  arch/x86/kernel/crash.c                       |  92 ++-----------
>  drivers/of/fdt.c                              |   9 +-
>  drivers/of/kexec.c                            |   9 ++
>  include/linux/crash_core.h                    |  11 ++
>  include/linux/crash_reserve.h                 |   4 +-
>  kernel/crash_core.c                           | 102 +++++++++++++-
>  20 files changed, 392 insertions(+), 298 deletions(-)
>  create mode 100644 arch/arm64/kernel/crash.c
>
> --
> 2.34.1
>
