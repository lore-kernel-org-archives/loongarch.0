Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C823C45BEF
	for <loongarch@lists.linux.dev>; Sat, 29 Jun 2024 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719668447; cv=none; b=nG/AmKp5G5oIDhG4JZtLNnKldTLo2Nb5HWhc+k9QcFPbRIbY3mVbniimzmF/It/1vnRj4+MAnwxOALOPX0FjfJy2ym+rHim74pk4PeGHWt2XpDw8NFCkbjwpPiSG7BdNZD4/Bf36e/LuQn8KpJp0CQYY7/iO7YKg3hUEDUate2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719668447; c=relaxed/simple;
	bh=TsD41L2f2VKq34Ph7lBOtRyiHdK+mQQb4xF8FjIP0iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkHUBKDNsdXsdHJMZrafz/j+rX2agzdR77pUP9foXJPRnoeEPN4P2tfGP9a9yzXuB8tYpAUDBnp5zXnx+2AGC0Y+WGievSn5jxfcZTguHmChcKbT1Fu58DO8N2NzwKM2F/w3SPvm+2tdmCjf/OqG81SFLDmRD7ruFw8kced1xZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMupuSPd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMupuSPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719668444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsD41L2f2VKq34Ph7lBOtRyiHdK+mQQb4xF8FjIP0iU=;
	b=UMupuSPdRsQ8PO7kUnA8GbGoejR2eD5EHTvKz6JMyxYbmkqbxit0v74Vm4r+nz5pO/p/NQ
	DhUkBZdxMmDYB/u/X+F5KaKlnGFGRaJlRuYWrW/cJglYdS8JeFUM3VCTMK0kzI3nptbv9B
	KR+5FPcBV2xJc3dHQd0osQ3iMKj20Sc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-sgm5t3g6P3mMyhjci7Oh7Q-1; Sat,
 29 Jun 2024 09:40:34 -0400
X-MC-Unique: sgm5t3g6P3mMyhjci7Oh7Q-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43AD11956087;
	Sat, 29 Jun 2024 13:40:30 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.39.192.76])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 452B219560A3;
	Sat, 29 Jun 2024 13:40:24 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat, 29 Jun 2024 15:38:55 +0200 (CEST)
Date: Sat, 29 Jun 2024 15:38:49 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: andrii.nakryiko@gmail.com, andrii@kernel.org, bpf@vger.kernel.org,
	chenhuacai@kernel.org, jolsa@kernel.org, kernel@xen0n.name,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, mhiramat@kernel.org, nathan@kernel.org,
	rostedt@goodmis.org
Subject: Re: [PATCH] LoongArch: uprobes: make
 UPROBE_SWBP_INSN/UPROBE_XOLBP_INSN constant
Message-ID: <20240629133747.GA4504@redhat.com>
References: <20240627173806.GC21813@redhat.com>
 <37f79351-a051-3fa9-7bfb-960fb2762e27@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f79351-a051-3fa9-7bfb-960fb2762e27@loongson.cn>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 06/29, Tiezhu Yang wrote:
>
> On Thu, 27 Jun 2024 19:38:06 +0200
> Oleg Nesterov <oleg@redhat.com> wrote:
>
> ...
>
> > > > +arch_initcall(check_emit_break);
> > > > +
> > >
> > > I wouldn't even bother with this, but whatever.
> >
> > Agreed, this looks a bit ugly. I did this only because I can not test
> > this (hopefully trivial) patch and the maintainers didn't reply.
>
> The LoongArch maintainer Huacai told me offline to reply this thread today.
>
> > If LoongArch boots at least once with this change, this run-time check
> > can be removed.
>
> I will test it next Monday.

Thanks!

> > And just in case... I didn't dare to make a more "generic" change, but
> > perhaps KPROBE_BP_INSN and KPROBE_SSTEPBP_INSN should be redefined the
> > same way for micro-optimization. In this case __emit_break() should be
> > probably moved into arch/loongarch/include/asm/inst.h.
>
> Yeah. I think so too.

OK... should I send v2? Or another change which does this on top of this
patch? Or will you do it yourself?

>
> Thanks,
> Tiezhu
>

