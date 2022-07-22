Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCBA15A6
	for <loongarch@lists.linux.dev>; Fri, 22 Jul 2022 02:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40484C3411E
	for <loongarch@lists.linux.dev>; Fri, 22 Jul 2022 02:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658456738;
	bh=9hNut5aXzPPWmdaB6oLy3TShgl7iSl0c/MXIQrywLT0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P4HmO5fpbM3EPeLaHvwsW24SFAY8mVRMidfOQPJuxULYXCVyC+gXC/0xhasYTEH0T
	 Sw+NM1N68EP7cefL0mKsxjsXYQ6FuMexmqzg5NYPicVThcf7kO1gpoiUpOUrmumub7
	 uRdO6LXx0i/kIs//vc57mtJNJ5sjc+oYZHA4nnqXIOMuCXOA/u/K3eI6+dBeFCjMhJ
	 Ju1IkjXS99RHMSV8AZFsSczfnrBtytT6x5fHetnA8Fi1RIayA/m90pCAYY5rMQrooT
	 HiPG5PIkxS6kiFmbKd+lLZ64iSK+7B9alfJpQk0Fxdk1vUSmW19MmnLQya8DLsA6RM
	 CRY9nyn2TRE6w==
Received: by mail-vs1-f49.google.com with SMTP id d187so3174247vsd.10
        for <loongarch@lists.linux.dev>; Thu, 21 Jul 2022 19:25:38 -0700 (PDT)
X-Gm-Message-State: AJIora+G24TJmCFZ/fnupc3IwMTossgEwzZ/tweN4NYTqZw+SiRcws5R
	Y2S6VwWIaxDmXWCUsrMUaaN5j8y7BA4n8/APa8w=
X-Google-Smtp-Source: AGRyM1vzJ7unRFTrJy5bUsfbbvStI9KFANj6KNpqiwg/HXh1rdw+Zeo5iHmZuLSr2MT8bVDrMMae9XFhrXpheebqaDw=
X-Received: by 2002:a05:6102:330a:b0:357:ee75:a914 with SMTP id
 v10-20020a056102330a00b00357ee75a914mr403227vsc.43.1658456737209; Thu, 21 Jul
 2022 19:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1658314292-35346-1-git-send-email-lvjianmin@loongson.cn> <874jzcyrjl.wl-maz@kernel.org>
In-Reply-To: <874jzcyrjl.wl-maz@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 22 Jul 2022 10:25:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4LXGE1mPQDf1wbuaCuB1G02RG1JA-B78+pNTPwwwKPWw@mail.gmail.com>
Message-ID: <CAAhV-H4LXGE1mPQDf1wbuaCuB1G02RG1JA-B78+pNTPwwwKPWw@mail.gmail.com>
Subject: Re: [PATCH V18 00/13] irqchip: Add LoongArch-related irqchip drivers
To: Marc Zyngier <maz@kernel.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, 
	LKML <linux-kernel@vger.kernel.org>, loongarch@lists.linux.dev, 
	Hanjun Guo <guohanjun@huawei.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Marc,

On Wed, Jul 20, 2022 at 7:03 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 20 Jul 2022 11:51:19 +0100,
> Jianmin Lv <lvjianmin@loongson.cn> wrote:
> >
> > LoongArch is a new RISC ISA, which is a bit like MIPS or RISC-V.
> > LoongArch includes a reduced 32-bit version (LA32R), a standard 32-bit
> > version (LA32S) and a 64-bit version (LA64). LoongArch use ACPI as its
> > boot protocol LoongArch-specific interrupt controllers (similar to APIC)
> > are already added in the ACPI Specification 6.5(which may be published in
> > early June this year and the board is reviewing the draft).
> >
> > Currently, LoongArch based processors (e.g. Loongson-3A5000) can only
> > work together with LS7A chipsets. The irq chips in LoongArch computers
> > include CPUINTC (CPU Core Interrupt Controller), LIOINTC (Legacy I/O
> > Interrupt Controller), EIOINTC (Extended I/O Interrupt Controller), PCH-PIC
> > (Main Interrupt Controller in LS7A chipset), PCH-LPC (LPC Interrupt Controller
> > in LS7A chipset) and PCH-MSI (MSI Interrupt Controller).
>
> [...]
>
> OK, that's 4 versions in quick succession, so I suggest we stop the
> bikeshedding and focus on getting this actually merged.
>
> I'm going to stick this in a branch and throw it at -next. Any change
> will need to go on top of it, no rebasing. If anything that breaks
> cannot be fixed easily, I will drop the branch.
Thank you very much for this series finally get merged.
But there is a question that has puzzled me for a long time so I want
to consult with you: Why exporting fwnode_handle in the driver is
acceptable but exporting irqdomain is not? In my opinion, exporting
irqdomain is more simple and direct because it can avoid
irq_find_matching_fwnode() in the consumer side.

Huacai
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>
