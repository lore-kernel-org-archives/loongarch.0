Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5517719D89E
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552188; cv=none; b=jg5o6umjzQOl9TngzLRbxTX6sMIQT1+3wV4dHshdjXgejsSj2HpVQ7JsuJiciakvGOKwWfNYsld4ZhB1W6PvAo/m3XvlCoUtfHpHnJYaUpdVbdK8Gkx3TPIIHwr6NTPAzKfe+wf0np+zoYC0yjfpsP4K2atf5FHaIIijx4M/UwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552188; c=relaxed/simple;
	bh=dxdoE+Tc69+QIWnRgHImPXkCDL2I7LUw0KJGtL4nNOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Irr3Z5wBTw2Jb5dHQ9kTwcSN2MDTrB+BUY4R3eyNp0YaLDBJ/CmWYewJ4NLhoRz1wKE52FZWBNDyJ06FOxTJgVlZqeRxn9okTQzmFbmk7o0x+kH3ctZyLXUd1pzQS3EM3pZlhVrQsdFXbTod19wQc71xtqq0DafjU2ZhABudTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=GFrTHFeE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="GFrTHFeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1725552184; bh=dxdoE+Tc69+QIWnRgHImPXkCDL2I7LUw0KJGtL4nNOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFrTHFeEIgyFKXRi3Fk+VbCAleTAzFk68KT5e6YKmmqVzxLQtYguti0fUUqD3m2Hf
	 SLsFMzZruLmV7xlvNUwGMACKScw07jR3DClTzkSvl05JiH5XubgBVumxANN0v1Ts+2
	 0rYOLVm38nXXEXo7CUEtOVekUbx3F9V32xkYA2BU=
Date: Thu, 5 Sep 2024 18:03:03 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: maobibo <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	qemu-devel@nongnu.org, xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <7311f2fa-2353-48ad-85f5-5eae1f6cb65f@t-8ch.de>
References: <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
 <ZtnGA4mH0I2hdx4N@zx2c4.com>
 <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de>
 <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
 <b11ba2f4-ba4b-40fb-860e-e10e760562fe@t-8ch.de>
 <CAHmME9pjokr=ahBbJA9Ljf8jjOyfyRAk0Qo4YeDYO_gs78GGzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9pjokr=ahBbJA9Ljf8jjOyfyRAk0Qo4YeDYO_gs78GGzg@mail.gmail.com>

On 2024-09-05 17:18:07+0000, Jason A. Donenfeld wrote:
> On Thu, Sep 5, 2024 at 5:16 PM Thomas Weißschuh <thomas@t-8ch.de> wrote:
> >
> > On 2024-09-05 17:07:22+0000, Jason A. Donenfeld wrote:
> > > On Thu, Sep 5, 2024 at 5:05 PM Thomas Weißschuh <thomas@t-8ch.de> wrote:
> > > >
> > > > On 2024-09-05 16:53:55+0000, Jason A. Donenfeld wrote:
> > > > > On Thu, Sep 05, 2024 at 07:25:05AM +0200, Thomas Weißschuh wrote:
> > > > > > On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> > > > > > > On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
> > > > > > > >
> > > > > > > > Jason,
> > > > > > > >
> > > > > > > > With the latest qemu 9.1 version, elf format booting is supported.
> > > > > > >
> > > > > > > Thanks, I just figured this out too, about 4 minutes ago. Excellent.
> > > > > > > And the 1G minimum ram limit is gone too.
> > > > > > >
> > > > > > > Now working on how to trigger resets.
> > > > > >
> > > > > > With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> > > > > > Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> > > > > > that in a cross-architecture way.
> > > > >
> > > > > What I mean is that I need for userspace calling `reboot(RB_AUTOBOOT);`
> > > > > to actually result in QEMU being told to reboot the system. Sounds like
> > > > > that's not possible (yet?) in 9.1?
> > > >
> > > > With reboot(RB_POWER_OFF) this is indeed the exact usecase for pvpanic
> > >
> > > I'm actually using reboot(RB_AUTOBOOT) wth QEMU's -no-reboot, because
> > > that tends to be far more compatible with a greater number of
> > > platforms, for example, x86 without acpi. Shucks.
> >
> > You can check that both QEMU and the kernel support pvpanic shutdown
> > through sysfs and if so use reboot(RB_POWER_OFF); and
> > reboot(RB_AUTOBOOT) otherwise.
> 
> I guess. But the whole idea is to bloat the code as little as possible
> and use one interface for everything. Pushing that all up into
> userspace is pretty icky.

If it works through ACPI everywhere then sure.

> It sounds like LoongArch already supports this via ACPI GED, but
> there's some plumbing that needs to be done still. So maybe I'll just
> wait for that.

Also sounds reasonable.

> Meanwhile, any idea about adding a second serial to the platform? I've
> been futzing with it for a bit now to no avail.

No idea, sorry.
