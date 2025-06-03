Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6962628C
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 01:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913622; cv=none; b=T2naIy91gDupiKTqTyuME4dE4Ubi2HqT0T2oFOjNnTQ3eAhv0iZkiYRgTZBa6dRAKusCQCyZcFF1ZevNUvEXjApzTBjkJk3FMr6nk5MwkCGUCXJ4/vyYUeAfHcT823rd9YoIAjXQjeKvg/vSZrP3UijgAHucWaYcvtRi+HxrvjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913622; c=relaxed/simple;
	bh=7EEmWQlKdRa4ziXaHoF1CmJLLzTDiLJq2j4wZHidBc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=L1/lIW8Igq+Vjsh6ac8JMxHz1eiUbs62Ss+OUNaVx2FE3J/ByWeuWZBZN4fGSeR31wucSUue4PgD4A4kt9gxHHoa7SbAjbptpgu42vatRCHOoEllIDcXffpVph3tPrCzVrnOeLizLasV7ecTHFQ6UE/m4QuTZd640oq9DJ7jqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YmVVIq8G; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YmVVIq8G"
Message-ID: <8bcf144a-398e-4d78-8848-624502e7a85d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748913617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpqjyGmG3rl2xo/V4820gk4Y0HzyyVRD93L8+7NXU+c=;
	b=YmVVIq8GZrHxA9C+Tzo0w1nUkaaXX6gmnuY6y2YCSbWyDFoP8o+neSxnWDz+CdoUw+6Rvo
	v3psk1LoDbSbCTZAJgUxKTthtRHXKgIadM1mw5TD54fOrJMtT/HWP27bA82gW4+40m1AUD
	p0n/ahxNpthjlkTsbWNTEkqF0tusir0=
Date: Tue, 3 Jun 2025 09:20:00 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] loongarch: kgdb: remove unnecessary init variable
To: Li Jun <lijun01@kylinos.cn>, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <20250530070902.410248-1-lijun01@kylinos.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250530070902.410248-1-lijun01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/30/25 3:09 PM, Li Jun 写道:
> the get_step_address(regs, &addr) should assign a value
> to 'error' before it is read.so the var don't need init
> to 0.
So, is it wrong to initialize it to 0 now?


Thanks,
Yanteng
> 
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>   arch/loongarch/kernel/kgdb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
> index 7be5b4c0c900..df3c7a5565e9 100644
> --- a/arch/loongarch/kernel/kgdb.c
> +++ b/arch/loongarch/kernel/kgdb.c
> @@ -379,7 +379,7 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
>   
>   static int do_single_step(struct pt_regs *regs)
>   {
> -	int error = 0;
> +	int error;
>   	unsigned long addr = 0; /* Determine where the target instruction will send us to */
>   
>   	error = get_step_address(regs, &addr);

