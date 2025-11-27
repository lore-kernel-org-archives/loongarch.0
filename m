Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A3333444
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254291; cv=none; b=bqrJSVOpQU00FrvbOu6qIjEfE9KlOlDjmrsIdVTOFzdKotXUzfuaIP/M4/DAwr4g/Bf0zzdXrVukZJ1BUKH1H4efGXbejERiJFOHV1doMF9erUOcoQii8gzjfaaBiw2jC0VHKMonRvGtPOCHOJgn4vux53XwbDb76g/LyXkKiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254291; c=relaxed/simple;
	bh=09D/W3ZQUaZjZcObgIO2L+nE8twIZMRIFhvNY7MGmHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ob5T+vv67T3R7edx1VAmxIZMqIw2FbNeowBkmhIu97tUgZ+ruhwQYdHBLPjLVYl4CcuQVfLB7ZsYmliZN6RS29rmcFvDQVNh6G3y9W0dN6o+Fo8Sn3yZNQ6BjcLMsRSuHkdUwMbahMEM+hYcOEAnZSbWaMv1PkvmIF1vMDDYxyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvL8OFXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvL8OFXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB27C16AAE
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764254291;
	bh=09D/W3ZQUaZjZcObgIO2L+nE8twIZMRIFhvNY7MGmHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fvL8OFXzCgHws5bNHeUQWLGWokuFkax7d8asDmLdztl+uGpO96sIImIF6RJx8zQbF
	 2EGet22ZYfqjLsL+JkL8uxHBffx6q77gRCS3lGRthcbwP8shA9b2EGcajri4FskXvZ
	 Zv3UJzaHnlX+wGftGlAWUAPSXWoTkY0KIaaB5ocYcfTNv6PKdpT1VoF3OgqfDvjD6l
	 seybtacOqR/VRaeGpZ2gH5ef4DWEd7oWYuS2+mAGXBN0sY/K3SH8eRJNQvtKJyEEBX
	 QcTUTeEFG5ILil48ZegIsPDlUjNeT5LYEEQkJI20ipzZwUJ9wN59GBGRqnd1PBNWjQ
	 YEjSAVxs46uyQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso1583083a12.1
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 06:38:11 -0800 (PST)
X-Gm-Message-State: AOJu0YztFHAojOtm6oe91QkSFEcnbxtkxShnqCU6T5a1JxtfFXRYjHo3
	LKRrcsCZb792wa6N1dV+iKXNLjFl7YncwtbhzFYPmRz3w2jshWaXnov+CZLWQnp/N0QIi/ERne5
	mymWKHX3D1DLQ6igBfSKjTCWgQS+s1Xs=
X-Google-Smtp-Source: AGHT+IH69TwjLDxAO/QTOyKjtfNifsFxD77zo6XB6Vo3IZRLl2AuJ4G0Sg5OowbG2e3jXg9JyRk39rKMMupfHbU0/l0=
X-Received: by 2002:a17:907:86a8:b0:b73:9fea:330a with SMTP id
 a640c23a62f3a-b76c53c31ecmr1021653766b.17.1764254289799; Thu, 27 Nov 2025
 06:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120065758.3064368-1-maobibo@loongson.cn> <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
 <1605b5eb-5f43-62ff-28c5-192f2f0f938d@loongson.cn> <CAAhV-H5+suuN7Qf6qx6hVniy2KCnHf2rVPebR4Gxms-SbTz6Fg@mail.gmail.com>
 <0e125e35-8044-a6ce-998f-1221da0e827d@loongson.cn> <CAAhV-H57Ee-KpmYuRLnhOXGsJtBrzHPTqNTW9uj8EkiDUMp3CA@mail.gmail.com>
 <1a3698c8-f31e-fb32-c00a-7372450e6196@loongson.cn> <CAAhV-H7VMAwcdG3LqKL2sdS==G5=ARWtwBcYq65y15+0aWUMtQ@mail.gmail.com>
 <284da6b1-8703-a9d7-f564-236ade3986a8@loongson.cn> <CAAhV-H4phQ-VK0YSip6+-fLwfkLb052fEcQFOATkmQZB73=J8Q@mail.gmail.com>
 <94724535-94cd-c256-2080-f87f70226502@loongson.cn> <CAAhV-H7WEMTJWROBxm1hYNu2PQWZvBg2xTy5ACeO+E3JaZG1FQ@mail.gmail.com>
 <2732fb28-be67-9c7d-9146-e0fd5358f88c@loongson.cn> <CAAhV-H6iyqNU0p0vaWRTNG2iseZUZULgZLAaQ0LNr_HmCL43VQ@mail.gmail.com>
 <bcea143f-fc8e-d40f-3fec-7dfe64bfa0c4@loongson.cn> <CAAhV-H5PxgfbWQDqLr9apUi40kk_V1OWGoHvwceJbFHPa0FH1g@mail.gmail.com>
 <8b99f6a4-cbcb-9249-610a-3adffa966fdc@loongson.cn>
In-Reply-To: <8b99f6a4-cbcb-9249-610a-3adffa966fdc@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 22:38:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7h1u4DiYMyWqitxhsBogfen81hOBM5UbrqHFn3+rhO2A@mail.gmail.com>
X-Gm-Features: AWmQ_bmSqAwlQXpjO6NTNnmEsj2HYz5xupvSr7iVh8osDJMgnzzu5d1VKlHwvvU
Message-ID: <CAAhV-H7h1u4DiYMyWqitxhsBogfen81hOBM5UbrqHFn3+rhO2A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 9:02=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2025/11/27 =E4=B8=8B=E5=8D=883:11, Huacai Chen wrote:
> > On Thu, Nov 27, 2025 at 3:03=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2025/11/27 =E4=B8=8B=E5=8D=882:54, Huacai Chen wrote:
> >>> On Thu, Nov 27, 2025 at 2:48=E2=80=AFPM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/27 =E4=B8=8B=E5=8D=882:42, Huacai Chen wrote:
> >>>>> On Thu, Nov 27, 2025 at 2:21=E2=80=AFPM Bibo Mao <maobibo@loongson.=
cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:51, Huacai Chen wrote:
> >>>>>>> On Thu, Nov 27, 2025 at 10:48=E2=80=AFAM Bibo Mao <maobibo@loongs=
on.cn> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:45, Huacai Chen wrote:
> >>>>>>>>> On Thu, Nov 27, 2025 at 10:37=E2=80=AFAM Bibo Mao <maobibo@loon=
gson.cn> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:09, Huacai Chen wrote:
> >>>>>>>>>>> On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@loo=
ngson.cn> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> >>>>>>>>>>>>> On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@=
loongson.cn> wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> >>>>>>>>>>>>>>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo=
@loongson.cn> wrote:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote=
:
> >>>>>>>>>>>>>>>>> Hi, Bibo,
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobi=
bo@loongson.cn> wrote:
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> This patchset adds timer test case for LoongArch syste=
m, it is based
> >>>>>>>>>>>>>>>>>> on common arch_timer test case. And it includes one-sh=
ot and period mode
> >>>>>>>>>>>>>>>>>> timer interrupt test, software emulated timer function=
 and time counter
> >>>>>>>>>>>>>>>>>> test.
> >>>>>>>>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5=
000, sometimes
> >>>>>>>>>>>>>>>>> it passes, sometimes I get:
> >>>>>>>>>>>>>>>>> [root@fedora kvm]# ./arch_timer
> >>>>>>>>>>>>>>>>> Random seed: 0x6b8b4567
> >>>>>>>>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>>>>>>>>>>>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>>>>>>>>>>>>>            loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>>>>>>>>>>>>>>>            pid=3D60138 tid=3D60142 errno=3D4 - Interrup=
ted system call
> >>>>>>>>>>>>>>>>>               1  0x00000001200037cf: test_vcpu_run =E4=
=BA=8E arch_timer.c:70
> >>>>>>>>>>>>>>>>>               2  0x00007ffff2449f27: ?? ??:0
> >>>>>>>>>>>>>>>>>               3  0x00007ffff24c0633: ?? ??:0
> >>>>>>>>>>>>>>>>>            irq_iter =3D 0x1.
> >>>>>>>>>>>>>>>>>            Guest period timer interrupt was not trigger=
ed within the specified
> >>>>>>>>>>>>>>>>>            interval, try to increase the error margin b=
y [-e] option.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Is this as expected, or something is wrong?
> >>>>>>>>>>>>>>>> There is problem with that. In generic the vCPU task is =
rescheduled on
> >>>>>>>>>>>>>>>> other CPUs or preempted, so period timer interrupt is no=
t handled in
> >>>>>>>>>>>>>>>> specified time.
> >>>>>>>>>>>>>>> Then this series need to be updated, or problem comes fro=
m other places?
> >>>>>>>>>>>>>> I think this series need be updated, test success criteria=
 with period
> >>>>>>>>>>>>>> timer need consider this situation. Let me check how to ha=
ndle this.
> >>>>>>>>>>>>> Any updates available?
> >>>>>>>>>>>> It can be solved by modifying udelay() method with get_cycle=
s() or using
> >>>>>>>>>>>> cpu loop calculation method.
> >>>>>>>>>>>>
> >>>>>>>>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_tim=
er.h
> >>>>>>>>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_tim=
er.hYes, no common part for it, but it can be a common problem. If other
> >>>>>>>> architectures have problems they should also modify their own
> >>>>>>>> __delay(), right?
> >>>>>>>>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(voi=
d)
> >>>>>>>>>>>>
> >>>>>>>>>>>>         static inline void __delay(uint64_t cycles)
> >>>>>>>>>>>>         {
> >>>>>>>>>>>> -       uint64_t start =3D timer_get_cycles();
> >>>>>>>>>>>> -
> >>>>>>>>>>>> -       while ((timer_get_cycles() - start) < cycles)
> >>>>>>>>>>>> -               cpu_relax();
> >>>>>>>>>>>> +       uint64_t start, next, loops =3D 0;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +       start =3D timer_get_cycles();
> >>>>>>>>>>>> +       while (loops < cycles) {
> >>>>>>>>>>>> +               next =3D timer_get_cycles();
> >>>>>>>>>>>> +               /* only count one cycle if VM is preempted *=
/
> >>>>>>>>>>>> +               if (next > start) {
> >>>>>>>>>>>> +                       loops++;
> >>>>>>>>>>>> +                       start =3D next;
> >>>>>>>>>>>> +               }
> >>>>>>>>>>>> +       }
> >>>>>>>>>>>>         }
> >>>>>>>>>>> Looks good. But ARM64 and RISC-V also use a simple implementa=
tion of
> >>>>>>>>>> there is no period test on them.
> >>>>>>>>> I think the one-shot test can also have this problem if the CPU=
 is
> >>>>>>>>> preempted for a very long time.
> >>>>>>>>>
> >>>>>>>>>>> __delay(). So should this problem be thought of as a common p=
roblem?
> >>>>>>>>>>> If yes, maybe we can keep __delay() as is and wait for the co=
mmon
> >>>>>>>>>>> parts to be fixed.
> >>>>>>>>>> Also there is no common udelay() API, it is arch specific. Som=
eone may
> >>>>>>>>>> argue that skipping stolen cycles is not generic for __delay()=
, other
> >>>>>>>>>> test cases want accurate cycles rather than skipping stolen cy=
cles. It
> >>>>>>>>>> is timer test case specific.
> >>>>>>>>>>
> >>>>>>>>>> Or adding another api __delay_loops() or keep it as is and wai=
t for
> >>>>>>>>>> other architectures, there should be no common part for it.
> >>>>>>>>> Yes, no common part for it, but it can be a common problem. If =
other
> >>>>>>>>> architectures have problems they should also modify their own
> >>>>>>>>> __delay(), right?
> >>>>>>>> yes, what to do then?
> >>>>>>> Merge window is coming, let's keep it as is. And this problem onl=
y
> >>>>>>> exist when the background load is high (so preemption happens eas=
ily),
> >>>>>>> I think this is not the usual case.
> >>>>>> Another method is to modify period timer test case, calling udelay=
 with
> >>>>>> loop times rather than one time, something like this:
> >>>>>> --- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >>>>>> +++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >>>>>> @@ -75,7 +75,7 @@ static void guest_test_oneshot_timer(uint32_t cp=
u)
> >>>>>>
> >>>>>>      static void guest_test_period_timer(uint32_t cpu)
> >>>>>>      {
> >>>>>> -       uint32_t irq_iter;
> >>>>>> +       uint32_t irq_iter, config_iter;
> >>>>>>             uint64_t us;
> >>>>>>             struct test_vcpu_shared_data *shared_data =3D &vcpu_sh=
ared_data[cpu];
> >>>>>>
> >>>>>> @@ -84,7 +84,8 @@ static void guest_test_period_timer(uint32_t cpu=
)
> >>>>>>             us =3D msecs_to_usecs(test_args.timer_period_ms) +
> >>>>>> test_args.timer_err_margin_us;
> >>>>>>             timer_set_next_cmp_ms(test_args.timer_period_ms, true)=
;
> >>>>>>             /* Setup a timeout for the interrupt to arrive */
> >>>>>> -       udelay(us * test_args.nr_iter);
> >>>>>> +       for (config_iter =3D 0; config_iter < test_args.nr_iter;
> >>>>>> config_iter++)
> >>>>>> +               udelay(us);
> >>>>> This can reduce the probability but still cause problem if the
> >>>>> background CPU load is very high. So I suggest keep it as is.
> >>>> If merge window is close, one fix can be post in later.
> >>>>
> >>>> Even if the background CPU load is high, timer interrupt will happen
> >>>> every time udelay() is called. So total times of timer interrupt
> >>>> triggered will meet the test case requirements.
> >>> I said it only "reduce the probability" because the one-shot test cas=
e
> >>> is also observed errors. If we use "retry method" to fix, then
> >>> one-shot test case is also needed.
> >> one-shot test case has already used split udelay() method. I observed
> >> one-shot test case failure on 3D6000 also, it is KVM timer emulation i=
ssue.
> > Yes, one-shot test case use udelay() in a loop, but it also calls
> > __GUEST_ASSERT() in a loop. So it reports errors even if only one of
> > udelay() timeouts.
> Sorry, I do not understand what is your meaning. what is the problem
> with one-shot test case? Do you mean there is problem with one-shot
> testcase also?
Sorry for confusing description.
Yes, one-shot test has problems and the reason is similar to period
test, if I understand correctly.
1. The error report comes from __GUEST_ASSERT(), right?
2. The reason of period test error is interrupt hasn't triggered
during udelay(), right?
3. For the one-shot test, there is also a udelay() and a
__GUEST_ASSERT() in every iteration, right?
4. In any iteration of the loop, if a interrupt hasn't triggered
during udelay(), __GUEST_ASSERT() will report errors, right?


Huacai

>
> Regards
> Bibo Mao
> >
> > Huacai
> >
> >>
> >> Well, let's keep it as is for the present.
> >>>
> >>> Huacai
> >>>
> >>>>
> >>>> Regards
> >>>> Bibo Mao
> >>>>>
> >>>>>
> >>>>> Huacai
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> Regards
> >>>>>> Bibo Mao
> >>>>>>>
> >>>>>>> Huacai
> >>>>>>>
> >>>>>>>>
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
> >>>>>>>>>>>>>>>>> Hucai
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>> v2 ... v3:
> >>>>>>>>>>>>>>>>>>            1. Adjust order about patch 2 and patch 3
> >>>>>>>>>>>>>>>>>>            2. Add test case with alphabetical order
> >>>>>>>>>>>>>>>>>>            3. Merge one-shot and period timer interrup=
t test case into one
> >>>>>>>>>>>>>>>>>>            4. Only add LoongArch specific modification=
 with common file
> >>>>>>>>>>>>>>>>>>               Makefile.kvm
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> v1 ... v2:
> >>>>>>>>>>>>>>>>>>            1. Restore PC and PRMD after exception hand=
ler
> >>>>>>>>>>>>>>>>>>            2. Split patch 4 into two small patches wit=
h period timer test and
> >>>>>>>>>>>>>>>>>>               time counter test
> >>>>>>>>>>>>>>>>>>            3. With time counter test, set time count w=
ith 0 when create VM. And
> >>>>>>>>>>>>>>>>>>               verify time count starts from 0 in guest=
 code
> >>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>> Bibo Mao (6):
> >>>>>>>>>>>>>>>>>>            KVM: LoongArch: selftests: Add system regis=
ters save and restore on
> >>>>>>>>>>>>>>>>>>              exception
> >>>>>>>>>>>>>>>>>>            KVM: LoongArch: selftests: Add basic interf=
aces
> >>>>>>>>>>>>>>>>>>            KVM: LoongArch: selftests: Add exception ha=
ndler register interface
> >>>>>>>>>>>>>>>>>>            KVM: LoongArch: selftests: Add timer interr=
upt test case
> >>>>>>>>>>>>>>>>>>            KVM: LoongArch: selftests: Add SW emulated =
timer test
> >>>>>>>>>>>>>>>>>>            KVM: LoongArch: selftests: Add time counter=
 test
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>           tools/testing/selftests/kvm/Makefile.kvm    =
  |   1 +
> >>>>>>>>>>>>>>>>>>           .../kvm/include/loongarch/arch_timer.h      =
  |  84 ++++++++
> >>>>>>>>>>>>>>>>>>           .../kvm/include/loongarch/processor.h       =
  |  81 +++++++-
> >>>>>>>>>>>>>>>>>>           .../selftests/kvm/lib/loongarch/exception.S =
  |   6 +
> >>>>>>>>>>>>>>>>>>           .../selftests/kvm/lib/loongarch/processor.c =
  |  47 ++++-
> >>>>>>>>>>>>>>>>>>           .../selftests/kvm/loongarch/arch_timer.c    =
  | 194 ++++++++++++++++++
> >>>>>>>>>>>>>>>>>>           6 files changed, 410 insertions(+), 3 deleti=
ons(-)
> >>>>>>>>>>>>>>>>>>           create mode 100644 tools/testing/selftests/k=
vm/include/loongarch/arch_timer.h
> >>>>>>>>>>>>>>>>>>           create mode 100644 tools/testing/selftests/k=
vm/loongarch/arch_timer.c
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>>>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>>>>> 2.39.3
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>
> >>
>
>
