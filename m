Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ABD241E7
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725595480; cv=none; b=asyrp6K1yMjoqDrwlcxVevw2GCPxAPaEkSoyELQSZDQR4aOc2/+bDJAOixrNZD0xZvtWzQ5b/ocfrj8SM31bYXokS17g/N62cJRS55hj0QXP2WPALrRMoY2l+xYsC6ljuXdt5fIQCU8dhIWoxmFmTwAQFwTniK+w+4pb5krw11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725595480; c=relaxed/simple;
	bh=1IK2oZCb/n+9fkIu0LB+Ms6N9pDWneGGI6nu1dX5jJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUzsfuYrsg+Saol4+G5z2uu3UcWuazzL7i7Xm+tmSNmNZODdNwOWPaJzWH+jVbGZkEYgh7gADmSrA2lnrdeBUOuTAlNJaA2vondEbPGbQ6KZ5hV57Sr09aIs42zT2vf2nPVdzZa75yLPA2IwLt2Wv4Qgc4WbexuVjYkrwn+GxHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=S1L1kd18; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="S1L1kd18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3837CC4CEC6
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 04:04:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="S1L1kd18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725595477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1IK2oZCb/n+9fkIu0LB+Ms6N9pDWneGGI6nu1dX5jJE=;
	b=S1L1kd18F7R61VDQDXWlaQOYUGxhGfFfbr4J/zwPrxZAnyhgNGf9rCTSUGe1yfxUWx6xRa
	rT3sBYYH1loWcz002b4ypDuGiAzmRKIbz/ITbwRpWACcWc/NEAp7UxiCChBNubIIgdFGRz
	zdo2iTvq4LccLgqPLYAsMecf04Ef0Ew=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0e195fbb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <loongarch@lists.linux.dev>;
	Fri, 6 Sep 2024 04:04:37 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e0059dc06bso1038873b6e.0
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 21:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWc2GdFaE+yYxWGgizOJI+RVTOmIzhE7exhEh1M/7ILO0ohXU3bG2SoWDB8dZ/j+JMSP9ucywc4lx0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbtASXeaGrpDS0RB/R/HxZQqyXxupA7fL96hQ9BdizOZzMCe+Y
	ZU6fOTb4HNCx3PDnDW0fQb/6BflfKAkiplItuNMb1qhOplZXAsh4HTVmQmmyPCy4Hsb3uU1jq1U
	znOCVNJGNTtbvcFVvqp1wT6gZVUs=
X-Google-Smtp-Source: AGHT+IEYgNp+GzfSAdI6zC+MaI1H2KLXiXv+BkTFU9aZvKrGiBZDR9zGQW7wJT67BQnXT1Q21YZljV5KhKs/kWpDJpQ=
X-Received: by 2002:a05:6870:a406:b0:277:e286:88f5 with SMTP id
 586e51a60fabf-27b82e59afbmr1671046fac.20.1725595476617; Thu, 05 Sep 2024
 21:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com> <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de> <ZtnGA4mH0I2hdx4N@zx2c4.com>
 <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de> <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
 <b11ba2f4-ba4b-40fb-860e-e10e760562fe@t-8ch.de> <CAHmME9pjokr=ahBbJA9Ljf8jjOyfyRAk0Qo4YeDYO_gs78GGzg@mail.gmail.com>
 <7311f2fa-2353-48ad-85f5-5eae1f6cb65f@t-8ch.de> <bac8575f-1c43-1242-9113-ef7957b50e68@loongson.cn>
In-Reply-To: <bac8575f-1c43-1242-9113-ef7957b50e68@loongson.cn>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2024 06:04:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9pEw7_A5fSAooZLM9NGEpRN+05woicq8-qEjMqgBB8DwA@mail.gmail.com>
Message-ID: <CAHmME9pEw7_A5fSAooZLM9NGEpRN+05woicq8-qEjMqgBB8DwA@mail.gmail.com>
Subject: Re: qemu direct kernel boot on LoongArch
To: maobibo <maobibo@loongson.cn>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	loongarch@lists.linux.dev, qemu-devel@nongnu.org, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 3:14=E2=80=AFAM maobibo <maobibo@loongson.cn> wrote:
> yeap, will submit a patch to expose ACPI GED pm interface with FDT method=
.

Clever trick. Works well.

>
> >
> >> Meanwhile, any idea about adding a second serial to the platform? I've
> >> been futzing with it for a bit now to no avail.
> >
> > No idea, sorry.
> Will investigate the second serial method.

Thank you very much.
