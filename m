Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72713502B0
	for <loongarch@lists.linux.dev>; Tue, 18 Nov 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466919; cv=none; b=BJhsVp/W2g7sVM13tE11VXvalUUAZLItB3TLkpiTnf0XkBZ5GYX9Hl7tgIE7pbavUHUSBjwqGhy0gKBMFpeSg5nbWNknwhx2yTNQ97w5faROI/qwm+QJM4Xi1aIyrwi7041CDbgnZsLCxndNn/fzh5zXb9gecxXbR+9RZJ+kITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466919; c=relaxed/simple;
	bh=jneRGbDx8iaCsHjcSO3LMYs6xm0P9/PiTsbxJnh68lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvR5wvbfSezxRTgTVZbTVox/IECP9xRWvNgjvOKCSdY4EiZheMw3n2qPsJ28FLAW1fwBt81rwQsVaOebli6fJwCwn2lM6FrWq8BZOTwuf4CHYj115S0y2BAETiHgNc1aPSuXHe3BkkRnxX7BN217VCxVeyYbncFt/OBHTq6EFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9+r87sc; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9+r87sc"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2955623e6faso49926865ad.1
        for <loongarch@lists.linux.dev>; Tue, 18 Nov 2025 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763466917; x=1764071717; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=M9+r87scyIlCIWz/AKSROxzFPPnnTfCs4QJw4gVoKxegJC3pSYqpnV8mNXBbzk31FY
         xwjoSK4s9Fnf65RHBk4YcTU0n33iHQyaMxO632ksHvDH4bta+PleODaj2GSXZzD8bmEb
         uSwoCNHYIDY+YBYTwOfNSZZNxOUQa9+Sfe21F4OL2bBfdeFV/p3isH4te/aq5FieCTlC
         LcjBzxg2fix2lIhvbb59bFMricZVNxyaI8cF7/SQ6ApOjwROcjtRPa29shdxjfDK2RE5
         i/P+geYDkPSogQfnKxxvTgCmNTsNlWjakRFd0P7sc2RWBdTQGYHFqloXvnmUXiKMGpvS
         sNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466917; x=1764071717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=G6UrZ3674uCwguk9dB2q/f30nBbjWIPn0NItHK8izvqeGFpjb7x4nvM+qiWVdMfwHY
         iKjA1V+Xi1X+qYRhDiVbTetWC+ud9rF6Xxhw7aCnWi972HxvGGRqfZgcy1sWMC+RH7Lv
         TGsGmbmfwQ1ca0MIUyKl0zDxYDKDYe2Kfbx4dT2Chg1Ut8SZYThwGbrpMkj2q6Eoxrpt
         SB139OmEpuTKP/L3iC+pMoQgW5yU1Rj/ydRUoFU5ihOT6doUem5tQW6J9y1dYhgL2YXx
         P3187MazUU2cDYOxRNoGGi5jPR+mcaUOu6XbdfvTIniq0xbf3i88hkFeyCdF4bmKoLHR
         Rwfw==
X-Forwarded-Encrypted: i=1; AJvYcCWkKNBj74gEGAxu4rCRhE6GgmYwXPC3xxHhp1IxSTXcJNRQl45UIT1HNvxI2RcQuVqsgQGfwip1ZtY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5jEATOyPBpubNaqTMag9tMgydUy5H/vZHGg0ojcDHbKU+ZGkq
	piU4yYGljvfu/QyesG8PgAORBLNlgRwvFy9eQnzDRdAbXwATpRvRQvZf
X-Gm-Gg: ASbGnctksM60dcV7T6zKgrNDtjJ1hT+aXOlTwMzPGEztynQq5O4AMAam2XADlbP/Spc
	e/o5v/UZiyf8MlPKTCH9tYXMT2uoKkxR5jlwyl5KaOd2RWM7vhwD7J7Y3ziaEgLwvutCT25xSr4
	56qvway3OrJJJ8HJ6i6qaVHm1XeMUTLl0yn3E6CL5rdvcXhXYOD+ecJl5+F14gsBrpdAoV0AhB2
	U5M0Q35RWv8pOb/bLlmGYX0ZhAwgHH3hwPf0/u2hHEP6xzzf1b8V2dV3j1RGN6+7z+QUMAGNyaG
	4mbNYIMUAQzICUe04Kn2ulJy5U5/HydgL4ud/XewtYTtdDGWIO0a6amO3cSmz0845tmBGuqU434
	aGAY45er6Xf89+TbAIzyIFE8BJO2B7KbYQzOXWnYAzzXf3Et9vMTJe9VI2TqleQDdnXtARJdi8+
	Any1g7zkf1ZZP9OG398bIyMjgQTwa/aBzTFG1h1rk8zTxbPw==
X-Google-Smtp-Source: AGHT+IGaNSdLxRla9oY02zDdWZQ+dAcjdxohCbg81uqIYBMI/Z6QJtGDDVm6vwOhGnWyaCl6P1ztwQ==
X-Received: by 2002:a17:903:1b2f:b0:295:3f35:a312 with SMTP id d9443c01a7336-2986a6cfeefmr183341175ad.20.1763466916628;
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Received: from [10.255.206.79] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d17sm172235585ad.72.2025.11.18.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Message-ID: <f7f0ca8d-bca2-4a3e-8c45-85cba1b0ff18@gmail.com>
Date: Tue, 18 Nov 2025 19:53:50 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, dev.jain@arm.com,
 akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
From: Qi Zheng <arch0.zheng@gmail.com>
In-Reply-To: <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/25 12:53 AM, David Hildenbrand (Red Hat) wrote:
> On 14.11.25 12:11, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Hi all,
>>
>> This series aims to enable PT_RECLAIM on all 64-bit architectures.
>>
>> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of 
>> empty PTE
>> page table pages (such as 100GB+). To resolve this problem, we need to 
>> enable
>> PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.
>>
> 
> Makes sense!
> 
>> Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 
>> 64-bit
>> architectures, and finally makes PT_RECLAIM depend on 
>> MMU_GATHER_RCU_TABLE_FREE
>> && 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
>> architectures.
> 
> Could we then even go ahead and stop making PT_RECLAIM user-selectable?

OK, will change to:

config PT_RECLAIM
	def_bool y
	depends on MMU_GATHER_RCU_TABLE_FREE && MMU && SMP && 64BIT

> 

