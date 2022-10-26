Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20BF1374
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 13:44:29 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so1601739wmb.3
        for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 06:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyA2qrkg2v5gkKnTd58IzjBTBTzDkYj25MMbNU3XjYc=;
        b=PYo5iL75nUpNGpmxlciuKA348rtZZuLdjrL1B4w+c7/EPMYhKKgUhijwgww3YySE38
         fwxmJXw9uKBZbl+Ax/lNSAXWVp1S/spgRhHvw4NUox0VME97nISx2q9j0xN1GWLOvT22
         wP8HSDeUg6/09OGyeoHV0ps4aBM9iTgeurbT2K8YX1l0/uluh/lZnuyuGKbV1vZLQvbW
         cjBpPW3McN7Qsz2xZi15FN3egWorioScfwIC/+2sOytrGGkk0Fb6YQOwcvkBKXg0P6ay
         W+y1pFgdhVGWSER+WAJNCTSNeQVIXyAGqkVlJYO91eYxiT2tkYYw2C/plJ3aFgGhoj76
         m3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyA2qrkg2v5gkKnTd58IzjBTBTzDkYj25MMbNU3XjYc=;
        b=TOWIpUzpyVXuld49okDIaeW19fhZqpDdvvpfyJWHKuXfcukJDV8B6g9eC+VWXL9GkP
         fy9NNCmOn5uqhJrBZb19GzkXUeNqzUpuDrz21xb3p7Zz/lOB/xaOJGila7I2J9pp3Zgr
         AQXBjsRUU4ZaD+skJLAg0UgWrHNPy7SavG2gqk2ILVRUORf/cyDzDPIxU3/xSaoxTOL+
         PapKTN1A7KmR9ah0LFcYke6CbX1HZeKq5waJq57xJRd1AFj0VQSd6aksvrSilwq0pDWV
         plyWVKbyOai7MNcrJ8HoSk6oKLCJDrnDRAe4//CBBBAPlKj4NdVMKrofIX2D1AT24Rj/
         4FfQ==
X-Gm-Message-State: ACrzQf3oazXMA/r4AC79sU+YpksCmTngMYzgrt7RnhAwa3e5tq9DjErN
	jKpIm4X0s6AficSvlKQEWNMyDg==
X-Google-Smtp-Source: AMsMyM68ArWQVEvwrzZgCqaiRtXg0TuUH5ba+A9oWWptJ1v9Fv5Od9sxwjpzL9nWVfIweRuZps4fWA==
X-Received: by 2002:a05:600c:5252:b0:3c6:f478:96db with SMTP id fc18-20020a05600c525200b003c6f47896dbmr2595614wmb.116.1666791868141;
        Wed, 26 Oct 2022 06:44:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id l36-20020a05600c08a400b003c65c9a36dfsm1752806wmp.48.2022.10.26.06.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 06:44:27 -0700 (PDT)
Message-ID: <3eb9b612-e765-7ad0-aed8-a50e28677e9c@linaro.org>
Date: Wed, 26 Oct 2022 15:44:25 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH V13 4/4] LoongArch: Enable
 ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, loongarch@lists.linux.dev,
 linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>
References: <20221024070105.306280-1-chenhuacai@loongson.cn>
 <20221024070105.306280-5-chenhuacai@loongson.cn>
 <CAJF2gTSN3zzvgAdiM8rYc3EGFxR4JJnHSh12mvsfUOQsqRRvkg@mail.gmail.com>
 <CAAhV-H40fcUW3jwGZXpPNjbpizXb85zytCpKGHvEGwoRpG3c0Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAAhV-H40fcUW3jwGZXpPNjbpizXb85zytCpKGHvEGwoRpG3c0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/22 14:59, Huacai Chen wrote:
> On Mon, Oct 24, 2022 at 4:04 PM Guo Ren <guoren@kernel.org> wrote:
>> On Mon, Oct 24, 2022 at 3:05 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>>>
>>> From: Feiyang Chen <chenfeiyang@loongson.cn>
>>>
>>> The feature of minimizing overhead of struct page associated with each
>>> HugeTLB page is implemented on x86_64. However, the infrastructure of
>>> this feature is already there, so just select ARCH_WANT_HUGETLB_PAGE_
>>> OPTIMIZE_VMEMMAP is enough to enable this feature for LoongArch.
>>>
>>> To avoid the following build error on LoongArch we should include linux/
>>> static_key.h in page-flags.h. This is straightforward but the build
>>> error is implicitly a LoongArch-specific problem, because ARM64 and X86
>>> have already include static_key.h from their arch-specific core headers.

>>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>>> index 0b0ae5084e60..1aafdc73e399 100644
>>> --- a/include/linux/page-flags.h
>>> +++ b/include/linux/page-flags.h
>>> @@ -9,6 +9,7 @@
>>>   #include <linux/types.h>
>>>   #include <linux/bug.h>
>>>   #include <linux/mmdebug.h>
>>> +#include <linux/static_key.h>
>> Em... riscv needn't this.

Would guarding the header suffice and make riscv OK with this patch?

  #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
  #include <linux/static_key.h>
  #endif

> I found that after 36d4b36b69590fed99356a4426c940a25 (" lib/nodemask:
> inline next_node_in() and node_random()"), build errors have gone. But
> I think this is just an accident. Because that commit adds random.h
> inclusion in nodemask.h, then asm-offsets.c --> sched.h --> nodemask.h
> --> random.h --> once.h --> jump_label.h. If one day this chain is
> adjusted, then build errors come again.
> 
> On the other hand, page-flags.h is obviously using some static_key
> macros, including static_key.h is straightforward for building.
> 
> Huacai
