Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7C2874FB
	for <loongarch@lists.linux.dev>; Sun,  1 Feb 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769983305; cv=pass; b=G8V5mNkgKKJzV46HejnXS6w0IgwihTHSrjMrbm8rCeL1Qgog0KNsmo//g05z7LH7Swca7nwU8NI0yXXXCbeYOxjNC39n26KgfbSzTewONtDmE5yI5AxHpjp1g14cnKnMtW30nvs8LXl1lszae/FNvG8qX9JhEnjAtcUfmtbiptw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769983305; c=relaxed/simple;
	bh=wl7Jk6JsU5yKG4duQoEsXxxYC+OIwiJhzlKIg8HfxyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsMc6oZA8MqTkv/AdA8BOEGynhKoLzgs5jNt1dE//ORQajjBo2Jzd9QzZmn5hxBYWuQFy3ubTB8+XFyqQeUaxiWhK8FQJdjhzJs64Vv//3NFKUxW+9fhzo1UqDHwD4oMtOlCiocntf2wgMqoZoMt2x91EPrLD8HCBC+WyPL9vqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UovnTcjD; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UovnTcjD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso5447563a12.3
        for <loongarch@lists.linux.dev>; Sun, 01 Feb 2026 14:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769983302; cv=none;
        d=google.com; s=arc-20240605;
        b=WeugozvCp33BPgxak7OGuL1jxWKuNCe1dqi9lMRsQALWsfobOyNk3fpJ31dU0H3qJF
         f2FUF2OYJ7EOHtw/kO9aoemdYSXlz3ceFBTAu5OGejIwHwRcK3i2ri++z7Ct6gQ32lov
         4XUIL4Zq6clZvIJB1amo1zBgxC5+WjHrDvLmXrJmCvc2Xr0i4AywOhVra2KV4yJu5+FP
         E78Ia2bd3wMGZtX8WrXXDvrYdAFxi0ZA7b+w+z7BX43Qfi4g3FsRNQoZk31w6mscebG4
         nskCjgcCS16Z9G9eoKVl/73oG5C7wr9wdOta1JfQWZFgvK20lUAVnIXgDhEIcqU+XCT1
         9mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        fh=NxK54mGc3diDsI6OHR82f8F/VOdY46b2SnE7+UIerN4=;
        b=Hn4WAOJEbtqP6bYE7Xvbia0F+SJzALVn54qxkXveuHN6RE+PFMffcTDxSd/ZOKfi7Q
         c8ciarL0wKkrDcRIgT+ZVNLG0/y+1q2GYKIElxKbTs1nlGI75DFrX/n3imXBHofsILEZ
         iDpwMsyCkW4hsoN0moBCgU/WmPPLfQQVch+5XnQflaJajhUA5vQ0VnF9GKqFkbbg+SND
         F1hCQq1Uci5Tuf8aTk+iksXXsX1vpfRN+rAj/XIkjXXwkHfv7lsfbnZ8IF5UovFQiElW
         CTEJ/eXovQsnpXG1Q2nVSybxh1fcqryhdEAC2vpeZO3JvfMnk0dLCWfS3q8vjaOuK4IM
         Gizw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769983302; x=1770588102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=UovnTcjDRGMASKPjzPtZxnI3kDxFs8f0r+i9NXBAEF/I+ZR5Get7yjj0NJFngQcxLf
         k+a48WCXCiQ8rSs124euJOE3sTawy1qjBD/Ige0DUFIi3drzW9fb0gapMA7U+oiEli6S
         CtA0+mG12whR929gFG2XvnfZIXWeNAlAGR5WBmWQCezF0zyoFQ4bcRA6/HEy7YgSwzf2
         xMhx63yRhPi7vRfGhpQa+wzNYoh7/WmVAEprJziwVXuChT8+kH4teOJcKf+nDp94wM8V
         d1rr/zmebKtZIlCxHFf+XSN8RJyTRhCThEtdzlnSy9GimN4yuGUmQE0TF56BIyHnUkek
         gnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769983302; x=1770588102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxxXeMZ2Mj2NhEcakAGevZjWJ8Zk/OwUaMBA61xjWow=;
        b=FF54uvTLxhadWZUtyRbybrIvpvz+TIS3Q981GPztI+XA7ORBbZc353h+WoC7c9N5ds
         7k46m8cGBLebQnPA7sIawVi77nutemsdKew/eFtg5N5Gc+zWy8OENAw+wce13LDpF4EO
         +GClVzmj3IiifHdbnny2tysK2YSF7TJxgGkdko8cCYd6dED9mYwSkVEKLLpAEKnYYtLx
         04SSB8ylOCL70MoYFTXy+CmD6ZK2E7qBLOCqT4Ml9yUut6OYFh6wrf42CAkQJ/klrcIn
         td7E7IlK0pGYv9c6mnLGL9J37UlPL3Z8cLeOASQ6V1utn4fRDgL2vZlz96TRoPG+F0W+
         D0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV0iaAsZkKWLfb5tG09TQWCi7pbgorw16FRCtndj6sA3cXoO9JRiMtYsQ5GQkAE8tIIjG08OCXsqAI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMlFCdA5J+et4N2W3KZux0UrMNcG26WIGPgmzQx2VLj75xF7P+
	j9LF2/Svlc7j4kXk5DpPRznK3RoVD6yxMALG2/zwopsGbFmV+iVyMby9XFp3W3z4C3LCPMSOJvq
	22gwQ8G0ylVfZSwhR6r8bhaOa/3bpE6k=
X-Gm-Gg: AZuq6aJW9e3ZAmxkXIpDyD8F8DFjAELO/vKJVdAbt7J3gyQwP3lavxcBVF/nX34gNYF
	vztOJ7IomoLbOl0xXESyhGCu9MUFL6Yeu/tKw2EQM+8D2mnXlibKotmHJqfx7ipNIdc1JGSyv2v
	HgN7MN9fnLi52Hm6kJTdQnsRK23E7rytXgYw8Z70ggToV2tOQRJs3H91X5C8S+RHO7faQNcatzv
	IeA5+vkjkOROKpBD0vXQ1ypl2J3kM98piXxkj6mjSo0U6M47HsGBcUqojuOHmqIYgdjZy+/ACaZ
	P2+Ia2uf3UI+d04le+/hgEO3hqbx
X-Received: by 2002:a05:6402:90b:b0:64c:9e19:9858 with SMTP id
 4fb4d7f45d1cf-658de58d61fmr5598076a12.22.1769983301701; Sun, 01 Feb 2026
 14:01:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769515122.git.zhengqi.arch@bytedance.com> <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
In-Reply-To: <3380f40a89b73c488202c85f9a8abf99fb08543b.1769515122.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 1 Feb 2026 23:01:30 +0100
X-Gm-Features: AZwV_Qj9VNkT5OuGD6ka3IvGbnZ780_iMCZkDjCZeudKZ-RrGhxplhYBmunMjcY
Message-ID: <CA+=Fv5RhxvyxKr2t+pHd1tbGrK57P-+b3pGe1nVaK_OLiFt2wg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: david@kernel.org, andreas@gaisler.com, richard.weiyang@gmail.com, 
	will@kernel.org, peterz@infradead.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-um@lists.infradead.org, 
	sparclinux@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 1:16=E2=80=AFPM Qi Zheng <qi.zheng@linux.dev> wrote=
:
>
> From: Qi Zheng <zhengqi.arch@bytedance.com>
>
> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
> empty PTE page table pages (such as 100GB+). To resolve this problem,
> first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
> PT_RECLAIM feature, which resolves this problem.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig           | 1 +
>  arch/alpha/include/asm/tlb.h | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 80367f2cf821c..6c7dbf0adad62 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -38,6 +38,7 @@ config ALPHA
>         select OLD_SIGSUSPEND
>         select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
>         select MMU_GATHER_NO_RANGE
> +       select MMU_GATHER_RCU_TABLE_FREE
>         select SPARSEMEM_EXTREME if SPARSEMEM
>         select ZONE_DMA
>         help
> diff --git a/arch/alpha/include/asm/tlb.h b/arch/alpha/include/asm/tlb.h
> index 4f79e331af5ea..ad586b898fd6b 100644
> --- a/arch/alpha/include/asm/tlb.h
> +++ b/arch/alpha/include/asm/tlb.h
> @@ -4,7 +4,7 @@
>
>  #include <asm-generic/tlb.h>
>
> -#define __pte_free_tlb(tlb, pte, address)              pte_free((tlb)->m=
m, pte)
> -#define __pmd_free_tlb(tlb, pmd, address)              pmd_free((tlb)->m=
m, pmd)
> -
> +#define __pte_free_tlb(tlb, pte, address)      tlb_remove_ptdesc((tlb), =
page_ptdesc(pte))
> +#define __pmd_free_tlb(tlb, pmd, address)      tlb_remove_ptdesc((tlb), =
virt_to_ptdesc(pmd))
> +
>  #endif
> --
> 2.20.1
>

Looks good from an Alpha perspective.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
