Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F45381EA7;
	Fri, 17 Jul 2026 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313454; cv=none; b=aV38QiBXZyXo7nLug9t5ujplSJhyDsoyg8l0StiTp07XLpoQLNezXL50CXUFSriz/Rp7a/3s/2OviDpEQjdiBfQgu5xNgP4x6S2oIFaXZvectcYRKqS/jOG5Dt/nk5Eko4vqOfplUeqZ++0Bj4A33hUgX5ysISmwuSulPr8DnTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313454; c=relaxed/simple;
	bh=YLt49FMsOyv6qnhCVMXRMykOrBYx/PNFLfCidUpvynM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Aolj4lqBiulC+g2+Cg84YK54CtyS/CnnVFriGP+QiF8pqQbto2CZGop+loPMRUv8vNspKwIe6mMT3di4Z5+W5s1hKLS6/Wwv81IKoIxl/L29VHvaEreEaufzTJxtXlXqPHzhQhEjZMOya3EvkvDVKb58QV6KXCXf9d2uV4FSHDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hCfe3OjW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hCfe3OjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7CE1F000E9;
	Fri, 17 Jul 2026 18:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784313451;
	bh=THypN7sBajrN11WinYD29s8FZFx1TY39ImlyNCXePlQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hCfe3OjW/NqtOug/QPf3IPtV/80bZRqy4YqNjEOnU/z8XU+bMkM9hSHfNrI6ZWC69
	 NFiYnjY9AznpvT08PI8bHmdybdhBo/3003FW+2zMpi81TEeaguEIRJV68tUEcHzkla
	 cRVUCwAgMhH6c6QqwezewMdcEM4zX78mMS6D325w=
Date: Fri, 17 Jul 2026 11:37:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Mike Rapoport <rppt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] mm/execmem: Print size, align and caller on
 allocation failure
Message-Id: <20260717113730.787867964b1c3a7c645bb0e0@linux-foundation.org>
In-Reply-To: <20260717075715.25513-2-yangtiezhu@loongson.cn>
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
	<20260717075715.25513-2-yangtiezhu@loongson.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 15:57:14 +0800 Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> The current execmem_vmalloc() function reports an allocation failure
> with a simplistic "unable to allocate memory" message. This notifies
> the user that an error occurred, but it acts as a black box during
> debugging.
> 
> Enhance pr_warn_ratelimited() within execmem_vmalloc() to explicitly
> print the requested allocation size, alignment constraints, and the
> symbolic caller.
> 
> This diagnostic visibility is valuable for analyzing the root cause
> of allocation failures and tracking misbehaving subsystems without
> inducing log pollution.

Have you actually encountered this?  GFP_KERNEL allocation failures are
supposed to be very rare.

> ...
>
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -50,7 +50,9 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
>  	}
>  
>  	if (!p) {
> -		pr_warn_ratelimited("unable to allocate memory\n");
> +		pr_warn_ratelimited("unable to allocate memory, "
> +				    "size=%zu, align=%u, caller is %pS\n",
> +				     size, align, __builtin_return_address(0));
>  		return NULL;
>  	}

This seems to be duplicating the information which the page allocator
can emit.  Perhaps we should remove the __GFP_NOWARN in there?
