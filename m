Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B47C
	for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 07:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAF9C433B5
	for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660722609;
	bh=K9bXyxX0+RghSfyNAr6gwZUIT5olXJ1bRyiQBF48s0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NwscqJJf97E6NTETmTL026TLjl8pPn+pucnlpT3iNIVCsyE3Z6iJ8WkXCz1JVoLVQ
	 h6b+6/4NhvBFQoaIKmAkOmeenRFbTVV6wvhRXBJ4vzrCO0klBRhEwjabfRFZ9BWY0o
	 /Ap9iT9pl2yqQ6ry12EFGC8IBlOS9LBqVdbu8wtKtn2JfjbrI0Ns0RoYYGKJb3aT79
	 aqQ9PNfbk3LM6hKhZc0bza4wzE43aDFJq+xSIHduSpKqu3dsj+rptTQhoF6/1l/NCs
	 bfYMWLyR3fvx4255OB3AD93DRLjmlJLApHT5wxN6ft4BIRRDAsm9x9d9ppU/boi05w
	 dqKYLBB0ivGYQ==
Received: by mail-wm1-f41.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so535620wms.5
        for <loongarch@lists.linux.dev>; Wed, 17 Aug 2022 00:50:09 -0700 (PDT)
X-Gm-Message-State: ACgBeo2k7GvFWmWDPAWAiQBKeVn/n+VbumsciYSL5iTB+zCQkR6Bl6eM
	/dfKt01YUgYdY4A0he+D/1cYJqivYo3nv6/UqCo=
X-Google-Smtp-Source: AA6agR6nLmdSRee+rp7gcLg2SgHu37BhlC5rKJaS5hwfc8sIpCcu5/dANDz/FR4G/e1lrSp7wEDpBpgHrjlxlvYtB5A=
X-Received: by 2002:a05:600c:3b8c:b0:3a6:71a:f286 with SMTP id
 n12-20020a05600c3b8c00b003a6071af286mr1263402wms.120.1660722607399; Wed, 17
 Aug 2022 00:50:07 -0700 (PDT)
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
 <CAMj1kXEzzAXYP3nXo8-Ny+iwuDorrO-JqoKjg3R+4kmhV_v_KQ@mail.gmail.com>
 <CAAhV-H60mSKx3k1CwBCdubswosgqe+NuVaMtKA=hpjBhq5w5wA@mail.gmail.com>
 <CAMj1kXFi0o3dOmpW9qarJPH2L2EWKCPKE--3z=jsGjaYh1JrTQ@mail.gmail.com> <CAAhV-H5CXeG9mNxqJLouvSGLqno4DSwbpPOO5xG2D6ptF2dSTQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5CXeG9mNxqJLouvSGLqno4DSwbpPOO5xG2D6ptF2dSTQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Aug 2022 09:49:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEuQMy4+uMxg3A0W=F=PnRHUNLfrN=BPpR3pi_kbWaVpQ@mail.gmail.com>
Message-ID: <CAMj1kXEuQMy4+uMxg3A0W=F=PnRHUNLfrN=BPpR3pi_kbWaVpQ@mail.gmail.com>
Subject: EFI zboot on LoongArch [was: LoongArch: Add efistub booting support]
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > > > > So screen_info is a global variable in the core kernel. For the zboot
> > > > > case (our own implementation, not sure about the proposing new
> > > > > method), efistub may be able to fill this info, but while
> > > > > decompressing, screen_info will be overwritten. I think.
> > > > >
> > > >
> > > > Right. So you can drop it then.
> > > OK, then can we rename LINUX_EFI_ARM_SCREEN_INFO_TABLE_GUID to
> > > LINUX_EFI_SCREEN_INFO_TABLE_GUID and avoid define a dedicated GUID for
> > > each arch?
> > >
> >
> > If you use the arm64 approach, you don't need a GUID at all.
> Oh, I misunderstood.
> OK, I will use the arm64 approach now, my problem only exists when the
> order is "stub, decompression, core-kernel". If the new zboot way is
> "decompression, stub, core-kernel", then there is no problem.
>

Indeed.

I am trying to port the generic EFI zboot support to LoongArch, but I
am running into a problem:

The zboot EFI image consists of

zImage.o, created with objcopy -O binary
zboot-header.o, created using the assembler
libstub.a, created as usual

This results in errors such as
arch/loongarch/boot/zboot-header.o: can't link different ABI object.
failed to merge target specific data of file arch/loongarch/boot/zboot-header.o

which I think is caused by the fact that objcopy does not set the LP64
soft float flags on the ELF object it creates.

Do you see any way around this limitation?
