Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9E3823DF
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548041; cv=none; b=CA296J2CKWy/eWxQyzFn1gZ4B3NC4v/jKRECbwa2Vh/2b86aRzh8WJcT/ut9tQEryJtYBGJ0NFAP0lAJoqHgb4TRlzx5rvEDGiyi76CEum9TCNYYjDluzoUGwPW3LvyNIOhcI0Qa8VKtyuPc5Z7paWRNMNTQ/9+EwWFkjbA6EN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548041; c=relaxed/simple;
	bh=PZaOhdTvT7PI6Fjgs99jAM2sewwqzS6Udbq+SKL0jWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PF/dDA0tL1GydOqZa9TU2+AzkqiLDWzjqy3gc6rkoANLawSaylyKAaWOeDRLh3pJm3f0iR5cN0tGynhEwsil4lKOhLlhvIkpsKb8v1cRNIMsuHC+HtB/IdqD1vJ5a8I9FSfT6BBxrO1hruWUcOCRWgFWA7iH9MKW23KLGSPPaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=VfKp9dlV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VfKp9dlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118C1C4CEC3;
	Thu,  5 Sep 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VfKp9dlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725548038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d92FhpwTdsHtj9SKBvdRleCOsJEdB2224ZWblx6x7fk=;
	b=VfKp9dlVoWj6aWx45NPCkHZY080e7bIeugru54ndRgluhEXNtJi50bNOaNs6EUTPyQ0wmb
	ukLH+dxAE1aotYy1FHbW8a+Ef9cAsW9ib4uN/uK+yiY/kf6GJB1nRNWEyCHFjqRCcHw1zo
	IjSll8NIZnDO0ouaXDYnUs+/zBghz1A=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c05a5307 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 14:53:58 +0000 (UTC)
Date: Thu, 5 Sep 2024 16:53:55 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: maobibo <maobibo@loongson.cn>, loongarch@lists.linux.dev,
	qemu-devel@nongnu.org, xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <ZtnGA4mH0I2hdx4N@zx2c4.com>
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>

On Thu, Sep 05, 2024 at 07:25:05AM +0200, Thomas Weißschuh wrote:
> On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> > On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
> > >
> > > Jason,
> > >
> > > With the latest qemu 9.1 version, elf format booting is supported.
> > 
> > Thanks, I just figured this out too, about 4 minutes ago. Excellent.
> > And the 1G minimum ram limit is gone too.
> > 
> > Now working on how to trigger resets.
> 
> With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> that in a cross-architecture way.

What I mean is that I need for userspace calling `reboot(RB_AUTOBOOT);`
to actually result in QEMU being told to reboot the system. Sounds like
that's not possible (yet?) in 9.1?

The last hurdle I'm having, in addition to that one, is getting the
second serial port working. The kernel test suite that I'm running in CI
for /dev/urandom development and wireguard development does `-serial
stdio -serial chardev:result`, where the first serial is the normal
output for logging, and the second one is the test result, so I can get
that from the VM via a clean channel. This works well on other
architectures, but on loongarch, it's failing to open /dev/ttyS1 the
same way that it can open /dev/ttyS0.
