Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E3F31618F
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227485; cv=none; b=ONVBuTtyw+woXklDtGeUKhzDVdxgK7cD8Kte1P4vL9xKOfAVBh95sgtJ5+4iQNRigZqoyqY51WTQTc8dSRZAava/FBScwEWpdmSs55RSue2VVAv/nPWLS3eFck7aYuxPv4+qCXloM1KAq7QC3OGj+KHlDyl+TeMBy1Aqk7Kh8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227485; c=relaxed/simple;
	bh=dpAQBifQzVRGJfqESO84mzfUTqP+XBJRxFiv67ADYbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3zJ6JZdsmEZLIr2xJPv0Wy+cXxY+f87guv9NO85qHzvUo9V9aBeHtfFvHEUjEdvnBEPHKxXCJmBGknMNw9y4+9kf8e6disPWZct2/HvqBxzJqIyc+Un1jgG/x31MJ1KAJtjfJJH/4cPwmX3l+3A5wB8gxqHMnhmgV9n0qJWyHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3k0duKr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3k0duKr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6002C19421
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 07:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764227484;
	bh=dpAQBifQzVRGJfqESO84mzfUTqP+XBJRxFiv67ADYbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z3k0duKrIWxU4wOTRU/sbE5XpNp/Mtdx/s1Suk/zQyOI36xH+X5PRp8JRdzQB+4Uw
	 UyGoCduYu5vkZVMVbo/jSWhcd7YytmTHkqAJ3i59fBFIdyrKLykwaOB9+I9gf7LgaP
	 307VjAQ+dUxbn4kEVTpOUZ5atIWddxMqNbY7k5bDh3ggNs/do08Gary83rLOeY8HHh
	 e7cJV62NSYM9Sxbe7ed5F0WANZSb+VqMHMzrs/LV88XQAHSOrSTzjolEb4I2z5Ffe4
	 spfvoaYasABGK+sqyPRi3gbhLYVN7H1HeUx/cAIKUlqYh6pn1NP0DUCkszv04m1Kfi
	 k5mGB+IIr33Ug==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b713c7096f9so85934566b.3
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 23:11:24 -0800 (PST)
X-Gm-Message-State: AOJu0YxC+fCWpn98OJpkcyCjtdZk1tbniSppFNUysfpUIuyFQ8ajzFzR
	dZw2e+fYakw5F/HNIfHbARPOssGs/CxXdtztrcXjhJzF3zfc0F/I08jrEA/3Gvz7xwpPfqPJII9
	+rzrzou024PBq2ldkt6IsSvOpS5UZ9II=
X-Google-Smtp-Source: AGHT+IE+FmhrPvmnZC4IctDzr8iquY15ckAt61s00S+Vg5mi/jRmI6Y3cBPyXcLIvIxqmF7ycRAGO6jLKkLKShAI3r8=
X-Received: by 2002:a17:907:d8c:b0:b3b:5fe6:577a with SMTP id
 a640c23a62f3a-b7671549d93mr2134150966b.8.1764227483319; Wed, 26 Nov 2025
 23:11:23 -0800 (PST)
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
 <2732fb28-be67-9c7d-9146-e0fd5358f88c@loongson.cn> <CAAhV-H6iyqNU0p0vaWRTNG2iseZUZULgZLAaQ0LNr_HmCL43VQ@mail.gmail.com>
 <bcea143f-fc8e-d40f-3fec-7dfe64bfa0c4@loongson.cn>
In-Reply-To: <bcea143f-fc8e-d40f-3fec-7dfe64bfa0c4@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 15:11:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5PxgfbWQDqLr9apUi40kk_V1OWGoHvwceJbFHPa0FH1g@mail.gmail.com>
X-Gm-Features: AWmQ_bnbzpplLoCGEUlDhKAfgWCJuvQ_tCS2YtRn2ozqAuoiswpuvFuJV8LuPLc
Message-ID: <CAAhV-H5PxgfbWQDqLr9apUi40kk_V1OWGoHvwceJbFHPa0FH1g@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 3:03=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2025/11/27 =E4=B8=8B=E5=8D=882:54, Huacai Chen wrote:
> > On Thu, Nov 27, 2025 at 2:48=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2025/11/27 =E4=B8=8B=E5=8D=882:42, Huacai Chen wrote:
> >>> On Thu, Nov 27, 2025 at 2:21=E2=80=AFPM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:51, Huacai Chen wrote:
> >>>>> On Thu, Nov 27, 2025 at 10:48=E2=80=AFAM Bibo Mao <maobibo@loongson=
.cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:45, Huacai Chen wrote:
> >>>>>>> On Thu, Nov 27, 2025 at 10:37=E2=80=AFAM Bibo Mao <maobibo@loongs=
on.cn> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2025/11/27 =E4=B8=8A=E5=8D=8810:09, Huacai Chen wrote:
> >>>>>>>>> On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@loong=
son.cn> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> >>>>>>>>>>> On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@lo=
ongson.cn> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> >>>>>>>>>>>>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@l=
oongson.cn> wrote:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> >>>>>>>>>>>>>>> Hi, Bibo,
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo=
@loongson.cn> wrote:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> This patchset adds timer test case for LoongArch system,=
 it is based
> >>>>>>>>>>>>>>>> on common arch_timer test case. And it includes one-shot=
 and period mode
> >>>>>>>>>>>>>>>> timer interrupt test, software emulated timer function a=
nd time counter
> >>>>>>>>>>>>>>>> test.
> >>>>>>>>>>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A500=
0, sometimes
> >>>>>>>>>>>>>>> it passes, sometimes I get:
> >>>>>>>>>>>>>>> [root@fedora kvm]# ./arch_timer
> >>>>>>>>>>>>>>> Random seed: 0x6b8b4567
> >>>>>>>>>>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>>>>>>>>>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>>>>>>>>>>>           loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>>>>>>>>>>>>>           pid=3D60138 tid=3D60142 errno=3D4 - Interrupted=
 system call
> >>>>>>>>>>>>>>>              1  0x00000001200037cf: test_vcpu_run =E4=BA=
=8E arch_timer.c:70
> >>>>>>>>>>>>>>>              2  0x00007ffff2449f27: ?? ??:0
> >>>>>>>>>>>>>>>              3  0x00007ffff24c0633: ?? ??:0
> >>>>>>>>>>>>>>>           irq_iter =3D 0x1.
> >>>>>>>>>>>>>>>           Guest period timer interrupt was not triggered =
within the specified
> >>>>>>>>>>>>>>>           interval, try to increase the error margin by [=
-e] option.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Is this as expected, or something is wrong?
> >>>>>>>>>>>>>> There is problem with that. In generic the vCPU task is re=
scheduled on
> >>>>>>>>>>>>>> other CPUs or preempted, so period timer interrupt is not =
handled in
> >>>>>>>>>>>>>> specified time.
> >>>>>>>>>>>>> Then this series need to be updated, or problem comes from =
other places?
> >>>>>>>>>>>> I think this series need be updated, test success criteria w=
ith period
> >>>>>>>>>>>> timer need consider this situation. Let me check how to hand=
le this.
> >>>>>>>>>>> Any updates available?
> >>>>>>>>>> It can be solved by modifying udelay() method with get_cycles(=
) or using
> >>>>>>>>>> cpu loop calculation method.
> >>>>>>>>>>
> >>>>>>>>>> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer=
.h
> >>>>>>>>>> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer=
.hYes, no common part for it, but it can be a common problem. If other
> >>>>>> architectures have problems they should also modify their own
> >>>>>> __delay(), right?
> >>>>>>>>>> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
> >>>>>>>>>>
> >>>>>>>>>>        static inline void __delay(uint64_t cycles)
> >>>>>>>>>>        {
> >>>>>>>>>> -       uint64_t start =3D timer_get_cycles();
> >>>>>>>>>> -
> >>>>>>>>>> -       while ((timer_get_cycles() - start) < cycles)
> >>>>>>>>>> -               cpu_relax();
> >>>>>>>>>> +       uint64_t start, next, loops =3D 0;
> >>>>>>>>>> +
> >>>>>>>>>> +       start =3D timer_get_cycles();
> >>>>>>>>>> +       while (loops < cycles) {
> >>>>>>>>>> +               next =3D timer_get_cycles();
> >>>>>>>>>> +               /* only count one cycle if VM is preempted */
> >>>>>>>>>> +               if (next > start) {
> >>>>>>>>>> +                       loops++;
> >>>>>>>>>> +                       start =3D next;
> >>>>>>>>>> +               }
> >>>>>>>>>> +       }
> >>>>>>>>>>        }
> >>>>>>>>> Looks good. But ARM64 and RISC-V also use a simple implementati=
on of
> >>>>>>>> there is no period test on them.
> >>>>>>> I think the one-shot test can also have this problem if the CPU i=
s
> >>>>>>> preempted for a very long time.
> >>>>>>>
> >>>>>>>>> __delay(). So should this problem be thought of as a common pro=
blem?
> >>>>>>>>> If yes, maybe we can keep __delay() as is and wait for the comm=
on
> >>>>>>>>> parts to be fixed.
> >>>>>>>> Also there is no common udelay() API, it is arch specific. Someo=
ne may
> >>>>>>>> argue that skipping stolen cycles is not generic for __delay(), =
other
> >>>>>>>> test cases want accurate cycles rather than skipping stolen cycl=
es. It
> >>>>>>>> is timer test case specific.
> >>>>>>>>
> >>>>>>>> Or adding another api __delay_loops() or keep it as is and wait =
for
> >>>>>>>> other architectures, there should be no common part for it.
> >>>>>>> Yes, no common part for it, but it can be a common problem. If ot=
her
> >>>>>>> architectures have problems they should also modify their own
> >>>>>>> __delay(), right?
> >>>>>> yes, what to do then?
> >>>>> Merge window is coming, let's keep it as is. And this problem only
> >>>>> exist when the background load is high (so preemption happens easil=
y),
> >>>>> I think this is not the usual case.
> >>>> Another method is to modify period timer test case, calling udelay w=
ith
> >>>> loop times rather than one time, something like this:
> >>>> --- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >>>> +++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
> >>>> @@ -75,7 +75,7 @@ static void guest_test_oneshot_timer(uint32_t cpu)
> >>>>
> >>>>     static void guest_test_period_timer(uint32_t cpu)
> >>>>     {
> >>>> -       uint32_t irq_iter;
> >>>> +       uint32_t irq_iter, config_iter;
> >>>>            uint64_t us;
> >>>>            struct test_vcpu_shared_data *shared_data =3D &vcpu_share=
d_data[cpu];
> >>>>
> >>>> @@ -84,7 +84,8 @@ static void guest_test_period_timer(uint32_t cpu)
> >>>>            us =3D msecs_to_usecs(test_args.timer_period_ms) +
> >>>> test_args.timer_err_margin_us;
> >>>>            timer_set_next_cmp_ms(test_args.timer_period_ms, true);
> >>>>            /* Setup a timeout for the interrupt to arrive */
> >>>> -       udelay(us * test_args.nr_iter);
> >>>> +       for (config_iter =3D 0; config_iter < test_args.nr_iter;
> >>>> config_iter++)
> >>>> +               udelay(us);
> >>> This can reduce the probability but still cause problem if the
> >>> background CPU load is very high. So I suggest keep it as is.
> >> If merge window is close, one fix can be post in later.
> >>
> >> Even if the background CPU load is high, timer interrupt will happen
> >> every time udelay() is called. So total times of timer interrupt
> >> triggered will meet the test case requirements.
> > I said it only "reduce the probability" because the one-shot test case
> > is also observed errors. If we use "retry method" to fix, then
> > one-shot test case is also needed.
> one-shot test case has already used split udelay() method. I observed
> one-shot test case failure on 3D6000 also, it is KVM timer emulation issu=
e.
Yes, one-shot test case use udelay() in a loop, but it also calls
__GUEST_ASSERT() in a loop. So it reports errors even if only one of
udelay() timeouts.

Huacai

>
> Well, let's keep it as is for the present.
> >
> > Huacai
> >
> >>
> >> Regards
> >> Bibo Mao
> >>>
> >>>
> >>> Huacai
> >>>
> >>>>
> >>>>
> >>>> Regards
> >>>> Bibo Mao
> >>>>>
> >>>>> Huacai
> >>>>>
> >>>>>>
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
> >>>>>>>>>>>>> Huacai
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Regards
> >>>>>>>>>>>>>> Bibo Mao
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Hucai
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>> v2 ... v3:
> >>>>>>>>>>>>>>>>           1. Adjust order about patch 2 and patch 3
> >>>>>>>>>>>>>>>>           2. Add test case with alphabetical order
> >>>>>>>>>>>>>>>>           3. Merge one-shot and period timer interrupt t=
est case into one
> >>>>>>>>>>>>>>>>           4. Only add LoongArch specific modification wi=
th common file
> >>>>>>>>>>>>>>>>              Makefile.kvm
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> v1 ... v2:
> >>>>>>>>>>>>>>>>           1. Restore PC and PRMD after exception handler
> >>>>>>>>>>>>>>>>           2. Split patch 4 into two small patches with p=
eriod timer test and
> >>>>>>>>>>>>>>>>              time counter test
> >>>>>>>>>>>>>>>>           3. With time counter test, set time count with=
 0 when create VM. And
> >>>>>>>>>>>>>>>>              verify time count starts from 0 in guest co=
de
> >>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>> Bibo Mao (6):
> >>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add system register=
s save and restore on
> >>>>>>>>>>>>>>>>             exception
> >>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add basic interface=
s
> >>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add exception handl=
er register interface
> >>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add timer interrupt=
 test case
> >>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add SW emulated tim=
er test
> >>>>>>>>>>>>>>>>           KVM: LoongArch: selftests: Add time counter te=
st
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>          tools/testing/selftests/kvm/Makefile.kvm      |=
   1 +
> >>>>>>>>>>>>>>>>          .../kvm/include/loongarch/arch_timer.h        |=
  84 ++++++++
> >>>>>>>>>>>>>>>>          .../kvm/include/loongarch/processor.h         |=
  81 +++++++-
> >>>>>>>>>>>>>>>>          .../selftests/kvm/lib/loongarch/exception.S   |=
   6 +
> >>>>>>>>>>>>>>>>          .../selftests/kvm/lib/loongarch/processor.c   |=
  47 ++++-
> >>>>>>>>>>>>>>>>          .../selftests/kvm/loongarch/arch_timer.c      |=
 194 ++++++++++++++++++
> >>>>>>>>>>>>>>>>          6 files changed, 410 insertions(+), 3 deletions=
(-)
> >>>>>>>>>>>>>>>>          create mode 100644 tools/testing/selftests/kvm/=
include/loongarch/arch_timer.h
> >>>>>>>>>>>>>>>>          create mode 100644 tools/testing/selftests/kvm/=
loongarch/arch_timer.c
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>>> 2.39.3
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>>>
> >>
>
>
