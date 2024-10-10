Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17BB20697E
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728547489; cv=none; b=qIBZT6tW0IAoJ4Uq1tNCXrRXLgNCAwZnvJBT3KKimvQ7pIBHBli9V4cXz1faxDed5uvdDZaTs7SrvvEmC3p1ULnz4NyTVDS/scpdLsTG6iVGn2wmuEpDFWh6/9I9e0w4tuyLiWKezxP+4WVCZqNK15boYqrNUIT8lcXhDhbK31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728547489; c=relaxed/simple;
	bh=NOnTXEDf/afk98+qld6jjp5+THx/CJ1WRioKL/FDWFo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sBZ4OyigEBpTZY+dz5P/GhQ9v52hhT78yaas5OLRc+kkyc9Yd6VSXJBss4wfM+/igiqELNcCLK9pACrM5rCvOavbtqHkYhYFjihvF6s3gWA6N+RixQHIXzC3ad2WwFqJcvbE2inB69J3Wbo/en+P4rOm9wCKnmhM0lzsQp4U6JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Uq033xlP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Nj9Aq3SQ; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Uq033xlP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nj9Aq3SQ"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id C3AA3200A98;
	Thu, 10 Oct 2024 04:04:44 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 10 Oct 2024 04:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728547484;
	 x=1728554684; bh=NOnTXEDf/afk98+qld6jjp5+THx/CJ1WRioKL/FDWFo=; b=
	Uq033xlPTV7M/2uADh7Kio9qjd66ffU4q3GcfraER8vEa/TBgbChQu94tgVW0uaK
	pXY7jozzVwbQ8Ya36E7u9iUkDuo5YKVHqAZ8bHnde4FQoignkUnpk3n4zM1Ow7W7
	pqkYrDZJUqyVDWnJ/e/orVEawEFi2NxcxOe913glChgeWvLRHFRCYg7PLmzNjjTS
	eSePOXQiJ2tCm9PNXyY7XJEA1kK+QuyoayK9ccHLMT9vYJQf1obOma6+WcgoQiTZ
	rCO/F2/Av72l6mSdBDEcAONo4x3AsOj40QNPpgTyYIxpD0N35b0FMfAq0nEvPIBl
	9rL8hDdfC/9PQ9TN9ntljg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728547484; x=
	1728554684; bh=NOnTXEDf/afk98+qld6jjp5+THx/CJ1WRioKL/FDWFo=; b=N
	j9Aq3SQVxi0yJVoBcl9i4fPvQOr9zt3y3795lzIArZwRKLf5/Q4w5GwQVfCcJjw2
	fHBLG+SEwHxA6W6BHiC/PPRnfw/euhehOZaf1xv113bZQ6zyMXXYbDK6HO5DfYdH
	Eibe00/t7mBIfHVB6NfWSDQPb17/YR6D9/nYP8ncvwtzg1w0SRhao1eVbOXUQoCD
	BQ+bgHLpleoD/Ofkz0V77beK07p6f9+Z/PpeHiddKV5esYAsuKTALWIUlHtErlpZ
	nSRNyhpVsNrMAg/4A5we5y/Ae60B3fLfum5QuK2YeIDPuniByaQX2mlXBuk9KrEB
	oU607EYkl/nEhh1Im4Dyg==
X-ME-Sender: <xms:mIoHZxVyt1tzNiI4VJY1hNYpmWyw-lXg-LHPAPcu29enEAwaGYpqdA>
    <xme:mIoHZxmN7IaxN68cMSMreDSNvBHBsgqtLH3A4g9n2w8VJYGvEAjgnDn4AOFyZU_QE
    vsBIt0UiYw5NwZFtgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefgedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgt
    phhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoh
    epmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugies
    rghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlh
    gvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepphgrlhhmvghrsegurggssggv
    lhhtrdgtohhmpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtg
    hpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomh
X-ME-Proxy: <xmx:mYoHZ9bh6LF6KTO2BKN2BnO9EXila2P_h8xeEQcBucXDkGl-bl9M-A>
    <xmx:mYoHZ0XYOQUAKIkavDKienaDsb5i4U1ta4trA0rVHTXe2DqfK7yLqQ>
    <xmx:mYoHZ7nXzqM8PLVuQ-B9brlPZ_nY2zs1QH5-EF9GuGkQq2-TUCF-GQ>
    <xmx:mYoHZxesVGLkHmAI7smOEC31KKa8BnCQ7b4ijWZBlvNC6nhTWQi3Ig>
    <xmx:nIoHZ80_2WZbSEQjfuSnNnJS_LZIqjsOIz7pD44c1pM-ycg_PtUcKHaT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D17622220071; Thu, 10 Oct 2024 04:04:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 08:04:19 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Andreas Larsson" <andreas@gaisler.com>,
 "Andy Lutomirski" <luto@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>, "Brian Cain" <bcain@quicinc.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, guoren <guoren@kernel.org>,
 "Helge Deller" <deller@gmx.de>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Kent Overstreet" <kent.overstreet@linux.dev>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Matt Turner" <mattst88@gmail.com>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michal Simek" <monstr@monstr.eu>, "Oleg Nesterov" <oleg@redhat.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, "Song Liu" <song@kernel.org>,
 "Stafford Horne" <shorne@gmail.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "Vineet Gupta" <vgupta@kernel.org>, "Will Deacon" <will@kernel.org>,
 bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
Message-Id: <e1ba5ab2-a7e2-4f2c-8e2d-4788656ef695@app.fastmail.com>
In-Reply-To: <20241009180816.83591-4-rppt@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-4-rppt@kernel.org>
Subject: Re: [PATCH v5 3/8] asm-generic: introduce text-patching.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 9, 2024, at 18:08, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Several architectures support text patching, but they name the header
> files that declare patching functions differently.
>
> Make all such headers consistently named text-patching.h and add an empty
> header in asm-generic for architectures that do not support text patching.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
