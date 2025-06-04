Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D2C24B28
	for <loongarch@lists.linux.dev>; Wed,  4 Jun 2025 01:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749001241; cv=none; b=CoamJQqIXoEsFiVuXZj20tCtMYYL8ys3M04orhdCyyU5ABaFo/DDwAPwnRt4NCHnrs2twOBCb/2JvewqT7hGglK/bp7f9f5cPsT4c8bPJvNK9+Kqj7xWecnMeD+OQqZVaIrAfuet9kUSMht/WJu3vKXbcb4CG4Cr8VmbEIslYZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749001241; c=relaxed/simple;
	bh=CYAcVkSPUEXALZQpHaXJhcmxz8HZkIA1shn8wP3WP5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Di2HT6RxrMGHYpQqEaBNuXp3vfKqJMmtasH1vmosaV6oUDSPo0rvJjoSdlclspuQZkd/fAGvErRLpClQCHuh1i4jVF7Izf9BCm938yCxjakBrAiPFegyWo+cEiw9XfokByJsEuH/cR//uXUuZ8feN65DM9q8w+lzuecGDm9VTf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FH6C8Grf; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FH6C8Grf"
Message-ID: <d18b3955-e57d-44df-b9da-5efd7f571d1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749001235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55W/y+3Dome8tpVxJL2scrxk/VzsgS3YDtX0F+dbIls=;
	b=FH6C8Grfc5uzEjdDJ/D14vep1rNAqGhs6Tg9QRYXHtdO+/7KW6XQI8XmMdbZP6sBVnXZbc
	8qi3fjffHQXsYsw+kDHU4qCCV6fXtESSsnClpjz80u4usaII/PKrdoCoXppIoSI5QOvSad
	/+hyKcJ4V0C8IINLlcE260ST8yduWyo=
Date: Wed, 4 Jun 2025 09:40:20 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] loongarch: kgdb: remove unnecessary init variable
To: lijun <lijun01@kylinos.cn>, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <20250530070902.410248-1-lijun01@kylinos.cn>
 <8bcf144a-398e-4d78-8848-624502e7a85d@linux.dev>
 <137e7f072eebeb319188ddaead471074db7ba792.camel@kylinos.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <137e7f072eebeb319188ddaead471074db7ba792.camel@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 6/3/25 11:30 AM, lijun 写道:
> it is not a wrong, just look clean.

Alright, as you said, just for the clean. First, you deleted
one line and added another, so the number of code lines remains
unchanged, and the original line of code wasn't complicated to
begin with. Second, your patch only deletes two characters,
and I don't think this will significantly improve the code's 
readability. Finally, creating a patch for this consumes the
limited energy of reviewers and maintainers (many of whom are
working outside of regular working hours), and a lot of CI
infrastructure will consume electricity to test your patch.
It's not that I'm against your patch; I just want to know
if it's worth it?

BTW, We don't accept the top reply.


Thanks,
Yanteng
> 
> 
> 
> --------------------------
>> 在 5/30/25 3:09 PM, Li Jun 写道:
>>> the get_step_address(regs, &addr) should assign a value
>>> to 'error' before it is read.so the var don't need init
>>> to 0.
>>
>> So, is it wrong to initialize it to 0 now?
>>
>>
>> Thanks,
>> Yanteng
>>> Signed-off-by: Li Jun <
>>> lijun01@kylinos.cn
>>>
>>> ---
>>>    arch/loongarch/kernel/kgdb.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/loongarch/kernel/kgdb.c
>>> b/arch/loongarch/kernel/kgdb.c
>>> index 7be5b4c0c900..df3c7a5565e9 100644
>>> --- a/arch/loongarch/kernel/kgdb.c
>>> +++ b/arch/loongarch/kernel/kgdb.c
>>> @@ -379,7 +379,7 @@ static int get_step_address(struct pt_regs
>>> *regs, unsigned long *next_addr)
>>>    
>>>    static int do_single_step(struct pt_regs *regs)
>>>    {
>>> -	int error = 0;
>>> +	int error;
>>>    	unsigned long addr = 0; /* Determine where the target
>>> instruction will send us to */
>>>    
>>>    	error = get_step_address(regs, &addr);
> 

