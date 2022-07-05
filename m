Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A063E7C
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 16:03:04 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id lg18so2642110ejb.0
        for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/PzUf+FWtruBA74xPia/zJ0RuCFti96ThSU9HTzIsqY=;
        b=XluqUvEc2FFAEeUVR9EHhmnZ4fduhRT7w/m9u0J2BO7tZOwSBo7mn8BaOQgqzoSDjh
         X0pO9Rj7sIcvIuoe/ROCFriYf+jU1vOTUfqvfCtN125Ylu3zQgqKqEbKSpZrITIomEan
         BZAau+BMtL5HOpzppw5a+e3jGUrgHgPPfbGc5bsU3OpFMoGuJuoBj847iLPHKCzZpauf
         jf+2378y/+37186yQm4a00uEwBFAvMwZm17YIt+qATt8ZYGJLJ4pWsc0U3fKbmLSOXLk
         5+3oyqmZyrGCj6g5F5sm3U2otbom9tA/Hnz9GFjdlZ5PnMVgvCa13m+Igy3HH86a48ZB
         o7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/PzUf+FWtruBA74xPia/zJ0RuCFti96ThSU9HTzIsqY=;
        b=VLdEJjyG9OQYOBIfhqIbSviBNl7S0YTygE2/wF4lOFUDuRufC/Ts+EyEzDRT0OqZye
         AiAiQaAJZV7kGHWkSOz75Qt8RV7HBGWcYdOuh7xFGPYs/iShyPPR4pI1efvZjUPjDIsY
         PjkuJ13wsxn+932Ew6HHuC7T+mo9snuz6kSM3MgASZ2gmSGtLZi1chJ36b9SCBA1TNPY
         p8FSvT9TFJT9hQ7ern8Nxl5vANHPUORKGuqMGu7UajErcTDj1RvUYr7gW2knnVaCJVoD
         8AvYBVqYGe+CAn5YFpn7qAb5JyR50KodGbh8Pj32T5AwhNqUdb4ntCHNZSv5+oBqukO2
         1lDw==
X-Gm-Message-State: AJIora/fMIg8Qg9Cg9MdnL3IlLlNCTTMq8V7jL6hgU3YI2wY+b87PYua
	LV1ugRE0KzFIqGDKt8x6i1HKT0tlEMdmIFsNicY=
X-Google-Smtp-Source: AGRyM1s2bR2/fTLYxh4UjqmPZv6LUB0HejEOyCZJAkhG5FfXs1uf2EFDs1t2xo1dxtAeQiITYADdpH1zQ6Q1UVRLsF0=
X-Received: by 2002:a17:907:2d8c:b0:726:2b37:6d44 with SMTP id
 gt12-20020a1709072d8c00b007262b376d44mr34529009ejc.224.1657036982875; Tue, 05
 Jul 2022 09:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220705154708.181258-1-rppt@kernel.org> <20220705154708.181258-15-rppt@kernel.org>
In-Reply-To: <20220705154708.181258-15-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 5 Jul 2022 09:03:01 -0700
Message-ID: <CAMo8Bf+5cN4TYNGs=PXsZuunyZX2xQAdk+nGd5wARP8MuZVXuA@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] xtensa: drop definition of PGD_ORDER
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	WANG Xuerui <kernel@xen0n.name>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-csky@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-mips@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, 
	"open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 5, 2022 at 8:48 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> This is the order of the page table allocation, not the order of a PGD.
> Since its always hardwired to 0, simply drop it.

it's

>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/xtensa/include/asm/pgalloc.h | 2 +-
>  arch/xtensa/include/asm/pgtable.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/xtensa/include/asm/pgalloc.h b/arch/xtensa/include/asm/pgalloc.h
> index eeb2de3a89e5..7fc0f9126dd3 100644
> --- a/arch/xtensa/include/asm/pgalloc.h
> +++ b/arch/xtensa/include/asm/pgalloc.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
