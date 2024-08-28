Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA601ABEC7
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876137; cv=none; b=BxRVANSgcGvcqlJRRPmHbtlQOFN72IETVqNZ4lhqsL9NhJUwAhHUEShJea4T1a2tULhwcRbu1mSVG5wAqn+ujvmsBzinA3O3PvGpI7C0UBMB/UYJ980jvYGb10UP9ZrZIKkKTWcsMmr/sBeVUnQjenngK2Jqsx4z9mmTQ8cEV3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876137; c=relaxed/simple;
	bh=bYt3NNBaLSmLKZlvbIxmegVun2i4HAdZ1sNs8730jNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fo6BK+pr7Nv3PmB1DK0QmnwSyovlkWsHszBg4japA0tMCLz662zsa8GFc3R4nDX+8myFdHYcvynE3DoUSYy8hG2RumNDvcSUWSCXpsYgSvzEYNgN2Z4GC37Kwu0/BJp0Z+7UxVlvI2gGjSxVRFM8Fx48jVs/gXb57Gg0LGh3290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aFJ6f2x5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aFJ6f2x5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-715c160e231so2282804b3a.0
        for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724876135; x=1725480935; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=aFJ6f2x5aVR3mDvmcSgWJ9xZ1ZXN0OdoDSl7+lAjif5Mxx3cGfQWaqXzTeEVYbhXJe
         es+cMxcdy0ewfmf70I/ZGiRClu4iGyPkv4bpM29AXZxKPeUDjrbFixYjNo1fTOaRgKSK
         m5Ts+RsGYSOSokwqVZSEBdRF4vl+EoAzVWFTZX/bAxUjvqgcqOEHWFBZX9FyTSUUi7jk
         uYqbervEv+X5lhFIHm52KYoITu4HBVHCrY/6Kov0R4EiEGZ5p6drNxGedQqcZC6NAGTo
         5XVAqC6oo/a0xd4xJ1AKjZY7H7dHAwoUamwPDNea2y8kHaw8oPseLBY8UpwIfiYY09gC
         f7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876135; x=1725480935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=qQFvx4m72waYJ50PkLF0tubfsKWVoMO1HAjfpZVRmWaHyzQ+6AXgXScbF9DYgxQ8LC
         0W8b3Ypo8izoWn0aeIDIw05Kvlv+lw6XVVNsN4MCFMN2L7RuM7ZGCaiAIjKvAcVrpMa8
         xuxndpRTgmmWlZYvk6VwYARdsgXKoRMTLYzsoDJNFaRMyBp63xoEmFsCe80dPSmoJwrZ
         T8076ylacZPlmxpdnBXhyRZXMnU1QaoYLRmQpk0sbQqI7LSlgTw33ptec/w6xe1wYwh4
         RCHoOAtN9jP7ST+GN/HErQUAUtvY0UMDqnt50i7JrJDNtX41sKd9s39dB1/NXdC4l2ZH
         63tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRrDrA6Rwy0GSbR2GYhIF2c33pQGeHBjau9fETIQde8NQj28VUR/4YohOTaFWykFwTRT27dZ4cgKQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDmL/hiueTur3dyEqHZG+q9j/vqDKzHGg/P7vYSnAAHGw75KvC
	6uqEZAMvpulrVj/osKv32n1OUcBJK7871yywL3/5V8hUbCyLy5oglvatB/8KiKo=
X-Google-Smtp-Source: AGHT+IHnVszzxRV7qQ07aFqnxjDB7ZJDRj+3FpzGhCxnl0U0Ndnw3gA3qfk5sipB0cB/w/7yeJxxIA==
X-Received: by 2002:aa7:88cf:0:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-715dfc042a7mr734410b3a.13.1724876134994;
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343097fasm10850305b3a.173.2024.08.28.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Date: Wed, 28 Aug 2024 13:15:29 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
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
	Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 00/16] mm: Introduce MAP_BELOW_HINT
Message-ID: <Zs+FYbII0ewwdisg@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>

On Wed, Aug 28, 2024 at 11:29:56AM -0700, Dave Hansen wrote:
> On 8/27/24 22:49, Charlie Jenkins wrote:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the maximum address space,
> > unless the hint address is greater than this value.
> 
> Which applications are these, btw?

Java and Go require this feature. These applications store flags that
represent the type of data a pointer holds in the upper bits of the
pointer itself.

> 
> Is this the same crowd as the folks who are using the address tagging
> features like X86_FEATURE_LAM?

Yes it is. LAM helps to mask the bits out on x86, and this feature could
be used to ensure that mmap() doesn't return an address with bits that
would be masked out. I chose not to tie this feature to x86 LAM which
only has masking boundaries at 57 and 48 bits to allow it to be
independent of architecture specific address masking.

> 
> Even if they are different, I also wonder if a per-mmap() thing
> MAP_BELOW_HINT is really what we want.  Or should the applications
> you're trying to service here use a similar mechanism to how LAM affects
> the *whole* address space as opposed to an individual mmap().

LAM is required to be enabled for entire address spaces because the
hardware needs to be configured to mask out the bits. It is not possible
to influence the granularity of LAM in the current implementation.
However mmap() does not require any of this hardware configuration so it
is possible to have finer granularity.

A way to restrict mmap() to return LAM compliant addresses in an entire
address space also doesn't have to be mutually exclusive with this flag.
This flag allows for the greatest degree of control from applications.
I don't believe there is additionally performance saving that could be
achieved by having this be on a per address space basis.

Link: https://cdrdv2.intel.com/v1/dl/getContent/671368 [1]

- Charlie

