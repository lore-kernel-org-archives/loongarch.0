Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90211A76CB;
	Tue, 24 Sep 2024 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727192437; cv=none; b=qa1VjE7E/4ub20DfzLNV+1FmStKmNo5r48rXKzfpy1/bWGB/ThAt1xS6l7DENQdBzdRpFVPIKbisTH2Mf7aK/ti2+C2kq7/yzJJ0DGkWBCtCakTMQDHITWbA9fd7XtINJUYZfsYw540TJC+bvgp4ICBja1fX6UQKYCr99BsDvao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727192437; c=relaxed/simple;
	bh=2nPRAg0voDq98oYsZi03VvxNhHm7rvoIKXTXLZo8ikE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxlsm/dfmEBCYtBtqCkLYtFBYkJc1wOshwLyRTqA++PdwPtus1lXFBtjo/drgjJmRmZAGj/V/UedHjQN4v9dkgac3WKusuMc1LeIoz2Ko1A+urMXnchq82PxQpKW/7VxkBOlrG6LNsnHIT1IN/4e84OJcwUf0PSJ0E/jJ9ZXF8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0609FC4CEC4;
	Tue, 24 Sep 2024 15:40:34 +0000 (UTC)
Date: Tue, 24 Sep 2024 16:40:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v5 3/5] Use generic io memcpy functions on the arm64
 architecture
Message-ID: <ZvLdcGesj-gMANyR@arm.com>
References: <20240924121432.798655-1-jvetter@kalrayinc.com>
 <20240924121432.798655-4-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924121432.798655-4-jvetter@kalrayinc.com>

On Tue, Sep 24, 2024 at 02:14:30PM +0200, Julian Vetter wrote:
> Use the generic __memcpy_{from,to}io and __memset_io functions on the
> arm64 processor architecture.
> 
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

And a nitpick if you respin: we tend to write the subject as arch name,
colon followed by the actual text. E.g.:

arm64: Use generic io memcpy functions
