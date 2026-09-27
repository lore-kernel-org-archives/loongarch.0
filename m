Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91D346E70
	for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492551; cv=none; b=s/78pTRQCpKDnfK9ND+SirJ71brMvDz2k74KGn2It8l5qu9VfCJ0qoT1qxQZfX2JC527n/yMEpC0NPcVwqwsTSguerF3OaHHp6Zqb4UmbYKOZMxvfABsv8Ia9GnIbKej0q2SrQDLBcmnPKz1ZaamR7/MSRKL3V5YDyeg0XtDLSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492551; c=relaxed/simple;
	bh=EZBGaGu7g268yBeLa/NPbPJzutiCHGfKPegWoTP0nS0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BFppAxpwezyQdSjLSv5vbSN9C+Pll1dLcDNwAi1tmLljzgMwFgn+Rrhr0Na00kyteTRX7r76vaZxfjDhk0rqGyPv4AWzHNQHvkthY8tzn5dI6GhhWWBneL+PHfz0YKBvyrNuPmBdf/LdEXSDhk2CxjLcPKMOCK3LyerPyO5EjcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWa0p1IB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWa0p1IB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso2810345e9.1
        for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790492548; x=1791097348; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJKp/brBpZ8U6kwJIcmM4FiZnVhsdc/GYabd2hj9ep0=;
        b=WWa0p1IBpsYvMUp2t3MJWkxTMRY502jafJNs7MeoO6lvUTQ2h3OSQT1RNB/4IoDPXP
         jFReuKsDhmeF0Be9ugbVPMTWG0Ap0uNaoJFlOGSeqYNMR9Z/f9CGYHWXGPHYpDBhIUcs
         62DoglyvjvgSr6x4vSC6A//r9KxquVVJAdFPy4RlUKhZ4JFeSvEV5odvk/RL0gRN92J1
         BLNtEYNQlSP2nK4ISdLEKQnVbaoCdKxgRSc+dP7lCqail0fvO2yNHuaV3xivEFaDeUFo
         cxhli/5otNr92pK5XNnM2ELzwo6/DhmHC0xSYydT6uYd4LBMLpROqSwrVcA4C9mJTA9e
         bDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492548; x=1791097348;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJKp/brBpZ8U6kwJIcmM4FiZnVhsdc/GYabd2hj9ep0=;
        b=aiYySyEjNsgbdXQp82g4alel1kyUuLkugvYS5knf2VJ0k9Fx6qbE5Rp4oKih6q+5y9
         zYWOSkvXI1V1FnvHASRrR14x2J7nM7yqvqFSbrjC6BJCu7XdnclEv85QuIVba47SZj8D
         2y5/kC05CLcKKEeSK/lH7RA97DrKoD1pBZtZATV3QQ9ZVQdPXAXyDFBYJUAw+XZKSpxR
         pHJAzIbZLWLLqEgGlmNmdiBxZwzniRkU7JotAh6vprgzsfxYi0wumwCe0a4oebENVC90
         uJWuPLluWMAksHumocwa+pPpdKM0AVo3BcjAGUUWwDFB53fS2YbhWzxM8EO3rwHzu+R6
         25FQ==
X-Forwarded-Encrypted: i=1; AKwUvByEeQz4sg5JmUb8cnwLkbOh/lc3U64ZqAW4B8woveJRHeSiitRcy0ywgqBKsm1TICh4Ru93V2e6AK8=@lists.linux.dev
X-Gm-Message-State: AFuF++ke0+L7+OCCmRiyUvHeHrN+uwDi7RE5rB/sPsw9rv7bfLQUsJD5
	C89bAyiWD5F8RA/LhtgeNo/h4NhDXVq5mQBm7YkdBLy7eUwhI6QMSaU7
X-Gm-Gg: AYBFou27rG/beCtPqgx4ZMXPr4vK+4raKRc+Js7t9nY3idCx+THKmBudhk6CBd9XQnw
	+lY+TXdcMJMESntMxNUkeGC+7PJQsojIZ4LoQo6iJENdL6zYRn43EjiogIaUXZteB5UKp2v99tU
	wx2T0ivPG+m2IWEo9+xrB62lpM3NE6xiwHTc8/sAeaQpYKepZJArsp3lCw434zcWMLmkjy4QhK7
	GMuSH94wEBdnncu+mRNnN86jhRW/0RqYfKFWCJJL/sPK4RYL2JAa2CRShGOmH7p9TvuO2/I5b9p
	Fe2Nfwt7P0NQCCpP6nR+S+Pbj4NC+PPNHP/fZ6eziiYaZR+TaXPZ21I8UWCxCLJsD8jqEPD4iuD
	3ugmauXlvSNzFSlrYZDKL26mGy3USMYzmbLO2EbTtePddt1RMo05w7n/8rwdy5v/uGDiZSEnvRg
	Tip5G2bUia/flC4xjkT325X3ZqH2pBXRxjkxbByWPLUebdhfK4KfRDr4SsVmuv4FAw4MoV0Ei2A
	AraoABGRW+WpZhx2hijMWOHMUSKVXK4TWkX
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr175447355e9.3.1790492548064;
        Sun, 27 Sep 2026 00:02:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f0e79sm57015315e9.7.2026.09.27.00.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:02:27 -0700 (PDT)
Date: Sun, 27 Sep 2026 08:02:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260927080225.37534e7c@pumpkin>
In-Reply-To: <are7cfMIHZZn6jLz@zx2c4.com>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Sep 2026 14:32:49 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Sat, Sep 26, 2026 at 01:19:27PM +0100, Nathan Chancellor wrote:
> > On Sat, Sep 26, 2026 at 11:39:43AM +0200, Andreas Schwab wrote:  
> > > On Sep 25 2026, Nathan Chancellor wrote:
> > >   
> > > > +#if __has_builtin(__builtin_memset_inline)
> > > > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
> > > > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > > > +#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
> > > > +#else
> > > > +static inline void *memset_inline(void *dst, int value, size_t size)
> > > > +{
> > > > +	char *d = dst;
> > > > +
> > > > +	while (size--)
> > > > +		*d++ = value;
> > > > +
> > > > +	return d;
> > > > +}
> > > > +#endif
> > > > +  
> > > 
> > > memset actually returns the original pointer, not the incremented one.
> > > Nothing uses the return value of memset_inline here, but it is
> > > confusing.  
> > 
> > Whoops, good catch, I guess my fingers gave up on those last two
> > characters :) I will fix this for v3 once there has been some time for
> > further review.  
> 
> Do we even need to return a value at all? Might as well just make the
> function two lines:
> 
> +       for (char *d = dst; size--;)
> +               *d++ = value;

Wouldn't it be better to add a barrier() or similar in there to
stop the compiler playing unwanted games>

David

> 
> (Technically that could even be one, but maybe that sort of golf loses
> clarity. Your choice.)
> 

