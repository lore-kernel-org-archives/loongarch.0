Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297B2877DC
	for <loongarch@lists.linux.dev>; Thu,  1 Jan 2026 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767233240; cv=none; b=OLYZEGAVt+FXa64gfhvcQ67NxMOYSqNnS7GhJ/E3QkivY+KvVlk9cHVnzWEO1oAdzS//ThrOFxpHFEjz1WzFjx7eICdyOO0VC7jJW0hqsssoZnmnLi1DxJQpSgKv4TtudXzlpXAP2Zjbfuolen7osoP+z3VqAqsVen7DhaYX72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767233240; c=relaxed/simple;
	bh=NSSdoE7G/g/QaVmDnjP9LfDazgPNO8PlY1pApWlnZBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3krVVW2auEKWFCFM2/wzYrAt/NrMFnUosuPuVjphCyLRSSxy1sO9eOaEyO3H0e5bBvPSGsMyBotj17Br1A8vvCcH4D6OeavnY1NEdp8cZ6SCX5xQbtiXLJKHPktPKaURknyx6RfPKdxZHWQXh2GbbuQjWAlD/QTwup8kIJMiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+6SNDlL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+6SNDlL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so2284855766b.3
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 18:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767233237; x=1767838037; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQBF0g7LGMkaWXJONFj1Zzubf3JQP1KLJgb8Ha1McV4=;
        b=X+6SNDlL6v6cMHk06K4Oli+gK1GY1/95fGN2KLdhSphDkjfmceMum6u8aJW50X6yGw
         kEijrvRWjB7Sxq41meDq/MqjNgHG4OUdXd8xpM2yT2RuMyY7o4uyBjbn85hVd4L0Y4lY
         JKV6dWhbl2LPIT1CBWpTIKxu8ylHI7rvU62s0TsEtzmVzsc3pqP6avBG4iT5hgVcwg9H
         Au8mO+rQxpn4uTXk/WsHSa5vaicfTR3uc5qgm91lefK5PrEQC+FyUR6H1OtaN7GwpRkY
         vmZoQKTMjYsSiS9/mlgm6d9wQbJThWvfwlGWKL1VVUveCHIU5ktm0gM7O/3iJCjkcIOK
         9O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767233237; x=1767838037;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQBF0g7LGMkaWXJONFj1Zzubf3JQP1KLJgb8Ha1McV4=;
        b=nk6llN6IKll8j3ah2l0CSMq4/HdTE0a2j6gI0dbivk9WlHAr4wJO2dlzCgbD9WfG99
         k4AcbhpOdlE781nwUu+p2AVmqNIzPpSIJ1aks+TiQuzYvcju8ufyb5YcG8gDZwnEGMnT
         iIJupMb8ZnBO33GqO8WSBAnhz1VNezNNHkFBxoqypW/wbFcDDuOmrAVlGkwvL9Gecbem
         CfjbV0wO4zDyZLVqjX7J5hhfifhED11DIJsCPANPZMedXh7rbjJ9JYvVwMPYDG99Opfc
         KZA0Agw+f2qxICpIM70LKoeAjaMMUp2f30Sy76kdB8TTAFnrcX1fXS9Qi+4lFH0yX11I
         9Wjg==
X-Forwarded-Encrypted: i=1; AJvYcCWMUI+tyRzbKywor/r1OefEB1xhgWqxAtgG6iU1dKYtYch+k55jRHyM2ke/cg/0Iusz4O+KSKjsE9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YywuIVy3RrCMMAMjvcxFupU70fGftSv0Zj21WHWghUZxxwE5Ls2
	ekW7jSLiVsgIMn/5AWoAUa6CPhTPtbWHfi2u5gUG+4b3bPEvveufRmeu
X-Gm-Gg: AY/fxX7qd9NhJAMJhc2KZasGsB+kMqKVdZyYVOP332v6etNAPeafh20B5M0OghqGNPL
	8LNvQT0K+5Mn6HPnthwi5dhyzCSKV3kS72vrvuq85EhIYNJYcTniI2zhf6DDoiUucFav4BjZZn7
	kyJ8+br1IsU2N6jwOXMkI3/E8Ve6rgdneNbVOUUDhqY0LbbGstI6VpNor/8sXwG15YCqZdpomzd
	5YA9MZQvsOtg5YT4fQcg/RgqAxazC+owR9X1IEnt0xCnj0UrA6woCJAMrOn84/mWk9O/7HdrDov
	r3g8QcdiM07V+v+KaGSz53kzhHclQwrBY/w35FkZqf8at0jAfFr44Cwy37XcHkkGxrZbdJMy3BG
	HOIa1kCvLm3ghSe0w4H6XTZBEM64trV2OlQyBpIq3WduJiekYwE0+xjkNi9EpX0/hryXCGFl7W5
	61ZWM2rHhXWg==
X-Google-Smtp-Source: AGHT+IGkCnh9dqfLUptvpy4PZGXmScqGnHYP3DGjjwJuJ8br2u0RfwesNHaEMQG1tTnLLwW9sFl6GQ==
X-Received: by 2002:a17:907:7f05:b0:b72:9961:dc04 with SMTP id a640c23a62f3a-b8036f86950mr4237184166b.28.1767233236739;
        Wed, 31 Dec 2025 18:07:16 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b910601c7sm39251595a12.14.2025.12.31.18.07.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Dec 2025 18:07:16 -0800 (PST)
Date: Thu, 1 Jan 2026 02:07:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: Wei Yang <richard.weiyang@gmail.com>, will@kernel.org,
	aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
	dev.jain@arm.com, akpm@linux-foundation.org, david@kernel.org,
	ioworker0@gmail.com, linmag7@gmail.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
Message-ID: <20260101020715.45wqnjgcklvjcth3@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <20251231094243.zmjs7kgflm7q6k73@master>
 <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Dec 31, 2025 at 05:52:57PM +0800, Qi Zheng wrote:
>
>
>On 12/31/25 5:42 PM, Wei Yang wrote:
>> On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>> > From: Qi Zheng <zhengqi.arch@bytedance.com>
>> > 
>> > The PT_RECLAIM can work on all architectures that support
>> > MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>> > MMU_GATHER_RCU_TABLE_FREE.
>> > 
>> > BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>> > to turn it off.
>> > 
>> > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> > ---
>> > arch/x86/Kconfig | 1 -
>> > mm/Kconfig       | 9 ++-------
>> > 2 files changed, 2 insertions(+), 8 deletions(-)
>> > 
>> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> > index 80527299f859a..0d22da56a71b0 100644
>> > --- a/arch/x86/Kconfig
>> > +++ b/arch/x86/Kconfig
>> > @@ -331,7 +331,6 @@ config X86
>> > 	select FUNCTION_ALIGNMENT_4B
>> > 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>> > 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> > -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>> > 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>> > 	select SCHED_SMT			if SMP
>> > 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>> > diff --git a/mm/Kconfig b/mm/Kconfig
>> > index bd0ea5454af82..fc00b429b7129 100644
>> > --- a/mm/Kconfig
>> > +++ b/mm/Kconfig
>> > @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>> > 	  The architecture has hardware support for userspace shadow call
>> >            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>> > 
>> > -config ARCH_SUPPORTS_PT_RECLAIM
>> > -	def_bool n
>> > -
>> > config PT_RECLAIM
>> > -	bool "reclaim empty user page table pages"
>> > -	default y
>> > -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>> > -	select MMU_GATHER_RCU_TABLE_FREE
>> > +	def_bool y
>> > +	depends on MMU_GATHER_RCU_TABLE_FREE
>> > 	help
>> > 	  Try to reclaim empty user page table pages in paths other than munmap
>> > 	  and exit_mmap path.
>> 
>> Hi, Qi
>> 
>> I am new to PT_RECLAIM, when reading related code I got one question.
>> 
>> Before this patch,  we could have this config combination:
>> 
>>      CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM
>> 
>> This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
>> is semi rcu version.
>> 
>> I am curious could we use rcu version tlb_remove_table_one() for this case?
>> Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
>> there some limitation here?
>
>I think there's no problem. The rcu version can also ensure that the
>fast GUP works well.
>

Thanks for your quick response :-)

And Happy New Year

So my little suggestion is move the definition of __tlb_remove_table_one()
under CONFIG_MMU_GATHER_RCU_TABLE_FREE. Do you thinks this would be more
clear?

>> 
>> Thanks in advance for your explanation.
>> 
>> 

-- 
Wei Yang
Help you, Help me
