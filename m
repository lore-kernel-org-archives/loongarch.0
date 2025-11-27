Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBDF1F5EA
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 06:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225769; cv=none; b=sLUQa3brv2JogIApaMLOUU55CNPjDKLmAHb0JY+X7BP8GFCcdfGYHMlzr/W0YMCP6korssxQpE0RkL1sVz4utvKh7SYnWxKczzj4ZlVwRL0Z7oqHRj/mk/OLxC5DozHvXiN7Fk7WwDluH920p4UR0wynkTLxSVOVtkt6dlg3HJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225769; c=relaxed/simple;
	bh=w/FQ47PYJ5JIXUADfr/cVa0E0sigv784x0koyS2/4Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4pSjO8BrdF10qAPirl6AQuwgZNV0JwmpVDdQzLIyf0w7JqR+jH9UpajX2GaGA+z/paL3KHaVz5piyW+CnxDbtRSjnYYzLY/+eoV6dkogY+KgPXOzJlPx8yX85vqDw3CKKzolOf/ynsxVlkfeyk8ekZBKOiYwU1BoAxmvO/Mmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MywFSv9Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MywFSv9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EB9C116C6
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764225768;
	bh=w/FQ47PYJ5JIXUADfr/cVa0E0sigv784x0koyS2/4Vg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MywFSv9QzntaPDyg1SqaLAR2MxMZjte4bSkxIWhsDdO/ywaNJ8IvSzbrg8pXDOtie
	 Vxus62piMcrj+mNNYQ+p8Tvsjv3vO8pMowTeDKQxGU1KvrZNNDin5REbyW3uobEDvC
	 gNynTLnG4akGvkuljC1/I7mfX1iV97qJ9woZ/KV4DxYPDonCd3cWFcRhzvnNxBWwKa
	 rjfNSGx9y3m8VVw4Jgwe1dSNEAbshe5ksvWSv1D9alfs4yXrfrggGOSr5s7/R5DjS6
	 2usT7X1P+fmG9odz6nuGG7teSxVVgv0sbSVJAioax6NxEVPCJEBIXdAvJRlVKwPMTZ
	 ohF5pn9VDTwTA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so851616a12.3
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 22:42:48 -0800 (PST)
X-Gm-Message-State: AOJu0YwG7TLFcy3V3ZcDI1tdzGK8JdQlpQemPQjC7oQ+5kGX5aEwgnF3
	0NV/M3TaYRq6KuxLMJzmA1PU84ZNPqYtXcMFXQgfTPxV8S3jCSaDR1s15TSQQuNV0mBlT7VMBwe
	RJRwnyUswa2GBgp7fJAh8C+mWUeAkAbU=
X-Google-Smtp-Source: AGHT+IEVA9JMHHbxY4q6trDbm3JU5eD+nJoL34fmUiZaBmDmkFXlgL9iUYwyBOWQ5bkDo72CYC6UZ27jFjg+LpYWkS8=
X-Received: by 2002:a17:907:3f14:b0:b71:5079:9702 with SMTP id
 a640c23a62f3a-b76715ab943mr2266011366b.21.1764225767116; Wed, 26 Nov 2025
 22:42:47 -0800 (PST)
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
 <94724535-94cd-c256-2080-f87f70226502@loongson.cn>
In-Reply-To: <94724535-94cd-c256-2080-f87f70226502@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 14:42:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7WEMTJWROBxm1hYNu2PQWZvBg2xTy5ACeO+E3JaZG1FQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmskAFLtVEvj__KLWqcT9tBTjs1YGaBFYAo1avWumCw6tTm3q6VoVQKnxw
Message-ID: <CAAhV-H7WEMTJWROBxm1hYNu2PQWZvBg2xTy5ACeO+E3JaZG1FQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 2:21=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
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
> Another method is to modify period timer test case, calling udelay with
> loop times rather than one time, something like this:
> --- a/tools/testing/selftests/kvm/loongarch/arch_timer.c
> +++ b/tools/testing/selftests/kvm/loongarch/arch_timer.c
> @@ -75,7 +75,7 @@ static void guest_test_oneshot_timer(uint32_t cpu)
>
>   static void guest_test_period_timer(uint32_t cpu)
>   {
> -       uint32_t irq_iter;
> +       uint32_t irq_iter, config_iter;
>          uint64_t us;
>          struct test_vcpu_shared_data *shared_data =3D &vcpu_shared_data[=
cpu];
>
> @@ -84,7 +84,8 @@ static void guest_test_period_timer(uint32_t cpu)
>          us =3D msecs_to_usecs(test_args.timer_period_ms) +
> test_args.timer_err_margin_us;
>          timer_set_next_cmp_ms(test_args.timer_period_ms, true);
>          /* Setup a timeout for the interrupt to arrive */
> -       udelay(us * test_args.nr_iter);
> +       for (config_iter =3D 0; config_iter < test_args.nr_iter;
> config_iter++)
> +               udelay(us);
This can reduce the probability but still cause problem if the
background CPU load is very high. So I suggest keep it as is.


Huacai

>
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
>
