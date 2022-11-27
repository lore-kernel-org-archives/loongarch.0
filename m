Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462DD17D0
	for <loongarch@lists.linux.dev>; Sun, 27 Nov 2022 05:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF939C4314A
	for <loongarch@lists.linux.dev>; Sun, 27 Nov 2022 05:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669525293;
	bh=BcVxCBSSJcipAEV/aBmW/z7LTxZcFoSl+z5RqrQwQRM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ec57qBrMZ1hUgOhD5s2WrKXz0ZAlqGnDJaNH0v9Ae2hVvRCIPUjAz7OlV0iLlvlRY
	 1nWnPDX9kYgB8EyULaHl1OI8KOn/DIXPSGUbzPFbuhUQ9qYa/MwDHJ/QIIqJD0Cx5Y
	 L41AwIK8/udrfg9z0xZAOi+1gDg5fEm6HcnT6AuFKMq9P0g22ZjMj2hBXGvGVWOpa9
	 NGKdVkYYggIJ3ut1bpEooiT6KnKAlYe9+90APh0UWwt1L1ECVXcYtEuZs1sSoncXP4
	 k8s7pDYnr3LYfGuR22Qx8WzZloeJxLbtPP3coKN8kIWnpSSv38bg9NxN0mogNkbtu6
	 sXQjmHRwBzJ5w==
Received: by mail-ed1-f44.google.com with SMTP id b8so11337024edf.11
        for <loongarch@lists.linux.dev>; Sat, 26 Nov 2022 21:01:32 -0800 (PST)
X-Gm-Message-State: ANoB5pnNLAmlNOt2javWJlUrhVl6b/sdvAFcTYZZF8LHu4wnW+t1wjUW
	k75QB+iVM6wayer3VfIgJlfaq1z8zmiTx3ZEPKo=
X-Google-Smtp-Source: AA0mqf55bS1nRZOEiJH6TFVxm9l5obYLSN1ugZ6X8p84sbPvVWALTBC8rvOIUbzUo9WSbIoMokrNrJDchK1FZIemwBw=
X-Received: by 2002:a05:6402:5003:b0:462:a25f:f0f2 with SMTP id
 p3-20020a056402500300b00462a25ff0f2mr42425303eda.156.1669525291148; Sat, 26
 Nov 2022 21:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027125253.3458989-1-chenhuacai@loongson.cn>
 <CAAhV-H4Y5qHSXr2uHvMYpXMgvm5fU7WQmcALB+86OYkgM1XbOg@mail.gmail.com> <b9c0711c-6efc-4d84-af4e-62e585ac2fa6@app.fastmail.com>
In-Reply-To: <b9c0711c-6efc-4d84-af4e-62e585ac2fa6@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 27 Nov 2022 13:01:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7PifGc7jEmVURVYHXLdrKBGdRecjjLwOekeqS_cEXkxw@mail.gmail.com>
Message-ID: <CAAhV-H7PifGc7jEmVURVYHXLdrKBGdRecjjLwOekeqS_cEXkxw@mail.gmail.com>
Subject: Re: [PATCH V14 0/4] mm/sparse-vmemmap: Generalise helpers and enable
 for LoongArch
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	guoren <guoren@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Andrew,

On Tue, Nov 15, 2022 at 4:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Nov 12, 2022, at 11:26, Huacai Chen wrote:
> > Hi, Arnd,
> >
> > Just a gentle ping, is this series good enough now? I think the last
> > problem (static-key.h inclusion) has also been solved.
>
> Yes, this looks fine to me. Sorry I didn't have this on my
> radar any more.
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> I guess the series should be merged through Andrew's linux-mm
> tree. Let me know if for some reason I should pick it up into
> the asm-generic tree instead.
Another gentle ping, can this series be merged to linux-mm in the 6.2 cycle?

Huacai
>
>      Arnd
