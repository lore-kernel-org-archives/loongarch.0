Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBEA35
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 06:56:08 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id a11so21835346ljb.5
        for <loongarch@lists.linux.dev>; Wed, 29 Jun 2022 23:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9T64cR/FufP6/CunzmPu+rS6tL4/EEVZVw0GWwm9EzE=;
        b=nl5CzODxaap3kUpQ3c2ewioKttk0evPfzAmsXqdVyJfDD8Xz+h/P9z06jbmly4yY7L
         /SM81HeOvWYYR0bESzaNPrOyZkAsFvQIjXs194O9V8hUZkGD02pFl87F8XvIsCO+LlWv
         mkecnJBaPs4XiX7XR3NVe5iGdkM+0fGDXQ50hC0hcvxwOJf4ZKwmlrSa6jYlba9pQc9w
         T7fp9kDH3QmsLOkOhsJPm3WXqFH2iFPXVYbxfLCZViV5EDzIyz6oMIMFmzVd/t9KU61S
         UkykkTPPYWyMxXlgV5ldCyrJkG2Wg5OMuNDb+cllPJ+UdoQLg8xNwuYJts5K7Oi0xqEb
         rw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9T64cR/FufP6/CunzmPu+rS6tL4/EEVZVw0GWwm9EzE=;
        b=1KIAm0lveSyqRPA+1HiA1MZhrFjBMc7m7UXCaxs7ImrQFYyiFBT/xi/tHjSiukh0dw
         c2Vdp7mFoFlLiesC0JF5yLEtu1W7890/O+GDsS2Imy5FiAduZT7vF8UdDvy7q3UVnhS6
         m1B0kPbIRg5b7f2VkBrbJMXJV9c4ZhXGNsNYrG/IbxGDUYexIzR2eJxSW7SaOUFgs/wB
         qGvaiINvBzoXsE8K46Yyg550d9pfZ2Au65FSQ9xnzNtcBYMvFyCV4+X+2YaAg5VqQWDO
         dqO8gK7q5fyPNSR3wQj0GwSEKq5k3n46710FdZ3ETTqyFi/SNAAA3etSv4LVCHov1d+a
         q1XA==
X-Gm-Message-State: AJIora8SsRkaZBrHqNxH/THtUYKjQHv6JLMtsd9d9VzH7GUVXM9xJBMN
	CCe1alqq0DGGhBeQQeepwd7GNvLcNDY04I+KqA4=
X-Google-Smtp-Source: AGRyM1sBSAIZws0B107oPIkAqK3Mwmga7wYdFH+S0RC6qMSnCbwXbR12svkou4bYDjabtTAqq0wQOWxW/qt69hbMDDY=
X-Received: by 2002:a2e:4e12:0:b0:25a:9d28:7d6b with SMTP id
 c18-20020a2e4e12000000b0025a9d287d6bmr4218881ljb.482.1656572166748; Wed, 29
 Jun 2022 23:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220630043237.2059576-1-chenhuacai@loongson.cn>
 <20220630043237.2059576-5-chenhuacai@loongson.cn> <CAK8P3a1x=ZX+W0XL-=MkZebHdbvB0Ngam5LxXJUnm7USpMaFMA@mail.gmail.com>
In-Reply-To: <CAK8P3a1x=ZX+W0XL-=MkZebHdbvB0Ngam5LxXJUnm7USpMaFMA@mail.gmail.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 30 Jun 2022 14:55:54 +0800
Message-ID: <CACWXhKn9FEWMc_QkrPsXUxTP33BnzZCZuesxNRDYaAWnSxWtsA@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
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

On Thu, 30 Jun 2022 at 14:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jun 30, 2022 at 6:32 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > To avoid build error on LoongArch we should include linux/static_key.h
> > in page-flags.h.
>
> This is an expensive change in terms of compile speed, as static_key.h has
> lots of dependencies, and page-flags.h is included in a lot of places. What
> it is actually needed for?
>

Hi, Arnd,

If CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y, the page-flags.h relies
on static keys. If we don't include static_key.h, we will get the
following errors when compiling.

In file included from ./include/linux/mmzone.h:22,
from ./include/linux/gfp.h:6,
from ./include/linux/mm.h:7,
from arch/loongarch/kernel/asm-offsets.c:9:
./include/linux/page-flags.h:208:1: warning: data definition has no
type or storage class
208 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
| ^~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/page-flags.h:208:1: error: type defaults to 'int' in
declaration of 'DECLARE_STATIC_KEY_MAYBE' [-Werror=implicit-int]
./include/linux/page-flags.h:209:26: warning: parameter names (without
types) in function declaration
209 | hugetlb_optimize_vmemmap_key);
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/page-flags.h: In function 'hugetlb_optimize_vmemmap_enabled':
./include/linux/page-flags.h:213:16: error: implicit declaration of
function 'static_branch_maybe' [-Werror=implicit-function-declaration]
213 | return static_branch_maybe(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
| ^~~~~~~~~~~~~~~~~~~
./include/linux/page-flags.h:213:36: error:
'CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON' undeclared (first
use in this function); did you mean
'CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP'?
213 | return static_branch_maybe(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
./include/linux/page-flags.h:213:36: note: each undeclared identifier
is reported only once for each function it appears in
./include/linux/page-flags.h:214:37: error:
'hugetlb_optimize_vmemmap_key' undeclared (first use in this
function); did you mean 'hugetlb_optimize_vmemmap_enabled'?
214 | &hugetlb_optimize_vmemmap_key);
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| hugetlb_optimize_vmemmap_enabled

Thanks,
Feiyang

>          Arnd
>
