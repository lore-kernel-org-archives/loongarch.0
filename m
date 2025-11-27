Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7482213254
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211884; cv=none; b=kbT+bqAOVkEo5gNn3fULB0ml3xIdBh5Rzk6Sz9CTTD73o/DHCgiaaUetyfqBOY4Qjlctge6+mfYHf2Nj+ZgaGLSOjuRzCIZGU9hEHLtyPTx0CofOleaYCTIGt3FH2G2tEd2X3lHSR1ga7X18zc58VixBBA9I5VNMaa8KE9nuZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211884; c=relaxed/simple;
	bh=C1Wl6idKrMPVzB3TKM0H40GKWWi6PoidTnIz586bxRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqUAqiskFKJv4H6kFmCiXh2EtjHzwshOiFc0UJRUT4VaRSuz6WkVMRmx1kOEmK6CwggSuFocpy7loqsOlx6Hdu2WMuFDECOPTp1JGCur3F97s0kz5EiyVNtumqhDfatlq2DM2qUXArWoFo0dgbSc42IFM8YHCSF6daOwbl+SGME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecbFVsVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecbFVsVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE5DC16AAE
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764211884;
	bh=C1Wl6idKrMPVzB3TKM0H40GKWWi6PoidTnIz586bxRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ecbFVsVvrWMhRzNSVi42+tPo+0xRnSogUzVr2VV+tdC4PIqkybepj5oCBCE9Likx0
	 F+6HRN/K95jTKw1qvPwE3nupqjuNtyABM6CVeyXeugxGl1Oz9oTlig7dfNBEPMW5Ni
	 lvL5XFIHqeib4ubqtyDGqtFsHmeEk68DSncTU4+uIpTR+9vnSvYcxjHprDB0DD4uts
	 XOHM/tpmf9Ktm5RaYAy6OpQDYl1Xvn7O+9OVNH2UESKKsDZ8WkY39JFj3oQ6l+maFI
	 WbORp+cNzdu3Km3KMFKcbZRUWSSKBOASb61DseA0TghJJ4BRBE5YcSBfOAoRxj5Z/w
	 GCwSWYtGjgohw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b76b5afdf04so74649066b.1
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 18:51:24 -0800 (PST)
X-Gm-Message-State: AOJu0YytNk/IQ/GFDCio1g134wKj5J9YHAnqBMMWVlFipzr8hRH8eY/8
	46iNt5i98XTGrBD7GVLbyUapq66PQETH/fkE4Z7pyz398XNLU7MUz/QAHsMMRVdgULR11r74Dtb
	OKQyHAF7a+e5nCNMfgb5lu2KZI3pdQzA=
X-Google-Smtp-Source: AGHT+IGQQ+ZqWUZ4nh6s3kKqBjJWs1CEygh5DR5K1AZyTPcYuLrXPevoYGQlUZMrn8CNf2jZEq0LoHPv+kZLoVvKtRc=
X-Received: by 2002:a17:906:7314:b0:b70:b13c:3622 with SMTP id
 a640c23a62f3a-b7671549d09mr2473252666b.4.1764211882759; Wed, 26 Nov 2025
 18:51:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120065758.3064368-1-maobibo@loongson.cn> <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
 <42d93855-50df-a686-85c5-5552ff829977@loongson.cn> <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
 <1605b5eb-5f43-62ff-28c5-192f2f0f938d@loongson.cn> <CAAhV-H5+suuN7Qf6qx6hVniy2KCnHf2rVPebR4Gxms-SbTz6Fg@mail.gmail.com>
 <0e125e35-8044-a6ce-998f-1221da0e827d@loongson.cn> <CAAhV-H57Ee-KpmYuRLnhOXGsJtBrzHPTqNTW9uj8EkiDUMp3CA@mail.gmail.com>
 <1a3698c8-f31e-fb32-c00a-7372450e6196@loongson.cn> <CAAhV-H7VMAwcdG3LqKL2sdS==G5=ARWtwBcYq65y15+0aWUMtQ@mail.gmail.com>
 <284da6b1-8703-a9d7-f564-236ade3986a8@loongson.cn>
In-Reply-To: <284da6b1-8703-a9d7-f564-236ade3986a8@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 10:51:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4phQ-VK0YSip6+-fLwfkLb052fEcQFOATkmQZB73=J8Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkBf8zN4-K6jPQXYHMmaJoNnYfv1glX16qHKDUL4L3d6WqJEebrWUBfIWE
Message-ID: <CAAhV-H4phQ-VK0YSip6+-fLwfkLb052fEcQFOATkmQZB73=J8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 10:48=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
>
>
> On 2025/11/27 =E4=B8=8A=E5=8D=8810:45, Huacai Chen wrote:
> > On Thu, Nov 27, 2025 at 10:37=E2=80=AFAM Bibo Mao <maobibo@loongson.cn>=
 wrote:
> >>
> >>
> >>
> >> On 2025/11/27 =E4=B8=8A=E5=8D=8810:09, Huacai Chen wrote:
> >>> On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> >>>>> On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@loongson=
.cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> >>>>>>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@loongso=
n.cn> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> >>>>>>>>> Hi, Bibo,
> >>>>>>>>>
> >>>>>>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loong=
son.cn> wrote:
> >>>>>>>>>>
> >>>>>>>>>> This patchset adds timer test case for LoongArch system, it is=
 based
> >>>>>>>>>> on common arch_timer test case. And it includes one-shot and p=
eriod mode
> >>>>>>>>>> timer interrupt test, software emulated timer function and tim=
e counter
> >>>>>>>>>> test.
> >>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, som=
etimes
> >>>>>>>>> it passes, sometimes I get:
> >>>>>>>>> [root@fedora kvm]# ./arch_timer
> >>>>>>>>> Random seed: 0x6b8b4567
> >>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>>>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>>>>>        loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>>>>>>>        pid=3D60138 tid=3D60142 errno=3D4 - Interrupted system c=
all
> >>>>>>>>>           1  0x00000001200037cf: test_vcpu_run =E4=BA=8E arch_t=
imer.c:70
> >>>>>>>>>           2  0x00007ffff2449f27: ?? ??:0
> >>>>>>>>>           3  0x00007ffff24c0633: ?? ??:0
> >>>>>>>>>        irq_iter =3D 0x1.
> >>>>>>>>>        Guest period timer interrupt was not triggered within th=
e specified
> >>>>>>>>>        interval, try to increase the error margin by [-e] optio=
n.
> >>>>>>>>>
> >>>>>>>>> Is this as expected, or something is wrong?
> >>>>>>>> There is problem with that. In generic the vCPU task is reschedu=
led on
> >>>>>>>> other CPUs or preempted, so period timer interrupt is not handle=
d in
> >>>>>>>> specified time.
> >>>>>>> Then this series need to be updated, or problem comes from other =
places?
> >>>>>> I think this series need be updated, test success criteria with pe=
riod
> >>>>>> timer need consider this situation. Let me check how to handle thi=
s.
> >>>>> Any updates available?
> >>>> It can be solved by modifying udelay() method with get_cycles() or u=
sing
> >>>> cpu loop calculation method.
> >>>>
> >>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
> >>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.hYes,=
 no common part for it, but it can be a common problem. If other
> architectures have problems they should also modify their own
> __delay(), right?
> >>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
> >>>>
> >>>>     static inline void __delay(uint64_t cycles)
> >>>>     {
> >>>> -       uint64_t start =3D timer_get_cycles();
> >>>> -
> >>>> -       while ((timer_get_cycles() - start) < cycles)
> >>>> -               cpu_relax();
> >>>> +       uint64_t start, next, loops =3D 0;
> >>>> +
> >>>> +       start =3D timer_get_cycles();
> >>>> +       while (loops < cycles) {
> >>>> +               next =3D timer_get_cycles();
> >>>> +               /* only count one cycle if VM is preempted */
> >>>> +               if (next > start) {
> >>>> +                       loops++;
> >>>> +                       start =3D next;
> >>>> +               }
> >>>> +       }
> >>>>     }
> >>> Looks good. But ARM64 and RISC-V also use a simple implementation of
> >> there is no period test on them.
> > I think the one-shot test can also have this problem if the CPU is
> > preempted for a very long time.
> >
> >>> __delay(). So should this problem be thought of as a common problem?
> >>> If yes, maybe we can keep __delay() as is and wait for the common
> >>> parts to be fixed.
> >> Also there is no common udelay() API, it is arch specific. Someone may
> >> argue that skipping stolen cycles is not generic for __delay(), other
> >> test cases want accurate cycles rather than skipping stolen cycles. It
> >> is timer test case specific.
> >>
> >> Or adding another api __delay_loops() or keep it as is and wait for
> >> other architectures, there should be no common part for it.
> > Yes, no common part for it, but it can be a common problem. If other
> > architectures have problems they should also modify their own
> > __delay(), right?
> yes, what to do then?
Merge window is coming, let's keep it as is. And this problem only
exist when the background load is high (so preemption happens easily),
I think this is not the usual case.

Huacai

>
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
> >>>>> Huacai
> >>>>>
> >>>>>>
> >>>>>> Regards
> >>>>>> Bibo Mao
> >>>>>>>
> >>>>>>> Huacai
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Regards
> >>>>>>>> Bibo Mao
> >>>>>>>>>
> >>>>>>>>> Hucai
> >>>>>>>>>
> >>>>>>>>>> ---
> >>>>>>>>>> v2 ... v3:
> >>>>>>>>>>        1. Adjust order about patch 2 and patch 3
> >>>>>>>>>>        2. Add test case with alphabetical order
> >>>>>>>>>>        3. Merge one-shot and period timer interrupt test case =
into one
> >>>>>>>>>>        4. Only add LoongArch specific modification with common=
 file
> >>>>>>>>>>           Makefile.kvm
> >>>>>>>>>>
> >>>>>>>>>> v1 ... v2:
> >>>>>>>>>>        1. Restore PC and PRMD after exception handler
> >>>>>>>>>>        2. Split patch 4 into two small patches with period tim=
er test and
> >>>>>>>>>>           time counter test
> >>>>>>>>>>        3. With time counter test, set time count with 0 when c=
reate VM. And
> >>>>>>>>>>           verify time count starts from 0 in guest code
> >>>>>>>>>> ---
> >>>>>>>>>> Bibo Mao (6):
> >>>>>>>>>>        KVM: LoongArch: selftests: Add system registers save an=
d restore on
> >>>>>>>>>>          exception
> >>>>>>>>>>        KVM: LoongArch: selftests: Add basic interfaces
> >>>>>>>>>>        KVM: LoongArch: selftests: Add exception handler regist=
er interface
> >>>>>>>>>>        KVM: LoongArch: selftests: Add timer interrupt test cas=
e
> >>>>>>>>>>        KVM: LoongArch: selftests: Add SW emulated timer test
> >>>>>>>>>>        KVM: LoongArch: selftests: Add time counter test
> >>>>>>>>>>
> >>>>>>>>>>       tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >>>>>>>>>>       .../kvm/include/loongarch/arch_timer.h        |  84 ++++=
++++
> >>>>>>>>>>       .../kvm/include/loongarch/processor.h         |  81 ++++=
+++-
> >>>>>>>>>>       .../selftests/kvm/lib/loongarch/exception.S   |   6 +
> >>>>>>>>>>       .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++=
-
> >>>>>>>>>>       .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++=
++++++++++++++
> >>>>>>>>>>       6 files changed, 410 insertions(+), 3 deletions(-)
> >>>>>>>>>>       create mode 100644 tools/testing/selftests/kvm/include/l=
oongarch/arch_timer.h
> >>>>>>>>>>       create mode 100644 tools/testing/selftests/kvm/loongarch=
/arch_timer.c
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>>>>>>>> --
> >>>>>>>>>> 2.39.3
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>
> >>>>
> >>
>
>
