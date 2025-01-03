Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547691BD014
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895245; cv=none; b=R+frpI6pFb05xHY+B7nTxs4RbZVuOtXzmkmZv/2DocyYqPsKNpJyyfpHXnsBE4sD3ele4ZV71VPxJSO8pwWf53V9xV6L0pT+swYbs6N/bs5ErTdwi19O1KdiBaehgGqMQ+nKLHBev9jvXM6RJlvrIOZ4+ETTRApoXT87H5xQUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895245; c=relaxed/simple;
	bh=K9st+7aPqLAkwluHiIBgdHOBzfNVOdFFl66bwJO+MPg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QhB1L/TgspG2WDwrl1eonHk04KTkvIMcNv7SLiX6EMnlgwiBGzgQaOaeLSMZTWq/zuCBk55IC34yvxd1p43RUkmm7tYTH4CqbJMiUALPgv/MlbKfM4nwRxIystwwtKlmYuDgNFcq43a2Qw3isMJVmPAx9oqVjZrF4A1k0ryn0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aIqih0QG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l8wPTT0/; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aIqih0QG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l8wPTT0/"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 81DC113801B9;
	Fri,  3 Jan 2025 04:07:23 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Fri, 03 Jan 2025 04:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1735895243;
	 x=1735981643; bh=VRryj5gzC9tzAMCX4DBxEnZamc9OxnsDUNJRKyBBvmI=; b=
	aIqih0QGLyoFFCc/a8RLyFCcaGBS2GywlvqtVxR+jg8fW0OQAJK5OXIR4kS4VVkv
	2y7tb65rlkBoJpmWE4Vll0FRh/hTzCfDQVXiU12vUFiJWM9nQUdocbneHf6CpSsX
	WjTrsGGb9ruC/1+p7uIaUNDDRaZf/fHvSl55Waaotoa60SOugjx/r6s8ScG8snNg
	r9jbKy51UdHIHw3U0/bZKXHxX4Jrev8ekKKq2AjAHmeV/HG+Yu0avZVRInvOSk5P
	gnBJJNvCu0Y9Mr+tkQ8X7tJ5JomRzGCeFEgGo/stmJkT5e9sofgqz3/R51P3mDzu
	5VYqL66xFifkIRWAkYwFIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735895243; x=
	1735981643; bh=VRryj5gzC9tzAMCX4DBxEnZamc9OxnsDUNJRKyBBvmI=; b=l
	8wPTT0/mHGRguwzrGiJWkiHf9DAg2dkPN7ZRatqGU1NeZnYDZamDgWkRs1qqmk4+
	9saBGf5FOOHF00dI04kCn4Rv3Ochai35K2dUigQDRI1g0bULTpG6QuM/y4QKm7pD
	EyKAWsbWNO5TC1GM2b/fjR6I2ce3c4C2VJu+xYmy5aHv+BwNu4i0sH1HHCs/ayRs
	XupTFHfK+rA5JCere+aCSiXK+UwYN2OVtOdw5k155CZbBz+AJkMutBihX3Ox4+tT
	REAjeSSYAH+eeBTZJatHoeJB+qTqak8Yo6m2CunjvedE7GBXLBSGJWx8Rs22DRxT
	GJOGMB5mC80xal4Yq/FgA==
X-ME-Sender: <xms:y6h3Z_NmNNkhFiy5wdvu8QmHg9cQN7Q2Row--VBiq86VwCWofqiXlQ>
    <xme:y6h3Z59DyHnNJ00y0LYmMTxNT41TxwSaW5zv7C_f4tAjq6TMx4rlWM9fcqymoEzny
    _heP1yfrDafySWe2aY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeffedguddvlecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:y6h3Z-T8-fZraDeTKHQLV4ht638hg-PNB4moxhk_NtF-6i-hxncvXQ>
    <xmx:y6h3ZzvxuOCtRagkaJDw0DhA9URUt9qY-CDm69wEExFMPq_3lYCiEQ>
    <xmx:y6h3Z3d8IaCQYSDt0OyREnldcjIO27yXMpLXWMo9rrRwpAHPHuaLzw>
    <xmx:y6h3Z_2Er7Qcx4gYSPrveayajb9NCZD07V3imEdbTDIHSFV-g6XjdQ>
    <xmx:y6h3Zz6tco85Ep-3ihtZJbkOgtMl_RT05KS-wHz8kCLHASb-ieUNQWkz>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 46A4D1C20066; Fri,  3 Jan 2025 04:07:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 03 Jan 2025 09:07:03 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Xuerui Wang" <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <bc8ea6e0-f08d-4841-9528-8ebb4eda8dc6@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H6_08dk6-Q1MiQTjD4pdyxyeXx3Gd6rzVkSzaq0yLEGYA@mail.gmail.com>
References: <20250102-la-misc-v1-1-8dc7db525e54@flygoat.com>
 <CAAhV-H6_08dk6-Q1MiQTjD4pdyxyeXx3Gd6rzVkSzaq0yLEGYA@mail.gmail.com>
Subject: Re: [PATCH] loongarch: time: Derive max_delta from prcfg1 tmrbits
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=883=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=882:36=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> Hi, Jiaxun,
>
> On Thu, Jan 2, 2025 at 10:05=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygo=
at.com> wrote:
>>
>> As per arch spec, maximum timer bits is configurable and
>> should not be hardcoded in any way.
>>
>> Use prcfg1 tmrbits to determine clockevent's max_delta
>> to be conformance.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> LA32R doesn't have prcfg, maybe we should handle this
>> during cpu-probe and save it in cpuinfo_loongarch,
>>
>> What's your opinion, Huacai?
>> ---
>>  arch/loongarch/include/asm/loongarch.h | 1 -
>>  arch/loongarch/kernel/time.c           | 7 ++++++-
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/=
include/asm/loongarch.h
>> index 64ad277e096edd7d77af6f37e234d68e571764a4..a3cc4f8d4c4a0b0521ef2=
b76c87fa57eca417d75 100644
>> --- a/arch/loongarch/include/asm/loongarch.h
>> +++ b/arch/loongarch/include/asm/loongarch.h
>> @@ -466,7 +466,6 @@
>>
>>  #define LOONGARCH_CSR_TCFG             0x41    /* Timer config */
>>  #define  CSR_TCFG_VAL_SHIFT            2
>> -#define         CSR_TCFG_VAL_WIDTH             48
>>  #define  CSR_TCFG_VAL                  (_ULCAST_(0x3fffffffffff) << =
CSR_TCFG_VAL_SHIFT)
>>  #define  CSR_TCFG_PERIOD_SHIFT         1
>>  #define  CSR_TCFG_PERIOD               (_ULCAST_(0x1) << CSR_TCFG_PE=
RIOD_SHIFT)
>> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/tim=
e.c
>> index a07d7eff4dc5fb0f41f5fad02698ff7a84c7bc8a..bde2297f139c2d5e26894=
a2ebc1748cc6fef3146 100644
>> --- a/arch/loongarch/kernel/time.c
>> +++ b/arch/loongarch/kernel/time.c
>> @@ -126,16 +126,21 @@ void sync_counter(void)
>>
>>  int constant_clockevent_init(void)
>>  {
>> +       uint32_t tmrbits;
> tmr is a strange short name, you can use timer_bits or tbits for short.

That=E2=80=99s the one from the manual :-( I=E2=80=99d agree with you th=
ough.

>
>>         unsigned int cpu =3D smp_processor_id();
>>  #ifdef CONFIG_PREEMPT_RT
>>         unsigned long min_delta =3D 100;
>>  #else
>>         unsigned long min_delta =3D 1000;
>>  #endif
>> -       unsigned long max_delta =3D (1UL << 48) - 1;
>> +       unsigned long max_delta;
>>         struct clock_event_device *cd;
>>         static int irq =3D 0, timer_irq_installed =3D 0;
>>
>> +       tmrbits =3D read_csr_prcfg1() & CSR_CONF1_TMRBITS;
>> +       tmrbits =3D tmrbits >> CSR_CONF1_TMRBITS_SHIFT;
>> +       max_delta =3D CLOCKSOURCE_MASK(tmrbits + 1);
> I prefer to evaluate the tbits and max_delta directly when declaring t=
hem.

Will do in v2.


Thanks

>
>
> Huacai
>> +
>>         if (!timer_irq_installed) {
>>                 irq =3D get_percpu_irq(INT_TI);
>>                 if (irq < 0)
>>
>> ---
>> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>> change-id: 20241223-la-misc-d610d14f947e
>>
>> Best regards,
>> --
>> Jiaxun Yang <jiaxun.yang@flygoat.com>
>>

--=20
- Jiaxun
