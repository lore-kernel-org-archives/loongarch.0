Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E625B2FA
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775734555; cv=none; b=IiAwYGzwxZn6QLWTinMRa3elj4Z8u1ebVRHRr9lIDXRzdYwIRHHf0HkdkV2QsUgqKfxnocQWQHYujvuymJZt7qPrElXgJKCAM8CqlmlpoOo+nq3jgKSscimXKdPIfEPJRP2PazNcpEC621pLyKoo+FaKp9OwEYGKxvJngjq8c+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775734555; c=relaxed/simple;
	bh=sIcOCyQq+xlX/La640bBSxhUNLrPabIYafMWbHjQRsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvlAkOgVkAIv3PMrNimtJKb0ItGlSIDvtbAWHYQeKYX81wXHLkdppWK1f9HvaGeLbeWuCKohu5Bf/0QV6N6PCM0E7GAp+Dr3zi5w+WJUx05PX17DWn9EEB5PgXPLm80mWmeUGn94eLvDzV7Wp4qfpsJ1PLrTv+Bi2QrZ5CujlL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpuwQvN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpuwQvN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBBBC19424
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775734554;
	bh=sIcOCyQq+xlX/La640bBSxhUNLrPabIYafMWbHjQRsM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mpuwQvN5iTZC2HNfYGeWAFICsg0GNVvccXrHsPLwnSseQvrtdTYqTganJ07tqGEFj
	 D382nINeRK0aD6IAb+evkfCLBsLzKuoqMhuJMHDeXxBcYbA4/jbp51f9QHk3yA0wzQ
	 yALjTkNIPQqK6dXmSV1VPy0d9rBR1kkzAHnrqcVjzNas5oVhs4/1eHNMQ3ZZjupVO4
	 /U7RCYNEjmFDfRuY8sjPKaHE+wtJjvxwdiYjhYVA6i6I2zLDmDi6knCYoJjTctOMd6
	 7uhmabYLvCMtGTBpPlgZBE2B/E/VM2fb8IsfPnZ04oOHrGwQLjH3TenM+3JeWrqAZg
	 8hmSlfPBS92BQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso103197566b.3
        for <loongarch@lists.linux.dev>; Thu, 09 Apr 2026 04:35:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhHMNA3Xsd82eAapek+rLwyG4f8E0JLUmov0EZzPJEgkM5MRN1hGFqjbn1wKH4WPg5H7J5W+iHRjk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo9h6PXjeGbBQl8j8h4pYQFJsbJySuSS0iVijrfu3rBb/WQHjb
	ladY3utkvSQUShTlO2/RyPgQZk1VWT7tmTF2S1ODJoAxnbsiexeBwkWjrQq1fHjl+/exw0wgfpe
	n1zXrC2kD68QKmoXSY+scZvsNMsRthLc=
X-Received: by 2002:a17:907:c912:b0:b9d:424f:1d9e with SMTP id
 a640c23a62f3a-b9d424f23b5mr157179866b.34.1775734553175; Thu, 09 Apr 2026
 04:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409042255.31338-1-cuitao@kylinos.cn> <b616ef68-2dae-0e6c-65d4-72a8d33af690@loongson.cn>
In-Reply-To: <b616ef68-2dae-0e6c-65d4-72a8d33af690@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 9 Apr 2026 19:35:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6GLrO4DfmrYxEi4tdP_9FEXJn3b3-o0nVFwZKOEXnFBA@mail.gmail.com>
X-Gm-Features: AQROBzDnl-AD2N2D8OtHwQXW2YLu5L7cYJn6lB8H67BWGQ_AAnbkM2odrVilRws
Message-ID: <CAAhV-H6GLrO4DfmrYxEi4tdP_9FEXJn3b3-o0nVFwZKOEXnFBA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch/KVM: Use CSR_CRMD_PLV instead of CSR_PRMD_PPLV
 in kvm_arch_vcpu_in_kernel
To: Bibo Mao <maobibo@loongson.cn>
Cc: cuitao <cuitao@kylinos.cn>, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, 
	kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 2:35=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
>
>
> On 2026/4/9 =E4=B8=8B=E5=8D=8812:22, cuitao wrote:
> > The function reads LOONGARCH_CSR_CRMD but uses CSR_PRMD_PPLV to
> > extract the privilege level. While both masks have the same value
> > (0x3), CSR_CRMD_PLV is the semantically correct constant for CRMD.
> >
> > Signed-off-by: cuitao <cuitao@kylinos.cn>
> > ---
> >   arch/loongarch/kvm/vcpu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> > index 831f381a8fd1..ed2cfcd76f60 100644
> > --- a/arch/loongarch/kvm/vcpu.c
> > +++ b/arch/loongarch/kvm/vcpu.c
> > @@ -402,7 +402,7 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
> >       val =3D gcsr_read(LOONGARCH_CSR_CRMD);
> >       preempt_enable();
> >
> > -     return (val & CSR_PRMD_PPLV) =3D=3D PLV_KERN;
> > +     return (val & CSR_CRMD_PLV) =3D=3D PLV_KERN;
> >   }
> >
> >   #ifdef CONFIG_GUEST_PERF_EVENTS
> >
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Applied, thanks.

Huacai
>
