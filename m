Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64316EC19
	for <loongarch@lists.linux.dev>; Wed,  4 Sep 2024 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725490570; cv=none; b=ZtsgyQboB7iZcyCvB0nS90JFUCHkXNLhb9WHghCdOF9T8lcAhhzARys3c1gzviluu8JW4xuCWJ4FIDQT8SrAyn932vpVagNorWzy9KFV85s8ABfcQs6rbfQAFVv9ngnJHGLj3m58lFP5m9Kb5DSVHytoBMUhVtF6LZyIyAxPk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725490570; c=relaxed/simple;
	bh=szdO1vb9faSGYA2Jc6crUSmefcYSz1qzFB4PGRjDfLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ri9d8Iyd6MI/lxU7TOBP7eRZUJUYjeO/AUHE2Z0QfGOlxkPHmDLROCXO9ePZ2CT1HbAg2t5pF0fh/KvYzRWTh/d0zqOR1G7nTTPU6mjnmffJcGylj7tzW9mgCu/flJj1Z6sy8SbaV6zhXNbwvLCd8Lp1BmOwqAS/1hjxnWvGk2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=E8sxc72D; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="E8sxc72D"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-714269f312fso10453b3a.3
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 15:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725490568; x=1726095368; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35/vvYnjYcTahPnX2Ak6JC2o1aEV4aWjtE37kGrVzrs=;
        b=E8sxc72DkHRxO06C+Z7v7Nqg3rOB2f0x+NrP6o5p8JaRDmbicS9WXQZfV5kvDJTB/f
         1Vx5Sp9JThQTJSbK79hFD3hzX9QYGHWmwqNgQk5JePsvne46ZGOnlaD6Lx7N7AmZm0wo
         qzbInhTAM/haKhvB0DvG2IpjhyqstgaBLO10ospefI7Za1EakcXourTJVGsxIwAXjR1j
         r7RgVTEtFu1y07V14NlCFDdrarOJTwyfvFJbKI0/OlFAB217Lu6HT5mjDsVLpaxZR3XU
         R4YwGeZWhV4YnXKEx9M7MduUQhBAnPhhIffU/UHRnOc65/HGELIcFuBMWRJ669tCtIdC
         zx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490568; x=1726095368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35/vvYnjYcTahPnX2Ak6JC2o1aEV4aWjtE37kGrVzrs=;
        b=MzfFUmdCBSHHnhZzVWdWib2tEGOdHTwMdpMXMjG+oDWJWMno9msFIxmX/KPawpngGV
         OGjZ1Jm9iJrpCySOiKeuS9xOzQ7jJlBCCmYx7uK+3XKmiPcYoD/XxeV0HC03gcDafpba
         6BhOzgjqXt6XR4nxmSMTJVvSdphKMj7da/7uec1iQYSl6MSPLs874Wc5wzp8LLfjTSCQ
         Iq0E/AG0If/3HHsoGail8fh6UqtoQp7sPXjqC4e7rYgVaAlf2gQiYb30Qdhqv+9kdWux
         w/zHPTNhIDcqvEnb1HUVRTRXACogZvQuwsAx67ybQzfQtOt8f9HTFKC6HkqjnKOBEfyY
         A1bw==
X-Forwarded-Encrypted: i=1; AJvYcCWfwB5Bqvx0pdHVoaqHR22/R9/qsA7AEgKkCUz7NjYCCchwQJl+hHJ23xKmgDAGVBk5/ngmgNyGHmw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5FZhj+rYaroU/huuDAhAVu0q7FAQOKy/F0EJ8HmDWYy8I8+fT
	zYs/2F6n52/2918P/xtHpo2V7yRr1dlHkifHBLhpxhnK6doNseZkuu54gG5bO9Q=
X-Google-Smtp-Source: AGHT+IGJMJTzWYcjGTZbRrQ6IDaoYzbHR/wGLI0wH+MKCl8eX8iKTnn29gVdjQTwsOFAi2AC/JBGeg==
X-Received: by 2002:a17:902:f545:b0:206:b618:1d8f with SMTP id d9443c01a7336-206b6182580mr23287495ad.11.1725490567622;
        Wed, 04 Sep 2024 15:56:07 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::4:761e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae9525cbsm18305395ad.99.2024.09.04.15.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:56:07 -0700 (PDT)
Date: Wed, 4 Sep 2024 15:56:04 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Benjamin Gray <bgray@linux.ibm.com>,
	"Christopher M. Riedl" <cmr@bluescreens.de>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 2/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtjlhFbeFZtxzmTb@telecaster.dhcp.thefacebook.com>
References: <cover.1725223574.git.osandov@fb.com>
 <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
 <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>

On Wed, Sep 04, 2024 at 09:50:56AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: Omar Sandoval <osandov@fb.com>
> > 
> > I found that on x86, copy_to_kernel_nofault() still faults on addresses
> > outside of the kernel address range (including NULL):
> > 
> >    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
> >    # echo g > /proc/sysrq-trigger
> >    ...
> >    [15]kdb> mm 0 1234
> >    [   94.652476] BUG: kernel NULL pointer dereference, address: 0000000000000000
> ...
> > 
> > Note that copy_to_kernel_nofault() uses pagefault_disable(), but it
> > still faults. This is because with Supervisor Mode Access Prevention
> > (SMAP) enabled, do_user_addr_fault() Oopses on a fault for a user
> > address from kernel space _before_ checking faulthandler_disabled().
> > 
> > copy_from_kernel_nofault() avoids this by checking that the address is
> > in the kernel before doing the actual memory access. Do the same in
> > copy_to_kernel_nofault() so that we get an error as expected:
> > 
> >    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
> >    # echo g > /proc/sysrq-trigger
> >    ...
> >    [17]kdb> mm 0 1234
> >    kdb_putarea_size: Bad address 0x0
> >    diag: -21: Invalid address
> > 
> > Signed-off-by: Omar Sandoval <osandov@fb.com>
> > ---
> >   mm/maccess.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/mm/maccess.c b/mm/maccess.c
> > index 72e9c03ea37f..d67dee51a1cc 100644
> > --- a/mm/maccess.c
> > +++ b/mm/maccess.c
> > @@ -61,6 +61,9 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
> >          if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
> >                  align = (unsigned long)dst | (unsigned long)src;
> > 
> > +       if (!copy_kernel_nofault_allowed(dst, size))
> > +               return -ERANGE;
> > +
> >          pagefault_disable();
> >          if (!(align & 7))
> >                  copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
> > --
> > 2.46.0
> > 
> 
> This patch leads to the following errors on ppc64le_defconfig:
> 
> [    2.423930][    T1] Running code patching self-tests ...
> [    2.428912][    T1] code-patching: test failed at line 395
> [    2.429085][    T1] code-patching: test failed at line 398
> [    2.429561][    T1] code-patching: test failed at line 432
> [    2.429679][    T1] code-patching: test failed at line 435
> 
> This seems to be linked to commit c28c15b6d28a ("powerpc/code-patching: Use
> temporary mm for Radix MMU"), copy_from_kernel_nofault_allowed() returns
> false for the patching area.

Thanks for testing. This patch isn't worth the trouble, so we can drop
it.

Thanks,
Omar
