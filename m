Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324C2DB78C
	for <loongarch@lists.linux.dev>; Wed, 15 Apr 2026 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776219883; cv=pass; b=p4ja3jNdQFXsJL4kLXZQjRFoMH9AKF9whcczJI2lPYIa3KmOc+M8em0FPTWxqyeLJumo4xKFl+RtyqcCR58stYfVC8XAT5lTs5l4OjVavp3sKYzDxTWbEHUFpCq143AqE3yVFrQHb3r19cL2nyAnoIeS0ja+elBdtUkwdUGdH8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776219883; c=relaxed/simple;
	bh=UWfwp+MsLObrA5DXDZcWrRQds+drx65djGxTh7vqpUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guJJjU9LIHtTEC30ovkxe9cyAi12V6u42zhS3nApkII1OCF93j3V+BcYSdqKCCM//cNOYv/3RLxVthWwneL5+YSHbWpSy7xh7EFSpIvSWBoTufQwV2nbW2GzbCfb+8wMKakFPVut0q2bWu/8Jw0rneKEOssGcbrnyTyKlMVgzRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8SY4Hxm; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8SY4Hxm"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-41576c5c01cso4781078fac.3
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 19:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776219881; cv=none;
        d=google.com; s=arc-20240605;
        b=WXpgRj3AQWDc1zUmeT5VDnVtMLq2Ds2HYZIGLitXaDBwmSPcPPCNwqNmgx8eo0EKXg
         XN3pkaZg509CyJP2wnTAw9fq+U4VZNISrK+SOoP6iwYcefJl3B9T8cx/bTt/R/KlYUIc
         O8n/dRigL0uBiJvdm0L+E/q++JleqituHPttYDrg+ArMCmn/yk/aII6Fwsb67JXwr81J
         GbsRvX4eWDEvQ8TUxGyY89YORIS64i52/4d2zDM31JDkELjynA7Waw07mkHwqFNFNjJf
         vgo2yd0Z4wRP2KS9Atu+IMJF3aJJ+Tw/O4m8HbBm7WOf9ey4tU6OxDYZMgXwTwt/Asyv
         Z2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJilSYQVRtHj9Uy3sgn/sow7EaaBHExHVWk6iwVjy0Y=;
        fh=qCL6wiUnN86As4JiZ2d83oqtrGa6aEpNkMCdgGqARfM=;
        b=j5qx9sycYDGtWz1YY4xsYmEfxKn1mKNs+96n9vzbXkql50Mk0UZ1wzBABhl4f4tq9y
         SJ90C7kM2kI/y847aWCqccW7CCZq924d7MuotvXLWUiT84i5xQ//oqMaEkBoFhbxbw67
         EJVYDLlAXilVQyUH7uP/0U+yWo7UYmAv9HfJ4+DFYdYgsqw7DyEl6fGu0HwqexS4aoFK
         +DOLrVxDjSWoVAe7byKd0EJhA44PfPl/eUHBp+tzqAEst3tJMlEI5ngZ4evQ3hOKWWw4
         LT8D+lPv12xhhGMxn0s6M4DSc7mekFNUPchxosL0cjMfSvlXkHRL0EAQgfufrvHZSdzl
         zw4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776219881; x=1776824681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJilSYQVRtHj9Uy3sgn/sow7EaaBHExHVWk6iwVjy0Y=;
        b=r8SY4HxmGOgJ1nO3iG0FJt8iHNRCefltBX2Bv3YJlg0yuYo01YP6h0WN73nsImOAOC
         nUxCqw+8TDwtcHazogDbXSBnI+4vgUqirxYuIMtRqnS6CZ2nwSAmT63jK/AeYs91HyXJ
         q+3MhMb1kLUP5OlS5sB9yGfsb2mZXEv1o7aPz2s9tEm5c4/cXdKEQVaGx3T37ftq/Iu2
         YIS5X2USbQW5UvXiHli9IflZdsh3WtXNdJj/AXzRgfGVvr0515eQgUET12L0AGX0xDcO
         /QNEbxvRI16L7kBLBH1S1TGOIj3PLDr2TiuVccc5rOkPpbgrxk8WW5+pjFiMmQZJk0K6
         GBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776219881; x=1776824681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJilSYQVRtHj9Uy3sgn/sow7EaaBHExHVWk6iwVjy0Y=;
        b=jRhuG4WhW1oQeoah1vUIBdLC6ZXFOpnHIBum/lVTY5KDrPNuAGI4+OWmJUwxNXmzFi
         8X90kqyuAwALpk+Duffxzn4uF/pHdlPTx/SQWkRIPeg7hnCU0h7PJduBserdSsoFlssD
         P/YqueOG/+t2QaRDmUWWMYj8VJgeu/VPpgoeFJinI7IMKF0EnyMXzgc+xVc6GBvnI5Sp
         4hXgNJTfGxGhzawHriP4AFltoeGLlPp5w4rZZ93NmD6ca/zO2CKsNViB3pDbYBT92eW4
         q4WYvhS1UazvlGC3rGy7n4VKu9Nx45pdYv1tf9Sp+AZ6Lo4+VhLVszTMR0m+JYBaBFgA
         jI8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+wHJjil6Egn/eHMW607lxBTbbLAHgReJUZFN86x75PMt0ibXIUPjBS5eYTLJhv9Q66i35RqiNGX+M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/KxPHzdQi0Fu2HN/dc801qBH+TDcjlFzJGMrl6Mhr4jO08aMS
	yGnbRN3gLmd+mxQpNgR8gfZYH58alukjH3MMnaZi0YDoV0H/aA4ax4P4UbmJGjc7kaQRo975ktd
	uvin8BGP566T8aPq35ue+tsSBb5Gk8g4=
X-Gm-Gg: AeBDiesh48ApRWkgqVTjPA+iYvEEnaW0FzsNNifo9vtEDyVWwwRpFdyatbcT+DVMatl
	Kly9C9G+DEjUexj3YSDIW4S+FZ+aQs9d5ZLQ/lZdvutS64fOujGjZEnRR6dWP8WQBW6la9IWeH1
	9DQLz+48BM6Ml23+TxlJPYPjgJ1ctfBdUO/xgi3PDTWtGLe8NUraH2qP3Rr4ZUrQhUoaFHq2RJR
	PFC2bUWsNR9NPuBvob2Dx/Np6y67LokkF8KOvcb4m9EGxTA20RxcVD2RoR6uiENNSKofyrHvBVw
	1mGK4qwqYjfR8VKNQQ==
X-Received: by 2002:a05:6871:5209:b0:424:6bb7:7c71 with SMTP id
 586e51a60fabf-4246bb78b0fmr1714256fac.25.1776219881271; Tue, 14 Apr 2026
 19:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413040506.26640-1-yangtiezhu@loongson.cn> <20260413040506.26640-2-yangtiezhu@loongson.cn>
In-Reply-To: <20260413040506.26640-2-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 15 Apr 2026 10:24:30 +0800
X-Gm-Features: AQROBzDpJH47XKFw6kmUmaX-OosWEpJHltr2ni0L6hYYkkYko-HDnJrmfTL26CQ
Message-ID: <CAEyhmHS7xC1=3GrZLqf-u9+2-vg0BNu2hKE+y3bHNUQPD6yvow@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] LoongArch: Define instruction formats for
 AM{SWAP/ADD}.{B/H} and DBAR
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 12:05=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> The 8 and 16 bit read-modify-write atomic instructions amadd.{b/h} and
> amswap.{b/h} were newly added in the latest LoongArch Reference Manual,
> define the instruction format and check whether support via cpucfg.
>
> Furthermore, define the instruction format for DBAR which will be used
> to support BPF load-acquire and store-release instructions.
>
> This is preparation for later patch.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/include/asm/cpu-features.h |  1 +
>  arch/loongarch/include/asm/cpu.h          |  2 ++
>  arch/loongarch/include/asm/inst.h         | 10 ++++++++++
>  arch/loongarch/include/uapi/asm/hwcap.h   |  1 +
>  arch/loongarch/kernel/cpu-probe.c         |  4 ++++
>  arch/loongarch/kernel/proc.c              |  2 ++
>  6 files changed, 20 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/i=
nclude/asm/cpu-features.h
> index 8eefe7a2098b..f9d3188accfc 100644
> --- a/arch/loongarch/include/asm/cpu-features.h
> +++ b/arch/loongarch/include/asm/cpu-features.h
> @@ -68,5 +68,6 @@
>  #define cpu_has_msgint         cpu_opt(LOONGARCH_CPU_MSGINT)
>  #define cpu_has_avecint                cpu_opt(LOONGARCH_CPU_AVECINT)
>  #define cpu_has_redirectint    cpu_opt(LOONGARCH_CPU_REDIRECTINT)
> +#define cpu_has_lam_bh         cpu_opt(LOONGARCH_CPU_LAM_BH)
>
>  #endif /* __ASM_CPU_FEATURES_H */
> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/as=
m/cpu.h
> index 1e60ab264cd0..b423b1f41145 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -126,6 +126,7 @@ static inline char *id_to_core_name(unsigned int id)
>  #define CPU_FEATURE_MSGINT             30      /* CPU has MSG interrupt =
*/
>  #define CPU_FEATURE_AVECINT            31      /* CPU has AVEC interrupt=
 */
>  #define CPU_FEATURE_REDIRECTINT                32      /* CPU has interr=
upt remapping */
> +#define CPU_FEATURE_LAM_BH             33      /* CPU has AM{SWAP/ADD}[_=
DB].{B/H} instructions */
>
>  #define LOONGARCH_CPU_CPUCFG           BIT_ULL(CPU_FEATURE_CPUCFG)
>  #define LOONGARCH_CPU_LAM              BIT_ULL(CPU_FEATURE_LAM)
> @@ -160,5 +161,6 @@ static inline char *id_to_core_name(unsigned int id)
>  #define LOONGARCH_CPU_MSGINT           BIT_ULL(CPU_FEATURE_MSGINT)
>  #define LOONGARCH_CPU_AVECINT          BIT_ULL(CPU_FEATURE_AVECINT)
>  #define LOONGARCH_CPU_REDIRECTINT      BIT_ULL(CPU_FEATURE_REDIRECTINT)
> +#define LOONGARCH_CPU_LAM_BH           BIT_ULL(CPU_FEATURE_LAM_BH)
>
>  #endif /* _ASM_CPU_H */
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index f9f207082d0e..76b723590023 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -36,6 +36,7 @@
>
>  enum reg0i15_op {
>         break_op        =3D 0x54,
> +       dbar_op         =3D 0x70e4,
>  };
>
>  enum reg0i26_op {
> @@ -194,6 +195,10 @@ enum reg3_op {
>         fstxs_op        =3D 0x7070,
>         fstxd_op        =3D 0x7078,
>         scq_op          =3D 0x70ae,
> +       amswapb_op      =3D 0x70b8,
> +       amswaph_op      =3D 0x70b9,
> +       amaddb_op       =3D 0x70ba,
> +       amaddh_op       =3D 0x70bb,
>         amswapw_op      =3D 0x70c0,
>         amswapd_op      =3D 0x70c1,
>         amaddw_op       =3D 0x70c2,
> @@ -543,6 +548,7 @@ static inline void emit_##NAME(union loongarch_instru=
ction *insn,   \
>  }
>
>  DEF_EMIT_REG0I15_FORMAT(break, break_op)
> +DEF_EMIT_REG0I15_FORMAT(dbar, dbar_op)
>
>  /* like emit_break(imm) but returns a constant expression */
>  #define __emit_break(imm)      ((u32)((imm) | (break_op << 15)))
> @@ -763,6 +769,8 @@ DEF_EMIT_REG3_FORMAT(stxb, stxb_op)
>  DEF_EMIT_REG3_FORMAT(stxh, stxh_op)
>  DEF_EMIT_REG3_FORMAT(stxw, stxw_op)
>  DEF_EMIT_REG3_FORMAT(stxd, stxd_op)
> +DEF_EMIT_REG3_FORMAT(amaddb, amaddb_op)
> +DEF_EMIT_REG3_FORMAT(amaddh, amaddh_op)
>  DEF_EMIT_REG3_FORMAT(amaddw, amaddw_op)
>  DEF_EMIT_REG3_FORMAT(amaddd, amaddd_op)
>  DEF_EMIT_REG3_FORMAT(amandw, amandw_op)
> @@ -771,6 +779,8 @@ DEF_EMIT_REG3_FORMAT(amorw, amorw_op)
>  DEF_EMIT_REG3_FORMAT(amord, amord_op)
>  DEF_EMIT_REG3_FORMAT(amxorw, amxorw_op)
>  DEF_EMIT_REG3_FORMAT(amxord, amxord_op)
> +DEF_EMIT_REG3_FORMAT(amswapb, amswapb_op)
> +DEF_EMIT_REG3_FORMAT(amswaph, amswaph_op)
>  DEF_EMIT_REG3_FORMAT(amswapw, amswapw_op)
>  DEF_EMIT_REG3_FORMAT(amswapd, amswapd_op)
>
> diff --git a/arch/loongarch/include/uapi/asm/hwcap.h b/arch/loongarch/inc=
lude/uapi/asm/hwcap.h
> index 49519b4362c6..90e96113ba51 100644
> --- a/arch/loongarch/include/uapi/asm/hwcap.h
> +++ b/arch/loongarch/include/uapi/asm/hwcap.h
> @@ -19,5 +19,6 @@
>  #define HWCAP_LOONGARCH_PTW            (1 << 13)
>  #define HWCAP_LOONGARCH_LSPW           (1 << 14)
>  #define HWCAP_LOONGARCH_SCQ            (1 << 15)
> +#define HWCAP_LOONGARCH_LAM_BH         (1 << 16)
>
>  #endif /* _UAPI_ASM_HWCAP_H */
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index 657bbae6c1c7..93466fc7d33d 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -177,6 +177,10 @@ static void cpu_probe_common(struct cpuinfo_loongarc=
h *c)
>                 c->options |=3D LOONGARCH_CPU_LAM;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_LAM;
>         }
> +       if (config & CPUCFG2_LAM_BH) {
> +               c->options |=3D LOONGARCH_CPU_LAM_BH;
> +               elf_hwcap |=3D HWCAP_LOONGARCH_LAM_BH;
> +       }
>         if (config & CPUCFG2_SCQ) {
>                 c->options |=3D LOONGARCH_CPU_SCQ;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_SCQ;
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index a8127e83da65..d4ce5b585453 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -64,6 +64,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>                 seq_puts(m, " cpucfg");
>         if (cpu_has_lam)
>                 seq_puts(m, " lam");
> +       if (cpu_has_lam_bh)
> +               seq_puts(m, " lam_bh");
>         if (cpu_has_scq)
>                 seq_puts(m, " scq");
>         if (cpu_has_ual)
> --
> 2.42.0
>
