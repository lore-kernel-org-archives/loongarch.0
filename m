Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E510EA
	for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 07:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C96C433B5
	for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665991884;
	bh=hKK4/H1xnGnV6JxVAIIfP0R9btqgiUqTtFuk9VPdO8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ck3VaG1NdTRMSdr2v5CcWO6zxNXIIh1+2Aa3rTdhNc+3PLQ136Ci/0fHodVnMocy9
	 NHSvoM9w48TU9qX6soyvS94XMDj1ubVkzxzhM/PxqI1UCFn8gAVWYgF/4l7O/1iYpu
	 B02THw4bY93TCQoeOtoV0CoRmn2kKRv1SF58YkqGLc6XvMH6Y78Q7O8fX1NBLyyRok
	 kyYapdqwmDlo3IlkxGFP+Ce31YJ1yiREqtiNlAXcuf85CgATMmWdAGxCt/a6zVZeL+
	 5f7JUeIAUKAuJ1ZR2V65BfWt6cgZ8E6LyawZ/BeK5LQLk7Jth7mm/pfpNToUM97OmV
	 dthvs6Uvn8dZA==
Received: by mail-ej1-f48.google.com with SMTP id d26so22842809eje.10
        for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 00:31:24 -0700 (PDT)
X-Gm-Message-State: ACrzQf28VH1rE89IbG6nmsGXAA0bIsTfcVrVkDEelz6GL5Fk97s8MDBQ
	czhZfpbDl4h+BtQmzwUpZHC5RLDioCv0G9wbXqk=
X-Google-Smtp-Source: AMsMyM5uXcEgj0EkeSiQJyHwibP1MhffT/OjqW+8fBpIebeUP1sjp32hftQo9ac5mB7iWHvgF/PTgNZ7eFunhp4S5IQ=
X-Received: by 2002:a17:907:a044:b0:78d:b569:b891 with SMTP id
 gz4-20020a170907a04400b0078db569b891mr7378357ejc.224.1665991882427; Mon, 17
 Oct 2022 00:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221016133418.2122777-1-chenhuacai@loongson.cn> <506fe4e5-a203-48e6-84a6-f70133be15dd@app.fastmail.com>
In-Reply-To: <506fe4e5-a203-48e6-84a6-f70133be15dd@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 17 Oct 2022 15:31:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7UJDgtY4NfF7-5+TbNEbec7XOpvS87H=fPad4KK0KLaw@mail.gmail.com>
Message-ID: <CAAhV-H7UJDgtY4NfF7-5+TbNEbec7XOpvS87H=fPad4KK0KLaw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add unaligned access support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	guoren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Arnd,

On Mon, Oct 17, 2022 at 3:12 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Oct 16, 2022, at 3:34 PM, Huacai Chen wrote:
> > Loongson-2 series (Loongson-2K500, Loongson-2K1000) don't support
> > unaligned access in hardware, while Loongson-3 series (Loongson-3A5000,
> > Loongson-3C5000) are configurable whether support unaligned access in
> > hardware. This patch add unaligned access emulation for those LoongArch
> > processors without hardware support.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> What does the Loongarch ELF ABI say about this? On most architectures,
> C compilers are not allowed to produce unaligned accesses for standard
> compliant source code, the only way you'd get this is when casting
> a an unaligned (e.g. char*) pointer to another type with higher alignment
> requirement.
Some unaligned accesses are observed from the kernel network stack, it
seems related to whether the packet aligns to IP header or MAC header.
And, gcc has a -mstrict-align parameter, if without this, there are
unaligned instructions.

>
> > +/* sysctl hooks */
> > +int unaligned_enabled __read_mostly = 1;     /* Enabled by default */
> > +int no_unaligned_warning __read_mostly = 1;  /* Only 1 warning by default */
>
> The comment says 'sysctl', the implementation has a debugfs interface.
Originally "enabled", "warning" and "counters" are all debugfs
interfaces, then you told me to use sysctl. Now in this version
"enabled" and "warning" are converted to sysctl, but there are no
existing "counters" sysctl.

Huacai

>
> > +#ifdef CONFIG_DEBUG_FS
> > +static int __init debugfs_unaligned(void)
> > +{
> > +     struct dentry *d;
> > +
> > +     d = debugfs_create_dir("loongarch", NULL);
> > +     if (!d)
> > +             return -ENOMEM;
> > +
> > +     debugfs_create_u32("unaligned_instructions_user",
> > +                             S_IRUGO, d, &unaligned_instructions_user);
> > +     debugfs_create_u32("unaligned_instructions_kernel",
> > +                             S_IRUGO, d, &unaligned_instructions_kernel);
> > +
> > +     return 0;
> > +}
> > +arch_initcall(debugfs_unaligned);
> > +#endif
>
> The debugfs interface does not sound like a good way to do this.
> Overall, my feeling is that for a new architecture we should not
> introduce this at all but instead provide a way to diagnose and
> fix user space, since we do not have to keep compatibility with
> broken binaries that worked in the past.
>
> If the ELF ABI actually allows compilers to produce unaligned
> accesses for correct code, there should at least be a more generic
> way of enabling this that follows what other architectures do.
> We are already somewhat inconsistent there between architectures,
> but I don't think anything else uses debugfs here.
>
>      Arnd
