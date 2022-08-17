Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C647C
	for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 07:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3448C43470
	for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660720735;
	bh=NOwkOziwZGr8EGipTxgGJCUnEbG0oR9cE5ZYhdP60BM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HA1m/NKkRVLQqXFHzhPlsX4MgzEajDLVXbVejWjNceq1sCeNBaa2uWNSjQ9P5cvwe
	 xbnq0pMLUFvXSNTDFlR0IjOmoMfJ66/08FNQ00HPslF9aIr12QmlsS8orWFkoF0iHl
	 PUcml3DWAfQ2JNgyJwZYGkiNDSD3Vg+ioxHrDrWa9T+bTrptjSFirwtj9+WMTZPvEH
	 t5RUTpIP17QTIWKBxGFkY1VMh2QHYm0UTF7x5VCI+7GVueNo01MUXhnhq8P1QwlkOQ
	 Rr6qic/0rji+GPFsbAoYyuIxsA22Srsr1C+GwDy9MlmFMcZAIvjQ1hffenjQ9wkSMa
	 8HSkySteaG3SA==
Received: by mail-wm1-f50.google.com with SMTP id k17so6282699wmr.2
        for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 00:18:55 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Kz/G1ec0PU5GVyQDOFpKP+Lkg3Zsy8h1TwMEsT2KCvF6q1EYV
	6/gKSXT75e1lRiLSVoatofrsRUqpDGk58NZYmWI=
X-Google-Smtp-Source: AA6agR4+cY2jPhbCRQzBvm5jD59KKvO56VqpbEkJ7Ko92JyI8Ftn1uzpLyDoJuChItHW1Z9+9PVnZ1VaP/d0bkqgaI8=
X-Received: by 2002:a05:600c:3d88:b0:3a6:a5:19eb with SMTP id
 bi8-20020a05600c3d8800b003a600a519ebmr1188206wmb.163.1660720734190; Wed, 17
 Aug 2022 00:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145754.582056-1-chenhuacai@loongson.cn>
 <CAMj1kXERN209b7dbVs_hy4BeUwrmk2p9_vF+Wq2W8PUeHOQTkg@mail.gmail.com>
 <CAAhV-H60CJDRY4c+Eu+L=rNgHsXQqx=HK9nNSqg69WVV+Bm3SQ@mail.gmail.com>
 <CAMj1kXE1MijqonkPeH+Ydg8ti4_4YFXxBKK6Wztb=HtSY5EAgQ@mail.gmail.com>
 <CAAhV-H503hgyUZND2MmZ2h3qVb3SRt79HcQy7HrFmfGBci-QMA@mail.gmail.com>
 <CAMj1kXEzzAXYP3nXo8-Ny+iwuDorrO-JqoKjg3R+4kmhV_v_KQ@mail.gmail.com> <CAAhV-H60mSKx3k1CwBCdubswosgqe+NuVaMtKA=hpjBhq5w5wA@mail.gmail.com>
In-Reply-To: <CAAhV-H60mSKx3k1CwBCdubswosgqe+NuVaMtKA=hpjBhq5w5wA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Aug 2022 09:18:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFi0o3dOmpW9qarJPH2L2EWKCPKE--3z=jsGjaYh1JrTQ@mail.gmail.com>
Message-ID: <CAMj1kXFi0o3dOmpW9qarJPH2L2EWKCPKE--3z=jsGjaYh1JrTQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add efistub booting support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Aug 2022 at 09:17, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Ard,
>
> On Wed, Aug 17, 2022 at 3:00 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 17 Aug 2022 at 08:43, Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > Hi, Ard,
> > >
> > > On Tue, Aug 16, 2022 at 11:32 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Tue, 16 Aug 2022 at 17:23, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > >
> > ...
> > > > >
> > > >
> > > > No that makes no difference. The point is that the EFI stub and the
> > > > core kernel are the same image, so when the stub runs, the core
> > > > kernel's screen_info already exists in memory - the only thing you
> > > > need to do is make it accessible by adding it to image-vars.h
> > > Emm,  in ARM64,
> > > #define alloc_screen_info(x...)         &screen_info
> > >
> > > So screen_info is a global variable in the core kernel. For the zboot
> > > case (our own implementation, not sure about the proposing new
> > > method), efistub may be able to fill this info, but while
> > > decompressing, screen_info will be overwritten. I think.
> > >
> >
> > Right. So you can drop it then.
> OK, then can we rename LINUX_EFI_ARM_SCREEN_INFO_TABLE_GUID to
> LINUX_EFI_SCREEN_INFO_TABLE_GUID and avoid define a dedicated GUID for
> each arch?
>

If you use the arm64 approach, you don't need a GUID at all.

...

> > > > > > This code is not checking a platform feature so it does not belong here.
> > > > > >
> > > > > > The EFI stub code is an ordinary EFI app, and it runs in the execution
> > > > > > context provided by EFI. So why is this needed so early? Can you move
> > > > > > it into the kernel entry routine instead?
> > > > > This is useful once we use our own zboot implementation, maybe we
> > > > > don't need it with the new method you are proposing.
> > > > >
> > > >
> > > > If this is part of your zboot implementation, please drop it for now.
> > > > Let's try using the generic EFI zboot instead - if we need to, we can
> > > > find a way to add it there.
> > > >
> > > > But out of curiosity, why is this needed at all?
> > > My mistake, the real reason of configuring DMW in stub is that the
> > > address of real_kernel_entry() is a kernel va, not a efi va (which is
> > > the same as pa).
> > >
> >
> > That means you can move this code to efi_enter_kernel(), no?
> Yes, we can move to efi_enter_kernel(), thank you.
>

OK
