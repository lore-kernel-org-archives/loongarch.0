Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41D1DB363
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737757428; cv=none; b=EoMeTqSfze+bsA9Cx8Y8PB9UGsY+85CEhs2aqA2w3ID89JbP/JfeysCBU/WCX/g9SZuP2Bf08sqc8uhjojso/aXmLkqx6vreieB+vKV1s0XzkxPL6L3oPlKTdibZEQF9Qt7hSxqvqUGHVvRqH79a1J5+yHBrXYOazPWlcVkLryo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737757428; c=relaxed/simple;
	bh=f5l5Gcfji1kBekt/GS3Rw8oXMmaDJe2PbxrZjSTQhRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVHVMC86k1+aXS9UgU4XrNQ76/3Hnmq33ex/l34WoKdI8sLF1W0V2DiRy0L57hcqtB95z8LSEVgIkoE+w1JXvwDC5bSBm4zg2a0qNg3TrHQjky+NZHJlNkk/w6vtSNTxg/vPfV/7bPx4KWqrTngFTGeXRdg7S3eJjF+bA6hUb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rjYke8wl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rjYke8wl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21619108a6bso45323745ad.3
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 14:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757426; x=1738362226; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUv+RaNlBSnMfG9KxmG6AfxJdG5ylIteL5qAdF6dzeg=;
        b=rjYke8wlVD6g0xy5LR2kTbThklbMmnGDB09KfW0YKMyL/mrZKv+vDrg+Kl7B2Ct3Oo
         gM/a2X1TXDvd+01xIfBBtlKKNwOAvODq7NpbgxOXt+YMMHP2RBUa2ttnmEjQEoAxpQPn
         H32LcKl2ZBfkx+dfnWnLgMf6aSIxts7lytbjO3V6EXTA0yl+9rUiAhjfY03keY+Bkq7a
         qIkhBnCclHFbubRFIFN83GzvH6bK14oMN4JBqtDxVyMWsXLpof7VwEHmcYofOSzpg6RE
         3iTCI5yp1705mOr0VyOgEkLgRLlkLt3QLowtBAThuwef5BvtDDlUoB45EbEpPZRR8+kf
         LG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757426; x=1738362226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUv+RaNlBSnMfG9KxmG6AfxJdG5ylIteL5qAdF6dzeg=;
        b=IjepoQ2F5VXFZO4CBVmiKetNbmPnfpA4Co9hpxiFO7mhMtN+bC8V32+DTqX1c+y+MP
         Wnp6GAh6yCRUywd1YxWghFAXAKRhygdxi8IC263y5o/Qt3voCklXx1SylP07PDQGnid0
         K5mgGip/VmHgSRMrRpaC4MGunoaWzOkYjeFw9A7hGgHhQ61vpLpWjBcubsqrwulHeqVT
         FRcgBSAH6QRSqF8KKutxltMp1zCkp7pSjMIwbBZWsWD849A+E36qPF7ke5dwVgV1aA55
         ZrwXYt+8PTNnMpgK5oNs2unCLdG5vyljkEN7DDBe8IlqlJZPgAzGH59DpFqzSXJto+rh
         +Fyw==
X-Forwarded-Encrypted: i=1; AJvYcCV8u5FpTOUU6qloRWWMtfJT42DokXQXDMDfoF0PLLxNhviUrZLdvyxXBnO3hMVjlnu2UuoT+bmrJo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPNFiWKRgmPqJvOYw3I4bUPnPGPj3mVnCpk8hxdxW+Oa0Ze+4L
	9bcHGEisItu+Yz9DyrXnVCJmDW50QKJ0OaU1MEl8tyjIJGdIhLDfPSyb2Oo7vHY=
X-Gm-Gg: ASbGncuLxcLOtpSvPsLQMdDwZwpb9Fy7ySIFkos7rSj/R59gDT1MubnDsPUjT/dbB4B
	ObD9RwimweDC/mEaMWSp3qqw9xCkjuKTsYg+o293lPYQ6iHpGiYADdcmMyBB0zjCF9WplQqiIkE
	r86pndfVVErNuOKIKdf8pw+yjQoKpSdejuIHmGeIsqEcgb0ql6QccHAVW15aYMDVNJ/qAiwW/Gd
	yTcVSXofhp7A7KixbcuWLe3aYSsDPTOAVGKDrZwn1/SP8hX2JR6KxOWnsja1wvOy7grmIg=
X-Google-Smtp-Source: AGHT+IGSiDeyaor3Xyykrpa+3fW1EiHgGhOjTWTXaUtdnDW0jN1fxxyzeFLtuFtvlggZGKCMyzKnSQ==
X-Received: by 2002:a05:6a00:92a0:b0:729:9f1:69bc with SMTP id d2e1a72fcca58-72dafa410aemr45756556b3a.12.1737757425781;
        Fri, 24 Jan 2025 14:23:45 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c560sm2492231b3a.142.2025.01.24.14.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:23:45 -0800 (PST)
Date: Fri, 24 Jan 2025 14:23:42 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2 3/4] loongarch: entry: Migrate ret_from_fork() to C
Message-ID: <Z5QS7iQroTpt5kpr@ghost>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-3-7c259492d508@rivosinc.com>
 <CAAhV-H7RSn2ek5CeLnohTcrh=0unDNmaLDq+yDH2oqshoeRMNQ@mail.gmail.com>
 <Z5Pb4jsO_qH6Wrx7@ghost>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5Pb4jsO_qH6Wrx7@ghost>

On Fri, Jan 24, 2025 at 10:28:50AM -0800, Charlie Jenkins wrote:
> On Fri, Jan 24, 2025 at 05:05:21PM +0800, Huacai Chen wrote:
> > Hi, Charlie,
> > 
> > On Fri, Jan 24, 2025 at 3:15 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > >
> > > Loongarch is the only architecture that calls
> > We usually use "LoongArch" instead of "loongarch" or "Loongarch".
> > 
> > > syscall_exit_to_user_mode() from asm. Move the call into C so that this
> > > function can be inlined across all architectures.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/loongarch/include/asm/asm-prototypes.h |  5 +++++
> > >  arch/loongarch/include/asm/switch_to.h      |  8 +++++++
> > >  arch/loongarch/kernel/entry.S               | 22 +++++++++----------
> > >  arch/loongarch/kernel/process.c             | 34 ++++++++++++++++++++++++-----
> > >  4 files changed, 51 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
> > > index 51f224bcfc654228ae423e9a066b25b35102a5b9..0195d4309fd29f94664d5f34247198c769033b1b 100644
> > > --- a/arch/loongarch/include/asm/asm-prototypes.h
> > > +++ b/arch/loongarch/include/asm/asm-prototypes.h
> > > @@ -12,3 +12,8 @@ __int128_t __ashlti3(__int128_t a, int b);
> > >  __int128_t __ashrti3(__int128_t a, int b);
> > >  __int128_t __lshrti3(__int128_t a, int b);
> > >  #endif
> > > +
> > > +asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
> > > +                                                                   struct pt_regs *regs,
> > > +                                                                   int (*fn)(void *),
> > > +                                                                   void *fn_arg);
> > It is a little strange that we only need to declare
> > ret_from_kernel_thread() but not ret_from_fork().
> 
> Just an oversight by me, thank you for pointing that out.

Oh I see what I did, I meant to put these functions in asm-prototypes
and not in switch_to but I ended up putting them in both.

- Charlie

