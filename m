Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9F5489FD8
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999517; cv=none; b=q5VNlLWaLvdyCE5WGyUDYXeh5t2bB9D1qiNACXVZzSE3efqXh7+NBIwFsswPLY9OYBZ7i8/gjEQaxaoNz7k5j9rZjOoBilMeZokGjJBFwCej2Hd2S0lnJUDF9MiAUUIYkZSxlbpxKxSAlQkkYMehBJ+gCinDKfiA+vmqX85vG/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999517; c=relaxed/simple;
	bh=1Ie1SevSPCIGABLDqoWONujVRMa2QMitJGtvOSpVubE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1UH5UKTb5IGb0fcTffotd/tkypQ6SD6PuBBbKwVzC8wJ74poWVzBo8Z1A7KzCeKNtMHaLHyH/LLlPEVjlwaSygFsIkZ4vOUaGoD0revrTpgtXLPHuZRmAWTTWfT7VbCZ/rvtzzZgWdDOMjAhW5Eba711iRBWMA/XgCSz/0hLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTmX4kHm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTmX4kHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA661F0089B
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999515;
	bh=QcxF0h96u3hg6AJaxWXr6Mk2WdgGgTpL71bsABI7cBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MTmX4kHmBGqbFVLWjaohhhyCNelBN6Xy5Puyz2vEo8ndhnmH7DTfLYgz6AMBiVY5r
	 2JoziZ8ILzNxCX0yclhvYT66jvBFLKw9C6ie9x/JZsPq4NNe1BXzZPJBdLGpVWuiDO
	 9YRvW7B8xtWDFkuD4kaXPXR3F6XWYydGlBdT/hXOWrw6YD7Ua1dIRq9ahRPWJij74C
	 NnbI66nUjCoqCVknBt85UBnkBN+SqokHYB6or32ZjScgfDuFd6u1QwIiQR+ThSm8S0
	 6bdPtKM5hOawwLuElMvS5pC6Q9AwPOhid+yiVtvS8fA4lHb2qOiaPlGCBja4faEwym
	 K1N0GhaM8cmPg==
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785686d2764so518721137.2
        for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 07:05:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIQES0seBSjhsuK+VSUG8JACtniyvIZNZK4EZve60WPtSZtewPArtUThQPyJpyVjEDXgJ45mxdT0M=@lists.linux.dev
X-Gm-Message-State: AFuF++nDQJN6iaz1UcQJxEsLfJHkITH1RKOy6wQIdkIc/s9U7E/iwq+j
	4qj9Su+FFnHbtfDwxtFJaHpr7stANmGLUIF1eJATSmNfzbJqKD8NnIQiz+ZP0mFZ0hJNVnxox4q
	jngHR2TOYvLHXbKCUbEsnGN48z8SSu7g=
X-Received: by 2002:a05:6102:6b01:b0:7a7:36ed:4b43 with SMTP id
 ada2fe7eead31-7a736ed4c13mr1983871137.25.1789999514551; Mon, 21 Sep 2026
 07:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906080316.3774-1-rong.bao@csmantle.top>
In-Reply-To: <20260906080316.3774-1-rong.bao@csmantle.top>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Sep 2026 22:04:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6gB2+NPgiLu409FOfkmDdyFmbwqtAHTdTgQUJ_zx0z1Q@mail.gmail.com>
X-Gm-Features: AcwNN1W4I8_1DwbsrggD-vSyPU8bO16mwXC18cIzBE-24aztLG2EVG3qddazu2g
Message-ID: <CAAhV-H6gB2+NPgiLu409FOfkmDdyFmbwqtAHTdTgQUJ_zx0z1Q@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: expose LAMCAS existence via cpuinfo and hwcap
To: Rong Bao <rong.bao@csmantle.top>
Cc: WANG Xuerui <kernel@xen0n.name>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yawei Li <liyawei@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	George Guo <dongtai.guo@linux.dev>, Yangyang Lian <lianyangyang@kylinos.cn>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, Xi Ruoyao <xry111@xry111.site>, 
	Rong Bao <baorong2005@126.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sun, Sep 6, 2026 at 4:03=E2=80=AFPM Rong Bao <rong.bao@csmantle.top> wro=
te:
>
> Currently, neither /proc/cpuinfo nor hwcap exposes the existence of the
> LAMCAS extension, which is part of LA64v1.1. For example, on a Loongson
> 3B6000, /proc/cpuinfo is as follows:
>
>         processor               : 23
>         package                 : 0
>         core                    : 11
>         global_id               : 31
>         CPU Family              : Loongson-64bit
>         Model Name              : Loongson-3B6000
>         PRID                    : LA664 (0014d011)
>         CPU Revision            : 0x11
>         FPU Revision            : 0x01
>         CPU MHz                 : 2200.00
>         BogoMIPS                : 4400.00
>         TLB Entries             : 2112
>         Address Sizes           : 48 bits physical, 48 bits virtual
>         ISA                     : loongarch32r loongarch32s loongarch64
>         Features                : cpucfg lam lam_bh scq ual fpu lsx lasx
>         crc32 complex crypto lspw lvz lbt_x86 lbt_arm lbt_mips
>         Hardware Watchpoint     : yes, iwatch count: 8, dwatch count: 4
>
> ... while the CPUCFG 2 instruction reads "0x7e7ccfcf", whose bit 28 is 1,
> indicating the actual presence of LAMCAS.
>
> This hinders user-space inspection and detection of LAMCAS. For example,
> in SpiderMonkey, we need to switch to larchintrin.h and raw __cpucfg()
> to manually perform the bit extraction. Also, a curious user reading
> /proc/cpuinfo might be puzzled by the lack (of display) of LAMCAS.
>
> Expose the existence of LAMCAS via cpuinfo and hwcap. The definition
> point of the new LOONGARCH_CPU_LAMCAS flag is chosen to match the
> practices in commit 1dd3e8a8eeb4059fb34b07578362380cf35b7ed5 ("LoongArch:
> Define instruction formats for AM{SWAP/ADD}.{B/H} and DBAR").
>
> After this patch, /proc/cpuinfo looks like the following:
>
>         processor               : 23
>         package                 : 0
>         core                    : 11
>         global_id               : 31
>         CPU Family              : Loongson-64bit
>         Model Name              : Loongson-3B6000
>         PRID                    : LA664 (0014d011)
>         CPU Revision            : 0x11
>         FPU Revision            : 0x01
>         CPU MHz                 : 2200.00
>         BogoMIPS                : 4400.00
>         TLB Entries             : 2112
>         Address Sizes           : 48 bits physical, 48 bits virtual
>         ISA                     : loongarch32r loongarch32s loongarch64
>         Features                : cpucfg lam lam_bh lamcas scq ual fpu ls=
x
>         lasx crc32 complex crypto lspw lvz lbt_x86 lbt_arm lbt_mips
>         Hardware Watchpoint     : yes, iwatch count: 8, dwatch count: 4
>
> Note the addition of "lamcas" to the "Features" row.
>
> Link: https://bugzil.la/2069431 ("[loong64] Use LA64v1.1 LAMCAS
>  extension to simplify atomic cmpxchg operations")
> Signed-off-by: Rong Bao <rong.bao@csmantle.top>
> ---
> v1 -> v2:
> - Addressed review comments and correctly re-stylized "LoongArch" in
>   subject.
>
> v1: https://lore.kernel.org/loongarch/20260905032010.4962-1-rong.bao@csma=
ntle.top/
>
>  arch/loongarch/include/asm/cpu-features.h |  1 +
>  arch/loongarch/include/asm/cpu.h          | 64 ++++++++++++-----------
>  arch/loongarch/include/uapi/asm/hwcap.h   |  1 +
>  arch/loongarch/kernel/cpu-probe.c         |  4 ++
>  arch/loongarch/kernel/proc.c              |  2 +
>  5 files changed, 41 insertions(+), 31 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/i=
nclude/asm/cpu-features.h
> index 62059c5551b9cdcc63c26033f8ccb44d63b18482..19cb0ccd0fb62bbbeb80a31bc=
447c101560bed32 100644
> --- a/arch/loongarch/include/asm/cpu-features.h
> +++ b/arch/loongarch/include/asm/cpu-features.h
> @@ -36,6 +36,7 @@
>  #define cpu_has_cpucfg         cpu_opt(LOONGARCH_CPU_CPUCFG)
>  #define cpu_has_lam            cpu_opt(LOONGARCH_CPU_LAM)
>  #define cpu_has_lam_bh         cpu_opt(LOONGARCH_CPU_LAM_BH)
> +#define cpu_has_lamcas         cpu_opt(LOONGARCH_CPU_LAMCAS)
>  #define cpu_has_scq            cpu_opt(LOONGARCH_CPU_SCQ)
>  #define cpu_has_ual            cpu_opt(LOONGARCH_CPU_UAL)
>  #define cpu_has_fpu            cpu_opt(LOONGARCH_CPU_FPU)
> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/as=
m/cpu.h
> index 91b96938861eb9f81882b128ab0bd0a925ce0dbb..334ca9d69ec4a649848133d0a=
81555bfc37fbf9d 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -96,41 +96,43 @@ static inline char *id_to_core_name(unsigned int id)
>  #define CPU_FEATURE_CPUCFG             0       /* CPU has CPUCFG */
>  #define CPU_FEATURE_LAM                        1       /* CPU has Atomic=
 instructions */
>  #define CPU_FEATURE_LAM_BH             2       /* CPU has AM{SWAP/ADD}[_=
DB].{B/H} instructions */
> -#define CPU_FEATURE_SCQ                        3       /* CPU has SC.Q i=
nstruction */
> -#define CPU_FEATURE_UAL                        4       /* CPU supports u=
naligned access */
> -#define CPU_FEATURE_FPU                        5       /* CPU has FPU */
> -#define CPU_FEATURE_LSX                        6       /* CPU has LSX (1=
28-bit SIMD) */
> -#define CPU_FEATURE_LASX               7       /* CPU has LASX (256-bit =
SIMD) */
> -#define CPU_FEATURE_CRC32              8       /* CPU has CRC32 instruct=
ions */
> -#define CPU_FEATURE_COMPLEX            9       /* CPU has Complex instru=
ctions */
> -#define CPU_FEATURE_CRYPTO             10      /* CPU has Crypto instruc=
tions */
> -#define CPU_FEATURE_LVZ                        11      /* CPU has Virtua=
lization extension */
> -#define CPU_FEATURE_LBT_X86            12      /* CPU has X86 Binary Tra=
nslation */
> -#define CPU_FEATURE_LBT_ARM            13      /* CPU has ARM Binary Tra=
nslation */
> -#define CPU_FEATURE_LBT_MIPS           14      /* CPU has MIPS Binary Tr=
anslation */
> -#define CPU_FEATURE_TLB                        15      /* CPU has TLB */
> -#define CPU_FEATURE_CSR                        16      /* CPU has CSR */
> -#define CPU_FEATURE_IOCSR              17      /* CPU has IOCSR */
> -#define CPU_FEATURE_WATCH              18      /* CPU has watchpoint reg=
isters */
> -#define CPU_FEATURE_VINT               19      /* CPU has vectored inter=
rupts */
> -#define CPU_FEATURE_CSRIPI             20      /* CPU has CSR-IPI */
> -#define CPU_FEATURE_EXTIOI             21      /* CPU has EXT-IOI */
> -#define CPU_FEATURE_PREFETCH           22      /* CPU has prefetch instr=
uctions */
> -#define CPU_FEATURE_PMP                        23      /* CPU has perfer=
mance counter */
> -#define CPU_FEATURE_SCALEFREQ          24      /* CPU supports cpufreq s=
caling */
> -#define CPU_FEATURE_FLATMODE           25      /* CPU has flat mode */
> -#define CPU_FEATURE_EIODECODE          26      /* CPU has EXTIOI interru=
pt pin decode mode */
> -#define CPU_FEATURE_GUESTID            27      /* CPU has GuestID featur=
e */
> -#define CPU_FEATURE_HYPERVISOR         28      /* CPU has hypervisor (ru=
nning in VM) */
> -#define CPU_FEATURE_PTW                        29      /* CPU has hardwa=
re page table walker */
> -#define CPU_FEATURE_LSPW               30      /* CPU has LSPW (lddir/ld=
pte instructions) */
> -#define CPU_FEATURE_MSGINT             31      /* CPU has MSG interrupt =
*/
> -#define CPU_FEATURE_AVECINT            32      /* CPU has AVEC interrupt=
 */
> -#define CPU_FEATURE_REDIRECTINT                33      /* CPU has interr=
upt remapping */
> +#define CPU_FEATURE_LAMCAS             3       /* CPU has AMCAS[_DB].{B/=
H/W/D} instructions */
> +#define CPU_FEATURE_SCQ                        4       /* CPU has SC.Q i=
nstruction */
> +#define CPU_FEATURE_UAL                        5       /* CPU supports u=
naligned access */
> +#define CPU_FEATURE_FPU                        6       /* CPU has FPU */
> +#define CPU_FEATURE_LSX                        7       /* CPU has LSX (1=
28-bit SIMD) */
> +#define CPU_FEATURE_LASX               8       /* CPU has LASX (256-bit =
SIMD) */
> +#define CPU_FEATURE_CRC32              9       /* CPU has CRC32 instruct=
ions */
> +#define CPU_FEATURE_COMPLEX            10      /* CPU has Complex instru=
ctions */
> +#define CPU_FEATURE_CRYPTO             11      /* CPU has Crypto instruc=
tions */
> +#define CPU_FEATURE_LVZ                        12      /* CPU has Virtua=
lization extension */
> +#define CPU_FEATURE_LBT_X86            13      /* CPU has X86 Binary Tra=
nslation */
> +#define CPU_FEATURE_LBT_ARM            14      /* CPU has ARM Binary Tra=
nslation */
> +#define CPU_FEATURE_LBT_MIPS           15      /* CPU has MIPS Binary Tr=
anslation */
> +#define CPU_FEATURE_TLB                        16      /* CPU has TLB */
> +#define CPU_FEATURE_CSR                        17      /* CPU has CSR */
> +#define CPU_FEATURE_IOCSR              18      /* CPU has IOCSR */
> +#define CPU_FEATURE_WATCH              19      /* CPU has watchpoint reg=
isters */
> +#define CPU_FEATURE_VINT               20      /* CPU has vectored inter=
rupts */
> +#define CPU_FEATURE_CSRIPI             21      /* CPU has CSR-IPI */
> +#define CPU_FEATURE_EXTIOI             22      /* CPU has EXT-IOI */
> +#define CPU_FEATURE_PREFETCH           23      /* CPU has prefetch instr=
uctions */
> +#define CPU_FEATURE_PMP                        24      /* CPU has perfer=
mance counter */
> +#define CPU_FEATURE_SCALEFREQ          25      /* CPU supports cpufreq s=
caling */
> +#define CPU_FEATURE_FLATMODE           26      /* CPU has flat mode */
> +#define CPU_FEATURE_EIODECODE          27      /* CPU has EXTIOI interru=
pt pin decode mode */
> +#define CPU_FEATURE_GUESTID            28      /* CPU has GuestID featur=
e */
> +#define CPU_FEATURE_HYPERVISOR         29      /* CPU has hypervisor (ru=
nning in VM) */
> +#define CPU_FEATURE_PTW                        30      /* CPU has hardwa=
re page table walker */
> +#define CPU_FEATURE_LSPW               31      /* CPU has LSPW (lddir/ld=
pte instructions) */
> +#define CPU_FEATURE_MSGINT             32      /* CPU has MSG interrupt =
*/
> +#define CPU_FEATURE_AVECINT            33      /* CPU has AVEC interrupt=
 */
> +#define CPU_FEATURE_REDIRECTINT                34      /* CPU has interr=
upt remapping */
>
>  #define LOONGARCH_CPU_CPUCFG           BIT_ULL(CPU_FEATURE_CPUCFG)
>  #define LOONGARCH_CPU_LAM              BIT_ULL(CPU_FEATURE_LAM)
>  #define LOONGARCH_CPU_LAM_BH           BIT_ULL(CPU_FEATURE_LAM_BH)
> +#define LOONGARCH_CPU_LAMCAS           BIT_ULL(CPU_FEATURE_LAMCAS)
>  #define LOONGARCH_CPU_SCQ              BIT_ULL(CPU_FEATURE_SCQ)
>  #define LOONGARCH_CPU_UAL              BIT_ULL(CPU_FEATURE_UAL)
>  #define LOONGARCH_CPU_FPU              BIT_ULL(CPU_FEATURE_FPU)
> diff --git a/arch/loongarch/include/uapi/asm/hwcap.h b/arch/loongarch/inc=
lude/uapi/asm/hwcap.h
> index 90e96113ba51003cd4dde5c7c79744f5e0755a03..d354787b937c3ae9eb8c3d58a=
4e7e96bd066f6fd 100644
> --- a/arch/loongarch/include/uapi/asm/hwcap.h
> +++ b/arch/loongarch/include/uapi/asm/hwcap.h
> @@ -20,5 +20,6 @@
>  #define HWCAP_LOONGARCH_LSPW           (1 << 14)
>  #define HWCAP_LOONGARCH_SCQ            (1 << 15)
>  #define HWCAP_LOONGARCH_LAM_BH         (1 << 16)
> +#define HWCAP_LOONGARCH_LAMCAS         (1 << 17)
>
>  #endif /* _UAPI_ASM_HWCAP_H */
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index 74d31f260dfd889e66a1f55c5bcc47a3657d101f..93176e4d017b4d8fc82c817a7=
064af0656133c15 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -182,6 +182,10 @@ static void cpu_probe_common(struct cpuinfo_loongarc=
h *c)
>                 c->options |=3D LOONGARCH_CPU_LAM_BH;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_LAM_BH;
>         }
> +       if (config & CPUCFG2_LAMCAS) {
> +               c->options |=3D LOONGARCH_CPU_LAMCAS;
> +               elf_hwcap |=3D HWCAP_LOONGARCH_LAMCAS;
> +       }
>         if (config & CPUCFG2_SCQ) {
>                 c->options |=3D LOONGARCH_CPU_SCQ;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_SCQ;
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index d4ce5b585453700caf2187c3dcc8f4f3cc8a9226..f86be83ad6f134c5793667fa6=
dbe2bf82fd58a2e 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -66,6 +66,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>                 seq_puts(m, " lam");
>         if (cpu_has_lam_bh)
>                 seq_puts(m, " lam_bh");
> +       if (cpu_has_lamcas)
> +               seq_puts(m, " lamcas");
>         if (cpu_has_scq)
>                 seq_puts(m, " scq");
>         if (cpu_has_ual)
>
> base-commit: 654ae5d73c05bd2943d65636ce6cd0aa46e62f18
> --
> 2.55.0
>
