Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F123119DFB4
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551356; cv=none; b=Btjr/IETLhJ8EMdDrRL6FokDWg8NN4t7c9XwrOeiDHIzrHnS4sL0Sb50vdIgmsyxzAVvR/tGKsLooQakXUCQ7+toPu0rfKs97UXGm7YwDgGOHorV2YKv50F8ZpeeJE5LZy+L2ar4SpJs1a8AyPYCjkHpt7d/xNjBYMq76Vdza/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551356; c=relaxed/simple;
	bh=0WDJbZtw/SkLIbDqt+lslLjj5S3aRyXQ9c3PyEWUg5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBj9aFjNRnfgN3UPaPTRBXJEbhMskkTryjx51zAENvsjsMRpzj9otiw0n2KB3FHiK2bxTkBCEY4q/AF0GqBZn9xT1AHNJOqjiAc0R5AYQ2hyVdxyd5CYeJ00lsJ0xwlz3pSypTRNzA12NDPF2XF2qDGF09lZd+DoebbMRgMcA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=T0D1KC8K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T0D1KC8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD28DC4CEC3;
	Thu,  5 Sep 2024 15:49:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T0D1KC8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725551353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9alZaA1iGbbSl0V0o0b0DcMUnIMAn+ALqOkMYnPTg8=;
	b=T0D1KC8KiV5xQk0WlzDUEewZmyeLGjX7jY9bG1Tf9qJlUfehSpCnazrHHO7dkcf0HfUeve
	nMOPv0ZiFLfuKyFnW06E9EQPK+ZAWdDqdjYFnOjUEYFIdhyegmAIgQl0KeZRexFH5ViALR
	NIKK+l+agTp73yHWdgvFxI4A64qcWFk=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fc6e8a35 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 15:49:12 +0000 (UTC)
Date: Thu, 5 Sep 2024 17:49:11 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: maobibo <maobibo@loongson.cn>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	loongarch@lists.linux.dev, qemu-devel@nongnu.org,
	xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <ZtnS9_xoPrXCWWln@zx2c4.com>
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
 <95da2e9e-0905-ad61-6bf9-c2636f2cc5f1@loongson.cn>
 <ZtnGMdFRpTAVPnym@zx2c4.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtnGMdFRpTAVPnym@zx2c4.com>

On Thu, Sep 05, 2024 at 04:54:41PM +0200, Jason A. Donenfeld wrote:
> On Thu, Sep 05, 2024 at 02:11:32PM +0800, maobibo wrote:
> > 
> > 
> > On 2024/9/5 下午1:25, Thomas Weißschuh wrote:
> > > On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> > >> On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
> > >>>
> > >>> Jason,
> > >>>
> > >>> With the latest qemu 9.1 version, elf format booting is supported.
> > >>
> > >> Thanks, I just figured this out too, about 4 minutes ago. Excellent.
> > >> And the 1G minimum ram limit is gone too.
> > >>
> > >> Now working on how to trigger resets.
> > > 
> > > With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> > > Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> > > that in a cross-architecture way.
> > LoongArch uses acpi GED device to reboot machine. Now there is no FDT 
> > table description and FDT driver for acpi GED device :(
> 
> So you mean that QEMU exposes it via ACPI, but not via FDT, and the
> kernel doesn't know how to recognize it, even with ACPI?

Ahh, it looks like QEMU exposes it via ACPI, but ACPI is broken (?) when
booting directly from ELF. So it needs to be exposed via FDT instead? Or
ACPI needs to be fixed with direct ELF boot?
