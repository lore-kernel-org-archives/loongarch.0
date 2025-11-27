Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02611DF254
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211542; cv=none; b=I+aZtdmmXG9ZWkzcfqtfMy4cotIYh2C4n9ZhbmjARu1LBUCdur4k8+puSVLgTkttXmelJnbJGBnnCvstNxzUc25xtluf2MZMkbxveNDRw3fmnJxf2mhwvuyH91xJy22nvkaFC/yTY4MOYf9W4v7tyfctq3DbDGCB0f/lQnVgBJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211542; c=relaxed/simple;
	bh=uD/N0fMzpAL6teJKDsMOp4Dms2s8BRNv8zh9ISQ7CPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXa5aEtitWrqcNswq/0j1MN+6A+jlGg+J2+6zsjYJb1xSOdScvZxHW7vrrtHFsFFX6Ce9wTKJ60KLoO4qARJsDIkhGu4Df6kVo0mKQvH/+DbhPYPOdBKdWCD7mSr7+4hEDJslAlSsIoDDpDa+0jiq04v1b7CyHDW6Aac68PrJgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZlAMV2p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZlAMV2p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67379C4AF0B
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764211542;
	bh=uD/N0fMzpAL6teJKDsMOp4Dms2s8BRNv8zh9ISQ7CPk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rZlAMV2pegMvqU0UPGlZA7pxreeLYPmgCZG4iilSL9XEhwKcazcmI7iXlUQpsyXsX
	 DK1LTyHcv2bLekFUZC3e7SuCNU5yT2FOIm689Ms7Tw47mCmjYIv2eM57gWW7QBHTEQ
	 MMolKuNklUVla5KCyVpjl9PDwEIGttXiWFoR+4w7ymlr4TyTCZ/6k4BhFa9cANZOON
	 PIaKwouHxu+urBDYQXxEftTNZASxxWdu5mj3R/yRmEXsXKVxyMKjYMt2qVRcT31a96
	 FMPE4ixJ6Wq90in4QOa8c1RVxHQXdscDgf/O1Fz3v5bky6p5PntvtubCyld9LA89Z6
	 BPUsX9J+QoNDA==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b736cd741c1so72035866b.0
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 18:45:42 -0800 (PST)
X-Gm-Message-State: AOJu0YxYbjxOVvJUvVFbW312/g8Z/0uvElefXDKVZr8u9ZFIZWCgjtKB
	mDtb1QdueaRrNRVk5cD4ewCcs3X6GPfgf5vShrIaEkY5MoIiCSekY1kHYRmTBb0LjCmQ7VZqbC3
	4xz4P1ZGhI0y8NTnQh1CjvYjCOOWSSww=
X-Google-Smtp-Source: AGHT+IFaN46jWXu1PQFodRZnON+DiRplNC0NJtFhPRdmMC/JkvVVICUmXgnGB6bZObZa1mEOvZ8D2qQOXemec0gS34w=
X-Received: by 2002:a17:906:c115:b0:b72:b8a9:78f4 with SMTP id
 a640c23a62f3a-b7671701537mr2244353666b.39.1764211540943; Wed, 26 Nov 2025
 18:45:40 -0800 (PST)
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
 <1a3698c8-f31e-fb32-c00a-7372450e6196@loongson.cn>
In-Reply-To: <1a3698c8-f31e-fb32-c00a-7372450e6196@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 10:45:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7VMAwcdG3LqKL2sdS==G5=ARWtwBcYq65y15+0aWUMtQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnnOmaNbqlRKLGFYCd1lo4KJQhWYNruTsdZnVWrTm3ayefnTzVQ4_5S1vE
Message-ID: <CAAhV-H7VMAwcdG3LqKL2sdS==G5=ARWtwBcYq65y15+0aWUMtQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 10:37=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
>
>
> On 2025/11/27 =E4=B8=8A=E5=8D=8810:09, Huacai Chen wrote:
> > On Thu, Nov 27, 2025 at 9:08=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2025/11/26 =E4=B8=8B=E5=8D=889:43, Huacai Chen wrote:
> >>> On Mon, Nov 24, 2025 at 10:17=E2=80=AFAM Bibo Mao <maobibo@loongson.c=
n> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2025/11/24 =E4=B8=8A=E5=8D=8810:03, Huacai Chen wrote:
> >>>>> On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@loongson.=
cn> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> >>>>>>> Hi, Bibo,
> >>>>>>>
> >>>>>>> On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loongso=
n.cn> wrote:
> >>>>>>>>
> >>>>>>>> This patchset adds timer test case for LoongArch system, it is b=
ased
> >>>>>>>> on common arch_timer test case. And it includes one-shot and per=
iod mode
> >>>>>>>> timer interrupt test, software emulated timer function and time =
counter
> >>>>>>>> test.
> >>>>>>> I test this series on top of 6.18-rc6 with Loongson-3A5000, somet=
imes
> >>>>>>> it passes, sometimes I get:
> >>>>>>> [root@fedora kvm]# ./arch_timer
> >>>>>>> Random seed: 0x6b8b4567
> >>>>>>> Guest assert failed,  vcpu 2; stage; 0; iter: 1
> >>>>>>> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >>>>>>>       loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >>>>>>>       pid=3D60138 tid=3D60142 errno=3D4 - Interrupted system call
> >>>>>>>          1  0x00000001200037cf: test_vcpu_run =E4=BA=8E arch_time=
r.c:70
> >>>>>>>          2  0x00007ffff2449f27: ?? ??:0
> >>>>>>>          3  0x00007ffff24c0633: ?? ??:0
> >>>>>>>       irq_iter =3D 0x1.
> >>>>>>>       Guest period timer interrupt was not triggered within the s=
pecified
> >>>>>>>       interval, try to increase the error margin by [-e] option.
> >>>>>>>
> >>>>>>> Is this as expected, or something is wrong?
> >>>>>> There is problem with that. In generic the vCPU task is reschedule=
d on
> >>>>>> other CPUs or preempted, so period timer interrupt is not handled =
in
> >>>>>> specified time.
> >>>>> Then this series need to be updated, or problem comes from other pl=
aces?
> >>>> I think this series need be updated, test success criteria with peri=
od
> >>>> timer need consider this situation. Let me check how to handle this.
> >>> Any updates available?
> >> It can be solved by modifying udelay() method with get_cycles() or usi=
ng
> >> cpu loop calculation method.
> >>
> >> --- a/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
> >> +++ b/tools/testing/selftests/kvm/include/loongarch/arch_timer.h
> >> @@ -71,10 +71,17 @@ static inline void timer_irq_disable(void)
> >>
> >>    static inline void __delay(uint64_t cycles)
> >>    {
> >> -       uint64_t start =3D timer_get_cycles();
> >> -
> >> -       while ((timer_get_cycles() - start) < cycles)
> >> -               cpu_relax();
> >> +       uint64_t start, next, loops =3D 0;
> >> +
> >> +       start =3D timer_get_cycles();
> >> +       while (loops < cycles) {
> >> +               next =3D timer_get_cycles();
> >> +               /* only count one cycle if VM is preempted */
> >> +               if (next > start) {
> >> +                       loops++;
> >> +                       start =3D next;
> >> +               }
> >> +       }
> >>    }
> > Looks good. But ARM64 and RISC-V also use a simple implementation of
> there is no period test on them.
I think the one-shot test can also have this problem if the CPU is
preempted for a very long time.

> > __delay(). So should this problem be thought of as a common problem?
> > If yes, maybe we can keep __delay() as is and wait for the common
> > parts to be fixed.
> Also there is no common udelay() API, it is arch specific. Someone may
> argue that skipping stolen cycles is not generic for __delay(), other
> test cases want accurate cycles rather than skipping stolen cycles. It
> is timer test case specific.
>
> Or adding another api __delay_loops() or keep it as is and wait for
> other architectures, there should be no common part for it.
Yes, no common part for it, but it can be a common problem. If other
architectures have problems they should also modify their own
__delay(), right?

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
> >>>>> Huacai
> >>>>>
> >>>>>>
> >>>>>> Regards
> >>>>>> Bibo Mao
> >>>>>>>
> >>>>>>> Hucai
> >>>>>>>
> >>>>>>>> ---
> >>>>>>>> v2 ... v3:
> >>>>>>>>       1. Adjust order about patch 2 and patch 3
> >>>>>>>>       2. Add test case with alphabetical order
> >>>>>>>>       3. Merge one-shot and period timer interrupt test case int=
o one
> >>>>>>>>       4. Only add LoongArch specific modification with common fi=
le
> >>>>>>>>          Makefile.kvm
> >>>>>>>>
> >>>>>>>> v1 ... v2:
> >>>>>>>>       1. Restore PC and PRMD after exception handler
> >>>>>>>>       2. Split patch 4 into two small patches with period timer =
test and
> >>>>>>>>          time counter test
> >>>>>>>>       3. With time counter test, set time count with 0 when crea=
te VM. And
> >>>>>>>>          verify time count starts from 0 in guest code
> >>>>>>>> ---
> >>>>>>>> Bibo Mao (6):
> >>>>>>>>       KVM: LoongArch: selftests: Add system registers save and r=
estore on
> >>>>>>>>         exception
> >>>>>>>>       KVM: LoongArch: selftests: Add basic interfaces
> >>>>>>>>       KVM: LoongArch: selftests: Add exception handler register =
interface
> >>>>>>>>       KVM: LoongArch: selftests: Add timer interrupt test case
> >>>>>>>>       KVM: LoongArch: selftests: Add SW emulated timer test
> >>>>>>>>       KVM: LoongArch: selftests: Add time counter test
> >>>>>>>>
> >>>>>>>>      tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >>>>>>>>      .../kvm/include/loongarch/arch_timer.h        |  84 +++++++=
+
> >>>>>>>>      .../kvm/include/loongarch/processor.h         |  81 +++++++=
-
> >>>>>>>>      .../selftests/kvm/lib/loongarch/exception.S   |   6 +
> >>>>>>>>      .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
> >>>>>>>>      .../selftests/kvm/loongarch/arch_timer.c      | 194 +++++++=
+++++++++++
> >>>>>>>>      6 files changed, 410 insertions(+), 3 deletions(-)
> >>>>>>>>      create mode 100644 tools/testing/selftests/kvm/include/loon=
garch/arch_timer.h
> >>>>>>>>      create mode 100644 tools/testing/selftests/kvm/loongarch/ar=
ch_timer.c
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >>>>>>>> --
> >>>>>>>> 2.39.3
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> >>
>
