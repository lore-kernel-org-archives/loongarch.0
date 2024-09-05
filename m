Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178EB19B595
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548086; cv=none; b=qgVUesPXgWEQWkeISx5yeAAv3Won7XzdLnGO8sXfTDHQKu4uJ1eEnyh88iiRVso10DriysSO8EV2JKwnc/h4KDKU8LjMDZNS/mLt+OLFKgR6GGFJTCXxnptpQ5lsw4YgQH2fxvv2IOHXC3nmy8tDTBPA/lAnpmTfGhZZW2OCj40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548086; c=relaxed/simple;
	bh=2QHNji9446+jZlLN0H0XuIzBV9/+dZ4zLedoCAxyAhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb1InZM1PlfV/Sl+p0AfhUVFoB4abaxkc3hI1UDMjpR3C1OUl/fQ+srVVQRBOsmzPv8pjpVkVn5rfe1z0nZXVo4U4oy/tjZxFdbb4lYSxWED688jngOc6vn8lLg3truUsB0wpTiyIsrT6HYN9tofKWqN5D38SeaX6ywCg8UMpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=iOJ3Bxe5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="iOJ3Bxe5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD056C4CEC3;
	Thu,  5 Sep 2024 14:54:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="iOJ3Bxe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725548083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UbUvqUbTxXvSxmvdmKVvl8aODTaMQ8d9lp3BwWcHvCM=;
	b=iOJ3Bxe5eqok/NAXaNksuFqJ2cDdyc2uK/NuptUzWov9mi2BA9FYwvQzQJgm2IRE8TJ3X/
	Bz5gEZVAOBA5Uft4TNmMNWxipkGl8HexQCCZPIH1cGH/kmlQFGP37IG8Pq8zpYBEZKXRc2
	XuvF8wzz/IkMBIshSsXD//YubK4R9oU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61832bb4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 14:54:43 +0000 (UTC)
Date: Thu, 5 Sep 2024 16:54:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: maobibo <maobibo@loongson.cn>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	loongarch@lists.linux.dev, qemu-devel@nongnu.org,
	xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <ZtnGMdFRpTAVPnym@zx2c4.com>
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
 <95da2e9e-0905-ad61-6bf9-c2636f2cc5f1@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95da2e9e-0905-ad61-6bf9-c2636f2cc5f1@loongson.cn>

On Thu, Sep 05, 2024 at 02:11:32PM +0800, maobibo wrote:
> 
> 
> On 2024/9/5 下午1:25, Thomas Weißschuh wrote:
> > On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> >> On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
> >>>
> >>> Jason,
> >>>
> >>> With the latest qemu 9.1 version, elf format booting is supported.
> >>
> >> Thanks, I just figured this out too, about 4 minutes ago. Excellent.
> >> And the 1G minimum ram limit is gone too.
> >>
> >> Now working on how to trigger resets.
> > 
> > With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> > Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> > that in a cross-architecture way.
> LoongArch uses acpi GED device to reboot machine. Now there is no FDT 
> table description and FDT driver for acpi GED device :(

So you mean that QEMU exposes it via ACPI, but not via FDT, and the
kernel doesn't know how to recognize it, even with ACPI?
