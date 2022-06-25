Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0BC15B3
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 08:50:09 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id p136so2145601ybg.4
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lv+FkxyjS/NQutVt+wfhAcydFycem3hgLi5V9K9eRHk=;
        b=GGomJks9se9aRiZPrnkaj+MkjtDXB1AjbcDjtd3FmKDbYRq4vLEPEOhYeF5hQEnjgh
         gA8G8WYzomc85KEh/80ZbS7xExwFawZI7RKx86EBTuGP4dfRxZGX55DPn6ddeZK01JjK
         N4FFpMLT9gYc9+D1Q5KPkgLzWIReIzC5Qbk1AKzvaozPtSn/CSX5v1gkp0dsyDh5QTEd
         BXkfqoh9+ehFJbtK9qB3lELaUT7wo38zRYzEoNWNgEsYNJHyxf40uUPa7ej4nWExmxa0
         /cZ2DXgUtW/HfuBs84ZXI3cagF2y95zgzu+rjIEJp0pCsoO4LByk6BdZ9yP6zbjYuHJd
         nqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lv+FkxyjS/NQutVt+wfhAcydFycem3hgLi5V9K9eRHk=;
        b=8AZqWZ8E9b23MtZdNfVmzZZIrK5nrBw/JmcKtGU/oe/MwIQ6ecplCV5I6afWIg2YoD
         Xz5TTmvsdFgoEmoUvwXUosSOrDF2W3Y0C+/frhtNoVdTx8NO58/F5SCA3BhJ+Y1Iz7yj
         rIq8c3dN+0nbWpKP1fs6NovKRmkbmBfoCm8QsGbCihcNecOf2Pr4PplVEHT4tKSv07sw
         sHHxnEUEJj4FOnP2XaNJxBO4VH4TutO9awkHvLG/bNmSp5TW07wZ4QMXvimhvdpooKVa
         o76uADvH7z1cp5PVeuxwhozp2vxJuZmM8tcfy2EUCo9aT81fzoQ4vhLZZI/f5y/NOmLB
         pVcQ==
X-Gm-Message-State: AJIora/u38WU3ywYs4YTCtWPhCSX6YCA3lYOgCmD2aTAtGuShc9CjEA6
	VAJGwkboKJdmxNIWC6Ahsy5UEYOhhN+XgtU5afxehQ==
X-Google-Smtp-Source: AGRyM1t8TNJw3d/FU1nQTEhu7gjwWTgPUcz4RF4GIPzinVn8gHVuDfr/lmPi+A18Q8e4Qqw7s9zc1LBos/hD2hoGkeU=
X-Received: by 2002:a25:3288:0:b0:66c:8a91:74bb with SMTP id
 y130-20020a253288000000b0066c8a9174bbmr2096560yby.89.1656147008595; Sat, 25
 Jun 2022 01:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220625080423.2797-1-chenfeiyang@loongson.cn>
In-Reply-To: <20220625080423.2797-1-chenfeiyang@loongson.cn>
From: Muchun Song <songmuchun@bytedance.com>
Date: Sat, 25 Jun 2022 16:49:32 +0800
Message-ID: <CAMZfGtWT7oPq6bD_fRn2gVNX8Lj3=ev21EAoaCCPeq-P_NYF0g@mail.gmail.com>
Subject: Re: [PATCH] page-flags.h: Fix a missing header include of static_keys.h
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	linux- stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 25, 2022 at 4:04 PM Feiyang Chen
<chris.chenfeiyang@gmail.com> wrote:
>
> The page-flags.h header relies on static keys since commit
> a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled
> with a static_key"), so make sure to include the header to avoid
> compilation errors.
>
> Fixes: a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled with a static_key")
> Cc: stable@vger.kernel.org
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>  include/linux/page-flags.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index e66f7aa3191d..147b336c7a35 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -11,6 +11,7 @@
>  #include <linux/mmdebug.h>
>  #ifndef __GENERATING_BOUNDS_H
>  #include <linux/mm_types.h>
> +#include <linux/static_key.h>

I did not include this. The change makes sense to me. But I am
curious what configs cause the compiling error. Would you mind
sharing the config with us?

Thanks.

>  #include <generated/bounds.h>
>  #endif /* !__GENERATING_BOUNDS_H */
>
> --
> 2.27.0
>
