Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762FA2F34
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 09:12:52 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-31c86fe1dddso54752777b3.1
        for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rNfgCc3yCLXG4f0YNRR9AvD14vQhINiZLzedPaTIf9I=;
        b=fMFzd1R/h9ptIi0eWVtG1yiS04l8AtBOczWU5B26FI7Qgq6vBDPrC4OI02valMNslC
         OgLA9cO2/IuX3Vkj5znR//+UIZGu1SpUc94RMkkhGhvuBHxU0f2SKEFX1T7WIeHrz36X
         +np+TMYdRK20KpMUTgIm3QgqDzBgQChl33XuO2WMRAcXng8wVPlQiHlw54KDDgORtkm/
         C8Ge7tVo5eCwvxtdC1xEhGnBsvCKK4Eq1/LwpC9UyzH+kOaLljdyk9oem68H3Wg90fE6
         mfydkzdE8Goc8xU3IyBDA+pR8u4IrctiQR5hYc3FiEA02nxjihuPVr4EbDy8EWK/Q1HA
         Ck6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNfgCc3yCLXG4f0YNRR9AvD14vQhINiZLzedPaTIf9I=;
        b=1m2MirgaT6djVJW6GSJ5RTWCNO7sXtYLMFVlknI92qkLSild8asmUk2qAXM/0XPVc/
         BkJxW/CfoYhk+eYj8mkVhrYIfWOwASQvQHqmGeHr2C1fGPj8WPT8Gf+XwLEuXDUwJL6h
         y2SVxEytxb1GVQOg7wflQP2NjoyOwgwnMUu+kDAdRFZe0yDrCbzBdxBdZLLihSxzH7nP
         zteHqQGxQVNjWmu6ikTgtHcCyvCBCd86XNVWVOF3FhniE7DmWDzF4DXauWjkY6+/2ARX
         +JfQQcNuUnL1/HLoJZMTNAlmKLrxyye1cIossDxnZgcFdGrH9LmnDET89SxO0v0H2v5z
         mVmw==
X-Gm-Message-State: AJIora+bwUr+vCYqHBKZpynKuVVlMWYLgrxySsK+nBo2okkxTssGbBdP
	rnHROYu5Vk3y0NokLjlXinvszDbXff0wI41+Hs0qCQ==
X-Google-Smtp-Source: AGRyM1sbcjhr993M5UN/hKcISXvGQJQZShycW9sF9JvX21iMvRl9030G7E9hqK+I1HH1arRudDZfaWm2jSKWk8efvnE=
X-Received: by 2002:a81:5dd5:0:b0:31b:a0f1:254e with SMTP id
 r204-20020a815dd5000000b0031ba0f1254emr41155573ywb.141.1657012371427; Tue, 05
 Jul 2022 02:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220704112526.2492342-1-chenhuacai@loongson.cn>
 <20220704112526.2492342-5-chenhuacai@loongson.cn> <CAK8P3a2XBGtJMB=Z-W56MLREAr3sAYKqDHo3yg=4hJ4T6x+QdQ@mail.gmail.com>
 <CAAhV-H5djQOzRsW-JaRPzaAnh64WgHiGvHxc1UdAUV43tirukg@mail.gmail.com>
 <CAMZfGtXLxPO3jmkKpF7n9Scb=542yrf1taWHZGdPwK-tZsJXgQ@mail.gmail.com>
 <CAK8P3a14VTkTjRNTWsGmwLDuVm=QPL17_VZ8QkcCYnyQzBjXHA@mail.gmail.com>
 <CAMZfGtU0n_-Bq95X+_rZjcyeK3QhKSq2t5HRvx5Kw5+tR9h+oA@mail.gmail.com> <CAK8P3a1K9fmLK=dh8shHX2y=fOYzr02D9Ek9uQri-u_2MsBXdQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1K9fmLK=dh8shHX2y=fOYzr02D9Ek9uQri-u_2MsBXdQ@mail.gmail.com>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 5 Jul 2022 17:12:14 +0800
Message-ID: <CAMZfGtVQnxEr1gqfMgU1YzFsPXA08aOnR-mu-8cKnuS=LUyLKg@mail.gmail.com>
Subject: Re: [PATCH V4 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 5, 2022 at 4:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jul 5, 2022 at 10:38 AM Muchun Song <songmuchun@bytedance.com> wrote:
> > On Tue, Jul 5, 2022 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Jul 5, 2022 at 9:51 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > How about including the static key header in the scope of
> > CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP?
>
> That helps a little, but it means we still pay for it on x86 and
> arm64, which are the
> most common architectures.

Alright. Make sense.

>
>        Arnd
