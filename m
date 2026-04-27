Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453AA36D517
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327190; cv=none; b=gFfJz45bkVurQ6quGDuCtdJqKxNw9eyLB5ubu9IlI8U6/ZZkaUTMGEKe8jaI8yCfOf9SqbIHQZx1sMtpXGfbPY7bSm0fxo2u32bwYBvclIMc4c7mmLJd/NbmWJ/jWwcmD913Lhiv1BAlUlDIotWlv32Kb8M2CAfstd1fawry6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327190; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0gaXUvPrDxK34D75Y9UEk+UZRS9kZ2dyPMyBk12775iF3bp+0vxJ9NSNJynVPBB55ZqYdLaRTFDfpAmRjgJ4VEZYnJZU8PJRFGEi0LY9d6Jf8RImJdS/hGiPhKlHCnmm8MVKdEaxp0z7YFByEATMNQiS8CT0u/KVY3c6LZNWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cnY/fAi4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cnY/fAi4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1770892066b.2
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327187; x=1777931987; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=cnY/fAi4XpiWKISR+3jVgcw30U55BXo9ZXr2wgJNaTjM0tmSNmIB5ik0dVbYRrqTtI
         wkj+EmLX50/IsNWWGzgRU30YGoduWkBF5N8bQ8bS0uNgaxOL+VNpERtjaWNReax7Q1KZ
         XKkLj2uab0bbuY77AELb+mQrLwaQSplFxuP58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327187; x=1777931987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=pM9DmSZjsfZeSB+ytVya7r1WsJzi5y50Gfpu0GUJS272z7XPBMBC60j/NChn0TMT7o
         A+PlqXEEkWteGqUUhaFzH2CFdzXUJDWKOdrYQYczXA6FL/WU+zd5XAerUK1E6zddCwSH
         M6TTcr7gX6bJM4DdkZBZTyOCTmTq7o+l/G9f5X6MGHkBZQrAtQO9TmG5hmbs+Dl/tSDI
         HdKpQGstuexk9679mLsPteq9kO9U3LOJvhyDFn573vOSU0jr2xf33mX7kKHPD5+pyo5T
         sbkRdppBNuv8WWoOv5nqq6+Z/L7IoE/z4GXb7BKPzdlkzalSuRuyrsdWmi5XTCT27/WS
         eyRg==
X-Forwarded-Encrypted: i=1; AFNElJ+MMLqkxuEcLK6oNKaYt40W5Noz1crFNDgDWRwlYDoMa2fkdqsWSdkxbth7U6M4ZZ/+2bKuoJoS5xo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQjuoF5ANtasUhSfbzc7sVbuG5a0zGxHlxR6RR2a98NUmag5jQ
	1Iw7+5FTUl7DdI/VduISZECVQrZFDPOpqzsOkGlMP+EJFm1Nd3vH/HTl4pYlA06xIJWeRfGLqbm
	mEmz7XUyWmw==
X-Gm-Gg: AeBDieu1fAyiRtM24YyaAzjNSAJcQSeU1chf7FD3rXcHlZp1E3cGLpOySyHktImGFoL
	6auMWZuQJdjbmcFn/XbgRTRCmG53Gsn6+sobjzdL8xPQe2Bk1GXUQYv8W1XlGjGu1AC5rySsXN0
	j2JOo+BrGyLZ2YQTk/2JUsWEtMWb5rgWoW6sqn9Oyc43DfWq++6F+zQ1DsqiEWbrWjfdhILTijF
	2sbpb+gH4eI2jzcj1ADmUMQ572LY57vEMYNDyDfthgQ6ucavDG/N2HJRHcahFn+LIuuv7TSrZMD
	qpn5HCXJqqXjZ/yiliXj3yHle+65stDiuW8lcunB2NbpHkriFBER+pXinEpTpUKf+GIFqDIfoW6
	LVrcuzJBadZVwxDWeDrZCy5I+6yhEYKa1SbDUFm3FWA11DdjYrhljx2XKlyFwXL9DJWvoWTEACp
	wq3x9Prec5x2nNjCS6GPkPj+m6YVA6zmbifguZ/0yQ16mmnvOokGQkAZ94W/g4ELtYhGfUyt2Yh
	2GIvY6s5ao1vM0JOVhepQ==
X-Received: by 2002:a17:907:74c:b0:ba8:9137:da5f with SMTP id a640c23a62f3a-bb80377b922mr29665866b.32.1777327187477;
        Mon, 27 Apr 2026 14:59:47 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c081c40sm10415066b.55.2026.04.27.14.59.47
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:59:47 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so9400109a12.2
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 14:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/G4rzKFck+XZrCRA+9yfNAgiQlV7B1ozjQH3M4MbHFZdk+ZqxUKikmfnDZ3hzPniNLmQVFQuNgOY=@lists.linux.dev
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
