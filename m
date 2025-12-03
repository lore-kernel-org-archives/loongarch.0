Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B41D2E11BC
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756318; cv=none; b=GVsJuXV5Xf3xqyoC2ENLdXzsATIilv7ApUi9Ks4pdndmt1/YUdfh6iAqpfE00VcBbjyW0FGgF89yug8gd0Xfvi/cQOFoKq2Bpg70feL+cStlWYFXP8Gi0mG/iGti5ZgUmFEsAcrGUYdjhzCGK2R7QkAOucru3ZCfkxSjh3kdftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756318; c=relaxed/simple;
	bh=SVy30YeFogn6SEYcbp39mbiI5uWcSispyULEczmLcFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBx5HfvswyQk2tsIFXJEedpKLu4ZIieUIM7S74S5ENHjG1AtLtU6eA2uziM3IanwEeCI03bcSr8uXe5xvqxowUSqQ+UiV7ug3uPz2mLkgP7IAQYKGvYtvw6uo65LRGacKFC7lY0tqL67Y5s4dxBmO1iKVqQ8QNY25aKLsvC8vJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=i06Qx/r2; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="i06Qx/r2"
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 81ED020229
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 10:05:14 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 4B2D620307;
	Wed,  3 Dec 2025 10:05:07 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 34E9240130;
	Wed,  3 Dec 2025 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1764756305; bh=SVy30YeFogn6SEYcbp39mbiI5uWcSispyULEczmLcFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i06Qx/r2BvdGWagLaLngi7UCK8cQ65XmxTGJNqCHKbDFL/nV3nfSiOOI/aZqnB/cV
	 o7tBdJR55TGpmBw5zFrt3IPlkFJIhe6fjjjkOTK8ggiw9SaXSd8r4gIyBzF+Bj2kVc
	 c3iAv8ZWA86kvfx7v+21s6ySwq90pJFhQbBrDG2s=
Received: from [192.168.0.64] (unknown [39.144.78.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 5E6DE40594;
	Wed,  3 Dec 2025 10:05:01 +0000 (UTC)
Message-ID: <d695ad6a-ea75-4922-b544-174f3a547f8a@aosc.io>
Date: Wed, 3 Dec 2025 18:04:59 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Use __pmd() helper for __swp_entry_to_pmd()
To: chenhuacai@kernel.org, kernel@xen0n.name
Cc: akpm@linux-foundation.org, david@kernel.org, willy@infradead.org,
 bjorn@rivosinc.com, agordeev@linux.ibm.com, zhangtianyang@loongson.cn,
 apopple@nvidia.com, thuth@redhat.com, linmag7@gmail.com,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 WangYuli <wangyl5933@chinaunicom.cn>
References: <20251203092849.130284-1-wangyuli@aosc.io>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20251203092849.130284-1-wangyuli@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 34E9240130
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,rivosinc.com,linux.ibm.com,loongson.cn,nvidia.com,redhat.com,gmail.com,lists.linux.dev,vger.kernel.org,chinaunicom.cn];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Huacai,

On 2025/12/3 17:46, Huacai Chen wrote:
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>> index 03fb60432fde..4e09f7e8bbec 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -299,7 +299,7 @@ static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
>>   #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
>>   #define __swp_entry_to_pte(x)  ((pte_t) { (x).val })
> Why not change __swp_entry_to_pte() together with __pte()?
>
> Huacai

I haven't investigated this closely, but it's odd that changing just 
this one spot was enough to get it to compile — there doesn't seem to be 
an error at __swp_entry_to_pte.

But you're right that changing both together looks neater.

If you think it's necessary, I'm happy to submit a patch v2.

Thanks,

--

WangYuli

