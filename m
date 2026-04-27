Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1534AAE3
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305736; cv=none; b=vDFYm7eBsj948hPXC9+/6PhJQe7hWhCMdsQmVinjtBn+A0FOHwv/UFCKAegy5qLBKMv8OiLV75/OWpN6tWQHSbTZ8hVY4vLzVbxN8pq/VJNsacXZ9Ai8SUMt6FRnshGi9of87G0BvU3BwVwYI17+0NsvV0U2Xi1SaovHO2JZeTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305736; c=relaxed/simple;
	bh=888yAmMb+2bkYxMtzzPRo5jdCa2Khba/ny+n5sOcH1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNLOI632S+RZuba71UMXjwOxgCmpfytzc4WFu/rssfa+gkTeHuSCYNV6y1Ma5+CbihudhguD0yXKGcTfWP2GFe5b8Y3XEuot22kyRTYRt445biSTSV8ryjvLQbENc6bzqIAJdQbt5Ygu3sxhMB/EI5e8WD80AUM4le3SSOjeJYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2jFVvzD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2jFVvzD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D7EC19425;
	Mon, 27 Apr 2026 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777305735;
	bh=888yAmMb+2bkYxMtzzPRo5jdCa2Khba/ny+n5sOcH1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2jFVvzDGkCAZLiFdhTVgdqL5mRB2PfHUXgOIXxoROLAeYVwV+Qaj6/yDu1egBPM2
	 cZt/kAcDiKTpGhOPkF8zq/0qyLcvci/blGBbirW6zknFEWzesTY2UHGU0g4FMa9ZUe
	 1Q8UF+g6Qy0I0gvWIwSg27Ihs6vHkjDEiFJSAhoUMkDu/ljyynr9clzWycroan2YzH
	 MTTnon0jwYNnES9kYm5Wmws53DQKnTM6JzKuk5QELUTSwmzi3rFCZB0H+shzzcP8SH
	 XMTgXgLVHgcQsdylWQ4tMODuixTcOKB4/3dP2GVOGR7Fe3tB6gKIm0QEwqgkhydgxI
	 +0fAlJzOnBwhQ==
Date: Mon, 27 Apr 2026 17:02:12 +0100
From: Simon Horman <horms@kernel.org>
To: Ming Wang <wangming01@loongson.cn>
Cc: kexec@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] LoongArch: Increase MAX_MEMORY_RANGES to 1024
Message-ID: <20260427160212.GA612626@horms.kernel.org>
References: <20260304011914.880120-1-wangming01@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304011914.880120-1-wangming01@loongson.cn>

On Wed, Mar 04, 2026 at 09:19:14AM +0800, Ming Wang wrote:
> On some LoongArch systems, especially multi-socket machines like 3D6000,
> the current limit of MAX_MEMORY_RANGES (64) is too small to accommodate
> all memory range entries in /proc/iomem.
> 
> When the limit is reached, get_memory_ranges() stops parsing, which causes
> kexec to fail with "locate_hole failed" because it cannot correctly identify
> the crash kernel reserved memory or necessary RAM segments.
> 
> Increase MAX_MEMORY_RANGES to 1024 to support systems with complex
> memory layouts.
> 
> Signed-off-by: Ming Wang <wangming01@loongson.cn>

Thanks, and sorry for the delay.

Applied:
- LoongArch: Increase MAX_MEMORY_RANGES to 1024
  https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=677dd2f8bcf7
