Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACD8D2FF
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 04:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725598143; cv=none; b=joVCImIBMLr/Gob1SoKPfGYewSJnpVlyDaDuNa599757CCZcKcEMRWcCKGuMnz50Qmhdnq1p5eiWX9LJYDHHZXp6lN0ZRNtFEDluOLCH3hYKwLVEWWwm9XySIymhhRVgaYS39WQcdUXfLDbdYdfo7SQRkm3GjETbR7zmzZv0drk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725598143; c=relaxed/simple;
	bh=y9EL/waO3ThOXAcimfyEvlfLj2n3JQZd0jXVcJGHp2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo2SUtbo1kjBTptif7lVLRSeo7f6+s2hmUr1XkFDsd+Wnt/JULqGmSGmXdZgNWiwm2LRSbM8HXZZ5m1+LmDLbalx3opl1I0LpI9RovtI99SuWah4kEmltqGiCQt2fjYKGwpROQDE2cRqPdqGWngPOYCw46gl2hDjzhbldgnWcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=QW+fRJ4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QW+fRJ4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873B6C4CEC6;
	Fri,  6 Sep 2024 04:49:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QW+fRJ4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725598141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZnG4i8+4nrMIcvsCOrhtQX7nA+5P6IoIK8J79TbA84=;
	b=QW+fRJ4rdVfnN9bJtWquOOwt8yk/sofmpfyVsZAUvkyU3+L4DAtVK79tJThbiwaNg5EK80
	UGtvuhdGgo/B3vPsWc/EMvexAee4C4KpUTF8UFTUrpUrzOkDOVr/puB5Eld48PA5JndFa/
	zYBhenabsv9vPUbhE7ZbPFHMdatKF3s=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2a9701d1 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 04:48:59 +0000 (UTC)
Date: Fri, 6 Sep 2024 06:48:57 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: maobibo <maobibo@loongson.cn>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	loongarch@lists.linux.dev, qemu-devel@nongnu.org,
	xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <ZtqJuTTR0wdcVXdz@zx2c4.com>
References: <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
 <ZtnGA4mH0I2hdx4N@zx2c4.com>
 <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de>
 <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
 <b11ba2f4-ba4b-40fb-860e-e10e760562fe@t-8ch.de>
 <CAHmME9pjokr=ahBbJA9Ljf8jjOyfyRAk0Qo4YeDYO_gs78GGzg@mail.gmail.com>
 <7311f2fa-2353-48ad-85f5-5eae1f6cb65f@t-8ch.de>
 <bac8575f-1c43-1242-9113-ef7957b50e68@loongson.cn>
 <CAHmME9pEw7_A5fSAooZLM9NGEpRN+05woicq8-qEjMqgBB8DwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9pEw7_A5fSAooZLM9NGEpRN+05woicq8-qEjMqgBB8DwA@mail.gmail.com>

On Fri, Sep 06, 2024 at 06:04:25AM +0200, Jason A. Donenfeld wrote:
> On Fri, Sep 6, 2024 at 3:14 AM maobibo <maobibo@loongson.cn> wrote:
> > yeap, will submit a patch to expose ACPI GED pm interface with FDT method.
> 
> Clever trick. Works well.
> 
> >
> > >
> > >> Meanwhile, any idea about adding a second serial to the platform? I've
> > >> been futzing with it for a bit now to no avail.
> > >
> > > No idea, sorry.
> > Will investigate the second serial method.
> 
> Thank you very much.

I did it. I'll send a patch.
