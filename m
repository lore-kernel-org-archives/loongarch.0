Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E733D6CA
	for <loongarch@lists.linux.dev>; Mon, 22 Jun 2026 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782147181; cv=pass; b=POwGLgCWtfgZRd/ZLEkpal+E2qh/7PV8Fe2mspnztsp9pInVDeKta408E2MscWe0q+rHWggydivPnSDaYZQgVkZIt3S6YPk1apA3Km7/eoHIgMHSjwqp1x6aOkprMSU7RUscAQeK+WClG1C33Dxf5v+7EP01ySatBImeIsyQkx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782147181; c=relaxed/simple;
	bh=uwN0mMvsWLSwuujQUXoTLWIsZIov1sZyFaZmbLSwSdE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOIgCO9vqt749Q9xGnI9b3mrim3rV0eOHJUr8mCN8+AdJLCqTXs5mizTq1Fyn10mdBlTTzxiaRByPfsA78C60vDJoAWl8wTInVmFz/TARW7ORdlnbi2mcmRy84WszhdADJ/U+yjIOMcg6aIYZb4sh2J7B9ReBOYpUtcg+aLAoDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeW8BJXK; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeW8BJXK"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-662d456f949so359065d50.3
        for <loongarch@lists.linux.dev>; Mon, 22 Jun 2026 09:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782147179; cv=none;
        d=google.com; s=arc-20240605;
        b=avSE7eoVRyEtckcRe+ssa7NBUUiAa8U1Hpab6YY4/LycwU1yvxT98sVP6GV6Vc9jr0
         A/u0vOG9ljpfUC8BywmYURz2T+bsv6yl6CADmQoXof29SPxsaW7GgBUHzAHgkBCjErZx
         P+EAt1bkydsAFfg8didKC2LuzGldu28JyywBnLBRKvwJGLmswylqYo/Sh3SHndrwYKMg
         k9V6qCZ/8To6kfvWse6mNeWLEsquJLZGpFWiVwtHQZ5bQJwz5RaurP6XJh9EYOZtK3Jz
         2jtevG284A880S07NfbivqSO9cxHXcGklqaI+iwe5hSpNWkLwl0aR+vO2X7xrAwY46VB
         JXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=EqVj4y7U9bij1RsdvBIbNWc0CJQnmS24fZgfnSLvNag=;
        fh=Ctyi1vyalCYhURrn+MTz+8NqTOfLTszEaUGkCnljvoA=;
        b=ehE/C7WcHsFfK1w9ti0XTtYn587/L93ulpQ32ZhvcCBPSf4XRtvWype0ImWwDWDt5p
         le3z4JF5F0jggXwgxcMO3THzOy/6AyBj9lrE2qo7dK9Owgig8Xl8NzMrw8tswg3Y8bI7
         Bk89QeDRr/DBE/lt/e6mlMzED8xdz0prz+X+BM1s5F7b5voYA+MmlyNCLl+5wOibyQcu
         f9LPnKLC84RXmBWe3Yr6IRNtUtP/zJqdPTmLVUfk0JBrLn7yOHxH8PSEj6A0Oc1u8pbC
         uOxWjSA80AYY5D1bahm7SxPT8JKeNSPvdJT/SGxdFaGb5BphC72Zia/1OnSKYcSFy34e
         mD2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782147179; x=1782751979; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqVj4y7U9bij1RsdvBIbNWc0CJQnmS24fZgfnSLvNag=;
        b=jeW8BJXKnzWQpzD1pwlo7cj8MomcFbJ/UPEJobw/cFmONdftDH8E/DZL9a7yyg4ZBR
         P9Pj3t4YMWqiLLM6J1LOgi5TARIaBC7SEWRIQrk7u19OOJwtqnXC9Tmz5ysI2rWcIBU3
         J0TirqCfErRYatFifRdSvc640hu/95yGhIUf40Yg96Kylr+YRC3HHSiz3etDif8URSS0
         uPOyR22qvkEpvQE8b4lot8ZNVCdVf9x++/+6eCwHDVQLOxUOg3FeUoQzohFUWLg0qEiV
         EKVbrm6JkHZu8wSvIngmcPnVQWxTIU/EVpvSZz/Z1EnKagEoeG4exF7civtZzeKULpMN
         Y26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782147179; x=1782751979;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqVj4y7U9bij1RsdvBIbNWc0CJQnmS24fZgfnSLvNag=;
        b=p2e1vHajabkZCsM+4VHYOR3T11yAoe6Jde6zw6Bx0cBgFZyMNYDLdefO0zjQuEzJd6
         SrLdazsWpm3Okv3JvU7IuQNskZbzRIJ1RtUzRb+a9H4K3X+K1pQNHMuHUv2CGn6II1pf
         r+0cqrpBDS2pIv1Lj5PWGLvHsnqIGXBaR5iAFQ/9geIHYIDatHjz2QDu47vQ74Wg97Hu
         MTie1eWWYd+O7LzxA/qjv4/UiEfec3A6yeWLsdI4KZfbyIncXQlcV65pB+ZY0dymqEiO
         WIsIQprW5VzrLdMnZwd9VbydzgUUQm4/RgBItf44TI3vmDZ9QtzRqagoP/CFCGobXm8D
         PNTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd64bAKepClxi1SxBQtH0rjON1nYt7Fwnw7BeJI43FoqlYfudgFd0SuPZ/yZMoaMPO45FPqxDr9YU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb2NZPX72mNA+xIqcDQiegcU9R+k5PImrVEzIY9iWkVd6sc6fg
	YoEb9ExX18QXff6hgCVWGQyaf+i67KNUzAkg7HGCcgmWhmBr05O1+hilWn398fEh6mLc7WqVUDn
	Hb0aMawx/BI89LF/8QvpiLtOeTQVZM8M=
X-Gm-Gg: AfdE7cn0AWLKcUYzMTYfZ82ECGiP+9EXtxV+Pv//KDan7n77nFDDvgoXC35oCZK2/1H
	PMW3xhZLd2/SEBjzH5qlIa25tgw+/LDIfuovOaLr6i8NV5TFFqqwD4W3ctyZuYSJk57lbonk/4E
	4TGoZKESC6cDyGmwyzaThAo5Xwf250Y7NqDttBdCIUol2MrD1UNNzDxUafiWU8REonLmLbkFGkP
	xHZ/vtcXdZNX1v/la6aJ5JBTqBF7K9UlT+IhhaER0iopwAAvA83KXRWl6xnaLYy9kznX+o=
X-Received: by 2002:a05:690e:4144:b0:64e:c1fb:c2de with SMTP id
 956f58d0204a3-66350b9d89cmr1094687d50.6.1782147179468; Mon, 22 Jun 2026
 09:52:59 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 22 Jun 2026 16:52:58 +0000
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 22 Jun 2026 16:52:58 +0000
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20260621145919.1453-3-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com> <20260621145919.1453-3-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 16:52:58 +0000
X-Gm-Features: AVVi8CfwHLdshiR8acjH6LOxHazjhgf1c7hU7c9vCtOUDzgm8cWNUmrgKxEagCQ
Message-ID: <CAPAsAGz3hqtqVwtSquau+qgXWJzjrg8qaRFhcqaHk1En01Jh9g@mail.gmail.com>
Subject: Re: [PATCH 2/6] LoongArch: remove unreachable invalid range check in kasan_init()
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, loongarch@lists.linux.dev, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Sang-Heon Jeon <ekffu200098@gmail.com> writes:

> kasan_init() populates the linear mapping shadow with for_each_mem_range()
> and breaks the loop when start >= end. for_each_mem_range() never returns
> an invalid range, so start < end always.
>
> Therefore the start >= end check is unreachable, so remove it.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  arch/loongarch/mm/kasan_init.c | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
