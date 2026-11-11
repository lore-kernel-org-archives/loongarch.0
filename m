Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385202;
	b=w+u/U99aq2z+FUIDnoZ/lJnAEH+NLpKYmBHLeiJd4V4asDzCaGKhj6m2f9iWEQaQnIHk
	 2+VcdydhfVT0sXJIhmw+jnKI7MDhtT/JG7nBnlxaxuGa0DxtYculSvUtx0/hO8ZW7zAVy
	 K7aZgujPBcdRt2WXJ+xpBlPj+nNezUeec0qxEi9Xriibs4Uj2qce96NaLHJ15Msj9iO7H
	 FCd+lTN+Jny+qxRRTQRCaADvT2LAJQTCghXa8kYk2pgpD0TiOZgMWgnjd8sjYMOmyLQoI
	 S1LICRSvzOQfYPUo5guIKktWODBUDeQ+2M5Vl7O2nMCFXshqrsHvTzOeFwPLfuY3dqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385202;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=G3d3b2tM519kuIvjkSRexg4H0KkdNZyWkRnjj4rZTd4=;
	b=5f5H0IMoVKw0KEr04QwukZHoZ+veRXM4FJLnvLicm9iv82vZmKaVEjBut5YK/RDVaHji
	 /Nqq+lxIrxeneg2nw52z8TMzFVrULt6O8L7hwCLSyL2Ni5unksF1B9QeM/woGB2UCBZKt
	 HF6fgGkYG8gwzaDR7hUrVfmxZVmbPRXJWz4JkDQxPb8JTHsyLltIzjKak6PXChicPb9XK
	 TvTRGZSLQzCno3jt+s9hXkYIKtM1g6jOiZ77A6DHmpFDu9I7KVBc16XMnZwxqOhZxMf6J
	 HpptqSz8C8RRFpC9o3uP89yNXEaSZKs3qX/9Jemw9ho8KQ5o2A1w6BE9nTG7jjZdD5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iyOp41w6;
	arc=none smtp.remote-ip=91.218.175.128
Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D3606A321
	for <loongarch@lists.linux.dev>; Wed, 11 Nov 2026 08:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iyOp41w6
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=01hkxhMvjpH0YwUfWPSVcu2PhKCcNEL9gg0Q0PcG8gI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794385199; v=1; x=1794989999;
 b=iyOp41w6ePFfiABPcVNymqvnRo7CvaC7mYHYLS9IIcdtQDFFSmovUlyn7TOR60F6UJXjYQHx
 HBdMKlOMlV0Fj9OFgH1bcGEq7R3P7yexH45CjSDoP4/BLlil+pzb4rmq/ZUZgqqgEe0v0YN/1Yc
 B25Xx13HT1EETMUH+9zTErRQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 2365b7a9a39834f0;
	Wed, 11 Nov 2026 08:19:59 +0000
X-Mizu-Trace-ID: 2365b7a9a39834f0
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 16:19:49 +0800
From: Hao Li <hao.li@linux.dev>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/slub: Genericize x86-specific cmpxchg16b comment
Message-ID: <avQkXxpsIdxB5Ye6@fedora>
References: <20261111011108.29311-1-yangtiezhu@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111011108.29311-1-yangtiezhu@loongson.cn>

On Wed, Nov 11, 2026 at 09:11:08AM +0800, Tiezhu Yang wrote:
> In __kmalloc_nolock_noprof(), update the comment from x86-specific
> "cmpxchg16b" to generic "double-width atomic cmpxchg".
> 
> Suggested-by: Harry Yoo <harry@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> v3:
>   - add missing Suggested-by tag for Harry
>   - use shorter commit message as requested
> 
>  mm/slub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 45e077c7526c..090302f1daeb 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5589,8 +5589,8 @@ static void *__kmalloc_nolock_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t gfp_f
>  	if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
>  		/*
>  		 * kmalloc_nolock() is not supported on architectures that
> -		 * don't implement cmpxchg16b and thus need slab_lock()
> -		 * which could be preempted by a nmi.
> +		 * don't implement double-width atomic cmpxchg and thus need
> +		 * slab_lock() which could be preempted by a nmi.
>  		 * But debug caches don't use that and only rely on
>  		 * kmem_cache_node->list_lock, so kmalloc_nolock() can attempt
>  		 * to allocate from debug caches by
> -- 
> 2.42.0
> 

Looks good to me.

Reviewed-by: Hao Li <hao.li@linux.dev>

-- 
Thanks,
Hao
