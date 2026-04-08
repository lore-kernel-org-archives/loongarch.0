Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17919D8A8;
	Wed,  8 Apr 2026 05:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775626007; cv=none; b=d/Hw3tUo/LKHTegr009zisTC1JoQYl/DA2aT+zduD2Sgzj5ou5TDHxbFSdEJc60i5DPD/NA6l8zkbDfvClu4KiBcIVqSAKd5vNVRMAIZWiJkpwmrc3fkg9JWbgYcqejTysxbkYWFykx6eep6k1WVbHRDIwvSYQJGJlIPYkE7WrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775626007; c=relaxed/simple;
	bh=XsU6WhozryYy7v1DY8CC3XtjtWyaqGZUOVMrTW8OyQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5eJcNcbcoEz1WwBhRExpDiZfbTaJ1ncH5WdVGFoUfCWLPP57c/RNRqKIDH9LjWdA7dDehkJwQq6aR3/h1jyhye5JjzZbuFj6HGAT4Pi/yBb4H8J98Dg+SfYcueTtFvoLQjynaF/Sj15XYBtb8lQVVdzZcQD/4Ir1gy/nhrQjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mTg/MKx9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mTg/MKx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DCAC19424;
	Wed,  8 Apr 2026 05:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775626007;
	bh=XsU6WhozryYy7v1DY8CC3XtjtWyaqGZUOVMrTW8OyQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTg/MKx9sMhGOnAl5gaB4xQZy2Aql9qi+PLwxiiGnC3APChcS4LGkMXS1WiQtgCSd
	 F5MIzYAPk0AbNj11kGDjpGoejp9lyU0flAyKn3NvV2GTe7cAx8Q9DOMHV2RhiXInj6
	 DkyI4lGAibFNgSHdtgeeLecAQWk09BCrLPKuoV2I=
Date: Wed, 8 Apr 2026 07:26:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bibo Mao <maobibo@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
	arnd@arndb.de, jiaxun.yang@flygoat.com,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, stable <stable@kernel.org>
Subject: Re: [PATCH] LoongArch: add spectre boundry for syscall dispatch table
Message-ID: <2026040814-console-curvy-fd6f@gregkh>
References: <2026032456-crinkle-washable-96ea@gregkh>
 <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>
 <2026032541-rental-sizably-48bd@gregkh>
 <2026040259-landowner-chamomile-f581@gregkh>
 <60f0307f-0c44-4f14-0185-4f0a16cf3a9c@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60f0307f-0c44-4f14-0185-4f0a16cf3a9c@loongson.cn>

On Wed, Apr 08, 2026 at 09:17:07AM +0800, Bibo Mao wrote:
> 
> 
> On 2026/4/2 下午10:36, Greg Kroah-Hartman wrote:
> > On Wed, Mar 25, 2026 at 09:53:09AM +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Mar 25, 2026 at 11:26:29AM +0800, Xi Ruoyao wrote:
> > > > On Tue, 2026-03-24 at 17:30 +0100, Greg Kroah-Hartman wrote:
> > > > > The LoongArch syscall number is directly controlled by userspace, but
> > > > > does not have a array_index_nospec() boundry to prevent access past
> > > > > the
> > > > > syscall function pointer tables.
> > > > > 
> > > > > Cc: Huacai Chen <chenhuacai@kernel.org>
> > > > > Cc: WANG Xuerui <kernel@xen0n.name>
> > > > > Assisted-by: gkh_clanker_2000
> > > > > Cc: stable <stable@kernel.org>
> > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > ---
> > > > > My scripts caught this as I think LoongArch is vulnerable to the
> > > > 
> > > > There's no evidence.  The kernel currently report all LoongArch
> > > > processors invulnerable to spectre V1 via cpuinfo.
> > > 
> > > Where is that?  In the sysfs files, or in the actual silicon testing?
> > > 
> > > > So NAK unless there's a reproducer of spectre V1 on LoongArch.  If so
> > > > we'd also need to adjust the cpuinfo output.
> > > 
> > > I really thought this cpu was vulnerable to this, but if the companies
> > > say it isn't, then great, but reports like this:
> > > 	https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-3-of-3/
> > > say that the silicon is vulnerable.  So, which is it?
> > 
> > Any thoughts about this?
> co-ask though it is hard to decide :(

Can't you all run the reproducers on your platform to determine this?
There should be some basic ones around somewhere, this is a very old bug
:)

thanks,

greg k-h
