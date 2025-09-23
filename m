Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66DF2820A0
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758649758; cv=none; b=VwGjug4ZayucfueeIWesHkVwel1US7QuA+RYccz+LOcjLKNyR83oVHEVL5uGEOW+r1Yo9mkojJXfCJc9KYYpVvYtQ73KFWjR1+JaguCSALIE/rwUv6VlT+2eG6AJ22wSq8HISDT4WETC5zNcTmZZvN3/vdAb7DNr1O44rwR/BZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758649758; c=relaxed/simple;
	bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDi86AokqAqeQ1+Nk1kc/WngHYx13U64SOQCTY/BuVE1NLrsTBdupmTpFtCWr9db7YFyhI+vIrAyYftAv09AsgQ+U7bTb4ZAtBQdN2kufNwxxQI3h1yajP28d6ImZGLXTKNU3G0r4DVAQbvt9+ZCvPXOMEZ6r9JNs0UtovQOspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg6tpOBG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg6tpOBG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so5524000f8f.0
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 10:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649755; x=1759254555; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=Wg6tpOBGcdl+Fog8FjbyXl/9av255Jy3PryKz0ByONZJDrBecYvP493y5EYUSlgszi
         MzR8FOoMAdJFIUmq2K8hQSyy72d0tnL4B/yOvi9bg3Q9NnnGUhhCjFlrWYZ+xEwK1Pqo
         cPgEVJQ9fGXSPm+uMvxbEMkMq/RQ1jYS8HuFD1cI2oDPVUWDdtpFOUl1t2DqPh+1mCgt
         Qcxx1+SqiHggxoOIlLuv7FrHJ+7yCoV5cmlVRkM8l8TEE/Fox+lzlS/FzxX5k4jKGmYG
         GaDCYIKWRDLwEkDAmw9k1KhkCNf+F5756O5DmCZyWXA1kxEQKi5PTX8Irn7hwrAotaI7
         NBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649755; x=1759254555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=QeapYIdksiwag+gnWptHfw2krYSa6y3UIn4+seY768MFiWhjC7Co+cLGUPtUWv+TQ5
         1rQT2i4yu9wH8XGhVizMmm2+5UhoY1Swze5yKz++hNrjyzH/Q9bcF3HfYWFsR137E1KD
         VdP8JDHEJZyJvElhIe/uCuCF7+bhyetbqxFp8oiOXGPU4dGqVlY3s4FRTdUY75+LQtIl
         gQTVRYRQ3LMjFf5vmJMwRVlVM3v3k6uOF49Hq0XMyqMOnVRvGMc59UhJwoe0wF/AkvhA
         X/btgA1lEcRor91dqJftVawQcxHy1kP1vfptCsZpEDw6a9Snc+DD9nflo70Yll1Ri9rI
         umbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmOuk4spqY98bYlxrCthYZW3RwV+6QSuIF0TWvBN1dLtj0KosCFdV1ChiFfcFiNb3eK8cPpHIA8h4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwInRRALCpsHtbazkfSnPKM4ZONOrZ3IfJOoHqJOrnkoGp+fY0s
	KIg6uAJ6Hia88hEQmBe8VJ3eehBALh7b4ckfkglH0KqpwEXVSvGEoYNiRfAFDIqhM2hUGvPQVbO
	AN5D5HnVZmX1/EQjQ48U+g1isnbKyuUw=
X-Gm-Gg: ASbGncvHeiyztZcDZhATPPXy/QA1BD4st/L8cMcUHib60EHEye64GzX04FbYzTtKtWf
	1usyaP/lqgCMftoVwwsAebt989t2SNsMcqcXNMBeHUm7JBpgZxvkAc0hfwNrO9j1/7FtpdCT+Bm
	AOsttAjoB/wnaG6pOnCedzxKM+YG0sSDZy0/ICA8lMV9zqTn7TRd7KLLGByd5h7ncYHGevKPXdR
	aI1KkmihQ==
X-Google-Smtp-Source: AGHT+IFSBc+NBD1jZsd0LSs+Pw95eV8L2vwpY4rCb+CqA5TPaGXD6Axn8yxp6z29u7E5i0MPRJJiZRdC/VoVJA9DlfM=
X-Received: by 2002:a05:6000:2585:b0:3ea:c7ea:13da with SMTP id
 ffacd0b85a97d-405c4a9734bmr2645479f8f.9.1758649754815; Tue, 23 Sep 2025
 10:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com> <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
In-Reply-To: <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 23 Sep 2025 19:49:03 +0200
X-Gm-Features: AS18NWAo7UnIsKkvCh16EnxIlUsef04XXrIh6VHPmyIq2HZ6eh0cMjqVLlDuPQw
Message-ID: <CA+fCnZce3AR+pUesbDkKMtMJ+iR8eDrcjFTbVpAcwjBoZ=gJnQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, 
	dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 6:30=E2=80=AFAM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> > Why is the check removed here and in some other places below? This
> > need to be explained in the commit message.
>
> kasan_arch_is_ready which was unified with kasan_enabled, was removed
> here because
> __kasan_slab_pre_free is called from include/linux/kasan.h [1] where
> there's already kasan_enabled() check.
>
> [1] https://elixir.bootlin.com/linux/v6.16.7/source/include/linux/kasan.h=
#L198
>
> Please let me know if v7 is required with the change in the git commit
> message only.

No need, but next time please add such info into the commit message.

> > What I meant with these __wrappers was that we should add them for the
> > KASAN hooks that are called from non-KASAN code (i.e. for the hooks
> > defined in include/linux/kasan.h). And then move all the
> > kasan_enabled() checks from mm/kasan/* to where the wrappers are
> > defined in include/linux/kasan.h (see kasan_unpoison_range() as an
> > example).
> >
> > kasan_save_free_info is a KASAN internal function that should need
> > such a wrapper.
> >
> > For now, to make these patches simpler, you can keep kasan_enabled()
> > checks in mm/kasan/*, where they are now. Later we can move them to
> > include/linux/kasan.h with a separate patch.
>
> Yes, I'd like to revisit this in the next separate patch series.

Great!

But for now, please send a fix-up patch that removes the
__kasan_save_free_info() wrapper (or a v8? But I see that your series
is now in mm-stable, so I guess a separate fix-up patch is preferred).

I don't think you need a kasan_enabled() check in
kasan_save_free_info() at all. Both the higher level paths
(kasan_slab_free and kasan_mempool_poison_object) already contain this
check.

Thanks!
