Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC6B3E1D11
	for <loongarch@lists.linux.dev>; Fri,  8 May 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245458; cv=none; b=RTjEUt9AXMumAlGF1gWXNmsCGEOck8eZIIKhOKPIr9q5ZlfUOQAaPr6BVnKu7lbURmspX0tGaxoWtUg/GBfY0CWgCkQE2VrfmR9D1SvjoqoKMJ8UetDIXnZffV5x53LkDdQaVd/TIs/fOVDByWCOZUDovzZmpGJqGEyVBT5BBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245458; c=relaxed/simple;
	bh=g54pH+gaD1TZqO0excEpJIqIyOnOl+SiwXEpOittxX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sICSTwk9qzKXiWBpTfXRSE4giJmkQxNAcycNCCk4Fij2f4j1r/0VhcSpqGa5TfMJQ+upy0qZKrOXjF2K319UNTm05JgdHSMVdj4HaTj4E16BdV0SVgBMhrG5DDozxZOjmzBYGD141j7T+8DO4ggleZNXm1m1LBeW9froXngKpVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2xkC1hH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2xkC1hH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77386C2BCF5
	for <loongarch@lists.linux.dev>; Fri,  8 May 2026 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778245458;
	bh=g54pH+gaD1TZqO0excEpJIqIyOnOl+SiwXEpOittxX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O2xkC1hHpohmfGe9xgufo+sIkUBAgCjNC1RaaG5HakjrhMh7ifuzEXvJ6Bg4TzbCM
	 nMxGmGfPhDNnkIyUnGxZVCnePFSg207YfK4kYKVNcC+t6hCuexCwx0cFov6teNZHwQ
	 hjbEZfSZSGtdCjr77F3MVXM+8h73mwAxluCLQD1MEoJWqepkXRpgImyhGbl6woW4FI
	 Sf66E9xmCB869zW+37vV+0CyOU3w8t2gvACUOSHJb8X91uTxk4+BauN8p1ogHI7kYd
	 6iRnaupJRbhYd9ySX6JxB+mbKtVycZPbclB6I+WVLLy/dVS6EwlehbnWnstIFgSK5M
	 B/PZplwmiANuQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bc188a20e0aso264476166b.0
        for <loongarch@lists.linux.dev>; Fri, 08 May 2026 06:04:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8a/zvm5+STHX9n828doez9Lmuvp4Mx3iR8SzNWmKu0jSPPbqSv4wMj1ruau9fuvI4M+yYV7zYroFs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7vSTH/vrC66hvwOuRJ5yt6Z9AAwyLtYFVBqR9qiOuqn6V3RAT
	2WKvFR25IoCV2uaJS3H3OgsqJtablPMeQoFpGdGQHepZ03u/d8Rd43B177iD3AETVYkD/Kb8/dE
	oz9X5q3iLN29d/nrtCzruBNmz71jWSI8=
X-Received: by 2002:a17:907:c084:b0:bc6:4ad0:8822 with SMTP id
 a640c23a62f3a-bc64ad08a4dmr585106266b.2.1778245457005; Fri, 08 May 2026
 06:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508013001.4107737-1-maobibo@loongson.cn> <CAAhV-H6dHM0GBFCh-6-q0fM3VSa49RTXSDz+YUvM0j7u_was1g@mail.gmail.com>
 <3d3bb8ea-34b7-b4da-deac-677ac272dd76@loongson.cn> <CAAhV-H44v2TcSAeq+mDiHy26k=mE4ykqjrvPsNurgpw4OhnNTg@mail.gmail.com>
 <076bc4bc-54da-efb6-b1d4-e5e754bb580a@loongson.cn>
In-Reply-To: <076bc4bc-54da-efb6-b1d4-e5e754bb580a@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 8 May 2026 21:04:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7vCF0=_EdahXSeQBu8r65SJ6t3-FCiWh4TxhoaRnXnMg@mail.gmail.com>
X-Gm-Features: AVHnY4L-msiTM-MbCmpdh3CE8QJFgYLPxmmdTkP46TEdC6G8QUpTJ6ObCRoftHU
Message-ID: <CAAhV-H7vCF0=_EdahXSeQBu8r65SJ6t3-FCiWh4TxhoaRnXnMg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Move some variable declaration to file paravirt.h
To: Bibo Mao <maobibo@loongson.cn>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 11:19=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2026/5/8 =E4=B8=8A=E5=8D=8811:11, Huacai Chen wrote:
> > On Fri, May 8, 2026 at 11:08=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2026/5/8 =E4=B8=8A=E5=8D=8810:56, Huacai Chen wrote:
> >>> Hi, Bibo,
> >>>
> >>> On Fri, May 8, 2026 at 9:30=E2=80=AFAM Bibo Mao <maobibo@loongson.cn>=
 wrote:
> >>>>
> >>>> Some variables relative with paravirt feature are declared in header=
 file
> >>>> asm/qspinlock.h, however this file can be included only when option
> >>>> CONFIG_SMP is on. There is compiling warning if CONFIG_SMP is off si=
nce
> >>>> it is not declared.
> >>>>
> >>>> Move these variable declaration to header file asm/paravirt.h to avo=
id
> >>>> compiling warning.
> >>> Have you reproduced the warning? I cannot reproduce it in my
> >>> environment with the config file from lkp report, so I also cannot
> >>> confirm whether it is fixed.
> >> yes, I can reproduce this and it is fixed. The warning is reported fro=
m
> >> sparse tool, rather than LLVM.
> >>>
> >>> Another question:
> >>> Is paravirt.h a better place than kvm_para.h?
> >> en, here kvm_para.h seems better, will send V2 version in next time.
> > Frankly, I don't know the difference between the two files. kvm_para.h
> > is kvm specific and paravirt.h is generic? Or kvm_para.h is the
> > hypervisor side and paravirt.h is the guest side?
> kvm_para.h is shared by hypervisor and guest kernel, paravirt.h is only
> used by guest kernel. And option CONFIG_PARAVIRT is useful with guest
> kernel, CONFIG_PARAVIRT has no much meaning with hypervisor.
If so, paravirt.h seems better to declare these variables.

Huacai

>
> Regards
> Bibo Mao
> >
> > Huacai
> >
> >>
> >> Regards
> >> Bibo Mao
> >>
> >>>
> >>> Huacai
> >>>
> >>>>
> >>>> Fixes: c43dce6f13fb ("LoongArch: KVM: Make vcpu_is_preempted() as a =
macro rather than function")
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Closes: https://lore.kernel.org/oe-kbuild-all/202605061313.O8Hswm2b-=
lkp@intel.com/
> >>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >>>> ---
> >>>>    arch/loongarch/include/asm/paravirt.h  | 4 ++++
> >>>>    arch/loongarch/include/asm/qspinlock.h | 5 +----
> >>>>    2 files changed, 5 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/=
include/asm/paravirt.h
> >>>> index 0111f0ad5f73..dbc64908017f 100644
> >>>> --- a/arch/loongarch/include/asm/paravirt.h
> >>>> +++ b/arch/loongarch/include/asm/paravirt.h
> >>>> @@ -3,6 +3,10 @@
> >>>>    #define _ASM_LOONGARCH_PARAVIRT_H
> >>>>
> >>>>    #ifdef CONFIG_PARAVIRT
> >>>> +#include <linux/jump_label.h>
> >>>> +DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
> >>>> +DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
> >>>> +DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
> >>>>
> >>>>    int __init pv_ipi_init(void);
> >>>>    int __init pv_time_init(void);
> >>>> diff --git a/arch/loongarch/include/asm/qspinlock.h b/arch/loongarch=
/include/asm/qspinlock.h
> >>>> index 0ee15b3b3937..fbfc6be82f26 100644
> >>>> --- a/arch/loongarch/include/asm/qspinlock.h
> >>>> +++ b/arch/loongarch/include/asm/qspinlock.h
> >>>> @@ -3,12 +3,9 @@
> >>>>    #define _ASM_LOONGARCH_QSPINLOCK_H
> >>>>
> >>>>    #include <asm/kvm_para.h>
> >>>> -#include <linux/jump_label.h>
> >>>> +#include <asm/paravirt.h>
> >>>>
> >>>>    #ifdef CONFIG_PARAVIRT
> >>>> -DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
> >>>> -DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
> >>>> -DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
> >>>>
> >>>>    #define virt_spin_lock virt_spin_lock
> >>>>
> >>>>
> >>>> base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
> >>>> --
> >>>> 2.39.3
> >>>>
> >>
>
