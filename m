Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD481586DB;
	Mon, 16 Sep 2024 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726502827; cv=none; b=Cx5EGhTLxJRpaSNwkD/usP9mkM2UyXJiqJ4cb2uoN0K/y/ihXyGmJBDvzSXhCiq5Z06aUXp762jo3Bd/OTW9coXnbd12KuZVx5I1eQ2GSD5tuw0es/gT7mQlJelMI4i/Rla2Br+xeKYyiZ30x+K7wu7MBbqQqVohQz6HhDw5d+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726502827; c=relaxed/simple;
	bh=h+A4cJVjD7k2GTlZB6ZVTMzkDNzfjW1oro1ESMMgXH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQDLOc2kybNTHjaNcChAGHG25uOLmiIQLsFLTBuoW0Or97es8pnsUG874QD8SHdoXJnjAtvRXglouAgf3d7md3Gqsq3VncFYc93N/DwOg5lTamNTqD+XbXRtBaQgvOmDQV5ZkEDN9NvckUn3qu8R4O3ePzgwDFu6HUMZJdxE8qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE43C4CEC4;
	Mon, 16 Sep 2024 16:07:04 +0000 (UTC)
Date: Mon, 16 Sep 2024 17:07:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v3 2/4] Use generic io memcpy functions on the arm64
 architecture
Message-ID: <ZuhXpvA3FdTAoUNJ@arm.com>
References: <20240910134341.2537407-1-jvetter@kalrayinc.com>
 <20240910134341.2537407-3-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910134341.2537407-3-jvetter@kalrayinc.com>

On Tue, Sep 10, 2024 at 03:43:39PM +0200, Julian Vetter wrote:
> Use the generic __memcpy_{from,to}io and __memset_io functions on the
> arm64 processor architecture.
> 
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
