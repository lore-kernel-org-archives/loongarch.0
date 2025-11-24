Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245A254864
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970540; cv=none; b=sS7g7h54mnMjCg6O07HujaW7YNIekAejoGfCxHAE6zLbvP2n1LQrax6ctoKgjcjYx0fiL7PbhJjVatAFcdB/6x4Fx15n+4DwEFo+OfLYnrvdKp7jNvExLR54dwBCEc95XTYPOP2bCKaWQr7laaqPQNJRQMG27V5NZOS4VaJ6nq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970540; c=relaxed/simple;
	bh=NTVKp4sZZcVSN9+Ii9Jx5x7ttBhLWv8YEAcioKm+KbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlrdrYBCgLvUXEdA05htalTQS5RBc71EhlbVwJwHfcXFht8w33BXgOBnsqEocBjpJcnRnDiHOTOJWJJj0DPg8f1NmH5rqhBtyGbV943fNpbmYmbVYHIW0pXdngrgdJ60nh1N83z6URth76MImLo8dyCRkOtLNQg/v9AFvHEGtY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIsFGMhj; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIsFGMhj"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45066bee74aso531256b6e.2
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 23:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763970538; x=1764575338; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGgm1PeBf+G3bMMJzir2QM3sEuz1PeMlHk9f8m9ycpU=;
        b=LIsFGMhj42driqZlukLExqWB3gRYRA0mcSM++K7TINUyA3pH44xcG9NH//IfKw+N9L
         UmqAyCPG0eGfrXJX/C+nPASMcGVbbqTuO5s4EnaCTYQGIXkKxwK7RM4Rn2yl40WbaveH
         u4ynr7Ze2BukQNvuDbtNABWcbw2oMXxR9SnjK1cNZFPbb+WijB4Zodjihz/u13yKJuAM
         dszOnwefW16i4rGDkRO0773tc9VIvatonKu8m28DPu+r+0w/glHoPBgQGVVJeh1nAs4Z
         96xlTJtBjxy9j9BEQrpqTnmQAmpLIMdKslo1PNLFcCqHr1ZZyTmvx5pWjHBbfLNG/gSb
         sT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763970538; x=1764575338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGgm1PeBf+G3bMMJzir2QM3sEuz1PeMlHk9f8m9ycpU=;
        b=lC9Vhw6a8+D4g2Q7Q0+0fbIboAfE1WEBdhVU1uGFxsgIQNgns8aNwxTfTssiRNLltH
         wStjXG/BRoSKWtJm2h/OuZWeH2e1bXllYwjsvO5CStf1wjj3CvEko1khnIinNerSK4H4
         ixqFDirve9Fpj2Bf6uPN3C+MZtxAxs0vlnwHfzJp/EKJLNhblATYtb4PrRIIyCl4mRxE
         BreEfF8brHQB+iZeNmvba95ADzGDnUytIJp6D06DVxRLvdVYAId+7UvqZZyfEm++oYJg
         Y8KvJfU5Q9Ecihv1jP9DzjBYemWrEU9AAwwFWRKrc10g6lvwMAiwU5m358Up7EdcqaIs
         REVw==
X-Forwarded-Encrypted: i=1; AJvYcCVzx1J7+uC0c9O02dyKWbbX4gkfl1/pC+3rWNbiILCVL03LSFHIYyLJ1+N3knQtIeQicmy/uhM+4zk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTiTrd/AuXyHh1PoXUuPV1f72Ohx8GT6y4g+rDgwTPmG7FZ18T
	9uaghoN3NWLFDZg9fhKbXja20YJp5Wv5O3wNdqIq4q6xhHPQKYOcLpNK6tw0Frasud62yUB9ZXh
	GIGlpkonvTmmGqEwUrhNQq0hWYacdsYI=
X-Gm-Gg: ASbGncuLBHONaZVFSAiBzFRoDjjaYcrQIVr+zGyXv5d/0Xz6q5+0LptPPpDW2gnc8fR
	ET3LrjMnWCi4L8V00/5HxtM+AKhjTumuHIsWYktJn3hg+IbyfO1NSfCDYlxVTNPCVmvKijLUTGM
	myAYgz9tvNrIZR5DJY8vF6xMnok/mT8RzLaLYbDDzPNVGoYDPKRA7MgpwZE51KjY2O0YMXwH3r+
	dLtO6iuxfBkfKcZCBCsPWwvy1owxFfYTA24esPCyWcS5ZmpayKGtJ1Es67v4Z4tktQQyz4=
X-Google-Smtp-Source: AGHT+IHNAj+n6m4VmWFvn+zv0+JiuUEQtAQgydVPI6vC/63tWoMM2kqTU90Z09i6swQYIEBENDNTFULtFd7t1n62tPg=
X-Received: by 2002:a05:6808:21a0:b0:450:c0c4:3728 with SMTP id
 5614622812f47-451159929femr3964842b6e.30.1763970538192; Sun, 23 Nov 2025
 23:48:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
In-Reply-To: <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 24 Nov 2025 15:48:46 +0800
X-Gm-Features: AWmQ_bkuxsapMAChdwwDsS9KO3bYr8YE2qkGyVSmLsjkyRz4g_je5hCNufBektI
Message-ID: <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Hengqi,
>
> I think this is the successor of
> https://lore.kernel.org/loongarch/20251006053323.193581-1-hengqi.chen@gma=
il.com/T/#t
>
> Right?
>

Right, sorry for the long delay.

>
> Huacai
>
> On Mon, Nov 24, 2025 at 1:56=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > This small set implement new features with 2 bug fixes for BPF.
> >
> > * Patch 1 fixes a bug discovered while testing the BPF Arena feature.
> >   Without this fix, the arena_htab test case which use the
> >   bpf_arena_alloc_pages kfunc will trigger a kernel panic.
> > * Patch 2 fixes a subtle bug for tail call index, this can be verified
> >   by the verifier_runtime_jit test case.
> >   See the following two threads for background:
> >     - https://lore.kernel.org/bpf/CAEyhmHTvj4cDRfu1FXSEXmdCqyWfs3ehw5gt=
B9qJCrThuUy2Kw@mail.gmail.com/
> >     - https://lore.kernel.org/bpf/20251005103518.996383-1-luis.gerhorst=
@fau.de/
> > * Patch 3 uses pack allocator for BPF programs (BPF trampoline already
> >   use pack allocator, this make it complete), with this, no regression
> >   on existing selftests
> > * Patch 4 & 5 implements basic support for BPF Arena, the following
> >   test cases passed:
> >     - arena_htab
> >     - arena_list
> >     - verifier_arena
> >     - verifier_arena_large
> >
> > Hengqi Chen (5):
> >   LoongArch: BPF: Sign extend kfunc call arguments
> >   LoongArch: BPF: Zero-extend bpf_tail_call() index
> >   LoongArch: BPF: Use BPF prog pack allocator
> >   LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
> >   LoongArch: BPF: Implement bpf_addr_space_cast instruction
> >
> >  arch/loongarch/net/bpf_jit.c | 225 ++++++++++++++++++++++++++++-------
> >  arch/loongarch/net/bpf_jit.h |  30 ++++-
> >  2 files changed, 213 insertions(+), 42 deletions(-)
> >
> > --
> > 2.43.5
