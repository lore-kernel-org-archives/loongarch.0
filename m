Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E319F42F
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548858; cv=none; b=p6TkbDePnKEl8Pd5aMHmx7V7L4ihyYDXRSROzvhH80bEJ1lyo+nwdnbmbtcRB4ZEJJRD+3ncl0NC9C2kgOb4bYhyn1DkgbzBlA28s52xgAdITGZzwkIhigFFWR9ccRJlVNe62DroHIKaekyhwp1QO+jUU3ajtjxVI9MCyCmqggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548858; c=relaxed/simple;
	bh=S2mchVWEFa+UEZBLyToTME5uIAwdXMvriDfoFaA/ie8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imzPlwY+ssdms1VDWvpdhAVIJjHYFagNClVw+lFbX8Q6BKQ/EC9Zn4K13dXoZG5OAUhYqCHbOCdVJwiQphwo+PIu9RX3qZtvr9FvfltfO9j7Redkr1LaY2dwbVhXLur/eXM7swyU1zXyyaDdMCffhTBNW9jforQZxyCPWQ3azR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=W9PxaiQi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="W9PxaiQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F394AC4CEC9
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:07:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="W9PxaiQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725548855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S2mchVWEFa+UEZBLyToTME5uIAwdXMvriDfoFaA/ie8=;
	b=W9PxaiQiFmDqH7BTMpT5HTzVD0vMiJ44EzIA1oCdNuwwbjjU291VS1th5/wgVVa7uLOob+
	mq6cPalu38Qv+2JK9AzKcDR5RHspzwUnkOJk3lwK2xhBa09OT+tfzRo60HNgJXs9ST9+JB
	lwK8LpCL4rX85o0T3NifHd/5oTtXgZM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 418f20d6 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <loongarch@lists.linux.dev>;
	Thu, 5 Sep 2024 15:07:35 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5dfa315ccf1so564703eaf.3
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 08:07:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0GcMHGYscBmT+mXz8a2H01vv4hg+n19QyKsy7kHWNQKyyfqSPBJwkLTwm6duASOt9bZ3ZGDsxcwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw88mdUPh4EFwjRZKtsI9p4TY23Qd+9yLX+2x3BBbnJsI7I5+iL
	WwspSAFSDTAQpZZ3gMPSgJLC7287/fI2eLIQZd7Xdv5pG4E845Od2t3mkekEo/amdEtHjngXqwY
	9u265In+1MetyKGBo1XLA1/JOPgM=
X-Google-Smtp-Source: AGHT+IH/v2t+ij91vaCzCIZsMD90hI0GAjiKSi8I2aCx9cm4gUr7Kw3J32OUlV8tZz83zjXgCFqqKXfOUd/m8AhH1So=
X-Received: by 2002:a05:6870:828f:b0:278:3de:c8de with SMTP id
 586e51a60fabf-27803df0c8amr11214672fac.24.1725548854039; Thu, 05 Sep 2024
 08:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn> <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn> <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de> <ZtnGA4mH0I2hdx4N@zx2c4.com> <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de>
In-Reply-To: <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Sep 2024 17:07:22 +0200
X-Gmail-Original-Message-ID: <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
Message-ID: <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
Subject: Re: qemu direct kernel boot on LoongArch
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: maobibo <maobibo@loongson.cn>, loongarch@lists.linux.dev, qemu-devel@nongnu.org, 
	xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:05=E2=80=AFPM Thomas Wei=C3=9Fschuh <thomas@t-8ch.=
de> wrote:
>
> On 2024-09-05 16:53:55+0000, Jason A. Donenfeld wrote:
> > On Thu, Sep 05, 2024 at 07:25:05AM +0200, Thomas Wei=C3=9Fschuh wrote:
> > > On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> > > > On Thu, Sep 5, 2024 at 5:45=E2=80=AFAM maobibo <maobibo@loongson.cn=
> wrote:
> > > > >
> > > > > Jason,
> > > > >
> > > > > With the latest qemu 9.1 version, elf format booting is supported=
.
> > > >
> > > > Thanks, I just figured this out too, about 4 minutes ago. Excellent=
.
> > > > And the 1G minimum ram limit is gone too.
> > > >
> > > > Now working on how to trigger resets.
> > >
> > > With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> > > Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> > > that in a cross-architecture way.
> >
> > What I mean is that I need for userspace calling `reboot(RB_AUTOBOOT);`
> > to actually result in QEMU being told to reboot the system. Sounds like
> > that's not possible (yet?) in 9.1?
>
> With reboot(RB_POWER_OFF) this is indeed the exact usecase for pvpanic

I'm actually using reboot(RB_AUTOBOOT) wth QEMU's -no-reboot, because
that tends to be far more compatible with a greater number of
platforms, for example, x86 without acpi. Shucks.
