Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489CF314B6B
	for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786772; cv=none; b=TBmjA4fXX73t9VnlGaWwvGEVg5MNOPpv+MYLI9iXwllIMBOHWLV2PZO3PF0tTxCGd/wbPkuZSYK20fUthrytQaDQ9XMpAbPma9lUNixK6xwAgCwzfTgKy5qdZt+9EVlcrO10RPIqO3FLQTpb4pzovi8Gr/CEMZvVF9Hx4qqVZI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786772; c=relaxed/simple;
	bh=PkKyE5AHzhJy/4LiMXi5ErssS1dpQk0dA4EYefZXhSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwhZWa85ivxK8iAYI/JCAgCueQsgudGATn6vTSmNrGxuFHwvzUewxWMuV6dX1dic6NFGetGomTJqv+O8Tqneo6r2FY9+ybgW7jZVhecpNSyXMIaDY1urWhQRqQYzo4ax0ZY8RPbQ3mA7W1Ps1Kg/iM7LvijPCXbj6VofkLSIHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wn3frxFW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wn3frxFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFF5C19424
	for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762786772;
	bh=PkKyE5AHzhJy/4LiMXi5ErssS1dpQk0dA4EYefZXhSg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wn3frxFWXMscOKo4zV0Lg2HxLXFmwAKILwFkXNCIXxRXkC+lHAVgSTrSwiMVxyZjz
	 0lyEWWzJXl6zBMnzOv8T8U0CbIfrB+aQR6XM7OXj4ZTbMQc3daizkXfLOAArUKYbsr
	 VXAfGqwmxbk5d+VSP6Mq0azUHQxaCsC3rmiTaYtRrDOJbPydrbp1V0bTjaB5poKB44
	 vDUnv0OJHNc6BIKWE4NlVlkcA1Zlze2k7DeKE6MGZtb6O5Ue2rAevzTZQeQpnZeYGN
	 A2w0qvxT77V1Ziiwk/3gbw4n+Aj40Qj4xlvuft9EpgsiTfn+yw8peyZpnNLlCG++nX
	 sqihjDGHGG2pQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b72bf7e703fso562191866b.2
        for <loongarch@lists.linux.dev>; Mon, 10 Nov 2025 06:59:31 -0800 (PST)
X-Gm-Message-State: AOJu0Yxc3e8vfJhXIuPTJ/Cx8axNklQTjE/RiipBzOhETYgrJb0a5ban
	5fnqVhHBNuJJ7qFIB46OifJIHgSffzvYgFVSJJRFSsKwXxaEPiGFpCDvZGcZRaEmmjnCOEqORUi
	IkOXHEC4EYnIVm/xcgzEjpoyaE8a4LNs=
X-Google-Smtp-Source: AGHT+IH0g5tuzCAga9f8nm1U6xI8QuDy+NNxNGTsAl9AUpJHsCKMTDvBZoGWU5yHN3ywDyiM40N1FGtq7yVontI2ESQ=
X-Received: by 2002:a17:907:3f9b:b0:b72:62b2:26a1 with SMTP id
 a640c23a62f3a-b72e0337345mr675259266b.19.1762786770480; Mon, 10 Nov 2025
 06:59:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110025906.17096-1-yangtiezhu@loongson.cn>
 <CAAhV-H4=ZfYfRFE8VYmxyKxTAi8E=YKysG1fzed4kZRWnMUoeA@mail.gmail.com> <4deb96d9-509c-3b3f-934f-58de8d29241b@loongson.cn>
In-Reply-To: <4deb96d9-509c-3b3f-934f-58de8d29241b@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Nov 2025 22:59:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4J0VAYBDNMK0APws5uZXDJ--cpgmKdjU40+iSu62rNpA@mail.gmail.com>
X-Gm-Features: AWmQ_bmOvCgFAGs2qsph0XjgIEaCahryG7gsqdcwWrN3RaQSfyH_JD2xqw2_P2Q
Message-ID: <CAAhV-H4J0VAYBDNMK0APws5uZXDJ--cpgmKdjU40+iSu62rNpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] LoongArch: Refine init_hw_perf_events()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, vishal.moola@gmail.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:24=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> =E5=9C=A8 2025/11/10 =E4=B8=8B=E5=8D=882:48, Huacai Chen =E5=86=99=E9=81=
=93:
> > V1 was applied last week and now in linux-next, don't do meaningless wo=
rk.
> >
> > Huacai
> >
> > On Mon, Nov 10, 2025 at 10:59=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongs=
on.cn> wrote:
> >>
> >> This version is based on 6.18-rc5, use the proper patch title
> >> to make it clear.
> >>
> >> Tiezhu Yang (2):
> >>    LoongArch: Use CPUCFG6_PMNUM_SHIFT to get PMU number
> >>    LoongArch: Detect PMU bits via CPUCFG instruction
> >>
> >>   arch/loongarch/include/asm/loongarch.h | 1 +
> >>   arch/loongarch/kernel/perf_event.c     | 7 ++++---
> >>   2 files changed, 5 insertions(+), 3 deletions(-)
>
> I do not like to argue with you, but I do not think what you said is
> right, there are double standards here.
>
> The code are rebased frequently by you in linux-loongson.git, the latest
> is after 6.18-rc5 that is in this week, my patch is also rebased.
>
> You accepted the suggestion of your patch v1 title [1] and send v2 [2]
> although v1 has been applied by Andrew, because you think it is a good
> suggestion.
>
> I just do the similar and right thing,  but your reply is not polite
> and friendly, and also do not do the thing what you should to do as a
> maintainer.
If my words make you uncomfortable, I apologize for that.

But something is different.

1, I asked Andrew whether I should re-submit V2, Andrew said yes, then
I re-submit. You asked me, too, but you re-submit in a hurry before I
reply.

2, Yes, linux-loongson.git is rebased, but the commits keep the same,
this is because: A, changeset for PR should be based on a tag commit
rather than a random commit; B, the commits in linux-next should keep
stable for at least two days before send PR.

Huacai

>
> [1]
> https://lore.kernel.org/linux-mm/20251108084724.3e389b6597294900347b0476@=
linux-foundation.org/
>
> [2]
> https://lore.kernel.org/linux-mm/20251109021817.346181-1-chenhuacai@loong=
son.cn/
>
> [3]
> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git/commit/?h=3Dloongarch-fixes&id=3D4c8a7c982772
>
> Thanks,
> Tiezhu
>
