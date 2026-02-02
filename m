Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C9208961
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770018192; cv=none; b=nDwb5Da24CRsWzW0wB3QvOrrVeZyGGyjJbNeY+mwp/fcWBoWJ75TZoC9eiV7XJS3rIipLdb5j3gn4axNaQiECdkN4O/+IgW2kmD/+xALuSF2FxBZM6IluNb4+42tsGrPjWdkjZG54zkbaegYuSo90CMFZ3Xk2g+K3hzOdy3L1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770018192; c=relaxed/simple;
	bh=G7Ms0Rdb076S1fetXyEIkIwmDu+ivrLjNBLHbP+2rsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIQWcnBwrRZ2RkQVcWYiMeQLN8fq+8ONmn4C6kbyqdNRG88xbNL+JnJy+KUN6ZwSDbr9j+Ipm71vk7KXnyJZoS5+RPFMRx88Z8dOYveDFPULDfHobfCMd/nlKU6/fVc3DigTxLiBnPJ0KwOPnJSBUeB8r5+AcyDzH2i+RG3c++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n/QYfyh2; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n/QYfyh2"
Message-ID: <bef6065d-57d6-4b88-aa7e-ece766107892@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770018188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7Ms0Rdb076S1fetXyEIkIwmDu+ivrLjNBLHbP+2rsE=;
	b=n/QYfyh2o06E59isIib+1RpgCaFdFKk5mTGmQ0ehzmTDBQcbmITS0vDCpzqXtpu8vs+IYr
	c2ZF5/KKEBML2OJYZQNWZC8H5doWuUvPNfcNmNQZ+1LFayd/LwhEv3+/6EDHjxiq/A3Ext
	CpQCXDaBVEsHx3Tn0wZdPC8EMzNq15k=
Date: Mon, 2 Feb 2026 15:43:01 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: Correct spelling from clk_scr_i to
 clk_csr_i
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260201023619.366505-1-chenhuacai@loongson.cn>
 <524246d9-bc9b-4d65-814d-d544b53bcd0b@linux.dev>
 <CAAhV-H5T=1FefitLWSf5Qw3HEwFO0ERhefq1udae6mt9tq+ikQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAAhV-H5T=1FefitLWSf5Qw3HEwFO0ERhefq1udae6mt9tq+ikQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2026/2/2 15:29, Huacai Chen 写道:
> On Mon, Feb 2, 2026 at 9:36 AM Yanteng Si <si.yanteng@linux.dev> wrote:
>>
>> 在 2026/2/1 10:36, Huacai Chen 写道:
>>> In include/linux/stmmac.h clk_csr_i is spelled as clk_scr_i by mistake,
>>> so correct it.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> fix tag?
>>
>> But this is just a comment, no need to backport it (I'm fine either way).
>>
>> If no fix tag, please update the subject to typo fix instead.
> Why? Is the subject line wrong?

You're absolutely right, and "typo" specifically refers to a typographical

error in written content—this patch is a correction to a comment, so using

"typo" is perfectly appropriate.


I might be misinterpreting the wording here – what I really want is to tell

exactly what a patch modifies from the subject alone, without having to

check the patch content. Maybe "correct comment" is a better fit. I know

I'm splitting hairs a bit, but I couldn't just stay silent after receiving your

patch, right?


Thanks,

Yanteng

>
> Huacai
>
>>
>> Thanks,
>>
>> Yanteng
>>
>>
>>
