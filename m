Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B498710FD
	for <loongarch@lists.linux.dev>; Thu,  2 Feb 2023 09:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A40C4339B
	for <loongarch@lists.linux.dev>; Thu,  2 Feb 2023 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675329762;
	bh=PEaciX313qy2UqVu0yX1SQPKusg5vLkAnBKcOWvYOVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VBkWHi3uLEo6d5iHcDiQg/746sEQ/pmCq8Q7RfTLzJO7hQAoWzwjpImVhZgTVUY2f
	 WjOH9y6uGoalVi6+enAav9NoH5tdxoQKb4yZVlqNFmNCmVaPguU+/TgNbulnIuXrVY
	 ZYK1DMz6scH7PcOIJpqiOTkCcm13bob2C+yXCLIEI0tzJtj50YQw4P63E3vQi3mWQP
	 P10X81zEIUF8x7J1kZm4p1ZlYF+ovoLbhoAlcvs6McnTyhx2goiT67jw4/AQseHhFe
	 z+/+pbepb9WlNFb8XP/1e3v+BCrSGwF1mWmx3k/WT9B3I08sRgP1c80SeIMLs4c6QJ
	 xbV8lhtrvMInQ==
Received: by mail-ed1-f48.google.com with SMTP id u21so1328311edv.3
        for <loongarch@lists.linux.dev>; Thu, 02 Feb 2023 01:22:42 -0800 (PST)
X-Gm-Message-State: AO0yUKWLw3wsXTOa1gSJWGYZ/egRHGj0p/H+qkPRXF1cKuXJzYAXzcjD
	FZCZJBymuqZUk1UhvvQXO4L2dlgWhwX/r30tXA8=
X-Google-Smtp-Source: AK7set/7Zy1cGxR+4u/tNDSgUmKIQRnJnLFpxxIDqNIiVKtiv1d9wPrkA2yahpNi3dvmFn1e57ePtyMKZAOiIOJ8M9Q=
X-Received: by 2002:a05:6402:40ce:b0:490:47c3:3d71 with SMTP id
 z14-20020a05640240ce00b0049047c33d71mr1693392edb.31.1675329760731; Thu, 02
 Feb 2023 01:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230201092904.11070-1-hejinyang@loongson.cn> <682fcd7bb7ce1b5d04dafa2cd9d8608e6ba80189.camel@xry111.site>
In-Reply-To: <682fcd7bb7ce1b5d04dafa2cd9d8608e6ba80189.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 2 Feb 2023 17:22:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7zYh2ufBQrAoL9gO8SC7QSvNb8m_ZZkWjPyu_SHe9ehw@mail.gmail.com>
Message-ID: <CAAhV-H7zYh2ufBQrAoL9gO8SC7QSvNb8m_ZZkWjPyu_SHe9ehw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix Chinese comma
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jinyang He <hejinyang@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Wed, Feb 1, 2023 at 7:09 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Wed, 2023-02-01 at 17:29 +0800, Jinyang He wrote:
> > Fix Chinese comma in cpu.h.
> >
> > Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>
> This is obvious, while I'm wondering if we have a "-Werror=3Dsomething"
> compiler option which can catch non-ASCII characters immediately.
>
> > ---
> >  arch/loongarch/include/asm/cpu.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/include/asm/cpu.h
> > b/arch/loongarch/include/asm/cpu.h
> > index 754f28506791..c3da91759472 100644
> > --- a/arch/loongarch/include/asm/cpu.h
> > +++ b/arch/loongarch/include/asm/cpu.h
> > @@ -36,7 +36,7 @@
> >
> >  #define PRID_SERIES_LA132      0x8000  /* Loongson 32bit */
> >  #define PRID_SERIES_LA264      0xa000  /* Loongson 64bit, 2-issue */
> > -#define PRID_SERIES_LA364      0xb000  /* Loongson 64bit=EF=BC=8C3-iss=
ue */
> > +#define PRID_SERIES_LA364      0xb000  /* Loongson 64bit, 3-issue */
> >  #define PRID_SERIES_LA464      0xc000  /* Loongson 64bit, 4-issue */
> >  #define PRID_SERIES_LA664      0xd000  /* Loongson 64bit, 6-issue */
> >
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
