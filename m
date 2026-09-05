Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF582D94B5
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788583587; cv=none; b=nK6CHSNAiOn78FeNXm42UEXRTmYHrtApvsZt9qIZLtjA4cFJofJMTXD9A0vFqSk1HYZk0Ph5TclFXj4Lu6RT9HkIvs1Jvr947X4oH0bcltPNtn1qO/v2B0IWO3psIwIyC7fHsDXm0PQnn6EhB9psmdPB39cwgTVivJl/nwWzraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788583587; c=relaxed/simple;
	bh=Mz15E3FjchdC9p37tPfsZWGVJ5HchUM1QRk9gbsVh3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sR+/5AzzTiC5ghO+WPyqVzu9tlLSIOU8GQ4QuqrTlnYDZ3badUbQvWpAiNiX9PkGGRyY301X2gYI9+MAz7llHO+RIHIhoMGQBfTN0yWZcE6ZwarbZfCdqZJ9IE+zvqJG7R7Mh8dodtD0l4MvVLZgCaUVdjq4udQ8dGWA93jx8og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pr9yih8z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pr9yih8z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF841F0155A
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 04:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788583585;
	bh=DFSIeo+oRpIM2mWdWSRlM37TS6HjSt5vG0SJ7OIy0lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pr9yih8zyGldBS8gO2zUVNvvJr5gpR8p44K10yb+UmGPKQDYUHLphlzqhFFTZ5tTB
	 4gxAKLJVg/GhRlHa7HWJY9X27tsp7X3WmqNA2P5i7u/5yBDO2YYm5XmY0gENoyafD/
	 p0DwehnnbZ3uA/72GL17xh8pg8gAOAFgpeJ1Z+mzPF/nLlo8OncEpw/jydjWMqEznX
	 QxwqgjGvPaSPyNCCa3iUVBIaAFiwLk/uGfgJDhAWbNe3IgdWPbJ9vSd2gpugWwkOAX
	 3fzhPnJSb5bgL32rHGk/CpKNedszE+Rp7c2q9tVmInCx8kWrr5n1fbJtHR3sjTg+2U
	 7t39hvSty+7NA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2810889a12.2
        for <loongarch@lists.linux.dev>; Fri, 04 Sep 2026 21:46:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNawT7Bcdf30G+pJn9KwnGOPN5pzN7snUNQR5XT9QSfiWmTRaCDkKB9D+nJGesDS7ZiaMDm0IiYBQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lEm/w1VnyQUVFEtV4aLYUEmv3neV/go6NpkL3bRNEmAn+0lZA/
	N1/dTMHYMAmF/J7a4ncIITtQZcedu1MOudMpF6aR31ee7hLLyufYn8Y7AvzgzV4u+khX9EAr4ub
	Irs71RYZmR4aMka9YLftyTbU4W8qiwtk=
X-Received: by 2002:a05:6402:1d52:b0:69c:76c6:9bef with SMTP id
 4fb4d7f45d1cf-6a7e8d95518mr3699324a12.10.1788583583980; Fri, 04 Sep 2026
 21:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260905032010.4962-1-rong.bao@csmantle.top>
In-Reply-To: <20260905032010.4962-1-rong.bao@csmantle.top>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Sep 2026 12:46:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7nyh5bU1uHRY9HdMyz44VEPov3oa4rFCGu=Y-HSoVPZQ@mail.gmail.com>
X-Gm-Features: AcwNN1X6Sf5F-lgmw1E_BdFotDlWo6nEn4aOWCX_gwB4eBbXMoEkWE64fWOvZQU
Message-ID: <CAAhV-H7nyh5bU1uHRY9HdMyz44VEPov3oa4rFCGu=Y-HSoVPZQ@mail.gmail.com>
Subject: Re: [PATCH] loongarch: expose LAMCAS existence via cpuinfo and hwcap
To: Rong Bao <rong.bao@csmantle.top>
Cc: WANG Xuerui <kernel@xen0n.name>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Arnd Bergmann <arnd@arndb.de>, George Guo <dongtai.guo@linux.dev>, 
	Yangyang Lian <lianyangyang@kylinos.cn>, Kexy Biscuit <kexybiscuit@aosc.io>, 
	Mingcong Bai <jeffbai@aosc.io>, Rong Bao <baorong2005@126.com>, Yawei Li <liyawei@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Rong,

On Sat, Sep 5, 2026 at 11:21=E2=80=AFAM Rong Bao <rong.bao@csmantle.top> wr=
ote:
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
Can we use LAM_CAS in the code, which is similar to LAM_BH? And please
use LoongArch in the subject.

Huacai

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
