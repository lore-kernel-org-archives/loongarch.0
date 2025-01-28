Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5F1C5F1D
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738087786; cv=none; b=Qqp2JtR5JwsE1nzkbFNoBDmP20bMXnADazJ2zPOaWH52lO8okmu2rDc+tml2QcbCRepDUyOrESfeuDsnLE9TgsT8T2GKIKBYWcXsas+OfyVV/jPq03zRl1xawAQ+NnF95C7//9lpDmQKtt7Fh610nlTGIPepppUnfNOm1bF1aNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738087786; c=relaxed/simple;
	bh=VDiGnLR7/2khoVx8JGjfLERVvaYj16Lytx4jUcictKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upXI4WDKi0cnTR2JfQlc0UIOg0W54G6gycHMeueTQ5aPZHVg+hHwe5sRHlg3MHqiYvJOn9liYhNckwhn86PNpzj0GklS8rvLbtFCwPSUryiKeSPpPAux7so23jovlpch45n/fDH62nfzoe1AMJErLuab5c889iLnSZDKIm+14Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAmTfK3j; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAmTfK3j"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d92e457230so57984536d6.1
        for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738087783; x=1738692583; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEwFCY/pJT4/bZXkcRLInfXta1s4/pTUOYsv/SpFEOk=;
        b=WAmTfK3j7a8oNHSVtNU9XfCnToz1dl/7PKXRI72+bDoa9drBvU6pe4z/CG3/tH4+uC
         IaTfy+PAzG9MWO57PCFJKgWe/dtN8SL708KjBMZVdkGKiWprGNne/daG0+k1D8BUCGye
         cBLgwOZlA/5etBjxeDy0ZIx/dcC/1ZtavnoKEC5iKvvELnrSXkCFqxSgyZeOTae7acQ2
         ZN7/It4WFobQKzfJ60oEM7r5q/mp4xIrP9EkcDv3CH0J9AIYvSCvJ8XsNORVNgjkT6Kd
         T6N48LS6YZC/x9UYa7F+IiSdUmQE70qwTQFsJS75SIJXvEBI+WlL8B6iI9woDaRUEj5x
         wWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738087783; x=1738692583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEwFCY/pJT4/bZXkcRLInfXta1s4/pTUOYsv/SpFEOk=;
        b=UE52wRVLmuerGseEpc1HBXcXmTgPCvNB58YFbn3ZXv/r7NJuRNdPxIqZRPOoGekiyb
         HfB1SzZLzcx4xjZOeGpF8/WPYaRg+kmrAOmLM7pH5aOy32t5FFjCFM2JGcOZEYIJ8wQs
         jg+VYr/lmvSgOFlTcdB34mJ3k2hbLja0b9W7zncb+qNrAwOCTGqZ9rLVKmmMbfgJoSiG
         GxXkBD8JjHv2uNtrU0Kf3DPO07j9oMXvfxdjLGeL+6ykiaGqqWPLwiLrMRpSENS+eHYS
         tJ1bOjLvqNHlBx8wp54hyL0XNnhdKGrBgU6MroOVeG2dAbJ8RO6FPUlK928/g3FxvxWd
         y1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjZ722Q/3XWQXFuGqZUkvE6fpQWGTWUklVBM55pXTBBmlF+CTCVOVCTaMpSn/d4nGIxEv4jvjlcfw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8uf1oN1ANSjK5YvO+jVNl8xOk520KtqtrNAlPYfY5q61f0Pe4
	tPLqDOWdgk+R7idvx7SiuQhFDqLFRjsIBdLJBM6AbJME8Xj26GW1r9KHLBUQX2bdRhYdSvFBpFq
	9wmEF5Q3P9xwQQ61Tffs8yIjd/e4=
X-Gm-Gg: ASbGncsJ0yD1N3IMp7ivxcU3vg+Y4GjX+HVHAPZllL+HU9LtIzRS3mf90DtH41bx/h6
	w1LnoeJVDJj9T2b3KsogqqlY4ynDB52kkSTHnNkX4ye36y5jmkOGJatPzIN0kMYhYrQ0GU18S8B
	ZSRRnXqE5m8LksV6ZrAN4Vul69HsaZ
X-Google-Smtp-Source: AGHT+IG7UfqpPGCJCmbndDDQ4XMO5xXhq8xrLicUYVN5lp6xx2c3RvaA80mPe3ws+o/VEYVO6Zh8T8zjcPihfeLh8T8=
X-Received: by 2002:a05:6214:2a4e:b0:6cb:d4e6:2507 with SMTP id
 6a1803df08f44-6e243bf84d9mr2433856d6.22.1738087782659; Tue, 28 Jan 2025
 10:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z5gdnSX5Lv-nfjQL@google.com>
In-Reply-To: <Z5gdnSX5Lv-nfjQL@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 28 Jan 2025 10:09:31 -0800
X-Gm-Features: AWEUYZnq0DAriMkDKIu3OIjdc4uUYsYkcWLq1_qBF1N2DfOtP7hO90g3QQlIXnA
Message-ID: <CAKEwX=NkruXeRKtdFjBvWxSgkq3ss2fOQnkk+FoKJ+BFoM7kOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 3:58=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
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
> Following in the footsteps of [2], which deprecated z3fold, deprecated
> zbud as planned and remove it in a few cycles if no objections are
> raised from active users.
>
> Rename the user-visible config options so that users with CONFIG_ZBUD=3Dy
> get a new prompt with explanation during make oldconfig. Also, remove
> CONFIG_ZBUD from defconfig.
>
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=3D2Ww13sCj4S3i4=
bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google=
.com/
>
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Acked-by: Nhat Pham <nphamcs@gmail.com>
