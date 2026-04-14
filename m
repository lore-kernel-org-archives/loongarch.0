Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FA1DF254
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171736; cv=none; b=WfUQhkYXLvh/xo8XwVbO/xRKT9ZXMFajux96up16VpIrD0JCcBta9/511ogtr7yk3Jo4o2OqhVhID1hvVqjBj42FUPRWFJMAh0LiLJPzgZCbPpcM68ZZbN4dWT0hJw9ddqw+F+Ln63tAKQWzjXxJN5Cpuxnjtj6lK0QxjbBhUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171736; c=relaxed/simple;
	bh=u4TJHo+YjHnslthEruJo9GDBxeCUvBTQYDfL4pQBbjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuhwZiM/3G4fIrWC57mhVbsIqlB7jDEH69dHMVJMhlaNis1Cbfj/CJeZNSfz8FpsNJGSk7mlCJz0pDH8fiQZvKEyacXGHg/N0AbI7JD9fvhGntAgazhCnpXzsPMZnMuVhzIcQ48e7nLykqPeOwzsinvImQml20ftwCqDqBoVmiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnH//2Kb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnH//2Kb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C808C4AF09
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776171736;
	bh=u4TJHo+YjHnslthEruJo9GDBxeCUvBTQYDfL4pQBbjY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AnH//2KbF3PvpjSxSPs5eXAlpniBjIX1/0z2XqTsFqjdc/7IgISBasicDrXq6hpB6
	 hkZpIzZ7+QKRWs+VbmW0F3q5nFhQVTPqoBEgmH7urPK31aKREKnWfTtjWRUB4eGJ2G
	 6CFfb/q0amesQcfzNEwawHDvYx4Li48N1KVKnpiHeIbYV0nm8Loce+1iX22BoQ0G1V
	 c7wJzfWeE47VCR/f19oLIYqPTtXpm1HxoKyvhm6VEA1D9j571hU0gWTzek0/kvn75T
	 /Qk7ZqcZbYhgiZCWLAPK8g+zYcXkRBDEnERE62+XB5FjNcXOHZFEP+91y6jw25kzI+
	 hsQnZxvAazRWw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66e129e457dso5692447a12.1
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 06:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+z1zO6pEUUTCf69ZvkiwmtPqUpnsN/1tBocgSzAouF1iq+N0J5cp3p+Wkwdx8abAfEWvRhknnzBiM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvahPIM8Aio0QXfiWYja0np6mFpP6aNw7c8ZB69RMYTGtUBuWf
	Pqm3KcQx0SxrFuQ9yK0pwtFI1cX2pGKwPSet5dECDAQvs12h/PXYGgYOoyh6LIbuElyfTkwYqRs
	Tg2fTHMj5sTyia1z6RALAVCUsXN3IQk8=
X-Received: by 2002:a17:907:e981:b0:b97:1d24:bfed with SMTP id
 a640c23a62f3a-b9d72991f8dmr1023073166b.41.1776171734952; Tue, 14 Apr 2026
 06:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330094845.39-1-lisa@bytefly.space> <CAAhV-H6Ur5RFRkhX8PGp2gfJuFBptnr9V_UuLGueqF1Uzj-GTA@mail.gmail.com>
 <CAAhV-H68O-Wz-HAma1SpPzbhcp7BQ-1UspaLSPMr4EqGODrhvQ@mail.gmail.com>
In-Reply-To: <CAAhV-H68O-Wz-HAma1SpPzbhcp7BQ-1UspaLSPMr4EqGODrhvQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 14 Apr 2026 21:02:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4NnPTX+ov7NhwiTo7bqCBgFv-RvsodsZ_cc==N0Sd7UA@mail.gmail.com>
X-Gm-Features: AQROBzDr5Y6mV-w1AlzgpRhNJFL84mEEY5BS6HeG8SIhgAT17GHgHp1Ia3Fv5cM
Message-ID: <CAAhV-H4NnPTX+ov7NhwiTo7bqCBgFv-RvsodsZ_cc==N0Sd7UA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Align FPU register state to 32 bytes
To: Lisa Robinson <lisa@bytefly.space>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 4:20=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Sat, Apr 11, 2026 at 9:10=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Applied, thanks.
> I'm sorry, I reverted this patch because it breaks the partial copy
> optimization in arch_dup_task_struct().
Fixed as this:
https://github.com/chenhuacai/linux/commit/c1365bc97d609438809d5d44d338adfc=
09767d6f

Huacai

>
> Huacai
>
> >
> > Huacai
> >
> > On Mon, Mar 30, 2026 at 5:49=E2=80=AFPM Lisa Robinson <lisa@bytefly.spa=
ce> wrote:
> > >
> > > Move fpr to the beginning of struct loongarch_fpu so it is naturally
> > > aligned to FPU_ALIGN (32 bytes), improving 256-bit SIMD (LASX) contex=
t
> > > switch performance.
> > >
> > > Signed-off-by: Lisa Robinson <lisa@bytefly.space>
> > > ---
> > >  arch/loongarch/include/asm/processor.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/=
include/asm/processor.h
> > > index c3bc44b5f5b3..ce8b953f8c79 100644
> > > --- a/arch/loongarch/include/asm/processor.h
> > > +++ b/arch/loongarch/include/asm/processor.h
> > > @@ -80,10 +80,10 @@ BUILD_FPR_ACCESS(32)
> > >  BUILD_FPR_ACCESS(64)
> > >
> > >  struct loongarch_fpu {
> > > +       union fpureg    fpr[NUM_FPU_REGS];
> > >         uint64_t        fcc;    /* 8x8 */
> > >         uint32_t        fcsr;
> > >         uint32_t        ftop;
> > > -       union fpureg    fpr[NUM_FPU_REGS];
> > >  };
> > >
> > >  struct loongarch_lbt {
> > > --
> > > 2.53.0
> > >
