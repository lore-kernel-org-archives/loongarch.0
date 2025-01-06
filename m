Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125D1DE3AB
	for <loongarch@lists.linux.dev>; Mon,  6 Jan 2025 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170672; cv=none; b=fMJYCb8xsK3PzfP1JlbpA3uNpIgOA+7bau7pt3pG7fqI04GKckvGf/CgoN7yHPBufbBxgpsf9o3kx7y46b7dFuJYaq6pDAWG9ksgLGEOTbs5UDowgnhqkcZD8YNecNl7nwp+Mepo+m7Mp2YnirXgxXntFLehG/z+lZENaDavIPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170672; c=relaxed/simple;
	bh=LrtzBOpc20LA4eXs+7jXvZs6h3AKiR2Si9ZU3N7n2dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSDY0Np/sWZ0zYCIwpU/SeVEqeJiFmrnXeVfNeKzSGBTiye5EWgRYUYEvFpZkM2EGT64GVQ1/V1g7VHvFRYZBlVNG47LLaI1wGnpavffyMZyNM1AIQx5FyPQiKICg9I+VuEh3K7hRiMSWlDtIqfbykvyC8js74DlpiS6wYeW5lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=b3MLiv1F; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="b3MLiv1F"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21644aca3a0so23076085ad.3
        for <loongarch@lists.linux.dev>; Mon, 06 Jan 2025 05:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170670; x=1736775470; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=b3MLiv1FokRJCgLsrbG2nUXuIcM6HjdOUd5tiA3IvgIR+IrlDrnXCPv0k+pjVfzfwn
         pytZbCTG9rJP0f6Y7g7Jsa5LR9rshzjaWICzP14CBEl16onQRuwOlHn6DIQYyYfpebHu
         uwd9sQVpaZSRURAGynZ4clxlat2JvYRIiJAbW8+vQs2XSI0IdEuAseb35Sm7tCwVaMr6
         es9rjS5sxVfClf757e9Nh7zysLcnTOsHEihtLjEMEtEPIaASPmVYFKJOZj3m/M3sTSV8
         j5LzamyuspBm5FS5W3iQXzAgato0lFHi1NHYvWwaIeowNj0CstctKnSPexfYgSGQaGvg
         MdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170670; x=1736775470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=lwraObnvHHxAkmwIKIHmLOEiiUX76IjCI+GV2q4UI9RTeel+2jv+UgbgrGrsg97qmU
         MuwCs/Wg6B9IXjJOHdcwRYNv5oe1mFic/vpKYRcA0gDp1kSpCPXJCxyiRn9q39astEYC
         95/ZnuQiP+ZZFaApacMYweMAe60o64ZUFiZzBGhv8pYISUpKhCP5r8FEoZDI3aTvBmwC
         3ySVmHXL/IIm5tpUl/jMMp+9235Q0OjFdi0ZfowHNqj9DsnOHEYFz0tFyZ9o4NdXtNnu
         2674CJiND8C05gLhGkXDZlz1RJC3HnQyCXL3eKLaL/g+Hyd2/Rk82liCj2jz8KKFP81y
         2HHw==
X-Forwarded-Encrypted: i=1; AJvYcCXge+oYkKT6//O2HyI3fjqg2U6/ddxfsvBo/kNWev1X+LwCFWF8ENm2G5o5j1Gekn/qtoDc0RCeE7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvQGNWEuORx/XAyLZjDP4ovQDVlYLBvIt7xLvWaa4+1/UdVRbs
	Q0Itrx6S8aHiHzo1OhFVpDURbsRx3R7DswLsPKRYCSGLcAt3hLHp63HGe/ruFpw=
X-Gm-Gg: ASbGnctyBbM6gwXrjtc1AceIjoopQATTpTMyz5B0VqZ7M7WfmJYoTfk+rHMK6Mfjnmc
	wXvnt8d7KX49K63SQymZu24igwzCS09Sz/sdLNbgkViTn3OH553IFCZ/3c28DmxkXzJcNHUVDNi
	IrvAhF7tBPpKXOR25kUzwxzxtNH7G8inlQd8eHBxiqzuHw8IWX6KsUdiy+hTbv2Ck0aWZoHk9AK
	qwlgNMuLnCA+ExuXNLkHPO4bhLEwxMUsmhTwvAhlf8gOH4Kl2+Df5vzkFOdwnIPNx6jy9fVOz0/
	Rbbr9/i4S3U6U84OHJjoOWsXq0isZruo26jNlzFBnpt4F1ZmF9IA
X-Google-Smtp-Source: AGHT+IFnWXSZW4FIIFkfBRxwzvmAw3s/HsdTqMia2pBdvLu70V6jfgNFfu5B3ABCLJ+ulhyhNt7Jxw==
X-Received: by 2002:a17:902:c406:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-219e6ebb716mr865705425ad.26.1736170668665;
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm290583325ad.187.2025.01.06.05.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Message-ID: <760c9610-a11b-4bc2-852e-340adb27f666@bytedance.com>
Date: Mon, 6 Jan 2025 21:37:36 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] s390: pgtable: add statistics for PUD and P4D
 level page table
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <35be22a2b1666df729a9fc108c2da5cce266e4be.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxVkg3i7zXI92e@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
 <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 21:34, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:05:16PM +0800, Qi Zheng wrote:
>>> I understand that you want to sort p.._free_tlb() routines, but please
>>
>> Yes, I thought it was a minor change, so I just did it.
>>
>>> do not move the code around or make a separate follow-up patch.
>>
>> Well, if you have a strong opinion about this, I can send an updated
>> patch.
> 
> If you ever send v5, then please update this patch.

OK, will do.

> 
>> Thanks!
> 
> Thank you!
