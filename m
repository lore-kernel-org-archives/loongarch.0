Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC8227FD40
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226469; cv=none; b=Ri1RTD+SBXBOHYs5/ReU/TuK/osdE1iMCHAjQejgzKIh+epxAdfibSUjxYfg0u1/0LpatHmgu+H+1F4aOUsFvwXanSiVYL5QbNp27vT8SKBu+yBJWwapBfV3lRsJeYKPrnmmOH8Xs56YVYBP4vSqKNEsIfTvSgmw9Q+mpxGbqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226469; c=relaxed/simple;
	bh=S5qw0P8J/5oiWuDNE16UZ6z2KOlIKj2293UW9uKNUuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iX1Ne6QdKaQnbxbr/aJ/o3hdur4BVt0TQPzCsC/Lcnc1AmLEB+RwPJoYEYIxaYIHtcAg++WjysNAjuc14KteJ9SIY+UfoswEY+K+qSifRem0qnsenhJl1k1iEF5J7p2dkI7XamUM5CvyhMBxsdaBFdL39snaObj6Ijm8aVhSUPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgo5+xgo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgo5+xgo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F541C4CEF8
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764226468;
	bh=S5qw0P8J/5oiWuDNE16UZ6z2KOlIKj2293UW9uKNUuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mgo5+xgoMRcME5NjehqZxSP/7s58+XjYni+/lFAkleODVViw7e6kRbEMOY4o7qdq7
	 cB3O0hUeXNMXGNSsvre4AwHYqfqheN1e52y2T2Y7MASVUYXqaOV0QFgbR5dRohQ08k
	 UDJOEIHGN8SzFhhqyYJekr93ohjK4aXKYqumO8fQd2FYysfEovauLO+y87Zc3fYrIK
	 ILHMnDmC7uWBJYikQ+gqqOyoElmIc3JDdYDENUJyOrAs5NCKGSmmWDkxqaTGEB28b5
	 fx3ejXQQXmxuzi900wsnGeu4Rj4WDet/e73NXO7LKPy4Y1EF7IqQI7dVVgIhgaqszE
	 AlaL7tBIlNqZg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b737c6c13e1so100830166b.3
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 22:54:28 -0800 (PST)
X-Gm-Message-State: AOJu0Ywbl42SCIusFk2G80vJkUJ4Tqv1M8Tv6PRjHMJlzymsly/C7l3z
	qQsX1zfsPohoF3eQnATn9yRdk1u7ddze1lTc7x3zzzHV/Ewc+HnJwl0JxDggMuf7AliHSVfnoEX
	3I2Y+V4VFkW2D5/xWOQJjRmKy8cQ2tvc=
X-Google-Smtp-Source: AGHT+IFaymei9uoxJp1iFiYDx6Vf+C/aWzfhThdGvJjVODVERnv5tso8RYPdf6SOlAakHzY4Oi+Rvzq2Q0nq1HfQshI=
X-Received: by 2002:a17:907:782:b0:b73:6d3c:e0f2 with SMTP id
 a640c23a62f3a-b76c55f538dmr1014278166b.37.1764226467233; Wed, 26 Nov 2025
 22:54:27 -0800 (PST)
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
 <94724535-94cd-c256-2080-f87f70226502@loongson.cn> <CAAhV-H7WEMTJWROBxm1hYNu2PQWZvBg2xTy5ACeO+E3JaZG1FQ@mail.gmail.com>
 <2732fb28-be67-9c7d-9146-e0fd5358f88c@loongson.cn>
In-Reply-To: <2732fb28-be67-9c7d-9146-e0fd5358f88c@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 14:54:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6iyqNU0p0vaWRTNG2iseZUZULgZLAaQ0LNr_HmCL43VQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmdFl45JvcZNYwNf1lREOPQ_b8qd_mFjqI1Kc1VYWYLESnBsXg5shi4_uA
Message-ID: <CAAhV-H6iyqNU0p0vaWRTNG2iseZUZULgZLAaQ0LNr_HmCL43VQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 2:48=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2025/11/27 =E4=B8=8B=E5=8D=882:42, Huacai Chen wrote:
> > On Thu, Nov 27, 2025 at 2:21=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2025/11/27 =E4=B8=8A=E5=8D=8810:51, Huacai Chen wrote:
> >>> On Thu, Nov 27, 2025 at 10:48=E2=80=AFAM Bibo Mao <maobibo@loongson.c=
n> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:45, Huacai Chen wrote:
> >>>>> On Thu, Nov 27, 2025 at 10:37=E2=80=AFAM Bibo Mao <maobibo@loongson=
.cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:09, Huacai Chen wrote:
> >>>>>>> On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@loongso=
n.cn> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> >>>>>>>>> On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@loon=
gson.cn> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> >>>>>>>>>>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@loo=
ngson.cn> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> >>>>>>>>>>>>> Hi, Bibo,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@l=
oongson.cn> wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This patchset adds timer test case for LoongArch system, i=
t is based
> >>>>>>>>>>>>>> on common arch_timer test case. And it includes one-shot a=
nd period mode
> >>>>>>>>>>>>>> timer interrupt test, software emulated timer function and=
 time counter
> >>>>>>>>>>>>>> test.
> >>>>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000,=
 sometimes
> >>>>>>>>>>>>> it passes, sometimes I get:
> >>>>>>>>>>>>> [root@fedora kvm]# ./arch_timer
> >>>>>>>>>>>>> Random seed: 0x6b8b4567
> >>>>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>>>>>>>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>>>>>>>>>          loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>>>>>>>>>>>          pid=3D60138 tid=3D60142 errno=3D4 - Interrupted sy=
stem call
> >>>>>>>>>>>>>             1  0x00000001200037cf: test_vcpu_run =E4=BA=8E =
arch_timer.c:70
> >>>>>>>>>>>>>             2  0x00007ffff2449f27: ?? ??:0
> >>>>>>>>>>>>>             3  0x00007ffff24c0633: ?? ??:0
> >>>>>>>>>>>>>          irq_iter =3D 0x1.
> >>>>>>>>>>>>>          Guest period timer interrupt was not triggered wit=
hin the specified
> >>>>>>>>>>>>>          interval, try to increase the error margin by [-e]=
 option.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Is this as expected, or something is wrong?
> >>>>>>>>>>>> There is problem with that. In generic the vCPU task is resc=
heduled on
> >>>>>>>>>>>> other CPUs or preempted, so period timer interrupt is not ha=
ndled in
> >>>>>>>>>>>> specified time.
> >>>>>>>>>>> Then this series need to be updated, or problem comes from ot=
her places?
> >>>>>>>>>> I think this series need be updated, test success criteria wit=
h period
> >>>>>>>>>> timer need consider this situation. Let me check how to handle=
 this.
> >>>>>>>>> Any updates available?
> >>>>>>>> It can be solved by modifying udelay() method with get_cycles() =
or using
> >>>>>>>> cpu loop calculation method.
> >>>>>>>>
> >>>>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
> >>>>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.h=
Yes, no common part for it, but it can be a common problem. If other
> >>>> architectures have problems they should also modify their own
> >>>> __delay(), right?
> >>>>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
> >>>>>>>>
> >>>>>>>>       static inline void __delay(uint64_t cycles)
> >>>>>>>>       {
> >>>>>>>> -       uint64_t start =3D timer_get_cycles();
> >>>>>>>> -
> >>>>>>>> -       while ((timer_get_cycles() - start) < cycles)
> >>>>>>>> -               cpu_relax();
> >>>>>>>> +       uint64_t start, next, loops =3D 0;
> >>>>>>>> +
> >>>>>>>> +       start =3D timer_get_cycles();
> >>>>>>>> +       while (loops < cycles) {
> >>>>>>>> +               next =3D timer_get_cycles();
> >>>>>>>> +               /* only count one cycle if VM is preempted */
> >>>>>>>> +               if (next > start) {
> >>>>>>>> +                       loops++;
> >>>>>>>> +                       start =3D next;
> >>>>>>>> +               }
> >>>>>>>> +       }
> >>>>>>>>       }
> >>>>>>> Looks good. But ARM64 and RISC-V also use a simple implementation=
 of
> >>>>>> there is no period test on them.
> >>>>> I think the one-shot test can also have this problem if the CPU is
> >>>>> preempted for a very long time.
> >>>>>
> >>>>>>> __delay(). So should this problem be thought of as a common probl=
em?
> >>>>>>> If yes, maybe we can keep __delay() as is and wait for the common
> >>>>>>> parts to be fixed.
> >>>>>> Also there is no common udelay() API, it is arch specific. Someone=
 may
> >>>>>> argue that skipping stolen cycles is not generic for __delay(), ot=
her
> >>>>>> test cases want accurate cycles rather than skipping stolen cycles=
. It
> >>>>>> is timer test case specific.
> >>>>>>
> >>>>>> Or adding another api __delay_loops() or keep it as is and wait fo=
r
> >>>>>> other architectures, there should be no common part for it.
> >>>>> Yes, no common part for it, but it can be a common problem. If othe=
r
> >>>>> architectures have problems they should also modify their own
> >>>>> __delay(), right?
> >>>> yes, what to do then?
> >>> Merge window is coming, let's keep it as is. And this problem only
> >>> exist when the background load is high (so preemption happens easily)=
,
> >>> I think this is not the usual case.
> >> Another method is to modify period timer test case, calling udelay wit=
h
> >> loop times rather than one time, something like this:
> >> --- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >> +++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >> @@ -75,7 +75,7 @@ static void guest_test_oneshot_timer(uint32_t cpu)
> >>
> >>    static void guest_test_period_timer(uint32_t cpu)
> >>    {
> >> -       uint32_t irq_iter;
> >> +       uint32_t irq_iter, config_iter;
> >>           uint64_t us;
> >>           struct test_vcpu_shared_data *shared_data =3D &vcpu_shared_d=
ata[cpu];
> >>
> >> @@ -84,7 +84,8 @@ static void guest_test_period_timer(uint32_t cpu)
> >>           us =3D msecs_to_usecs(test_args.timer_period_ms) +
> >> test_args.timer_err_margin_us;
> >>           timer_set_next_cmp_ms(test_args.timer_period_ms, true);
> >>           /* Setup a timeout for the interrupt to arrive */
> >> -       udelay(us * test_args.nr_iter);
> >> +       for (config_iter =3D 0; config_iter < test_args.nr_iter;
> >> config_iter++)
> >> +               udelay(us);
> > This can reduce the probability but still cause problem if the
> > background CPU load is very high. So I suggest keep it as is.
> If merge window is close, one fix can be post in later.
>
> Even if the background CPU load is high, timer interrupt will happen
> every time udelay() is called. So total times of timer interrupt
> triggered will meet the test case requirements.
I said it only "reduce the probability" because the one-shot test case
is also observed errors. If we use "retry method" to fix, then
one-shot test case is also needed.

Huacai

>
> Regards
> Bibo Mao
> >
> >
> > Huacai
> >
> >>
> >>
> >> Regards
> >> Bibo Mao
> >>>
> >>> Huacai
> >>>
> >>>>
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
> >>>>>>>>>>> Huacai
> >>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Regards
> >>>>>>>>>>>> Bibo Mao
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Hucai
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>> v2 ... v3:
> >>>>>>>>>>>>>>          1. Adjust order about patch 2 and patch 3
> >>>>>>>>>>>>>>          2. Add test case with alphabetical order
> >>>>>>>>>>>>>>          3. Merge one-shot and period timer interrupt test=
 case into one
> >>>>>>>>>>>>>>          4. Only add LoongArch specific modification with =
common file
> >>>>>>>>>>>>>>             Makefile.kvm
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> v1 ... v2:
> >>>>>>>>>>>>>>          1. Restore PC and PRMD after exception handler
> >>>>>>>>>>>>>>          2. Split patch 4 into two small patches with peri=
od timer test and
> >>>>>>>>>>>>>>             time counter test
> >>>>>>>>>>>>>>          3. With time counter test, set time count with 0 =
when create VM. And
> >>>>>>>>>>>>>>             verify time count starts from 0 in guest code
> >>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>> Bibo Mao (6):
> >>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add system registers s=
ave and restore on
> >>>>>>>>>>>>>>            exception
> >>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add basic interfaces
> >>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add exception handler =
register interface
> >>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add timer interrupt te=
st case
> >>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add SW emulated timer =
test
> >>>>>>>>>>>>>>          KVM: LoongArch: selftests: Add time counter test
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>         tools/testing/selftests/kvm/Makefile.kvm      |   =
1 +
> >>>>>>>>>>>>>>         .../kvm/include/loongarch/arch_timer.h        |  8=
4 ++++++++
> >>>>>>>>>>>>>>         .../kvm/include/loongarch/processor.h         |  8=
1 +++++++-
> >>>>>>>>>>>>>>         .../selftests/kvm/lib/loongarch/exception.S   |   =
6 +
> >>>>>>>>>>>>>>         .../selftests/kvm/lib/loongarch/processor.c   |  4=
7 ++++-
> >>>>>>>>>>>>>>         .../selftests/kvm/loongarch/arch_timer.c      | 19=
4 ++++++++++++++++++
> >>>>>>>>>>>>>>         6 files changed, 410 insertions(+), 3 deletions(-)
> >>>>>>>>>>>>>>         create mode 100644 tools/testing/selftests/kvm/inc=
lude/loongarch/arch_timer.h
> >>>>>>>>>>>>>>         create mode 100644 tools/testing/selftests/kvm/loo=
ngarch/arch_timer.c
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>>>>>>>>>>>> --
> >>>>>>>>>>>>>> 2.39.3
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>
> >>>>
> >>
> >>
>
