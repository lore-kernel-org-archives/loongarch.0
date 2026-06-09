Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9B2D0C7E
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994011; cv=none; b=cQ3SBYBo/Ae2l/j4hfbQU0mJZ6txruJ/4CBeAo6xXHzuG2IdYTdQBaVvrcsCOfOAE8CtzKwaWGUFDMSeUgEIMsrZLf11roO68v6odeV67X+vEhTiPxWk1Sf0walN6BioT13xDTBEsabzXg/sCAs2wyS3H/dnW4huS4DUWrAUtRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994011; c=relaxed/simple;
	bh=wCub3Q4/0Y9toIIxMJX8aWQG80n18IQYv8lOcwmJ7K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cs+B5uasWlUkztVH9zvQ3aWqB6k2JXB3ZzXsw4a62X5BZ3FBAvqk5/JwYEq9n8Jt84otpjCaqeJz1U2QunD+I/f1vFGVeD8rB5dZxXvTIaa1x2cLxiuq7DvlRiGxYZNHrYYUuDLhHk2HEOB/9uAmCV4MELY88YoOAgMLXgj0UWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oe07HhvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe07HhvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952511F0089C
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994010;
	bh=5AMTweReoH6Ia10BPk7JuwvmPDzk9rrKnNeIqbV2PIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oe07HhvLaEUyiFpLqKL3Nq7zOngD8Lz/R8dCnkQHtbGT67UjiN6vpMR5EK4RIFqXJ
	 aawWRG7J5EsL9s4vbFvKKvHRQicawQvqdarF1xuC/Xny24kfMZXghXrFtheddXmZJC
	 koZQMeU5g8pC/GDdMKjmFZ7JXGKd5dT/SJGvLtSGDGeLHI3XdZRg+HPIYlL17U46XZ
	 3Y+o9/S9dDCpn7PXdQq/ch3SJHfdgaHw1kHvDXuMpK/dmkUVSaBPfHV3bc+vg3Zrs0
	 32j6waYtenA6Vcunx4MDKbydCupNx1aul5NEHpWTWLWaqAu3j3I2UpnqbCcpisjPrC
	 +LSVbA5MkLy4g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so2480423a12.3
        for <loongarch@lists.linux.dev>; Tue, 09 Jun 2026 01:33:30 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz3cOnBmb2FPD+pMEvF5u3RLEmTvfZVzA0f2wiW2JOJbKysfb08
	vV7RNvl49nd9ZbW+jjv8nDqKWsbJb0+UfJGxkg9GAi30O4CPPZnNcKkjnra24PYRmvaDyIoAJ4B
	0fU/lzQjBBVvP37tKq2IW96xReT8g1og=
X-Received: by 2002:a05:6402:847:b0:68e:4c0:f5b1 with SMTP id
 4fb4d7f45d1cf-68fa4c00598mr8061702a12.2.1780994009118; Tue, 09 Jun 2026
 01:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608063857.291340-1-haoran.jiang@linux.dev>
In-Reply-To: <20260608063857.291340-1-haoran.jiang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Jun 2026 16:33:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H762twrT91Bxq64hLcbG9s78EO+cOdLhWQ3FbW+he36pg@mail.gmail.com>
X-Gm-Features: AVVi8Cf4Xv3at6QmOynxc5GJq2AOL9fEmYvDUWzjhAUStwaNgtIZtEIZ_D5niEE
Message-ID: <CAAhV-H762twrT91Bxq64hLcbG9s78EO+cOdLhWQ3FbW+he36pg@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: Enable STRICT_MODULE_RWX for stricter
 modules memory permissions
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	akpm@linux-foundation.org, jbohac@suse.cz, kees@kernel.org, 
	yangtiezhu@loongson.cn, Haoran Jiang <jianghaoran@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Haoran,

On Mon, Jun 8, 2026 at 2:39=E2=80=AFPM <haoran.jiang@linux.dev> wrote:
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
> ---
>  arch/loongarch/Kconfig       |  2 ++
>  arch/loongarch/kernel/inst.c | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 606597da46b8..40d748a13c50 100644
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
> @@ -197,6 +198,7 @@ config LOONGARCH
>         select NUMA_MEMBLKS if NUMA
>         select OF
>         select OF_EARLY_FLATTREE
> +       select ARCH_OPTIONAL_KERNEL_RWX
Have you compared the performance with and without STRICT_MODULE_RWX?
If no performance decreases, I suggest not select
ARCH_OPTIONAL_KERNEL_RWX, this will cause STRICT_MODULE_RWX to be set
always.

>         select PCI
>         select PCI_DOMAINS_GENERIC
>         select PCI_ECAM if ACPI
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 0b9228b7c13a..877890c77d0c 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -207,13 +207,31 @@ int larch_insn_read(void *addr, u32 *insnp)
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
> +       start =3D round_down((size_t)addr, PAGE_SIZE);
> +
>         raw_spin_lock_irqsave(&patch_lock, flags);
> +
> +       err =3D set_memory_rw(start, 1);
> +       if (err) {
> +               pr_info("%s: set_memory_rw() failed\n", __func__);
> +               return err;
> +       }
I don't know how you verified the function, but it is obvious this
should be out of spinlock and irq disabled.

Yes, move it out will cause concurrent problem, so we should use
mutex, and the final state of this function will be like this:

        err =3D set_memory_rw(start, 1);

        local_irq_save(flags);
        ret =3D copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
        local_irq_restore(flags);

        err =3D set_memory_rox(start, 1);

Then the callers should use text_mutex to protect.

For example:
1. For ftrace, define ftrace_arch_code_modify_prepare() and
ftrace_arch_code_modify_post_process() as RISC-V.

2. For jump labels, protect larch_insn_write() with
mutex_lock(&text_mutex) and mutex_unlock(&text_mutex).

3. For kprobes,integrate this patch, and then also protect
larch_insn_patch_text() with mutex_lock(&text_mutex) and
mutex_unlock(&text_mutex).

https://lore.kernel.org/loongarch/CAHirt9gSXZvw0wTv9zupsVRG0_ekza08efW0hwq_=
yvnU1WbUng@mail.gmail.com/T/#mf0aa514e1f0d0fc9a181fc5aa15b6be737083a29

In addition, it seems that text_mutex and patch_lock are for the same
purpose, so patch_lock can be removed here.

@Tiezhu, what's your opinion?


Huacai

> +
>         ret =3D copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
> +
> +       err =3D set_memory_rox(start, 1);
> +       if (err) {
> +               pr_info("%s: set_memory_rox() failed\n", __func__);
> +               return err;
> +       }
> +
>         raw_spin_unlock_irqrestore(&patch_lock, flags);
>
>         return ret;
> --
> 2.25.1
>
