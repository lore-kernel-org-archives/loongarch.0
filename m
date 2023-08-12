Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E21CCBD
	for <loongarch@lists.linux.dev>; Sat, 12 Aug 2023 08:02:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 53EDC580361;
	Sat, 12 Aug 2023 04:02:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 12 Aug 2023 04:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1691827352; x=1691834552; bh=B7
	pOJdGFDOf/BCasjh0dVOxmA3Mm35lZV2aH6kqC0w8=; b=F8VTMnEu+WAEaSI8ev
	8dpIfLM4+oZGC3Fvpn68KvPIKWsfcU17SQhjwHufScXsMsXDuwt6XeedGUhblfys
	hs4xce37xNWNfWz8ej1A5ttaAvhOmMOB9IsLSlLkKJvdTPf8pe8EK/EKye4odYV3
	iy0q7v1DVZZC2m89e6fF8SXEcU9ZTHRRD4NDR38GwL+pLR3MBK5Wg/T9GKyH0Sd+
	g5MnZwZwhYg6nK5jXydKxkuqxQ4dCh2n1DIO6sGkaB6ILOYrbarjNwmRThbHDQoQ
	1qCixnwaubCrx4LoC9y/tkCZnWvuaCmjXATLNxjkdSLgyNKu8b7A8D9PrJ+WT9kC
	9bIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691827352; x=1691834552; bh=B7pOJdGFDOf/B
	Casjh0dVOxmA3Mm35lZV2aH6kqC0w8=; b=c/aTYYn0Z+cUZ0NUCJyxNWN19dfUg
	zkqsvmm3RuR5hIpA4ulOuDJXk+/83/3VaTcoCM//o6Ejm5/10o00E18HZJtG2gjG
	6ZD6EGdHPChzsNs8ZKlj3wVJzWX+8UIRfbTT87iX5r3/vwD6ozaK1rEEeh1mVM/7
	ra8F2i5GMdsnVTdDrdjlBljSZ6ErxvHL5socxr9xLP9SiAqbHq+clCY8FxlbffSt
	t/wYBLNxLxzyLcJOnLcaAVUvkAV5XyzC8eUdOSrWMUCz7WvMZW+ySI1H9VAu8OQw
	u5wsUq03BMEVxII/bvgwpjG1G4TqNwrLfsdkTzjkHEit7bawAdaWny+NA==
X-ME-Sender: <xms:lDzXZATraP3ZZ30zeDvLHggEXgACbDwq6WZEn9H5Pxv5O7fJZgN-1g>
    <xme:lDzXZNzEd5ApK265BQp2jyMbtIjXWUUk-EQ4i2TIeOVzMnojFPXp0tcfjkGjcF-BV
    BkVhX5oezoCsQ0RLA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleelgdduvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lDzXZN3RDFhUYL5CdRmcDHLd0GstqaBIOVltd_DYF6yURxVhph5pLg>
    <xmx:lDzXZEBVoWRKU5vHFm1ry0MHXHCkhvfn437jYMw8d9jeyK3WoRORsQ>
    <xmx:lDzXZJiQjB7YnsdHMe0qXCv5ZiPTJN47Loj4zXcgJPZpRfqeXqacsw>
    <xmx:mDzXZKK2u_iymKCkBM9SdskqG7gJ76GE3P_8rJMuOXVnDraQ-7hFrw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3DD63B60089; Sat, 12 Aug 2023 04:02:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <13f9c06a-f840-4010-ae2f-97d8b2883e76@app.fastmail.com>
In-Reply-To: <ZNaVYh2qi0VQQKWf@antec>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-17-arnd@kernel.org> <ZNaVYh2qi0VQQKWf@antec>
Date: Sat, 12 Aug 2023 10:02:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stafford Horne" <shorne@gmail.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, "Matt Turner" <mattst88@gmail.com>,
 "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Jonas Bonn" <jonas@southpole.se>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 x86@kernel.org, "Borislav Petkov" <bp@alien8.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 sparclinux@vger.kernel.org,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Youling Tang" <tangyouling@loongson.cn>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Zhen Lei" <thunder.leizhen@huawei.com>, "Xin Li" <xin3.li@intel.com>,
 "Nhat Pham" <nphamcs@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Marc_Aur=C3=A8le_La_France?= <tsi@tuyoix.net>,
 "Johannes Weiner" <hannes@cmpxchg.org>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 16/17] [RFC] arch: turn -Wmissing-prototypes off conditionally
Content-Type: text/plain

On Fri, Aug 11, 2023, at 22:09, Stafford Horne wrote:
> On Thu, Aug 10, 2023 at 04:19:34PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>

>> arch/openrisc/mm/fault.c:44:17: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
>> arch/openrisc/mm/tlb.c:188:13: error: no previous prototype for 'tlb_init' [-Werror=missing-prototypes]
>
> I'll try to get these fixed for 6.6.  I was looking at them recently but did not
> actually make any changes and just put on my TODO.  Your series moves it up in
> priority and it should be easy to get the fixes out.

Thanks!

Since we already have the majority of architecture maintainers stepping
in to fix the warnings, I wonder if I should just drop my patch 16/17
completely and let the others handle it as well rather than shutting up
the warnings. Only the asm-offsets change is really needed to compile
test most of the kernel even with CONFIG_WERROR, and without that this
is just some harmless output.

    Arnd
