Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7346BF
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083377; cv=none; b=qzA9COBSnJf8OhjjueQ0FvKZB2OOsQ4RDQk2wkuLI5YEkR9BV/qvoJrIg+hpe05u0nHkZsGQINLRmzMajSetznLDvO4HpKNxIqT48t5FJxk9SFvm+XFku8qKCJNeQeA1U27pXCmG2c9T4aykujvJqsje+e4bx0LAjR6kVPbXQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083377; c=relaxed/simple;
	bh=suNX2F0oiWEIqXhaxwXB+h1oubO69vxsgmBnpaXWG44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrGIZBz3qbXgF0fZEpGvbWayU8nVotJc5lhdpwe7pba2FOKd2q3mZd0OXUh0Voi3I9Gf6ejuyOQjqFtxuLWHzogmUnByHJa30ihHbQ1HZRQMLUH5WjQkpoLf20pSarVMDdAwkgB0MJntox73newTspjnkUi/tickfxjZp/diB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RRa/Krru; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RRa/Krru"
Date: Tue, 28 Jan 2025 08:56:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738083370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nEypoZkJBvPy7LCE9CcM6T3dfL8Axr5wGy9CsfPKwNg=;
	b=RRa/KrruZr0qmWdUQPH0PUt7FXyw+nch6dJWqTjLgji5Ai6OrD3DtDhyXGZCJ1/xiK2MQK
	h7lmcn3RcRMaf8HWB210IaSKzRylS4I0rpLeUI2nDns6LJJ4/OYNzleQ1/V7hGwfFKvzIh
	7th5Xp5URZ+Kvs8rVzETfqiT9zrTjoM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vitaly Wool <vitaly.wool@konsulko.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] mm: z3fold: remove z3fold
Message-ID: <sgdggr2umqey5dl7uxeic2hn7c5s3olmtqzxlw6fvq3fouljij@q5yz2h4my77f>
References: <Z5gdpStVzlM_fRLT@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5gdpStVzlM_fRLT@google.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Jan 27, 2025 at 11:58:29PM +0000, Yosry Ahmed wrote:
> Z3fold has been marked as deprecated for 2 cycles and no one complained,
> as expected. As there are no known users, remove the code now.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
