Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493295;
	b=JRpyebcsH57zNgph/ddW3TAiM5iXT44M7DvF9+Iusa8cnfvTVtzicPx63cy97nPmH6x8
	 9bssEIPbdK1ANTaVRnLmqKKGs6NEMUPBBjjetdcGg5KBh49nS24gWexpbERphU5k6bnSZ
	 A2Hyy7qnyoinR/3GLYlTxBRS2ae/HqLQ8dJpK63xCxTVhL4CexirHrH0/Pi+AgZt8Orko
	 sk+9jflwBMYEGZUuMXSclz78Kw0FWbk3RmoChW9lrCm3MDr5DF90fexlq++fbMNKo5eSd
	 BMzK9U4Z/wFhgXnEOAWavkDZZYg2m57xis3XNjSJGV0aW/c+gsNJ80YNvKcMS2v5lwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493295;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Zw24p/saADZ7syx7j8QqBGFYl8Xd5k3nVSaKsS8org=;
	b=dVEyiKOBK4plGg82818R3cTN0jVJAH4aCEYAjkVR2WwwumsEzmqdOjQxD14yFOR6qdeR
	 /NlbWYL/MortiLERor5oFFpwvQ0F9Pe83tuSSsmXq0SCC00XB9IbkKQbcY+7AskdjYSLw
	 rGllH3+I946ksSvyaZWMqi1l2aEilFSLdf3w1f+4ciWnAc3D8mGrmUu+2BRI4ZJku1koK
	 luUhFPL8SCsu4tjSGQtL+QoBVjL8rTP1qnXMOk6VrQ096w0qDH3E8b7VrHsp5Y03lG+IK
	 z2zqhfEKueM6RVSH+/w/APKtLxFAa7IR9jLkrMSjtVJk/hUAad0sumaQJJKEQNaE59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqJFDAox;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C041606A31C
	for <loongarch@lists.linux.dev>; Tue, 20 Oct 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqJFDAox
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55CB1F01573
	for <loongarch@lists.linux.dev>; Tue, 20 Oct 2026 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792493294;
	bh=9Zw24p/saADZ7syx7j8QqBGFYl8Xd5k3nVSaKsS8org=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dqJFDAoxRt1W8nDk4gwL8Z07sDdJKsQJt/PY8NoYEOY72CHEACr9xaijQNMaLPoYO
	 zLVAYvMU0u6r6M1V+bo2MC/IHypyOYCuExl/Di12ZywZqyyKbVeLI706FG6l7D3iJ4
	 PJgPO4Rjllw1WgsYRVkNleIFPzOzJDwRZg88KzT4GXQP+SLZFdXi/gPbwIcEsuZ/bi
	 pTc9VLLfbBN/bcdZFcwM0cMvvfNdu8rQ8wY0E7piXilmSy+8MGtlPEXhYHW1lBeYkI
	 9UuJ5nTtsvDNGkyBQgmQpOJe/kNJpsbg2SKNhb+aGz/z8/Tja0/+jBuCCuD6ynI6QE
	 zjG88N+4HH/6w==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so3056315a12.0
        for <loongarch@lists.linux.dev>; Tue, 20 Oct 2026 03:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxh8geUY24LLn0nUwRFh51quTv3J/JxjXWSNhAlYnv1tjWtuXFoJStjYt8v+uh4/XT5J/ayRv3zCr0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIoatd46mRa25px5PhiOPn/gYLq9zWLyRikgdRBUcRCEO1LrkuX
	+agGjVuCC4LbuyYn+QtA2NcMaiYxFZxB3Cqa0gk7wPhgTWDsbvXw5SafvOuooFLBpbqzJul6P7H
	5vAR9g/tEgSzvsD7g54seXgDOTQRf0aE=
X-Received: by 2002:a05:6402:518c:b0:6b3:c088:3646 with SMTP id
 4fb4d7f45d1cf-6b3c0883973mr5683359a12.19.1792493293238; Tue, 20 Oct 2026
 03:48:13 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016081006.26069-1-yangtiezhu@loongson.cn> <20261016081006.26069-2-yangtiezhu@loongson.cn>
In-Reply-To: <20261016081006.26069-2-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 20 Oct 2026 18:48:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H63qesMYvT-KyJFDJckZxdvKRr=++D=dMxtuvOZuO7TQw@mail.gmail.com>
X-Gm-Features: AclHuK8hXtMJqt-eUZHz9NQiocHWzQn_jEAdqjkfZ7FHF9J_UYI2Ikx9rQXlYgE
Message-ID: <CAAhV-H63qesMYvT-KyJFDJckZxdvKRr=++D=dMxtuvOZuO7TQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] LoongArch: Add CPUCFG2 DIV32 feature detection
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This one is applied, thanks.

Huacai

On Fri, Oct 16, 2026 at 4:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> The LoongArch Architecture Manual defines a hardware capability bit
> CPUCFG2_DIV32 (bit 26 of CPUCFG 0x2). When this bit is set to 1, it
> indicates that on 64-bit machines, the division and mod instructions
> (DIV.W[U] and MOD.W[U]) will ignore the upper 32 bits of the input
> registers and only compute based on the lower 32 bits.
>
> On certain CPU cores without this feature, these 32-bit instructions
> require both input operands to be properly sign-extended. Otherwise,
> the hardware execution results can be randomly meaningless values.
>
> Add CPU_FEATURE_DIV32 to detect and export this hardware capability
> via elf_hwcap and cpu_has_div32. This provides the infrastructure
> for subsystems like BPF JIT to safely choose either native 32-bit
> instructions or fallback instruction sequences based on the actual
> CPU hardware capabilities.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/cpu-features.h | 1 +
>  arch/loongarch/include/asm/cpu.h          | 2 ++
>  arch/loongarch/include/uapi/asm/hwcap.h   | 1 +
>  arch/loongarch/kernel/cpu-probe.c         | 4 ++++
>  arch/loongarch/kernel/proc.c              | 2 ++
>  5 files changed, 10 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/i=
nclude/asm/cpu-features.h
> index 62059c5551b9..3e7cf1987171 100644
> --- a/arch/loongarch/include/asm/cpu-features.h
> +++ b/arch/loongarch/include/asm/cpu-features.h
> @@ -69,5 +69,6 @@
>  #define cpu_has_msgint         cpu_opt(LOONGARCH_CPU_MSGINT)
>  #define cpu_has_avecint                cpu_opt(LOONGARCH_CPU_AVECINT)
>  #define cpu_has_redirectint    cpu_opt(LOONGARCH_CPU_REDIRECTINT)
> +#define cpu_has_div32          cpu_opt(LOONGARCH_CPU_DIV32)
>
>  #endif /* __ASM_CPU_FEATURES_H */
> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/as=
m/cpu.h
> index 91b96938861e..d1cf5dd5eceb 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -127,6 +127,7 @@ static inline char *id_to_core_name(unsigned int id)
>  #define CPU_FEATURE_MSGINT             31      /* CPU has MSG interrupt =
*/
>  #define CPU_FEATURE_AVECINT            32      /* CPU has AVEC interrupt=
 */
>  #define CPU_FEATURE_REDIRECTINT                33      /* CPU has interr=
upt remapping */
> +#define CPU_FEATURE_DIV32              34      /* CPU has DIV32 feature =
*/
>
>  #define LOONGARCH_CPU_CPUCFG           BIT_ULL(CPU_FEATURE_CPUCFG)
>  #define LOONGARCH_CPU_LAM              BIT_ULL(CPU_FEATURE_LAM)
> @@ -162,5 +163,6 @@ static inline char *id_to_core_name(unsigned int id)
>  #define LOONGARCH_CPU_MSGINT           BIT_ULL(CPU_FEATURE_MSGINT)
>  #define LOONGARCH_CPU_AVECINT          BIT_ULL(CPU_FEATURE_AVECINT)
>  #define LOONGARCH_CPU_REDIRECTINT      BIT_ULL(CPU_FEATURE_REDIRECTINT)
> +#define LOONGARCH_CPU_DIV32            BIT_ULL(CPU_FEATURE_DIV32)
>
>  #endif /* _ASM_CPU_H */
> diff --git a/arch/loongarch/include/uapi/asm/hwcap.h b/arch/loongarch/inc=
lude/uapi/asm/hwcap.h
> index 90e96113ba51..00bf93683c74 100644
> --- a/arch/loongarch/include/uapi/asm/hwcap.h
> +++ b/arch/loongarch/include/uapi/asm/hwcap.h
> @@ -20,5 +20,6 @@
>  #define HWCAP_LOONGARCH_LSPW           (1 << 14)
>  #define HWCAP_LOONGARCH_SCQ            (1 << 15)
>  #define HWCAP_LOONGARCH_LAM_BH         (1 << 16)
> +#define HWCAP_LOONGARCH_DIV32          (1 << 17)
>
>  #endif /* _UAPI_ASM_HWCAP_H */
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index 74d31f260dfd..c50fcba805f7 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -236,6 +236,10 @@ static void cpu_probe_common(struct cpuinfo_loongarc=
h *c)
>                 elf_hwcap |=3D HWCAP_LOONGARCH_LBT_MIPS;
>         }
>  #endif
> +       if (config & CPUCFG2_DIV32) {
> +               c->options |=3D LOONGARCH_CPU_DIV32;
> +               elf_hwcap |=3D HWCAP_LOONGARCH_DIV32;
> +       }
>
>         config =3D read_cpucfg(LOONGARCH_CPUCFG6);
>         if (config & CPUCFG6_PMP)
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index d4ce5b585453..c8d6f397de55 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -94,6 +94,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>                 seq_puts(m, " lbt_arm");
>         if (cpu_has_lbt_mips)
>                 seq_puts(m, " lbt_mips");
> +       if (cpu_has_div32)
> +               seq_puts(m, " div32");
>         seq_puts(m, "\n");
>
>         seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_wat=
ch));
> --
> 2.42.0
>
