Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201662040B0
	for <loongarch@lists.linux.dev>; Wed, 12 Feb 2025 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344979; cv=none; b=CEs0v07D2KIjmnzsjaDYkfav62eTuEu1V0uoJ5J9mTnD9ABu0fhjiZiauxmfwQz+wrCP+9DkCagYnJEBtGhl5hW5tpePk10Pr8SNuNITEpaB/4Aj54Q+7/vtqXhTw3lCdgMYQSFBH3Uiid92aPm+H3AnWl8QSAjScaR9gB5zmu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344979; c=relaxed/simple;
	bh=5tF4DvzDsVt7KQ/mFgmWdWH6GKf+bgfdnRM0E/Qka0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+CdULlhqnnavTtHle6JKTOQ7NarUdCBqZvZJx2AzAdUdNow6jT5+yjRL7gDSEGutASspSMO1O1s8xpOGPvDLtPOAetFCvz73fnJ8G+fftmkcg8nC2y5tUSJd2k3lORIu2vqb/dtfZGYRmcRIA4q98dL9VP13FVd9KoD7Lc999M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcQhR5le; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcQhR5le"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9331DC4CEE9
	for <loongarch@lists.linux.dev>; Wed, 12 Feb 2025 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739344978;
	bh=5tF4DvzDsVt7KQ/mFgmWdWH6GKf+bgfdnRM0E/Qka0c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dcQhR5lebHxfdK1vHdGgzMSiIWrxtwV10WzDMSDwKZJWyRUlX97wK7f3hxXu+thbJ
	 QOmyMuOrodb3sNXvU+e0xCIDPInA+frr0zbnFou5EnQWr1EUo9nDMBKrZ46N5R83Vr
	 sxXqQ1+s3CJZrBC8jxUpKjwdAw2mDszEbNfGIoN4YG/uXb9AE87xfAa1fR/D9rtO58
	 W/Vl+TboOcpUDykNJ0b1DcAFz5k0h4wPdH6Io9MwhkeRwtonoo+5a9AL57Ed6Uolsh
	 YlBXEqDeHtxmXPaRhTJhKAaDthABCUHBhRy9KsBWubqdQ3Y7abyi/IwBkCEW1BqN6Y
	 io2IEYvrfiUAA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so6905344a12.1
        for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 23:22:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwttc7dzCxFvdm9/pk1Ex95ZxhOwdDtKwGwu+r3tdcHiRtD7Q+JZflbE0N6F3MNQomf4F4ZovP8W8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtKo9OTf8i89j0F35adIoQGwPpp60ex4dev6umWWrZzcWFRT1H
	qg9MdidsMPVXSl43kEvLN5H6689hxbh99TrpyJuEvGsFB81d28Ae08gPSdBQTaoyQQC9C0rFyGa
	1SY+JMNKp6EUUxmzHOI5OGchtsZc=
X-Google-Smtp-Source: AGHT+IH4oQXZ75PaiQ5q94lbM6UPkG1or1sTEbMNPus1+v5Ba6Wxh3nB65ZO7Zu13k5WPTyEWCcXXDkoaEPGpZrm2lM=
X-Received: by 2002:a05:6402:13d2:b0:5dc:8845:6a0d with SMTP id
 4fb4d7f45d1cf-5deadd9ccd0mr1570670a12.14.1739344977083; Tue, 11 Feb 2025
 23:22:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn> <20250115013444.anzoct6gvs56m225@jpoimboe>
 <4612bfd8-442e-fecb-240f-46e735b48540@loongson.cn> <20250210212653.oidcl4aqyrcu3yzi@jpoimboe>
 <CAAhV-H7MVDj0CbXfwveb7GDn+D=O4N6oUT6rpGrbGmYPLPpRPg@mail.gmail.com> <20250211233056.q47mp5askk7qrxcp@jpoimboe>
In-Reply-To: <20250211233056.q47mp5askk7qrxcp@jpoimboe>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 12 Feb 2025 15:22:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H563HcK2bck2k+VLTvrf0C7=cEMr8BJpQhFdJNc+dFOUw@mail.gmail.com>
X-Gm-Features: AWEUYZkwP3dB1uiekSoXe4aycfg9SEbwDK21JX739EF38anakQ8LqK3tzyOMtg0
Message-ID: <CAAhV-H563HcK2bck2k+VLTvrf0C7=cEMr8BJpQhFdJNc+dFOUw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Peter Zijlstra <peterz@infradead.org>, 
	loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 7:30=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Feb 11, 2025 at 07:59:57PM +0800, Huacai Chen wrote:
> > Hi, Josh,
> >
> > On Tue, Feb 11, 2025 at 5:26=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> > >
> > > On Mon, Feb 10, 2025 at 02:07:43PM +0800, Tiezhu Yang wrote:
> > > > On 01/15/2025 09:34 AM, Josh Poimboeuf wrote:
> > > > > On Sat, Jan 11, 2025 at 02:57:42PM +0800, Tiezhu Yang wrote:
> > > > > > Hi Josh and Peter,
> > > > > >
> > > > > > On 12/17/2024 09:08 AM, Tiezhu Yang wrote:
> > > > > > > This version is based on tip/tip.git objtool/core branch [1],=
 add some weak
> > > > > > > and arch-specific functions to make the generic code more rea=
dable, tested
> > > > > > > with the latest upstream mainline Binutils, GCC and Clang.
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.g=
it/log/?h=3Dobjtool/core
> > > > > > >
> > > > > > > Tiezhu Yang (9):
> > > > > > >   objtool: Handle various symbol types of rodata
> > > > > > >   objtool: Handle different entry size of rodata
> > > > > > >   objtool: Handle PC relative relocation type
> > > > > > >   objtool: Handle unreachable entry of rodata
> > > > > > >   objtool/LoongArch: Add support for switch table
> > > > > > >   objtool/LoongArch: Add support for goto table
> > > > > > >   LoongArch: Enable jump table for objtool
> > > > > > >   LoongArch: Convert unreachable() to BUG()
> > > > > > >   drm/amd/display: Mark dc_fixpt_from_fraction() noinline
> > > > > >
> > > > > > Are you OK with the first 8 patches?
> > > > > > What's the merge plan for this series?
> > > > >
> > > > > Sorry, my inbox is still reeling from the holidays.  I will revie=
w this
> > > > > soon.
> > > >
> > > > What are the status of the first 8 patches?
> > > > What is the next step? Is there anything else to be done here?
> > > > I would really appreciate any advice on how to get this merged.
> > >
> > > Please post a new revision rebased on tip/master, with patch 4 droppe=
d,
> > > and I'll queue them up for -tip.  Thanks for your patience.
> > You will queue the whole series, or the first 5 patches, or the first 3=
 patches?
>
> The new series now has 7 patches:
>
> Tiezhu Yang (7):
>   objtool: Handle various symbol types of rodata
>   objtool: Handle different entry size of rodata
>   objtool: Handle PC relative relocation type
>   objtool/LoongArch: Add support for switch table
>   objtool/LoongArch: Add support for goto table
>   LoongArch: Enable jump table for objtool
>   LoongArch: Convert unreachable() to BUG()
>
> I was planning on queueing all 7.
>
> In particular, patch 6 should stay with the objtool patches since
> they're directly related.
>
> But I was also just going to grab 7 as well.
>
> Please let me know if you disagree.
What about you merge the first 5 patches, and then I merge the last 2
to the loongarch tree? (I prefer to merge the whole series to the
loongarch tree with your acked-by, but that may be inconvenient to
you).


Huacai

>
> --
> Josh
