Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA78EACE
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764212706; cv=none; b=S1i5Mcn0ly8QcIh2gDIX/AQjr/VCLBNwMKTZeDMHztsCn1LdcAOBDLqZ889FynT7U5d7q9mf9CUEpoNMjruy8l+zlwxML0Y7LylIctNb1u7oLwi7qe9JaW3SVsjTxuG0fltPXH+7bJCWNCdkfLty/udhygMIVIoByYVwflr/ZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764212706; c=relaxed/simple;
	bh=J2GD3RZKc5E6KhSw3ghogtN9PtVJgnq6uk9olnwOK+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBbAFoG5eV2uyj0/JGXQ29DPvTqe776+uB1yhTcnQHWNIw/OOsU5OKygxQ6p8HqguUkpnJTUP+Fu0QEIPD1I4d/H6eSUh7s+a+D4/AXT1L0uJHc/C2qeWqjNzqljKh+AljCgxsjsikXanodpkXo/WpZEEEFgGyefodk69AgGZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8DG1EhS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8DG1EhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27827C116B1
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 03:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764212706;
	bh=J2GD3RZKc5E6KhSw3ghogtN9PtVJgnq6uk9olnwOK+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8DG1EhSXTU0cPmULYo942tq1QYL6wT5d4+ZyQp6I/d/ATnxct68v62s+npUs2c+G
	 KlN7QzKGGsesqRbx7Migj27eFoxqxKzLb806nrzKs8weTPFkoY9XPXhrcHutiD9otb
	 vY5Hkr8qhuTBw/2CCELmBLPAqedhSXuzd9dYX1UgJs3AK91oXkIpyH6mB2Qrzh5AUR
	 5H2T4W3PJhCXW1x6KUXTBoGZ9P+js4NKzWo20DkRuI2Th5xpY+6CLVRRIzKxnULmP2
	 B9bysfebzh4MrgiD9Q+BjJe6hWtx++olVjUgqJArKqIyyLsfOxYDzNsyL3BXGb5J60
	 3qLjZI0RRfU1w==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b713c7096f9so65962866b.3
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 19:05:06 -0800 (PST)
X-Gm-Message-State: AOJu0Yw5AucrX5UAukwXZkuu5Z4xm4ajchgjfTzkUpT7ARK4g7MiPwmR
	E+o9MOCWIieiYvPlecwmzqFlu046MBN5h8MJv0R4ymDK6MKRpPe9ljVx0ZexK6DG4UZkDC0TDwa
	v2/EZHrh0H6y3clWc03QvjizN0vrHJd0=
X-Google-Smtp-Source: AGHT+IGVxy8Y4hfpFmJ+kra8dhNd+0QdgvPcMGEZmRvT8Q/7FbNXdt1tsd9HG16nlG/WFSu9RE1y85AB7KNlIuF+SWY=
X-Received: by 2002:a17:906:c144:b0:b73:572d:3aff with SMTP id
 a640c23a62f3a-b767170ca03mr2340095866b.35.1764212704703; Wed, 26 Nov 2025
 19:05:04 -0800 (PST)
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
 <284da6b1-8703-a9d7-f564-236ade3986a8@loongson.cn> <CAAhV-H4phQ-VK0YSip6+-fLwfkLb052fEcQFOATkmQZB73=J8Q@mail.gmail.com>
 <9e19b107-039c-f45a-af26-1ed5df94ced6@loongson.cn>
In-Reply-To: <9e19b107-039c-f45a-af26-1ed5df94ced6@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 11:05:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7xar7+pf-Et+=9G=rEk3yJfvbq5VrGWV=PxEBuUQwEpw@mail.gmail.com>
X-Gm-Features: AWmQ_bk-auqyVvn-_pP8EwcyRcx4hZKLyle7MZtoE06_FFOwgh32eM2sT0WSGCg
Message-ID: <CAAhV-H7xar7+pf-Et+=9G=rEk3yJfvbq5VrGWV=PxEBuUQwEpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 10:54=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
>
>
> On 2025/11/27 =E4=B8=8A=E5=8D=8810:51, Huacai Chen wrote:
> > On Thu, Nov 27, 2025 at 10:48=E2=80=AFAM Bibo Mao <maobibo@loongson.cn>=
 wrote:
> >>
> >>
> >>
> >> On 2025/11/27 =E4=B8=8A=E5=8D=8810:45, Huacai Chen wrote:
> >>> On Thu, Nov 27, 2025 at 10:37=E2=80=AFAM Bibo Mao <maobibo@loongson.c=
n> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:09, Huacai Chen wrote:
> >>>>> On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@loongson.=
cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> >>>>>>> On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@loongs=
on.cn> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> >>>>>>>>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@loong=
son.cn> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> >>>>>>>>>>> Hi, Bibo,
> >>>>>>>>>>>
> >>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loo=
ngson.cn> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> This patchset adds timer test case for LoongArch system, it =
is based
> >>>>>>>>>>>> on common arch_timer test case. And it includes one-shot and=
 period mode
> >>>>>>>>>>>> timer interrupt test, software emulated timer function and t=
ime counter
> >>>>>>>>>>>> test.
> >>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, s=
ometimes
> >>>>>>>>>>> it passes, sometimes I get:
> >>>>>>>>>>> [root@fedora kvm]# ./arch_timer
> >>>>>>>>>>> Random seed: 0x6b8b4567
> >>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>>>>>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>>>>>>>         loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>>>>>>>>>         pid=3D60138 tid=3D60142 errno=3D4 - Interrupted syste=
m call
> >>>>>>>>>>>            1  0x00000001200037cf: test_vcpu_run =E4=BA=8E arc=
h_timer.c:70
> >>>>>>>>>>>            2  0x00007ffff2449f27: ?? ??:0
> >>>>>>>>>>>            3  0x00007ffff24c0633: ?? ??:0
> >>>>>>>>>>>         irq_iter =3D 0x1.
> >>>>>>>>>>>         Guest period timer interrupt was not triggered within=
 the specified
> >>>>>>>>>>>         interval, try to increase the error margin by [-e] op=
tion.
> >>>>>>>>>>>
> >>>>>>>>>>> Is this as expected, or something is wrong?
> >>>>>>>>>> There is problem with that. In generic the vCPU task is resche=
duled on
> >>>>>>>>>> other CPUs or preempted, so period timer interrupt is not hand=
led in
> >>>>>>>>>> specified time.
> >>>>>>>>> Then this series need to be updated, or problem comes from othe=
r places?
> >>>>>>>> I think this series need be updated, test success criteria with =
period
> >>>>>>>> timer need consider this situation. Let me check how to handle t=
his.
> >>>>>>> Any updates available?
> >>>>>> It can be solved by modifying udelay() method with get_cycles() or=
 using
> >>>>>> cpu loop calculation method.
> >>>>>>
> >>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
> >>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.hYe=
s, no common part for it, but it can be a common problem. If other
> >> architectures have problems they should also modify their own
> >> __delay(), right?
> >>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
> >>>>>>
> >>>>>>      static inline void __delay(uint64_t cycles)
> >>>>>>      {
> >>>>>> -       uint64_t start =3D timer_get_cycles();
> >>>>>> -
> >>>>>> -       while ((timer_get_cycles() - start) < cycles)
> >>>>>> -               cpu_relax();
> >>>>>> +       uint64_t start, next, loops =3D 0;
> >>>>>> +
> >>>>>> +       start =3D timer_get_cycles();
> >>>>>> +       while (loops < cycles) {
> >>>>>> +               next =3D timer_get_cycles();
> >>>>>> +               /* only count one cycle if VM is preempted */
> >>>>>> +               if (next > start) {
> >>>>>> +                       loops++;
> >>>>>> +                       start =3D next;
> >>>>>> +               }
> >>>>>> +       }
> >>>>>>      }
> >>>>> Looks good. But ARM64 and RISC-V also use a simple implementation o=
f
> >>>> there is no period test on them.
> >>> I think the one-shot test can also have this problem if the CPU is
> >>> preempted for a very long time.
> >>>
> >>>>> __delay(). So should this problem be thought of as a common problem=
?
> >>>>> If yes, maybe we can keep __delay() as is and wait for the common
> >>>>> parts to be fixed.
> >>>> Also there is no common udelay() API, it is arch specific. Someone m=
ay
> >>>> argue that skipping stolen cycles is not generic for __delay(), othe=
r
> >>>> test cases want accurate cycles rather than skipping stolen cycles. =
It
> >>>> is timer test case specific.
> >>>>
> >>>> Or adding another api __delay_loops() or keep it as is and wait for
> >>>> other architectures, there should be no common part for it.
> >>> Yes, no common part for it, but it can be a common problem. If other
> >>> architectures have problems they should also modify their own
> >>> __delay(), right?
> >> yes, what to do then?
> > Merge window is coming, let's keep it as is. And this problem only
> > exist when the background load is high (so preemption happens easily),
> > I think this is not the usual case.
> I am ok with it. Maybe it can improve in future :)
OK, all kvm patches are here, you can test whether everything works.
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.g=
it/log/?h=3Dloongarch-kvm

And if you want this series be merged together please send V3 asap.
https://lore.kernel.org/loongarch/20251124035402.3817179-1-maobibo@loongson=
.cn/T/#t

Huacai

>
> Regards
> Bibo Mao
> >
> > Huacai
> >
> >>
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
> >>>>>>>>> Huacai
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Regards
> >>>>>>>>>> Bibo Mao
> >>>>>>>>>>>
> >>>>>>>>>>> Hucai
> >>>>>>>>>>>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>> v2 ... v3:
> >>>>>>>>>>>>         1. Adjust order about patch 2 and patch 3
> >>>>>>>>>>>>         2. Add test case with alphabetical order
> >>>>>>>>>>>>         3. Merge one-shot and period timer interrupt test ca=
se into one
> >>>>>>>>>>>>         4. Only add LoongArch specific modification with com=
mon file
> >>>>>>>>>>>>            Makefile.kvm
> >>>>>>>>>>>>
> >>>>>>>>>>>> v1 ... v2:
> >>>>>>>>>>>>         1. Restore PC and PRMD after exception handler
> >>>>>>>>>>>>         2. Split patch 4 into two small patches with period =
timer test and
> >>>>>>>>>>>>            time counter test
> >>>>>>>>>>>>         3. With time counter test, set time count with 0 whe=
n create VM. And
> >>>>>>>>>>>>            verify time count starts from 0 in guest code
> >>>>>>>>>>>> ---
> >>>>>>>>>>>> Bibo Mao (6):
> >>>>>>>>>>>>         KVM: LoongArch: selftests: Add system registers save=
 and restore on
> >>>>>>>>>>>>           exception
> >>>>>>>>>>>>         KVM: LoongArch: selftests: Add basic interfaces
> >>>>>>>>>>>>         KVM: LoongArch: selftests: Add exception handler reg=
ister interface
> >>>>>>>>>>>>         KVM: LoongArch: selftests: Add timer interrupt test =
case
> >>>>>>>>>>>>         KVM: LoongArch: selftests: Add SW emulated timer tes=
t
> >>>>>>>>>>>>         KVM: LoongArch: selftests: Add time counter test
> >>>>>>>>>>>>
> >>>>>>>>>>>>        tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >>>>>>>>>>>>        .../kvm/include/loongarch/arch_timer.h        |  84 +=
+++++++
> >>>>>>>>>>>>        .../kvm/include/loongarch/processor.h         |  81 +=
++++++-
> >>>>>>>>>>>>        .../selftests/kvm/lib/loongarch/exception.S   |   6 +
> >>>>>>>>>>>>        .../selftests/kvm/lib/loongarch/processor.c   |  47 +=
+++-
> >>>>>>>>>>>>        .../selftests/kvm/loongarch/arch_timer.c      | 194 +=
+++++++++++++++++
> >>>>>>>>>>>>        6 files changed, 410 insertions(+), 3 deletions(-)
> >>>>>>>>>>>>        create mode 100644 tools/testing/selftests/kvm/includ=
e/loongarch/arch_timer.h
> >>>>>>>>>>>>        create mode 100644 tools/testing/selftests/kvm/loonga=
rch/arch_timer.c
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>>>>>>>>>> --
> >>>>>>>>>>>> 2.39.3
> >>>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>
> >>
>
