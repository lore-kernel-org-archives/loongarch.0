Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36751C4610
	for <loongarch@lists.linux.dev>; Fri, 20 Dec 2024 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695178; cv=none; b=rzg6FUj9qibDP52GU/c3bcVdsPGznBT8iHlJIMDTt5YIs4U4LcOB6+MB+dv1PiNDNHrHZ1rXefhelJOtHKLjjua4kmdDVjXqOpRA8sraGU1Dur/Y6ILQ1xi9nemoieNW4XX4kKo4veZjsDxWMksA+BZROV/A1pjZDuxVxJRoZ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695178; c=relaxed/simple;
	bh=yIScTezDLLIu5IKi/+u7+E2INdxlbVe48yxybU1XCOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kT7rXxePtvQSs5K3qBagStJ25nk2nbKGm6AFp1unK5ayNqHIZFAbAyL7Cji9OhxCi1+O6rpS9e7Z15BUdEqjLunQklovOwAPwIWoSWCjR5c48FOcl+PV8Xie3V74BwdTu58TZBgmPuP4JfKpuCnAS1sg/RheJjEq6tcapJCbPYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Eyrdnya1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Eyrdnya1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166651f752so18711595ad.3
        for <loongarch@lists.linux.dev>; Fri, 20 Dec 2024 03:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734695175; x=1735299975; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=Eyrdnya1zazErfZUkfu1LXCR+M/YAcNlp2JuohdAwvuxx8xST0D5lF3eEi1zDBl5L0
         ivvTapNHPM2qtGOvtLyGzGNrNGXBhSIZk4JlHeqlVTGEKoTI0EgsLfHbGJthko/7pYm0
         9NFu1ElfZb88FDXsugAsBaxE9oNCNZinOEFk28ROQ+vScQLSH9d1m2C4pBXBbcbtPVkl
         QV4ZZdoB+6wb8Svp53ZOTOcx0f1ZUO6VRawuVlGsrxV+vlffdNHzLcCE5z/zTavildEZ
         8bO9z/1eQn5KuReCLHWiGKCcdYt35ruxBxn47GPxD540p9Y8dNh/4654z5POWKXTIZXy
         T+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734695175; x=1735299975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=rmXH6qRDZ0c8VR4gWDlvIlOOtOJC7mgaOb3LzDpoE2+rQi4zSfwlFT1DB8qfgWeSeY
         wLEQbHYFiN1MiycoR0I3B1ibeZmZLR1JaxvLnlx4flq11kLfZtk5/Pj7jLalOcZQ0RBn
         e03f4cnBUKCjWoeQSalNLhyB5c6VvpYtK8GjkTVUc0dCyaO9RrIHaAimDjxZ81ytmZGD
         Q4FXUmBu5KpCM5ogLHgH6YBzzeVXrG2KqpQi6sj7KAsppcdimj42qzbOLQBtTOs/UOfp
         HKUhMm2fmuZN3GY9r+i1nXjIf0Dii8pZZeWet84qTSodYd+1ra7qCMPKBpNVdgi2FWzT
         /AiA==
X-Forwarded-Encrypted: i=1; AJvYcCW2xZeQJ+Q1f6DLxKjIXKZkjJELPRhDnhfoU7G69DQZTYND5ImkPyRAnev67K67uFCwmC4IHOSvVx0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTlwtfj404oRy6kEH3sIhuZ/FAkOLXMMQEFuiV3NuyMgg0oSvS
	NNPpLWZnnjIdiRnkHihuFb906PB2c4uy43mlYWZfA9U2HlGFXvzsDaQuqvECv2k=
X-Gm-Gg: ASbGnctbqLgHiZ3wb00xlSjup8ZPwXxbhj+8u9L2zJ8p+pM6OfnreCPC0rfGnuG5G74
	kz/JS/0RXO+HT9uVYSFR4FM2oeOuQZHfS4D65EE9u3zofNPmP4BfK7jNYzNLWZl52o83ijjBvSq
	/ZhlXOitiuXfAS3plSHOB1+8uOi4aVh/jf6zjOJ1ip510bPKxeTWAWkiOBG/rkV1dbQFdSxmecH
	OGWnmCcE63d7EARdENZ4J4qFT37mSbcFcys0mvs8NNIWE1YHQhbQQBdGQTr3h7VMSGKiiR2kIHp
	5lSCCcs6J5vsZiw9WkFwydXealWEq2StrqKWtO74lPVRHc4iuR958bg=
X-Google-Smtp-Source: AGHT+IG40UPaAgLiyyOp9k8XqW2vPy2P2eyTWxZSuqMQTAARXLtkQgcz7lH63J8oRPI229SK+RLglg==
X-Received: by 2002:a17:902:ce92:b0:216:4169:f9d7 with SMTP id d9443c01a7336-219e6e8bc7cmr41107195ad.2.1734695174995;
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:680a:144b:d927:5a3b? ([2409:8a28:f44:3764:680a:144b:d927:5a3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9939b5sm5267286a91.1.2024.12.20.03.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Message-ID: <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
Date: Fri, 20 Dec 2024 19:46:04 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kevin,

On 2024/12/20 18:49, Kevin Brodsky wrote:
> Hi Peter, Qi,
> 
> On 19/12/2024 18:19, Peter Zijlstra wrote:
>> On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
>>> Besides the ptlock management at PTE/PMD level, all the
>>> pagetable_*_[cd]tor have the same implementation. Introduce common
>>> helpers for all levels to reduce the duplication.
>> Uff, I forgot to Cc you on the discussion here, sorry!:
>>
>>    https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com
>>
>> we now have two series doing more or less overlapping things :/
>>
>> You can in fact trivially merge the all the implementations -- the
>> apparent non-common bit (ptlock_free) is a no-op for all those other
>> levels because they'll be having ptdesc->lock == NULL.
> 
> Ah that is good to know, thanks for letting me know about that and Qi's
> series! Fortunately there isn't that much overlap between our series - I
> think we can easily sort this out.
> 
> Qi, shall we collaborate to make our series complementary? I believe my
> series covers patch 2 and 4 of your series, but it goes further by
> covering all levels and all architectures, and patches introducing
> ctor/dtor are already split as Alexander suggested on your series. So my
> suggestion would be:
> 
> * Remove patch 1 in my series - I'd just introduce
> pagetable_{p4d,pgd}_[cd]tor with the same implementation as
> pagetable_pud_[cd]tor.
> * Remove patch 2 and 4 from your series and rebase it on mine.

I quickly went through your patch series. It looks like my patch 2 and
your patch 6 are duplicated, so you want me to remove my patch 2.

But I think you may not be able to simple let arm64, riscv and x86 to
use generic p4d_{alloc_one,free}(). Because even if
CONFIG_PGTABLE_LEVELS > 4, the pgtable_l5_enabled() may not be true.

For example, in arm64:

#if CONFIG_PGTABLE_LEVELS > 4

static __always_inline bool pgtable_l5_enabled(void)
{
	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
		return vabits_actual == VA_BITS;
	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
}

Did I miss something?

My patch series is not only for cleanup, but also for fixes of
UAF issue [1], so is it possible to rebase your patch series onto
mine? I can post v3 ASAP.

[1]. 
https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Thanks!

> 
> Let me know if that makes sense, if so I'll post a v2.
> 
> Cheers,
> - Kevin
