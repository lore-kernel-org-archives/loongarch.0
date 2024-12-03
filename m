Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7395537E9
	for <loongarch@lists.linux.dev>; Tue,  3 Dec 2024 02:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733194109; cv=none; b=pLcZVEnq1g4aL2a3EMA0CEu09H/mZIhfvmP3lBxYMwFxClGl9rWrvEakqaVtK/YV89Vsfpi6C/n0mdKGUCQmCuAjL5j+L4EeyPbPRpbKsFGQK7fkdnfQGKu5gz02wBC9XjhLPBrp5reMatjrSIBE4UTpcIBbVDhmpsbCGX+a6KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733194109; c=relaxed/simple;
	bh=Ri81F8s7VDqEINClmL8zxP8/WqatIKjpNaAF/YdMX6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/vuiWm3cwyIdWNjU39/SOlGhb8VU5oF2P+YsT3toLfsoVyHNcf9IWV4gmAI2Cgr1xgsAKIZyP5AnjuW/2iJqaaGl7hL7ziT12v09FX8c3S+iiMocOIHS3eFaW8nhx44lrWZtHvl4Y+I98VqAU5A49lyWYiiag80PbEteKZ7DqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9iEx1Da; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9iEx1Da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812F1C4CED9
	for <loongarch@lists.linux.dev>; Tue,  3 Dec 2024 02:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733194108;
	bh=Ri81F8s7VDqEINClmL8zxP8/WqatIKjpNaAF/YdMX6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O9iEx1Daz4MHk6c5tfOgBgmtshtDwWN6viGqR321oXs1hkZbc0VHWV5gWkj2cgVO6
	 U1K9e4jG+VfIid9HYUxx9xIB5KxbZdvEK/4mSr4hFgoZzpP0SPLKIiuyvpYGgM4HzR
	 2oay2jmC61v0h0HEXWbsIZzGUuNshFwr7DCIGVJT1zK9VfOEoSdmfsFf5KsXZfZUjE
	 D/TkaNMWfqI/ZGcQEAMaKF3CfRo8p1rDyXMJOkIeh9l9zlG0gqSwCc7IHl3qdZoIJE
	 J5Z8Ow+0b6KF6p4lPwmjf/wyciBQm4/mvt7Z3lNiVK1DK679DKpuyzI8xCNuVgufqp
	 UlPfJgcbGRZWA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0cd67766aso3709100a12.2
        for <loongarch@lists.linux.dev>; Mon, 02 Dec 2024 18:48:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaNoLqQ6HHh2FTSFwv8936jylWx8oBcYnRYMs9JLC756RPPIDyTg3mhE8o2bNunCoHK/jO8ds5+Ic=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQspSw9I4tC8+XDNe6V1SVbjaRB7hcs2p9wiolTzq2B8tKPqsz
	kQNGEe1WwFa7Ifu7O+DI+9R2PDo5oaHbse+aUmWlj7wEBBaTlwNnnaAjsVjfw2sqrT1SXL+waID
	4wglio2fMrFdkqOMHFHnlWZVCOtA=
X-Google-Smtp-Source: AGHT+IGscLpawf7f6yZPm22Rs/zQKbI/RCadnboB5yGetH6zCt2ARfqNSbsFkg8d3UsuwHvdhRZowIIiCAeCHF7lpmI=
X-Received: by 2002:a17:906:bfea:b0:aa5:3631:adcb with SMTP id
 a640c23a62f3a-aa5f7f4717emr39000766b.53.1733194107097; Mon, 02 Dec 2024
 18:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241113031727.2815628-1-maobibo@loongson.cn> <20241113031727.2815628-6-maobibo@loongson.cn>
In-Reply-To: <20241113031727.2815628-6-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 3 Dec 2024 10:48:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H54WbE_6CM8L3q_jRjA_VXLqX_msEmzOmwy2s0dFABCgw@mail.gmail.com>
Message-ID: <CAAhV-H54WbE_6CM8L3q_jRjA_VXLqX_msEmzOmwy2s0dFABCgw@mail.gmail.com>
Subject: Re: [RFC 5/5] LoongArch: KVM: Enable separate vmid feature
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

I think you need to probe LOONGARCH_CPU_GUESTID at the end of
cpu_probe_common(), otherwise cpu_has_guestid is always false.

Huacai

On Wed, Nov 13, 2024 at 11:17=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
> With CSR GTLBC shortname for Guest TLB Control Register, separate vmid
> feature will be enabled if bit 14 CSR_GTLBC_USEVMID is set. Enable
> this feature if cpu_has_guestid is true when KVM module is loaded.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/include/asm/loongarch.h | 2 ++
>  arch/loongarch/kvm/main.c              | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index 64ad277e096e..5fee5db3bea0 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -326,6 +326,8 @@
>  #define  CSR_GTLBC_TGID_WIDTH          8
>  #define  CSR_GTLBC_TGID_SHIFT_END      (CSR_GTLBC_TGID_SHIFT + CSR_GTLBC=
_TGID_WIDTH - 1)
>  #define  CSR_GTLBC_TGID                        (_ULCAST_(0xff) << CSR_GT=
LBC_TGID_SHIFT)
> +#define  CSR_GTLBC_USEVMID_SHIFT       14
> +#define  CSR_GTLBC_USEVMID             (_ULCAST_(0x1) << CSR_GTLBC_USEVM=
ID_SHIFT)
>  #define  CSR_GTLBC_TOTI_SHIFT          13
>  #define  CSR_GTLBC_TOTI                        (_ULCAST_(0x1) << CSR_GTL=
BC_TOTI_SHIFT)
>  #define  CSR_GTLBC_USETGID_SHIFT       12
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index f89d1df885d7..50c977d8b414 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -336,7 +336,7 @@ int kvm_arch_enable_virtualization_cpu(void)
>         write_csr_gcfg(0);
>         write_csr_gstat(0);
>         write_csr_gintc(0);
> -       clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI);
> +       clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI | CSR_GTLBC_US=
EVMID);
>
>         /*
>          * Enable virtualization features granting guest direct control o=
f
> @@ -359,6 +359,8 @@ int kvm_arch_enable_virtualization_cpu(void)
>
>         /* Enable using TGID  */
>         set_csr_gtlbc(CSR_GTLBC_USETGID);
> +       if (cpu_has_guestid)
> +               set_csr_gtlbc(CSR_GTLBC_USEVMID);
>         kvm_debug("GCFG:%lx GSTAT:%lx GINTC:%lx GTLBC:%lx",
>                   read_csr_gcfg(), read_csr_gstat(), read_csr_gintc(), re=
ad_csr_gtlbc());
>
> --
> 2.39.3
>
