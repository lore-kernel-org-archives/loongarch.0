Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333716F839
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548706; cv=none; b=eskjBkSGiAHICk2gifacMgrHkWN0asas4f68Twrkp6HwF6nx9koqtY/zmQPRfqkAxpoGfofzkXngTMR9IQa9ysCvD1n0EUO0bRbGFYEgPDjiIbhN6B9O0RPNYIILbD6q4NH6OcJaznyPw3xvaFLK7CSRKNFu72Ko//zyA7ioe2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548706; c=relaxed/simple;
	bh=1RtpgcPhEEYYwXcKrUAWQ3EjVVph3Z2nVQEfKOTbS1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k78h8xF8aB+ELZCZF2mQs043CFhb1VjT9ZjDsZu2PIfj7hY/3hnNd+z+FAH3ca5kttfInAy4dnEKp8l3hnIhxWpd/rXH51mPy2eZJHsVYoFyIksD126m7IeyDBCb8BvN5UhAaYbbIpZlVgdjG31F/+prlvONp9VYvtD3nf8Z08c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=U9ec/p2m; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="U9ec/p2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1725548701; bh=1RtpgcPhEEYYwXcKrUAWQ3EjVVph3Z2nVQEfKOTbS1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9ec/p2m2zWsVi6ZcrHFfHBJxd3khBMSOt54rVmMDNp9UJUo4AtTRCE0LXBVAbAwo
	 dseUtqWYWnSxy8SJf/bjW6ef4CZN/uirDKs1xSMXBAFDS+O6xEULjkPt8VF6bkM2F8
	 r1voyy7IOUjXWxLLRqVBxTySbV5g4Flfi1pLA/1I=
Date: Thu, 5 Sep 2024 17:05:00 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: maobibo <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	qemu-devel@nongnu.org, xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de>
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
 <ZtnGA4mH0I2hdx4N@zx2c4.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtnGA4mH0I2hdx4N@zx2c4.com>

On 2024-09-05 16:53:55+0000, Jason A. Donenfeld wrote:
> On Thu, Sep 05, 2024 at 07:25:05AM +0200, Thomas Weißschuh wrote:
> > On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> > > On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
> > > >
> > > > Jason,
> > > >
> > > > With the latest qemu 9.1 version, elf format booting is supported.
> > > 
> > > Thanks, I just figured this out too, about 4 minutes ago. Excellent.
> > > And the 1G minimum ram limit is gone too.
> > > 
> > > Now working on how to trigger resets.
> > 
> > With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> > Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> > that in a cross-architecture way.
> 
> What I mean is that I need for userspace calling `reboot(RB_AUTOBOOT);`
> to actually result in QEMU being told to reboot the system. Sounds like
> that's not possible (yet?) in 9.1?

With reboot(RB_POWER_OFF) this is indeed the exact usecase for pvpanic
shutdown support. Reboot is not supported, but maybe -action
shutdown=reboot works and is enough. It would also be trivial to extend
pvpanic for reboot support.

Use -device pvpanic-pci for QEMU and CONFIG_PVPANIC_PCI=y for Linux.
(That should work for most architectures)
