Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF432627
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 03:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A741C433D6
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 03:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669692395;
	bh=2wNwy6iThg3PjSBPSHqTNTq6DPiJNZ31+qv039KIXH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K80F1J8UOo6eYH2e7bpYdMdoLxjnE/Jwv85+yc+I49z385mKbIV4m+uhp94ZaR1+S
	 ETLr2/xInY+2CvSKFz3pvq5ablHqtiDZasWVvFFYLNMAhhhgfIpRLkoX8aZz6Dzgve
	 h1DCS0Ad/suWRSZMbxS7Zny2yA/X63yleZM1vc0BnnHbxA262uUQ4LI8A9rTALh6iI
	 oQyULI2fHwmTfinWq8lyiavyMErMd8Fn1gohCqTvRZ9r5i64twIK1jTJkmtwnmVe/v
	 h57RW9mY+r6vEfCcOf6gUZnj1GmtrbMQvUMHGULoLHdzzTIMHDCBA7Ft9n+SDkRVwi
	 TaN/6XenKdLuA==
Received: by mail-ed1-f52.google.com with SMTP id x2so18097364edd.2
        for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 19:26:35 -0800 (PST)
X-Gm-Message-State: ANoB5pl88Fa8WOzyByV3sIV/Im8iKNJX/wX4Da7GedpgffaJskECMjIJ
	Ib8cGF9dw3Pn2ozpyPl0uI64CD7FJf1UPow2ob8=
X-Google-Smtp-Source: AA0mqf5i6CvvZTeiTvO8vt+TXfnjgmW3rqRqazHO+w1V3Gb2yVa6G2VdOFt1+sVzGUtAoXGJYrnfcv/T0FURzu78BoQ=
X-Received: by 2002:a05:6402:5003:b0:462:a25f:f0f2 with SMTP id
 p3-20020a056402500300b00462a25ff0f2mr50000667eda.156.1669692393478; Mon, 28
 Nov 2022 19:26:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027125253.3458989-1-chenhuacai@loongson.cn>
 <CAAhV-H4Y5qHSXr2uHvMYpXMgvm5fU7WQmcALB+86OYkgM1XbOg@mail.gmail.com>
 <b9c0711c-6efc-4d84-af4e-62e585ac2fa6@app.fastmail.com> <CAAhV-H7PifGc7jEmVURVYHXLdrKBGdRecjjLwOekeqS_cEXkxw@mail.gmail.com>
 <20221128151005.916e4373cd4e5808111dea0c@linux-foundation.org>
In-Reply-To: <20221128151005.916e4373cd4e5808111dea0c@linux-foundation.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 29 Nov 2022 11:26:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4cYHJe15oK=3RypmH+FiEuA+KovftXpOgbHy2Rz6uH9Q@mail.gmail.com>
Message-ID: <CAAhV-H4cYHJe15oK=3RypmH+FiEuA+KovftXpOgbHy2Rz6uH9Q@mail.gmail.com>
Subject: Re: [PATCH V14 0/4] mm/sparse-vmemmap: Generalise helpers and enable
 for LoongArch
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	guoren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 29, 2022 at 7:10 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Sun, 27 Nov 2022 13:01:19 +0800 Huacai Chen <chenhuacai@kernel.org> wrote:
>
> > Hi, Andrew,
> >
> > On Tue, Nov 15, 2022 at 4:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Sat, Nov 12, 2022, at 11:26, Huacai Chen wrote:
> > > > Hi, Arnd,
> > > >
> > > > Just a gentle ping, is this series good enough now? I think the last
> > > > problem (static-key.h inclusion) has also been solved.
> > >
> > > Yes, this looks fine to me. Sorry I didn't have this on my
> > > radar any more.
> > >
> > > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > I guess the series should be merged through Andrew's linux-mm
> > > tree. Let me know if for some reason I should pick it up into
> > > the asm-generic tree instead.
> > Another gentle ping, can this series be merged to linux-mm in the 6.2 cycle?
>
> It's a pretty large patchset and I'm a bit concerned about the amount
> of review and test which it has received from the MIPS side?
We have tested on MIPS-based Loongson. :)

>
> Prudence suggest that we merge this in 6.3-rc1.  But I'll queue it up
> for now, get a bit of testing while we consider this.
>
OK, thanks, you are free to decide this.

Huacai
