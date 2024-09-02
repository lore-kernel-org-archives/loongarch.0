Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499F77F11
	for <loongarch@lists.linux.dev>; Mon,  2 Sep 2024 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258672; cv=none; b=tLNqvTWSQ9U3ERbGJ3CjmbkgQOD1GLPA+0EPab15OrrFdH1fN3SHIBe+DNamnk4eAuyb+aKNfrgEjoI9nsMRfd2w2tLqCyKf8LgDxapQhTUAIMmIQxtQIjoePK78c4s0WdeaH8nRL9HL5OV4ZyaBa/b1IaitupfgxFRAGguQMQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258672; c=relaxed/simple;
	bh=JuHfumbqqtpZO4ur+H2jL6VJJGoY85aQfr882uJKUFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kThlnCwPy/QhOiVea/pRJQhHyZGLnRZvTo0shHcEdOJ8j7PZNb7AvvuLDcKqhe/zAzo1EDCnLy47ZswFKmDp+deyWVzQcDJn7z8FVI7g/XMN/A0b9gXpGJ3Yw/josZHr3uQG82aU7JBDZFv4VA6SN3LISx2A2jTE5cx3qehOXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=uPEIPb3b; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="uPEIPb3b"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-715e8d7b998so143192b3a.3
        for <loongarch@lists.linux.dev>; Sun, 01 Sep 2024 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725258670; x=1725863470; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QRHpO2u5pbpxFjPI4wQ+JqY+Z37bYljgBG+DFxhCvw=;
        b=uPEIPb3bROp2kCU75ahUS5FkIfJg3LyKtPDOuCz0aHxAyTCv9AtgPnptYGnY5iRB2K
         PDcMxBDC5oDSCLNHkU8hlmpG8bx3bgz0bekvsdVu2OV6gvgGML++M4sqfYnvGCec3gMs
         J1wpUdHwm83QGFUlSHr8oh40UKerI7mc9WPfO5Jxfv63VheT2kuEEdyaqNpAT07jR4++
         14m98BbLPTV1FVN6RRgWdBOFuVY4wjZPYpo7HA94hu/M53sAaorpuKbx4EnyXbQullCS
         AysgFPocJff54YsAAgITqS5bMMD5vjoQhsH5Qpt3o3ncVeAA1aP0rvI5hW2KtDYkyPlE
         SORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258670; x=1725863470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QRHpO2u5pbpxFjPI4wQ+JqY+Z37bYljgBG+DFxhCvw=;
        b=S70vNO3u50kE2OXM18p+9qQW5Mj9ShJ9fwaaZEYxpsxZKfSi+/we8fUrO70pX9ZyJr
         gsMDEpLSf2IKA+qRUxsy0WGe8Nv6nMumVhhDDQtkLf2V33f4j8xajszYmKBCgODBFaFp
         LP0xj7BoJ1dj2RYhd/HbhHQYl1lH4kFxWmVRiFqkTxpxzLg2ZEw30GA6bCpD9AoF7qkZ
         dlvrWYYB37QrsMRGCeCNdunqUcfAsd95kunYVi0yhE+d8NYURv9NqsfHdnFlRa9j98Qi
         0XvzTLkPzwjaM3/6tQaW3jFTMTsy+Eog5B3cxw4D+4uoHmAZx9jvjn7mJq0v6IdMGlFn
         YDCA==
X-Forwarded-Encrypted: i=1; AJvYcCW7tMb+0ob4ZBnwOy3/QI9hwS9fdXPmNtQgznp5iy4maE5fpqL2CA9CNv7QJ5EZR/F0ufuvhtp9QYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQYs3fBrVsiL/Sd4GulXCv488nvjFFQNVaewGzfwl1OF3VJjyy
	SfNdTdLyMh3zhRpBMwVA+VcLDN4ujPOJmfmmlrBKfW+32c1NzACg9U5FbesFRhs=
X-Google-Smtp-Source: AGHT+IEamVmuc71sTYPdHjFxuF/z2Kir18akAJnclZjSyzrG4uveb/oGnmnZ8wSmLeO97ZW2P5fb1A==
X-Received: by 2002:a17:902:da86:b0:1fb:1ae6:6aa7 with SMTP id d9443c01a7336-2052750795amr58817315ad.3.1725258670426;
        Sun, 01 Sep 2024 23:31:10 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542350sm59747515ad.213.2024.09.01.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:31:09 -0700 (PDT)
Date: Sun, 1 Sep 2024 23:31:08 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtVbrM4rQsGFJo_t@telecaster>
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>

On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
> 
> 
> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: Omar Sandoval <osandov@fb.com>
> > 
> > Hi,
> > 
> > I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> > destination address is in userspace and x86 Supervisor Mode Access
> > Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> > renames a helper function so that its use in patch 2 makes more sense.
> > If the rename is too intrusive, I can drop it.
> 
> The name of the function is "copy_to_kernel". If the destination is a user
> address, it is not a copy to kernel but a copy to user and you already have
> the function copy_to_user() for that. copy_to_user() properly handles SMAP.

I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
arbitrary address, and I want it to return an error instead of crashing
if the address is not a valid kernel address. As far as I can tell, that
is the whole point of copy_to_kernel_nofault().

Thanks,
Omar
