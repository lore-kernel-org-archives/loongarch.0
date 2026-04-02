Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935133DEC8;
	Thu,  2 Apr 2026 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140572; cv=none; b=NKNY1+FoNIZb7nMGDQz2hFQNjUzh+fDYuUGUqBE53VEPWDOQc24l17bofpbKwOcf242UsdrLIBIaFaaq5AO5I5DOK3Ifw6F6PZa3IxRJzBPwRmPNqctcMC6K7XgyhH6D0rh033zmL99jJPB6lWMNNgkHBdhvigPZftbnd4I7V34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140572; c=relaxed/simple;
	bh=4s8ycTTqGBfPAjcnUvWLEHzPmpY8efMC6rEHE5Km91s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUZ+TRy7Ny3drMGPVIXXuj3NijIK5LEbPBX9Q2w0xTDdlz7XMLCi4CkO8yzm06RQjXzrMcNsc2ci9EvZiCpwC5/Q/rEtnFCelMjoSRhP2n0irquNEtRZf8FQJnu7MyzjnQWQ5p5xK1IECVSUGRpFIRTGxKp96K+z4rpHSnCgJVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oOzXNSB8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oOzXNSB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B8DC116C6;
	Thu,  2 Apr 2026 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775140571;
	bh=4s8ycTTqGBfPAjcnUvWLEHzPmpY8efMC6rEHE5Km91s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOzXNSB8yY4RT38phQQjoYPZDhvboL59N/fMgjeWnlsMkHDjT99R/36IJAJRPe7xs
	 UuZ5Q12qDA5Oz+bg/nYo0PX4Of8F68RE3VyuZS0QeAXwyuGJMai60maSLtn1vpXSOW
	 ZrYYEm4O5LjJ9TQxGW4za1j14zE9OJTWBx9zRJbU=
Date: Thu, 2 Apr 2026 16:36:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, arnd@arndb.de, jiaxun.yang@flygoat.com,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, stable <stable@kernel.org>
Subject: Re: [PATCH] LoongArch: add spectre boundry for syscall dispatch table
Message-ID: <2026040259-landowner-chamomile-f581@gregkh>
References: <2026032456-crinkle-washable-96ea@gregkh>
 <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>
 <2026032541-rental-sizably-48bd@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026032541-rental-sizably-48bd@gregkh>

On Wed, Mar 25, 2026 at 09:53:09AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 25, 2026 at 11:26:29AM +0800, Xi Ruoyao wrote:
> > On Tue, 2026-03-24 at 17:30 +0100, Greg Kroah-Hartman wrote:
> > > The LoongArch syscall number is directly controlled by userspace, but
> > > does not have a array_index_nospec() boundry to prevent access past
> > > the
> > > syscall function pointer tables.
> > > 
> > > Cc: Huacai Chen <chenhuacai@kernel.org>
> > > Cc: WANG Xuerui <kernel@xen0n.name>
> > > Assisted-by: gkh_clanker_2000
> > > Cc: stable <stable@kernel.org>
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > > My scripts caught this as I think LoongArch is vulnerable to the
> > 
> > There's no evidence.  The kernel currently report all LoongArch
> > processors invulnerable to spectre V1 via cpuinfo.
> 
> Where is that?  In the sysfs files, or in the actual silicon testing?
> 
> > So NAK unless there's a reproducer of spectre V1 on LoongArch.  If so
> > we'd also need to adjust the cpuinfo output.
> 
> I really thought this cpu was vulnerable to this, but if the companies
> say it isn't, then great, but reports like this:
> 	https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-3-of-3/
> say that the silicon is vulnerable.  So, which is it?

Any thoughts about this?

thanks,

greg k-h
