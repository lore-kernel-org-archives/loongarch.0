Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E828292B5C
	for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825953; cv=none; b=LShXIVK29ecQLgcKsSSLD6tKjv+Op4EanRy+F4n5cmjgH8R6qwumNdLitc5crVBX9fzJ0HbP1ilCIUQBaqIqRlgRFtZt4PrbMsjdOaBfAzE+EYkKH5RsPy5loirXdIawJY6Iwfo5vHHrxKBnJW0Zoyai9PH96EyjFu08dW/4Cac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825953; c=relaxed/simple;
	bh=ICkx4RQog4OKxJFuHNw5QWQDaxZatIGPBHQ0QRAHuic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqPkJfy4+ruPVKpuwEwnnmxkI0paNwGsbFAjiYy4m9oP5gFHFI3M6WCtsJkWcYKVtLA01nFmD/2PoKkEhPbuOE00ZDqujnSBSX1T3XSZ2HnjOlx/mm+f0wJ7py3SGdRDJGRgZacA6xWWAyknsyl5lAM/19yQYnCHVnAOG1W1w4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiGuFMQm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiGuFMQm"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b5931037eso13738651fa.2
        for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 01:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752825950; x=1753430750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE5OlSABnLgWhYl6SAq4PjOG8cGD+M3libfM2kaqTAg=;
        b=QiGuFMQmTr00kOO5080yLKa7X4sPwROFkuA3Tkg7wasnFuXTdmqDnX9/7Caej5XmAq
         rJK8kbmwbNzVDgwZTTU+mXuEeUTQDJIfeGpxKmKrgCnPYzVhLVbD6JupjNvT3aP5Pyax
         Em1x+3WoRSsJxsuXtgVv9l7xZdIhaRNW8TAJIc/HSaVeZvbixVuSgO6czq0MXjBmNLq6
         T7nMWPj4B0rlPChRSML2wU3vfWF62W4khToLG2TblnxvfJNDqMgWRmFmDsCkUsedBHB4
         2kaofcpHRQg46wBlLJcnE7FtihO8c+VGwsmvJTPCVOIka+Xe12cS9xgLzhHBgJ5/2FbC
         xSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825950; x=1753430750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE5OlSABnLgWhYl6SAq4PjOG8cGD+M3libfM2kaqTAg=;
        b=ICbYHcDeWMgMe/41vGohxCficVeGHRGlglEXyeE2+Mo9qEddUjVFAuSplqDPtXjCNU
         q+kxcmsYmMwWUX9HcL3Ym2F8VxovYvIxpUSOMSwSbNsknOJiUjKXaRJQSa3TuB3w+xOs
         DJzdOglN02wAuSKNya6xVASP0f1QKYLD7pNTlMC1RiYtE6r7c63Ev93lM5jetiC2ei15
         q+HymahZS0gm4eKzu6Oi58XUFdio1TVKykuKyGrizzaSnaJGvocisjj0HhtFsW3nj0SJ
         YrgxcEsndC4JrmvjFkzhcuvW6I1YKxrkbkXgu6HWrwxvPsDfv/A1BDN/GOn/35vD++Jm
         0KbA==
X-Forwarded-Encrypted: i=1; AJvYcCWbgeZMh6J4tbzDwmwpqnqTcVmBVwzYo2tpIogWzYCw+fObSYG8bHBj1GJCMZZSfqpWUvcTzRlwBgg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwcupeBtVIBE+FDHeO0dtZwBZizbHhlwD5M0I+rNjkz5wJ+7gO
	Qi+40mTKHTaDovXBE1TV/2e444BaolyR868ohn4Ob9KUdmYtx4hIht+V7+9hm0DWAUU0PaBLIpy
	zPggoq4+zq9YiXGUtca4Wf2ETKJhAQuk=
X-Gm-Gg: ASbGncs2sKF8Mkvx61/7W1N9qDxozJC+t1afCY/6nvgyH8kB1vBtDuwTjgRy3GKN6zv
	mskZz35f4bdVJ2Eiwg2RuN3GNPeJwO5yAyl8ajF7XaRgH9ZRPVW23Dus4L7BcXBnWzSH82BPUKT
	9WnEmjDa0R+xLwP6al9CKchJg9DJMlk82wxyq87DnxmECvBJnti8XyKEHE7K5Hw1/GqznZoPLtS
	Lc+T2M=
X-Google-Smtp-Source: AGHT+IHyLMKDBrDr7Srvy/Ikd0HaWMaoK7ylFo11Rc1uD9JBuJ8oBsq1gin5zNroA8IEeJqMbuI/vDPTs3/MNmSKtdw=
X-Received: by 2002:a2e:80d4:0:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3308e56e179mr28488571fa.32.1752825949700; Fri, 18 Jul 2025
 01:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <20250717142732.292822-2-snovitoll@gmail.com>
 <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
In-Reply-To: <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Fri, 18 Jul 2025 13:05:32 +0500
X-Gm-Features: Ac12FXz9YqNA1eFVik-g2DCaFm9kQISkxpcsj01QS2Zo6EkvjPY09aiUDIQMxqs
Message-ID: <CACzwLxgyd9yd3ah=LK93Bn7SwAy7H1Hhi=ncFzZYUs+6YGEqvg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN option
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, ryabinin.a.a@gmail.com, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org, 
	Peter Zijlstra <peterz@infradead.org>, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 3:10=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 17 Jul 2025 19:27:21 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.=
com> wrote:
>
> > Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> > to defer KASAN initialization until shadow memory is properly set up.
> >
> > Some architectures (like PowerPC with radix MMU) need to set up their
> > shadow memory mappings before KASAN can be safely enabled, while others
> > (like s390, x86, arm) can enable KASAN much earlier or even from the
> > beginning.
> >
> > This option allows us to:
> > 1. Use static keys only where needed (avoiding overhead)
> > 2. Use compile-time constants for arch that don't need runtime checks
> > 3. Maintain optimal performance for both scenarios
> >
> > Architectures that need deferred KASAN should select this option.
> > Architectures that can enable KASAN early will get compile-time
> > optimizations instead of runtime checks.
>
> Looks nice and appears quite mature.  I'm reluctant to add it to mm.git
> during -rc6, especially given the lack of formal review and ack tags.
>
> But but but, that's what the mm-new branch is for.  I guess I'll add it
> to get some additional exposure, but whether I'll advance it into
> mm-unstable/linux-next for this cycle is unclear.
>
> What do you (and others) think?

Thanks for the positive feedback!
Adding it to mm-new for additional exposure would be great.
Given the complexity of this cross-architecture change,
I think of taking the conservative approach of:
1. mm-new branch for exposure and review collection
2. Advancing to mm-unstable/linux-next only after we get proper acks from
    KASAN maintainers/reviewers, at least.

The series has been thoroughly tested by me - compiled all affected arch an=
d
ran QEMU on arm64, x86 with KUnits.

+ Forgot to add in CC Johannes Berg, Peter Zijlstra who commented in v1.
https://lore.kernel.org/all/20250625095224.118679-1-snovitoll@gmail.com/
