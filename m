Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5119D090
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549378; cv=none; b=lIWPUbedVTK6vMfHk13J6+c3SH6z2rUgVKuJqsOSR+kXZQDmBaEhoEfyntEjeGOBeUN0awIVYWc0U65EvTaqvlItnFFnBxPKo7pyCgXfJJlXc13nIHVpw5QjIrlOavhfBfmTw3P7K15y0k13IKjmHNgJibIR44n6wrG3o0RZ/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549378; c=relaxed/simple;
	bh=SSjqcqYgw6P/GLrTz7bzTlwfSTvf+zpzZBgVRkTJu0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e844xfKgIJ1O5VklYso/5O2GbEGBnbCtwGeDH9ZJfZJU1jQsj4/fQYAKTjBnBkAvhgmBmTQlKUAi/NSG0OkuBCxI/mYJC5WwIqYQ4LcIPfxvCQV7S9uZ/rmY9Ykkf95rQFWKWSFrMWUaobtroFc7QMSwmwsJgaJXosTCTYCOmxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=WE5ycv23; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="WE5ycv23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1725549373; bh=SSjqcqYgw6P/GLrTz7bzTlwfSTvf+zpzZBgVRkTJu0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WE5ycv23MP7MXzKr2aJDZXtR8yspFf0gY4tTrgpQE18tGGWSrOsfxOJEuwyJ8//PZ
	 cYIe3c8eWC9eE3lchCdD7t/2x0cKqAjqGmqzvoSelyd4cZJVBIr8eNPWmBIB7EWJvu
	 o+2VBLdPf43H16e8wv5Tii4lqX0L1uOKcxCS0QGE=
Date: Thu, 5 Sep 2024 17:16:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: maobibo <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	qemu-devel@nongnu.org, xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <b11ba2f4-ba4b-40fb-860e-e10e760562fe@t-8ch.de>
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
 <ZtnGA4mH0I2hdx4N@zx2c4.com>
 <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de>
 <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>

On 2024-09-05 17:07:22+0000, Jason A. Donenfeld wrote:
> On Thu, Sep 5, 2024 at 5:05 PM Thomas Weißschuh <thomas@t-8ch.de> wrote:
> >
> > On 2024-09-05 16:53:55+0000, Jason A. Donenfeld wrote:
> > > On Thu, Sep 05, 2024 at 07:25:05AM +0200, Thomas Weißschuh wrote:
> > > > On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> > > > > On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
> > > > > >
> > > > > > Jason,
> > > > > >
> > > > > > With the latest qemu 9.1 version, elf format booting is supported.
> > > > >
> > > > > Thanks, I just figured this out too, about 4 minutes ago. Excellent.
> > > > > And the 1G minimum ram limit is gone too.
> > > > >
> > > > > Now working on how to trigger resets.
> > > >
> > > > With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> > > > Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> > > > that in a cross-architecture way.
> > >
> > > What I mean is that I need for userspace calling `reboot(RB_AUTOBOOT);`
> > > to actually result in QEMU being told to reboot the system. Sounds like
> > > that's not possible (yet?) in 9.1?
> >
> > With reboot(RB_POWER_OFF) this is indeed the exact usecase for pvpanic
> 
> I'm actually using reboot(RB_AUTOBOOT) wth QEMU's -no-reboot, because
> that tends to be far more compatible with a greater number of
> platforms, for example, x86 without acpi. Shucks.

You can check that both QEMU and the kernel support pvpanic shutdown
through sysfs and if so use reboot(RB_POWER_OFF); and
reboot(RB_AUTOBOOT) otherwise.
