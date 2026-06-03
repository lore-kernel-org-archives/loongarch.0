Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B72BFC60
	for <loongarch@lists.linux.dev>; Wed,  3 Jun 2026 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469068; cv=none; b=rLolTtWlwTa+bZyWIlsAzmsvMfJHEocOgEblvm+j0LSxI8BdiIU2oPWG2eYH9FxbJuozsr2HDAc3gv6doXmLVyN+I3+Rev3YKmqumv0XFgXwJWzbYPO3P0xJYBHjXcw94NyWtz6tuLMLbjc8UtLkPWKVD9Yu69NoTqsTPYr3zv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469068; c=relaxed/simple;
	bh=F5zhvt/iAlg6umNegPP2+kFF2Mb4DKEuLqC3mOxwjAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RW3xuWfy8FOFCSX6YxW//XjcEOu3emd7WoBBf34mc4LatKdom1ty8waSjmunKe6JcPhMeuFr5mFvxz4yjA+opcQvgoAGzpyx6mn3b7OH2yZKF3KHj0KPaVLitc2YRmjMBiy0dK5hhz99/GmsrdN8/wRjis5C/B2lmR5idu7e6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNFC5mWY; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNFC5mWY"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2c0b944f6edso35182955ad.2
        for <loongarch@lists.linux.dev>; Tue, 02 Jun 2026 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469066; x=1781073866; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=JNFC5mWYdYDO8vwIDHGJpNBe6zYS3hEj6YcFgH2+yxJ81Kya47VTysin7tD6n00gBj
         slf6024x9lPRNBHtbJQtRYQQamzXT/ziwbQFyfinG9ZyQxC5kcN9nzpB/rB1mw57Izaq
         AtWObw44lC2BKBlEhBSRtl6CbNDeC95qFlkjf+0RdOsnEx+9JHV43zVGlOMg14kzkBXQ
         t+M2ZNdhfs7bruNWo/eHR8hPnLNLye0KfBShmHeQqY9AJkK/OaChA7jibSEl20dJbq1L
         Vxuns/Q7aive9KL7oh4Ypa1oqumxamTGwdPadga2XjSP5V112gRHvOgeWoRIaM8uobj3
         Td1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469066; x=1781073866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd7sOkllNO4XLGxbX/2aYhqo9JXcF7DuVUpDO/tIkqk=;
        b=AW41Oa4zcsV4ql8XNQVSjhJ/zbxi5iN+hV5Zgie7qTm4IqFlCBCarMk/LVacvz43gU
         z3h/KR5JE4vpFr7Oc3vWkSU5UESQ9CXOVImy1+e/4AUC3UpNUAnKFYOcU6cnaAaFLigK
         fobTtHNC/E83BC2f81Grk5qo1OP05pmR5VhxQ53EKb30lBNHREwX5HhUyklyaIchVIz1
         xztQp3YaJRfmZ7lBFhYnDIDiTpk3EWYphGoMPbVMp9Z+h0sk4jrQtsZ0KlPVzIHRPdxh
         y+6Rm7Ez5mt7uMqzsC8MdpKA5SfFHn/SPVFty3W8sWOrmUmAdBuK7dGdlSv4FT0pPwqS
         YoVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dIcHfDpSCOBNZo20fsQCPTFNsHZ/phNlseTZdPi/KAs+bKGZ9I61Iy52DxqJchNMFXn9Ql2AxtlE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDekBT+y9bXCn76kBig2y16SuDmqCczyeeXQAuQ1kP+weEc4Gm
	8r2qu3iRi+TGMBGTHfq+sCYCSvdD2UvfY/GtCBfuYxnYGZzxa4rOstJm
X-Gm-Gg: Acq92OFPQPZbLhii1J4iC4MWQgnpcRYcUWKYTMUx0KRbHPUFOSFwE1H3hBUVslNdDzX
	Nd1RvxSywSonQTvDZZeanIDJ5/RYSvpq55W++yw390bkn2Y35BzJORcZWpeIY8F+XeYZ3nibcPX
	I2HcWvF29TCv1x49Gjoo0ozT3rW4w74G+G0oqWg92X69ZUQ8ro+9kDtKmq/9OYUAj1dLrLoXWUN
	1krDpwy+Au9QJEro8jt2n1j0RCCrWh5FQlwTvv2XLt0WZzGEFxFbn2b4WMdWPqd/nXpZ7ykaGJi
	nvKVaRfqdkQoZ7q8nj7lXO7+8eSXF6XISfA5ZVSfB74a1xg456iyuJtFcfClh1SCM8Wvmpvd5Sf
	FvUqrvi2PWzw8TUkGehGo72V71Uo1goNl+7VCxUhQiKwMyAdeIcO6/BfZXWikOH1OMrIUhBbms6
	ldFybpCePARw6QrVARA3iSIvLhCtgAzo1X14CTIlbIkA==
X-Received: by 2002:a17:903:298c:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1644dbfbamr22648805ad.37.1780469065484;
        Tue, 02 Jun 2026 23:44:25 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm13674395ad.59.2026.06.02.23.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 23:44:24 -0700 (PDT)
Message-ID: <79932afc-2e91-4a54-aff9-f550be784c36@gmail.com>
Date: Wed, 3 Jun 2026 14:44:13 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com,
 quic_obabatun@quicinc.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-4-chenwandun1@gmail.com>
 <20260602162450.GA442759-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260602162450.GA442759-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/3/26 00:24, Rob Herring wrote:
> On Wed, May 27, 2026 at 11:29:09AM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> The global pointer 'reserved_mem' continues to reference the
>> reserved_mem_array which lives in __initdata if
>> alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
>> exported for post-init use, that would dereference freed memory
>> and trigger a use-after-free.
>>
>> So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
>> fails.
>>
>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
> Fixes should come first in a series.
Understood, will do in future submissions.
>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 313cbc57aa45..6d479381ff1f 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -69,29 +69,31 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>>    * the initial static array is copied over to this new array and
>>    * the new array is used from this point on.
>>    */
>> -static void __init alloc_reserved_mem_array(void)
>> +static bool __init alloc_reserved_mem_array(void)
>>   {
>>   	struct reserved_mem *new_array;
>>   	size_t alloc_size, copy_size, memset_size;
>>   
>> +	if (!total_reserved_mem_cnt)
>> +		return true;
>> +
>>   	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
>>   	if (alloc_size == SIZE_MAX) {
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
>> -		return;
>> +		goto fail;
>>   	}
>>   
>>   	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
>>   	if (!new_array) {
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
>> -		return;
>> +		goto fail;
>>   	}
>>   
>>   	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
>>   	if (copy_size == SIZE_MAX) {
>>   		memblock_free(new_array, alloc_size);
>> -		total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>>   		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
> These prints could be moved to 'fail'. Perhaps instead of just printing
> an error value, you can return the error value instead of boolean.
Will do, consolidating pr_err() under 'fail' and changing the return type
to int.
>
> If you respin just this patch, I can pick it up for 7.2.
Before I respin, I'd like to flag a dependency:
patch 05/07 in this series build on the signature change introduced by this
patch ("the void -> bool return type change of alloc_reserved_mem_array()")

Could you let me know which of the following you'd prefer:
a) Take patch 03 alone via your tree as you suggested, after it lands, I'll
    respin the remaining patches of this series.

b) Keep patch 03 in the v4 respin of the full series, reordered to the front
    per your earlier comment.

Best regards,
Wandun
>
> Rob

