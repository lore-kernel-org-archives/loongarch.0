Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B1C4A02
	for <loongarch@lists.linux.dev>; Mon, 22 Aug 2022 18:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE73C43140
	for <loongarch@lists.linux.dev>; Mon, 22 Aug 2022 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661191415;
	bh=JCw5k8+PFVcv8qIP5U9PsuiUeSBZubWCY+qgf+WP8Do=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n/f09OF6skok1n2OaV2CtlrZFv1LmMn3PJkHBT76A5XESBJqqvEFwugLuE1TjKgqP
	 2vMiEP4EdeJVuGoNMqCTbQQ+ka80LalWkPNTJE1vJWOI5K7j6z990O8E2KIybKzN+B
	 MGuiIdNEecsdRcqsXIBT3FqSqs8MPLXZG2OBm66jztbKHO4ZW8c+kKk88KTIYVd6G3
	 P1M5Or3I729hys0r+dln38qH2B9rEf/V6gVU79G8GSDYRbpEoGxkTYOaO/mDPyqcD4
	 LhsA5apCkoEGp/57s/qVfFSCbsseedE6MPmWYP1qIT4MzN5n/pyOQnq48C7d6ugBw2
	 gsFvSUmw3Aswg==
Received: by mail-wm1-f45.google.com with SMTP id j26so6012062wms.0
        for <loongarch@lists.linux.dev>; Mon, 22 Aug 2022 11:03:35 -0700 (PDT)
X-Gm-Message-State: ACgBeo0P4xQa2I+pXQFIfKbnkljUb5uxluMytSDWnb4CyUZ7F2Z3Rw4v
	di/u+mvq7xabL4btSv2XqkXD/J/TI/3COVIY+Mc=
X-Google-Smtp-Source: AA6agR7y/zb3O/3tnCJdmuDYHyvsA1ns4At6tEspA/rC53mjvt/VInGLJOtWBXFQuyCbZudOi5VVCYH7LnZji+kJ9JI=
X-Received: by 2002:a1c:3b55:0:b0:3a6:7b62:3901 with SMTP id
 i82-20020a1c3b55000000b003a67b623901mr29347wma.113.1661191413596; Mon, 22 Aug
 2022 11:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819102037.2697798-1-chenhuacai@loongson.cn> <CAMj1kXGrWqaTeiSeK1vG=escABZg16cpekzzTTp5WaTwi3iUYg@mail.gmail.com>
In-Reply-To: <CAMj1kXGrWqaTeiSeK1vG=escABZg16cpekzzTTp5WaTwi3iUYg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 22 Aug 2022 20:03:22 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHec4pfkM6gGwpDPCRn-WbTQcpLam+MWpBph-1KAo1H4A@mail.gmail.com>
Message-ID: <CAMj1kXHec4pfkM6gGwpDPCRn-WbTQcpLam+MWpBph-1KAo1H4A@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Aug 2022 at 12:44, Ard Biesheuvel <ardb@kernel.org> wrote:
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
>

I have pushed a branch here that includes EFI decompressor support for LoongArch

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=efi-decompressor-v4

You will need to enable CONFIG_EFI_ZBOOT and build the zImage.efi
target. The resulting image should be bootable jus tlike the
vmlinux.efi but for some reason, it produces the crash I reported
earlier.

Please give it a try, and if you manage to figure out what's wrong
with my code, please let me know :-)

Thanks,
Ard.
