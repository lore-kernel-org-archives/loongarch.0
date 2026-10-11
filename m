Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B30456DE6
	for <loongarch@lists.linux.dev>; Sun, 11 Oct 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728771; cv=none; b=CpCLv9g+hzJI1QZ9ztBYRYWbSW9CRN309JKDN60O0KKdShU712CHZc/W1TdyHrN/YJdd280lZ5cAb+p6s+kjTscZ1uC7joyEvBeKUjqk+mRIf4jvYK0Qcc5EzZVGz8Mi1r/ZdVlJuU0O3foN34Bz5OXeORblo1KS0ylQcSMqFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728771; c=relaxed/simple;
	bh=w7839LUsgvpbY0N5QMim52V6fEawWUEf5QqYl90ZBjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzRZ1RTFZ7/nuVHG/XgJ354TS6W4hCX41k9Mhd7b8iZyDUU9mLh55Md/NCiHhMRDAnX/O+RLfdv0gfAOiHEOZz19ejX+ijANy2GeOJLIg2NDmjnsagRvN0oHJcJAj5VGrJUiglqqsJG4ZyFL0inuwnjRn7WE2vbYaWPSnSYKG9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0N4LcL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0N4LcL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F621F008A5
	for <loongarch@lists.linux.dev>; Sun, 11 Oct 2026 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791728769;
	bh=+UhTe7v9a62PlALZJIz+/72zupM4/GB+WgMVaR+OrXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L0N4LcL3MKnHNhKObDTtX6lFimRyRheB/BfPx0CZpTlPRPZeB9U3ybqp6HP3Oxi2S
	 SB4GJ2UAqruQxqY+ER9SzdrLbpzl4KWERj6wU/YCZ3V9H0E4rngUEgv1d8zEPTr74w
	 3Z5qzz6X/KP+MkGH+WFEliyUg/7kjwV+cP+IbAeGuS7X69aFQeXVfSPlqxgkcr77a0
	 PlwNMGr+cbBZrR1XcsyRO61WRtde2E++vNj7JRIp6cDHA9Mm/97/bhWtlzRcd+sFv6
	 uTJQKUd6F6tXGIEiDCXAz08u9B2GOBrpkDHURN1ZB3M2KGEjMCwtI6ECDN+5QypjPf
	 L3YdvsEtm8Ubw==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso1643244a12.2
        for <loongarch@lists.linux.dev>; Sun, 11 Oct 2026 07:26:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGRoDJix0WL5GXFzgq0rEZRsjrjja0Mv2Cp1Y83wqD6F779NSUiYQ2FcnK59DhKolUg5Cq4fazkFE=@lists.linux.dev
X-Gm-Message-State: AFq9FYL60ggajvHzXpucZ6kGAshW3XUcF7Qevq/G/ostD6pokCPDLCGq
	9Otyi+odqMFHs6b5kQZnF7dcLHFmyCUicy+DESpkPYYCYgag7NpH+tQ9f7uAfpgqW0pzf7eLhRi
	tDa0RI2jnOoBcRe6s4Fh2MXUMWrE2/Nc=
X-Received: by 2002:a05:6402:50cd:b0:6af:7d49:728e with SMTP id
 4fb4d7f45d1cf-6b17c24437amr6097984a12.16.1791728767596; Sun, 11 Oct 2026
 07:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924075655.375632-1-lianyangyang@kylinos.cn> <20261008023419.118623-1-lianyangyang@kylinos.cn>
In-Reply-To: <20261008023419.118623-1-lianyangyang@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 11 Oct 2026 22:25:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7-sRJ76282PVtwr66mLvEzhx+vaWvP5u5C++7zwVwwWw@mail.gmail.com>
X-Gm-Features: AclHuK_sFAFRkuAykbh-HP4qmaiZ_WqlFu5h1LjeuxXTvJ2ziMzxclLf_HVqQo8
Message-ID: <CAAhV-H7-sRJ76282PVtwr66mLvEzhx+vaWvP5u5C++7zwVwwWw@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: kdump: add arch_crash_save_vmcoreinfo() support
To: Yangyang Lian <lianyangyang@kylinos.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>, 
	WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Haoran Jiang <jianghaoran@kylinos.cn>, 
	Tao Cui <cuitao@kylinos.cn>, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Yangyang Lian <lianyangyang@kylinos=
.cn> wrote:
>
> Since commit 23c85094fe18 ("proc/kcore: add vmcoreinfo note to
> /proc/kcore") the kernel has exported the vmcoreinfo PT_NOTE on
> /proc/kcore as wellas /proc/vmcore.
>
> LoongArch does not provide arch_crash_save_vmcoreinfo(), so the
> arch-specific values are missing from the vmcoreinfo PT_NOTE. The
> generic exporter in kernel/vmcore_info.c already provides
> NUMBER(VMALLOC_START), but tools like crash cannot derive the module
> and vmemmap ranges, VA_BITS, or the KASLR offset of a LoongArch dump.
>
> Since commit 18210a104bb9 ("LoongArch: Expand module virtual address
> space to 2GB") the vmalloc and module boundaries are no longer stable
> across kernel versions either, so vmcoreinfo is the only reliable
> source for them.
>
> Provide this function in a separate file that is built at the same time
> as its caller in kernel/vmcore_info.c, and add a LOONGARCH64 section to
> Documentation/admin-guide/kdump/vmcoreinfo.rst.
>
> Reported-by: Haoran Jiang <jianghaoran@kylinos.cn>
> Suggested-by: Haoran Jiang <jianghaoran@kylinos.cn>
> Tested-by: Tao Cui <cuitao@kylinos.cn>
> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>
> ---
> V3 -> V2: Export PAGE_OFFSET, as suggested by Huacai Chen. It is not a
>           fixed value on LoongArch (PAGE_OFFSET =3D CACHE_BASE + PHYS_OFF=
SET)
>           and RISC-V already exports it.
Though Dave thought PAGE_OFFSET needn't be exported, I think export is
also OK (and the fact of fixed value may be changed in future). So I
applied V3 to loongarch-next.

Huacai

> V2 -> V1: Export VMEMMAP_END + 1 to make it an exclusive bound, matching
>           what tools like makedumpfile expect.
>           Add Tested-by tag from Tao Cui.
>
>  .../admin-guide/kdump/vmcoreinfo.rst          | 36 +++++++++++++++++++
>  arch/loongarch/kernel/Makefile                |  1 +
>  arch/loongarch/kernel/vmcore_info.c           | 22 ++++++++++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 arch/loongarch/kernel/vmcore_info.c
>
> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentati=
on/admin-guide/kdump/vmcoreinfo.rst
> index 7663c610fe90..dd1f1d6225b6 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> @@ -594,3 +594,39 @@ va_kernel_pa_offset
>
>  Indicates the offset between the kernel virtual and physical mappings.
>  Used to translate virtual to physical addresses.
> +
> +LOONGARCH64
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +VA_BITS
> +-------
> +
> +The maximum number of bits for virtual addresses. Used to compute the
> +virtual memory ranges.
> +
> +PHYS_OFFSET
> +-----------
> +
> +Indicates the physical address of the start of memory. Used to translate
> +virtual to physical addresses.
> +
> +PAGE_OFFSET
> +-----------
> +
> +Indicates the virtual kernel start address of the direct-mapped RAM regi=
on.
> +Used together with PHYS_OFFSET to translate between virtual and physical
> +addresses.
> +
> +KERNELOFFSET
> +------------
> +
> +The kernel randomization offset. Used to locate the kernel text in
> +virtual memory. If KASLR is disabled, this value is zero.
> +
> +MODULES_VADDR|MODULES_END|VMALLOC_START|VMALLOC_END|VMEMMAP_START|VMEMMA=
P_END
> +------------------------------------------------------------------------=
-----
> +
> +Used to get the correct ranges:
> +       MODULES_VADDR ~ MODULES_END-1 : Kernel module space.
> +       VMALLOC_START ~ VMALLOC_END-1 : vmalloc() / ioremap() space.
> +       VMEMMAP_START ~ VMEMMAP_END-1 : vmemmap region, used for struct p=
age array.
> diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makef=
ile
> index 001924877772..6260c15adaba 100644
> --- a/arch/loongarch/kernel/Makefile
> +++ b/arch/loongarch/kernel/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_RELOCATABLE)     +=3D relocate.o
>  obj-$(CONFIG_KEXEC_CORE)       +=3D machine_kexec.o relocate_kernel.o
>  obj-$(CONFIG_KEXEC_FILE)       +=3D machine_kexec_file.o kexec_efi.o kex=
ec_elf.o
>  obj-$(CONFIG_CRASH_DUMP)       +=3D crash_dump.o
> +obj-$(CONFIG_VMCORE_INFO)      +=3D vmcore_info.o
>
>  obj-$(CONFIG_UNWINDER_GUESS)   +=3D unwind_guess.o
>  obj-$(CONFIG_UNWINDER_PROLOGUE) +=3D unwind_prologue.o
> diff --git a/arch/loongarch/kernel/vmcore_info.c b/arch/loongarch/kernel/=
vmcore_info.c
> new file mode 100644
> index 000000000000..e4efc35165b1
> --- /dev/null
> +++ b/arch/loongarch/kernel/vmcore_info.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/vmcore_info.h>
> +#include <asm/addrspace.h>
> +#include <asm/pgtable.h>
> +#include <asm/setup.h>
> +
> +void arch_crash_save_vmcoreinfo(void)
> +{
> +       VMCOREINFO_NUMBER(VA_BITS);
> +       /* NUMBER(VMALLOC_START) is exported by the generic code */
> +       vmcoreinfo_append_str("NUMBER(VMALLOC_END)=3D0x%lx\n", VMALLOC_EN=
D);
> +#ifdef CONFIG_64BIT
> +       vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=3D0x%lx\n", MODULES_=
VADDR);
> +       vmcoreinfo_append_str("NUMBER(MODULES_END)=3D0x%lx\n", MODULES_EN=
D);
> +       vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=3D0x%lx\n", (unsigne=
d long)vmemmap);
> +       vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=3D0x%lx\n", VMEMMAP_EN=
D + 1);
> +#endif
> +       vmcoreinfo_append_str("NUMBER(PHYS_OFFSET)=3D0x%lx\n", PHYS_OFFSE=
T);
> +       vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=3D0x%lx\n", PAGE_OFFSE=
T);
> +       vmcoreinfo_append_str("KERNELOFFSET=3D%lx\n", kaslr_offset());
> +}
> --
> 2.25.1
>
