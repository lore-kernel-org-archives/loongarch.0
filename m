Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46CB3EE1C8
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371367; cv=pass; b=XRsaHrzdKQyU2ATBk7EJRJ4CZqqwCWiSPZqzVr31NBkimaCRp2/OEMtaMayPCwY/h38mQHwKDGtvD1cSP2W9u4wbvlNiLYw29zKbcG5iKx0kZNdxTDk0KLoNodvjd8R3w3pbiiVF7L7v3t0X6xr8wfOigyMEr40NXmKOUSRkTug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371367; c=relaxed/simple;
	bh=ce5KgZpNqQXpdfz+fCZfMY2AY+7fq0BiWHSfcjJHws0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzsEqc+RSm8tMGWeRtqY3uHIwFgLldM2cPqExitvJoZOg0/S9r2UqplytMLj/joSYLfht+/Kd3n73zjN2gnJDLSjm0H+0rVPrrvJ3TK2NRQ7ItXqiPb/4lDSnMfd9rYnty5vl6RafJx2mIqOmNaNwRzDU9b0mfmuYNRe0uBUJIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=T+rLzfT6; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="T+rLzfT6"
ARC-Seal: i=1; a=rsa-sha256; t=1774371363; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WDaP5f4TUhtcoSFuDnk3D3GgbpPqY3U0w/BSQBhwQMxJoQn2FPNITKn+oKydoBn+MGjHNXcfrowNjya/Us6Ehb6c4syEyFXNTKRenPDltf3RAch6pEOBDUa6brD4myndBQEFFVWen0hoYXpnbaGyyKtJeVbAaKSte1ONTaaHvkQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774371363; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jiy7RO9txASLPqZYKrGArRewWy+3t2WyQyeCTuVmXy4=; 
	b=apLOPBX6Wp9f1EaqyKjyBYRazZdqSmGQGIqvIJ125nOyFnZYydxZ9USnkO1FeFOzS4O8D0VdJ8Ul5apRTXH11rOCkPF/VgYHzE6jUHCq0Q/ctJ6+QEPoe/mBcr5R0GmEJiqeZgC1LBHw7GwjBk/D6smJh1TmqT92ueyvXjVfffo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774371363;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Jiy7RO9txASLPqZYKrGArRewWy+3t2WyQyeCTuVmXy4=;
	b=T+rLzfT6sCf/pqDn1dxCrg3R1bNkfSReYXzi6M+pmTImhA87l+LmTyvTFzOlRiUH
	wQgGyLTF1yXAWy0KWb4NBS3Ks7X7WhYc0E1PNn8XK9JYG5APTkcQ3JTIJC/cKXIQp+1
	wmAvh2lUPtu33ypCQ3XRNSH6bzNrh48esF697qik=
Received: by mx.zohomail.com with SMTPS id 1774371361201648.8428770573439;
	Tue, 24 Mar 2026 09:56:01 -0700 (PDT)
Date: Tue, 24 Mar 2026 16:55:40 +0000
From: Yao Zi <me@ziyao.cc>
To: wjjsn <wjjsn@qq.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kernel@xen0n.name, devicetree@vger.kernel.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	wjjsn <2858482031@qq.com>
Subject: Re: [PATCH v5 0/2] Add Loongson-2K0300 processor support
Message-ID: <acLCDL_nJom8AzjK@pie>
References: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
 <ab_iF2hjZRfp16HP@pie>
 <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
 <tencent_CA7176E8823B957F1AEB15254D17904D5505@qq.com>
 <acCoo_ZrTmZGZH5d@pie>
 <tencent_414FBFBEE2A4510232AB52CE665C04A6C20A@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_414FBFBEE2A4510232AB52CE665C04A6C20A@qq.com>
X-ZohoMailClient: External

On Tue, Mar 24, 2026 at 11:09:16PM +0800, wjjsn wrote:
> On 3/23/26 10:42, Yao Zi wrote:
> > On Mon, Mar 23, 2026 at 12:33:31AM +0800, wjjsn wrote:

...

> > >    the clk_apb_gate will
> > >    turn off by kernel while booting,though 16100000.serial is using
> > 
> > This is unlikely an issue in the clock driver, but rather the consumer
> > is doing something wrong, though I haven't seen similar issues when
> > working on the clock driver.
> > 
> > Please try booting the kernel with clk_ignore_unused, and check
> > /sys/kernel/debug/clk/clk_summary to see whether the serial correctly
> > acquires the apb gate clock. If not, one (and the most possible) reason
> > is both clock-frequency and clocks properties are specified in its
> > devicetree node, where 8250 driver would ignore the latter.
> > 
> 
>  When I use 'clocks = <&clk LS2K0300_CLK_DEV_DIV>;', the system log gets
> stuck at the message about closing unused clocks, and there are no further
> logs. It seems like the clock for the serial port is being closed. However,
> if I set the parameter to not close unused clocks as a startup parameter,
> the serial port can continue to be used. If I use 'clocks = <&clk
> LS2K0300_CLK_APB_GATE>;', then the clock for the serial port is not closed
> and can start normally. I have not specified the clock frequency in the

This is the expected behavior, because LS2K0300_CLK_APB_GATE takes
LS2K0300_CLK_APB_DIV as parent, and unused clocks would be automatically
disabled by kernel.

It's intended to let consumers take the GATE clock instead of the DIV
clock, just like what you have done in your patch.

> Regards,
> wjjsn

Regards,
Yao Zi
