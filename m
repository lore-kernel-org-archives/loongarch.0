Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCBC1C5F2D
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735894979; cv=none; b=TS/S9WAHhrs20meagOBJIxGLnmGKdwbTrf5bQW4+mvhhwuncXPQrd8rvEq21M8cg+pVh4XrRJHDh2O/ophewU0QNoPXSN7kBiJWI3XUKUBr1SqWENKbUCcLZHy84PGcI9QMOaHLzF/jTB6AJmc20v3pTNiFQVChbfImE19YXKLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735894979; c=relaxed/simple;
	bh=mGHOTjseqnGGnZUkT5svuqevhIo8uyW4SeWO2pZ8n8Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Zevh3liOXSxoAXoG91XWw7uE+8R9WoL1/4259LaShz0JTnvVoMFV6rAyxwEExxVtDjmhxbovhdSt1zNiS/38A8FxWINihyZU1s6odHc3RiHsCZYmX8FMJQ+u4nYxcNA4lW8vAxLQNSnA1hQjBHLplYomgfWQIkY70XJ+tLIkLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=qwSmVVMd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HxXgbiex; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="qwSmVVMd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HxXgbiex"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C3AB4114021E;
	Fri,  3 Jan 2025 04:02:54 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Fri, 03 Jan 2025 04:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1735894974;
	 x=1735981374; bh=gcGsjDGmi1GDSlXQGk9Ux1eRpj+651xxFbIDstpcR68=; b=
	qwSmVVMdAJc1+brln3mbHXPXtmr9bL7twnkkzWAzS6UTwWj/BhXZIR5v9RE9Qkhz
	Iir+PKDaDpfJRZqP1tyEU+pLLmI+zynSHhEgPrKt3/4JINc29pcd9lFEHlaVPf12
	d/4E61GD1LxfqgXvn6ciJKthiaJbq1JgKCxtqj0B904q2DXctCGncY/xIZl/3Tkd
	kIvaRoqX06911UxhulWXAtl82W6QW1IagpkCGP/JPn7qQfMI1T3FW4RLP2elGNV/
	IM1kRG16cFPjpqGXvxpfxSE9F6JKMGIxR5ndv+/n0BfvoKo6oAltaVF/GFmN9Q2E
	6DpF98i/XmLavCwBHiEQnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735894974; x=
	1735981374; bh=gcGsjDGmi1GDSlXQGk9Ux1eRpj+651xxFbIDstpcR68=; b=H
	xXgbiexj33U2LNFJ93Rvarmfs0NuvhoixmH+plVn62ZTHgbJqmDAh9GlyTDEiXPd
	H4YRSbNktMMlj23DO/srhcTbi1xckrd0vzOqbfPkKKoNQgbrlfTBx4hQSL20JztW
	jZtE6BEkvYaa+Qu6pfkroV9EkRgLjf1vSyUYL29SP0GyF9hzaeF3uKC2URK68ge1
	0NIlSpURcB3wwcvE5H/ayLh2ozAvYmP7JHVmwT63x1xAgtoRLbxquDwkuCuWgz4y
	PRNlAWjsy5x8+4onI0ODYWHFtJ8oquN4RNcE8tfcLgtuAF15DSEIWHcYvVXBzVs8
	jLTgcSroPuaqR/EtiRlAQ==
X-ME-Sender: <xms:vad3Z0EeKjwOashy4PTL1Y6Y-j8kYJkOfXSLur8OSNcwqAd0_JuJQg>
    <xme:vad3Z9Vj__6-i2uvzMll6ld5qKyhpxBG4i6jrroe02fjACK5dao2CsP6tlmbWk7An
    xzEsNlIif5uVO2Gk4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeffedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhho
    ohhnghgrrhgthheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghr
    nhgvlhesgigvnhdtnhdrnhgrmhgv
X-ME-Proxy: <xmx:vad3Z-I3K7z50agXDIEuVmzkBvw47ye7_nwYBvADTiVquk6g9J2e3Q>
    <xmx:vad3Z2FD17d-2f3D_hYPUxX4gpWwpOn7eq02tGjxB6G2ipF8vAtXkg>
    <xmx:vad3Z6Wa4CSkyfwYTfiu9a3zbUb54HfYEbwwHvSjFSVCkI2wccNpHw>
    <xmx:vad3Z5OylKXgsmMuY0cVYXvBd0V54UgTd8mnwdVnODE7zdEnJRDxAQ>
    <xmx:vqd3Z5S3-7SMRyHbOJC6T9a1cVlz9REvbk9maOR5bPS6BKusp-y6vG0v>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B693D1C20066; Fri,  3 Jan 2025 04:02:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 03 Jan 2025 09:02:33 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Xuerui Wang" <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <05ac2a87-7f60-4336-a323-443967a77a76@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H44VvyxHqmyQ3K8qC+HERH0FjheqAJpDCiYkQ2oK2woAg@mail.gmail.com>
References: <20250102-la-earlycon-fixed-map-v1-1-23fe3a6681c4@flygoat.com>
 <CAAhV-H44VvyxHqmyQ3K8qC+HERH0FjheqAJpDCiYkQ2oK2woAg@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is enabled
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=883=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=882:38=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> Hi, Jiaxun,
>
> On Thu, Jan 2, 2025 at 10:34=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygo=
at.com> wrote:
>>
>> When ARCH_IOREMAP is enabled, we are using always accessible DMW
>> for ioremap. It makes no sense to create a dedicated mapping for
>> earlycon given that we can access the region via DMW.
>>
>> Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is selected. This can
>> ease debugging for early mapping issues.
> Fixmap has nothing to do with IOREMAP, whether you use ARCH_IOREMAP or
> GENERIC_IOREMAP, earlycon is mapped by fixmap rather than ioremap().

When you have ARCH_IOREMAP it=E2=80=99s not necessary to create fixed ma=
p for earlycon.

As ioremap along is sufficient to access MMIO.

I=E2=80=99m doing this as it can help with debugging early mapping issue=
s.

Thanks

>
> Huacai
>
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  arch/loongarch/Kconfig              | 2 +-
>>  arch/loongarch/include/asm/fixmap.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 1c4d13aa677e2e04b9791882fba7523f93d6a69d..ad8a8cf75343799ea626b=
e52f521fa75e7cbe07b 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -246,7 +246,7 @@ config MACH_LOONGSON64
>>         def_bool 64BIT
>>
>>  config FIX_EARLYCON_MEM
>> -       def_bool y
>> +       def_bool !ARCH_IOREMAP
>>
>>  config PGTABLE_2LEVEL
>>         bool
>> diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/inc=
lude/asm/fixmap.h
>> index d2e55ae55bb9c499b9a685509bc26d663054b58e..905dc7a5f9fa52ac924fe=
832749f39283c28a9f8 100644
>> --- a/arch/loongarch/include/asm/fixmap.h
>> +++ b/arch/loongarch/include/asm/fixmap.h
>> @@ -12,7 +12,9 @@
>>
>>  enum fixed_addresses {
>>         FIX_HOLE,
>> +#ifdef CONFIG_FIX_EARLYCON_MEM
>>         FIX_EARLYCON_MEM_BASE,
>> +#endif
>>         __end_of_fixed_addresses
>>  };
>>
>>
>> ---
>> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>> change-id: 20250102-la-earlycon-fixed-map-d6a48bd5b831
>>
>> Best regards,
>> --
>> Jiaxun Yang <jiaxun.yang@flygoat.com>
>>

--=20
- Jiaxun
