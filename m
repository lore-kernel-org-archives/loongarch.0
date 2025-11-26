Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC0328263
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764164621; cv=none; b=EdRA/+hTsst2tYD2vwC8xSytQX30xuvU3ZyIDHctb+uswsFw5bnfCBxv95QQCQQOSmOK7u7CqWqGxWyu/2T/B/oWpPNOEW5AZUKsk4kCdCOGjHsIkNFaGFUdFbxk8CTmHuSLjtZ9dE/aAr2jq4NfLcZwtW4kShg6b0MXkJsjIzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764164621; c=relaxed/simple;
	bh=9UNKSsRzMLg0c1fCALnhi3ADNFNyn5mSSjrIswkosM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4PfxmmeomAVFin5VMvAa4DZxOUcJkT+ziInP+zlz+yzSU2KAobok4/DopH+awz7pCMXvcxrApbKihI46G2Q2VfTJjdxOdG6kspSZoy1VJzCLychsWB0E/Irbkyw6AoGNGtxSsmw9+b4BgxsLMmQjfB+pUsCmgJm1E6onsqABp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNgManwg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNgManwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118C4C116B1
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764164621;
	bh=9UNKSsRzMLg0c1fCALnhi3ADNFNyn5mSSjrIswkosM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sNgManwgtmcG0NdejOVXQxRvrkU2J802lgG+Qo2lRzN2EmAzxenf9gzIf0VBN5r1j
	 vLGE2N932J5e0/4lP+rZoSMbydM/P6w5T6MqVqT9hfE4I0lSWNg3GDOD2RpTVlJ3h9
	 fO/eGhDbBsJprhmCGevIMcpcS9D9wvV7sal0vIDk8ueifanBkmSnF+kTwp32M/qnZX
	 +/5HOezQ2iwtUri5un/EPhCD090OGdfImgxOOR4Kb5+qq3Obq3SMYLcrKKSUK2Up8y
	 7P4vzRlkxbG8cg6ddmTWR3e8pOodPKp22swBgqPaz4vnYjck6tVKmmHu6lAzkyQYm/
	 o5CWIJygKmsaA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7697e8b01aso751683566b.2
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 05:43:41 -0800 (PST)
X-Gm-Message-State: AOJu0YzDHrEZpadIfCV2l7ppKjRZRwVKKA07WDYi6+VWEeO6iVv4bXVn
	gLsiPsQDhzvYR6RjZ5gycOXSscJYucxk0WBp0DZFqEW6GufrQltqbi2ePKeENnh5COwWxKjcD1j
	FPcvJgEnbZbquv1iie7vA8NisDfW0Pbw=
X-Google-Smtp-Source: AGHT+IEcQw/mglCBvW4Rbh5wU94ZdngI1PEIVZdQO9kpXbcYYpwAzcWeTPtyfu0L/jlgSciqZ6v0DVBiCDOEZz3wi/4=
X-Received: by 2002:a17:907:7286:b0:b3d:73e1:d809 with SMTP id
 a640c23a62f3a-b767173270emr2521400966b.48.1764164618317; Wed, 26 Nov 2025
 05:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120065758.3064368-1-maobibo@loongson.cn> <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
 <42d93855-50df-a686-85c5-5552ff829977@loongson.cn> <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
 <1605b5eb-5f43-62ff-28c5-192f2f0f938d@loongson.cn>
In-Reply-To: <1605b5eb-5f43-62ff-28c5-192f2f0f938d@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Nov 2025 21:43:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5+suuN7Qf6qx6hVniy2KCnHf2rVPebR4Gxms-SbTz6Fg@mail.gmail.com>
X-Gm-Features: AWmQ_bmWQgloRaAKKEtC0HoWffLhRqx5jAm0j4k7vEYn1mIzVylEH6s2V8jeuy0
Message-ID: <CAAhV-H5+suuN7Qf6qx6hVniy2KCnHf2rVPebR4Gxms-SbTz6Fg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
>
>
> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> > On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> >>> Hi, Bibo,
> >>>
> >>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>> This patchset adds timer test case for LoongArch system, it is based
> >>>> on common arch_timer test case. And it includes one-shot and period =
mode
> >>>> timer interrupt test, software emulated timer function and time coun=
ter
> >>>> test.
> >>> I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
> >>> it passes, sometimes I get:
> >>> [root@fedora kvm]# ./arch_timer
> >>> Random seed: 0x6b8b4567
> >>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>     loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>     pid=3D60138 tid=3D60142 errno=3D4 - Interrupted system call
> >>>        1  0x00000001200037cf: test_vcpu_run =E4=BA=8E arch_timer.c:70
> >>>        2  0x00007ffff2449f27: ?? ??:0
> >>>        3  0x00007ffff24c0633: ?? ??:0
> >>>     irq_iter =3D 0x1.
> >>>     Guest period timer interrupt was not triggered within the specifi=
ed
> >>>     interval, try to increase the error margin by [-e] option.
> >>>
> >>> Is this as expected, or something is wrong?
> >> There is problem with that. In generic the vCPU task is rescheduled on
> >> other CPUs or preempted, so period timer interrupt is not handled in
> >> specified time.
> > Then this series need to be updated, or problem comes from other places=
?
> I think this series need be updated, test success criteria with period
> timer need consider this situation. Let me check how to handle this.
Any updates available?

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
> >>> Hucai
> >>>
> >>>> ---
> >>>> v2 ... v3:
> >>>>     1. Adjust order about patch 2 and patch 3
> >>>>     2. Add test case with alphabetical order
> >>>>     3. Merge one-shot and period timer interrupt test case into one
> >>>>     4. Only add LoongArch specific modification with common file
> >>>>        Makefile.kvm
> >>>>
> >>>> v1 ... v2:
> >>>>     1. Restore PC and PRMD after exception handler
> >>>>     2. Split patch 4 into two small patches with period timer test a=
nd
> >>>>        time counter test
> >>>>     3. With time counter test, set time count with 0 when create VM.=
 And
> >>>>        verify time count starts from 0 in guest code
> >>>> ---
> >>>> Bibo Mao (6):
> >>>>     KVM: LoongArch: selftests: Add system registers save and restore=
 on
> >>>>       exception
> >>>>     KVM: LoongArch: selftests: Add basic interfaces
> >>>>     KVM: LoongArch: selftests: Add exception handler register interf=
ace
> >>>>     KVM: LoongArch: selftests: Add timer interrupt test case
> >>>>     KVM: LoongArch: selftests: Add SW emulated timer test
> >>>>     KVM: LoongArch: selftests: Add time counter test
> >>>>
> >>>>    tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >>>>    .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
> >>>>    .../kvm/include/loongarch/processor.h         |  81 +++++++-
> >>>>    .../selftests/kvm/lib/loongarch/exception.S   |   6 +
> >>>>    .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
> >>>>    .../selftests/kvm/loongarch/arch_timer.c      | 194 +++++++++++++=
+++++
> >>>>    6 files changed, 410 insertions(+), 3 deletions(-)
> >>>>    create mode 100644 tools/testing/selftests/kvm/include/loongarch/=
arch_timer.h
> >>>>    create mode 100644 tools/testing/selftests/kvm/loongarch/arch_tim=
er.c
> >>>>
> >>>>
> >>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>> --
> >>>> 2.39.3
> >>>>
> >>
>
