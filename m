Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C87919DF66
	for <loongarch@lists.linux.dev>; Sat, 15 Nov 2025 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197677; cv=none; b=Iff5kUpFDecY8GEVdLVg5wCnEHtSIs49v9qeFbqldaQxAjdx2zb47WFhlpTsphMuk1NTfkPRXKiobu+cOEFZJfJZ5OxOe1o+TGBuXYTiu+NcKFlVznLeXfN54SKDQ7juO/CBHAdJR7dy4DnK8Ww0nHyLPZLLrO5ZE1TkhXEQEPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197677; c=relaxed/simple;
	bh=iz3UFYendPSPOta+oby8oOHSNrjAc7U+hK6M3s9Qt5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yzj6BOBpNaGm3WRTxS2Bp9Pc5/aSjDU96q8zvPskLV2dx/4bIn3m11UGvlQAr40aRIKI7tZ+T/o+SUVxUnlHdCuPr2N5hVhSyPe7zI7ZZ5Nmv/dKJ30WErGq3c153jlRPw8RVT/A7XWMxPd2KXzYG+FNGTKqEHkdjKi585WHz5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kNysVfHs; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kNysVfHs"
Message-ID: <d58a6475-15f2-4e7c-b384-146623ce55fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763197672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuGUgkNBhxAyHgvlC2Rtd4xfIzwmCu+LetoLyFbR46Y=;
	b=kNysVfHsdj+0Qseu6HcgTet+NVlC+EYvKu/FOU10GOWi/nxL8FolfSVt4/dADuwt4v6eGO
	ihunYFsAestSz7zz/fhdf7/MlU9A15UpPrX0hNXtoFRGbUs2QnpKQ2keo3fNajZYWhiuZW
	+qGkodE+uZWV2JrmnmGzM7YxCyKUZy4=
Date: Sat, 15 Nov 2025 17:06:51 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Magnus Lindholm <linmag7@gmail.com>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
 david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
 <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Magnus,

On 11/15/25 3:13 AM, Magnus Lindholm wrote:
> Hi,
> 
> I applied your patches to a fresh pull of torvalds/linux.git repo but was unable
> to build the kernel (on Alpha) with this patch applied.
> 
> I made the following changes in order to get it to build on Alpha:

Thanks! Will fix it in the next version.

> 
> diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
> index 7e9455a18aae..6761b0c282bf 100644
> --- a/mm/pt_reclaim.c
> +++ b/mm/pt_reclaim.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   #include <linux/hugetlb.h>
> -#include <asm-generic/tlb.h>
>   #include <asm/pgalloc.h>
> +#include <asm/tlb.h>
> 
>   #include "internal.h"
> 
> 
> /Magnus

