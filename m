Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EA017993
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549504; cv=none; b=qbaGkKVvZ4dtlBqPJhx6gtKFXC6HDrWiJ9NQrHGRXrCPN1N2vFUb057aK5BsX14+Ng16R7clKBMSpXq1sU/4mZ4+QEPGqd/q8pIlundTAn5VFpI1kKhW7OwwEEaapS4UaaAiUwa9QkLKpzS98Tm0ZX5uu/snqpzk1J2XafK45lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549504; c=relaxed/simple;
	bh=I9Bo4eXxX5yov8DKp+eTsUuVdi/20/a9vZw7rcEYo6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaTtlHqiuGLuJ9xLqZbrbPGU2MsdbOZflCNw8pwTyVEkfzV930On4gXVvBDp1IS5if55BICosWbOu1LZajVIuycawUiYDExFBTqmHcx6/lccmk/v0iQ+XlSqnfCFE4zDYyCtn+Mje4NfanPJbu0JbHKczcO/noUMxpHmDcNBSfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=NIVBfBX9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NIVBfBX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660DAC4CEC3
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:18:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NIVBfBX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725549500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9Bo4eXxX5yov8DKp+eTsUuVdi/20/a9vZw7rcEYo6c=;
	b=NIVBfBX9Xl7YIbCWI1hI0Jm+GdY1vlKFHIKb+y87S6ritF1yD6TJ4S8LxbQ8KFzdUIq/j+
	5JLKWggzIHuCKhLX7E5JihyAGFG5WyXkfDpIEqvObjQJA1U+tpYFyV23tU2qETq9cMQv7H
	MFdsz5uDfbi+zk8lB4aAmZ8LzE67/Bg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c35fc8bf (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <loongarch@lists.linux.dev>;
	Thu, 5 Sep 2024 15:18:19 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-277f19ee2a2so537618fac.1
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 08:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiZg7qnBUesZ4eddXseIJW7t6Ka5KfvzWziRMx3KncdPw+J4yWhA71ahb0X7w1yod6w89TJfSQmA0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6fBynImgOuP22vhcTritr9gTQ6FY2uoIUUo/eaKssuUL30+Yp
	e116Q/VEtAP0S9ULEx/+qJwzEYAsy05z8XPbd7jfo5JljNxLw9vGgSlYoKTvqSqWPAwoA5UkD7l
	yJXxeyKFaNMn1InYLGE7uRq3bt18=
X-Google-Smtp-Source: AGHT+IGoDANoM7Dck892THjQ9ZvVIyFS+Blc9ACZOj1RASnNm54um4JL/KfjMr2duIiVX0k2wUSajvZ2pbRk/bkOwOY=
X-Received: by 2002:a05:6870:7d10:b0:277:f176:1830 with SMTP id
 586e51a60fabf-277f1761c53mr15139012fac.8.1725549498962; Thu, 05 Sep 2024
 08:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn> <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn> <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de> <ZtnGA4mH0I2hdx4N@zx2c4.com>
 <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de> <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
 <b11ba2f4-ba4b-40fb-860e-e10e760562fe@t-8ch.de>
In-Reply-To: <b11ba2f4-ba4b-40fb-860e-e10e760562fe@t-8ch.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Sep 2024 17:18:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9pjokr=ahBbJA9Ljf8jjOyfyRAk0Qo4YeDYO_gs78GGzg@mail.gmail.com>
Message-ID: <CAHmME9pjokr=ahBbJA9Ljf8jjOyfyRAk0Qo4YeDYO_gs78GGzg@mail.gmail.com>
Subject: Re: qemu direct kernel boot on LoongArch
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: maobibo <maobibo@loongson.cn>, loongarch@lists.linux.dev, qemu-devel@nongnu.org, 
	xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:16=E2=80=AFPM Thomas Wei=C3=9Fschuh <thomas@t-8ch.=
de> wrote:
>
> On 2024-09-05 17:07:22+0000, Jason A. Donenfeld wrote:
> > On Thu, Sep 5, 2024 at 5:05=E2=80=AFPM Thomas Wei=C3=9Fschuh <thomas@t-=
8ch.de> wrote:
> > >
> > > On 2024-09-05 16:53:55+0000, Jason A. Donenfeld wrote:
> > > > On Thu, Sep 05, 2024 at 07:25:05AM +0200, Thomas Wei=C3=9Fschuh wro=
te:
> > > > > On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> > > > > > On Thu, Sep 5, 2024 at 5:45=E2=80=AFAM maobibo <maobibo@loongso=
n.cn> wrote:
> > > > > > >
> > > > > > > Jason,
> > > > > > >
> > > > > > > With the latest qemu 9.1 version, elf format booting is suppo=
rted.
> > > > > >
> > > > > > Thanks, I just figured this out too, about 4 minutes ago. Excel=
lent.
> > > > > > And the 1G minimum ram limit is gone too.
> > > > > >
> > > > > > Now working on how to trigger resets.
> > > > >
> > > > > With "reset" do you mean normal (non-panic) system shutdown/power=
off?
> > > > > Since QEMU 9.1 and a recent kernel you can use the pvpanic device=
 for
> > > > > that in a cross-architecture way.
> > > >
> > > > What I mean is that I need for userspace calling `reboot(RB_AUTOBOO=
T);`
> > > > to actually result in QEMU being told to reboot the system. Sounds =
like
> > > > that's not possible (yet?) in 9.1?
> > >
> > > With reboot(RB_POWER_OFF) this is indeed the exact usecase for pvpani=
c
> >
> > I'm actually using reboot(RB_AUTOBOOT) wth QEMU's -no-reboot, because
> > that tends to be far more compatible with a greater number of
> > platforms, for example, x86 without acpi. Shucks.
>
> You can check that both QEMU and the kernel support pvpanic shutdown
> through sysfs and if so use reboot(RB_POWER_OFF); and
> reboot(RB_AUTOBOOT) otherwise.

I guess. But the whole idea is to bloat the code as little as possible
and use one interface for everything. Pushing that all up into
userspace is pretty icky.

It sounds like LoongArch already supports this via ACPI GED, but
there's some plumbing that needs to be done still. So maybe I'll just
wait for that.

Meanwhile, any idea about adding a second serial to the platform? I've
been futzing with it for a bit now to no avail.

Jason
