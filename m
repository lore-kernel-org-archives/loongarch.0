Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C5C13D509
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724820233; cv=none; b=T+mACshEp2WGV4ePu/cj3vC5oOm791Q6IQJPeo/gWtFrSKuji7tsCCWs98l23vNJx2wwZWUWmT+xuqaV9G4l/VC+dn+ixcRj68C/Wr14uYqhoPhYW+sN7nGTT8HA+jrAk4c8dThG0fLpQMuZ2AZPjxb+FFq/EShqiSVYaFnKvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724820233; c=relaxed/simple;
	bh=PyNhlqTKnWYTY/PhM7ZwXVfv9RVECoxSi5MF13aVcz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Haox9b8PUg9ni0kcPwW7wdmW/p+TDbogptM2xE1gcIErb/raljU+rP5ieAbFSA0NObhT569/MuSZKRz3FIgHqxg1do7RJrScS4L2tGJOqWkUfUb5dkSqnZ7TzgwgFWbtQ+rRlSbSU4LFvb3KK7F+tOX73t3fueQ0e94RhbnVp6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzhOaTlz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzhOaTlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FAAC4AF10
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724820233;
	bh=PyNhlqTKnWYTY/PhM7ZwXVfv9RVECoxSi5MF13aVcz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WzhOaTlzgqLKperlMwmHMSMUr72MBpb0AATIVXok+XShgEWxbDYcLGUv0QqTHEfsV
	 u0okta9fjzgRKLXDNC1scs3l3KfCD76+oI3QeKnqskKpJ9u/rpwfXIE3GdkW9tOYPd
	 Ys3PzIY0uErIubRVyFbQGpXwykGUCR9GjSLSbCVIAboGaGaMiErePeEhZTNEXCUzi7
	 /82uwZ9yS6dcOl86o+Gs2jV74xcb9nq1d/l2SHNoM1UlY4ffi79T36sxtWv7eb1gll
	 RgqfyVv43VjEvxYcL7VwVimF8p/bMfrJ/+ACDUeuOFJOxc39m6DhIMbNWMd95Llc0b
	 +JnV/xH6ysXDQ==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3718706cf8aso3574315f8f.3
        for <loongarch@lists.linux.dev>; Tue, 27 Aug 2024 21:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNoHn10WrMWWcO3T5rtwwRGrfvMA2rf6u6PuRXAUAvH/p4NmyKVZpTqxlVHakNM5MPbap6PojMw2k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyocyRWqXDWhgxuFF3+eQJBIe2wN3SjFWneESNayPwwwq9L/HD+
	RkuUnhtojDtfNynSmmBkDbEFBsrcGiv4mGchG8dIQbbeL0klz33jDAXdyJRZXOBrzjTU56zfvnr
	iYsKL8OzHz4Cn+1t4mQZl6ingD44=
X-Google-Smtp-Source: AGHT+IEAn2igZXuZIC0hjZER/1Amla5ATw+uRa4YX3yaFIONuEhnwNdAeKbODLYaaohZMeBdkds8+F552EWppR9SU+k=
X-Received: by 2002:adf:e9cb:0:b0:367:9088:fecd with SMTP id
 ffacd0b85a97d-37311841b96mr10821237f8f.7.1724820232056; Tue, 27 Aug 2024
 21:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828031421.147944-2-xry111@xry111.site> <CAAhV-H5dDkyd5qkipwbKJvNduWM0UgENBqMHJGXhEoekizneaw@mail.gmail.com>
 <e8cc0f2d1e82097ab8646edfdd2a4a1fca386bcc.camel@xry111.site>
In-Reply-To: <e8cc0f2d1e82097ab8646edfdd2a4a1fca386bcc.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 Aug 2024 12:43:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6QxJH9y34326La4yFkz6AxUKPRYNkmkxhEe0i0S6QLyA@mail.gmail.com>
Message-ID: <CAAhV-H6QxJH9y34326La4yFkz6AxUKPRYNkmkxhEe0i0S6QLyA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove posix_types.h include from sigcontext.h
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 12:27=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> On Wed, 2024-08-28 at 12:11 +0800, Huacai Chen wrote:
> > Hi, Ruoyao,
> >
> > Just some questions:
> > 1, Changing UAPI is not a good idea.
>
> But removing unneeded includes from UAPI is fine.  For example, the
> commit 44e0b165b6c078b84767da4ba06ffa27af562c96 has removed
> linux/posix_types.h from termbits.h for all ports.
Need more tests, not just kselftests.

Huacai

>
> > 2. In another thread you said that "paper over" is not enough for some
> > cases.
> > 3. include/uapi/linux/types.h still include linux/posix_types.h, why
> > your "paper over" works?
>
> Well maybe it does not work (I've not seriously tested as it's just a
> paper over).  But removing unneeded include is correct on its own
> anyway.  And ...
>
> > > The unneeded include was found debugging some vDSO self test build
> > > failure (it's not the root cause though).
>
> So it's just "found" debugging the issue.  Maybe I should change "it's
> not the root cause" to "it's not really related to that issue"?
> >
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
