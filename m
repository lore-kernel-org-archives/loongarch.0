Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB4520A5E5
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209347; cv=none; b=U8hr65Xi03qEFRfoZflofxvRZ9RjePrRNYnvHk1mXlXFer7+fKG3hfnjKL1qxawfeOwrxfISgmZyizKBTij0hb12aE4KS5FMda55uh2wdkjEMrq+GcQhrWJNiWb5EjMAXreL0zk7OMg02CcL0IUs43oBWUc4jgqtaoYbYYEgKi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209347; c=relaxed/simple;
	bh=NuuGyQk6DAnT9aoUQmplnugqL0VKnC6S6YEFUAvNrL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6i3MaWsEXQEt82LL9t1oK33nfKliZytrI7c1RiMcx2HYJWX77y4Le0edJJVNJgdGhHaAX8HKtQpv4lnB+2VZ11OFGnFsJJgb+t/poFkz+pg3dhdR3oZcgnHE6YaHQkF9X51EjFXfVQ76/xHzlWm8mzvoS5gG7A7jPyAO6kqRoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMK+YhRl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMK+YhRl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4590EC16AAE
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764209347;
	bh=NuuGyQk6DAnT9aoUQmplnugqL0VKnC6S6YEFUAvNrL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lMK+YhRlHcaLV86eIeD4PiiaWeTnGK4lmEYUymGmntM6SK+LOwdE9hXxeZB9KGVPp
	 0tbU9po8wk1MfwELQMIHeDX9zFSI2MyHSIqnrYwIJeKq6mm7c8ccWM82dcvnAirFZQ
	 PPuTAYPNzwaB55qlzcN6+QoC0PWihk100N1BCQ9MspaPEaMXdy/+JAYHD+HLN5Oqd5
	 5mfpaCI5JNXHqoFjaphytUa2w3bFunbq9FHCLj79GqAj+KqAmjgdk6B9IeGNo5HtxQ
	 BvWV3ED/nEypEOBA+sU2HXP8BPF/JGFrsuO+Q+qz4fEFOVK8Lr3hlQZ7xPfUrqq22d
	 KnpS6zGQpnkhg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7380f66a8bso59785266b.2
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 18:09:07 -0800 (PST)
X-Gm-Message-State: AOJu0YyTdQJJ4ZOoOBCFKjdA3W8uzHxqyPTDOGVf+OawE7r0JFdkF35y
	cBdA5BiRwccrT9duscUJ2pdiDjQi/4y4GRZHu9DoJ9ekR1NpZQOYCXaJJhIypRxxAui3sdcsrSE
	KOFWfnK3Hmh01HGk5l+R0e3eDV39I/iU=
X-Google-Smtp-Source: AGHT+IEYguKWZZoEFmWsbPfqZ9ek25yuzI0ctT+4W+QRruUUFrirdmVNFJRG1gu7+4HF2g1V/cxAMVSeo4GK69oas/o=
X-Received: by 2002:a17:906:c156:b0:b73:7652:ef9e with SMTP id
 a640c23a62f3a-b7671a28d01mr2395518766b.55.1764209345872; Wed, 26 Nov 2025
 18:09:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120065758.3064368-1-maobibo@loongson.cn> <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
 <42d93855-50df-a686-85c5-5552ff829977@loongson.cn> <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
 <1605b5eb-5f43-62ff-28c5-192f2f0f938d@loongson.cn> <CAAhV-H5+suuN7Qf6qx6hVniy2KCnHf2rVPebR4Gxms-SbTz6Fg@mail.gmail.com>
 <0e125e35-8044-a6ce-998f-1221da0e827d@loongson.cn>
In-Reply-To: <0e125e35-8044-a6ce-998f-1221da0e827d@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 10:09:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H57Ee-KpmYuRLnhOXGsJtBrzHPTqNTW9uj8EkiDUMp3CA@mail.gmail.com>
X-Gm-Features: AWmQ_blAU4jBv84Wqx92R0wyoOUf3wnw4H5JapWzSEEM_3Pk_th22FBLT7Qk88I
Message-ID: <CAAhV-H57Ee-KpmYuRLnhOXGsJtBrzHPTqNTW9uj8EkiDUMp3CA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> > On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@loongson.cn>=
 wrote:
> >>
> >>
> >>
> >> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> >>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> >>>>> Hi, Bibo,
> >>>>>
> >>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loongson.=
cn> wrote:
> >>>>>>
> >>>>>> This patchset adds timer test case for LoongArch system, it is bas=
ed
> >>>>>> on common arch_timer test case. And it includes one-shot and perio=
d mode
> >>>>>> timer interrupt test, software emulated timer function and time co=
unter
> >>>>>> test.
> >>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, sometim=
es
> >>>>> it passes, sometimes I get:
> >>>>> [root@fedora kvm]# ./arch_timer
> >>>>> Random seed: 0x6b8b4567
> >>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>      loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>>>      pid=3D60138 tid=3D60142 errno=3D4 - Interrupted system call
> >>>>>         1  0x00000001200037cf: test_vcpu_run =E4=BA=8E arch_timer.c=
:70
> >>>>>         2  0x00007ffff2449f27: ?? ??:0
> >>>>>         3  0x00007ffff24c0633: ?? ??:0
> >>>>>      irq_iter =3D 0x1.
> >>>>>      Guest period timer interrupt was not triggered within the spec=
ified
> >>>>>      interval, try to increase the error margin by [-e] option.
> >>>>>
> >>>>> Is this as expected, or something is wrong?
> >>>> There is problem with that. In generic the vCPU task is rescheduled =
on
> >>>> other CPUs or preempted, so period timer interrupt is not handled in
> >>>> specified time.
> >>> Then this series need to be updated, or problem comes from other plac=
es?
> >> I think this series need be updated, test success criteria with period
> >> timer need consider this situation. Let me check how to handle this.
> > Any updates available?
> It can be solved by modifying udelay() method with get_cycles() or using
> cpu loop calculation method.
>
> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
>
>   static inline void __delay(uint64_t cycles)
>   {
> -       uint64_t start =3D timer_get_cycles();
> -
> -       while ((timer_get_cycles() - start) < cycles)
> -               cpu_relax();
> +       uint64_t start, next, loops =3D 0;
> +
> +       start =3D timer_get_cycles();
> +       while (loops < cycles) {
> +               next =3D timer_get_cycles();
> +               /* only count one cycle if VM is preempted */
> +               if (next > start) {
> +                       loops++;
> +                       start =3D next;
> +               }
> +       }
>   }
Looks good. But ARM64 and RISC-V also use a simple implementation of
__delay(). So should this problem be thought of as a common problem?
If yes, maybe we can keep __delay() as is and wait for the common
parts to be fixed.

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
> >>>
> >>> Huacai
> >>>
> >>>>
> >>>> Regards
> >>>> Bibo Mao
> >>>>>
> >>>>> Hucai
> >>>>>
> >>>>>> ---
> >>>>>> v2 ... v3:
> >>>>>>      1. Adjust order about patch 2 and patch 3
> >>>>>>      2. Add test case with alphabetical order
> >>>>>>      3. Merge one-shot and period timer interrupt test case into o=
ne
> >>>>>>      4. Only add LoongArch specific modification with common file
> >>>>>>         Makefile.kvm
> >>>>>>
> >>>>>> v1 ... v2:
> >>>>>>      1. Restore PC and PRMD after exception handler
> >>>>>>      2. Split patch 4 into two small patches with period timer tes=
t and
> >>>>>>         time counter test
> >>>>>>      3. With time counter test, set time count with 0 when create =
VM. And
> >>>>>>         verify time count starts from 0 in guest code
> >>>>>> ---
> >>>>>> Bibo Mao (6):
> >>>>>>      KVM: LoongArch: selftests: Add system registers save and rest=
ore on
> >>>>>>        exception
> >>>>>>      KVM: LoongArch: selftests: Add basic interfaces
> >>>>>>      KVM: LoongArch: selftests: Add exception handler register int=
erface
> >>>>>>      KVM: LoongArch: selftests: Add timer interrupt test case
> >>>>>>      KVM: LoongArch: selftests: Add SW emulated timer test
> >>>>>>      KVM: LoongArch: selftests: Add time counter test
> >>>>>>
> >>>>>>     tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >>>>>>     .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
> >>>>>>     .../kvm/include/loongarch/processor.h         |  81 +++++++-
> >>>>>>     .../selftests/kvm/lib/loongarch/exception.S   |   6 +
> >>>>>>     .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
> >>>>>>     .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++=
++++++++
> >>>>>>     6 files changed, 410 insertions(+), 3 deletions(-)
> >>>>>>     create mode 100644 tools/testing/selftests/kvm/include/loongar=
ch/arch_timer.h
> >>>>>>     create mode 100644 tools/testing/selftests/kvm/loongarch/arch_=
timer.c
> >>>>>>
> >>>>>>
> >>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>>>> --
> >>>>>> 2.39.3
> >>>>>>
> >>>>
> >>
>
>
