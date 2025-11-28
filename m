Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1D1D5ABF
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 02:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295491; cv=none; b=PtQ/tcnqia3EGIn0XK9ZVRF+AHkvKndBVaw2j0CTi7zvalSbsel5NOcejV64VtE3pN2Gbb8opxb0n1YXO56Yplztkyj2XZ9TaoBJi+3tOe4dQA11UcTsDkx+oh8McHQdDBcKXEFQZsZJ4Az2um5sNaNCDSR0jtvk2LtHli+wBkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295491; c=relaxed/simple;
	bh=FQQAQpX0TpVJiOLBnCMxCOli44p/v7jrWCRkwrdGtc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieeDBoUdYZwQb1aZZib9o7UZ2JxqdXj6zQbHMKDWscaONzyb7G1okiWN+lgzS0C2buOErVOutFNQOlj/CLz/8hmyemLIfBJGMZ+0tS8Wz+fwN4RPWWWuXpCDK6doWSpg2I9oSotEG7cVnVGdcL67cpP10uIqkvp9hPD8V9l/ggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XA1cLk9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XA1cLk9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F49C19421
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 02:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764295491;
	bh=FQQAQpX0TpVJiOLBnCMxCOli44p/v7jrWCRkwrdGtc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XA1cLk9hcuEjjLUX2nJ9NLiNbvaPsszZ/cywH+Df6rBkfULy2qQfUeCfi5+ggH5oV
	 QFyBJoIfejRtDtR6v/7o6EzzduUi0L7vvlazWC59J9SuDOp7u08upLXfo6OoiWYrOY
	 g1O/xvAvXxqvKbc4Mo5kIj4q+LXmFqaKxTO+JmueWCxleVsdC52YDps8/oDrW0igEk
	 mrmSzaYIh4eu+QgtNWfHJsNForJ2Ry1b0rxUMnEmxYihmym7WhgZf0Jy3wf6sIIfAV
	 Fczwgo8ipei2b69Boeza5fD0GurYccx3gr15wNk9N6X+9icbrYgsm2WkJOZTIOV3+U
	 eB+OQfA4QmnDQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b735487129fso197462966b.0
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 18:04:51 -0800 (PST)
X-Gm-Message-State: AOJu0YzzBZImb4Ttq4l6xE2DGFr6tpXUmB7Ed/5nZ2+5b30aPLnJmNME
	MOQN7ocrtz+QIEeulAd//zrBE1wa8dFEvh9cXoo49UKY5Q1AS0kAG0RTZJeSAF5xrEZjAvuPn/f
	NYchTxCg5fo3sP2pM9KvJ4vSpV/1N5xI=
X-Google-Smtp-Source: AGHT+IGMTJA313z2hxHLi4vyVpYGrmvvWe5W1kPugvRaFCV9D6sLr1R3i3Db5j9jk61Tfq1XgJbCFCOohppbw50Ss8Q=
X-Received: by 2002:a17:906:b052:b0:b76:8cda:c936 with SMTP id
 a640c23a62f3a-b768cdad168mr1607338866b.36.1764295489536; Thu, 27 Nov 2025
 18:04:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120065758.3064368-1-maobibo@loongson.cn> <CAAhV-H5+suuN7Qf6qx6hVniy2KCnHf2rVPebR4Gxms-SbTz6Fg@mail.gmail.com>
 <0e125e35-8044-a6ce-998f-1221da0e827d@loongson.cn> <CAAhV-H57Ee-KpmYuRLnhOXGsJtBrzHPTqNTW9uj8EkiDUMp3CA@mail.gmail.com>
 <1a3698c8-f31e-fb32-c00a-7372450e6196@loongson.cn> <CAAhV-H7VMAwcdG3LqKL2sdS==G5=ARWtwBcYq65y15+0aWUMtQ@mail.gmail.com>
 <284da6b1-8703-a9d7-f564-236ade3986a8@loongson.cn> <CAAhV-H4phQ-VK0YSip6+-fLwfkLb052fEcQFOATkmQZB73=J8Q@mail.gmail.com>
 <94724535-94cd-c256-2080-f87f70226502@loongson.cn> <CAAhV-H7WEMTJWROBxm1hYNu2PQWZvBg2xTy5ACeO+E3JaZG1FQ@mail.gmail.com>
 <2732fb28-be67-9c7d-9146-e0fd5358f88c@loongson.cn> <CAAhV-H6iyqNU0p0vaWRTNG2iseZUZULgZLAaQ0LNr_HmCL43VQ@mail.gmail.com>
 <bcea143f-fc8e-d40f-3fec-7dfe64bfa0c4@loongson.cn> <CAAhV-H5PxgfbWQDqLr9apUi40kk_V1OWGoHvwceJbFHPa0FH1g@mail.gmail.com>
 <8b99f6a4-cbcb-9249-610a-3adffa966fdc@loongson.cn> <CAAhV-H7h1u4DiYMyWqitxhsBogfen81hOBM5UbrqHFn3+rhO2A@mail.gmail.com>
 <980d4749-ff0b-e618-8008-6d1d62c0acdd@loongson.cn>
In-Reply-To: <980d4749-ff0b-e618-8008-6d1d62c0acdd@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Nov 2025 10:04:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6fobEooN5tWf0nWoyc96sL9VzfAA7BxJz=R7WWDt-k2w@mail.gmail.com>
X-Gm-Features: AWmQ_bm5Uoe7k9RfEun5mSBdBVm8LNs0zhbfMS5WRAz8uV23kQwjo3iSpZhBva8
Message-ID: <CAAhV-H6fobEooN5tWf0nWoyc96sL9VzfAA7BxJz=R7WWDt-k2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 9:11=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2025/11/27 =E4=B8=8B=E5=8D=8810:38, Huacai Chen wrote:
> > On Thu, Nov 27, 2025 at 9:02=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2025/11/27 =E4=B8=8B=E5=8D=883:11, Huacai Chen wrote:
> >>> On Thu, Nov 27, 2025 at 3:03=E2=80=AFPM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/27 =E4=B8=8B=E5=8D=882:54, Huacai Chen wrote:
> >>>>> On Thu, Nov 27, 2025 at 2:48=E2=80=AFPM Bibo Mao <maobibo@loongson.=
cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/11/27 =E4=B8=8B=E5=8D=882:42, Huacai Chen wrote:
> >>>>>>> On Thu, Nov 27, 2025 at 2:21=E2=80=AFPM Bibo Mao <maobibo@loongso=
n.cn> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:51, Huacai Chen wrote:
> >>>>>>>>> On Thu, Nov 27, 2025 at 10:48=E2=80=AFAM Bibo Mao <maobibo@loon=
gson.cn> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:45, Huacai Chen wrote:
> >>>>>>>>>>> On Thu, Nov 27, 2025 at 10:37=E2=80=AFAM Bibo Mao <maobibo@lo=
ongson.cn> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:09, Huacai Chen wrote:
> >>>>>>>>>>>>> On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@l=
oongson.cn> wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> >>>>>>>>>>>>>>> On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobib=
o@loongson.cn> wrote:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote=
:
> >>>>>>>>>>>>>>>>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobi=
bo@loongson.cn> wrote:
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wro=
te:
> >>>>>>>>>>>>>>>>>>> Hi, Bibo,
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <mao=
bibo@loongson.cn> wrote:
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> This patchset adds timer test case for LoongArch sys=
tem, it is based
> >>>>>>>>>>>>>>>>>>>> on common arch_timer test case. And it includes one-=
shot and period mode
> >>>>>>>>>>>>>>>>>>>> timer interrupt test, software emulated timer functi=
on and time counter
> >>>>>>>>>>>>>>>>>>>> test.
> >>>>>>>>>>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3=
A5000, sometimes
> >>>>>>>>>>>>>>>>>>> it passes, sometimes I get:
> >>>>>>>>>>>>>>>>>>> [root@fedora kvm]# ./arch_timer
> >>>>>>>>>>>>>>>>>>> Random seed: 0x6b8b4567
> >>>>>>>>>>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>>>>>>>>>>>>>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>>>>>>>>>>>>>>>             loongarch/arch_timer.c:79: irq_iter =3D=
=3D 0
> >>>>>>>>>>>>>>>>>>>             pid=3D60138 tid=3D60142 errno=3D4 - Inter=
rupted system call
> >>>>>>>>>>>>>>>>>>>                1  0x00000001200037cf: test_vcpu_run =
=E4=BA=8E arch_timer.c:70
> >>>>>>>>>>>>>>>>>>>                2  0x00007ffff2449f27: ?? ??:0
> >>>>>>>>>>>>>>>>>>>                3  0x00007ffff24c0633: ?? ??:0
> >>>>>>>>>>>>>>>>>>>             irq_iter =3D 0x1.
> >>>>>>>>>>>>>>>>>>>             Guest period timer interrupt was not trig=
gered within the specified
> >>>>>>>>>>>>>>>>>>>             interval, try to increase the error margi=
n by [-e] option.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Is this as expected, or something is wrong?
> >>>>>>>>>>>>>>>>>> There is problem with that. In generic the vCPU task i=
s rescheduled on
> >>>>>>>>>>>>>>>>>> other CPUs or preempted, so period timer interrupt is =
not handled in
> >>>>>>>>>>>>>>>>>> specified time.
> >>>>>>>>>>>>>>>>> Then this series need to be updated, or problem comes f=
rom other places?
> >>>>>>>>>>>>>>>> I think this series need be updated, test success criter=
ia with period
> >>>>>>>>>>>>>>>> timer need consider this situation. Let me check how to =
handle this.
> >>>>>>>>>>>>>>> Any updates available?
> >>>>>>>>>>>>>> It can be solved by modifying udelay() method with get_cyc=
les() or using
> >>>>>>>>>>>>>> cpu loop calculation method.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_t=
imer.h
> >>>>>>>>>>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_t=
imer.hYes, no common part for it, but it can be a common problem. If other
> >>>>>>>>>> architectures have problems they should also modify their own
> >>>>>>>>>> __delay(), right?
> >>>>>>>>>>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(v=
oid)
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>          static inline void __delay(uint64_t cycles)
> >>>>>>>>>>>>>>          {
> >>>>>>>>>>>>>> -       uint64_t start =3D timer_get_cycles();
> >>>>>>>>>>>>>> -
> >>>>>>>>>>>>>> -       while ((timer_get_cycles() - start) < cycles)
> >>>>>>>>>>>>>> -               cpu_relax();
> >>>>>>>>>>>>>> +       uint64_t start, next, loops =3D 0;
> >>>>>>>>>>>>>> +
> >>>>>>>>>>>>>> +       start =3D timer_get_cycles();
> >>>>>>>>>>>>>> +       while (loops < cycles) {
> >>>>>>>>>>>>>> +               next =3D timer_get_cycles();
> >>>>>>>>>>>>>> +               /* only count one cycle if VM is preempted=
 */
> >>>>>>>>>>>>>> +               if (next > start) {
> >>>>>>>>>>>>>> +                       loops++;
> >>>>>>>>>>>>>> +                       start =3D next;
> >>>>>>>>>>>>>> +               }
> >>>>>>>>>>>>>> +       }
> >>>>>>>>>>>>>>          }
> >>>>>>>>>>>>> Looks good. But ARM64 and RISC-V also use a simple implemen=
tation of
> >>>>>>>>>>>> there is no period test on them.
> >>>>>>>>>>> I think the one-shot test can also have this problem if the C=
PU is
> >>>>>>>>>>> preempted for a very long time.
> >>>>>>>>>>>
> >>>>>>>>>>>>> __delay(). So should this problem be thought of as a common=
 problem?
> >>>>>>>>>>>>> If yes, maybe we can keep __delay() as is and wait for the =
common
> >>>>>>>>>>>>> parts to be fixed.
> >>>>>>>>>>>> Also there is no common udelay() API, it is arch specific. S=
omeone may
> >>>>>>>>>>>> argue that skipping stolen cycles is not generic for __delay=
(), other
> >>>>>>>>>>>> test cases want accurate cycles rather than skipping stolen =
cycles. It
> >>>>>>>>>>>> is timer test case specific.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Or adding another api __delay_loops() or keep it as is and w=
ait for
> >>>>>>>>>>>> other architectures, there should be no common part for it.
> >>>>>>>>>>> Yes, no common part for it, but it can be a common problem. I=
f other
> >>>>>>>>>>> architectures have problems they should also modify their own
> >>>>>>>>>>> __delay(), right?
> >>>>>>>>>> yes, what to do then?
> >>>>>>>>> Merge window is coming, let's keep it as is. And this problem o=
nly
> >>>>>>>>> exist when the background load is high (so preemption happens e=
asily),
> >>>>>>>>> I think this is not the usual case.
> >>>>>>>> Another method is to modify period timer test case, calling udel=
ay with
> >>>>>>>> loop times rather than one time, something like this:
> >>>>>>>> --- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >>>>>>>> +++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >>>>>>>> @@ -75,7 +75,7 @@ static void guest_test_oneshot_timer(uint32_t =
cpu)
> >>>>>>>>
> >>>>>>>>       static void guest_test_period_timer(uint32_t cpu)
> >>>>>>>>       {
> >>>>>>>> -       uint32_t irq_iter;
> >>>>>>>> +       uint32_t irq_iter, config_iter;
> >>>>>>>>              uint64_t us;
> >>>>>>>>              struct test_vcpu_shared_data *shared_data =3D &vcpu=
_shared_data[cpu];
> >>>>>>>>
> >>>>>>>> @@ -84,7 +84,8 @@ static void guest_test_period_timer(uint32_t c=
pu)
> >>>>>>>>              us =3D msecs_to_usecs(test_args.timer_period_ms) +
> >>>>>>>> test_args.timer_err_margin_us;
> >>>>>>>>              timer_set_next_cmp_ms(test_args.timer_period_ms, tr=
ue);
> >>>>>>>>              /* Setup a timeout for the interrupt to arrive */
> >>>>>>>> -       udelay(us * test_args.nr_iter);
> >>>>>>>> +       for (config_iter =3D 0; config_iter < test_args.nr_iter;
> >>>>>>>> config_iter++)
> >>>>>>>> +               udelay(us);
> >>>>>>> This can reduce the probability but still cause problem if the
> >>>>>>> background CPU load is very high. So I suggest keep it as is.
> >>>>>> If merge window is close, one fix can be post in later.
> >>>>>>
> >>>>>> Even if the background CPU load is high, timer interrupt will happ=
en
> >>>>>> every time udelay() is called. So total times of timer interrupt
> >>>>>> triggered will meet the test case requirements.
> >>>>> I said it only "reduce the probability" because the one-shot test c=
ase
> >>>>> is also observed errors. If we use "retry method" to fix, then
> >>>>> one-shot test case is also needed.
> >>>> one-shot test case has already used split udelay() method. I observe=
d
> >>>> one-shot test case failure on 3D6000 also, it is KVM timer emulation=
 issue.
> >>> Yes, one-shot test case use udelay() in a loop, but it also calls
> >>> __GUEST_ASSERT() in a loop. So it reports errors even if only one of
> >>> udelay() timeouts.
> >> Sorry, I do not understand what is your meaning. what is the problem
> >> with one-shot test case? Do you mean there is problem with one-shot
> >> testcase also?
> > Sorry for confusing description.
> > Yes, one-shot test has problems and the reason is similar to period
> > test, if I understand correctly.
> > 1. The error report comes from __GUEST_ASSERT(), right?
> > 2. The reason of period test error is interrupt hasn't triggered
> > during udelay(), right?
> > 3. For the one-shot test, there is also a udelay() and a
> > __GUEST_ASSERT() in every iteration, right?
> > 4. In any iteration of the loop, if a interrupt hasn't triggered
> > during udelay(), __GUEST_ASSERT() will report errors, right?
> all are right. only that in one loop why a interrupt is not triggered
> during udelay()? is the udelay() too short or other reasons?
>
> If udelay() take longer time than expected, timer interrupt should
> happen between udelay() and  __GUEST_ASSERT(), is that right?
Yes, I think I get the key point. If a VCPU is preempted, then delay()
doesn't return; and if delay() returns, it probably receives timer
interrupt. So split delay() invocations increase the checking times
and reduce failures.

Huacai

>
> Regards
> Bibo Mao
> >
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
> >>>> Well, let's keep it as is for the present.
> >>>>>
> >>>>> Huacai
> >>>>>
> >>>>>>
> >>>>>> Regards
> >>>>>> Bibo Mao
> >>>>>>>
> >>>>>>>
> >>>>>>> Huacai
> >>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Regards
> >>>>>>>> Bibo Mao
> >>>>>>>>>
> >>>>>>>>> Huacai
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Huacai
> >>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Regards
> >>>>>>>>>>>> Bibo Mao
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Regards
> >>>>>>>>>>>>>> Bibo Mao
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Regards
> >>>>>>>>>>>>>>>> Bibo Mao
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Regards
> >>>>>>>>>>>>>>>>>> Bibo Mao
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Hucai
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>>>> v2 ... v3:
> >>>>>>>>>>>>>>>>>>>>             1. Adjust order about patch 2 and patch =
3
> >>>>>>>>>>>>>>>>>>>>             2. Add test case with alphabetical order
> >>>>>>>>>>>>>>>>>>>>             3. Merge one-shot and period timer inter=
rupt test case into one
> >>>>>>>>>>>>>>>>>>>>             4. Only add LoongArch specific modificat=
ion with common file
> >>>>>>>>>>>>>>>>>>>>                Makefile.kvm
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> v1 ... v2:
> >>>>>>>>>>>>>>>>>>>>             1. Restore PC and PRMD after exception h=
andler
> >>>>>>>>>>>>>>>>>>>>             2. Split patch 4 into two small patches =
with period timer test and
> >>>>>>>>>>>>>>>>>>>>                time counter test
> >>>>>>>>>>>>>>>>>>>>             3. With time counter test, set time coun=
t with 0 when create VM. And
> >>>>>>>>>>>>>>>>>>>>                verify time count starts from 0 in gu=
est code
> >>>>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>>>> Bibo Mao (6):
> >>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add system re=
gisters save and restore on
> >>>>>>>>>>>>>>>>>>>>               exception
> >>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add basic int=
erfaces
> >>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add exception=
 handler register interface
> >>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add timer int=
errupt test case
> >>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add SW emulat=
ed timer test
> >>>>>>>>>>>>>>>>>>>>             KVM: LoongArch: selftests: Add time coun=
ter test
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>            tools/testing/selftests/kvm/Makefile.kvm =
     |   1 +
> >>>>>>>>>>>>>>>>>>>>            .../kvm/include/loongarch/arch_timer.h   =
     |  84 ++++++++
> >>>>>>>>>>>>>>>>>>>>            .../kvm/include/loongarch/processor.h    =
     |  81 +++++++-
> >>>>>>>>>>>>>>>>>>>>            .../selftests/kvm/lib/loongarch/exception=
.S   |   6 +
> >>>>>>>>>>>>>>>>>>>>            .../selftests/kvm/lib/loongarch/processor=
.c   |  47 ++++-
> >>>>>>>>>>>>>>>>>>>>            .../selftests/kvm/loongarch/arch_timer.c =
     | 194 ++++++++++++++++++
> >>>>>>>>>>>>>>>>>>>>            6 files changed, 410 insertions(+), 3 del=
etions(-)
> >>>>>>>>>>>>>>>>>>>>            create mode 100644 tools/testing/selftest=
s/kvm/include/loongarch/arch_timer.h
> >>>>>>>>>>>>>>>>>>>>            create mode 100644 tools/testing/selftest=
s/kvm/loongarch/arch_timer.c
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae6=
8
> >>>>>>>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>>>>>>> 2.39.3
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>
> >>>>
> >>
> >>
>
