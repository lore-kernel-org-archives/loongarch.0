Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7231197A
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 21:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764280375; cv=none; b=fVJ+hTdii3+E/gW15G5RkqTWmUhvyWLKA1bMm0zXhf3XMWrqUvid9mwp6cEckHuWCav4dSx6MU2ihiSxrej8HcOSJavaaZZtFa4W0qzdNINlY/L41ktdEbgHAmYsylur/5+0G6sbstofaM0g8E2C91NAOldi885ZX3NUAvOLNDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764280375; c=relaxed/simple;
	bh=4Pj66Y3umMwlrabEjE1lX88865iL+KzgEAusgbBYyKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVXHAl1Fuuiua6BG8xGvy5Dg09YhNtHd4iMq5M+Yn6N9KvQP0m5WhEciIVUahpK9N3Vw3OygVSdMqNxnCFgnfkjYq0+MGobxL3BLSbA2buZghb2amCJNEQ1DzXSnr/g54+9/g9JQp7z9cVxfQX17/bedUqExYuMFClG+lJdWtWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEVThCfx; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEVThCfx"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8843ebf2facso15684596d6.1
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764280372; x=1764885172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=HEVThCfxLCvNYcrOOV6fVIiMhiGYqu7n2VhS+qVOlHajz3x3FYKTVMGzTfjGypbXPs
         +SZz3jb1KMev0t+D0D6XXWoL95mongv8rt8j5fkL7B7+EDVD00lB4/mEJMru7taOd/7l
         9sFrhJh5tn1r8yyZmSfu9Hrr9FtD5ZPPklQnyh7sGe35lgwUpVA28oLvZOfS7Ro1Ojc0
         gNz4y8NcVicQdl0/AJv1GPbQ+Z+xhDbi6Wn6/xSnYQ77AUXUx3S0acIklek2c6Gb0dBe
         WrSQK6OdeiqqOPExD3alanORD2164VKn+ZUOmNkf1ClBEfkN8teJeeCzKkrq7MtSN3sr
         3HDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764280372; x=1764885172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=EDV63ET01Pq9hAvWUNrrKJIjP82acsLrIIvpsKxZrkrYqJw3m7WgQx7RNK7UFaT+9M
         V4vSWKtGDMD0IQ8/9oQ5xQpWxmD4zTolI6gP0pac3qgMW4O5F6jH4uKf9cxqIubJvX8s
         fjzLwuEtF07MZ/t19JpoTvEgEL9cgffP0aNjh1GmFQCiyd6qlyJ2VHGVlK46cEStCeCY
         1Dq7Rlq91Zx/mCsti64DSE23dJ4o4XAuYjRIjB0UynLhtG1fG6bFaJY/QsXkOlm3hYQz
         /mu9LOeIBPhX5IFtxG8Mku/oXflf5uh0vNLHVNx92W+yzMvYhCkPMoJcHmRBBVkpp55A
         ilqA==
X-Forwarded-Encrypted: i=1; AJvYcCXKjmiiNMFIj7zQzVacbf+muXZWqSmUZejZ7qfWBJN2Cv/6E5YyQ5eqsEAPuQj2aWJ1hRQAteEcnQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRdAYkf09e4TSNTYSk+Kvt2e3ss8Mzr6yF1/GShdOOjcMH/LhO
	yU7DVLmOtca/IStmdmOSG4PAdPcSqiNv89sBrYN/IwYMtcKeVpG1jU7a7nL267J23oUVMz8MyhK
	6oSse/yRsrkekxVK7/RMQnk8bkWlrQDc=
X-Gm-Gg: ASbGncu2+NdU2op/sw8WX5kFzyaWDeJXNDmzPpJVlL6UowXF+jIFX1REixagRek18N5
	MSnjgb/0sqYkXWwPPsv1Mp/XAW0iJ+cP/Yjgsd0tpqiGoxrwj9Y3pwgmt4duSaCLDNY2WiJdU/1
	lHWHSeVQUcaTLdzJegW8yaAmfzxu/SbQ25IxfBWN7Liv7BcAqqmNftecDQj7zSQ4vMFOWe5MW1Z
	byE/I4vHcyI+9T/837AwcPqL9pB2DtbjkNIwe2lCys7EXj980TG2X+UkYOm3ju/08TenA==
X-Google-Smtp-Source: AGHT+IGi53ssJfVFEVeCKpbOH4PM/Uba/gyP2VL/mpIj2xLrn6No0jDJl3wOawm61ht0VMTz1HcUV32B95MPtil1ISg=
X-Received: by 2002:a05:6214:19c9:b0:880:49bd:e217 with SMTP id
 6a1803df08f44-8847c486a0bmr364162506d6.10.1764280372486; Thu, 27 Nov 2025
 13:52:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 05:52:40 +0800
X-Gm-Features: AWmQ_blYpw-GPSWAvHSSwIXD1PKL1aIx4iCUo78DT2gXpdF1CZ018OhwLE5_XJY
Message-ID: <CAGsJ_4wvaieWtTrK+koM3SFu9rDExkVHX5eUwYiEotVqP-ndEQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 4:29=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > [dropping individuals, leaving only mailing lists.  please don't send
> > this kind of thing to so many people in future]

Apologies, I missed this one.

The output comes from ./scripts/get_maintainer.pl. If you think the group i=
s
too large, I guess we should at least include Suren, Lorenzo, David, and
a few others in the discussion?

[...]

>
> >
> > This use case also manages to get utterly hung-up trying to do reclaim
> > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > your problem (everybody ends up blocked on mmap_lock) but it has a
> > rather different root cause.

If I understand the use case correctly, I believe retrying with the per-VMA
lock would also be very helpful. Previously, we always retried using
mmap_lock, which can be difficult to acquire under heavy contention, leadin=
g
to long latency while the pages might be reclaimed. With the per-VMA lock, =
it
is much easier to hold and proceed with the work.

Thanks
Barry
