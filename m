Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8639A7F2;
	Wed, 25 Mar 2026 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428813; cv=none; b=ezUQBaLXcN56GRskI6K9zmG0dR0yq7rE/eo+jwGFMyaHlpOeDgLCmrXG8PJnDdxmEhdzhnayHImqazy7CI8o/h9nO+Pn8ocA4k+eXoEceEcHHm4RQt7rb9/JoA7LhaBdkQeA86otTWduBeanlt+KsOp7LeqsNNTgHO2a14BZvME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428813; c=relaxed/simple;
	bh=jjBuEWFC0C5Y7B+a0sd2j8L/RIjE1T+l+8+9jmEglRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sddl6B/p9+hhAN3sdgcEwB0sTPQndk/Wqzl93CCQeKJQltW/iUHzihJAyu2nebI6EMi+Epw/AOOueQYxi/KQu+hjeiAbpD5hdAJM0pCNstcwsK40ZQSQaZwZGqUyOeXDN1+iZ4LrkiMkJq2nISn47ZCdN0ZHBCwhAELJQW/Tvws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VgIKSPZy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VgIKSPZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FC7C4CEF7;
	Wed, 25 Mar 2026 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774428812;
	bh=jjBuEWFC0C5Y7B+a0sd2j8L/RIjE1T+l+8+9jmEglRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgIKSPZyw4u8+NRiAkCJ/Y7OlderFlBgEzKZVUSw3dz80/YbNzNKdy4R//uYfTCtk
	 OEh5/QVUZcAGEZE7UPPA7BI1XH63deuFW6+5Vde5VhOFn+ROCCuBwcscbYA2sENZ9C
	 eX7JxzMW1HpkfDJhRCBfeZT9EM9J0OjvbNNbpiWM=
Date: Wed, 25 Mar 2026 09:53:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, arnd@arndb.de, jiaxun.yang@flygoat.com,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, stable <stable@kernel.org>
Subject: Re: [PATCH] LoongArch: add spectre boundry for syscall dispatch table
Message-ID: <2026032541-rental-sizably-48bd@gregkh>
References: <2026032456-crinkle-washable-96ea@gregkh>
 <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>

On Wed, Mar 25, 2026 at 11:26:29AM +0800, Xi Ruoyao wrote:
> On Tue, 2026-03-24 at 17:30 +0100, Greg Kroah-Hartman wrote:
> > The LoongArch syscall number is directly controlled by userspace, but
> > does not have a array_index_nospec() boundry to prevent access past
> > the
> > syscall function pointer tables.
> > 
> > Cc: Huacai Chen <chenhuacai@kernel.org>
> > Cc: WANG Xuerui <kernel@xen0n.name>
> > Assisted-by: gkh_clanker_2000
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > My scripts caught this as I think LoongArch is vulnerable to the
> 
> There's no evidence.  The kernel currently report all LoongArch
> processors invulnerable to spectre V1 via cpuinfo.

Where is that?  In the sysfs files, or in the actual silicon testing?

> So NAK unless there's a reproducer of spectre V1 on LoongArch.  If so
> we'd also need to adjust the cpuinfo output.

I really thought this cpu was vulnerable to this, but if the companies
say it isn't, then great, but reports like this:
	https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-3-of-3/
say that the silicon is vulnerable.  So, which is it?

confused,

greg k-h
