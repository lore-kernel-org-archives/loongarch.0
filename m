Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420879C4
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723857; cv=none; b=Ti6TDd7a9n1NpK/P965qSTaUMVp+j9IfPMusxgIhHapbdXdbxTbtF2CFzSnLwI3oRbtoW65rJ8NjJC0tuI9+vJvuCp1LgO/nmuuoeyqI7QuiQsEf1jCtTZyWS4xbO++TW8K3sBI3K3xGAi0Ku9deqk9Pv2BILjcKWaV7XgW9qj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723857; c=relaxed/simple;
	bh=6DUwB+hCjWKh6+gmJpLDb9ZpCQfqoZDHN+wZTg6VGKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPG1UPtT19vlKkkMet/tVPYYy9i9mdyuG5jxt/fgOzfuG2Sjt6859CHIqmy6kWfoS3XUU+VrUte0QiHW3bQZpfUIXYc5ORVNvYPaT9c/xCmbx2MCSxtD/+jW03SWFicuu1HmyuAGBuD67MiwKEdWutEjFiRWci/vTfST/3wVC7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JeSqxrVe; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JeSqxrVe"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so3715353a91.2
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737723855; x=1738328655; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=JeSqxrVe7sEg8MyWX+Z16Qv9MA1mHjX3/zWEVNpOwfAD1wbJESkbMed0QHiBMgQv0c
         gMjr4zMCgbLo4Cp3rThBy554dZGsfo5r5SVqItrdXZ2oRAGVin15CBCTdSfZFgutst2F
         B6O7DL6v5IX2KuPIyz2wrLpRAddYRIeLqnEowXiAgLbrqCROQyN6L+Gg4UEwLTwOyVAf
         oeHnkW4qHilp3HQK8Cw4w7fdE/KXQSrWg81jhzDdXgE/pPkFI3EtU675f35MFJkNfKfB
         mmdIiLca09IjsyDQhCB9+xHVx/kY1LyFvoIPkC8b0ZqV34rOuIwHt1mgnmIC91+vCf8N
         BgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723855; x=1738328655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=Bh0p47tsOxqZt+qE6BrpV+4q9YCZYnOwX0/t3pMUrmQ6c0up6aVrx5wK0oNTRN/MfE
         y9fV8DZgrr0VK75TrZo7zn3s1HbHdAV9855LQcRuFRH1xrAhNu96ZDwygk5wEQwRxzxl
         K2wjHaxRGeCBSYUq4rwigy1G5s60zV0FmKUUoiPuDMitwOH8NgsWOSqiBrLWOYa1cJIc
         +FrJLblouhkldyWSeFvef0XQ+jBWM2TlXipYIcCYTTun08oUuY+6+ca2ZhhnKGpntwex
         5f1qe+8mWQB9k0rOK7Pv9jmdwWsM62mhdZMVDyNpMPTA2FtOBesCpwNoqnKxp5Xa+kz+
         bxog==
X-Forwarded-Encrypted: i=1; AJvYcCXOA5MqZZuw5EvpxQwzWdnDpjaf9diX+W9D1/gu1x8iq3ik8+wXG45v9HKcFg6qdJMK9JkdDsGnHpI=@lists.linux.dev
X-Gm-Message-State: AOJu0YylZNGLM0D+5GS43lrs2rSQi5TY+nRQ4sgAKHu//ceZY8A0KHW6
	HYRTH5UM1W8YZEhS/g0mMb0BrtEZh4YkF2+0WXovqv2fug89ZRys2869rx2YypE=
X-Gm-Gg: ASbGncu2y+Yfq65Z8UHn1L93XCUw/o5lc/I2kQdvwkdZKLFok60nLqMa877zaoBdDVL
	KdHSmyuj7lGym+R/gRe7hk+wDQSAX9ec6FVx4csIxxT3ag2UhzjgqsAeIukqzPAbY81vtI09axt
	/y4dd0vJPwj7Kd4QHwivkMB9OYJOzvm1sn9rs9brigq2sRFCvViJMz/EqgRMnFn7ymvos1jit2z
	fJBqY6hMmBNdYaoCdK6UAmeqmzJo+U6xFSMdErMVrAwCW5Mhl1Q7eu7ZkabbaHrJF/9Tj9O4IoA
	0HafhoFABFKErBbEfE1dTX7fXg8/cbhcQm9FuYpKKwd1qEoTa6nxHd2LQbdxF35hS098O6iJ5AC
	8EH8+
X-Google-Smtp-Source: AGHT+IGZTgGY31e/1k/dTmcJmo/YDWxdXL7RglCap7bUypXHuwXLFHjK5+LGZw2OAN+HVTY4hEX3Xw==
X-Received: by 2002:a17:90b:2d88:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2f782c628bbmr47170073a91.2.1737723854887;
        Fri, 24 Jan 2025 05:04:14 -0800 (PST)
Received: from ?IPV6:240e:370:8b13:5250:f0b9:2326:6cb0:b423? ([240e:370:8b13:5250:f0b9:2326:6cb0:b423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a975sm1776638a91.15.2025.01.24.05.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 05:04:13 -0800 (PST)
Message-ID: <65710478-4ee0-499e-9f66-dff81e226042@bytedance.com>
Date: Fri, 24 Jan 2025 21:04:02 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: kevin.brodsky@arm.com, riel@surriel.com, vishal.moola@gmail.com,
 david@redhat.com, jannh@google.com, hughd@google.com, willy@infradead.org,
 yuzhao@google.com, muchun.song@linux.dev, akpm@linux-foundation.org,
 will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
 <20250124114759.GB15996@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250124114759.GB15996@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/24 19:47, Peter Zijlstra wrote:
> On Thu, Jan 23, 2025 at 09:26:13PM +0800, Qi Zheng wrote:
>> Hi all,
>>
>> As suggested by Peter Zijlstra below [1], this series aims to remove
>> tlb_remove_page_ptdesc().
>>
>> : Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
>> : there should not be a page-table anywhere near here *ever*.
>> :
>> : Yes, some architectures use tlb_remove_page() for page-tables too, but
>> : that is more or less an implementation detail that can be fixed.
>>
>> After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
>> to remove the page table pages. In the future, once all architectures using
>> tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
>> may be possible to use only tlb_remove_ptdesc().
> 
> Right, so I don't think Sparc and Power care to use ptdesc, they're
> using non page page-tables.
> 
> At the very least we should do something like this, the only point of
> having tlb_remove_ptdesc() is type safety, there really is no benefit
> from it in any other way.
> 
> ---
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index dec030cb1210..a6731328db6f 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -504,7 +504,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>   	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>   }
>   
> -static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
> +static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
>   {
>   	tlb_remove_table(tlb, pt);
>   }

Ah, make sense. I think this can be added to the patch #1.

Thanks!

