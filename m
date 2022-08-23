Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935F7F
	for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 02:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E711C43140
	for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 02:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661220281;
	bh=g3jkvWJUGf3Fr73puF5aA7xyLqZ7AuXaOV6pbL558IE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iXVJDGu8tekZUrtUzivDAW7rGl14rRMietxm40QK6v86UEmeeKvIMrKY4lW8hhgTf
	 nFmw5sRfIrsuRPGUOzyeSgAUYNss7zKMoDsqgMk30oFOEH9TbtY30bnPwKRTS9j2/J
	 oePVa73fc/oO0tsnnKZm1t1c3Jjv3QXIXA6HT5P6vDfqhpfiADgDo/FkQvSiW/0ds5
	 K8gqFsFraqUUKpEph/2GZIuIKNrCe4QC7EPayLY1btgcehmxYn04INpAE8Ne7lNTiZ
	 rmEmBh7ieiGPl6IddKYbMIwF3d07cymY0YRQyjLxvkAHsHOkeVS8D/QcpaELr0h7FH
	 h/xKiTWrCyTVw==
Received: by mail-vs1-f43.google.com with SMTP id d126so13101115vsd.13
        for <loongarch@lists.linux.dev>; Mon, 22 Aug 2022 19:04:41 -0700 (PDT)
X-Gm-Message-State: ACgBeo2SyWHkYJZN9/aT40Fc+3zdGHksVpVM6AQWqCTFokoQpzjfe4ZX
	ol39GJ3QYMgRjO+bfoShMlGo0AA58jbS2rdD1yU=
X-Google-Smtp-Source: AA6agR4q6W5H+dBbZkGns1omYkaGFVWsPTIWGdbHUaYCr3kxDnv97+M/rkcuACDpEqiLWDpYXqOv3czA3gIIw0vVSCI=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr8686004vsu.43.1661220279942; Mon, 22
 Aug 2022 19:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819102037.2697798-1-chenhuacai@loongson.cn> <CAMj1kXGrWqaTeiSeK1vG=escABZg16cpekzzTTp5WaTwi3iUYg@mail.gmail.com>
In-Reply-To: <CAMj1kXGrWqaTeiSeK1vG=escABZg16cpekzzTTp5WaTwi3iUYg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 23 Aug 2022 10:04:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Whp0VjSfHgHV-F1Ln3-2jMM8Znzs_ehq9x0MYybd_yw@mail.gmail.com>
Message-ID: <CAAhV-H5Whp0VjSfHgHV-F1Ln3-2jMM8Znzs_ehq9x0MYybd_yw@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi <linux-efi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

Hi, Ard,

On Mon, Aug 22, 2022 at 6:44 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 19 Aug 2022 at 12:20, Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > This patch adds efistub booting support, which is the standard UEFI boot
> > protocol for us to use.
> >
> > We use generic efistub, which means we can pass boot information (i.e.,
> > system table, memory map, kernel command line, initrd) via a light FDT
> > and drop a lot of non-standard code.
> >
> > We use a flat mapping to map the efi runtime in the kernel's address
> > space. In efi, VA = PA; in kernel, VA = PA + PAGE_OFFSET. As a result,
> > flat mapping is not identity mapping, SetVirtualAddressMap() is still
> > needed for the efi runtime.
> >
> > Tested-by: Xi Ruoyao <xry111@xry111.site>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> > V1 --> V2:
> > 1, Call SetVirtualAddressMap() in stub;
> > 2, Use core kernel data directly in alloc_screen_info();
> > 3, Remove the magic number in MS-DOS header;
> > 4, Disable EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER;
> > 5, Some other small changes suggested by Ard Biesheuvel.
> >
> > V2 --> V3:
> > 1, Adjust Makefile to adapt zboot;
> > 2, Introduce EFI_RT_VIRTUAL_OFFSET instead of changing flat_va_mapping.
> >
>
> Thanks for the update.
>
> I am going to queue this up in the efi/next tree. However, due to the
> many changes to arch/loongarch in this patch, conflicts are not
> unlikely, so I created a signed stable tag for the patch that you can
> merge into the loongarch arch tree if you want.
>
> *However*, you must *not* rebase your tree after merging this tag.
> Therefore, it is probably best that the merge of this tag appears as
> the very first change on your PR to Linus for v6.1. Everything after
> can be rebased at will (assuming there are no other impediments to
> doing so)
>
> You can fetch it and merge it like so:
>
> git fetch -t git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
> git verify-tag efi-loongarch-for-v6.1 # if you like
> git merge efi-loongarch-for-v6.1
>
> and all your other v6.1 changes can go on top.
>
> This way, you can resolve conflicts locally without affecting the EFI
> changes going via the other tree. The EFI stub for LoongArch change
> will arrive into Linus's tree via whichever tree he pulls first: the
> LoongArch one or the EFI one.
>
> I will rebase my zboot decompressor changes on top of this - I will cc
> you again, as the LoongArch builds ok but still does not boot.
Thank you very much. There are several bugs that need to be fixed
first for the 6.0 cycle, I will merge the efi-loongarch-for-v6.1 tag
after that.

Huacai
>
> Thanks,
> Ard.
