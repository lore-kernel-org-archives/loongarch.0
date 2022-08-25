Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6A2F26
	for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 10:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA20C43470
	for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661422991;
	bh=dn1+ZslEk6LEXinCzWQDtZRloJK6UwDdajXdXRHin7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e01BBvb8R8bW7ojISVW9maCmyQjb4et4ZG0qYt3+LDLvNrnmBZPawn7B+JPUho0SY
	 QVFBProvd2cfR95lnRD8g8tapqfhLXoXtl9NhKWyAtoViZosuH2G+BHId37eJ6gVFF
	 KQWHZ81ws7890Csr79yNt0nkG8kMnz2VjTXmUQPen4NXkXhjz1Zu8H2wH6AW7uxYcY
	 0iCsvyHiJdrKwYempYcaq0jbBFcdN4eFBf/wXvuAEwwhaqK1n2sW9x2T3P7IDdp50+
	 a1y1yRE8vtjmX3LVTjL4dcBVOWsPG1sIELOHgBB48vTiM5SCbj68eMHY5T6RW+Q23D
	 IzGFxP2D0TgPA==
Received: by mail-wm1-f41.google.com with SMTP id j26so10058709wms.0
        for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 03:23:10 -0700 (PDT)
X-Gm-Message-State: ACgBeo0qCyZmAT9UhcRmTgnW1e2HbU3ePL19Nm0ZIqYX7aacHR5tzgxl
	J4yC7MaWUeCZ85QqTvLO/QNzICUc7QpztbUFKRU=
X-Google-Smtp-Source: AA6agR5lZoNNT0qBC0SxjRYYeRRaaL/qJOFewFp3gSFj9PgCLvuJTs8F461SRF4fDqI8LLv+DCfiMo+1An7kKYrPLgY=
X-Received: by 2002:a7b:c84c:0:b0:3a5:dde3:2a9e with SMTP id
 c12-20020a7bc84c000000b003a5dde32a9emr8215600wml.84.1661422989131; Thu, 25
 Aug 2022 03:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819102037.2697798-1-chenhuacai@loongson.cn>
 <CAMj1kXGrWqaTeiSeK1vG=escABZg16cpekzzTTp5WaTwi3iUYg@mail.gmail.com>
 <CAMj1kXHec4pfkM6gGwpDPCRn-WbTQcpLam+MWpBph-1KAo1H4A@mail.gmail.com>
 <CAAhV-H7Wsjf9GAQVkBeu+PKbGOJ5nAxGY=E3zryu_8OK4qtnGA@mail.gmail.com>
 <CAAhV-H7-JGGjcFBenpwUz1itZvFK9f1pH88b1dcRtPcGKToojA@mail.gmail.com>
 <CAMj1kXFEaM7KULxygTABRXB2HHnmRbpSq4N3Q4bYaPOtJxEN2g@mail.gmail.com>
 <CAAhV-H4CuCSTv8G+bBy52P7kWEc9mapatJ-83mrLYmozG+5SXA@mail.gmail.com>
 <CAMj1kXF8u=M6R_9pCciY+5oWj6VbLcMEFFC=JYQm5aq1-c8eRg@mail.gmail.com>
 <CAAhV-H4Ttu_AKyqgYZqAon4fpyCU2ODGYmub85WKDf57KZwVDg@mail.gmail.com>
 <CAMj1kXHZ7Gb0fWM7AdoVpOzspMBVRtzzg2YT5Giuaf6VOLEpaA@mail.gmail.com> <CACWXhK=nhYWWOFMbj8wGWK7VR=a-JdAQ2GtLJzWmm6diMA3HMA@mail.gmail.com>
In-Reply-To: <CACWXhK=nhYWWOFMbj8wGWK7VR=a-JdAQ2GtLJzWmm6diMA3HMA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 25 Aug 2022 12:22:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH69V559eoNRHn2+pGJwzZasW0c_yNOeCE-uQ6e2323Yg@mail.gmail.com>
Message-ID: <CAMj1kXH69V559eoNRHn2+pGJwzZasW0c_yNOeCE-uQ6e2323Yg@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Xi Ruoyao <xry111@xry111.site>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Aug 2022 at 12:14, Feiyang Chen <chris.chenfeiyang@gmail.com> wrote:
>
> On Thu, 25 Aug 2022 at 17:51, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 25 Aug 2022 at 11:47, Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > Hi, Ard,
> > >
...
> > > > > And I have tried your zboot series on a real machine, it has the same
> > > > > problem as you tried in QEMU. I will try to find the root cause with
> > > > > my colleagues.
> > > > >
> > > >
> > > > Yes please.
> > > We made the following changes and it works on LoongArch. But we don't
> > > know why the existing method didn't work. Our guess is that the linker
> > > calculates the address incorrectly.
> > >
> >
> > Could it be due to the misalignment? Could this be a toolchain issue
> > with __aligned(1)?
> >
>
> Hi, Ard,
>
> We tried to remove __aligned(1), but it doesn't work. We disassembled
> zImage.efi.elf and found that uncompressed_size and _gzdata_end are
> very far apart.
>
> // s4: uncompressed_size
> 2f94:   1c012afb        pcaddu12i       $s4, 2391(0x957)
> 2f98:   02ff837b        addi.d          $s4, $s4, -32(0xfe0)
>
> // s1: _gzdata_end
> 2fa4:   1c012a98        pcaddu12i       $s1, 2388(0x954)
> 2fa8:   02c0f318        addi.d          $s1, $s1, 60(0x3c)
>

This looks like a linker bug to me.

The ELF object has (in my case)

$ nm -n arch/loongarch/boot/vmlinuz.efi.elf|grep -A2 uncompressed

00000000007dd08e A __efistub_uncompressed_size
00000000007dd092 R _binary_arch_loongarch_boot_vmlinuz_end
00000000007dd092 R __efistub__gzdata_end

This means that, in the ELF image, uncompressed_size and _gzdata_end
are exactly 4 bytes apart.

In the object code I see

    b500:       1c00001a        pcaddu12i       $s3, 0
                        b500: R_LARCH_SOP_PUSH_PCREL    uncompressed_size+0x800
                        b500: R_LARCH_SOP_PUSH_ABSOLUTE *ABS*+0xc
                        b500: R_LARCH_SOP_SR    *ABS*
                        b500: R_LARCH_SOP_POP_32_S_5_20 *ABS*
    b504:       02c0035a        addi.d          $s3, $s3, 0
                        b504: R_LARCH_SOP_PUSH_PCREL    uncompressed_size+0x4
                        b504: R_LARCH_SOP_PUSH_PCREL    uncompressed_size+0x804
                        b504: R_LARCH_SOP_PUSH_ABSOLUTE *ABS*+0xc
                        b504: R_LARCH_SOP_SR    *ABS*
                        b504: R_LARCH_SOP_PUSH_ABSOLUTE *ABS*+0xc
                        b504: R_LARCH_SOP_SL    *ABS*
                        b504: R_LARCH_SOP_SUB   *ABS*
                        b504: R_LARCH_SOP_POP_32_S_10_12        *ABS*

and

    b52c:       1c000004        pcaddu12i       $a0, 0
                        b52c: R_LARCH_SOP_PUSH_PCREL    _gzdata_end+0x800
                        b52c: R_LARCH_SOP_PUSH_ABSOLUTE *ABS*+0xc
                        b52c: R_LARCH_SOP_SR    *ABS*
                        b52c: R_LARCH_SOP_POP_32_S_5_20 *ABS*
    b530:       02c00084        addi.d          $a0, $a0, 0
                        b530: R_LARCH_SOP_PUSH_PCREL    _gzdata_end+0x4
                        b530: R_LARCH_SOP_PUSH_PCREL    _gzdata_end+0x804
                        b530: R_LARCH_SOP_PUSH_ABSOLUTE *ABS*+0xc
                        b530: R_LARCH_SOP_SR    *ABS*
                        b530: R_LARCH_SOP_PUSH_ABSOLUTE *ABS*+0xc
                        b530: R_LARCH_SOP_SL    *ABS*
                        b530: R_LARCH_SOP_SUB   *ABS*
                        b530: R_LARCH_SOP_POP_32_S_10_12        *ABS*


I don't speak LoongArch so please figure out what is going wrong here
- this could be a rather severe bug and I don't want to work around it
before we know what the actual problem is.

Thanks,
Ard.
