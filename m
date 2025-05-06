Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC326B08C
	for <loongarch@lists.linux.dev>; Tue,  6 May 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522244; cv=none; b=iDH/ZYwGpXvpzbuUlcaVfR1oTlDb/U/0SEb/848q58Ks6HXncaq6f2xQ6lfmHNWkjnMA7c+KfktazEs2QOQacB8PN49FKqaiGBDHPMK4wzRZ0Zz+7/G4oSBKCxtWXlPxf0KmZqRxMdaza8VszDqfznL8srlhJaa3/57XW2AJC0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522244; c=relaxed/simple;
	bh=CYrUYd8mpt/pd4KD6BaMlj8hw459WQl4N1Iww3g2R8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdNufIom1ZRw1FhBx19D3Wf3fU/saBAeFWIvwRmCMtKYlXJYotUf2fEiklLFdzwSmoX8U51ZyXcJHnRcB2Qdjfqa4RM0GKSjgnYT7N5K3Qr901i9z7Ig2SFdFKSfvnb1gZl1fIE0ul683Y3iJPJ3MAIqkgjc0e6D1dX/srell6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jBoj0p6R; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jBoj0p6R"
Message-ID: <a03b4963-55aa-4a75-b795-1e8f0db7ec89@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746522239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KFTuaLCT064dVhFWKhMxEVyhB0wfcxXovNDaHCOdCI=;
	b=jBoj0p6RQohY/jOz2Jnac4g2pw8xHPcE7ZeD3UI9EOi4ZhbYlOfqGKcM3g2CHK9pAHH/V4
	el66Ih158FXEHz04+wN+9a+V+khnD2Yt9XM8jJ82w28UlfPpBDWbQ45nFqmyNhUBIyykl7
	58H/8Hv2bYWGCyrJH75t1cbButhGDuo=
Date: Tue, 6 May 2025 17:03:50 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v9 5/5] MAINTAINERS: Add tpm_loongson.c to LOONGSON CRYPTO
 DRIVER entry
To: Qunqin Zhao <zhaoqunqin@loongson.cn>, lee@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, peterhuewe@gmx.de,
 jarkko@kernel.org
Cc: linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-crypto@vger.kernel.org, jgg@ziepe.ca, linux-integrity@vger.kernel.org,
 pmenzel@molgen.mpg.de, Huacai Chen <chenhuacai@loongson.cn>
References: <20250506032053.11147-1-zhaoqunqin@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250506032053.11147-1-zhaoqunqin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/6/25 11:20 AM, Qunqin Zhao 写道:
> Changes to Loongson TPM driver would be best reviewed by the Loongson
> crypto driver maintainers.
> 
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v8-v9: None
> v7: Added tag from Jarkko and Huacai
> v6: "tpm_lsse.c" -> "tpm_loongson"
> v4-v5: None
> 
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
I'm just curious. Why is this patch kept outside the tmp_loongson patch 
set?

<https://lore.kernel.org/loongarch/20250506031947.11130-1-zhaoqunqin@loongson.cn/T/#mf09225c286a8e2b92a677720afafb9e20be57a18>

Thanks,
Yanteng
