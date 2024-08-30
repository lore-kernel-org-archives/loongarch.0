Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B015726281
	for <loongarch@lists.linux.dev>; Fri, 30 Aug 2024 01:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724980284; cv=none; b=EBlKspQSDfd00/m58Bx65Y/8fSwmDYhxYn6T2em31NjTtkgv3zqDPJld5Xp6f2sOQPoQYQCykf97DgLOmihggfd8S8uELrsyDBDdDw3uRjwe9/H6aS4Z3B49nL5oXu2eV6c7c/1deGHEfmLgxajs+3KWgf/rCbO62LSAIje+ug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724980284; c=relaxed/simple;
	bh=MrgzYaNv9tfxCz/b25set1/A6ngJCYD0Yc3OqKIklYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxCC9wz5NDKuXpuhkU+YvK3va/7/MriS6zxtfn3pmfhsEjciTY3jGTS5FpWPlukqzGpnd/M8inIaJNZniZEmghAoYWlDKgyEx6GREldxROE4QI4PSOBh6KQ5RwkbEdC9OAVS/pl7y3b9Uj2f77X/yp9zFMifli2LpeF5Fgo4ktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UuuSr3Qf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UuuSr3Qf"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-714262f1bb4so1066369b3a.3
        for <loongarch@lists.linux.dev>; Thu, 29 Aug 2024 18:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980282; x=1725585082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq7LnGnCY31W8p33KfA4sDocR34ueQ+QZ1h3PRF4p6w=;
        b=UuuSr3QfaFl2E7AeBBP2TRZx/xB/PY8QThgDh198Lct/3xgrgZDcPSfscjRd/FDMtH
         upJDWbKzBHxfLObaPUdBU4Gfed8yX59M+CnT8UN1NdOwTAg/Y3dbzsrgC04kF6NTZjbf
         SYMe/64dLNMaxFN5RsEega2YuS2B5FPhsjSZzhCZzYmd004z4XxkKq9Ojq4keO17E1Z+
         X028EB9CnscYjCFX2smgc7lGYeQsn+xIUh12JARdg+mSe/tBJ0LfSsGgvpofG0R5VqZn
         x2H0M4nrr5k6uDlpRQ5o1CWeryrIoMDTG7KdADSm2k5roOPaPdx3IBzm10BERW6QwdxN
         gQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980282; x=1725585082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq7LnGnCY31W8p33KfA4sDocR34ueQ+QZ1h3PRF4p6w=;
        b=UeaDJMrQ6OwSsygmn45benEaXlsJ49izEzEszVr0Oofo2nr7QqoRWouVQO5HDDTezO
         nKD8fdYNH7e55OMM4K37QDp1Px3z9KWbbD2uTYL2qCdD0jB884PHc3oFgO33XCLm2065
         Eeaanz++uiFHz1VNyJPnpovN+M+fqzy0532uxEloaLbiIWnLbHRRV4Wyq1xtK0NA3jpk
         CTOBqoluobLYTS28IeMuyOc3dSi3UrDjiLEtvqGcXCZWcLUEXWMgBjdEqHegrl8o69Yr
         jAmwqVQAhI5bDs580jKtX8owRSsERo9MWd5w0+e+bLLL+MzSHG4OJ1aBJuoXf/044/XT
         aI0A==
X-Forwarded-Encrypted: i=1; AJvYcCXUHzs2RdGEmx5IirGI8u36GwKdc3939/doSiBUCC1BYvQ34t8rYWe8jTozNotA0naLMFRSO3BwP7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTlwHabEi3C0v4OYX4B6DjnEtkWE4OAixxXXiPPTAMyonovT+1
	k2fsH0yDINNsTkOFRImicdo52n8tz5Pf0YlcSnGweMZosiEVqewnVHhQdrcRzCo=
X-Google-Smtp-Source: AGHT+IE/hxSbHJa0ey/qUAU4qMZr2Egy89hZiorh32Md7TMXE2itSwqfJ21BnW0A2NKOMSU/XYMAJQ==
X-Received: by 2002:a05:6a20:c78e:b0:1c0:e49a:6900 with SMTP id adf61e73a8af0-1cce0fea52bmr4390650637.7.1724980281696;
        Thu, 29 Aug 2024 18:11:21 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e8f72sm4900654a91.20.2024.08.29.18.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:11:21 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:11:17 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/4] mm: Add hint and mmap_flags to struct
 vm_unmapped_area_info
Message-ID: <ZtEcNfNMfNTzkHEF@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-2-638a28d9eae0@rivosinc.com>
 <0454187e-3e01-4af7-b193-07468ffa8934@lucifer.local>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0454187e-3e01-4af7-b193-07468ffa8934@lucifer.local>

On Thu, Aug 29, 2024 at 09:48:44AM +0100, Lorenzo Stoakes wrote:
> On Thu, Aug 29, 2024 at 12:15:59AM GMT, Charlie Jenkins wrote:
> 
> [snip]
> 
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index d0dfc85b209b..34ba0db23678 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1796,6 +1796,9 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
> >  	struct vm_unmapped_area_info info = {};
> >  	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
> >
> > +	info.hint = addr;
> > +	info.mmap_flags = flags;
> > +
> >  	if (len > mmap_end - mmap_min_addr)
> >  		return -ENOMEM;
> >
> > @@ -1841,6 +1844,9 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
> >  	struct vm_unmapped_area_info info = {};
> >  	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
> >
> > +	info.hint = addr;
> > +	info.mmap_flags = flags;
> > +
> >  	/* requested length too big for entire address space */
> >  	if (len > mmap_end - mmap_min_addr)
> >  		return -ENOMEM;
> >
> 
> These line numbers suggest you're working against Linus's tree, mm/mmap.c
> has changed a lot recently, so to avoid conflicts please base your changes
> on mm-unstable in Andrew's tree (if looking to go through that) or at least
> -next.

I will make sure that I base off of mm-unstable for future revisions.

- Charlie

> 
> > --
> > 2.45.0
> >
