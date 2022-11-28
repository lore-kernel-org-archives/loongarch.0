Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB4AD27
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 23:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEA6C433D6;
	Mon, 28 Nov 2022 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1669677006;
	bh=Z/itbdefigEkmW9ubXmwx/IWcP+dYHfAaiqq0syhieQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zoujZvTTGZ/7PzKtBN3jnsRdwHk6AGdfYydfuv0cnu8pxGG4Z5OsihxFXGZO+7uwU
	 XXRT0z9WWgHbdxdSvSXeg2l7EcYoNalJSgNCRhgKmWmheim0iIuhoxLWu6S/w8xw/X
	 ZkEIsPzG00T/4bEyTIjImIKg7FFj1F77JrfrNXJ4=
Date: Mon, 28 Nov 2022 15:10:05 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>, Xuefeng
 Li <lixuefeng@loongson.cn>, guoren <guoren@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-mm@kvack.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Feiyang
 Chen <chenfeiyang@loongson.cn>
Subject: Re: [PATCH V14 0/4] mm/sparse-vmemmap: Generalise helpers and
 enable for LoongArch
Message-Id: <20221128151005.916e4373cd4e5808111dea0c@linux-foundation.org>
In-Reply-To: <CAAhV-H7PifGc7jEmVURVYHXLdrKBGdRecjjLwOekeqS_cEXkxw@mail.gmail.com>
References: <20221027125253.3458989-1-chenhuacai@loongson.cn>
	<CAAhV-H4Y5qHSXr2uHvMYpXMgvm5fU7WQmcALB+86OYkgM1XbOg@mail.gmail.com>
	<b9c0711c-6efc-4d84-af4e-62e585ac2fa6@app.fastmail.com>
	<CAAhV-H7PifGc7jEmVURVYHXLdrKBGdRecjjLwOekeqS_cEXkxw@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Nov 2022 13:01:19 +0800 Huacai Chen <chenhuacai@kernel.org> wrote:

> Hi, Andrew,
> 
> On Tue, Nov 15, 2022 at 4:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, Nov 12, 2022, at 11:26, Huacai Chen wrote:
> > > Hi, Arnd,
> > >
> > > Just a gentle ping, is this series good enough now? I think the last
> > > problem (static-key.h inclusion) has also been solved.
> >
> > Yes, this looks fine to me. Sorry I didn't have this on my
> > radar any more.
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I guess the series should be merged through Andrew's linux-mm
> > tree. Let me know if for some reason I should pick it up into
> > the asm-generic tree instead.
> Another gentle ping, can this series be merged to linux-mm in the 6.2 cycle?

It's a pretty large patchset and I'm a bit concerned about the amount
of review and test which it has received from the MIPS side?

Prudence suggest that we merge this in 6.3-rc1.  But I'll queue it up
for now, get a bit of testing while we consider this.

