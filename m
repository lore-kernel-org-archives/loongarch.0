Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFAB18AE7
	for <loongarch@lists.linux.dev>; Fri, 15 Sep 2023 19:09:13 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694804951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDeIVKTICKDFwpeyMiKeUyQnaEhJj8v8RkRSMefmd/k=;
	b=AHhoxWCpLqkPmcYu/FFKkCMeN1qFRbSQa9NH06THW5izeby06dvSy8CbZpcnjAln4Y9CZW
	+YnMsh53yrTYClYKQ2Hlrn0ZSNZRO03YSPFHP9egzWgUldP072yO8kSidxwSx881SkmpUI
	WXQSiF4ghsDsnDK3I+JS2f6PtOSfiYMNOm2uhITtE8MThM7nvkwzC72foLGnqIHtnlRGbd
	0LvoKP1quv4a9z6mNqyUp6kuXEDr8HOCl8BHHDMHIoBBrZmVE1EOziz2MKhGUvMTAAAxtA
	mKU2tks1Qp9J0F0oeB2aYYINw4fyoXMVhmUb4I0Hv6P2deRKSnEoNGyHY9QjaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694804951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDeIVKTICKDFwpeyMiKeUyQnaEhJj8v8RkRSMefmd/k=;
	b=ijQ0D6WzikBWYrorxKopMvxIQLmVdcyirOD2bgrPoV6JiJG3+BsxpPmKRUZIYx+Nm78qDP
	WLkEpJeyJvydd7Bg==
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-acpi@vger.kernel.org, James Morse <james.morse@arm.com>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jean-Philippe
 Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Salil Mehta <salil.mehta@huawei.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>, linux-ia64@vger.kernel.org
Subject: Re: [PATCH RFC v2] cpu-hotplug: provide prototypes for arch CPU
 registration
In-Reply-To: <E1qgnh2-007ZRZ-WD@rmk-PC.armlinux.org.uk>
References: <E1qgnh2-007ZRZ-WD@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Sep 2023 21:09:10 +0200
Message-ID: <871qez1cfd.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 14 2023 at 15:51, Russell King wrote:
> Provide common prototypes for arch_register_cpu() and
> arch_unregister_cpu(). These are called by acpi_processor.c, with
> weak versions, so the prototype for this is already set. It is
> generally not necessary for function prototypes to be conditional
> on preprocessor macros.
>
> Some architectures (e.g. Loongarch) are missing the prototype for this,
> and rather than add it to Loongarch's asm/cpu.h, lets do the job once
> for everyone.
>
> Since this covers everyone, remove the now unnecessary prototypes in
> asm/cpu.h, and we also need to remove the 'static' from one of ia64's
> arch_register_cpu() definitions.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Spotted during the review of James Morse's patches, I think rather than
> adding prototypes for loongarch to its asm/cpu.h, it would make more
> sense to provide the prototypes in a non-arch specific header file so
> everyone can benefit, rather than having each architecture do its own
> thing.
>
> I'm sending this as RFC as James has yet to comment on my proposal, and
> also to a wider audience, and although it makes a little more work for
> James (to respin his series) it does mean that his series should get a
> little smaller.

And it makes tons of sense.

> See:
>  https://lore.kernel.org/r/20230913163823.7880-2-james.morse@arm.com
>  https://lore.kernel.org/r/20230913163823.7880-4-james.morse@arm.com
>  https://lore.kernel.org/r/20230913163823.7880-23-james.morse@arm.com
>
> v2: lets try not fat-fingering vim.

Yeah. I wondered how you managed to mangle that :)

>  arch/ia64/include/asm/cpu.h | 5 -----
>  arch/ia64/kernel/topology.c | 2 +-

That's moot as ia64 is queued for removal :)

Thanks,

        tglx
