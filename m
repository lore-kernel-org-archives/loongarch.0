Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978FD1F4E27
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741068698; cv=none; b=PHEDXaoZESQTPEUOuI6iREAoxhXMzVgD7EzslxJKT8ny/7cxN4jENYhfCO8dAU91mBzryXYub3YKF4J04xdkfqjwBxJOynhMnG1gBuSITfgKH4tNjGoExmAq5mnyN67ZoTNkcq5AFwbcAQHOsR2KDwO59kBjkN2VUJt537HnN8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741068698; c=relaxed/simple;
	bh=xVZb2uxImUx0ECcSqYKHOxrGyYGp1I4gtxr8DYt1oOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kEeKuCPrpUvu+n7YIhiYfHRuL0ioNLKR7dM4ZPIb4lZmbox/MfNFAVs9T5f/9STJCkCSQVsKxZoRarBvAmALZI6fLt9N9d7nMDh8kh5IHSXNBo/hRcEGBEDYPWn8mWzPIP/q6eeXapNMoXSdk4GQfRe9lV1BszVGOn/YIsE+SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Cx34aHaX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Cx34aHaX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2234daaf269so73904545ad.3
        for <loongarch@lists.linux.dev>; Mon, 03 Mar 2025 22:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741068696; x=1741673496; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FvNFViwfp2APOt2jux8SKthZ9o17Z2NZrToAsK4eao=;
        b=Cx34aHaXLn1Z4HMppxQKe1LiISN1pJZfMIIZX538HBH05FRkdMtn+7hf0LRkT8CT7m
         asAacPPrC2X2NN2F1yNbvr1zrKeTukzvnV3qP7Q3xcDDl9Gl2T5B+v6Sx2lGsOhTEmXc
         XtXbu/SyXtHNlSv9PlDXSX8I2SCj2LNRFLochVOL/mynDYGJg6dZGZdksJe6Jhu5i4SW
         KB8YtYrF+U4nfm8e9P2XvYwCV21rhFaONH6UyujqYKq64M4ewLvoXkdJv3FcjUHuPCG+
         fnSnnD2u4WfJHoQX2hPEwoMGLdJBa/Tn3QcRFfv3kCioIv1O7Kq/slvJjMo7dYRJEjr4
         smjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068696; x=1741673496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4FvNFViwfp2APOt2jux8SKthZ9o17Z2NZrToAsK4eao=;
        b=GbRQaywfeTQGSrZF7QRftKnQc1KFjf8rNXfw5OgW+MccgzsKOgcaUKRX5veDMi4Z/T
         gEOPQv++BDvHhceQFTKuL29D2zKwt5/4Ob+4p4JCrlpBNlgix2KePbLSAtHQfZ8ZAE4L
         ztIEnwFajJzm4pdz4H0T417rk8YruT0GfyCbt67uSs1BoqwTRU8PhZTz8UCXeDEtvedU
         QLExdlA1hGwtjBa9b9N90a8YsBh8IQrSiZvyDIjCndsJX6atf+jYgxLKw11cF/nrgtPL
         sZA1mbTYvR2Ya/ZfMbl5wcJRkdHEbk1UGqNqjWkSbx793IB2rrgNMfmH4piaxc2b4UGO
         e2bg==
X-Forwarded-Encrypted: i=1; AJvYcCURTaFjWjmvoGnKG4cCZ0vVzsj2+IEbCvjB4a9oTwEcxLG5ZSg9trJrU2rKCFECdqd4mU63jkLCzgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YypV5GLgb+wUdJCh6Ibxu1/y6kuSeYqX8Zwg+NXkGnod5TJomaU
	m1UEha/3ChAhCk3KEaOvPbX8lvbfJAzAAvwMc/yK4lVgyiCXbabS3Bs8Vf3Bjz8=
X-Gm-Gg: ASbGncuHA+SOqfzn4N90V1aLLMcU5qLIRXdTpMcsyHcBerL86Pyz/Mhr5bTc6DSL9fe
	H4NswC4hlwPI2k5XnntN6c/hvUr6kYV/4OVY6VXqLreG8tuHJLejFzN8/iSQr1iQ1A4AZaKcbb5
	Mjhg60mqrXKYzkdA1yF857hCgdimMy1fB8EJjwjtiWj1Py309+k3xtKqZ+1oKofgHWtuW15m0Ic
	Vl+9Onp+Lkajctc1xYTbDcvEhkviutXnq3a8JHW/NKyPCTVZoVbfjrlXSIV+wpGrzLU4aTt+iHD
	ngxmm8GfVB8gCCT7Z+V9JSfFhkrdeQy6uIrNwsVLgDVNoRgOpRCNurKie1GvP6YRGyXy
X-Google-Smtp-Source: AGHT+IEXDQyCMQ8sBrL+0HeKoJpZdetEfwPwd6LYj+c4cbVY5/CTPcBDN/0v1nn1xNdV90cajxorag==
X-Received: by 2002:a05:6a20:db0a:b0:1f3:40d3:67d4 with SMTP id adf61e73a8af0-1f340d369d8mr504424637.30.1741068695820;
        Mon, 03 Mar 2025 22:11:35 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf23b6sm9305805a12.15.2025.03.03.22.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:11:35 -0800 (PST)
Message-ID: <7d1c834d-bc65-4979-9b72-0d1d91019501@bytedance.com>
Date: Tue, 4 Mar 2025 14:11:24 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6 update] mm: pgtable: convert some architectures to
 use tlb_remove_ptdesc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
 <20250303072603.45423-1-zhengqi.arch@bytedance.com>
 <20250303155331.de9b2fff9b04984a255a7bc2@linux-foundation.org>
 <c48715aa-8c1f-41bf-92a0-bacf401c2f7c@bytedance.com>
 <20250303200815.53007fb79e5049a99f24c999@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250303200815.53007fb79e5049a99f24c999@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/25 12:08 PM, Andrew Morton wrote:
> On Tue, 4 Mar 2025 10:31:07 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>>
>>
>> On 3/4/25 7:53 AM, Andrew Morton wrote:
>>> On Mon,  3 Mar 2025 15:26:03 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>
>>>> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
>>>> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
>>>> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
>>>> tlb_remove_page()). This is the same as the implementation of
>>>> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
>>>> convert these architectures to use tlb_remove_ptdesc().
>>>>
>>>
>>> checkpatch warns.
>>>
>>> Do these things have to be macros?  Switching to static inline fixes
>>> the unused-arg warning in a nice fashion.
>>
>> This can be switched to static inline. In addition, I found that alpha,
>> arc, microblaze, parisc, sparc32 and xtensa also have the unused-arg
>> issue. Do I need to add a new patch to fix all of them, or just fix the
>> newly added 11 warnings?
> 
> I guess leave things as they are now.  Switching all these to C
> functions can be addressed at a later time?

Okay, let's leave it for later.



