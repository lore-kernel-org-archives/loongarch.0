Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02182C08C0
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225881; cv=none; b=gnfcOmvq3/VZQUQsurnoacBXePMKaOB0MfQv8eCgoY7kfJ68tefYqReGwXMD3UtlN5s568eSkzTHiHrepw+4vUw94w1hAw04wF9Zb/ULecbxHecY46ANoYTPo+Mt/EnSMRlB/uU2y8yasoGpOFOpH9OpaR1kjkuhbut6zYeqtZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225881; c=relaxed/simple;
	bh=N2bYX4B0YtriDthfcWqGQNnlE77GwhaSIHfETvlOoN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXtfBBvRaIoQIj38ZhFZjkAvL4QUqYemheirR+AY/egIeg5FRWW2JZMWN0yYets9+rhHnq+e5hlauQOUUjK4VoolQx/erRw5vG/vzzAOt/0y2NNUEiGqaPtgoHHCjWaoffp+A3SjLHGdI8Cp3Cp90d3KLSooKaD+Q9X8o+yiopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpfCdTjO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpfCdTjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252C1C4AF0B
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764225881;
	bh=N2bYX4B0YtriDthfcWqGQNnlE77GwhaSIHfETvlOoN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KpfCdTjOM6l5M3GSYLVBDhBZiujdtHVkWOACHHKcNt3x+OitIayuPbYAnnFdCS+cH
	 4ofB3EVgkuYKsoMwC8zGlpn4vY6dZ38MwIOWmlHDNI6XfPX5uXtXyWxYHhdoCYhz5q
	 4Bm95tqk8Yfz0oFF4C2d40wxA02taVAcMlzs+sDxNSd61YWUw7Jen/UUoiHzbL5dYM
	 fkRLudeSkPIGQ78vFjuz0btK8RTqm8K0M8+ytggNZwP5Knj3KtLX3WsEGAihEmK9B5
	 3fPVzWAtPOsFk5XPVD7laiQGghx3vGjvGaL/PFnMzJR7By4mql9T3p8ITsXOg1Kv1L
	 3Tc624RkoZqXA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7277324204so91578266b.0
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 22:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqGzCwmM8q52LMPDC1Ybzd8vjsmZNrcbPpSa2Pdvua2D0u7Dyd9gLgi598s/fzYsnc4R+T3CiiVE4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4OUuirgb7wtm8v9zmGplx1pH2lIO7YQiuP3Jv0s8f86xSLkTi
	APnw9SKZk5Txrpj1wCkH1wvEaQYAeOCq00tIqJbGIwSLsOCmez7OrFl/fhJmLCJRr8kp+K2kjCS
	b3VDn50A0kjVB8SPHMQkXmX9tgvd1M1w=
X-Google-Smtp-Source: AGHT+IH0w/gnT42ggNU211jxD6r/cO/610aZFhXhsgo/TUGEudF3Za1sGv0p2lCvxyRH1Uc2DFE4GfqK+VpbOzGaCVs=
X-Received: by 2002:a17:907:1c89:b0:b40:da21:bf38 with SMTP id
 a640c23a62f3a-b76c5513204mr1064416266b.36.1764225879719; Wed, 26 Nov 2025
 22:44:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
 <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
In-Reply-To: <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 14:44:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
X-Gm-Features: AWmQ_bnRvnD0npm0Umwk0duMpO1fThwULs2iLxC6PNdc_GJ1yWPN5YXKLm3zvVc
Message-ID: <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Mon, Nov 24, 2025 at 2:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Hengqi,
> >
> > I think this is the successor of
> > https://lore.kernel.org/loongarch/20251006053323.193581-1-hengqi.chen@g=
mail.com/T/#t
> >
> > Right?
> >
>
> Right, sorry for the long delay.
Could you please help to review this series?

Huacai

>
> >
> > Huacai
> >
> > On Mon, Nov 24, 2025 at 1:56=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.=
com> wrote:
> > >
> > > This small set implement new features with 2 bug fixes for BPF.
> > >
> > > * Patch 1 fixes a bug discovered while testing the BPF Arena feature.
> > >   Without this fix, the arena_htab test case which use the
> > >   bpf_arena_alloc_pages kfunc will trigger a kernel panic.
> > > * Patch 2 fixes a subtle bug for tail call index, this can be verifie=
d
> > >   by the verifier_runtime_jit test case.
> > >   See the following two threads for background:
> > >     - https://lore.kernel.org/bpf/CAEyhmHTvj4cDRfu1FXSEXmdCqyWfs3ehw5=
gtB9qJCrThuUy2Kw@mail.gmail.com/
> > >     - https://lore.kernel.org/bpf/20251005103518.996383-1-luis.gerhor=
st@fau.de/
> > > * Patch 3 uses pack allocator for BPF programs (BPF trampoline alread=
y
> > >   use pack allocator, this make it complete), with this, no regressio=
n
> > >   on existing selftests
> > > * Patch 4 & 5 implements basic support for BPF Arena, the following
> > >   test cases passed:
> > >     - arena_htab
> > >     - arena_list
> > >     - verifier_arena
> > >     - verifier_arena_large
> > >
> > > Hengqi Chen (5):
> > >   LoongArch: BPF: Sign extend kfunc call arguments
> > >   LoongArch: BPF: Zero-extend bpf_tail_call() index
> > >   LoongArch: BPF: Use BPF prog pack allocator
> > >   LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
> > >   LoongArch: BPF: Implement bpf_addr_space_cast instruction
> > >
> > >  arch/loongarch/net/bpf_jit.c | 225 ++++++++++++++++++++++++++++-----=
--
> > >  arch/loongarch/net/bpf_jit.h |  30 ++++-
> > >  2 files changed, 213 insertions(+), 42 deletions(-)
> > >
> > > --
> > > 2.43.5
