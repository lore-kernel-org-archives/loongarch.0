Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169FB253359
	for <loongarch@lists.linux.dev>; Tue,  2 Jun 2026 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376482; cv=none; b=uSKu3ivUQxNxVJtOeV93zqG5eJKu7z2ji4K6PzGanNo6fh6muRfJOkTONr5uMvVQKD0lspxzIbe9etL43WSY2bIMwzVNQEfAKbywMuYWpC21Nhy8If8VoXCbomhX8JVHNzeBXCmCPraStTSD2gtSG7fJnjh4lg3Zz47SwdzMURI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376482; c=relaxed/simple;
	bh=i/C4xjZJV7MM7p2F3K5MW/w34S6eVG7fOLjtI39UAog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZW1jGfr/9R02U4IOkiup4bNKiOl8LOGpZ/D3sBWwLU+7DKINXk9FZ8galAKNv5B3loSoHa571pB31/4lxvoFm85spHbgfRe8+w2ZADZkhoP+WEMB767ue4HzypkZnrsG7NMCEoR/CG7bLgakMB6FmH8b2szKOMeNUVkO/y7iluQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M71cJW4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M71cJW4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A6E1F0089A
	for <loongarch@lists.linux.dev>; Tue,  2 Jun 2026 05:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780376480;
	bh=M2DPT80aiI3rpTttNGpRNzV1CyPvL3+pwbi7wf8hZLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M71cJW4sEljE0uUvBDFjLZVbYxyXYFkF782s1THQ5Ucyn6gNj34g82DZCvB8V/I8V
	 PQFEPceau/s1Lnqs60/wNcuO/M3vAR5G2ai+a3uuZq2Z8xT9w6hC2gxF6wMAmuo72b
	 l30+C6jwmptx159pAGHGSLUZILes6Z0b0R3tsO/e6BqtiOJjYDcxiS/eV8khbskL/D
	 NpXgEJuznmwckBKDUdpwQKcivVxz7Kz2oEq63tJpuPOMrZKJzig6dCmazopDEFtoaH
	 LUg12QazGkVi3cZzorScUU4F5bgona9jztix/D5h8OeLCR5X/Ae1ufAakl/QuuP/ne
	 HNAoVmd9A0Gvw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bed19623d6eso264125966b.1
        for <loongarch@lists.linux.dev>; Mon, 01 Jun 2026 22:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MKpIu0ksX7ZXVdUM5gmfG9BljabNkzzBURrQ8otnv7YyGbb1KXAchtJJFGuD8Uayz11vPdhGKzy4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGSNVr8LpO4AVRQ7oLyWge21nKOu02vdRDWm0CvsclqtiHNZk4
	xAPICmt/Sr+Y0JJhugdT+nXvut+FZ4SxmNnNYiyqIsQMx0fivHAWNXo5N+WnwiowuyLk0pFsfQ/
	b4mvfz4Dfcq11eOJgVnDGugLqlw9prjs=
X-Received: by 2002:a17:907:501f:b0:bee:215e:5484 with SMTP id
 a640c23a62f3a-bee215eacfcmr209110966b.15.1780376479376; Mon, 01 Jun 2026
 22:01:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526125256.2511876-1-maobibo@loongson.cn> <20260526125256.2511876-4-maobibo@loongson.cn>
 <CAAhV-H5Bkg1MrWr_8YcvCdHWAfX_-WLzdFGukJQVu330LoL5KA@mail.gmail.com> <d5722640-538c-4a97-7dff-bcec91a4c955@loongson.cn>
In-Reply-To: <d5722640-538c-4a97-7dff-bcec91a4c955@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 2 Jun 2026 13:01:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6TfJ8c8SmLZ=9PtGPWWOjSTQD=utHVp5aoEa5ZoO71Cw@mail.gmail.com>
X-Gm-Features: AVHnY4LXl2G9F-N3mKyoPfzwYbgrp4dS5_ZM4uUCvVLK-Vp6RJmru1q9LsbujVA
Message-ID: <CAAhV-H6TfJ8c8SmLZ=9PtGPWWOjSTQD=utHVp5aoEa5ZoO71Cw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] LoongArch: KVM: Use existing macro about interrupt
 bit mask
To: Bibo Mao <maobibo@loongson.cn>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 9:39=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
>
>
> On 2026/6/1 =E4=B8=8B=E5=8D=889:50, Huacai Chen wrote:
> > Hi, Bibo,
> >
> > On Tue, May 26, 2026 at 8:53=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >> With interrupt post, register CSR_GINTC and CSR_ESTAT is used, and
> >> CSR_ESTAT is used for percpu interrupt injection and CSR_GINTC is for
> >> external hardware interrupt injection.
> >>
> >> Here use existing macro about interrupt bit of register CSR_GINTC and
> >> CSR_ESTAT, rather than hard coded constant value.
> >>
> >> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >> ---
> >>   arch/loongarch/include/asm/kvm_vcpu.h | 43 ++++++++++++++++++-------=
--
> >>   1 file changed, 29 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/arch/loongarch/include/asm/kvm_vcpu.h b/arch/loongarch/in=
clude/asm/kvm_vcpu.h
> >> index 3784ab4ccdb5..efe26b04b35f 100644
> >> --- a/arch/loongarch/include/asm/kvm_vcpu.h
> >> +++ b/arch/loongarch/include/asm/kvm_vcpu.h
> >> @@ -10,22 +10,37 @@
> >>   #include <asm/loongarch.h>
> >>
> >>   /* Controlled by 0x5 guest estat */
> >> -#define CPU_SIP0                       (_ULCAST_(1))
> >> -#define CPU_SIP1                       (_ULCAST_(1) << 1)
> >> -#define CPU_PMU                                (_ULCAST_(1) << 10)
> >> -#define CPU_TIMER                      (_ULCAST_(1) << 11)
> >> -#define CPU_IPI                                (_ULCAST_(1) << 12)
> >> -#define CPU_AVEC                        (_ULCAST_(1) << 14)
> >> +#define CPU_SIP0                       BIT(INT_SWI0)
> >> +#define CPU_SIP1                       BIT(INT_SWI1)
> >> +#define CPU_HWI0                       BIT(INT_HWI0)
> >> +#define CPU_HWI1                       BIT(INT_HWI1)
> >> +#define CPU_HWI2                       BIT(INT_HWI2)
> >> +#define CPU_HWI3                       BIT(INT_HWI3)
> >> +#define CPU_HWI4                       BIT(INT_HWI4)
> >> +#define CPU_HWI5                       BIT(INT_HWI5)
> >> +#define CPU_HWI6                       BIT(INT_HWI6)
> >> +#define CPU_HWI7                       BIT(INT_HWI7)
> >> +#define CPU_PMU                                BIT(INT_PCOV)
> >> +#define CPU_TIMER                      BIT(INT_TI)
> >> +#define CPU_IPI                                BIT(INT_IPI)
> >> +#define CPU_AVEC                       BIT(INT_AVEC)
> >> +#define KVM_ESTAT_IRQ_MASK             (CPU_SIP0 | CPU_SIP1 | CPU_PMU=
 | CPU_TIMER \
> >> +                                               | CPU_IPI | CPU_AVEC)
> >> +#define KVM_ESTAT_HWI_MASK             (CPU_HWI0 | CPU_HWI1 | CPU_HWI=
2 | CPU_HWI3 \
> >> +                                               | CPU_HWI4 | CPU_HWI5 =
| CPU_HWI6 | CPU_HWI7)
> >>
> >>   /* Controlled by 0x52 guest exception VIP aligned to estat bit 5~12 =
*/
> >> -#define CPU_IP0                                (_ULCAST_(1))
> >> -#define CPU_IP1                                (_ULCAST_(1) << 1)
> >> -#define CPU_IP2                                (_ULCAST_(1) << 2)
> >> -#define CPU_IP3                                (_ULCAST_(1) << 3)
> >> -#define CPU_IP4                                (_ULCAST_(1) << 4)
> >> -#define CPU_IP5                                (_ULCAST_(1) << 5)
> >> -#define CPU_IP6                                (_ULCAST_(1) << 6)
> >> -#define CPU_IP7                                (_ULCAST_(1) << 7)
> >> +#define GINTC_VIP_DELTA                        (INT_HWI0 - CSR_GINTC_=
VIP_SHIFT)
> > Don't use too many wrappers, just use INT_HWI0 instead of
> > GINTC_VIP_DELTA in this series is perfect. In other places INT_SWI0 is
> > also used for shifts.
>
> The above macro definition is a little complicated, I do not know how to
> optimize it. do you mean remove GINTC_VIP_DELTA just use 2 such as:
> #define CPU_IP0                       BIT(INT_HWI0 - 2)
CSR_GINTC_VIP_SHIFT is 0 and GINTC_VIP_DELTA is equal to INT_HWI0. I
mean remove the GINTC_VIP_DELTA definition and use INT_HWI0 instead.


Huacai

>
> or something like this:
> #define CPU_IP0                       (CPU_HWI0 >> GINTC_VIP_DELTA)
>
> Regards
> Bibo Mao
> >
> >
> > Huacai
> >
> >> +#define CPU_IP0                                BIT(INT_HWI0 - GINTC_V=
IP_DELTA)
> >> +#define CPU_IP1                                BIT(INT_HWI1 - GINTC_V=
IP_DELTA)
> >> +#define CPU_IP2                                BIT(INT_HWI2 - GINTC_V=
IP_DELTA)
> >> +#define CPU_IP3                                BIT(INT_HWI3 - GINTC_V=
IP_DELTA)
> >> +#define CPU_IP4                                BIT(INT_HWI4 - GINTC_V=
IP_DELTA)
> >> +#define CPU_IP5                                BIT(INT_HWI5 - GINTC_V=
IP_DELTA)
> >> +#define CPU_IP6                                BIT(INT_HWI6 - GINTC_V=
IP_DELTA)
> >> +#define CPU_IP7                                BIT(INT_HWI7 - GINTC_V=
IP_DELTA)
> >> +#define KVM_GINTC_IRQ_MASK             (CPU_IP0 | CPU_IP1 | CPU_IP2 |=
 CPU_IP3 \
> >> +                                               | CPU_IP4 | CPU_IP5 | =
CPU_IP6 | CPU_IP7)
> >>
> >>   #define MNSEC_PER_SEC                  (NSEC_PER_SEC >> 20)
> >>
> >> --
> >> 2.39.3
> >>
> >>
>
>
