Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C6F3D994
	for <loongarch@lists.linux.dev>; Sun, 25 May 2025 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748138481; cv=none; b=Ois/808MurLenKPMPt7fuwpDFUXaSD5QzpBljpV6HMOTVEZWirJr2ykXsZDa1uPXnwjCr8qRXyGPv3K0igUNMJ4cPv48AkHbEiuYuqXxPkZNIGUYeFt1u8af7+cVpFxquUuipjBmU4/hl2fk6BPB0aeD2fieEABJ5/9Gbc3AIMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748138481; c=relaxed/simple;
	bh=7rvs12mLJDlM3GWwM2Rq4brGchZsoos8Bg4bzMkPmCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhbaztwR4lrJiyeyazyIYoV7wSHJDuzz+QK1MijhIDEt6zV+Mh877Ew2mL3wS2fPVL7y4XkVoBfZaJoztUZLRRs4GraTmCWPnjpTCP9BZVkmXL/bF8KDlk693cc8AF3Bpq8bEzcbzYeUq6ChqZYszzAOenmXtGioguEtJDjvqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.128.171])
	by gateway (Coremail) with SMTP id _____8BxrnLqeTJoSkn7AA--.12564S3;
	Sun, 25 May 2025 10:01:15 +0800 (CST)
Received: from mail-yw1-f171.google.com (unknown [209.85.128.171])
	by front1 (Coremail) with SMTP id qMiowMCxLcXneTJoO7_vAA--.23807S3;
	Sun, 25 May 2025 10:01:13 +0800 (CST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70df67e1b17so10169097b3.1
        for <loongarch@lists.linux.dev>; Sat, 24 May 2025 19:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4Oncc44flgbWGhl97sExnJssbeutIHul1H4UuZR8iVM++Q+DO+Ha2vukPywGlOvtRb45TNYrqhpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNdi4NnhBdyeoRZGCjTsSq3LvUZEHQFsJxcHGKjTrhMWlYIx1t
	ZmmW3CFkMy463a8rz/nu1bsYt06wdLIFTj9QWevGYH+6PIqZfSH/lFOAbUrF26Z+lNyJs0yilZF
	TLo+IAK5KThbfqFG8wU7HITk1ZPGYmmrQxcx3coULVQ==
X-Google-Smtp-Source: AGHT+IFv5c9saDgsFbSYywDEgL3x4s8ACvulKeQWBmYteGJbzNQCYknsD4r8LZ5YV3qVpHK2Duwg6rALQ/tdWGN/YfM=
X-Received: by 2002:a05:690c:640d:b0:70d:ed5d:b4cd with SMTP id
 00721157ae682-70e2d9eea50mr36944177b3.17.1748138471084; Sat, 24 May 2025
 19:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524142345.8045-1-chenhuacai@loongson.cn>
In-Reply-To: <20250524142345.8045-1-chenhuacai@loongson.cn>
From: WANG Rui <wangrui@loongson.cn>
Date: Sun, 25 May 2025 10:01:00 +0800
X-Gmail-Original-Message-ID: <CAHirt9hF8zZUh+mm=XQvPwG56r4RDuqvJ6WVGfKEEivfJSiZig@mail.gmail.com>
X-Gm-Features: AX0GCFvmpDiIQOqxTUT87VE8FTx4uYQMHv-wgHqVNf92Kl_jG2mFmQA_AV_N0do
Message-ID: <CAHirt9hF8zZUh+mm=XQvPwG56r4RDuqvJ6WVGfKEEivfJSiZig@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Avoid using $r0/$r1 as "mask" for csrxchg
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Yanteng Si <si.yanteng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qMiowMCxLcXneTJoO7_vAA--.23807S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF4UurW8ZF48Gr4xCr4xKrX_yoW5ArW8pF
	WDCr4kKFs5WFyxA39IgrnIv3WUWrWkGwsFvasrCrW7KFyDZw18ArZYkF98XFyUWanYvFyx
	ZFWYkw4fuF4DJabCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7BMNUUUUU

On Sat, May 24, 2025 at 10:24=E2=80=AFPM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> When building kernel with LLVM there are occasionally such errors:
>
> In file included from ./include/linux/spinlock.h:59:
> In file included from ./include/linux/irqflags.h:17:
> arch/loongarch/include/asm/irqflags.h:38:3: error: must not be $r0 or $r1
>    38 |                 "csrxchg %[val], %[mask], %[reg]\n\t"
>       |                 ^
> <inline asm>:1:16: note: instantiated into assembly here
>     1 |         csrxchg $a1, $ra, 0
>       |                       ^
>
>
> To prevent the compiler from allocating $r0 or $r1 for the "mask" of the
> csrxchg instruction, the 'q' constraint must be used but Clang < 22 does
> not support it. So force to use $t0 in the inline asm, in order to avoid
> using $r0/$r1 while keeping the backward compatibility.

Clang < 21

>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/pull/141037
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Suggested-by: WANG Rui <wangrui@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Update commit messages.
>
>  arch/loongarch/include/asm/irqflags.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/irqflags.h b/arch/loongarch/inclu=
de/asm/irqflags.h
> index 319a8c616f1f..003172b8406b 100644
> --- a/arch/loongarch/include/asm/irqflags.h
> +++ b/arch/loongarch/include/asm/irqflags.h
> @@ -14,40 +14,48 @@
>  static inline void arch_local_irq_enable(void)
>  {
>         u32 flags =3D CSR_CRMD_IE;
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>  }
>
>  static inline void arch_local_irq_disable(void)
>  {
>         u32 flags =3D 0;
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>  }
>
>  static inline unsigned long arch_local_irq_save(void)
>  {
>         u32 flags =3D 0;
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>         return flags;
>  }
>
>  static inline void arch_local_irq_restore(unsigned long flags)
>  {
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>  }
>
> --
> 2.47.1
>
>

