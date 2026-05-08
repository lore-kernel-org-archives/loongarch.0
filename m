Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E12571DD
	for <loongarch@lists.linux.dev>; Fri,  8 May 2026 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778209894; cv=none; b=dK9vOveXoKjqY5FvLeIRWLGfbypnaYxpnr14M4uHeL8EHBIwPzP4hHxBha6KjbUqX9/v240SgBLg+w1Blqcn1XfEQHD4KBjQZn7//JJ9YAZbeMX1IyzcdDJG/FjckQaSb7iuN7GVAAZusLA2X4Dvxpucg8+5WLeIU1Els0a6Vkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778209894; c=relaxed/simple;
	bh=htVBWKBkxHHyio/2VdvDtbGDBKymjntMEyshtYOH2rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esUmDP22aUqvvutDqmNIC9cOEWf8KPoUSdbzTgBeGFc/h1eb1fHUKI8wcyxQ/XxeDdU+dM24r/zD6+AJlSq3FoMMbeM66yxS+mfzaNm9f97uDkeapWEKbteBg9b7n8S+xmpyV5JiuiaU0ro9kpnbU4BDSplQz9zxA2b3V5C7Zmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMWex5V0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMWex5V0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BFFC2BCF6
	for <loongarch@lists.linux.dev>; Fri,  8 May 2026 03:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778209894;
	bh=htVBWKBkxHHyio/2VdvDtbGDBKymjntMEyshtYOH2rI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GMWex5V0DcVFJOqEmIw7shQfxBkwmqutTmdyCmya6aVYYNfGT255Wk2njcZI4d7AN
	 z606mNGG3BAebcg+srVDq5IdUrX7nsGwSI+bTfOLPjq2R6gQ7UeJSlKb5ythL1hGcM
	 P1Zu/iDvJhCjabDo/qZlXEh3E3aDgu1aQy347E5NxsRyoFMFBVAaJUkoy3fJUhIuCz
	 DrhDC/YIWCejx6Py4GjpqMFY7b6JnYqdG8qt0lU4rzI5kr7YLjFkiD2nv2UNCSMGGa
	 rQHV4ongppP/R9nSSNyZ/x1QLVX8xwsq1t91ZjVk2P0UBZznbjriXFcLP0nX8rChbt
	 i8xB5FrHV3lNQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so2541632a12.0
        for <loongarch@lists.linux.dev>; Thu, 07 May 2026 20:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fzn+D0qc4uB2Py/dCn4T2TePBvY5yg657J8E8sGic4tKtSZ3m0pfUKm87eqz2kWq7x4gN259FVBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBYnd3I1ZFNnO/lnBY3wS1AQVyGouE1UqlGjZFmZ5HqSpIy+Mf
	DH8/ge7B7bj7TYV7HNEmJRopsOCASYQbx3aChpIW4IGtEJED2uE2NMsk6djSVv2GHrhw6ENvXhL
	WEiRuKkJSIzcdJBo01NFQKFyyUPm4F2c=
X-Received: by 2002:a17:907:d08d:b0:bc6:d873:fd5d with SMTP id
 a640c23a62f3a-bc6d87406c2mr428422466b.44.1778209893174; Thu, 07 May 2026
 20:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508013001.4107737-1-maobibo@loongson.cn> <CAAhV-H6dHM0GBFCh-6-q0fM3VSa49RTXSDz+YUvM0j7u_was1g@mail.gmail.com>
 <3d3bb8ea-34b7-b4da-deac-677ac272dd76@loongson.cn>
In-Reply-To: <3d3bb8ea-34b7-b4da-deac-677ac272dd76@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 8 May 2026 11:11:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H44v2TcSAeq+mDiHy26k=mE4ykqjrvPsNurgpw4OhnNTg@mail.gmail.com>
X-Gm-Features: AVHnY4IKjMpz_D909ZWVd0hm_jjoCyq_EZtofBDsZzl4GEq8WRA6hu-5YAXMoKI
Message-ID: <CAAhV-H44v2TcSAeq+mDiHy26k=mE4ykqjrvPsNurgpw4OhnNTg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Move some variable declaration to file paravirt.h
To: Bibo Mao <maobibo@loongson.cn>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 11:08=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2026/5/8 =E4=B8=8A=E5=8D=8810:56, Huacai Chen wrote:
> > Hi, Bibo,
> >
> > On Fri, May 8, 2026 at 9:30=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> w=
rote:
> >>
> >> Some variables relative with paravirt feature are declared in header f=
ile
> >> asm/qspinlock.h, however this file can be included only when option
> >> CONFIG_SMP is on. There is compiling warning if CONFIG_SMP is off sinc=
e
> >> it is not declared.
> >>
> >> Move these variable declaration to header file asm/paravirt.h to avoid
> >> compiling warning.
> > Have you reproduced the warning? I cannot reproduce it in my
> > environment with the config file from lkp report, so I also cannot
> > confirm whether it is fixed.
> yes, I can reproduce this and it is fixed. The warning is reported from
> sparse tool, rather than LLVM.
> >
> > Another question:
> > Is paravirt.h a better place than kvm_para.h?
> en, here kvm_para.h seems better, will send V2 version in next time.
Frankly, I don't know the difference between the two files. kvm_para.h
is kvm specific and paravirt.h is generic? Or kvm_para.h is the
hypervisor side and paravirt.h is the guest side?

Huacai

>
> Regards
> Bibo Mao
>
> >
> > Huacai
> >
> >>
> >> Fixes: c43dce6f13fb ("LoongArch: KVM: Make vcpu_is_preempted() as a ma=
cro rather than function")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202605061313.O8Hswm2b-lk=
p@intel.com/
> >> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >> ---
> >>   arch/loongarch/include/asm/paravirt.h  | 4 ++++
> >>   arch/loongarch/include/asm/qspinlock.h | 5 +----
> >>   2 files changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/in=
clude/asm/paravirt.h
> >> index 0111f0ad5f73..dbc64908017f 100644
> >> --- a/arch/loongarch/include/asm/paravirt.h
> >> +++ b/arch/loongarch/include/asm/paravirt.h
> >> @@ -3,6 +3,10 @@
> >>   #define _ASM_LOONGARCH_PARAVIRT_H
> >>
> >>   #ifdef CONFIG_PARAVIRT
> >> +#include <linux/jump_label.h>
> >> +DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
> >> +DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
> >> +DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
> >>
> >>   int __init pv_ipi_init(void);
> >>   int __init pv_time_init(void);
> >> diff --git a/arch/loongarch/include/asm/qspinlock.h b/arch/loongarch/i=
nclude/asm/qspinlock.h
> >> index 0ee15b3b3937..fbfc6be82f26 100644
> >> --- a/arch/loongarch/include/asm/qspinlock.h
> >> +++ b/arch/loongarch/include/asm/qspinlock.h
> >> @@ -3,12 +3,9 @@
> >>   #define _ASM_LOONGARCH_QSPINLOCK_H
> >>
> >>   #include <asm/kvm_para.h>
> >> -#include <linux/jump_label.h>
> >> +#include <asm/paravirt.h>
> >>
> >>   #ifdef CONFIG_PARAVIRT
> >> -DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
> >> -DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
> >> -DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
> >>
> >>   #define virt_spin_lock virt_spin_lock
> >>
> >>
> >> base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
> >> --
> >> 2.39.3
> >>
>
