Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F913BAEE
	for <loongarch@lists.linux.dev>; Wed, 11 Sep 2024 07:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039536; cv=none; b=o8YZisc9n8CDCoKiA2UgZva2/N4k9HOYcucTSa7e/cXcvSbbluitO8w38pQ41l/ERFYQ5v5329tneqh2Y1iQn8EtY1Z9KdDKRzmR0pHIpAAVbQXRSKZx3aaJ4pMIz35STRv3kdfqe0jBsB+BkcT3k3/J3sYmv6/mvXlQppEQY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039536; c=relaxed/simple;
	bh=ETLIKsU+6j3dbE0k0YACQOp91RGJ8e3OeoJa4Cxcffs=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JziYKN8XgkUmdYXw8m4E6FqPXodatmvzzmxjNP3K3yiU/a7ftI8wcgXl/gcVUwdJ42fNe7+/jlBpbfC1VL5F1tEw+uKsRLgzttq3EvVELcj3i51ueNThx6Z3TFkDfzKH1e6A/Qoya0c6x5ycEwJQyS72kEYg/0Clu5PbO3ChnCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VgpE/1U4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uPd7y278; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VgpE/1U4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uPd7y278"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 5FF0B20031F;
	Wed, 11 Sep 2024 03:25:33 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 11 Sep 2024 03:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726039533;
	 x=1726046733; bh=yCULKLzEw1t/f1sPt/nrm6FrZBRX7uDhUSLEPSMpBQQ=; b=
	VgpE/1U4loJri9LiuX7Zp3kpL8B/8h0OclDS8D2qwbi1j/gV/4Dv0Is+b0/KrUjc
	bgS87B1lv+q5Ww8OQNHMs7UUCFzhYwqeNEI7qcSCJ5R8Cz6zyi9VQfE3HuT6WlUU
	IJVyijW60CE0wSdiD0Z5i8cXac4tC2E4XXyQo+BIYzPN/E8AHr+rEYPKjJ2JEj3a
	pazvkihnp/Gt/CI+rGrCWj7mQ+PxlVRrdD8wErMCd+duga8MvKpYjHS0ASNqV5py
	eK8pix0YokPCoBvBj7t/5/L7Rr5Y6AZPgl9p66wMb8srBd3P1fQ0YCu+n/12a0kE
	LQn0BwlFInbl9ta8zMHnGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726039533; x=
	1726046733; bh=yCULKLzEw1t/f1sPt/nrm6FrZBRX7uDhUSLEPSMpBQQ=; b=u
	Pd7y278RoZsWfSRrvw+gMVM8jAt7Bbg3GADlLo3PeCstdM+9j+qexh54tdP/gEtN
	ajwYHFbXXYe6u4iRwBsf0Oz8q96Q3KjMJAv2xJFw6UFoUkBRCBX3RMeTShpc/wyl
	hNUDB3BLdBBIbAFkMJYs7OB7oV7KwNjpVkNxej7MFuimIz13nRM6ftAd+6d2rZEq
	ehlnSP5uoes83Td45KcieFiLmMqTPKRVrxnmi0V0urnvUpJ3vhmDr2eY8pEf7uo5
	+YsyctX/5nWESrcf7hSGMRlZHk3+LDTt6iyIFhst5Jqlh0c8MLw3YFK54iOERtxj
	fjHHFbXRHE0yCIbpPAOdQ==
X-ME-Sender: <xms:6UXhZslhiU1FurSmYueZbYv7HbWofGtwNnipVBqSz2PKanCywy8LTw>
    <xme:6UXhZr1UmyyvpIL8RtvBF9VbT8mMWJC_S1W0WAF1_2CYrkbegeGP1OBvPKJwa7c5q
    bXE0tg86Nb4G2YhoQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejtddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffghfetteehuefhgfetgefhtdeu
    feduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhope
    hlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishht
    ohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhi
    ugdrrghupdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtph
    htthhopegthhhrihhsrdhtohhrvghksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:6UXhZqo64Yf9aetQdYEe1AabvRLoXxI5u4FKjctMO5yoOUleq1zlNg>
    <xmx:6UXhZokiNvscpSgwGsF4sy_GGDcHivntiRwJ0PffeHdFNjeLD9YiyA>
    <xmx:6UXhZq2Oo3lGes2-0rpbjDy01o1V_VkSEWLa6XgJP-OipZiIuBcoDw>
    <xmx:6UXhZvvJNctQ6LgtY1_0Zu1dZVxD11ZkLJkfaUAiz-d-LIJwck0YeA>
    <xmx:7UXhZgGR9tz3pIskqmga3-R-2tuRDU1veIZMJt9PoW0NK4-vAcGX0h_v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 466A32220072; Wed, 11 Sep 2024 03:25:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 11 Sep 2024 07:25:08 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, guoren <guoren@kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
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
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, shuah <shuah@kernel.org>,
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
Message-Id: <8130e50c-01e2-45c3-a516-45f5499311f2@app.fastmail.com>
In-Reply-To: <ZuDoExckq21fePoe@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024, at 00:45, Charlie Jenkins wrote:
> On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
>
> I responded to Arnd in the other thread, but I am still not convinced
> that the solution that x86 and arm64 have selected is the best solution.
> The solution of defaulting to 47 bits does allow applications the
> ability to get addresses that are below 47 bits. However, due to
> differences across architectures it doesn't seem possible to have all
> architectures default to the same value. Additionally, this flag will be
> able to help users avoid potential bugs where a hint address is passed
> that causes upper bits of a VA to be used.
>
> The other issue I have with this is that if there is not a hint address
> specified to be greater than 47 bits on x86, then mmap() may return an
> address that is greater than 47-bits. The documentation in
> Documentation/arch/x86/x86_64/5level-paging.rst says:
>
> "If hint address set above 47-bit, but MAP_FIXED is not specified, we try
> to look for unmapped area by specified address. If it's already
> occupied, we look for unmapped area in *full* address space, rather than
> from 47-bit window."

This is also in the commit message of b569bab78d8d ("x86/mm: Prepare
to expose larger address space to userspace"), which introduced it.
However, I don't actually see the fallback to the full address space,
instead the actual behavior seems to be the same as arm64.

Am I missing something in the x86 implementation, or do we just
need to update the documentation?

      Arnd
