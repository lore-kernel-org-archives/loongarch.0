Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0D453A4
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 15:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B6EC4347C
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661785346;
	bh=kJG/7aTj0oZ7inQXeN+vvAWhGoNLtuV0VgGx9YK/F1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qwTedLpcbtX68HpODlOI9Th47SBtQnTT70x/e372jq+zQR9P9AnHKmR18dALyIy+2
	 ZuJ7R4LKB+Pgz1hyzS38KjpPlxG2ZWYXvNC49g4D8Nr2puPL03FQtaPBD4LQ36J4oq
	 5zRFN/ns5fYnBJW0+r28LRqVtUA3lSwqPx74wYIyyTJVo1Z26dho7lM1W+tyrTdpbz
	 5RMrfB4dm4rdfjk3OjV89miz/00JAoMQUySC4sgRv6MnsrUNPxnEY1YdOcGqKP6lMh
	 a68ihoSITk5UOam5YOTvCOkegpyX9In+DZ3p+SglF1dkUVvPoiTG9DJyi/YEqMj19J
	 GV5/tBu7zSnyg==
Received: by mail-vs1-f45.google.com with SMTP id 190so8586545vsz.7
        for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 08:02:26 -0700 (PDT)
X-Gm-Message-State: ACgBeo1AKmYXWFJ7/m0YKohPrVM6upCXeMjTM+vbLdoj2MRor6L9vmln
	vJIwT5IEm8zjoKqU5Y6X4HHrN0lxgnAtwa3Z1UA=
X-Google-Smtp-Source: AA6agR69vhjFtQy6s4ccKzcNJx4rM1utGHj6QpZNEsBqhjefXI0muh6lrLxvTxmBL1N12wUD3p3MaXcuVA8PbMHL+J4=
X-Received: by 2002:a67:d582:0:b0:390:d6dd:5612 with SMTP id
 m2-20020a67d582000000b00390d6dd5612mr2189677vsj.78.1661785345136; Mon, 29 Aug
 2022 08:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220829133146.15236-1-xry111@xry111.site> <e0629567084ae5c1bab880b34b417256ea23f604.camel@xry111.site>
In-Reply-To: <e0629567084ae5c1bab880b34b417256ea23f604.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 29 Aug 2022 23:02:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H67C=Cv8ok6oGe=YMS=U39N7ZKfdsSmGPc2gGpxbmU+cw@mail.gmail.com>
Message-ID: <CAAhV-H67C=Cv8ok6oGe=YMS=U39N7ZKfdsSmGPc2gGpxbmU+cw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] LoongArch: Support toolchain with new relocation types
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

This version looks good to me, only some small issues. Thank you very much.

Huacai

On Mon, Aug 29, 2022 at 10:57 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Mon, 2022-08-29 at 21:31 +0800, Xi Ruoyao wrote:
>
> > Changes from v5 to v6:
> >
> > - Restore version number.
> > - Rename CONFIG_CC_HAS_EXPLICIT_RELOCS to
> > CONFIG_AS_HAS_EXPLICIT_RELOCS.
> >   It now only checks assembler.
> > - No longer support "old GCC with new Binutils", so R_LARCH_ABS* is
> >   dropped.
> >   - "Old GCC with old Binutils" is still supported until Arnd ack.
>
> >     longer support it.
> ^^^^
> This line should be removed :(.
>
> >   - "New GCC with old Binutils" is still supported as it does not
> >     require additional code.
> > - Remove "cc-option" around "-mexplicit-relocs".  For unsupported
> >   "old GCC with new Binutils" combination, forcing -mexplicit-relocs
> >   makes assembling fail, instead of silently producing unloadable
> >   modules.
> > - Move the error report for "lacking model attribute" into Makefile.
> > - Squash the two patches for R_LARCH_B26 and R_LARCH_PCALA* into one.
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
