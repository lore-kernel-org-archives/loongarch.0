Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05891F75A6
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949825; cv=none; b=FypTYLjGDNnBshLY9dD/3NFljIz9I2j0q9qZa9NVryDDxmTuNZ8i/PLGieqTdpbfpM807xPNchrZLr2F8QVzROYzt6pWDH7tfrA+L9BpNJ73XGQCTuf/sZWa20mZUP/0/bU7M0ApZ/a1bsEB6MZLKbkNajw8krmLTlSVFB0OJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949825; c=relaxed/simple;
	bh=qOAvmpn+c/jwvz5i9IjsBVaNjZQF/dL3JQMIT4fXSvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilAQQOXu2KO/HkmVDNiYbZFQ1bjdKeb5/2uH+DG5c8qrE3B5kxu5J0rdSYZkH8Ufsf/fDAwnfwVEGHoGd9iEoXxDjO4bBX0uewB+TkJ3EkS5emnrAgsiCpY2NLVqSD/clkXBKxOpo/9ZRHPo8xgaxc+rvS0/xRVqdgj5VF6/vz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUCPiGeP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUCPiGeP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40964C113D0
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 02:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763949825;
	bh=qOAvmpn+c/jwvz5i9IjsBVaNjZQF/dL3JQMIT4fXSvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WUCPiGeP6R4EXlbmnTeDm9My02FlWypyTBRs1Z76dDtJ3anYUsA+ptVKN9lhBhOKu
	 pbJbEMcCdhyTiJrPVx4a6JonemBaqpRTGWLycOjNJUgHGikCK/T3HaGFJzpCOOUPRy
	 FwSQt/g99DNDfQbcM67pIu1BaL+3TA3Nj5XsCfDOxjiiV1nwbP/ffNVmYvYnlrjrKP
	 hFD3lJXDMbviqWvctnxH3sNJaPRUROgYeRCo8H2D7r+Jza+TGY6vNZ+YYSk5bBrzn3
	 emNQt/7k6zjnUZ8nyhh5lI+Pvcm5PyRyv90YmgheFe2oG50KmfBPzyk6wEh+fnJuZw
	 AaOPDRnNtsWAw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b725ead5800so470350166b.1
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 18:03:45 -0800 (PST)
X-Gm-Message-State: AOJu0YyGUVKpKgL2Flqz3cjOuVOajUpnt7qMijXCBoLM5++k0yECBiQU
	sqw0Ju1iPX/Zo4XAqxpZjDJmBFADHagQ7IDCml40K91H6iQPyalJWPBAU2PGDxIGTcSu2bGrqCl
	gXHVOTaXEGknmFOadbHt6jlpE7CQEgQM=
X-Google-Smtp-Source: AGHT+IFffID/PpotCIRSOlcqE085P54l04QkZfsXePgQk8eyE0WcdEn17/EpAIjKAK8RZOtv/VHFv3iAj2n8lPnXXiM=
X-Received: by 2002:a17:906:fd8e:b0:b73:6b24:14ba with SMTP id
 a640c23a62f3a-b767151b5aemr972942666b.8.1763949823785; Sun, 23 Nov 2025
 18:03:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120065758.3064368-1-maobibo@loongson.cn> <CAAhV-H4FhRHG+Axsb4KEtiyagepJVKyQ80cLN7TNXdCGAzN-KA@mail.gmail.com>
 <42d93855-50df-a686-85c5-5552ff829977@loongson.cn>
In-Reply-To: <42d93855-50df-a686-85c5-5552ff829977@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Nov 2025 10:03:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
X-Gm-Features: AWmQ_bkJTfOn8oYLk88mjKllWNjrLRr-nG2Did020racWctXONqAizm5mFTVbSo
Message-ID: <CAAhV-H4xprj-WmMkp86xEmn4NL3wwW3aaDoMj=SUiP3pEa+Q7g@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM: LoongArch: selftests: Add timer test case
To: Bibo Mao <maobibo@loongson.cn>
Cc: "open list:LOONGARCH" <loongarch@lists.linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 9:58=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
>
>
> On 2025/11/21 =E4=B8=8B=E5=8D=8810:08, Huacai Chen wrote:
> > Hi, Bibo,
> >
> > On Thu, Nov 20, 2025 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >> This patchset adds timer test case for LoongArch system, it is based
> >> on common arch_timer test case. And it includes one-shot and period mo=
de
> >> timer interrupt test, software emulated timer function and time counte=
r
> >> test.
> > I test this series on top of 6.18-rc6 with Loongson-3A5000, sometimes
> > it passes, sometimes I get:
> > [root@fedora kvm]# ./arch_timer
> > Random seed: 0x6b8b4567
> > Guest assert failed,  vcpu 2; stage; 0; iter: 1
> > =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> >    loongarch/arch_timer.c:79: irq_iter =3D=3D 0
> >    pid=3D60138 tid=3D60142 errno=3D4 - Interrupted system call
> >       1  0x00000001200037cf: test_vcpu_run =E4=BA=8E arch_timer.c:70
> >       2  0x00007ffff2449f27: ?? ??:0
> >       3  0x00007ffff24c0633: ?? ??:0
> >    irq_iter =3D 0x1.
> >    Guest period timer interrupt was not triggered within the specified
> >    interval, try to increase the error margin by [-e] option.
> >
> > Is this as expected, or something is wrong?
> There is problem with that. In generic the vCPU task is rescheduled on
> other CPUs or preempted, so period timer interrupt is not handled in
> specified time.
Then this series need to be updated, or problem comes from other places?

Huacai

>
> Regards
> Bibo Mao
> >
> > Hucai
> >
> >> ---
> >> v2 ... v3:
> >>    1. Adjust order about patch 2 and patch 3
> >>    2. Add test case with alphabetical order
> >>    3. Merge one-shot and period timer interrupt test case into one
> >>    4. Only add LoongArch specific modification with common file
> >>       Makefile.kvm
> >>
> >> v1 ... v2:
> >>    1. Restore PC and PRMD after exception handler
> >>    2. Split patch 4 into two small patches with period timer test and
> >>       time counter test
> >>    3. With time counter test, set time count with 0 when create VM. An=
d
> >>       verify time count starts from 0 in guest code
> >> ---
> >> Bibo Mao (6):
> >>    KVM: LoongArch: selftests: Add system registers save and restore on
> >>      exception
> >>    KVM: LoongArch: selftests: Add basic interfaces
> >>    KVM: LoongArch: selftests: Add exception handler register interface
> >>    KVM: LoongArch: selftests: Add timer interrupt test case
> >>    KVM: LoongArch: selftests: Add SW emulated timer test
> >>    KVM: LoongArch: selftests: Add time counter test
> >>
> >>   tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >>   .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
> >>   .../kvm/include/loongarch/processor.h         |  81 +++++++-
> >>   .../selftests/kvm/lib/loongarch/exception.S   |   6 +
> >>   .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
> >>   .../selftests/kvm/loongarch/arch_timer.c      | 194 ++++++++++++++++=
++
> >>   6 files changed, 410 insertions(+), 3 deletions(-)
> >>   create mode 100644 tools/testing/selftests/kvm/include/loongarch/arc=
h_timer.h
> >>   create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.=
c
> >>
> >>
> >> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> >> --
> >> 2.39.3
> >>
>
