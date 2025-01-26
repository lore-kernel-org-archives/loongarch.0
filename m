Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA415DBA3
	for <loongarch@lists.linux.dev>; Sun, 26 Jan 2025 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737921081; cv=none; b=lP3K+V6iF7mdCQMvuovywNIClkqe/DrW8lYn4+8ITo75WR7yai7punm+tm7pdRjv3cKQwdUxw7tkxy9fTzfvMhMbYR+KG1bdXGf2fk8IOyeLdo1HNKpqeHbQKT3/KKxOJfp6MxN+PJqS47dyuNKvjzHg6hUHsQ1h34lS/Jc1OKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737921081; c=relaxed/simple;
	bh=bFhQaWsSTCNxDZkc9Tf1UUY6mLJkmzG9949TWmVJVpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHCgzn/aAihHh+f/912a6Q1M70Bsg1Zq0I/zMVSzA/ZLy4B4WfJ0sNpyaRj3fLPJbHDK9K6cXa6qaSRC85hQsktU0LU+qJn/tS8Z8zMzezD961jXDLNVPXcF15pIX/qrqhsf/1Izk0UNBZYJCkuxZPcEHWMlxYBB/pEuxL/QpCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ItCE1WzO; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ItCE1WzO"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so6530128a91.2
        for <loongarch@lists.linux.dev>; Sun, 26 Jan 2025 11:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737921078; x=1738525878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdXvSFO+L4iwC2LmmccPPY17BASnWEA3/Y0WvP5825A=;
        b=ItCE1WzO3bTH08Zn0ztJYtWkr5jcr2F9ue7cheFhktWJZrewyR5t6AMs0/xgkOzxH0
         EtTiqo99Kwi+YLPyClv/nrv6f+zQxjpbX5P3J6iJDEKOH5iIq1E1zdFsz81Fhkh6mjZl
         qq7o3qH4csLS1VJn141c3+9LKfGqoBkgmbcSAEgeQ2g3FNuV9JuKsyYbPbqrE14gqq5/
         TCtIsJRxxDpS6OOeHsqvkDek0Sht2HvcaD7OnlSLWTUkJZndydjbzGOs5Cmmte2COEph
         5XAQhBucM4KIm03aJC7AGr4pIzETekXdGEsZi6pquVTmoRKYiS91n44cvM2zcubMaVb8
         YAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921078; x=1738525878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdXvSFO+L4iwC2LmmccPPY17BASnWEA3/Y0WvP5825A=;
        b=fImMgYdFXEUD+d//JGiduJPtPBD46Ou5WRHW3ysWJ660UudsaEm6iS36PWkEwH32d+
         z0XOm4cOBnRqGDZtfds9cZ1o2YbcolqbnzkLTw1snv4NhulSSfdK0AzXxim6gnbml+Kt
         g6cF+ff7ThxB6uOw6xvgJ6IhSHn3lMNWEmrl8h0gzmqYtl3ytxKhhPp4qKgdnFSbYrSr
         iCDUb9QxwzuVFzyW/VAhAyGg2KhossaNO+/0UFj9fkzIXEGqKLavdvAN/WOgbJgr9YyU
         k7qrk7tAoml5qjRNqFImN4xdbGWgRHdg33GgXluD6qY9qYOMtnjs/ryR49oSmrrLSVTD
         5o4w==
X-Forwarded-Encrypted: i=1; AJvYcCVz5ExEOdg3MM//G2Z9ft69b9UjNLePJqf2kQACINFonDLhI+HyHUWIrLmn7zdnLGEtuuMKHWo0G0U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUVGhkZwUj7+jTgHpi0Sf514pP0tjGIAJX6ZK1l1pBcDUYVBOp
	pMt92ninZPXR0wpSdQSf+fPF7aA24dRxRMmINA0S1FmRcKyj6ttpK+Lttm1dJV4=
X-Gm-Gg: ASbGnctqTnnZfgFtfGlinllUT8BiKggcIGX1/a75B7wNk5QU+A9MJ+VaVXjH1LmhqX/
	mLpMcVgl6bL2Y368AIeBILRm2cSbgy/ODQjRIDYS+h5DE20gEdHYt6ZHhgdjwxV4pywiOUbeKnu
	xOWzqzyD/4vy6V+8Pj8PkP5IebHpx55XuXb7PoGNp97KlqzbFafceysE0SU15PSe46VsFy0g9uF
	Ru8QsupKVYaLviiX0CG9DhsMrxg0S8Vxs+J7Tx38lMmKx6K0Y60yrQ0XDA/eb5ohsY18+EBIw==
X-Google-Smtp-Source: AGHT+IGoSk4mYu17VQ+itknZWL14N0o9mebUHaIoovydNlfjrIPinqMagEZkniueh88np/z9Ikm2NA==
X-Received: by 2002:a05:6a00:180c:b0:725:e309:7110 with SMTP id d2e1a72fcca58-72daf9a53acmr50924580b3a.5.1737921077810;
        Sun, 26 Jan 2025 11:51:17 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:6c5:2e43:4ce6:45b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48f897ed3sm4969089a12.29.2025.01.26.11.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 11:51:16 -0800 (PST)
Date: Sun, 26 Jan 2025 11:51:13 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
Message-ID: <Z5aSMVZLMwmyCp9k@ghost>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
 <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
 <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>

On Sat, Jan 25, 2025 at 11:30:09PM +0000, Maciej W. Rozycki wrote:
> On Wed, 22 Jan 2025, Charlie Jenkins wrote:
> 
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
> >  ASM_NOKPROBE(handle_kernel_stack_overflow)
> >  #endif
> >  
> > -SYM_CODE_START(ret_from_fork)
> > +SYM_CODE_START(ret_from_fork_asm)
> >  	call schedule_tail
> > -	beqz s0, 1f	/* not from kernel thread */
> > -	/* Call fn(arg) */
> > -	move a0, s1
> > -	jalr s0
> > -1:
> > -	move a0, sp /* pt_regs */
> > -	call syscall_exit_to_user_mode
> > +	move a0, s1 /* fn */
> > +	move a1, s0 /* fn_arg */
> > +	move a2, sp /* pt_regs */
> > +	call ret_from_fork
> >  	j ret_from_exception
> 
>  Wouldn't it make sense to save a jump here and make it a tail call, i.e.:
> 
> 	la ra, ret_from_exception
> 	tail ret_from_fork
> 

I don't believe so due to the return address stack. It was shown in this
patch [1] that a 7% performance improvement can be seen on existing
riscv hardware by performing the extra jump. Doing tail calls should be
avoided on riscv since the hardware can be expected to predict the
return address incorrectly every time if the return address is manually
changed.

- Charlie

> ?
> 
>   Maciej
