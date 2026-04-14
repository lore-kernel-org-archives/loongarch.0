Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9CB3A1E8C
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154824; cv=none; b=j3nRcBUTbtt7iJ/nvBYxAJVSJ9V0ms4uPzAE4RMQWC4yIEEFKp9CZnNEi1dYCxxA/tZmsoRDG0oJDcevct+ojlvQZxTpr1mYabOh50H+EhAY5c8VQEItEsxkb8QZpsXV/hwUfGzkCaCoFEf4iF3kQ08rlYfah6PNr/4xLixHqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154824; c=relaxed/simple;
	bh=hF/5BPPf9VwrzYou34U6pmccO2NCVRKdRiTq6Wt6KsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzL3BREdonCBV4ydV4GOy4erHvzsQo5VoqxaZdDkLVxyxaTBdYmhzIkmZ1fIvsxCzqtTs7qV0PGdTbN/lam1XyhmIcFC08U5dukdADolvIJ7WE3JX7agPl9neJ/dEBNSKnYTAWcNgrn/TzDPznXKGdYj+e3WoGCY3ID6lmvhHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADh45XRG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADh45XRG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64859C19425
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776154824;
	bh=hF/5BPPf9VwrzYou34U6pmccO2NCVRKdRiTq6Wt6KsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ADh45XRGW+IsNUwtKi9mtDxKUL4P6ubcgLaT1aP+aFQql3/coZ798ZO+HwLIEB56m
	 FM0EiY1ywX+u34gpFTQMlcC2PSGzF7aaqF9ppC0Hou6H69moYUD5jthCato/ydgeB6
	 0nF0JYdSjeF8xTNYVDz06jP6/FywK3I8if07Z5FuTeR7AD1fGL08zgHlq0GVTNBQGl
	 HM9QSYaByGSDbrORgE2sZ9Ss1nszhQuZxG1BXnM29rjEfb0a6iVjcLExVd5xo4i135
	 MY2pjPYD+oA4j9TAPFn8Wt7ejfjIDoGs9WA5EM4l7hKYmA7tIok3iVD0iodcSlMADo
	 pImwQA4h2GdlA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b980b35534eso731852866b.1
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Zp7Z5kWwRCqGZRIl5Vpi2MIyB/UxLCBimHYFuXWk45N9N0ML/g4owWNMMV3DczHUwfNYDvq+V1zo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5AEK9nL7wIzh9GIgICCtCz0NfmOKMHXN4rgWh2I0bFvhqq4yC
	qMTe+Fiogb7YCf+szmVvQ5Kt63vmmfagEa8swBOGpzaQgpQ3eMiIRAgrUkyfGed6NTL92lKjtNa
	2DOFFFkgWeKXlvpuHeIjmvDCMT3S9jTM=
X-Received: by 2002:a17:907:84c4:b0:b9d:c863:6bff with SMTP id
 a640c23a62f3a-b9dc8636c9fmr321729466b.6.1776154822928; Tue, 14 Apr 2026
 01:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330094845.39-1-lisa@bytefly.space> <CAAhV-H6Ur5RFRkhX8PGp2gfJuFBptnr9V_UuLGueqF1Uzj-GTA@mail.gmail.com>
In-Reply-To: <CAAhV-H6Ur5RFRkhX8PGp2gfJuFBptnr9V_UuLGueqF1Uzj-GTA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 14 Apr 2026 16:20:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H68O-Wz-HAma1SpPzbhcp7BQ-1UspaLSPMr4EqGODrhvQ@mail.gmail.com>
X-Gm-Features: AQROBzB2f1O_bJNsrm6PKtU98tXN-HDdSynZtwcxSZHpAia8Cg6TfIDoiAXye3g
Message-ID: <CAAhV-H68O-Wz-HAma1SpPzbhcp7BQ-1UspaLSPMr4EqGODrhvQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Align FPU register state to 32 bytes
To: Lisa Robinson <lisa@bytefly.space>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 9:10=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Applied, thanks.
I'm sorry, I reverted this patch because it breaks the partial copy
optimization in arch_dup_task_struct().

Huacai

>
> Huacai
>
> On Mon, Mar 30, 2026 at 5:49=E2=80=AFPM Lisa Robinson <lisa@bytefly.space=
> wrote:
> >
> > Move fpr to the beginning of struct loongarch_fpu so it is naturally
> > aligned to FPU_ALIGN (32 bytes), improving 256-bit SIMD (LASX) context
> > switch performance.
> >
> > Signed-off-by: Lisa Robinson <lisa@bytefly.space>
> > ---
> >  arch/loongarch/include/asm/processor.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/in=
clude/asm/processor.h
> > index c3bc44b5f5b3..ce8b953f8c79 100644
> > --- a/arch/loongarch/include/asm/processor.h
> > +++ b/arch/loongarch/include/asm/processor.h
> > @@ -80,10 +80,10 @@ BUILD_FPR_ACCESS(32)
> >  BUILD_FPR_ACCESS(64)
> >
> >  struct loongarch_fpu {
> > +       union fpureg    fpr[NUM_FPU_REGS];
> >         uint64_t        fcc;    /* 8x8 */
> >         uint32_t        fcsr;
> >         uint32_t        ftop;
> > -       union fpureg    fpr[NUM_FPU_REGS];
> >  };
> >
> >  struct loongarch_lbt {
> > --
> > 2.53.0
> >
