Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3658A356744
	for <loongarch@lists.linux.dev>; Sat, 13 Jun 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347396; cv=none; b=O8G8AyJjgVaFGbR1nNgX9ICFZiwhC1n54eTeXS3HVH61DuZoBf9fpMmZ3NQGDWGhh6RuaHW6KY/PaDkM8x4OV5UaDLwcUoNMKkxlpLkDOqyp6LttUlw6G2GqQRU5tZ2ZtycUd7Q35X6/eQVr80sd3DdUYP64EhCjZIstajUxNjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347396; c=relaxed/simple;
	bh=rAtTcB0MnhWFnXrrXDcRimh5U6LPqiZuvNbFjApE0q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isBNEZv6KD3Xwnc35Z5cotHdmcQTeoDCX1ktBz5K6Bh77G85aCO+zc/FQ4VDQzoQhEnD5TcHdHz9RPPbx6tkYRIp2VCSUhHilpBxH9O9zY/6jCpp+EbFB0V+Ah6m9tfUSOKg/dwCRvSO6EVZkAR/ndOYuDtLD56hygUAW0JEt5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgpsUXnF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgpsUXnF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4E31F00AC4
	for <loongarch@lists.linux.dev>; Sat, 13 Jun 2026 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781347393;
	bh=OzyH1HZuCSfQvEvWC+D+F9y8hGpVb8Qi5Mg1qdpE3x4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IgpsUXnFRWmsQwMc0eD0JZ9ww0xwx3yDRgoJ/WnuSrWJMskXpe9b7iREwCsgg2rnr
	 YnhTKz1VzwDcwooTOOwmXFRhnHZh7XVJ6tE/HSeaTLDTChEHvbrUc4ImZOynq8PVeD
	 Awsxr3bQyqB6yNjqIjLkA7K8pAvPUOGe/Zf/rATCSuHP21iD+iGeiVyJGtngpqXEhK
	 ab09BohObjkOrQO4SPtIU9dAP/yBfvmFHjM4WoqpI6g6vnR9Z4HIZQvswzmF15l9VP
	 ZfKvTv3R0+jFUOyGUmqRZFbKX7KHTkj9zYpUQD4nRmp5Mj65Ry5Y2jDxgboQ9isRQw
	 6Q80tO/zX+tsA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6912f4acca4so3132334a12.1
        for <loongarch@lists.linux.dev>; Sat, 13 Jun 2026 03:43:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YyjrBpmRgRuC1rqMS+uxkN6mH+aHM+9faEjCgRWVo7coT8iCka2
	J4x3E1/E0QAI4hB7FOtSGHqvOW1QrScvRfqcwyrvZ29oF8YGyLVvcD0Ed4bqagth0UwlCFwb3Xl
	sxun8/dd8Tm6P3LzAWcZBiU8nH3AzUMw=
X-Received: by 2002:a05:6402:27d4:b0:68a:5107:4f6f with SMTP id
 4fb4d7f45d1cf-693c6a38833mr1111331a12.12.1781347392343; Sat, 13 Jun 2026
 03:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613084147.449502-1-haoran.jiang@linux.dev>
In-Reply-To: <20260613084147.449502-1-haoran.jiang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 13 Jun 2026 18:43:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5tzMMopjvgLU0wzB8B6hO9QrbkxavD=0e6Sn4Oi4q3vQ@mail.gmail.com>
X-Gm-Features: AVVi8CeHWiYD4MNasQQrpvl3WQg1sCtyq1vOQxIKnY4tQ9H2V1FsVwMwGOjPFxI
Message-ID: <CAAhV-H5tzMMopjvgLU0wzB8B6hO9QrbkxavD=0e6Sn4Oi4q3vQ@mail.gmail.com>
Subject: Re: [PATCH v4] LoongArch: Enable STRICT_MODULE_RWX for stricter
 modules memory permissions
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	akpm@linux-foundation.org, jbohac@suse.cz, kees@kernel.org, 
	yangtiezhu@loongson.cn, Haoran Jiang <jianghaoran@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Haoran,

On Sat, Jun 13, 2026 at 4:42=E2=80=AFPM <haoran.jiang@linux.dev> wrote:
>
> From: Haoran Jiang <jianghaoran@kylinos.cn>
>
> Enable STRICT_MODULE_RWX to enforce strict memory permissions
> on modules,making the code region non-writable, the data region
> non-executable, and the read-only data region both non-writable
> and non-executable.Temporarily modify code section read/write
> permissions via set_memory() API.
>
> Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> ---
> v2:
> Change the method of modifying page table permissions from patch_map to s=
et_memory() API.
>
> v3:
> Modify commit description.
>
> v4:
> Add text_mutex lock in the larch_insn_write call path and
> CONFIG_STRICT_MODULE_RWX is enabled by default.
>
> UB test on the 3C6000 server shows no significant performance impact.
>
> Before patch:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    BYTE UNIX Benchmarks (Version 5.1.6)
>
>    System: localhost.localdomain: GNU/Linux
>    OS: GNU/Linux -- 7.1.0-rc6 -- #1 SMP PREEMPT Wed Jun 10 21:07:41 CST 2=
026
>    Machine: loongarch64 (loongarch64)
>    Language: en_US.utf8 (charmap=3D"UTF-8", collate=3D"UTF-8")
>    21:19:51 up 1 min,  2 users,  load average: 0.71, 0.38, 0.14; runlevel=
 2026-06-10
>
> ------------------------------------------------------------------------
> 128 CPUs in system; running 1 parallel copy of tests
>
> Dhrystone 2 using register variables       35205725.4 lps   (10.0 s, 7 sa=
mples)
> Double-Precision Whetstone                     4244.9 MWIPS (10.0 s, 7 sa=
mples)
> Execl Throughput                               6717.7 lps   (30.0 s, 2 sa=
mples)
> File Copy 1024 bufsize 2000 maxblocks       1213873.8 KBps  (30.0 s, 2 sa=
mples)
> File Copy 256 bufsize 500 maxblocks          350740.5 KBps  (30.0 s, 2 sa=
mples)
> File Copy 4096 bufsize 8000 maxblocks       3275103.0 KBps  (30.0 s, 2 sa=
mples)
> Pipe Throughput                             1981993.9 lps   (10.0 s, 7 sa=
mples)
> Pipe-based Context Switching                  55287.7 lps   (10.0 s, 7 sa=
mples)
> Process Creation                               9056.8 lps   (30.0 s, 2 sa=
mples)
> Shell Scripts (1 concurrent)                   6736.5 lpm   (60.0 s, 2 sa=
mples)
> Shell Scripts (8 concurrent)                   2109.8 lpm   (60.0 s, 2 sa=
mples)
> System Call Overhead                        1549110.9 lps   (10.0 s, 7 sa=
mples)
>
> System Benchmarks Index Values               BASELINE       RESULT    IND=
EX
> Dhrystone 2 using register variables         116700.0   35205725.4   3016=
.8
> Double-Precision Whetstone                       55.0       4244.9    771=
.8
> Execl Throughput                                 43.0       6717.7   1562=
.3
> File Copy 1024 bufsize 2000 maxblocks          3960.0    1213873.8   3065=
.3
> File Copy 256 bufsize 500 maxblocks            1655.0     350740.5   2119=
.3
> File Copy 4096 bufsize 8000 maxblocks          5800.0    3275103.0   5646=
.7
> Pipe Throughput                               12440.0    1981993.9   1593=
.2
> Pipe-based Context Switching                   4000.0      55287.7    138=
.2
> Process Creation                                126.0       9056.8    718=
.8
> Shell Scripts (1 concurrent)                     42.4       6736.5   1588=
.8
> Shell Scripts (8 concurrent)                      6.0       2109.8   3516=
.4
> System Call Overhead                          15000.0    1549110.9   1032=
.7
>                                                                    =3D=3D=
=3D=3D=3D=3D=3D=3D
> System Benchmarks Index Score                                        1492=
.2
>
> ------------------------------------------------------------------------
> 128 CPUs in system; running 128 parallel copies of tests
>
> Dhrystone 2 using register variables     2901925470.7 lps   (10.0 s, 7 sa=
mples)
> Double-Precision Whetstone                   503614.9 MWIPS (10.1 s, 7 sa=
mples)
> Execl Throughput                              34080.1 lps   (29.9 s, 2 sa=
mples)
> File Copy 1024 bufsize 2000 maxblocks        309291.4 KBps  (30.0 s, 2 sa=
mples)
> File Copy 256 bufsize 500 maxblocks           75115.3 KBps  (30.0 s, 2 sa=
mples)
> File Copy 4096 bufsize 8000 maxblocks       1018101.3 KBps  (30.0 s, 2 sa=
mples)
> Pipe Throughput                           180702003.1 lps   (10.0 s, 7 sa=
mples)
> Pipe-based Context Switching                2426596.4 lps   (10.0 s, 7 sa=
mples)
> Process Creation                              37282.5 lps   (30.0 s, 2 sa=
mples)
> Shell Scripts (1 concurrent)                  50813.7 lpm   (60.1 s, 2 sa=
mples)
> Shell Scripts (8 concurrent)                   5835.8 lpm   (60.4 s, 2 sa=
mples)
> System Call Overhead                        9039181.1 lps   (10.0 s, 7 sa=
mples)
>
> System Benchmarks Index Values               BASELINE       RESULT    IND=
EX
> Dhrystone 2 using register variables         116700.0 2901925470.7 248665=
.4
> Double-Precision Whetstone                       55.0     503614.9  91566=
.3
> Execl Throughput                                 43.0      34080.1   7925=
.6
> File Copy 1024 bufsize 2000 maxblocks          3960.0     309291.4    781=
.0
> File Copy 256 bufsize 500 maxblocks            1655.0      75115.3    453=
.9
> File Copy 4096 bufsize 8000 maxblocks          5800.0    1018101.3   1755=
.3
> Pipe Throughput                               12440.0  180702003.1 145258=
.8
> Pipe-based Context Switching                   4000.0    2426596.4   6066=
.5
> Process Creation                                126.0      37282.5   2958=
.9
> Shell Scripts (1 concurrent)                     42.4      50813.7  11984=
.4
> Shell Scripts (8 concurrent)                      6.0       5835.8   9726=
.4
> System Call Overhead                          15000.0    9039181.1   6026=
.1
>                                                                    =3D=3D=
=3D=3D=3D=3D=3D=3D
> System Benchmarks Index Score                                        8765=
.2
>
>
> After patch:
>
> 128 CPUs in system; running 1 parallel copy of tests
>
> Dhrystone 2 using register variables       35438193.7 lps   (10.0 s, 7 sa=
mples)
> Double-Precision Whetstone                     4245.7 MWIPS (10.0 s, 7 sa=
mples)
> Execl Throughput                               5293.7 lps   (30.0 s, 2 sa=
mples)
> File Copy 1024 bufsize 2000 maxblocks       1233323.4 KBps  (30.0 s, 2 sa=
mples)
> File Copy 256 bufsize 500 maxblocks          355264.5 KBps  (30.0 s, 2 sa=
mples)
> File Copy 4096 bufsize 8000 maxblocks       3333631.6 KBps  (30.0 s, 2 sa=
mples)
> Pipe Throughput                             1979613.2 lps   (10.0 s, 7 sa=
mples)
> Pipe-based Context Switching                  55675.2 lps   (10.0 s, 7 sa=
mples)
> Process Creation                               8528.1 lps   (30.0 s, 2 sa=
mples)
> Shell Scripts (1 concurrent)                   6870.0 lpm   (60.0 s, 2 sa=
mples)
> Shell Scripts (8 concurrent)                   2115.5 lpm   (60.0 s, 2 sa=
mples)
> System Call Overhead                        1546959.4 lps   (10.0 s, 7 sa=
mples)
>
> System Benchmarks Index Values               BASELINE       RESULT    IND=
EX
> Dhrystone 2 using register variables         116700.0   35438193.7   3036=
.7
> Double-Precision Whetstone                       55.0       4245.7    772=
.0
> Execl Throughput                                 43.0       5293.7   1231=
.1
> File Copy 1024 bufsize 2000 maxblocks          3960.0    1233323.4   3114=
.5
> File Copy 256 bufsize 500 maxblocks            1655.0     355264.5   2146=
.6
> File Copy 4096 bufsize 8000 maxblocks          5800.0    3333631.6   5747=
.6
> Pipe Throughput                               12440.0    1979613.2   1591=
.3
> Pipe-based Context Switching                   4000.0      55675.2    139=
.2
> Process Creation                                126.0       8528.1    676=
.8
> Shell Scripts (1 concurrent)                     42.4       6870.0   1620=
.3
> Shell Scripts (8 concurrent)                      6.0       2115.5   3525=
.8
> System Call Overhead                          15000.0    1546959.4   1031=
.3
>                                                                    =3D=3D=
=3D=3D=3D=3D=3D=3D
> System Benchmarks Index Score                                        1465=
.3
>
> ------------------------------------------------------------------------
> 128 CPUs in system; running 128 parallel copies of tests
>
> Dhrystone 2 using register variables     2903340286.5 lps   (10.0 s, 7 sa=
mples)
> Double-Precision Whetstone                   504137.7 MWIPS (10.1 s, 7 sa=
mples)
> Execl Throughput                              34332.8 lps   (29.9 s, 2 sa=
mples)
> File Copy 1024 bufsize 2000 maxblocks        311391.2 KBps  (30.0 s, 2 sa=
mples)
> File Copy 256 bufsize 500 maxblocks           72503.3 KBps  (30.0 s, 2 sa=
mples)
> File Copy 4096 bufsize 8000 maxblocks       1000861.7 KBps  (30.0 s, 2 sa=
mples)
> Pipe Throughput                           179382076.6 lps   (10.0 s, 7 sa=
mples)
> Pipe-based Context Switching                2415716.6 lps   (10.0 s, 7 sa=
mples)
> Process Creation                              36873.1 lps   (30.0 s, 2 sa=
mples)
> Shell Scripts (1 concurrent)                  51464.1 lpm   (60.1 s, 2 sa=
mples)
> Shell Scripts (8 concurrent)                   5976.3 lpm   (60.4 s, 2 sa=
mples)
> System Call Overhead                        9182389.5 lps   (10.0 s, 7 sa=
mples)
>
> System Benchmarks Index Values               BASELINE       RESULT    IND=
EX
> Dhrystone 2 using register variables         116700.0 2903340286.5 248786=
.7
> Double-Precision Whetstone                       55.0     504137.7  91661=
.4
> Execl Throughput                                 43.0      34332.8   7984=
.4
> File Copy 1024 bufsize 2000 maxblocks          3960.0     311391.2    786=
.3
> File Copy 256 bufsize 500 maxblocks            1655.0      72503.3    438=
.1
> File Copy 4096 bufsize 8000 maxblocks          5800.0    1000861.7   1725=
.6
> Pipe Throughput                               12440.0  179382076.6 144197=
.8
> Pipe-based Context Switching                   4000.0    2415716.6   6039=
.3
> Process Creation                                126.0      36873.1   2926=
.4
> Shell Scripts (1 concurrent)                     42.4      51464.1  12137=
.8
> Shell Scripts (8 concurrent)                      6.0       5976.3   9960=
.6
> System Call Overhead                          15000.0    9182389.5   6121=
.6
>                                                                    =3D=3D=
=3D=3D=3D=3D=3D=3D
> System Benchmarks Index Score                                        8759=
.8
I think your tests are incomplete. Performance test is just a very
basic test, you should make sure all dynamic code modification
mechanisms are correct.

At least these should be verified one by one: jump label, kgdb, bpf,
ftrace, kprobes, uprobes....

You have modified ftrace, but not the best method that Ihae suggested in V3=
.

You completely ignore my suggestion about kprobes in V3.

For KGDB, you should use text_mutex to protect copy_to_kernel_nofault().

For uprobes, I have no idea, maybe @Tiezhu can give some suggestions.

Huacai

>
> ---
>  arch/loongarch/Kconfig             |  1 +
>  arch/loongarch/kernel/ftrace_dyn.c |  7 ++++++-
>  arch/loongarch/kernel/inst.c       | 25 +++++++++++++++++++++----
>  arch/loongarch/kernel/jump_label.c |  3 +++
>  4 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 606597da46b8..c751d714c287 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -27,6 +27,7 @@ config LOONGARCH
>         select ARCH_HAS_PTE_SPECIAL if 64BIT
>         select ARCH_HAS_SET_MEMORY
>         select ARCH_HAS_SET_DIRECT_MAP
> +       select ARCH_HAS_STRICT_MODULE_RWX
>         select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>         select ARCH_HAS_UBSAN
>         select ARCH_HAS_VDSO_ARCH_DATA
> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/f=
trace_dyn.c
> index d5d81d74034c..598dc6434cc4 100644
> --- a/arch/loongarch/kernel/ftrace_dyn.c
> +++ b/arch/loongarch/kernel/ftrace_dyn.c
> @@ -8,6 +8,7 @@
>  #include <linux/ftrace.h>
>  #include <linux/kprobes.h>
>  #include <linux/uaccess.h>
> +#include <linux/memory.h>
>
>  #include <asm/inst.h>
>  #include <asm/module.h>
> @@ -24,8 +25,12 @@ static int ftrace_modify_code(unsigned long pc, u32 ol=
d, u32 new, bool validate)
>                         return -EINVAL;
>         }
>
> -       if (larch_insn_patch_text((void *)pc, new))
> +       mutex_lock(&text_mutex);
> +       if (larch_insn_patch_text((void *)pc, new)) {
> +               mutex_unlock(&text_mutex);
>                 return -EPERM;
> +       }
> +       mutex_unlock(&text_mutex);
>
>         return 0;
>  }
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 0b9228b7c13a..3de94d465c3c 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -6,12 +6,11 @@
>  #include <linux/uaccess.h>
>  #include <linux/set_memory.h>
>  #include <linux/stop_machine.h>
> +#include <linux/memory.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/inst.h>
>
> -static DEFINE_RAW_SPINLOCK(patch_lock);
> -
>  void simu_pc(struct pt_regs *regs, union loongarch_instruction insn)
>  {
>         unsigned long pc =3D regs->csr_era;
> @@ -207,14 +206,32 @@ int larch_insn_read(void *addr, u32 *insnp)
>  int larch_insn_write(void *addr, u32 insn)
>  {
>         int ret;
> +       int err =3D 0;
> +       size_t start;
>         unsigned long flags =3D 0;
>
>         if ((unsigned long)addr & 3)
>                 return -EINVAL;
>
> -       raw_spin_lock_irqsave(&patch_lock, flags);
> +       start =3D round_down((size_t)addr, PAGE_SIZE);
> +
> +       lockdep_assert_held(&text_mutex);
> +
> +       err =3D set_memory_rw(start, 1);
> +       if (err) {
> +               pr_info("%s: set_memory_rw() failed\n", __func__);
> +               return err;
> +       }
> +
> +       local_irq_save(flags);
>         ret =3D copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
> -       raw_spin_unlock_irqrestore(&patch_lock, flags);
> +       local_irq_restore(flags);
> +
> +       err =3D set_memory_rox(start, 1);
> +       if (err) {
> +               pr_info("%s: set_memory_rox() failed\n", __func__);
> +               return err;
> +       }
>
>         return ret;
>  }
> diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/j=
ump_label.c
> index 24a3f4d8540c..e6bb040fe4c5 100644
> --- a/arch/loongarch/kernel/jump_label.c
> +++ b/arch/loongarch/kernel/jump_label.c
> @@ -6,6 +6,7 @@
>   */
>  #include <linux/kernel.h>
>  #include <linux/jump_label.h>
> +#include <linux/memory.h>
>  #include <asm/cacheflush.h>
>  #include <asm/inst.h>
>
> @@ -19,7 +20,9 @@ bool arch_jump_label_transform_queue(struct jump_entry =
*entry, enum jump_label_t
>         else
>                 insn =3D larch_insn_gen_nop();
>
> +       mutex_lock(&text_mutex);
>         larch_insn_write(addr, insn);
> +       mutex_unlock(&text_mutex);
>
>         return true;
>  }
> --
> 2.43.0
>
>
