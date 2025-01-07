Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E21F942
	for <loongarch@lists.linux.dev>; Tue,  7 Jan 2025 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736253284; cv=none; b=XLiUihQOk9RZuhyOD4F9nQ0PgJTNBKGevY2CUx++VB0GO7mk5NwDVdiXH48ssT/Cahx8AqXYado5j8BdOXj9MYZ62SGfWnutl3kWalcf5TcpKdKgeIq7L8R4hMtuHmXiqFfSvGhsevvILQ8UYUx4ymTOP8cxYaWpfyBUbtvRAzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736253284; c=relaxed/simple;
	bh=L5KICzKmsigasu6zMZMdF6uhXD7qpbyhNomRWavNigA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMft5rBJJSJESDj8UlahKrfsbhxKS6F5IzxHUNc5FEXo4kKtXGoLu2u3r55EDHB3nHZeqkMURT+IMcTxFOCYyrCSgOTXGUDw1HRBivMwrZTyIsVKhaFMweiGYLvzba+0kdi+aX4sNFzOBnMP8cBvY8boJ2U1fteZszImimjSmMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SdtEmWQs; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SdtEmWQs"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163dc5155fso222185665ad.0
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 04:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736253281; x=1736858081; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=;
        b=SdtEmWQsPlCGvQdYfqsdpk2oGwlu81amn9aDT2+UJKus2dXuPAVptBRa6R7OuLTGTg
         AwQgp/EYtcFZmwFuABFb0S4x8K76dcZF9VdrQ7kU8/Kzy7/E3nygA27+FXamrkh1W/8d
         Pnf23QkQjyT2jGAWuwixPtilwhidHPJ5MM3+A1yT/t0hq8nWQebHGa+eH7L7a4/dSfIs
         OOe8EGJSpLtOsjHUp1mxpiMCVfwSlJML+l64ogO7eJBpEGooDhbsX55v+5Lg6TgD20zh
         +ZenSVNSPw1391WG7gmb0AK9GM2C1jHW8e97aOjB7JF9CPoaXN2CQ6ZZ6xCSho81Y/5z
         8rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253281; x=1736858081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=;
        b=BKIw7mYNPmOSg5wWaotzyQGQwZ8YEvnksPgkfsOge9n8CT1BOL8Jd+9zOGltuR83+a
         DYVpsj4piCEp7sfzTjC7eRE0ZhYDORnJ0dA2OPKIwV4cF7gYB8sBl2tNOYRpbHWNMKXJ
         npa0FYcO7Y/0GDppLA0j5JWmqKleaxuVQCLaxB5IhP3WT4vidJo4asnEQuvK86QK0K3Z
         ZSDW7Cp1heHVXV+WNX4h3Gq+oCehDn32jtC6J0jRX1lp/GuUTiHt50tui+969+12LSxj
         5Anz2oLWXfzawunr3OUfSlj9gq3qxbK1XgysJ9vq5aY0tsnbYlJj2gs4ZO+Seue30ftZ
         /sng==
X-Forwarded-Encrypted: i=1; AJvYcCWjUFlrX1PsbVTS8QhHI39qBAb9cA5v6s78ezVL6VJa1FCw1stcs3WINhJkcxGRb8LraLRNOY4+Y3A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf8Pry55Zu/dPYjC4HVa0CfUm2764GpxgG5O70yfxXLJlEb6ti
	Z5+SsLaaQ24DNAoWo8cA5LJxkTmU3B3FJVY8+1jQp/z3eXhT3XMUMIFsioBpAno=
X-Gm-Gg: ASbGncuf3NZ6qBsyK2q3mCPGbGnwSUpGOLx45Pkj4JD8t4wS+SQnfRDYZVmRZu7FnAX
	qRa6iY3P607s8Gqe7gFB1ZIo67vDOAUKAkiZPw5U4zy8+/8SYq5ITpbb30LrRdC9FQL0pGyQObo
	YsvJyy90CbT2lBj7rEznKS8TMBoSLAvZQGLdaYeL4+L3bM+CaRtNfOTnnVUgP/iB10gDJI3BTjc
	ebDgVcy+ybAKhcpHze6HAtBrg7KoFYwuhSpODr5DR2CVGRuv+KbDPpGDNULG9WKMa3iOb1TGMJ2
	JfFF
X-Google-Smtp-Source: AGHT+IE3yUUkb0m+aLP2spLDFrGsHc6y1BQTdsXYC7/WM0wTJqWEm80meD2oBwGaRCvgAk0D5TXwug==
X-Received: by 2002:a17:902:e746:b0:215:8847:435c with SMTP id d9443c01a7336-219e6e8c595mr965146185ad.12.1736253280842;
        Tue, 07 Jan 2025 04:34:40 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cddsm311379695ad.48.2025.01.07.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:34:40 -0800 (PST)
Message-ID: <9040b9ee-88c9-4347-b8b6-5894b45e62b8@bytedance.com>
Date: Tue, 7 Jan 2025 20:34:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] mm: pgtable: introduce generic
 __tlb_remove_table()
Content-Language: en-US
To: Andreas Larsson <andreas@gaisler.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 palmer@dabbelt.com, tglx@linutronix.de, david@redhat.com, jannh@google.com,
 hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <f7febc7719fd84673a8eae8af71b7b4278d3e110.1735549103.git.zhengqi.arch@bytedance.com>
 <6e1aa2aa-a70d-4292-9c5e-21c8fea386f5@gaisler.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <6e1aa2aa-a70d-4292-9c5e-21c8fea386f5@gaisler.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/7 20:32, Andreas Larsson wrote:
> On 2024-12-30 10:07, Qi Zheng wrote:
>> diff --git a/arch/sparc/include/asm/tlb_32.h b/arch/sparc/include/asm/tlb_32.h
>> index 5cd28a8793e39..910254867dfbd 100644
>> --- a/arch/sparc/include/asm/tlb_32.h
>> +++ b/arch/sparc/include/asm/tlb_32.h
>> @@ -2,6 +2,7 @@
>>   #ifndef _SPARC_TLB_H
>>   #define _SPARC_TLB_H
>>   
>> +#define __HAVE_ARCH_TLB_REMOVE_TABLE
> 
> sparc32 does not select MMU_GATHER_TABLE_FREE, and therefore does not
> have (nor need) __tlb_remove_table, so this define should not be added.

Got it. Will remove it in v5.

> 
> 
>>   #include <asm-generic/tlb.h>
>>   
>>   #endif /* _SPARC_TLB_H */
>> diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
>> index 3037187482db7..1a6e694418e39 100644
>> --- a/arch/sparc/include/asm/tlb_64.h
>> +++ b/arch/sparc/include/asm/tlb_64.h
>> @@ -33,6 +33,7 @@ void flush_tlb_pending(void);
>>   #define tlb_needs_table_invalidate()	(false)
>>   #endif
>>   
>> +#define __HAVE_ARCH_TLB_REMOVE_TABLE
>>   #include <asm-generic/tlb.h>
>>   
>>   #endif /* _SPARC64_TLB_H */
> LGTM.
> 
> 
> With the removal of the define for sparc32 in v5:
> 
> Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc

Thanks!

> 
> Thanks,
> Andreas
> 
