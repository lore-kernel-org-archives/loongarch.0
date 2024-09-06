Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAA11C86E4
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725614075; cv=none; b=NcF/csYJ9MlCsOAuR1fgXODd6ZryBT5u3ROUkBP5BMK1H01LwzJWfzz479lMWL8k7nIdIeI07oWn0fsPnmZvTJ41vMuUDLUh3eyERbLbnNrTxL9D9iihkxG+yjY6f/8xMzSMC4urQw/rahvOeWAl1/67pSZTOL1wJbhKN6wpDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725614075; c=relaxed/simple;
	bh=jPis5Ya78L2vEYZAaqdoWNMrUU8EN6+BbzHRxoHY8SA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dwuJTbeYZF6OZfdLI9Zbr4x7W+nr5WTmHE81r3onwAmDnltrMYCltHS9g57/+FCkPuXNqE2iPs+laGE4Zy8s0R5SioXcjXBv+8IJih4ginWDKJuJfZfXGxSsYNahivU4Lw5yVr7m9j1gmxZpF3rhH8CikMQlvL4n76Zsb4+ML18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=qSNYokqu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GP0u48yY; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="qSNYokqu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GP0u48yY"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id DDEA7200175;
	Fri,  6 Sep 2024 05:14:31 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Sep 2024 05:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725614071;
	 x=1725621271; bh=HqqZZ6TfA9de4ir05q0Y8WhAGkTcX7yt1g8RzTkpSrA=; b=
	qSNYokquTBb36v/l2H+5umTZJpjnq4aypJ/npxpzHmDdxBDZ1Fxf8dUNOmMkRFA1
	YXybRlGR2AZy4RgwNXAktBgant6gRKCjXuQ/Bvwy7XoLfGCi3yJ8afo4cstP1uXY
	BMM6hndRke9GmnlOkrCMNLsFNmZm28J17yqN1sYaV7uvXoOt2clukefCVWe5q57x
	+IoAM+9epy+YDnFO9xuu7p22MvIZ+6+elSsFVr5cigUC+KeXJx9tNME+Dkv5YIT9
	jtkK+jaXGmIw0PrzBLCS27eUdiIAeIxJ7A+gunA9b/4hXvpjB65PvKrSoSkZsLue
	SJupCGJVUseiWtWwWes1jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725614071; x=
	1725621271; bh=HqqZZ6TfA9de4ir05q0Y8WhAGkTcX7yt1g8RzTkpSrA=; b=G
	P0u48yY13W+zNvKQlBemH/22HdGBDJ67Vgk51dvta0gc3WKYa5pc4AyiRK4VqGpb
	YW8vfxfHI5BPqtTBmISn2BHVcF7nfhib7BFIlMddw8S+zScfxauirBva4TPbloWP
	l9p5UYW/hoQqqZXHZEHtkWbwdQiyqzzgXZIZKjLP6t4KEA1kyxnb96Nl7Z2U03Kn
	CwOrrVmSUlerPWhcj9p0VhbNBqsOhsfAEruNjSMiVt1FQdR8S8VanLAF7I/TT2XJ
	SI1tW1fea/gPn7Bg86agsvGPFEj6KA43twP1r2F/Hl9gonTAKDpMEhShfUEOzQ4e
	3LvQecbBtSoS8en2fx8yw==
X-ME-Sender: <xms:9cfaZtm4_NI2Mp1so2dO9xtE-zcRvr_GJn8AeR8VuFqRPRyzvuf77w>
    <xme:9cfaZo3Gr8EoEFBHqJMbxMY2XO8sr1DVphholCi3rg8sxsZYZ-sEx7E6ZQ-n5suTe
    3xx7S-opGfECWe7fQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthh
    hrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepuggr
    vhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmphgvsegvlhhlvghrmh
    grnhdrihgurdgruhdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
    pdhrtghpthhtoheptghhrhhishdrthhorhgvkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehmrghtthhsthekkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:9cfaZjqQlqsTy37ZrJfTAtj2I3ENno6xYu-yJcaK9ki62bYQUPMzbg>
    <xmx:9cfaZtnwCtu_ljMgv5BuNV_nIahG4cliTZ72GQAaM-5mSVbe0rz39w>
    <xmx:9cfaZr1GW4q_hWUIQ_jc9R3zfS34r-un3P-Xi7ylpO1hKPAvbVhQuA>
    <xmx:9cfaZsuIjYegxC94IQ_SXDEencsW9zI1BcxpRXGp49Rvj7AZNmAhAw>
    <xmx:98faZhHmr_ydm6E8HlMZov6cLoccR_mj7MU8ylWAyqznrAX2hRj7JBw9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 84B61222006F; Fri,  6 Sep 2024 05:14:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 06 Sep 2024 09:14:08 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>
Cc: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, guoren <guoren@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, shuah <shuah@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <7be08ea9-f343-42da-805f-e5f0d61bde26@app.fastmail.com>
In-Reply-To: <58f39d58-579e-4dd3-8084-baebf86f1ae0@lucifer.local>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <58f39d58-579e-4dd3-8084-baebf86f1ae0@lucifer.local>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 6, 2024, at 08:14, Lorenzo Stoakes wrote:
> On Fri, Sep 06, 2024 at 07:17:44AM GMT, Arnd Bergmann wrote:
>> On Thu, Sep 5, 2024, at 21:15, Charlie Jenkins wrote:
>> > Create a personality flag ADDR_LIMIT_47BIT to support applications
>> > that wish to transition from running in environments that support at
>> > most 47-bit VAs to environments that support larger VAs. This
>> > personality can be set to cause all allocations to be below the 47-bit
>> > boundary. Using MAP_FIXED with mmap() will bypass this restriction.
>> >
>> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>
>> I think having an architecture-independent mechanism to limit the size
>> of the 64-bit address space is useful in general, and we've discussed
>> the same thing for arm64 in the past, though we have not actually
>> reached an agreement on the ABI previously.
>
> The thread on the original proposals attests to this being rather a fraught
> topic, and I think the weight of opinion was more so in favour of opt-in
> rather than opt-out.

You mean opt-in to using the larger addresses like we do on arm64 and
powerpc, while "opt-out" means a limit as Charlie suggested?

>> > @@ -22,6 +22,7 @@ enum {
>> >  	WHOLE_SECONDS =		0x2000000,
>> >  	STICKY_TIMEOUTS	=	0x4000000,
>> >  	ADDR_LIMIT_3GB = 	0x8000000,
>> > +	ADDR_LIMIT_47BIT = 	0x10000000,
>> > };
>>
>> I'm a bit worried about having this done specifically in the
>> personality flag bits, as they are rather limited. We obviously
>> don't want to add many more such flags when there could be
>> a way to just set the default limit.
>
> Since I'm the one who suggested it, I feel I should offer some kind of
> vague defence here :)
>
> We shouldn't let perfect be the enemy of the good. This is a relatively
> straightforward means of achieving the aim (assuming your concern about
> arch_get_mmap_end() below isn't a blocker) which has the least impact on
> existing code.
>
> Of course we can end up in absurdities where we start doing
> ADDR_LIMIT_xxBIT... but again - it's simple, shouldn't represent an
> egregious maintenance burden and is entirely opt-in so has things going for
> it.

I'm more confused now, I think most importantly we should try to
handle this consistently across all architectures. The proposed
implementation seems to completely block addresses above BIT(47)
even for applications that opt in by calling mmap(BIT(47), ...),
which seems to break the existing applications.

If we want this flag for RISC-V and also keep the behavior of
defaulting to >BIT(47) addresses for mmap(0, ...) how about
changing arch_get_mmap_end() to return the limit based on
ADDR_LIMIT_47BIT and then make this default to enabled on
arm64 and powerpc but disabled on riscv?

>> It's also unclear to me how we want this flag to interact with
>> the existing logic in arch_get_mmap_end(), which attempts to
>> limit the default mapping to a 47-bit address space already.
>
> How does ADDR_LIMIT_3GB presently interact with that?

That is x86 specific and only relevant to compat tasks, limiting
them to 3 instead of 4 GB. There is also ADDR_LIMIT_32BIT, which
on arm32 is always set in practice to allow 32-bit addressing 
as opposed to ARMv2 style 26-bit addressing (IIRC ARMv3 supported
both 26-bit and 32-bit addressing, while ARMv4 through ARMv7 are
32-bit only.

      Arnd
