Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E9719413B
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725530768; cv=none; b=loFb5kLuY63Koa+Dz+rS25VL8kLGtrocJJVu+7OLikpB+Bk3YM5mrU3kZukHZ0Lsb4U6C7VxDXvWWaTDgWRcR11CBOoTBoN6mZt3pkDh5OL/frsmabwj6BVmOasxNgCm7IpX20Tyb9iSjMifKdXAxgZAdo7hkHRhgKB1Uu9OgEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725530768; c=relaxed/simple;
	bh=ZlbdctOsUdrPdNxFA4u0cAuMT1cQ038QEqSiHn+sz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQjJhGwtN7MRlFlJuud113K6XMIVdwOow/gPjV6Rrk8Zc0xsQqStvDdQi8Z5RMO7Ev9RdxGtN+Y4pZPixFA999FEjUAzCPlUop9EZgliaedIBKxK2FvkIkvguqAY9EzTgI7gn4Da2mYr3r/tVIfZP0gV7wsgWKwE8eyJ+ecnrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=L0ef/LSk; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="L0ef/LSk"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c51d1df755so2993966d6.1
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 03:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1725530764; x=1726135564; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FssOZMkL4EI9Dg7029SIMlcBVh5AI88igqnT1wzgpi8=;
        b=L0ef/LSkFKUSYX4lPL51Etg162QKBqbGdtaNdY4A1xSJENaSPJxuC6XDtgHu+Ys9sF
         d36p1NBN74yxnuNsWV7fnZXEtQ2L1tTA8ZvpM5jUufyCs2yDwzM2r0tkGueRyMiMUaYW
         apnDkHxiF52p8ZLaLr19bVyVkTmK+vLucFqI6GWXAicaQ2Qd/J9XNBdEUuhKmINZo73C
         o4+A8ZeBR2bnAub8PY6BXQVIR3GgwD4Q7B/KjPbhMb7AW1C28HvZwSlidfjLquJ5rskq
         JvJdajFeOesxgASVt0L5Ts1nMDtRY1jlX5tL+zAKQcGPqH1+drQGlaoLln0G73xjLpzp
         Kd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725530764; x=1726135564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FssOZMkL4EI9Dg7029SIMlcBVh5AI88igqnT1wzgpi8=;
        b=PgLJmb66+wt5Xht1Agiuq1tovc8eYySdXVPvCktimnItAiU1C3VCmObeKsAYql58z/
         AOfnJ39QaU7zEOG7VggLZx0oy4+HlHdXjNwG+JMXuR2eUJCuKo48qRcUomhdLBpFMl4U
         jZ2jiBSj8VNt7+bQjma/WH2465zuIZlqS7lKeahU0CyEktEB7L+HiSUDK2jQOYhZMLma
         LEhMzz4ME0sYsUroJ+2GmGkPjjbAuIJobMjvQeTpi+w3wrAHo7alNRgNwjGyNzEb4sZB
         2sru8EI77dJUqebUTaOMsp5Wvhz82UCudRKxiW4wXw72NOQMxAYeTH6/YuvVi6k8CfmQ
         7jCg==
X-Forwarded-Encrypted: i=1; AJvYcCWh9bbM6CihKYYTMZwsp+/+1wvdVZBaOWCnxELywD+PV7zkb3J6NtYneCa744BVCB7TctKxrGHJw6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb5kX650JOsmhDGxTBAaOmka7F70NZ1XoMiEKgrHeao7FonuMr
	boZhNbWlQxo+kpsXoMWaFEzExNLHV7Lwfr8V5PboYWaGdl0V/llreLD/ggN/Esc=
X-Google-Smtp-Source: AGHT+IFqlUnb0R4Tnf7fLDfR9u43Xt0rwLhVu8SYQjcg8VJmKtyiXjLAvjhl0Q1+nPJDIOI+VCzqpQ==
X-Received: by 2002:a05:6214:5b09:b0:6c5:1707:7159 with SMTP id 6a1803df08f44-6c517077d53mr70665036d6.33.1725530764171;
        Thu, 05 Sep 2024 03:06:04 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c52019407fsm6350906d6.0.2024.09.05.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 03:06:03 -0700 (PDT)
Date: Thu, 5 Sep 2024 06:05:57 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Chris Down <chris@chrisdown.name>, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: z3fold: deprecate CONFIG_Z3FOLD
Message-ID: <20240905100557.GA2748692@cmpxchg.org>
References: <20240904233343.933462-1-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904233343.933462-1-yosryahmed@google.com>

On Wed, Sep 04, 2024 at 11:33:43PM +0000, Yosry Ahmed wrote:
> The z3fold compressed pages allocator is rarely used, most users use
> zsmalloc. The only disadvantage of zsmalloc in comparison is the
> dependency on MMU, and zbud is a more common option for !MMU as it was
> the default zswap allocator for a long time.
> 
> Historically, zsmalloc had worse latency than zbud and z3fold but
> offered better memory savings. This is no longer the case as shown by
> a simple recent analysis [1]. That analysis showed that z3fold does not
> have any advantage over zsmalloc or zbud considering both performance
> and memory usage. In a kernel build test on tmpfs in a limited cgroup,
> z3fold took 3% more time and used 1.8% more memory. The latency of
> zswap_load() was 7% higher, and that of zswap_store() was 10% higher.
> Zsmalloc is better in all metrics.
> 
> Moreover, z3fold apparently has latent bugs, which was made noticeable
> by a recent soft lockup bug report with z3fold [2]. Switching to
> zsmalloc not only fixed the problem, but also reduced the swap usage
> from 6~8G to 1~2G. Other users have also reported being bitten by
> mistakenly enabling z3fold.
> 
> Other than hurting users, z3fold is repeatedly causing wasted
> engineering effort. Apart from investigating the above bug, it came up
> in multiple development discussions (e.g. [3]) as something we need to
> handle, when there aren't any legit users (at least not intentionally).
> 
> The natural course of action is to deprecate z3fold, and remove in a few
> cycles if no objections are raised from active users. Next on the list
> should be zbud, as it offers marginal latency gains at the cost of huge
> memory waste when compared to zsmalloc. That one will need to wait until
> zsmalloc does not depend on MMU.
> 
> Rename the user-visible config option from CONFIG_Z3FOLD to
> CONFIG_Z3FOLD_DEPRECATED so that users with CONFIG_Z3FOLD=y get a new
> prompt with explanation during make oldconfig. Also, remove
> CONFIG_Z3FOLD=y from defconfigs.
> 
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmail.com/
> [3]https://lore.kernel.org/lkml/CAJD7tkbnmeVugfunffSovJf9FAgy9rhBVt_tx=nxUveLUfqVsA@mail.gmail.com/
> 
> Acked-by: Chris Down <chris@chrisdown.name>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>

zsmalloc's CONFIG_MMU requirement was a concern in the past, but
z3fold appears so bitrotted at this point that it's simply not a
usable option anymore.

> I think it should actually be fine to remove z3fold without deprecating
> it first, but I am doing the due diligence.

Yeah, you never know for sure if users exist. Deprecating it for a few
cycles is the safer option.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
