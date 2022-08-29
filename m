Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FEE181
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 04:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75108C433D7
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 04:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661747503;
	bh=Q5uwaCjtDZodNXDw9HyknG6gzbEe16cPiJSOg5tENmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NHuBauu2FP+OcxS2EPGDkVr6rA8U6LMoQlOLsXoYLT69JDEWfXPXwr+SDDfefBX8R
	 jE8c0j4X1PgpujpUKq/wCgE/bLfOfVhxOAk8vBH1uhSKR+IndqAU/gJqAvOsB6hJeB
	 pk8PpiylYbjN9QR55v8vsLbPeGD8btv5i44CP9Utxi4waSEzYA43Seb/3fk+PXLlTk
	 rUxAGgwUEOSgz16hp9/2NCxTzj2UTATQ2kbyckfdqoIaZXfCWwHx9SsK4D+JNcyLqE
	 FNtFPLwrDqAO/6aS8lQ7BQGcTwoDdkTu3hs9En/ZUSSEsZBiKuo95U5hzk+hVgj096
	 Y30Niq58yNKOw==
Received: by mail-vk1-f180.google.com with SMTP id t82so1034118vkb.6
        for <loongarch@lists.linux.dev>; Sun, 28 Aug 2022 21:31:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Vmd4xV+Eml7u76QWN6Waf5kR+7G4diyKiLgwFyNIEmY+4kvf0
	8tFv3Vuipj6WONb5jtnBxETsrG7w32Ky45DC6A0=
X-Google-Smtp-Source: AA6agR4dmeOeOK0vxhiFuG208OrUj6NfbW7j6umrxJPeb6QxPEF1TTgdICNm31n02rks+npAxVttdG4VFIBUViZHmlU=
X-Received: by 2002:a1f:9b90:0:b0:374:f09c:876f with SMTP id
 d138-20020a1f9b90000000b00374f09c876fmr2725218vke.12.1661747502405; Sun, 28
 Aug 2022 21:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220827175436.156464-1-xry111@xry111.site> <20220827175436.156464-2-xry111@xry111.site>
 <CAAhV-H7-MNd9WsnB3r2kxRN7LveixGwQZ=qTVHB_XvW+uU9q4Q@mail.gmail.com> <fbbcf45a1f54333e8abfea3c121f37ad56651dbc.camel@xry111.site>
In-Reply-To: <fbbcf45a1f54333e8abfea3c121f37ad56651dbc.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 29 Aug 2022 12:31:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Gz5pGO0-bRWu_x5TZrOX77_uJjfEQPGo+Fgyk7irRdA@mail.gmail.com>
Message-ID: <CAAhV-H4Gz5pGO0-bRWu_x5TZrOX77_uJjfEQPGo+Fgyk7irRdA@mail.gmail.com>
Subject: Re: [PATCH 1/8] LoongArch: Add CONFIG_CC_HAS_EXPLICIT_RELOCS
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 29, 2022 at 12:20 AM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Sun, 2022-08-28 at 22:15 +0800, Huacai Chen wrote:
> > > +config CC_HAS_EXPLICIT_RELOCS
> > > +       def_bool $(cc-option,-mexplicit-relocs) && $(as-
> > > instr,x:pcalau12i \$t0$(comma)%pc_hi20(x))
> > Is it possible that we only change the Makefile and not touch Kconfig?
>
> I guess we can, but if we'll introduce objtool we can
>
>   select HAVE_OBJTOOL if CC_HAS_EXPLICIT_RELOCS
>
> then.
OK, you can keep your way.

Huacai
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
