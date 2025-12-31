Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B8311C31
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767174733; cv=none; b=HAQD6HmkaflaHUw9oQQHKQWDABvaJv+IPeu/Ple6Kkj9CBPEzMbPdS7+KU/1sRvM+QpkbMlXxrBKIUZdJF8vvQSo0pTi/+MmEVpaSoYakkLMGrYYdwz1+Ugrr7CkmMx4CDNQCkgCNeZa0jrl6P9wsBAtb987kOMlWnrCog2KWjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767174733; c=relaxed/simple;
	bh=vYNBFUNiGXT5BahhuhQCtiEEWrd98I+kr9uxdcIzxmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHz/kZL45ZF3wgXUjttrXHr5iqAk9ecYXaf3e8N9XmPaU5bnB6fQiMvsMODKtmVXrut+vOLdFujrUJLXaKnzwrtd28kZWbSghw654CPvpqDVimNbv/8Hz3X5VTlLelAiNRmopxeSBMzhuAKDYrLLr3GpstGRQnwDe8t+qPXSXl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9IFDxUs; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9IFDxUs"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-459a6261428so3532249b6e.1
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 01:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767174726; x=1767779526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPl1j+rula36MGzWymGIEFuOFHBu5355E9HLd9JBVRE=;
        b=V9IFDxUsChzz5iqPQWVqJ8rAHdPWXd+nloInKdm1zbGLZEA3JRYmi8EVzETbro4qvd
         /QtYzGj7m+twnFEv+SzGkr71qFTxYl3Sse5RmVr2OmRs6WEpOW6j5FtIGkpN9EXp+iVv
         hJFl+8wKahaM+O7s/JzxtSjMa8zvxlbwfeZZcRVvODe2KGgjJNaLk/XUj+pErryhyGVW
         IJNotsprTt4LyPcPnZlvUG8Vu+bh2OgkZ5nxzOu0ggjPsNdtsyprVuCUhjQTU02mzVsq
         Vy6z0bKQR0F/RzkRLgQ+y61AaXkBIuOmplk2w9dJxddZ4c9pXMwq5aeC2m+B4TbCz7Vh
         1KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767174726; x=1767779526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GPl1j+rula36MGzWymGIEFuOFHBu5355E9HLd9JBVRE=;
        b=gDajX71pA2a1LRmRAlg8oKtOuW77tM6OajkuXADaURiV8DbiMe9zES19N+tfHF2z02
         z00Q4NXYeNKlvp58rSv2EaORQWsQu/0YLzF1S6XS31Ajx0t8Vomb+vq4Jtz/6sJlI0/j
         4GfQ5OFZF3Rr62rh2j2r4eKDoXBnr9KQaAsyJ8TKDtvBNketymlQW7PVRvYVXN3YPEUc
         rVw7UBgvJJMjEvY5RC4/2hefTh8uY7ecxUonqFfqStAAbBTyic8A4j74oZoqbmHa3pex
         Xu9sOfpsFYYTc3ZuYyQO/oEvWN13T6ppFXAAyrs1IpzUb11PlpiDPsrf2plpefqzmClD
         OAfA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7S90b6vJBeptjlTKEhStbEijGsnPL5dbn1lgG41xHpqtFqQzbTUPqpDdFJswVAiRRpUxXllyfOM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOB3BT/h3C3xwqXBVCZ6kYwbb+PnuZt5hm/4UJGvEW3XMWDHW5
	togPcRolDKH7VGJ+kuP7JGNjOugt75hshpYCJ/sPGF5F+w6z/vJwF3XbwTPtT15W4x9HXaJCFI6
	ILiXjdZBymtlVF6nGSEheJZzOg5uE4D8=
X-Gm-Gg: AY/fxX5eaOzUBIW1ni4rt1TIK1H0vyxa+VsZc8ClGlcgTYe9kebc9MYW8lFMwaswC2E
	EABH6xazdAx5mszXGG/GAltBjgnnCGHiXn4g6FugZkTjg+xteR5T2ctJiiTW75vs4+mp0JQiJ7w
	yWMP3n9Xm1/W4S4wG5F88El5ixg3evOc42rQWZS61+Setp+EuvDevYgrOXABYcmDzbGdPiub2v9
	ljrhh3+M0OAO2rB03HCWG0kN6q8ktoAvUNgThkR0JKGDBHOwcIESTkPSiYrVZahelquXSwD
X-Google-Smtp-Source: AGHT+IGYU8d0Ec2DKoKuBCr2Js1Up2CHI8KbiKdPCMdF0I6k9b4wEYeJ8XBfGQQncBFX6SH/t1JdPuqM2aa8Kd8ssFU=
X-Received: by 2002:a05:6808:1205:b0:44f:8ccd:c489 with SMTP id
 5614622812f47-457b2256e3emr16769631b6e.25.1767174726049; Wed, 31 Dec 2025
 01:52:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
 <20251231034523.47014-1-dongtai.guo@linux.dev> <20251231034523.47014-2-dongtai.guo@linux.dev>
In-Reply-To: <20251231034523.47014-2-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 31 Dec 2025 17:51:55 +0800
X-Gm-Features: AQt7F2oudNtpoyYZChg6ou8DbybpHmC0gZppjlCj7d0V4pn_5DIB6yonE1Y21oE
Message-ID: <CAEyhmHQF=hiyJw0KRTXn+1zAUjJHf_G8fiJ_p2g2qaYpaa0YNg@mail.gmail.com>
Subject: Re: [PATCH v8 loongarch-next 1/3] LoongArch: Add SCQ support detection
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 11:45=E2=80=AFAM George Guo <dongtai.guo@linux.dev>=
 wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Check CPUCFG2_SCQ bit to determine if the CPU supports
> SCQ instruction.
>
> Co-developed-by: Yangyang Lian <lianyangyang@kylinos.cn>
> Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---

There is a conflict with latest loongarch-next branch. Other than that

Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/include/asm/cpu-features.h | 1 +
>  arch/loongarch/include/asm/cpu.h          | 2 ++
>  arch/loongarch/include/asm/loongarch.h    | 1 +
>  arch/loongarch/kernel/cpu-probe.c         | 2 ++
>  arch/loongarch/kernel/proc.c              | 1 +
>  5 files changed, 7 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/i=
nclude/asm/cpu-features.h
> index 3745d991a99a..39c7fe64c3ef 100644
> --- a/arch/loongarch/include/asm/cpu-features.h
> +++ b/arch/loongarch/include/asm/cpu-features.h
> @@ -67,5 +67,6 @@
>  #define cpu_has_msgint         cpu_opt(LOONGARCH_CPU_MSGINT)
>  #define cpu_has_avecint                cpu_opt(LOONGARCH_CPU_AVECINT)
>  #define cpu_has_redirectint    cpu_opt(LOONGARCH_CPU_REDIRECTINT)
> +#define cpu_has_scq            cpu_opt(LOONGARCH_CPU_SCQ)
>
>  #endif /* __ASM_CPU_FEATURES_H */
> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/as=
m/cpu.h
> index f3efb00b6141..5531039027ec 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -125,6 +125,7 @@ static inline char *id_to_core_name(unsigned int id)
>  #define CPU_FEATURE_MSGINT             29      /* CPU has MSG interrupt =
*/
>  #define CPU_FEATURE_AVECINT            30      /* CPU has AVEC interrupt=
 */
>  #define CPU_FEATURE_REDIRECTINT                31      /* CPU has interr=
upt remapping */
> +#define CPU_FEATURE_SCQ                        32      /* CPU has SC.Q i=
nstruction */
>
>  #define LOONGARCH_CPU_CPUCFG           BIT_ULL(CPU_FEATURE_CPUCFG)
>  #define LOONGARCH_CPU_LAM              BIT_ULL(CPU_FEATURE_LAM)
> @@ -158,5 +159,6 @@ static inline char *id_to_core_name(unsigned int id)
>  #define LOONGARCH_CPU_MSGINT           BIT_ULL(CPU_FEATURE_MSGINT)
>  #define LOONGARCH_CPU_AVECINT          BIT_ULL(CPU_FEATURE_AVECINT)
>  #define LOONGARCH_CPU_REDIRECTINT      BIT_ULL(CPU_FEATURE_REDIRECTINT)
> +#define LOONGARCH_CPU_SCQ              BIT_ULL(CPU_FEATURE_SCQ)
>
>  #endif /* _ASM_CPU_H */
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index e6b8ff61c8cc..817cd90941d9 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -94,6 +94,7 @@
>  #define  CPUCFG2_LSPW                  BIT(21)
>  #define  CPUCFG2_LAM                   BIT(22)
>  #define  CPUCFG2_PTW                   BIT(24)
> +#define  CPUCFG2_SCQ                   BIT(30)
>
>  #define LOONGARCH_CPUCFG3              0x3
>  #define  CPUCFG3_CCDMA                 BIT(0)
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index 08a227034042..382c472c6bfe 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -205,6 +205,8 @@ static void cpu_probe_common(struct cpuinfo_loongarch=
 *c)
>                 c->options |=3D LOONGARCH_CPU_PTW;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_PTW;
>         }
> +       if (config & CPUCFG2_SCQ)
> +               c->options |=3D LOONGARCH_CPU_SCQ;
>         if (config & CPUCFG2_LSPW) {
>                 c->options |=3D LOONGARCH_CPU_LSPW;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_LSPW;
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index a8800d20e11b..252fa1d03b85 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -75,6 +75,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>         if (cpu_has_lbt_x86)    seq_printf(m, " lbt_x86");
>         if (cpu_has_lbt_arm)    seq_printf(m, " lbt_arm");
>         if (cpu_has_lbt_mips)   seq_printf(m, " lbt_mips");
> +       if (cpu_has_scq)        seq_printf(m, " scq");
>         seq_printf(m, "\n");
>
>         seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_wat=
ch));
> --
> 2.49.0
>
