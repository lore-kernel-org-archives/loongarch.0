Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CCF1EB9E1
	for <loongarch@lists.linux.dev>; Thu, 30 Jan 2025 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255419; cv=none; b=ARdGMDWA8gqxejANMern8RUrvEd8LSeSQIX4SCAxqU39NPDRF8zF/WO2HthvtUpprcEchqT+5cycj5NU8LL+m1x6LoooTz7P7HeJX+lfuycsPx8EoxpH5EXHxVqWT2pO5rEtN5HaWFsel9WH2J9MjXMuO3B1TK+QC2l+ORaK2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255419; c=relaxed/simple;
	bh=hhBv3POVUd1nGdTtjZ0JNABIBnHNg87TTTD5MkbEwDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfwDvRO/jefVm+1TFC6ySMacZ/rZhIQ4K2Nf57VCnB99/Zd5OyMpXT7QQlfzhqhpTHKviKf8veufcoLEMCEeBH8YrXEgJBJFjafjYlVFfEpuGqAR7vaOHAgedTLbqcQhxWmSpp68MkryepWAp+qt72rV7MJCVTPtrrrBC/mzQRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JppItWta; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JppItWta"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd1962a75bso7563136d6.3
        for <loongarch@lists.linux.dev>; Thu, 30 Jan 2025 08:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738255417; x=1738860217; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ubib907lOWhPsp5HRG3z3MJOH5T78yaPo3zxk31gW0=;
        b=JppItWta2g0seLaqvdVCGyL+XYnWfOk4PlZH3BMUcrSnFKHK280D6HXKOVasNO1GJP
         8ry30SmU+jJ5diD+kiy595neQqk0iVBL5Ye8mFFsIhi4hBejIxJL+KXthhBm0lySPl1I
         wzWQblU8+2XEeSLuQs62mQTxz9ofg0lvfOgFLm3OcmKiZRY14l/unPxoUjdPPZiIHkGg
         R2jyw4fKHkbw/tf8hmzWTCtHdocUGsy5vUtZeJFCOIs7bj+6Ez1R/bkIDoEQivFXuf4H
         5OLF4svY9SF45w9jn60XPukwoYjepmdT+k5p5LQUTHX9GgizjoMXsS0apR6OyY5A0eoe
         e31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255417; x=1738860217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ubib907lOWhPsp5HRG3z3MJOH5T78yaPo3zxk31gW0=;
        b=AF+m6CV/h5/Khaf11N13ZttSKwHOzhas00P8y0yL+bzWbOL6T+EiyODzujyjAeH1c8
         uAipmZNQ9iURnBxJyZ/ygfjk48CXdQIR65IUCFGUUqpfNaorltJdi6fTiX8BEin+EyBB
         SAuBj22UnicKvfYD+iaHhnh4qN1CQT41UwOHCdks65jMPh6yde721N5gO+I73cZNjMC1
         F+m0rMDYuP/+wFDnPKsL/QcUNpzwkpvBDvSuzrQ17jxEQdUti1nHfIAUYoBYXpeihPBI
         7uo3PcLIzFwaRexeG8d8+D7z0swAsN3WrfI/f50Dqvp0lZsaw7xx283CsVCFjqcATvAM
         RyAw==
X-Forwarded-Encrypted: i=1; AJvYcCUZOfLAZ74mVVSeUqRtV37XGvhWEnyHuRrF18BcGCG5tWCYsEUyBjHK7dQOyinojf7nbTlSet/5TFk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAoZNmeDk/mV1hks9kNuGqVVndOO/2MeK3eGHFFJcbfNSssHzx
	YP28ZKpb8jHeMvHT6Dn6QewXlAmQ9pcxO4HtiAiGJM7ytnT8flWH/X/ruQmiTbcKqrNzkcuxY0n
	YkMOnrSD3724kAYZcKWSh3N9vOZw=
X-Gm-Gg: ASbGncvCPa83iCQX+QtmPWRGkYiL0FOikPyjeukikSLghsL6z8F/voFVU76+sRHCiGY
	05Ko8RhquEo1TLDD/26DFTEfYJEoGg5PvrQnQmpWoBrn/NGywSHFPWLZu50w3hfsNP2Y8YGCHCM
	8OKfrvJKNJrVcNd/8IcNQ1HOQs+HN8
X-Google-Smtp-Source: AGHT+IGujsprEQv3Xe96Am1wYMjLyKljLO/L5COIus+Qx4iC2crERg2iTYERWLe7OP6zybHi4ADnqt1Mhikbkr35Ywo=
X-Received: by 2002:a05:6214:62e:b0:6d8:850a:4d69 with SMTP id
 6a1803df08f44-6e243bf360cmr98636336d6.1.1738255416728; Thu, 30 Jan 2025
 08:43:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250129180633.3501650-1-yosry.ahmed@linux.dev> <20250129180633.3501650-3-yosry.ahmed@linux.dev>
In-Reply-To: <20250129180633.3501650-3-yosry.ahmed@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 30 Jan 2025 08:43:26 -0800
X-Gm-Features: AWEUYZm4BFGxHAow5GcdNZEfMlp7AvFEDULDBjH8He2bC6lpApDMAOQZJlKfIPQ
Message-ID: <CAKEwX=PK5MF2wixPngQuU74kQvzVNX8tpEwsLz0PRhKY1cYSNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: zbud: remove zbud
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Seth Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 10:06=E2=80=AFAM Yosry Ahmed <yosry.ahmed@linux.dev=
> wrote:
>
> The zbud compressed pages allocator is rarely used, most users use
> zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> pages per physical page). The only advantage of zbud is a marginal
> performance improvement that by no means justify the memory overhead.
>
> Historically, zsmalloc had significantly worse latency than zbud and
> z3fold but offered better memory savings.  This is no longer the case as
> shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> sense for zbud in any practical scenario.
>
> The only alleged advantage of zbud is not having the dependency on
> CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> zbud is only used by zswap.
>
> Remove zbud after z3fold's removal, leaving zsmalloc as the one and only
> zpool allocator. Leave the removal of the zpool API (and its associated
> config options) to a followup cleanup after no more allocators show up.
>
> Deprecating zbud for a few cycles before removing it was initially
> proposed [2], like z3fold was marked as deprecated for 2 cycles [3].
> However, Johannes rightfully pointed out that the 2 cycles is too short
> for most downstream consumers, and z3fold was deprecated first only as a
> courtesy anyway.
>
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=3D2Ww13sCj4S3i4=
bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/Z5gdnSX5Lv-nfjQL@google.com/
> [3]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google=
.com/
>
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Acked-by: Nhat Pham <nphamcs@gmail.com>
