Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D66996F
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710230268; cv=none; b=accToRI3f4QfP6AUX6z/0hMYjijCHFv8EbbzB6h3taJhUPN1Ifhx1zgEc+n8VNVum0L17FNUnsbolmqWccexyoIOgikjNpdPJ1pE+6D9K8BUMWiL7sKKkEJX8CY9ipG6XmSqRQuYlSb9ci47iljqBjkWV+cFLJlMd4BZOSFijeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710230268; c=relaxed/simple;
	bh=Yc2Zosn8hrBilQetoqRmQZabxhLsQ0b25ROIRXAX4/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJ57y+bWl/ArJBuKgpOZYps8evkEXMlALaRS2X+ke3E68bFOiorV5OtqWoLv+ItYi19rZKDoALAa3sjEslMPL/kFvBusHYVnjpMyd503ofDHKLltwUOFPC7S2/Q5mLJ3j6zPYX+oMy9GK5OqWahe8GkgCpbOXcMz7z/tLNqjzYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8onIA12; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8onIA12"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4d367dadd14so983522e0c.0
        for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 00:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710230266; x=1710835066; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhEXY66RC+qpPscdSLuIpwtHRZwlPy11Ok4VW2LU5lA=;
        b=S8onIA12mw/1YHDZT9Ejhm+XqckP24pLx/zgyKij0Pfz9nmOeG7h1TLyflweIeb/cm
         7zTI1CzPL0e7JTVjLVocW3mMTsuCKqN7AYJcii5JkD9YxW4TRF7rBCS1ap/udcoTwCzN
         WHenvfEtN4u4w6RIHJXhSipJCIdpgCWdfhgJjs4y/GG+y/y5M7HsCskmmYCzsnUzDr2d
         k+IMuVs9R95+Z+a9cBbeTyiSxYiNKpkgr9Gaj0v+GKpS147RGGFTglaDiqLBArc++/Lc
         Xb8W643PwGkAIpXFudPvoKdVvAO5P+OTR2aerf6/aZp92e5uxVDmfRZEIkFxzXqwmRyt
         cG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710230266; x=1710835066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhEXY66RC+qpPscdSLuIpwtHRZwlPy11Ok4VW2LU5lA=;
        b=CaYnlFcn2Mvi1bji8hzpsbIMQG0/ig9zE3Cu274gUXYueJtqBL242yvN5iQyYjuiL9
         LADHJlMPiCEqWMu98U7kRd176leRDPRuf1W4nu1oxvL4j9Seo3zxBhJCnqctBZWjBQ0A
         42Iu4eWqziBo3JlNKTwL82RqBP9OBTu57P+Y1BwfKVz63aQYy3WHFteQM0jiDihd9Bdj
         VMud87tzbgjPNn8/GgyWkyoVVT75hTrLO1Uemw5/w/aEfsBC923micph/fkB6SnzsYLC
         tLwWS7e93oroHXuNAzCM0YJMC+Gb6ZFezD3zWBsRxd2uhLNBSj1pMclZJzgoX1ygp12U
         Fgiw==
X-Forwarded-Encrypted: i=1; AJvYcCUWTD7OVP4tV8vS1FKBBbZHvkB+g6tiRk8s92/JQfVQLP49u+IgHH8Pedr7jRnVDuafsWgqiUsKoSE7yVWcJgKs45RYfjr1vYf5
X-Gm-Message-State: AOJu0Yz7yYgqXTVu8E/6jaBPjg44M/Pfv9NEREVIW+qAj5xalkY0tp2q
	ZQRfajnRLXku2YvflCS6czJ4hfcETbpssTxU2OKM5QytioKDaAoGtUVPJ99XTEHJhjjTveYBFa2
	fvuAHd32Sa0uO9yNK+/1Xwf+GYLk=
X-Google-Smtp-Source: AGHT+IHhNzjV5+ACB49bOdzufQIaNot/JxcWClw8dMJWp4LtF4ooQ29vn4L65o1P0dgSsEWIy+Qf7hhJy2SbOZZg72g=
X-Received: by 2002:a05:6122:1dab:b0:4d3:3b1b:aa92 with SMTP id
 gg43-20020a0561221dab00b004d33b1baa92mr5627133vkb.11.1710230265598; Tue, 12
 Mar 2024 00:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240312073131.2278318-1-chenhuacai@loongson.cn>
In-Reply-To: <20240312073131.2278318-1-chenhuacai@loongson.cn>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 12 Mar 2024 20:57:34 +1300
Message-ID: <CAGsJ_4yDk1+axbte7FKQEwD7X2oxUCFrEc9M5YOS1BobfDFXPA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove superfluous flush_dcache_page() definition
To: Huacai Chen <chenhuacai@loongson.cn>, chris@zankel.net, 
	Max Filippov <jcmvbkbc@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 8:31=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> LoongArch doesn't have cache aliases, so flush_dcache_page() is a no-op.
> There is a generic implementation for this case in include/asm-generic/
> cacheflush.h. So remove the superfluous flush_dcache_page() definition,
> which also silences such build warnings:
>
>    In file included from crypto/scompress.c:12:
>    include/crypto/scatterwalk.h: In function 'scatterwalk_pagedone':
>    include/crypto/scatterwalk.h:76:30: warning: variable 'page' set but n=
ot used [-Wunused-but-set-variable]
>       76 |                 struct page *page;
>          |                              ^~~~
>    crypto/scompress.c: In function 'scomp_acomp_comp_decomp':
> >> crypto/scompress.c:174:38: warning: unused variable 'dst_page' [-Wunus=
ed-variable]
>      174 |                         struct page *dst_page =3D sg_page(req-=
>dst);
>          |
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403091614.NeUw5zcv-lkp@i=
ntel.com/
> Suggested-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---

Thanks, Huacai!

Acked-by: Barry Song <baohua@kernel.org>

+Chris, Max

And I find arch/xtensa/include/asm/cacheflush.h also
needs a similar fix.

>  arch/loongarch/include/asm/cacheflush.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/cacheflush.h b/arch/loongarch/inc=
lude/asm/cacheflush.h
> index 80bd74106985..f8754d08a31a 100644
> --- a/arch/loongarch/include/asm/cacheflush.h
> +++ b/arch/loongarch/include/asm/cacheflush.h
> @@ -37,8 +37,6 @@ void local_flush_icache_range(unsigned long start, unsi=
gned long end);
>  #define flush_icache_range     local_flush_icache_range
>  #define flush_icache_user_range        local_flush_icache_range
>
> -#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
> -
>  #define flush_cache_all()                              do { } while (0)
>  #define flush_cache_mm(mm)                             do { } while (0)
>  #define flush_cache_dup_mm(mm)                         do { } while (0)
> @@ -47,7 +45,6 @@ void local_flush_icache_range(unsigned long start, unsi=
gned long end);
>  #define flush_cache_vmap(start, end)                   do { } while (0)
>  #define flush_cache_vunmap(start, end)                 do { } while (0)
>  #define flush_icache_user_page(vma, page, addr, len)   do { } while (0)
> -#define flush_dcache_page(page)                                do { } wh=
ile (0)
>  #define flush_dcache_mmap_lock(mapping)                        do { } wh=
ile (0)
>  #define flush_dcache_mmap_unlock(mapping)              do { } while (0)
>
> --
> 2.43.0
>
