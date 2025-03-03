Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCC31E1C09
	for <loongarch@lists.linux.dev>; Mon,  3 Mar 2025 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986140; cv=none; b=GK1N72E61iqhi1ym1cRmPJ/yKY1Jysp7TsdB7LVvpPCWiLDtToTgYciTmjoX/qCarWArk50xB0BGR/3Rw6/W4JyD0ePANY4GlzQ2op8CBQOIG64O/ukaX0XyK8S/nrHrN2mI7CmaUKYuIl/88mdWX7DZ5X2ZNv8h/L+itYowxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986140; c=relaxed/simple;
	bh=cyZ+Grt5WsWeJ35wJ4Miw4zucqCOoTXmPw42CecotaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRHG4qa/A2btEukAcWzbjJwg8W8Kuoy+iOpGKDgvIPrQPOvexp0JvX6PQ9NOi4wb+XpZdVNwFT7YEmXa8FprlkpYnsJ/280Fjl9f9KWQyMG0e75rigIsBwLOMuSYfr3NAxpVVbowAHhb2fI5CXJiYNwj8zH8qxq5j+TmQJBu93k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZJX3ASb3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZJX3ASb3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2239c066347so17245765ad.2
        for <loongarch@lists.linux.dev>; Sun, 02 Mar 2025 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986137; x=1741590937; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=ZJX3ASb3iBtHwQyuJ8sTcZTG+FCSewedOKjgZkYlunt9hkJ24saPuR7S9dCgoFj1nO
         fTANbtPUQkeaNtFw2VJwH6dDOJpohxb7xy2LvFxIiG3KVh7X1/WbTkqwSx0wRzAxyhYz
         HdVYjqzgTuJdxpzrkyxAhXxo1UteVC644pv3DhpVi3BrWFXcdL12iDi0mOe49v+mj18I
         Z92kDumYRChzfASDkD15LFFlAklC4gBJHZDEGrnbGQDqmYfFBsNASLRucK/dVfHXAQFQ
         wXJWGD0Vvuq/pc3eUo4x9GnZo7QVXCsT/3lfOv8ys/Jt76jF/wBjAQIqGWhNlCKcj6Za
         2QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986137; x=1741590937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=oZAxRO66UIfv4ALX4mSkJo0BdXTzF4YFDy8MHMBK8+McsqpGBN5dEIBcSbn5P6XqJp
         /nzxT3uzHJEq+kOgpG1+oFWZoGhZnWN3XLPqD1SmbOCtb5ZGOyZRypOOA5+x1amZdIts
         QlxNoZyiI7dYl2t1udlPdgme16LhDwZO7u9kbzzZOkwoaYOMj43EU6B2jHFDiVj5D0ZE
         ppwGjWoWw2W/qdgKW2OVZ8soQZ9fZyLTm50YD1p8hr/hIwEVb7s0TlkIhWoOtUZ3KNDd
         5YGOyqCT66Bfm2TwAtYWoFr1T7is1WNaUKmuwgdpHkaJ4Wzt3BAKRCUFEwZz23Dw/Prz
         BcAg==
X-Forwarded-Encrypted: i=1; AJvYcCVFKNTvsftj2ykB274wKA7JNrIsf2BRPJvvISZKOBfN25zNUf0vTP2JgIMUWMw5rkeaVmWJcZe1MEc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFjXyTNy6Gi5cp9oDJc4Uaul0Q0MLIs56tDjjGKkdpV7nX0I3J
	rY8kvvfMG+TJYFejgweYgZ56UfLPflsTui102d2c+IIC07AhWCn8WP3xR6xuzEQ=
X-Gm-Gg: ASbGncuvKuPiV4nuIu4O0iN+yfDDsIIf3mIncng7maRKMvyg5o+KwjxPRSZD8s4qizs
	Mea0vQ7BZlvU7Dug31Trok6ATivykCQprM9gpzVv0wTlesw9my3gcjsv+IGgruYNsC/NjT7A4YM
	jL+tzvXUDKRCZiRLB3GHRBOgvE5/mE2/CMTpM/hAWAZDQh+xrcZIn1W9sHSRnb1N4VTVXTfgpN7
	op/kGKodukynguKvUP5vdi95fWogzjEj7ZQgCu7ryc04AWxRsBvNZjedv8OdD9cHhAQ/VcER84x
	j3WWp3BKcbVSFk5wBIrsR8tCY0IyEy9/tw4MsGi/SA7x75jASCrPJtafmLULAb+NMnhhsQ==
X-Google-Smtp-Source: AGHT+IFFzAQLESy+9XTrR371K4l9s8+Ug8zXVzf/oXiEIXCRNjxwSBTp4Oh3Iq6eaMxuwqzsZm0CFA==
X-Received: by 2002:a17:902:f64a:b0:223:5645:8e1a with SMTP id d9443c01a7336-2236926727dmr181629675ad.51.1740986137075;
        Sun, 02 Mar 2025 23:15:37 -0800 (PST)
Received: from [10.68.122.90] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050ce10sm71093955ad.200.2025.03.02.23.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 23:15:36 -0800 (PST)
Message-ID: <4eb93ca8-7526-4709-b43e-2ed9e5583e3b@bytedance.com>
Date: Mon, 3 Mar 2025 15:15:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] riscv: pgtable: unconditionally use
 tlb_remove_ptdesc()
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
 <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/3/25 9:45 AM, yunhui cui wrote:
> Hi Qi,
> 

[...]

>>
>>
> 
> This set of patches mainly refactors the remove page table function
> interfaces. The comment "riscv_ipi_for_rfence" has been removed, as it
> was no longer needed, and this patch handles that.
> 
> Additionally, whether riscv_use_sbi_for_rfence is true or false, page
> tables can now be released using RCU. This patch changes the previous
> synchronous release logic (for !riscv_use_sbi_for_rfence) to an
> RCU-based release.
> 
> So, Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> Based on qemu-system-riscv64, I tested this patch. The log is as follows:
> ./gup_test
> TAP version 13
> 1..1
> # GUP_FAST_BENCHMARK: Time: get:663365 put:117 us
> # ok 1 ioctl status 0
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Nice.

> 
> So, Tested-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thank you very much for your review and testing!

> 
> Thanks,
> Yunhui

